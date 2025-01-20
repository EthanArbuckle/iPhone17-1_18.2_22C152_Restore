@interface MTSDeviceSetupRequestPairingDescription
- (MTSDeviceSetupRequestPairingDescription)initWithRootPublicKey:(id)a3 nodeID:(id)a4;
- (NSData)rootPublicKey;
- (NSNumber)nodeID;
@end

@implementation MTSDeviceSetupRequestPairingDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeID, 0);

  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (MTSDeviceSetupRequestPairingDescription)initWithRootPublicKey:(id)a3 nodeID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTSDeviceSetupRequestPairingDescription;
  v9 = [(MTSDeviceSetupRequestPairingDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootPublicKey, a3);
    objc_storeStrong((id *)&v10->_nodeID, a4);
  }

  return v10;
}

@end