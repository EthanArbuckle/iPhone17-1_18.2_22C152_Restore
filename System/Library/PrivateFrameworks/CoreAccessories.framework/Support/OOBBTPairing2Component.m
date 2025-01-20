@interface OOBBTPairing2Component
- (NSData)macAddr;
- (NSNumber)componentID;
- (NSString)componentName;
- (NSString)componentUID;
- (OOBBTPairing2Component)initWithComponentInfo:(id)a3;
- (OOBBTPairing2Component)initWithUID:(id)a3 componentID:(id)a4 name:(id)a5 macAddr:(id)a6;
- (int)accessoryStatus;
- (int)status;
- (void)setAccessoryStatus:(int)a3;
- (void)setComponentID:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentUID:(id)a3;
- (void)setMacAddr:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation OOBBTPairing2Component

- (OOBBTPairing2Component)initWithUID:(id)a3 componentID:(id)a4 name:(id)a5 macAddr:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OOBBTPairing2Component;
  v15 = [(OOBBTPairing2Component *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_componentUID, a3);
    objc_storeStrong((id *)&v16->_componentID, a4);
    objc_storeStrong((id *)&v16->_componentName, a5);
    objc_storeStrong((id *)&v16->_macAddr, a6);
    *(void *)&v16->_status = 0;
  }

  return v16;
}

- (OOBBTPairing2Component)initWithComponentInfo:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OOBBTPairing2Component;
  v5 = [(OOBBTPairing2Component *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"ACCOOBBTPairingComponentInfoUID"];
    componentUID = v5->_componentUID;
    v5->_componentUID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"ACCOOBBTPairingComponentInfoID"];
    componentID = v5->_componentID;
    v5->_componentID = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKey:@"ACCOOBBTPairingComponentInfoName"];
    componentName = v5->_componentName;
    v5->_componentName = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"ACCOOBBTPairingComponentInfoMacAddr"];
    macAddr = v5->_macAddr;
    v5->_macAddr = (NSData *)v12;

    *(void *)&v5->_status = 0;
  }

  return v5;
}

- (NSString)componentUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setComponentUID:(id)a3
{
}

- (NSNumber)componentID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComponentID:(id)a3
{
}

- (NSString)componentName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setComponentName:(id)a3
{
}

- (NSData)macAddr
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMacAddr:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (int)accessoryStatus
{
  return self->_accessoryStatus;
}

- (void)setAccessoryStatus:(int)a3
{
  self->_accessoryStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddr, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_componentID, 0);

  objc_storeStrong((id *)&self->_componentUID, 0);
}

@end