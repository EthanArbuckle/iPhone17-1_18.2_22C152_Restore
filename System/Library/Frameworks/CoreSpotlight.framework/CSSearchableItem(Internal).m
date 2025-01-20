@interface CSSearchableItem(Internal)
@end

@implementation CSSearchableItem(Internal)

- (void)_standardizeFileProvider:()Internal .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Could not get properties from contentURL: %@ (error: %@)", (uint8_t *)&v3, 0x16u);
}

- (void)_standardizeExternalAnalysisTags:()Internal forAttributeSet:primaryAttribute:analysisAttributes:specializedAttributes:standardizeBlock:.cold.1()
{
  __assert_rtn("-[CSSearchableItem(Internal) _standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttributes:specializedAttributes:standardizeBlock:]", "CSSearchableItem.m", 1315, "analysisAttributes.count == 4");
}

- (void)_standardizeExtractedNumericEntities:()Internal .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_standardizeExtractedNumericEntities:()Internal .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_standardizeExtractedNumericEntities:()Internal .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_fixBrokenAuthorNames:()Internal .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = objc_opt_class();
  *a3 = @"kMDItemRecipients";
  id v5 = OUTLINED_FUNCTION_0_2(v4);
  OUTLINED_FUNCTION_2_1(&dword_18D0E3000, v6, v7, "Invalid type:%@ for attribute:%@", v8, v9, v10, v11, v12);
}

- (void)_fixBrokenAuthorNames:()Internal .cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = objc_opt_class();
  *a3 = @"kMDItemAuthors";
  id v5 = OUTLINED_FUNCTION_0_2(v4);
  OUTLINED_FUNCTION_2_1(&dword_18D0E3000, v6, v7, "Invalid type:%@ for attribute:%@", v8, v9, v10, v11, v12);
}

@end