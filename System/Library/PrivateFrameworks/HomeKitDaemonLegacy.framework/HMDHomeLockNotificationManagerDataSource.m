@interface HMDHomeLockNotificationManagerDataSource
- (BOOL)isResidentCapable;
@end

@implementation HMDHomeLockNotificationManagerDataSource

- (BOOL)isResidentCapable
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 isResidentCapable];

  return v3;
}

@end