@interface TKTokenAccessDBBackedByUserDefaults
- (TKTokenAccessDBBackedByUserDefaults)init;
- (id)_keyRefForRequest:(id)a3;
- (int64_t)fetchAccessForRequest:(id)a3;
- (void)clearAllAccessRecords;
- (void)storeAccess:(int64_t)a3 forRequest:(id)a4;
@end

@implementation TKTokenAccessDBBackedByUserDefaults

- (TKTokenAccessDBBackedByUserDefaults)init
{
  v10.receiver = self;
  v10.super_class = (Class)TKTokenAccessDBBackedByUserDefaults;
  v2 = [(TKTokenAccessDBBackedByUserDefaults *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.ctkd.access-db"];
    db = v2->_db;
    v2->_db = (NSUserDefaults *)v3;
  }
  v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TKTokenAccessDBBackedByUserDefaults_init__block_invoke;
  block[3] = &unk_1E63C80E0;
  v6 = v2;
  v9 = v6;
  dispatch_async(v5, block);

  return v6;
}

void __43__TKTokenAccessDBBackedByUserDefaults_init__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v1 = [*(id *)(*(void *)(a1 + 32) + 8) dictionaryRepresentation];
  v2 = [v1 allKeys];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138412290;
    long long v15 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(v8, "rangeOfString:", @",", v15);
        if (v9) {
          BOOL v10 = v9 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          v11 = objc_msgSend(v8, "substringWithRange:", 0, v9);
          if ([v11 length])
          {
            v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
            char v13 = [v12 applicationIsInstalled:v11];

            if ((v13 & 1) == 0)
            {
              [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v8];
              if (TK_LOG_token_access_registry_once != -1) {
                dispatch_once(&TK_LOG_token_access_registry_once, &__block_literal_global_1);
              }
              v14 = TK_LOG_token_access_registry_log;
              if (os_log_type_enabled((os_log_t)TK_LOG_token_access_registry_log, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v15;
                v22 = v11;
                _os_log_debug_impl(&dword_1BED55000, v14, OS_LOG_TYPE_DEBUG, "'%@' removed from token registry DB", buf, 0xCu);
              }
            }
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
}

- (int64_t)fetchAccessForRequest:(id)a3
{
  long long v4 = [(TKTokenAccessDBBackedByUserDefaults *)self _keyRefForRequest:a3];
  uint64_t v5 = [(NSUserDefaults *)self->_db objectForKey:v4];

  if (v5)
  {
    if ([(NSUserDefaults *)self->_db BOOLForKey:v4]) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)storeAccess:(int64_t)a3 forRequest:(id)a4
{
  if (a3)
  {
    id v6 = [(TKTokenAccessDBBackedByUserDefaults *)self _keyRefForRequest:a4];
    [(NSUserDefaults *)self->_db setBool:a3 == 1 forKey:v6];
  }
}

- (void)clearAllAccessRecords
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(NSUserDefaults *)self->_db dictionaryRepresentation];
  long long v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSUserDefaults *)self->_db removeObjectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_keyRefForRequest:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 clientBundleID];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_1F19EDBB0;
  }
  uint64_t v8 = [v4 tokenID];

  long long v9 = [v8 classID];
  long long v10 = [v3 stringWithFormat:@"%@,%@", v7, v9];

  return v10;
}

- (void).cxx_destruct
{
}

@end