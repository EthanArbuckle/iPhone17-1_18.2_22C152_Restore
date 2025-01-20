@interface AKFLFollowUpController
+ (id)sharedInstance;
@end

@implementation AKFLFollowUpController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_controller;

  return v2;
}

uint64_t __40__AKFLFollowUpController_sharedInstance__block_invoke()
{
  FLFollowUpControllerClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpControllerClass) {
    FLFollowUpControllerClass = (objc_class *)getFLFollowUpControllerClass();
  }
  sharedInstance_controller = [[FLFollowUpControllerClass alloc] initWithClientIdentifier:@"com.apple.authkit"];

  return MEMORY[0x1F41817F8]();
}

@end