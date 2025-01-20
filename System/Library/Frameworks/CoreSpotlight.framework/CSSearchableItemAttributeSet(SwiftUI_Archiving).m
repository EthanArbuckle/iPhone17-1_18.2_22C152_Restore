@interface CSSearchableItemAttributeSet(SwiftUI_Archiving)
@end

@implementation CSSearchableItemAttributeSet(SwiftUI_Archiving)

- (void)setCachedViewData:()SwiftUI_Archiving .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Cached view is too large to index", v1, 2u);
}

@end