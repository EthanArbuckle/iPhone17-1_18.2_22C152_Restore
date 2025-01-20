@interface AKFollowUpProviderFactory
+ (id)sharedAuthKitFollowupProvider;
@end

@implementation AKFollowUpProviderFactory

+ (id)sharedAuthKitFollowupProvider
{
  if (sharedAuthKitFollowupProvider_onceToken != -1) {
    dispatch_once(&sharedAuthKitFollowupProvider_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedAuthKitFollowupProvider_followupController;

  return v2;
}

void __58__AKFollowUpProviderFactory_sharedAuthKitFollowupProvider__block_invoke()
{
  v0 = [AKFollowUpController alloc];
  id v3 = +[AKFLFollowUpController sharedInstance];
  uint64_t v1 = [(AKFollowUpController *)v0 initWithFLFollowupController:v3];
  v2 = (void *)sharedAuthKitFollowupProvider_followupController;
  sharedAuthKitFollowupProvider_followupController = v1;
}

@end