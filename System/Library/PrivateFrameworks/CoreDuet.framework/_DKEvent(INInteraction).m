@interface _DKEvent(INInteraction)
- (void)interaction;
@end

@implementation _DKEvent(INInteraction)

+ (void)relatedContactIdentifiersFromIntent:()INInteraction .cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_18ECEB000, v1, OS_LOG_TYPE_DEBUG, "Found contact identifiers of %@ from intent: %@", v2, 0x16u);
}

- (void)interaction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [a1 stream];
  uint64_t v4 = [v3 name];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Cannot convert event of stream %@ to INInteraction", v5, 0xCu);
}

- (void)fetchInteractionWithPopulatedKeyImage:()INInteraction .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchInteractionWithPopulatedKeyImage:()INInteraction .cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Error unarchiving interaction key image: %@", v1, 0xCu);
}

@end