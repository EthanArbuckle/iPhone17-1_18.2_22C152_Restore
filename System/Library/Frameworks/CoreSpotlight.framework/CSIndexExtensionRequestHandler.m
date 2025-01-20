@interface CSIndexExtensionRequestHandler
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)searchableIndexDidFinishThrottle:(id)a3;
- (void)searchableIndexDidThrottle:(id)a3;
@end

@implementation CSIndexExtensionRequestHandler

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "dealloc, %@", (uint8_t *)&v2, 0xCu);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5 = a3;
  v6 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CSIndexExtensionRequestHandler beginRequestWithExtensionContext:](a2);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setRequestHandler:self];
  }
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(void))a4;
  v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    int v9 = 138412546;
    v10 = v8;
    __int16 v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEFAULT, "%@ called on %@", (uint8_t *)&v9, 0x16u);
  }
  v6[2](v6);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(void))a5;
  v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    __int16 v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = self;
    _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEFAULT, "%@ called on %@", (uint8_t *)&v10, 0x16u);
  }
  v7[2](v7);
}

- (void)searchableIndexDidThrottle:(id)a3
{
  uint64_t v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CSIndexExtensionRequestHandler searchableIndexDidThrottle:](a2);
  }
}

- (void)searchableIndexDidFinishThrottle:(id)a3
{
  uint64_t v4 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CSIndexExtensionRequestHandler searchableIndexDidThrottle:](a2);
  }
}

- (void)beginRequestWithExtensionContext:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v2, v3, "%@ called with context:%@", v4, v5, v6, v7, v8);
}

- (void)searchableIndexDidThrottle:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v2, v3, "%@ called on %@", v4, v5, v6, v7, v8);
}

@end