@interface MCUIDataManagerLite
- (BOOL)isDeviceManagementHidden;
@end

@implementation MCUIDataManagerLite

- (BOOL)isDeviceManagementHidden
{
  return +[MCUIDataManager _isDeviceManagementHiddenConcrete];
}

@end