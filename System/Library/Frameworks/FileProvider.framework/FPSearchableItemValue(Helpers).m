@interface FPSearchableItemValue(Helpers)
@end

@implementation FPSearchableItemValue(Helpers)

+ (void)stringArrayFromObject:()Helpers .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Tried parsing array of strings for FPItem userInfo, but one entry was not a string, but %@", (uint8_t *)&v2, 0xCu);
}

@end