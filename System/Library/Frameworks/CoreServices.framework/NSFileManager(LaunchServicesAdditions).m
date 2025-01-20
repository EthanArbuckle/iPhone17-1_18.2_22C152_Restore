@interface NSFileManager(LaunchServicesAdditions)
+ (id)_LS_frameworkFileManager;
@end

@implementation NSFileManager(LaunchServicesAdditions)

+ (id)_LS_frameworkFileManager
{
  if (_LS_frameworkFileManager_onceToken != -1) {
    dispatch_once(&_LS_frameworkFileManager_onceToken, &__block_literal_global_82);
  }
  v0 = (void *)_LS_frameworkFileManager_manager;

  return v0;
}

@end