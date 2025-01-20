@interface CSUserQuery(CSInstantAnswer)
@end

@implementation CSUserQuery(CSInstantAnswer)

- (void)handleFoundInstantAnswer:()CSInstantAnswer .cold.1()
{
  OUTLINED_FUNCTION_7();
  v2 = v1;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [v1 count];
  OUTLINED_FUNCTION_1_0();
  __int16 v5 = v3;
  v6 = v2;
  _os_log_debug_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_DEBUG, "Received %lu instant answers for query: %@, instant answers:\n%@", v4, 0x20u);
}

@end