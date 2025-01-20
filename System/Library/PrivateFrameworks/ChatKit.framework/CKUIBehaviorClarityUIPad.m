@interface CKUIBehaviorClarityUIPad
- (BOOL)areBannersSupported;
- (BOOL)forcesUnknownFiltering;
- (BOOL)resetsIdleTimer;
- (BOOL)shouldUseSimpleTimestampsInTranscript;
- (id)theme;
@end

@implementation CKUIBehaviorClarityUIPad

- (id)theme
{
  if (theme_once_5967 != -1) {
    dispatch_once(&theme_once_5967, &__block_literal_global_5969);
  }
  v2 = (void *)theme_sBehavior_5966;

  return v2;
}

void __33__CKUIBehaviorClarityUIPad_theme__block_invoke()
{
  v0 = objc_alloc_init(CKUIThemeClarityUI);
  v1 = (void *)theme_sBehavior_5966;
  theme_sBehavior_5966 = (uint64_t)v0;
}

- (BOOL)areBannersSupported
{
  if (areBannersSupported_once_5971 != -1) {
    dispatch_once(&areBannersSupported_once_5971, &__block_literal_global_5973);
  }
  return 0;
}

- (BOOL)forcesUnknownFiltering
{
  if (forcesUnknownFiltering_once_5975 != -1) {
    dispatch_once(&forcesUnknownFiltering_once_5975, &__block_literal_global_5977);
  }
  return forcesUnknownFiltering_sBehavior_5974;
}

void __50__CKUIBehaviorClarityUIPad_forcesUnknownFiltering__block_invoke()
{
  forcesUnknownFiltering_sBehavior_5974 = 1;
}

- (BOOL)shouldUseSimpleTimestampsInTranscript
{
  if (shouldUseSimpleTimestampsInTranscript_once_5979 != -1) {
    dispatch_once(&shouldUseSimpleTimestampsInTranscript_once_5979, &__block_literal_global_5981);
  }
  return shouldUseSimpleTimestampsInTranscript_sBehavior_5978;
}

void __65__CKUIBehaviorClarityUIPad_shouldUseSimpleTimestampsInTranscript__block_invoke()
{
  shouldUseSimpleTimestampsInTranscript_sBehavior_5978 = 1;
}

- (BOOL)resetsIdleTimer
{
  if (resetsIdleTimer_once_5983 != -1) {
    dispatch_once(&resetsIdleTimer_once_5983, &__block_literal_global_5985);
  }
  return 0;
}

@end