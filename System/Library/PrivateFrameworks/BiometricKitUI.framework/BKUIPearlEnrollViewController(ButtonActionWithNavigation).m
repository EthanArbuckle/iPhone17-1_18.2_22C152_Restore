@interface BKUIPearlEnrollViewController(ButtonActionWithNavigation)
@end

@implementation BKUIPearlEnrollViewController(ButtonActionWithNavigation)

- (void)updatePeriocularEnrollmentSettings:()ButtonActionWithNavigation .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 localizedDescription];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1E4B6C000, a3, OS_LOG_TYPE_ERROR, "Update Periocular Enrollment Settings Error:%@ Context:%@", (uint8_t *)&v6, 0x16u);
}

@end