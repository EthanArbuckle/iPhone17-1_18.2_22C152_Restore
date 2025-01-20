@interface AKMDMInformation
- (AKMDMInformation)initWithDeviceManagedState:(unint64_t)a3 organizationToken:(id)a4;
- (NSString)deviceManagedState;
- (NSString)organizationToken;
@end

@implementation AKMDMInformation

- (AKMDMInformation)initWithDeviceManagedState:(unint64_t)a3 organizationToken:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AKMDMInformation;
  v8 = [(AKMDMInformation *)&v13 init];
  if (v8)
  {
    v9 = +[NSNumber numberWithUnsignedInteger:a3];
    uint64_t v10 = [v9 stringValue];
    deviceManagedState = v8->_deviceManagedState;
    v8->_deviceManagedState = (NSString *)v10;

    objc_storeStrong((id *)&v8->_organizationToken, a4);
  }

  return v8;
}

- (NSString)deviceManagedState
{
  return self->_deviceManagedState;
}

- (NSString)organizationToken
{
  return self->_organizationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationToken, 0);

  objc_storeStrong((id *)&self->_deviceManagedState, 0);
}

@end