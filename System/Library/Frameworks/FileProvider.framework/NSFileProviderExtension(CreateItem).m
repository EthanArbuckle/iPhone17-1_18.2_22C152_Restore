@interface NSFileProviderExtension(CreateItem)
@end

@implementation NSFileProviderExtension(CreateItem)

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] item type mismatch, cannot be the same items", v2, v3, v4, v5, v6);
}

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.2()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] document size mismatch, cannot be the same items", v2, v3, v4, v5, v6);
}

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.3()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] package content mismatch, cannot be the same items", v2, v3, v4, v5, v6);
}

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.4()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] mtime mismatch, cannot be the same items", v2, v3, v4, v5, v6);
}

@end