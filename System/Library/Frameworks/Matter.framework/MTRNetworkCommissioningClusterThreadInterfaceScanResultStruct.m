@interface MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct
- (MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct)init;
- (NSData)extendedAddress;
- (NSNumber)channel;
- (NSNumber)extendedPanId;
- (NSNumber)lqi;
- (NSNumber)panId;
- (NSNumber)rssi;
- (NSNumber)version;
- (NSString)networkName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setChannel:(NSNumber *)channel;
- (void)setExtendedAddress:(NSData *)extendedAddress;
- (void)setExtendedPanId:(NSNumber *)extendedPanId;
- (void)setLqi:(NSNumber *)lqi;
- (void)setNetworkName:(NSString *)networkName;
- (void)setPanId:(NSNumber *)panId;
- (void)setRssi:(NSNumber *)rssi;
- (void)setVersion:(NSNumber *)version;
@end

@implementation MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct

- (MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct)init
{
  v16.receiver = self;
  v16.super_class = (Class)MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct;
  v2 = [(MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct *)&v16 init];
  v3 = v2;
  if (v2)
  {
    panId = v2->_panId;
    v2->_panId = (NSNumber *)&unk_26F9C8620;

    extendedPanId = v3->_extendedPanId;
    v3->_extendedPanId = (NSNumber *)&unk_26F9C8620;

    networkName = v3->_networkName;
    v3->_networkName = (NSString *)&stru_26F969DC8;

    channel = v3->_channel;
    v3->_channel = (NSNumber *)&unk_26F9C8620;

    version = v3->_version;
    v3->_version = (NSNumber *)&unk_26F9C8620;

    uint64_t v11 = objc_msgSend_data(MEMORY[0x263EFF8F8], v9, v10);
    extendedAddress = v3->_extendedAddress;
    v3->_extendedAddress = (NSData *)v11;

    rssi = v3->_rssi;
    v3->_rssi = (NSNumber *)&unk_26F9C8620;

    lqi = v3->_lqi;
    v3->_lqi = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct);
  v7 = objc_msgSend_panId(self, v5, v6);
  objc_msgSend_setPanId_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_extendedPanId(self, v9, v10);
  objc_msgSend_setExtendedPanId_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_networkName(self, v13, v14);
  objc_msgSend_setNetworkName_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_channel(self, v17, v18);
  objc_msgSend_setChannel_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_version(self, v21, v22);
  objc_msgSend_setVersion_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_extendedAddress(self, v25, v26);
  objc_msgSend_setExtendedAddress_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_rssi(self, v29, v30);
  objc_msgSend_setRssi_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_lqi(self, v33, v34);
  objc_msgSend_setLqi_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  panId = self->_panId;
  extendedPanId = self->_extendedPanId;
  networkName = self->_networkName;
  channel = self->_channel;
  version = self->_version;
  v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_extendedAddress, v11, 0);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: panId:%@; extendedPanId:%@; networkName:%@; channel:%@; version:%@; extendedAddress:%@; rssi:%@; lqi:%@; >",
    v5,
    panId,
    extendedPanId,
    networkName,
    channel,
    version,
    v12,
    self->_rssi,
  uint64_t v14 = self->_lqi);

  return v14;
}

- (NSNumber)panId
{
  return self->_panId;
}

- (void)setPanId:(NSNumber *)panId
{
}

- (NSNumber)extendedPanId
{
  return self->_extendedPanId;
}

- (void)setExtendedPanId:(NSNumber *)extendedPanId
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(NSString *)networkName
{
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(NSNumber *)channel
{
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(NSNumber *)version
{
}

- (NSData)extendedAddress
{
  return self->_extendedAddress;
}

- (void)setExtendedAddress:(NSData *)extendedAddress
{
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(NSNumber *)rssi
{
}

- (NSNumber)lqi
{
  return self->_lqi;
}

- (void)setLqi:(NSNumber *)lqi
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lqi, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_extendedAddress, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_extendedPanId, 0);

  objc_storeStrong((id *)&self->_panId, 0);
}

@end