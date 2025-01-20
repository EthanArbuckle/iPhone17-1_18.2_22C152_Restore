@interface MTRThreadNetworkDirectoryClusterThreadNetworkStruct
- (MTRThreadNetworkDirectoryClusterThreadNetworkStruct)init;
- (NSData)extendedPanID;
- (NSNumber)activeTimestamp;
- (NSNumber)channel;
- (NSString)networkName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActiveTimestamp:(id)a3;
- (void)setChannel:(id)a3;
- (void)setExtendedPanID:(id)a3;
- (void)setNetworkName:(id)a3;
@end

@implementation MTRThreadNetworkDirectoryClusterThreadNetworkStruct

- (MTRThreadNetworkDirectoryClusterThreadNetworkStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRThreadNetworkDirectoryClusterThreadNetworkStruct;
  v4 = [(MTRThreadNetworkDirectoryClusterThreadNetworkStruct *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    extendedPanID = v4->_extendedPanID;
    v4->_extendedPanID = (NSData *)v5;

    networkName = v4->_networkName;
    v4->_networkName = (NSString *)&stru_26F969DC8;

    channel = v4->_channel;
    v4->_channel = (NSNumber *)&unk_26F9C8620;

    activeTimestamp = v4->_activeTimestamp;
    v4->_activeTimestamp = (NSNumber *)&unk_26F9C8620;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThreadNetworkDirectoryClusterThreadNetworkStruct);
  v7 = objc_msgSend_extendedPanID(self, v5, v6);
  objc_msgSend_setExtendedPanID_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_networkName(self, v9, v10);
  objc_msgSend_setNetworkName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_channel(self, v13, v14);
  objc_msgSend_setChannel_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_activeTimestamp(self, v17, v18);
  objc_msgSend_setActiveTimestamp_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_extendedPanID, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: extendedPanID:%@; networkName:%@; channel:%@; activeTimestamp:%@; >",
    v5,
    v7,
    self->_networkName,
    self->_channel,
  v9 = self->_activeTimestamp);

  return v9;
}

- (NSData)extendedPanID
{
  return self->_extendedPanID;
}

- (void)setExtendedPanID:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSNumber)activeTimestamp
{
  return self->_activeTimestamp;
}

- (void)setActiveTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTimestamp, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_networkName, 0);

  objc_storeStrong((id *)&self->_extendedPanID, 0);
}

@end