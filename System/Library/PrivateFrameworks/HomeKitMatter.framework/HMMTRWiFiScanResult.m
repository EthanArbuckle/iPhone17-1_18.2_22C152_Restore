@interface HMMTRWiFiScanResult
- (HMMTRWiFiScanResult)initWithMTRNetworkCommissioningClusterWiFiInterfaceScanResult:(id)a3;
- (HMMTRWiFiScanResult)initWithSSID:(id)a3 rssi:(id)a4 security:(unsigned __int8)a5 band:(unsigned __int8)a6;
- (NSData)ssid;
- (NSNumber)band;
- (NSNumber)rssi;
- (NSNumber)security;
@end

@implementation HMMTRWiFiScanResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_band, 0);
  objc_storeStrong((id *)&self->_security, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

- (NSNumber)band
{
  return self->_band;
}

- (NSNumber)security
{
  return self->_security;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (NSData)ssid
{
  return self->_ssid;
}

- (HMMTRWiFiScanResult)initWithSSID:(id)a3 rssi:(id)a4 security:(unsigned __int8)a5 band:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  id v11 = a3;
  id v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMMTRWiFiScanResult;
  v13 = [(HMMTRWiFiScanResult *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_ssid, a3);
    objc_storeStrong((id *)&v14->_rssi, a4);
    uint64_t v15 = [NSNumber numberWithUnsignedChar:v7];
    security = v14->_security;
    v14->_security = (NSNumber *)v15;

    uint64_t v17 = [NSNumber numberWithUnsignedChar:v6];
    band = v14->_band;
    v14->_band = (NSNumber *)v17;
  }
  return v14;
}

- (HMMTRWiFiScanResult)initWithMTRNetworkCommissioningClusterWiFiInterfaceScanResult:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRWiFiScanResult;
  v5 = [(HMMTRWiFiScanResult *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 ssid];
    ssid = v5->_ssid;
    v5->_ssid = (NSData *)v6;

    uint64_t v8 = [v4 rssi];
    rssi = v5->_rssi;
    v5->_rssi = (NSNumber *)v8;

    uint64_t v10 = [v4 security];
    security = v5->_security;
    v5->_security = (NSNumber *)v10;

    uint64_t v12 = [v4 wiFiBand];
    band = v5->_band;
    v5->_band = (NSNumber *)v12;
  }
  return v5;
}

@end