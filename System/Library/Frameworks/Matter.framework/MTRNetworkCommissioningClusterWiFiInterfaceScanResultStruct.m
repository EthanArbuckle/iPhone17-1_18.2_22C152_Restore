@interface MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct
- (MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct)init;
- (NSData)bssid;
- (NSData)ssid;
- (NSNumber)channel;
- (NSNumber)rssi;
- (NSNumber)security;
- (NSNumber)wiFiBand;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBssid:(NSData *)bssid;
- (void)setChannel:(NSNumber *)channel;
- (void)setRssi:(NSNumber *)rssi;
- (void)setSecurity:(NSNumber *)security;
- (void)setSsid:(NSData *)ssid;
- (void)setWiFiBand:(NSNumber *)wiFiBand;
@end

@implementation MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct

- (MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct;
  v2 = [(MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct *)&v17 init];
  v3 = v2;
  if (v2)
  {
    security = v2->_security;
    v2->_security = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_msgSend_data(MEMORY[0x263EFF8F8], v5, v6);
    ssid = v3->_ssid;
    v3->_ssid = (NSData *)v7;

    uint64_t v11 = objc_msgSend_data(MEMORY[0x263EFF8F8], v9, v10);
    bssid = v3->_bssid;
    v3->_bssid = (NSData *)v11;

    channel = v3->_channel;
    v3->_channel = (NSNumber *)&unk_26F9C8620;

    wiFiBand = v3->_wiFiBand;
    v3->_wiFiBand = (NSNumber *)&unk_26F9C8620;

    rssi = v3->_rssi;
    v3->_rssi = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct);
  uint64_t v7 = objc_msgSend_security(self, v5, v6);
  objc_msgSend_setSecurity_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_ssid(self, v9, v10);
  objc_msgSend_setSsid_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_bssid(self, v13, v14);
  objc_msgSend_setBssid_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_channel(self, v17, v18);
  objc_msgSend_setChannel_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_wiFiBand(self, v21, v22);
  objc_msgSend_setWiFiBand_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_rssi(self, v25, v26);
  objc_msgSend_setRssi_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  security = self->_security;
  v8 = objc_msgSend_base64EncodedStringWithOptions_(self->_ssid, v7, 0);
  uint64_t v10 = objc_msgSend_base64EncodedStringWithOptions_(self->_bssid, v9, 0);
  objc_msgSend_stringWithFormat_(v3, v11, @"<%@: security:%@; ssid:%@; bssid:%@; channel:%@; wiFiBand:%@; rssi:%@; >",
    v5,
    security,
    v8,
    v10,
    self->_channel,
    self->_wiFiBand,
  v12 = self->_rssi);

  return v12;
}

- (NSNumber)security
{
  return self->_security;
}

- (void)setSecurity:(NSNumber *)security
{
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(NSData *)ssid
{
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(NSData *)bssid
{
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(NSNumber *)channel
{
}

- (NSNumber)wiFiBand
{
  return self->_wiFiBand;
}

- (void)setWiFiBand:(NSNumber *)wiFiBand
{
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(NSNumber *)rssi
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wiFiBand, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);

  objc_storeStrong((id *)&self->_security, 0);
}

@end