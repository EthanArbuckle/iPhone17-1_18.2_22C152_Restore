@interface CSHashtagQuery
- (CSHashtagQuery)initWithQueryString:(id)a3 bundleIDs:(id)a4;
- (CSHashtagQuery)initWithQueryString:(id)a3 context:(id)a4;
- (id)hashTagCompletionHandler;
- (void)handleCompletion:(id)a3;
- (void)handleFoundAttributes:(id)a3 values:(id)a4 attributesHandler:(id)a5;
- (void)setHashTagCompletionHandler:(id)a3;
@end

@implementation CSHashtagQuery

- (CSHashtagQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[CSHashtagQuery initWithQueryString:context:]();
  }
  v8 = v7;
  if (!v7) {
    -[CSHashtagQuery initWithQueryString:context:]();
  }
  v9 = [v7 fetchAttributes];
  if ([v9 isEqualToArray:&unk_1EDBD6250])
  {
    char v10 = [v8 attribute];

    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  v11 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CSHashtagQuery initWithQueryString:context:].cold.5(v11);
  }

  [v8 setFetchAttributes:&unk_1EDBD6268];
  [v8 setAttribute:1];
LABEL_10:
  if ([v8 live])
  {
    v12 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CSHashtagQuery initWithQueryString:context:].cold.4(v12);
    }

    [v8 setLive:0];
  }
  v13 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CSHashtagQuery initWithQueryString:context:]((uint64_t)v6, v13);
  }

  v18.receiver = self;
  v18.super_class = (Class)CSHashtagQuery;
  v14 = [(CSSearchQuery *)&v18 initWithQueryString:v6 context:v8];
  if (v14)
  {
    uint64_t v15 = objc_opt_new();
    hashtags = v14->_hashtags;
    v14->_hashtags = (NSMutableSet *)v15;
  }
  return v14;
}

- (CSHashtagQuery)initWithQueryString:(id)a3 bundleIDs:(id)a4
{
  id v6 = (__CFString *)a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"kMDItemHashtags=*";
  }
  id v8 = a4;
  v9 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CSHashtagQuery initWithQueryString:bundleIDs:]((uint64_t)v7, v9);
  }

  char v10 = objc_opt_new();
  [v10 setBundleIDs:v8];

  [v10 setFetchAttributes:&unk_1EDBD6280];
  [v10 setAttribute:1];
  [v10 setUserQuery:v7];
  [v10 setLowPriority:0];
  v11 = [(CSHashtagQuery *)self initWithQueryString:v7 context:v10];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    hashtags = v11->_hashtags;
    v11->_hashtags = (NSMutableSet *)v12;
  }
  return v11;
}

- (void)handleFoundAttributes:(id)a3 values:(id)a4 attributesHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v17 = [(CSSearchQuery *)self queryString];
    *(_DWORD *)buf = 138412802;
    v25 = v17;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_debug_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_DEBUG, "Query %@, returned values for attribute %@: %@", buf, 0x20u);
  }
  if ([v8 isEqualToString:@"kMDItemHashtags"])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          [(NSMutableSet *)self->_hashtags addObject:*(void *)(*((void *)&v19 + 1) + 8 * v16++)];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CSHashtagQuery;
  [(CSSearchQuery *)&v18 handleFoundAttributes:v8 values:v9 attributesHandler:v10];
}

- (void)handleCompletion:(id)a3
{
  id v4 = a3;
  v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(CSHashtagQuery *)(uint64_t)v4 handleCompletion:v5];
  }

  id v6 = [(CSHashtagQuery *)self hashTagCompletionHandler];

  if (v6)
  {
    id v7 = [(CSHashtagQuery *)self hashTagCompletionHandler];
    ((void (**)(void, NSMutableSet *, id))v7)[2](v7, self->_hashtags, v4);
  }
  v8.receiver = self;
  v8.super_class = (Class)CSHashtagQuery;
  [(CSSearchQuery *)&v8 handleCompletion:v4];
}

- (id)hashTagCompletionHandler
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setHashTagCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashTagCompletionHandler, 0);

  objc_storeStrong((id *)&self->_hashtags, 0);
}

- (void)initWithQueryString:context:.cold.1()
{
}

- (void)initWithQueryString:context:.cold.2()
{
}

- (void)initWithQueryString:(uint64_t)a1 context:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "initWithQueryString: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithQueryString:(os_log_t)log context:.cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Error in setting queryContext's live option. This is not supported, resetting to NO.", v1, 2u);
}

- (void)initWithQueryString:(os_log_t)log context:.cold.5(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Error in setting queryContext's fetchAttributes or attribute, resetting them.", v1, 2u);
}

- (void)initWithQueryString:(uint64_t)a1 bundleIDs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "queryString: %@", (uint8_t *)&v2, 0xCu);
}

- (void)handleCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "Received completion %@ for query: %@", (uint8_t *)&v3, 0x16u);
}

@end