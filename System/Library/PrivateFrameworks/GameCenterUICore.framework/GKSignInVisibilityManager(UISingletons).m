@interface GKSignInVisibilityManager(UISingletons)
+ (id)shared;
+ (id)sharedWithoutPersistence;
@end

@implementation GKSignInVisibilityManager(UISingletons)

+ (id)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_8);
  }
  v0 = (void *)shared_sharedInstance_0;
  return v0;
}

+ (id)sharedWithoutPersistence
{
  if (sharedWithoutPersistence_onceToken != -1) {
    dispatch_once(&sharedWithoutPersistence_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)sharedWithoutPersistence_sharedInstance;
  return v0;
}

@end