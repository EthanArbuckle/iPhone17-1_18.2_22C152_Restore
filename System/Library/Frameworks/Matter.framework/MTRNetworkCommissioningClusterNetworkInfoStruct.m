@interface MTRNetworkCommissioningClusterNetworkInfoStruct
- (MTRNetworkCommissioningClusterNetworkInfoStruct)init;
- (NSData)clientIdentifier;
- (NSData)networkID;
- (NSData)networkIdentifier;
- (NSNumber)connected;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setClientIdentifier:(id)a3;
- (void)setConnected:(NSNumber *)connected;
- (void)setNetworkID:(NSData *)networkID;
- (void)setNetworkIdentifier:(id)a3;
@end

@implementation MTRNetworkCommissioningClusterNetworkInfoStruct

- (MTRNetworkCommissioningClusterNetworkInfoStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRNetworkCommissioningClusterNetworkInfoStruct;
  v4 = [(MTRNetworkCommissioningClusterNetworkInfoStruct *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    networkID = v4->_networkID;
    v4->_networkID = (NSData *)v5;

    connected = v4->_connected;
    v4->_connected = (NSNumber *)&unk_26F9C8620;

    networkIdentifier = v4->_networkIdentifier;
    v4->_networkIdentifier = 0;

    clientIdentifier = v4->_clientIdentifier;
    v4->_clientIdentifier = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRNetworkCommissioningClusterNetworkInfoStruct);
  v7 = objc_msgSend_networkID(self, v5, v6);
  objc_msgSend_setNetworkID_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_connected(self, v9, v10);
  objc_msgSend_setConnected_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_networkIdentifier(self, v13, v14);
  objc_msgSend_setNetworkIdentifier_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_clientIdentifier(self, v17, v18);
  objc_msgSend_setClientIdentifier_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_networkID, v6, 0);
  connected = self->_connected;
  uint64_t v10 = objc_msgSend_base64EncodedStringWithOptions_(self->_networkIdentifier, v9, 0);
  v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_clientIdentifier, v11, 0);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: networkID:%@; connected:%@; networkIdentifier:%@; clientIdentifier:%@; >",
    v5,
    v7,
    connected,
    v10,
  uint64_t v14 = v12);

  return v14;
}

- (NSData)networkID
{
  return self->_networkID;
}

- (void)setNetworkID:(NSData *)networkID
{
}

- (NSNumber)connected
{
  return self->_connected;
}

- (void)setConnected:(NSNumber *)connected
{
}

- (NSData)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
}

- (NSData)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_connected, 0);

  objc_storeStrong((id *)&self->_networkID, 0);
}

@end