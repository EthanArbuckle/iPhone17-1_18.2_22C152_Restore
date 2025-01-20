@interface HMDCharacteristicReadWriteLogEventManager
+ (HMDCharacteristicReadWriteLogEventManager)sharedInstance;
- (BOOL)_compareIPSignatures:(id)a3 secondSignature:(id)a4;
- (HMDCharacteristicReadWriteLogEventManager)init;
- (HMDCharacteristicReadWriteNetworkInformation)networkInformationCache;
- (NSMutableDictionary)accessoryStatisticsByHMDAccessoryUUID;
- (double)elapsedTimeInterval:(double)a3;
- (void)_setupNetworkCacheWithWifiManager:(id)a3;
- (void)_updateBluetoothStatisticsForLogEvent:(id)a3;
- (void)_updateNetworkStatisticsForLogEvent:(id)a3;
- (void)_updateWiFiStatisticsForLogEvent:(id)a3;
- (void)setNetworkInformationCache:(id)a3;
- (void)updateStatisticsForLogEvent:(id)a3;
@end

@implementation HMDCharacteristicReadWriteLogEventManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryStatisticsByHMDAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_networkInformationCache, 0);
}

- (NSMutableDictionary)accessoryStatisticsByHMDAccessoryUUID
{
  return self->_accessoryStatisticsByHMDAccessoryUUID;
}

- (void)setNetworkInformationCache:(id)a3
{
}

- (HMDCharacteristicReadWriteNetworkInformation)networkInformationCache
{
  return (HMDCharacteristicReadWriteNetworkInformation *)objc_getProperty(self, a2, 16, 1);
}

- (void)updateStatisticsForLogEvent:(id)a3
{
  id v12 = a3;
  os_unfair_lock_lock_with_options();
  v4 = [v12 accessoryUUID];
  v5 = [v12 error];
  uint64_t v6 = [v5 code];

  uint64_t v7 = [v12 linkLayerType];
  v8 = [(HMDCharacteristicReadWriteLogEventManager *)self accessoryStatisticsByHMDAccessoryUUID];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (!v9)
  {
    v9 = objc_alloc_init(HMDCharacteristicReadWriteAccessoryStatistics);
    v10 = [(HMDCharacteristicReadWriteLogEventManager *)self accessoryStatisticsByHMDAccessoryUUID];
    [v10 setObject:v9 forKeyedSubscript:v4];
  }
  [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 timeOfLastSuccessfulRequest];
  -[HMDCharacteristicReadWriteLogEventManager elapsedTimeInterval:](self, "elapsedTimeInterval:");
  objc_msgSend(v12, "setTimeIntervalSinceLastSuccessfulRequest:");
  [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 timeOfLastFailedRequest];
  -[HMDCharacteristicReadWriteLogEventManager elapsedTimeInterval:](self, "elapsedTimeInterval:");
  objc_msgSend(v12, "setTimeIntervalSinceLastFailedRequest:");
  objc_msgSend(v12, "setLastSuccessLinkLayerType:", -[HMDCharacteristicReadWriteAccessoryStatistics lastSuccessLinkLayerType](v9, "lastSuccessLinkLayerType"));
  objc_msgSend(v12, "setLastFailedLinkLayerType:", -[HMDCharacteristicReadWriteAccessoryStatistics lastFailedLinkLayerType](v9, "lastFailedLinkLayerType"));
  if (v6)
  {
    [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 timeOfFirstFailureRequest];
    if ((int)v11 < 1)
    {
      [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setConsecutiveFailureCount:1];
      HMFUptime();
      -[HMDCharacteristicReadWriteAccessoryStatistics setTimeOfFirstFailureRequest:](v9, "setTimeOfFirstFailureRequest:");
    }
    else
    {
      [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setConsecutiveFailureCount:[(HMDCharacteristicReadWriteAccessoryStatistics *)v9 consecutiveFailureCount] + 1];
    }
    HMFUptime();
    -[HMDCharacteristicReadWriteAccessoryStatistics setTimeOfLastFailedRequest:](v9, "setTimeOfLastFailedRequest:");
    [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setConsecutiveSuccessCount:0];
    [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setLastFailedLinkLayerType:v7];
  }
  else
  {
    [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setConsecutiveFailureCount:0];
    [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setTimeOfFirstFailureRequest:0.0];
    HMFUptime();
    -[HMDCharacteristicReadWriteAccessoryStatistics setTimeOfLastSuccessfulRequest:](v9, "setTimeOfLastSuccessfulRequest:");
    [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setConsecutiveSuccessCount:[(HMDCharacteristicReadWriteAccessoryStatistics *)v9 consecutiveSuccessCount] + 1];
    [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 setLastSuccessLinkLayerType:v7];
  }
  objc_msgSend(v12, "setConsecutiveFailureCount:", -[HMDCharacteristicReadWriteAccessoryStatistics consecutiveFailureCount](v9, "consecutiveFailureCount"));
  [(HMDCharacteristicReadWriteAccessoryStatistics *)v9 timeOfFirstFailureRequest];
  -[HMDCharacteristicReadWriteLogEventManager elapsedTimeInterval:](self, "elapsedTimeInterval:");
  objc_msgSend(v12, "setTimeIntervalSinceFirstFailure:");
  objc_msgSend(v12, "setConsecutiveSuccessCount:", -[HMDCharacteristicReadWriteAccessoryStatistics consecutiveSuccessCount](v9, "consecutiveSuccessCount"));

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateNetworkStatisticsForLogEvent:(id)a3
{
  id v39 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  HMFUptime();
  double v5 = v4;
  uint64_t v6 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
  [v6 timeIntervalNetworkInformationCache];
  double v8 = v5 - v7;

  if (v8 > 10.0)
  {
    v9 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    [v9 refreshNetworkInformation];
  }
  [(HMDCharacteristicReadWriteLogEventManager *)self _updateWiFiStatisticsForLogEvent:v39];
  [(HMDCharacteristicReadWriteLogEventManager *)self _updateBluetoothStatisticsForLogEvent:v39];
  v10 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
  objc_msgSend(v39, "setEthernetConnectionState:", objc_msgSend(v10, "cachedEthernetConnectionState"));

  double v11 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
  objc_msgSend(v39, "setCellularDataConnectionState:", objc_msgSend(v11, "cachedCellularDataConnectionState"));

  id v12 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
  objc_msgSend(v39, "setIsConnectedToInternet:", objc_msgSend(v12, "cachedIsConnectedToInternet"));

  v13 = [v39 accessoryUUID];
  v14 = [v39 error];
  uint64_t v15 = [v14 code];

  v16 = [(HMDCharacteristicReadWriteLogEventManager *)self accessoryStatisticsByHMDAccessoryUUID];
  v17 = [v16 objectForKeyedSubscript:v13];

  if (v17)
  {
    v18 = [v17 lastSuccessIpv4Signature];
    v19 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    v20 = [v19 cachedIpv4Signature];
    BOOL v37 = [(HMDCharacteristicReadWriteLogEventManager *)self _compareIPSignatures:v18 secondSignature:v20];

    v21 = [v17 lastSuccessIpv6Signature];
    v22 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    v23 = [v22 cachedIpv6Signature];
    BOOL v24 = [(HMDCharacteristicReadWriteLogEventManager *)self _compareIPSignatures:v21 secondSignature:v23];

    v25 = [v17 lastFailureIpv4Signature];
    v26 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    v27 = [v26 cachedIpv4Signature];
    BOOL v28 = [(HMDCharacteristicReadWriteLogEventManager *)self _compareIPSignatures:v25 secondSignature:v27];

    v29 = [v17 lastFailureIpv6Signature];
    v30 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    v31 = [v30 cachedIpv6Signature];
    BOOL v32 = [(HMDCharacteristicReadWriteLogEventManager *)self _compareIPSignatures:v29 secondSignature:v31];

    v33 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    v34 = [v33 cachedIpv4Signature];
    if (v15)
    {
      [v17 setLastFailureIpv4Signature:v34];

      v35 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
      v36 = [v35 cachedIpv6Signature];
      [v17 setLastFailureIpv6Signature:v36];
    }
    else
    {
      [v17 setLastSuccessIpv4Signature:v34];

      v35 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
      v36 = [v35 cachedIpv6Signature];
      [v17 setLastSuccessIpv6Signature:v36];
    }

    [v39 setIsCurrentNetworkSignatureSameAsLastSuccess:v37 & v24];
    [v39 setIsCurrentNetworkSignatureSameAsLastFailure:v28 & v32];
  }

  os_unfair_lock_unlock(lock);
}

- (BOOL)_compareIPSignatures:(id)a3 secondSignature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v5 && v6) {
      char v8 = [v5 isEqualToData:v6];
    }
  }

  return v8;
}

- (void)_updateBluetoothStatisticsForLogEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
  objc_msgSend(v4, "setBluetoothState:", objc_msgSend(v5, "cachedBluetoothState"));
}

- (void)_updateWiFiStatisticsForLogEvent:(id)a3
{
  id v30 = a3;
  id v4 = [v30 accessoryUUID];
  id v5 = [v30 error];
  uint64_t v6 = [v5 code];

  double v7 = [(HMDCharacteristicReadWriteLogEventManager *)self accessoryStatisticsByHMDAccessoryUUID];
  char v8 = [v7 objectForKeyedSubscript:v4];

  if (v8)
  {
    uint64_t v9 = [v8 lastSuccessSSID];
    if (v9)
    {
      v10 = (void *)v9;
      double v11 = [v8 lastSuccessBSSID];

      if (v11)
      {
        id v12 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
        v13 = [v12 cachedWifiSSID];
        if (v13)
        {
          v14 = [v8 lastSuccessSSID];
          uint64_t v15 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
          v16 = [v15 cachedWifiSSID];
          unsigned int v29 = [v14 isEqualToString:v16];
        }
        else
        {
          unsigned int v29 = 0;
        }

        BOOL v24 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
        v25 = [v24 cachedWifiBSSID];
        if (v25)
        {
          v26 = [v8 lastSuccessBSSID];
          v27 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
          BOOL v28 = [v27 cachedWifiBSSID];
          double v11 = (void *)[v26 isEqualToString:v28];
        }
        else
        {
          double v11 = 0;
        }

        v18 = v30;
        uint64_t v17 = v29;
        if (v6) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      double v11 = 0;
    }
    v18 = v30;
    if (v6)
    {
LABEL_10:
      [v18 setIsSSIDSameAsLastSuccessRequest:v17];
      [v30 setIsBSSIDSameAsLastSuccessRequest:v11];
      v23 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
      objc_msgSend(v30, "setWifiConnectionState:", objc_msgSend(v23, "cachedWifiConnectionState"));

      goto LABEL_11;
    }
LABEL_9:
    v19 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    v20 = [v19 cachedWifiSSID];
    [v8 setLastSuccessSSID:v20];

    v21 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];
    v22 = [v21 cachedWifiBSSID];
    [v8 setLastSuccessBSSID:v22];

    v18 = v30;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_setupNetworkCacheWithWifiManager:(id)a3
{
  id v6 = a3;
  id v4 = [(HMDCharacteristicReadWriteLogEventManager *)self networkInformationCache];

  if (!v4)
  {
    id v5 = [[HMDCharacteristicReadWriteNetworkInformation alloc] initWithWifiManager:v6];
    [(HMDCharacteristicReadWriteLogEventManager *)self setNetworkInformationCache:v5];
  }
}

- (double)elapsedTimeInterval:(double)a3
{
  if ((int)a3 < 1) {
    return 0.0;
  }
  HMFUptime();
  return v4 - a3;
}

- (HMDCharacteristicReadWriteLogEventManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCharacteristicReadWriteLogEventManager;
  v2 = [(HMDCharacteristicReadWriteLogEventManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accessoryStatisticsByHMDAccessoryUUID = v2->_accessoryStatisticsByHMDAccessoryUUID;
    v2->_accessoryStatisticsByHMDAccessoryUUID = v3;
  }
  return v2;
}

+ (HMDCharacteristicReadWriteLogEventManager)sharedInstance
{
  if (sharedInstance_onceToken_201844 != -1) {
    dispatch_once(&sharedInstance_onceToken_201844, &__block_literal_global_201845);
  }
  v2 = (void *)sharedInstance_readWriteLogEventManager;
  return (HMDCharacteristicReadWriteLogEventManager *)v2;
}

void __59__HMDCharacteristicReadWriteLogEventManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMDCharacteristicReadWriteLogEventManager);
  v1 = (void *)sharedInstance_readWriteLogEventManager;
  sharedInstance_readWriteLogEventManager = (uint64_t)v0;
}

@end