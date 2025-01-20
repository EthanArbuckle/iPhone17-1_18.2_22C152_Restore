@interface ISAliasIcon(Factory)
@end

@implementation ISAliasIcon(Factory)

+ (void)_iconForValues:()Factory .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "Creating kUnknownFSObjectIcon icon bookmark", v2, v3, v4, v5, v6);
}

+ (void)_iconForValues:()Factory .cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "Creating Bundle Identifier icon for bookmark", v2, v3, v4, v5, v6);
}

+ (void)_iconForValues:()Factory .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Creating File Extension icon for package bookmark: %@ ", (uint8_t *)&v2, 0xCu);
}

+ (void)_iconForValues:()Factory .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Creating File Extension icon for file bookmark: %@ ", (uint8_t *)&v2, 0xCu);
}

+ (void)_iconForValues:()Factory .cold.5()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1AE771000, v1, OS_LOG_TYPE_DEBUG, "Identified custom folder type %@ for URL: %@", v2, 0x16u);
}

+ (void)_iconForValues:()Factory .cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "Creating Folder icon  for bookmark", v2, v3, v4, v5, v6);
}

@end