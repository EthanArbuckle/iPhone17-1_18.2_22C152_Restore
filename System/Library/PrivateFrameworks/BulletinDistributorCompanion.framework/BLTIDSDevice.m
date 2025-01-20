@interface BLTIDSDevice
- (BLTIDSDevice)initWithIDSDevice:(id)a3;
- (BOOL)isCloudReachable;
- (BOOL)isConnected;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isNearby;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
@end

@implementation BLTIDSDevice

- (BLTIDSDevice)initWithIDSDevice:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLTIDSDevice;
  v6 = [(BLTIDSDevice *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    id v8 = +[BLTReachabilityManager sharedInstance];
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BLTIDSDevice;
  [(BLTIDSDevice *)&v2 dealloc];
}

- (BOOL)isDefaultPairedDevice
{
  return [(IDSDevice *)self->_device isDefaultPairedDevice];
}

- (BOOL)isNearby
{
  return [(IDSDevice *)self->_device isNearby];
}

- (BOOL)isConnected
{
  return [(IDSDevice *)self->_device isConnected];
}

- (BOOL)isCloudReachable
{
  objc_super v2 = +[BLTReachabilityManager sharedInstance];
  char v3 = [v2 isInternetReachable];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(BLTIDSDevice *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  objc_super v2 = [(BLTIDSDevice *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(BLTIDSDevice *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(BLTIDSDevice *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendPointer:self->_device withName:@"device"];
  id v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"), @"isDefaultPairedDevice");
  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isNearby](self, "isNearby"), @"isNearby");
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isConnected](self, "isConnected"), @"isConnected");
  id v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isCloudReachable](self, "isCloudReachable"), @"isCloudReachable");
  return v4;
}

- (void).cxx_destruct
{
}

@end