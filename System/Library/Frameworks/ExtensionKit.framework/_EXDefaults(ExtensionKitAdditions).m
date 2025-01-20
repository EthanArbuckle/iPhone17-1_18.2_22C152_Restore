@interface _EXDefaults(ExtensionKitAdditions)
- (double)debugDelayBeforeRequestingRemoteViewController;
- (double)defaultPlaceholderDelayBeforeShowingLoadingIndicator;
- (double)defaultRetryFailedSessionDelay;
- (uint64_t)defaultPlaceholderViewControllerShowsState;
- (uint64_t)viewBridgeSupportsCatalystExtensions;
@end

@implementation _EXDefaults(ExtensionKitAdditions)

- (uint64_t)defaultPlaceholderViewControllerShowsState
{
  if (defaultPlaceholderViewControllerShowsState_onceToken[0] != -1) {
    dispatch_once(defaultPlaceholderViewControllerShowsState_onceToken, &__block_literal_global_2);
  }
  return defaultPlaceholderViewControllerShowsState_value;
}

- (double)defaultPlaceholderDelayBeforeShowingLoadingIndicator
{
  return 0.1;
}

- (double)debugDelayBeforeRequestingRemoteViewController
{
  return 0.0;
}

- (uint64_t)viewBridgeSupportsCatalystExtensions
{
  return 0;
}

- (double)defaultRetryFailedSessionDelay
{
  return 1.0;
}

@end