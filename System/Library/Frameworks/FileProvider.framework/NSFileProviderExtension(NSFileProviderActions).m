@interface NSFileProviderExtension(NSFileProviderActions)
@end

@implementation NSFileProviderExtension(NSFileProviderActions)

- (void)importDocumentAtURL:()NSFileProviderActions toParentItemIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_16_0();
  id v1 = (id)objc_opt_class();
  v2 = (const char *)OUTLINED_FUNCTION_4_6();
  v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v4, v5, "[ERROR] %@ must implement method %@ and not call super", v6, v7, v8, v9, v10);
}

- (void)setLastUsedDate:()NSFileProviderActions forItemIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_16_0();
  id v1 = (id)objc_opt_class();
  v2 = (const char *)OUTLINED_FUNCTION_4_6();
  v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v4, v5, "[DEBUG] %@ must implement method %@ and not call super", v6, v7, v8, v9, v10);
}

@end