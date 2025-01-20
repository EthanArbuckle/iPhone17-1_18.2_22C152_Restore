@interface HMDCharacteristicReadWriteNetworkInformation
- (BOOL)cachedIsConnectedToInternet;
- (HMDCharacteristicReadWriteNetworkInformation)initWithWifiManager:(id)a3;
- (HMFWiFiManager)wifiManager;
- (NSData)cachedIpv4Signature;
- (NSData)cachedIpv6Signature;
- (NSString)cachedWifiBSSID;
- (NSString)cachedWifiSSID;
- (double)timeIntervalNetworkInformationCache;
- (int64_t)cachedBluetoothState;
- (unint64_t)cachedCellularDataConnectionState;
- (unint64_t)cachedEthernetConnectionState;
- (unint64_t)cachedWifiConnectionState;
- (void)_refreshBluetoothInformation;
- (void)_refreshWifiInformation;
- (void)refreshNetworkInformation;
- (void)setCachedBluetoothState:(int64_t)a3;
- (void)setCachedCellularDataConnectionState:(unint64_t)a3;
- (void)setCachedEthernetConnectionState:(unint64_t)a3;
- (void)setCachedIpv4Signature:(id)a3;
- (void)setCachedIpv6Signature:(id)a3;
- (void)setCachedIsConnectedToInternet:(BOOL)a3;
- (void)setCachedWifiBSSID:(id)a3;
- (void)setCachedWifiConnectionState:(unint64_t)a3;
- (void)setCachedWifiSSID:(id)a3;
- (void)setTimeIntervalNetworkInformationCache:(double)a3;
- (void)setWifiManager:(id)a3;
@end

@implementation HMDCharacteristicReadWriteNetworkInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_cachedIpv6Signature, 0);
  objc_storeStrong((id *)&self->_cachedIpv4Signature, 0);
  objc_storeStrong((id *)&self->_cachedWifiBSSID, 0);
  objc_storeStrong((id *)&self->_cachedWifiSSID, 0);
}

- (void)setWifiManager:(id)a3
{
}

- (HMFWiFiManager)wifiManager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTimeIntervalNetworkInformationCache:(double)a3
{
  self->_timeIntervalNetworkInformationCache = a3;
}

- (double)timeIntervalNetworkInformationCache
{
  return self->_timeIntervalNetworkInformationCache;
}

- (void)setCachedIsConnectedToInternet:(BOOL)a3
{
  self->_cachedIsConnectedToInternet = a3;
}

- (BOOL)cachedIsConnectedToInternet
{
  return self->_cachedIsConnectedToInternet;
}

- (void)setCachedCellularDataConnectionState:(unint64_t)a3
{
  self->_cachedCellularDataConnectionState = a3;
}

- (unint64_t)cachedCellularDataConnectionState
{
  return self->_cachedCellularDataConnectionState;
}

- (void)setCachedEthernetConnectionState:(unint64_t)a3
{
  self->_cachedEthernetConnectionState = a3;
}

- (unint64_t)cachedEthernetConnectionState
{
  return self->_cachedEthernetConnectionState;
}

- (void)setCachedBluetoothState:(int64_t)a3
{
  self->_cachedBluetoothState = a3;
}

- (int64_t)cachedBluetoothState
{
  return self->_cachedBluetoothState;
}

- (void)setCachedWifiConnectionState:(unint64_t)a3
{
  self->_cachedWifiConnectionState = a3;
}

- (unint64_t)cachedWifiConnectionState
{
  return self->_cachedWifiConnectionState;
}

- (void)setCachedIpv6Signature:(id)a3
{
}

- (NSData)cachedIpv6Signature
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedIpv4Signature:(id)a3
{
}

- (NSData)cachedIpv4Signature
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedWifiBSSID:(id)a3
{
}

- (NSString)cachedWifiBSSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedWifiSSID:(id)a3
{
}

- (NSString)cachedWifiSSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)refreshNetworkInformation
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(HMDCharacteristicReadWriteNetworkInformation *)self _refreshWifiInformation];
  [(HMDCharacteristicReadWriteNetworkInformation *)self _refreshBluetoothInformation];
  default_evaluator = (void *)nw_path_create_default_evaluator();
  v4 = nw_path_evaluator_copy_path();
  [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedEthernetConnectionState:1];
  [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedCellularDataConnectionState:1];
  enumerate_block[0] = MEMORY[0x263EF8330];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __73__HMDCharacteristicReadWriteNetworkInformation_refreshNetworkInformation__block_invoke;
  enumerate_block[3] = &unk_264A1EBA8;
  enumerate_block[4] = self;
  nw_path_enumerate_interfaces(v4, enumerate_block);
  [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedIsConnectedToInternet:0];
  if (nw_path_get_status(v4) == nw_path_status_satisfied
    && (nw_path_has_ipv4(v4) || nw_path_has_ipv6(v4))
    && nw_path_has_dns(v4))
  {
    [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedIsConnectedToInternet:1];
  }
  if (nw_path_get_ipv4_network_signature())
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v9 length:20];
    [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedIpv4Signature:v5];
  }
  if (nw_path_get_ipv6_network_signature())
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v8 length:20];
    [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedIpv6Signature:v6];
  }
  HMFUptime();
  -[HMDCharacteristicReadWriteNetworkInformation setTimeIntervalNetworkInformationCache:](self, "setTimeIntervalNetworkInformationCache:");
}

uint64_t __73__HMDCharacteristicReadWriteNetworkInformation_refreshNetworkInformation__block_invoke(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type = nw_interface_get_type(interface);
  if (type == nw_interface_type_cellular)
  {
    [*(id *)(a1 + 32) setCachedCellularDataConnectionState:2];
  }
  else if (type == nw_interface_type_wired)
  {
    [*(id *)(a1 + 32) setCachedEthernetConnectionState:2];
  }
  return 1;
}

- (void)_refreshBluetoothInformation
{
  id v3 = [MEMORY[0x263F358C0] getInstance];
  -[HMDCharacteristicReadWriteNetworkInformation setCachedBluetoothState:](self, "setCachedBluetoothState:", [v3 state]);
}

- (void)_refreshWifiInformation
{
  id v3 = [(HMDCharacteristicReadWriteNetworkInformation *)self wifiManager];
  v4 = [v3 currentNetworkAssociation];

  if (v4)
  {
    v5 = [(HMDCharacteristicReadWriteNetworkInformation *)self wifiManager];
    v6 = [v5 currentNetworkAssociation];
    v7 = [v6 SSID];
    [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedWifiSSID:v7];

    v8 = [(HMDCharacteristicReadWriteNetworkInformation *)self wifiManager];
    v9 = [v8 currentNetworkAssociation];
    uint64_t v10 = [v9 BSSID];
    v11 = [v10 formattedString];
    [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedWifiBSSID:v11];
  }
  else
  {
    [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedWifiSSID:0];
    [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedWifiBSSID:0];
  }
  id v14 = objc_alloc_init(MEMORY[0x263F386E0]);
  [v14 activate];
  unint64_t v12 = [v14 wifiUIStateFlags];
  [v14 invalidate];
  if (v12)
  {
    if ((v12 & 2) != 0)
    {
      if (v12)
      {
        uint64_t v13 = 2;
      }
      else if ((v12 & 4) != 0)
      {
        uint64_t v13 = 3;
      }
      else
      {
        uint64_t v13 = (v12 >> 1) & 4;
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [(HMDCharacteristicReadWriteNetworkInformation *)self setCachedWifiConnectionState:v13];
}

- (HMDCharacteristicReadWriteNetworkInformation)initWithWifiManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicReadWriteNetworkInformation;
  v6 = [(HMDCharacteristicReadWriteNetworkInformation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wifiManager, a3);
  }

  return v7;
}

@end