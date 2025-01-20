@interface CKUIBehaviorClarityUIPhone
- (BOOL)areBannersSupported;
- (BOOL)forcesUnknownFiltering;
- (BOOL)resetsIdleTimer;
- (BOOL)shouldUseSimpleTimestampsInTranscript;
- (id)theme;
@end

@implementation CKUIBehaviorClarityUIPhone

- (id)theme
{
  if (theme_once_5942 != -1) {
    dispatch_once(&theme_once_5942, &__block_literal_global_5944);
  }
  v2 = (void *)theme_sBehavior_5941;

  return v2;
}

void __35__CKUIBehaviorClarityUIPhone_theme__block_invoke()
{
  v0 = objc_alloc_init(CKUIThemeClarityUI);
  v1 = (void *)theme_sBehavior_5941;
  theme_sBehavior_5941 = (uint64_t)v0;
}

- (BOOL)areBannersSupported
{
  if (areBannersSupported_once_5947 != -1) {
    dispatch_once(&areBannersSupported_once_5947, &__block_literal_global_5949);
  }
  return 0;
}

- (BOOL)forcesUnknownFiltering
{
  if (forcesUnknownFiltering_once_5951 != -1) {
    dispatch_once(&forcesUnknownFiltering_once_5951, &__block_literal_global_5953);
  }
  return forcesUnknownFiltering_sBehavior_5950;
}

void __52__CKUIBehaviorClarityUIPhone_forcesUnknownFiltering__block_invoke()
{
  forcesUnknownFiltering_sBehavior_5950 = 1;
}

- (BOOL)shouldUseSimpleTimestampsInTranscript
{
  if (shouldUseSimpleTimestampsInTranscript_once_5955 != -1) {
    dispatch_once(&shouldUseSimpleTimestampsInTranscript_once_5955, &__block_literal_global_5957);
  }
  return shouldUseSimpleTimestampsInTranscript_sBehavior_5954;
}

void __67__CKUIBehaviorClarityUIPhone_shouldUseSimpleTimestampsInTranscript__block_invoke()
{
  shouldUseSimpleTimestampsInTranscript_sBehavior_5954 = 1;
}

- (BOOL)resetsIdleTimer
{
  if (resetsIdleTimer_once_5959 != -1) {
    dispatch_once(&resetsIdleTimer_once_5959, &__block_literal_global_5961);
  }
  return 0;
}

@end