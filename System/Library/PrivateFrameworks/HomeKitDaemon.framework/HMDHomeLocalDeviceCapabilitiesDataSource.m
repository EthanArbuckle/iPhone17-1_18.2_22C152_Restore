@interface HMDHomeLocalDeviceCapabilitiesDataSource
- (BOOL)isCompanionCapable;
- (BOOL)isResidentCapable;
- (BOOL)supportsAddingAccessory;
- (BOOL)supportsBulletinBoard;
- (BOOL)supportsHomeInvitation;
- (BOOL)supportsHomeKitDataStream;
- (BOOL)supportsHomeNotificationEnablement;
- (BOOL)supportsRemoteAccess;
- (BOOL)supportsSiriUnsecuringActionsWithNoPasscode;
- (BOOL)supportsSiriUnsecuringActionsWithWatchAuth;
@end

@implementation HMDHomeLocalDeviceCapabilitiesDataSource

- (BOOL)supportsSiriUnsecuringActionsWithNoPasscode
{
  return +[HMDDeviceCapabilities supportsSiriUnsecuringActionsWithNoPasscode];
}

- (BOOL)supportsSiriUnsecuringActionsWithWatchAuth
{
  return +[HMDDeviceCapabilities supportsSiriUnsecuringActionsWithWatchAuth];
}

- (BOOL)supportsBulletinBoard
{
  return +[HMDDeviceCapabilities supportsBulletinBoard];
}

- (BOOL)isCompanionCapable
{
  return +[HMDDeviceCapabilities isCompanionCapable];
}

- (BOOL)supportsHomeNotificationEnablement
{
  return +[HMDDeviceCapabilities supportsRemoteAccess];
}

- (BOOL)supportsAddingAccessory
{
  return +[HMDDeviceCapabilities supportsAddingAccessory];
}

- (BOOL)supportsRemoteAccess
{
  return +[HMDDeviceCapabilities supportsRemoteAccess];
}

- (BOOL)supportsHomeInvitation
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 supportsHomeInvitation];

  return v3;
}

- (BOOL)isResidentCapable
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 isResidentCapable];

  return v3;
}

- (BOOL)supportsHomeKitDataStream
{
  return +[HMDDeviceCapabilities supportsHomeKitDataStream];
}

@end