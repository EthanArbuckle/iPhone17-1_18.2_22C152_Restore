@interface _DKEvent(INRelevantShortcut)
- (void)relevantShortcut;
@end

@implementation _DKEvent(INRelevantShortcut)

+ (void)eventWithRelevantShortcut:()INRelevantShortcut bundleID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error archiving relevant shortcut: %@", v2, v3, v4, v5, v6);
}

- (void)relevantShortcut
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 stream];
  uint64_t v4 = [v3 name];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Failure to convert event of stream %@ to a relevant shortcut", v5, 0xCu);
}

@end