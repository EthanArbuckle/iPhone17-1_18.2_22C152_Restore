@interface CSUnhousedUserQuery
+ (void)preheat:(id)a3 path:(id)a4;
+ (void)prepareProtectionClasses:(id)a3 path:(id)a4;
+ (void)prepareWithPath:(id)a3;
- (CSSearchConnection)savedConnection;
- (CSUnhousedUserQuery)initWithPath:(id)a3 userQueryString:(id)a4 queryContext:(id)a5;
- (CSUnhousedUserQuery)initWithPath:(id)a3 userQueryString:(id)a4 userQueryContext:(id)a5;
- (CSUnhousedUserQuery)initWithUserAttributedQueryString:(id)a3 userQueryContext:(id)a4 path:(id)a5;
- (CSUnhousedUserQuery)initWithUserQueryString:(id)a3 userQueryContext:(id)a4 path:(id)a5;
- (NSString)indexPath;
- (NSString)resolvedIndexPath;
- (id)connection;
- (id)initialConnection;
- (void)resolvedIndexPath;
- (void)setIndexPath:(id)a3;
- (void)setSavedConnection:(id)a3;
- (void)start;
- (void)updateRecentSuggestions:(id)a3 path:(id)a4;
- (void)userEngagedWithResult:(id)a3 visibleResults:(id)a4 interactionType:(int)a5 path:(id)a6;
- (void)userEngagedWithSuggestion:(id)a3 visibleSuggestions:(id)a4 interactionType:(int)a5 path:(id)a6;
@end

@implementation CSUnhousedUserQuery

+ (void)prepareWithPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F28378];
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(a1, "prepareProtectionClasses:path:", v6, v5, v7, v8);
}

+ (void)preheat:(id)a3 path:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_error_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_ERROR, "Shouldn't call preheat on CSUnhousedUserQuery: %@", (uint8_t *)&v8, 0xCu);
  }

  __assert_rtn("+[CSUnhousedUserQuery preheat:path:]", "CSUserQuery.m", 2820, "0");
}

+ (void)prepareProtectionClasses:(id)a3 path:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_error_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_ERROR, "Shouldn't call prepareProtectionClasses on CSUnhousedUserQuery: %@", (uint8_t *)&v8, 0xCu);
  }

  __assert_rtn("+[CSUnhousedUserQuery prepareProtectionClasses:path:]", "CSUserQuery.m", 2826, "0");
}

- (CSUnhousedUserQuery)initWithUserAttributedQueryString:(id)a3 userQueryContext:(id)a4 path:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CSUnhousedUserQuery;
  id v9 = [(CSUserQuery *)&v12 initWithUserAttributedQueryString:a3 userQueryContext:a4];
  uint64_t v10 = v9;
  if (v9) {
    [(CSUnhousedUserQuery *)v9 setIndexPath:v8];
  }

  return v10;
}

- (CSUnhousedUserQuery)initWithUserQueryString:(id)a3 userQueryContext:(id)a4 path:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CSUnhousedUserQuery;
  id v9 = [(CSUserQuery *)&v12 initWithUserQueryString:a3 userQueryContext:a4];
  uint64_t v10 = v9;
  if (v9) {
    [(CSUnhousedUserQuery *)v9 setIndexPath:v8];
  }

  return v10;
}

- (id)initialConnection
{
  return 0;
}

- (id)connection
{
  savedConnection = self->_savedConnection;
  if (!savedConnection)
  {
    v4 = [(CSUnhousedUserQuery *)self initialConnection];
    id v5 = self->_savedConnection;
    self->_savedConnection = v4;

    savedConnection = self->_savedConnection;
  }
  id v6 = savedConnection;

  return v6;
}

- (NSString)resolvedIndexPath
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  resolvedIndexPath = self->_resolvedIndexPath;
  if (!resolvedIndexPath)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_resolvedIndexPath)
    {
      int v14 = 0;
      id v6 = [(CSUnhousedUserQuery *)v4 indexPath];
      CSResolveUnhousedIndexPath(v6, &v14);
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v8 = self->_resolvedIndexPath;
      self->_resolvedIndexPath = v7;

      id v9 = [(CSUnhousedUserQuery *)v4 indexPath];
      if (v9)
      {
        BOOL v10 = self->_resolvedIndexPath == 0;

        if (v10)
        {
          v11 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            int v12 = v14;
            v13 = [(CSUnhousedUserQuery *)v4 indexPath];
            [(CSUnhousedUserQuery *)v13 resolvedIndexPath];
          }
        }
      }
    }
    objc_sync_exit(v4);

    resolvedIndexPath = self->_resolvedIndexPath;
  }

  return resolvedIndexPath;
}

- (void)start
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSUnhousedUserQuery *)self indexPath];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(CSUnhousedUserQuery *)self resolvedIndexPath];
    if (v5)
    {
    }
    else
    {
      id v6 = [(CSSearchQuery *)self completionHandler];

      if (v6)
      {
        uint64_t v7 = NSString;
        id v8 = [(CSUnhousedUserQuery *)self indexPath];
        id v9 = [v7 stringWithFormat:@"Couldn't resolve index path: \"%@\"", v8];

        BOOL v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28568];
        v15[0] = v9;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
        int v12 = [v10 errorWithDomain:@"CSSearchQueryErrorDomain" code:-2001 userInfo:v11];
        [(CSUserQuery *)self handleCompletion:v12];

        return;
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CSUnhousedUserQuery;
  [(CSUserQuery *)&v13 start];
}

- (CSUnhousedUserQuery)initWithPath:(id)a3 userQueryString:(id)a4 userQueryContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CSUnhousedUserQuery initWithPath:userQueryString:userQueryContext:]();
  }

  int v12 = [(CSUnhousedUserQuery *)self initWithUserQueryString:v9 userQueryContext:v8 path:v10];
  return v12;
}

- (CSUnhousedUserQuery)initWithPath:(id)a3 userQueryString:(id)a4 queryContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CSUnhousedUserQuery initWithPath:userQueryString:queryContext:]();
  }

  v14.receiver = self;
  v14.super_class = (Class)CSUnhousedUserQuery;
  int v12 = [(CSUserQuery *)&v14 initWithUserQueryString:v10 queryContext:v9];

  if (v12) {
    [(CSUnhousedUserQuery *)v12 setIndexPath:v8];
  }

  return v12;
}

- (void)userEngagedWithResult:(id)a3 visibleResults:(id)a4 interactionType:(int)a5 path:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a4;
  id v10 = a3;
  v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CSUnhousedUserQuery userEngagedWithResult:visibleResults:interactionType:path:]();
  }

  [(CSUserQuery *)self userEngagedWithResult:v10 visibleResults:v9 interactionType:v6];
}

- (void)userEngagedWithSuggestion:(id)a3 visibleSuggestions:(id)a4 interactionType:(int)a5 path:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a4;
  id v10 = a3;
  v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CSUnhousedUserQuery userEngagedWithSuggestion:visibleSuggestions:interactionType:path:]();
  }

  [(CSUserQuery *)self userEngagedWithSuggestion:v10 visibleSuggestions:v9 interactionType:v6];
}

- (void)updateRecentSuggestions:(id)a3 path:(id)a4
{
  id v5 = a3;
  uint64_t v6 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CSUnhousedUserQuery updateRecentSuggestions:path:]();
  }

  [(CSUserQuery *)self updateRecentSuggestions:v5];
}

- (NSString)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (CSSearchConnection)savedConnection
{
  return self->_savedConnection;
}

- (void)setSavedConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedConnection, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_resolvedIndexPath, 0);
}

- (void)resolvedIndexPath
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a1;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "CSUnhousedUserQuery couldn't resolve index path. error:%d path:%@", buf, 0x12u);
}

- (void)initWithPath:userQueryString:userQueryContext:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "-[CSUnhousedUserQuery initWithPath:userQueryString:userQueryContext:] is deprecated", v2, v3, v4, v5, v6);
}

- (void)initWithPath:userQueryString:queryContext:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "-[CSUnhousedUserQuery initWithPath:userQueryString:queryContext:] is deprecated", v2, v3, v4, v5, v6);
}

- (void)userEngagedWithResult:visibleResults:interactionType:path:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "-[CSUnhousedUserQuery userEngagedWithResult:visibleResults:interactionType:path:] is deprecated", v2, v3, v4, v5, v6);
}

- (void)userEngagedWithSuggestion:visibleSuggestions:interactionType:path:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "-[CSUnhousedUserQuery userEngagedWithSuggestion:visibleSuggestions:interactionType:path:] is deprecated", v2, v3, v4, v5, v6);
}

- (void)updateRecentSuggestions:path:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "-[CSUnhousedUserQuery updateRecentSuggestions:path:] is deprecated", v2, v3, v4, v5, v6);
}

@end