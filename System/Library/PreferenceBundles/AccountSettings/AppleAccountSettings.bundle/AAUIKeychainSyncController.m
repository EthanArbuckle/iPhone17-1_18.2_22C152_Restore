@interface AAUIKeychainSyncController
+ (BOOL)isKeychainSyncEnabled;
@end

@implementation AAUIKeychainSyncController

+ (BOOL)isKeychainSyncEnabled
{
  return +[CDPKeychainSync isUserVisibleKeychainSyncEnabled];
}

@end