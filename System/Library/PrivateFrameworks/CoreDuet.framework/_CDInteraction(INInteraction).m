@interface _CDInteraction(INInteraction)
@end

@implementation _CDInteraction(INInteraction)

- (void)initWithINInteraction:()INInteraction bundleID:nsUserName:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Interaction missing identifier - automatically adding one", v1, 2u);
}

- (void)initWithINInteraction:()INInteraction bundleID:nsUserName:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "initWithINInteraction:%@ bundleID:%@", (uint8_t *)&v3, 0x16u);
}

@end