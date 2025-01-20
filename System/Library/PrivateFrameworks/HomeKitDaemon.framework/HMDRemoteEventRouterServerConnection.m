@interface HMDRemoteEventRouterServerConnection
- (HMDRemoteEventRouterServerConnection)initWithDevice:(id)a3 connectionMode:(int64_t)a4 supportsFragmentMessage:(BOOL)a5 userAccessControlProviderUUID:(id)a6;
- (HMDRemoteEventRouterServerConnection)initWithDeviceIdentifier:(id)a3 device:(id)a4 connectionMode:(int64_t)a5 supportsFragmentMessage:(BOOL)a6 userAccessControlProviderUUID:(id)a7;
- (NSString)description;
@end

@implementation HMDRemoteEventRouterServerConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccessControlProviderUUID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    int64_t connectionMode = self->_connectionMode;
    if (connectionMode)
    {
      if (connectionMode == 1) {
        v7 = @"ConnectionModeResident";
      }
      else {
        v7 = @"Unknown";
      }
      v8 = v7;
    }
    else
    {
      v8 = @"ConnectionModePrimary";
    }
    v9 = self->_deviceIdentifier;
    userAccessControlProviderUUID = self->_userAccessControlProviderUUID;
  }
  else
  {
    v9 = 0;
    userAccessControlProviderUUID = 0;
    v8 = @"ConnectionModePrimary";
  }
  v11 = [v3 stringWithFormat:@"<%@ mode: %@, deviceIdentifier: %@, userACLProvider: %@>", v5, v8, v9, userAccessControlProviderUUID];

  return (NSString *)v11;
}

- (HMDRemoteEventRouterServerConnection)initWithDeviceIdentifier:(id)a3 device:(id)a4 connectionMode:(int64_t)a5 supportsFragmentMessage:(BOOL)a6 userAccessControlProviderUUID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteEventRouterServerConnection;
  v16 = [(HMDRemoteEventRouterServerConnection *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_deviceIdentifier, a3);
    v17->_int64_t connectionMode = a5;
    v17->_supportsFragmentMessage = a6;
    objc_storeStrong((id *)&v17->_device, a4);
    objc_storeStrong((id *)&v17->_userAccessControlProviderUUID, a7);
  }

  return v17;
}

- (HMDRemoteEventRouterServerConnection)initWithDevice:(id)a3 connectionMode:(int64_t)a4 supportsFragmentMessage:(BOOL)a5 userAccessControlProviderUUID:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  v12 = [v11 identifier];
  id v13 = [(HMDRemoteEventRouterServerConnection *)self initWithDeviceIdentifier:v12 device:v11 connectionMode:a4 supportsFragmentMessage:v6 userAccessControlProviderUUID:v10];

  return v13;
}

@end