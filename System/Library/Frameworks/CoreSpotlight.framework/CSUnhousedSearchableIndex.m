@interface CSUnhousedSearchableIndex
- (BOOL)attemptedIndexPathResolution;
- (CSIndexConnection)savedConnection;
- (CSUnhousedSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 path:(id)a5;
- (CSUnhousedSearchableIndex)initWithPath:(id)a3;
- (NSString)indexPath;
- (NSString)resolvedIndexPath;
- (const)defaultIndexPath;
- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5;
- (id)connection;
- (id)initialConnection;
- (id)xpc_dictionary_for_command:(const char *)a3 requiresInitialization:(BOOL)a4;
- (int)resolvedIndexPathErrorCode;
- (void)dealloc;
- (void)setAttemptedIndexPathResolution:(BOOL)a3;
- (void)setIndexPath:(id)a3;
- (void)setResolvedIndexPathErrorCode:(int)a3;
- (void)setSavedConnection:(id)a3;
@end

@implementation CSUnhousedSearchableIndex

void __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke(uint64_t a1)
{
  if (hasInternalCSEntitlement())
  {
    v2 = [*(id *)(a1 + 32) bundleIdentifier];

    if (v2)
    {
      v3 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke_cold_1();
      }

      v4 = *(void **)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) bundleIdentifier];
      xpc_dictionary_set_string(v4, "private-bundle-override", (const char *)[v5 UTF8String]);
    }
  }
}

- (void)dealloc
{
  +[CSUnhousedIndexConnection removeUnhousedIndexConnectionForToken:self->_resolvedIndexPath];
  [(CSUnhousedSearchableIndex *)self setSavedConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)CSUnhousedSearchableIndex;
  [(CSSearchableIndex *)&v3 dealloc];
}

- (void)setSavedConnection:(id)a3
{
}

- (id)xpc_dictionary_for_command:(const char *)a3 requiresInitialization:(BOOL)a4
{
  BOOL v4 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CSUnhousedSearchableIndex;
  v6 = -[CSSearchableIndex xpc_dictionary_for_command:requiresInitialization:](&v27, sel_xpc_dictionary_for_command_requiresInitialization_, a3);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke;
  v24 = &unk_1E5548FE0;
  v25 = self;
  id v7 = v6;
  id v26 = v7;
  if (xpc_dictionary_for_command_requiresInitialization__onceToken != -1) {
    dispatch_once(&xpc_dictionary_for_command_requiresInitialization__onceToken, &v21);
  }
  uint64_t v8 = [(CSUnhousedSearchableIndex *)self indexPath];
  if (v8
    && (v9 = (void *)v8,
        [(CSUnhousedSearchableIndex *)self resolvedIndexPath],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CSUnhousedSearchableIndex xpc_dictionary_for_command:requiresInitialization:](self);
    }

    xpc_dictionary_set_int64(v7, "re", [(CSUnhousedSearchableIndex *)self resolvedIndexPathErrorCode]);
  }
  else if (v4)
  {
    v11 = [(CSUnhousedSearchableIndex *)self resolvedIndexPath];
    if (v11)
    {
      id v12 = [(CSUnhousedSearchableIndex *)self resolvedIndexPath];
      v13 = (const char *)[v12 UTF8String];
    }
    else
    {
      v13 = [(CSUnhousedSearchableIndex *)self defaultIndexPath];
    }

    if (v13)
    {
      v15 = [(CSUnhousedSearchableIndex *)self connection];
      v16 = [v15 connection];
      uint64_t v17 = [(CSUnhousedSearchableIndex *)self addExtensionToken:v7 indexPath:v13 connection:v16];

      id v7 = (id)v17;
    }
  }
  v18 = v26;
  id v19 = v7;

  return v19;
}

- (NSString)indexPath
{
  return self->_indexPath;
}

- (NSString)resolvedIndexPath
{
  if (![(CSUnhousedSearchableIndex *)self attemptedIndexPathResolution])
  {
    unsigned int v8 = [(CSUnhousedSearchableIndex *)self resolvedIndexPathErrorCode];
    objc_super v3 = [(CSUnhousedSearchableIndex *)self indexPath];
    CSResolveUnhousedIndexPath(v3, (int *)&v8);
    BOOL v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    resolvedIndexPath = self->_resolvedIndexPath;
    self->_resolvedIndexPath = v4;

    [(CSUnhousedSearchableIndex *)self setResolvedIndexPathErrorCode:v8];
    [(CSUnhousedSearchableIndex *)self setAttemptedIndexPathResolution:1];
  }
  v6 = self->_resolvedIndexPath;

  return v6;
}

- (BOOL)attemptedIndexPathResolution
{
  return self->_attemptedIndexPathResolution;
}

- (id)connection
{
  savedConnection = self->_savedConnection;
  if (!savedConnection)
  {
    BOOL v4 = [(CSUnhousedSearchableIndex *)self initialConnection];
    id v5 = self->_savedConnection;
    self->_savedConnection = v4;

    savedConnection = self->_savedConnection;
  }
  v6 = savedConnection;

  return v6;
}

- (void)setResolvedIndexPathErrorCode:(int)a3
{
  self->_resolvedIndexPathErrorCode = a3;
}

- (void)setAttemptedIndexPathResolution:(BOOL)a3
{
  self->_attemptedIndexPathResolution = a3;
}

- (int)resolvedIndexPathErrorCode
{
  return self->_resolvedIndexPathErrorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_savedConnection, 0);

  objc_storeStrong((id *)&self->_resolvedIndexPath, 0);
}

- (CSUnhousedSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 path:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CSUnhousedSearchableIndex;
  v9 = [(CSSearchableIndex *)&v12 _initWithName:a3 protectionClass:a4 bundleIdentifier:0 options:0];
  v10 = v9;
  if (v9)
  {
    [(CSUnhousedSearchableIndex *)v9 setIndexPath:v8];
    [(CSUnhousedSearchableIndex *)v10 setAttemptedIndexPathResolution:0];
  }

  return v10;
}

- (CSUnhousedSearchableIndex)initWithPath:(id)a3
{
  return [(CSUnhousedSearchableIndex *)self initWithName:a3 protectionClass:0 path:a3];
}

- (id)initialConnection
{
  return 0;
}

- (const)defaultIndexPath
{
  return 0;
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  id v5 = a3;

  return v5;
}

- (void)setIndexPath:(id)a3
{
}

- (CSIndexConnection)savedConnection
{
  return self->_savedConnection;
}

- (void)xpc_dictionary_for_command:(void *)a1 requiresInitialization:.cold.1(void *a1)
{
  v1 = [a1 indexPath];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18D0E3000, v2, v3, "~~~ setting cs_unhoused_index_resolve_path_error, couldn't resolve %@", v4, v5, v6, v7, v8);
}

void __79__CSUnhousedSearchableIndex_xpc_dictionary_for_command_requiresInitialization___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18D0E3000, v0, v1, "~~~ setting cs_command_unhoused_index_bundle_override.", v2, v3, v4, v5, v6);
}

@end