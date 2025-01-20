@interface HAPAccessoryServerBTLE
+ (id)hapUUIDFromBTLEUUID:(id)a3;
- (BOOL)isCached;
- (BOOL)isPaired;
- (BOOL)notifyingCharacteristicUpdated;
- (BOOL)stateChanged;
- (BOOL)updatePeripheralIdentifier:(id *)a3 isPairing:(BOOL)a4;
- (BOOL)updateResumeSessionID:(unint64_t)a3;
- (CBPeripheral)peripheral;
- (HAPAccessoryServerBTLE)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16;
- (HAPAccessoryServerBrowserBTLE)browser;
- (HAPBLEPeripheral)blePeripheral;
- (NSNumber)stateNumber;
- (NSString)shortDescription;
- (NSString)whbStableIdentifier;
- (id)readAndResetHAPMetrics:(BOOL)a3;
- (int64_t)linkLayerType;
- (int64_t)linkType;
- (unint64_t)hapBLEProtocolVersion;
- (unint64_t)metricHAPBTLEConnectionCount;
- (unint64_t)metricHAPBTLEConnectionPerReasonCount;
- (unint64_t)metricHAPBTLEDiscoveryCount;
- (unint64_t)resumeSessionID;
- (unsigned)connectReason;
- (unsigned)connectionIdleTime;
- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4;
- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4;
- (void)incrementHAPBTLEMetricsConnectionCount;
- (void)incrementHAPBTLEMetricsDiscoveryCount;
- (void)setBlePeripheral:(id)a3;
- (void)setConnectReason:(unsigned __int8)a3;
- (void)setConnectionIdleTime:(unsigned __int8)a3;
- (void)setMetricHAPBTLEConnectionCount:(unint64_t)a3;
- (void)setMetricHAPBTLEConnectionPerReasonCount:(unint64_t)a3;
- (void)setMetricHAPBTLEDiscoveryCount:(unint64_t)a3;
- (void)setNotifyingCharacteristicUpdated:(BOOL)a3;
- (void)setStateChanged:(BOOL)a3;
- (void)setStateNumber:(id)a3;
- (void)updateConnectionIdleTime:(unsigned __int8)a3;
- (void)updatePeripheral:(id)a3;
@end

@implementation HAPAccessoryServerBTLE

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_blePeripheral);
  objc_destroyWeak((id *)&self->_browser);
  objc_destroyWeak((id *)&self->_peripheral);
  objc_storeStrong((id *)&self->_whbStableIdentifier, 0);

  objc_storeStrong((id *)&self->_stateNumber, 0);
}

- (void)setBlePeripheral:(id)a3
{
}

- (HAPBLEPeripheral)blePeripheral
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blePeripheral);

  return (HAPBLEPeripheral *)WeakRetained;
}

- (void)setConnectionIdleTime:(unsigned __int8)a3
{
  self->_connectionIdleTime = a3;
}

- (unsigned)connectionIdleTime
{
  return self->_connectionIdleTime;
}

- (void)setMetricHAPBTLEConnectionPerReasonCount:(unint64_t)a3
{
  self->_metricHAPBTLEConnectionPerReasonCount = a3;
}

- (unint64_t)metricHAPBTLEConnectionPerReasonCount
{
  return self->_metricHAPBTLEConnectionPerReasonCount;
}

- (void)setMetricHAPBTLEDiscoveryCount:(unint64_t)a3
{
  self->_metricHAPBTLEDiscoveryCount = a3;
}

- (unint64_t)metricHAPBTLEDiscoveryCount
{
  return self->_metricHAPBTLEDiscoveryCount;
}

- (void)setMetricHAPBTLEConnectionCount:(unint64_t)a3
{
  self->_metricHAPBTLEConnectionCount = a3;
}

- (unint64_t)metricHAPBTLEConnectionCount
{
  return self->_metricHAPBTLEConnectionCount;
}

- (HAPAccessoryServerBrowserBTLE)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);

  return (HAPAccessoryServerBrowserBTLE *)WeakRetained;
}

- (unint64_t)resumeSessionID
{
  return self->_resumeSessionID;
}

- (unint64_t)hapBLEProtocolVersion
{
  return self->_hapBLEProtocolVersion;
}

- (CBPeripheral)peripheral
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);

  return (CBPeripheral *)WeakRetained;
}

- (void)setNotifyingCharacteristicUpdated:(BOOL)a3
{
  self->_notifyingCharacteristicUpdated = a3;
}

- (BOOL)notifyingCharacteristicUpdated
{
  return self->_notifyingCharacteristicUpdated;
}

- (void)setStateChanged:(BOOL)a3
{
  self->_stateChanged = a3;
}

- (BOOL)stateChanged
{
  return self->_stateChanged;
}

- (NSString)whbStableIdentifier
{
  return self->_whbStableIdentifier;
}

- (NSString)shortDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HAPAccessoryServerBTLE;
  v4 = [(HAPAccessoryServer *)&v8 shortDescription];
  v5 = [(HAPAccessoryServerBTLE *)self stateNumber];
  v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isCached
{
  v2 = [(HAPAccessoryServerBTLE *)self blePeripheral];
  char v3 = [v2 isCached];

  return v3;
}

- (BOOL)isPaired
{
  char v3 = [(HAPAccessoryServerBTLE *)self browser];
  v4 = [(HAPAccessoryServer *)self identifier];
  char v5 = [v3 isPaired:v4];

  return v5;
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  v11 = NSString;
  v12 = NSStringFromSelector(a2);
  v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  v13 = NSString;
  id v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  char v5 = NSString;
  v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)updatePeripheralIdentifier:(id *)a3 isPairing:(BOOL)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = [(HAPAccessoryServerBTLE *)self browser];
  id v8 = [(HAPAccessoryServer *)self identifier];
  char v9 = [v7 isPaired:v8];

  if ((v9 & 1) != 0 || a4)
  {
    unint64_t v35 = 0;
    uint64_t v36 = 0;
    v11 = [(HAPAccessoryServer *)self keyStore];
    uint64_t v12 = [(HAPAccessoryServer *)self identifier];
    id v34 = 0;
    id v13 = (id)[v11 readPeripheralIdentifierForAccessoryIdentifier:v12 protocolVersion:0 resumeSessionID:&v35 error:&v34];
    id v14 = v34;

    if (v35)
    {
      v15 = (void *)MEMORY[0x1D944E080]();
      id v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v38 = v18;
        __int16 v39 = 2048;
        unint64_t v40 = v35;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Initializing BLE Server with resumeSessionID: %llu", buf, 0x16u);
      }
      v16->_resumeSessionID = v35;
    }
    v19 = [(HAPAccessoryServer *)self keyStore];
    v20 = [(HAPAccessoryServerBTLE *)self blePeripheral];
    v21 = [v20 uniqueBTIdentifier];
    v22 = [(HAPAccessoryServer *)self identifier];
    id v33 = 0;
    char v10 = objc_msgSend(v19, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v21, v22, -[HAPAccessoryServerBTLE hapBLEProtocolVersion](self, "hapBLEProtocolVersion"), &v36, -[HAPAccessoryServerBTLE resumeSessionID](self, "resumeSessionID"), &v33);
    id v23 = v33;

    if (v10)
    {
      if (v36 == 1 && [(HAPAccessoryServerBTLE *)self hapBLEProtocolVersion] != 1)
      {
        v24 = (void *)MEMORY[0x1D944E080]();
        v25 = self;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v38 = v27;
          _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Incompatible update BLE 1.0 -> BLE 2.x", buf, 0xCu);
        }
        [(HAPAccessoryServer *)v25 setIncompatibleUpdate:1];
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1D944E080]();
      v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v38 = v31;
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v23;
        _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %@", buf, 0x16u);
      }
      if (a3)
      {
        *a3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Failed to update peripheral" reason:@"Failed to store peripheral identifier to the keystore" suggestion:0 underlyingError:v23];
      }
    }
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Failed to update peripheral." reason:@"The accessory is unpaired" suggestion:0 underlyingError:0];
    char v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

- (void)updatePeripheral:(id)a3
{
}

- (BOOL)updateResumeSessionID:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v5 = [(HAPAccessoryServerBTLE *)self browser];
  v6 = [(HAPAccessoryServer *)self identifier];
  int v7 = [v5 isPaired:v6];

  if (!v7) {
    return 0;
  }
  self->_resumeSessionID = a3;
  id v8 = (void *)MEMORY[0x1D944E080]();
  char v9 = self;
  char v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    __int16 v26 = 2048;
    unint64_t v27 = a3;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating resumeSessionID: %llu", buf, 0x16u);
  }
  uint64_t v12 = [(HAPAccessoryServer *)v9 keyStore];
  id v13 = [(HAPAccessoryServerBTLE *)v9 blePeripheral];
  id v14 = [v13 uniqueBTIdentifier];
  v15 = [(HAPAccessoryServer *)v9 identifier];
  id v23 = 0;
  char v16 = objc_msgSend(v12, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v14, v15, -[HAPAccessoryServerBTLE hapBLEProtocolVersion](v9, "hapBLEProtocolVersion"), 0, a3, &v23);
  id v17 = v23;

  if ((v16 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1D944E080]();
    v19 = v9;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      __int16 v26 = 2114;
      unint64_t v27 = (unint64_t)v17;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %{public}@", buf, 0x16u);
    }
  }

  return v16;
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  char v10 = NSString;
  v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  char v10 = NSString;
  v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)setConnectReason:(unsigned __int8)a3
{
  int v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_connectReason = v3;
  if (v3) {
    ++self->_metricHAPBTLEConnectionPerReasonCount;
  }

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)connectReason
{
  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_connectReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setStateNumber:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_stateNumber, a3);
    os_unfair_lock_unlock(&self->super._lock);
    id v6 = [(HAPAccessoryServer *)self delegate];
    uint64_t v7 = [(HAPAccessoryServer *)self delegateQueue];
    if (v7)
    {
      id v8 = (void *)v7;
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        char v10 = [(HAPAccessoryServer *)self delegateQueue];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __41__HAPAccessoryServerBTLE_setStateNumber___block_invoke;
        v11[3] = &unk_1E69F46E0;
        id v12 = v6;
        id v13 = self;
        dispatch_async(v10, v11);
      }
    }
  }
}

uint64_t __41__HAPAccessoryServerBTLE_setStateNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServerDidUpdateStateNumber:*(void *)(a1 + 40)];
}

- (NSNumber)stateNumber
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)linkType
{
  return 2;
}

- (int64_t)linkLayerType
{
  return 3;
}

- (HAPAccessoryServerBTLE)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  id v20 = a3;
  id v39 = a4;
  id v40 = a5;
  id v21 = a6;
  id obj = a7;
  id v38 = a7;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a14;
  id v26 = a16;
  v41.receiver = self;
  v41.super_class = (Class)HAPAccessoryServerBTLE;
  unint64_t v27 = [(HAPAccessoryServer *)&v41 initWithKeystore:a15];
  uint64_t v28 = v27;
  if (v27)
  {
    objc_storeWeak((id *)&v27->_blePeripheral, v20);
    v29 = [v20 cbPeripheral];
    objc_storeWeak((id *)&v28->_peripheral, v29);

    uint64_t v30 = [v39 copy];
    name = v28->super._name;
    v28->super._name = (NSString *)v30;

    uint64_t v32 = [v40 copy];
    identifier = v28->super._identifier;
    v28->super._identifier = (NSString *)v32;

    objc_storeStrong((id *)&v28->_stateNumber, obj);
    v28->_notifyingCharacteristicUpdated = 0;
    v28->_stateChanged = a8;
    v28->_connectReason = a9;
    v28->_connectionIdleTime = a13;
    objc_storeWeak((id *)&v28->_browser, v25);
    objc_storeStrong((id *)&v28->_whbStableIdentifier, a16);
    [(HAPAccessoryServer *)v28 setSetupHash:v24];
    -[HAPAccessoryServer setHasPairings:](v28, "setHasPairings:", ([v21 unsignedCharValue] & 1) == 0);
    [(HAPAccessoryServer *)v28 setCategory:v23];
    -[HAPAccessoryServer setConfigNumber:](v28, "setConfigNumber:", [v22 unsignedIntegerValue]);
    [(HAPAccessoryServerBTLE *)v28 updatePeripheralIdentifier:0 isPairing:0];
  }

  return v28;
}

+ (id)hapUUIDFromBTLEUUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[HAPMetadata getSharedInstance];
  id v5 = [v3 UUIDString];
  id v6 = [v4 btleToServiceType:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v8 = v7;
  if (v6)
  {
    char v9 = (void *)[v7 initWithUUIDString:v6];
  }
  else
  {
    char v10 = [v3 UUIDString];
    char v9 = (void *)[v8 initWithUUIDString:v10];
  }

  return v9;
}

- (id)readAndResetHAPMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  v12[3] = *MEMORY[0x1E4F143B8];
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v11[0] = &unk_1F2C80D48;
  id v6 = [NSNumber numberWithUnsignedInteger:self->_metricHAPBTLEDiscoveryCount];
  v12[0] = v6;
  v11[1] = &unk_1F2C80D60;
  id v7 = [NSNumber numberWithUnsignedInteger:self->_metricHAPBTLEConnectionCount];
  v12[1] = v7;
  v11[2] = &unk_1F2C80D78;
  id v8 = [NSNumber numberWithUnsignedInteger:self->_metricHAPBTLEConnectionPerReasonCount];
  v12[2] = v8;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  if (v3)
  {
    self->_metricHAPBTLEDiscoveryCount = 0;
    self->_metricHAPBTLEConnectionCount = 0;
    self->_metricHAPBTLEConnectionPerReasonCount = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)incrementHAPBTLEMetricsDiscoveryCount
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPBTLEDiscoveryCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPBTLEMetricsConnectionCount
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPBTLEConnectionCount;

  os_unfair_lock_unlock(p_lock);
}

@end