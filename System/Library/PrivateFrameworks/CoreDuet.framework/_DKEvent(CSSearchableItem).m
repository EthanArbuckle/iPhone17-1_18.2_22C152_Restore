@interface _DKEvent(CSSearchableItem)
@end

@implementation _DKEvent(CSSearchableItem)

+ (void)eventRepresentingUserActivityWithSearchableItem:()CSSearchableItem bundleIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Failed to retrieve activityString for Safari visit.", v1, 2u);
}

+ (void)eventRepresentingUserActivityWithSearchableItem:()CSSearchableItem bundleIdentifier:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "URL is not valid %@", (uint8_t *)&v2, 0xCu);
}

@end