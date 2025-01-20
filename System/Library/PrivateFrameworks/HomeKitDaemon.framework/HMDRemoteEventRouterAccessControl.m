@interface HMDRemoteEventRouterAccessControl
+ (id)allowAllUsersAndDevicesAccessControl;
+ (id)allowSharedAdminsAndAllDevicesAccessControl;
+ (unint64_t)remoteDeviceAccessControlFromNumber:(id)a3;
+ (unint64_t)remoteUserAccessControlFromNumber:(id)a3;
- (HMDRemoteEventRouterAccessControl)initWithAllowedUserTypes:(unint64_t)a3 deviceCategories:(unint64_t)a4;
- (unint64_t)allowedDeviceTypes;
- (unint64_t)allowedUserTypes;
@end

@implementation HMDRemoteEventRouterAccessControl

- (unint64_t)allowedDeviceTypes
{
  return self->_allowedDeviceTypes;
}

- (unint64_t)allowedUserTypes
{
  return self->_allowedUserTypes;
}

- (HMDRemoteEventRouterAccessControl)initWithAllowedUserTypes:(unint64_t)a3 deviceCategories:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteEventRouterAccessControl;
  result = [(HMDRemoteEventRouterAccessControl *)&v7 init];
  if (result)
  {
    result->_allowedUserTypes = a3;
    result->_allowedDeviceTypes = a4;
  }
  return result;
}

+ (unint64_t)remoteDeviceAccessControlFromNumber:(id)a3
{
  id v3 = a3;
  [v3 unsignedIntegerValue];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

+ (unint64_t)remoteUserAccessControlFromNumber:(id)a3
{
  id v3 = a3;
  [v3 unsignedIntegerValue];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

+ (id)allowSharedAdminsAndAllDevicesAccessControl
{
  if (allowSharedAdminsAndAllDevicesAccessControl_onceToken != -1) {
    dispatch_once(&allowSharedAdminsAndAllDevicesAccessControl_onceToken, &__block_literal_global_2_172418);
  }
  v2 = (void *)allowSharedAdminsAndAllDevicesAccessControl_accessControlPolicy;
  return v2;
}

void __80__HMDRemoteEventRouterAccessControl_allowSharedAdminsAndAllDevicesAccessControl__block_invoke()
{
  v0 = [[HMDRemoteEventRouterAccessControl alloc] initWithAllowedUserTypes:1 deviceCategories:3];
  v1 = (void *)allowSharedAdminsAndAllDevicesAccessControl_accessControlPolicy;
  allowSharedAdminsAndAllDevicesAccessControl_accessControlPolicy = (uint64_t)v0;
}

+ (id)allowAllUsersAndDevicesAccessControl
{
  if (allowAllUsersAndDevicesAccessControl_onceToken != -1) {
    dispatch_once(&allowAllUsersAndDevicesAccessControl_onceToken, &__block_literal_global_172421);
  }
  v2 = (void *)allowAllUsersAndDevicesAccessControl_accessControlPolicy;
  return v2;
}

void __73__HMDRemoteEventRouterAccessControl_allowAllUsersAndDevicesAccessControl__block_invoke()
{
  v0 = [[HMDRemoteEventRouterAccessControl alloc] initWithAllowedUserTypes:7 deviceCategories:3];
  v1 = (void *)allowAllUsersAndDevicesAccessControl_accessControlPolicy;
  allowAllUsersAndDevicesAccessControl_accessControlPolicy = (uint64_t)v0;
}

@end