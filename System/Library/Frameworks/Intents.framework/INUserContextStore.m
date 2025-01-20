@interface INUserContextStore
+ (id)findDataInValue:(id)a3;
+ (id)keyForBundleIdentifier:(id)a3 andType:(int64_t)a4;
+ (id)keyPrefixForType:(int64_t)a3;
+ (id)sharedStore;
- (id)_init;
- (id)_initWithKnowledgeStore:(id)a3;
- (void)removeUserContextOfClass:(Class)a3 forBundleIdentifier:(id)a4;
- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4;
- (void)storeUserContextViaHelper:(id)a3 forBundleIdentifier:(id)a4;
- (void)userContextOfClass:(Class)a3 forBundleIdentifiers:(id)a4 withCompletion:(id)a5;
- (void)userContextOfClass:(Class)a3 withCompletion:(id)a4;
@end

@implementation INUserContextStore

- (void).cxx_destruct
{
}

- (id)_initWithKnowledgeStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUserContextStore;
  v6 = [(INUserContextStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
  }

  return v7;
}

- (id)_init
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getCKKnowledgeStoreClass_softClass;
  uint64_t v12 = getCKKnowledgeStoreClass_softClass;
  if (!getCKKnowledgeStoreClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getCKKnowledgeStoreClass_block_invoke;
    v8[3] = &unk_1E5520EB8;
    v8[4] = &v9;
    __getCKKnowledgeStoreClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = [v4 defaultKnowledgeStore];
  id v6 = [(INUserContextStore *)self _initWithKnowledgeStore:v5];

  return v6;
}

- (void)userContextOfClass:(Class)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "keyPrefixForType:", -[objc_class _type](a3, "_type"));
  uint64_t v8 = [v7 length];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  uint64_t v9 = (void *)getCKGenericConditionClass_softClass;
  uint64_t v25 = getCKGenericConditionClass_softClass;
  if (!getCKGenericConditionClass_softClass)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __getCKGenericConditionClass_block_invoke;
    v21[3] = &unk_1E5520EB8;
    v21[4] = &v22;
    __getCKGenericConditionClass_block_invoke((uint64_t)v21);
    uint64_t v9 = (void *)v23[3];
  }
  v10 = v9;
  _Block_object_dispose(&v22, 8);
  uint64_t v11 = (void *)[[v10 alloc] initWithMatchType:0 value:v7 negated:0];
  knowledgeStore = self->_knowledgeStore;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke;
  v15[3] = &unk_1E5519F98;
  id v18 = v6;
  uint64_t v19 = v8;
  id v16 = v7;
  v17 = self;
  Class v20 = a3;
  id v13 = v6;
  id v14 = v7;
  [(CKKnowledgeStore *)knowledgeStore dictionaryRepresentationForKeysMatching:v11 completionHandler:v15];
}

void __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = v6;
  if (a2)
  {
    uint64_t v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)a1[4];
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s Error loading UserContext for prefix:%@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke_10;
    v17[3] = &unk_1E5519F70;
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[8];
    uint64_t v19 = a1[7];
    uint64_t v20 = v10;
    v17[4] = v9;
    id v11 = v6;
    id v18 = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v17];
    uint64_t v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s Retrieved UserContexts: %@", buf, 0x16u);
    }
    (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v11, v13, v14, v15);
  }
}

void __56__INUserContextStore_userContextOfClass_withCompletion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 substringFromIndex:*(void *)(a1 + 48)];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() findDataInValue:v6];
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      id v16 = 0;
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:v9 fromData:v8 error:&v16];
      id v11 = v16;
      if (v11)
      {
        uint64_t v12 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 136315906;
          id v18 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
          __int16 v19 = 2112;
          id v20 = v15;
          __int16 v21 = 2112;
          uint64_t v22 = v7;
          __int16 v23 = 2112;
          id v24 = v11;
          _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Error unarchiving UserContext from class:%@ for bundle:%@  - %@", buf, 0x2Au);
        }
      }
      [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v7];
    }
    else
    {
      uint64_t v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        id v18 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_debug_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_DEBUG, "%s No UserContext for bundle:%@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[INUserContextStore userContextOfClass:withCompletion:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_debug_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_DEBUG, "%s Received invalid key for UserContext:%@", buf, 0x16u);
    }
  }
}

- (void)userContextOfClass:(Class)a3 forBundleIdentifiers:(id)a4 withCompletion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v22 = a5;
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend((id)objc_opt_class(), "keyForBundleIdentifier:andType:", *(void *)(*((void *)&v30 + 1) + 8 * v15), -[objc_class _type](a3, "_type"));
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  knowledgeStore = self->_knowledgeStore;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke;
  v23[3] = &unk_1E5519F48;
  id v24 = v8;
  id v25 = v11;
  id v26 = v10;
  v27 = self;
  id v28 = v22;
  Class v29 = a3;
  id v18 = v22;
  id v19 = v10;
  id v20 = v11;
  id v21 = v8;
  [(CKKnowledgeStore *)knowledgeStore valuesForKeys:v19 completionHandler:v23];
}

void __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  if (a2)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      __int16 v23 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Error loading UserContext for bundleIdentifiers:%@ as keys:%@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke_4;
    v17[3] = &unk_1E5519F20;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    id v18 = v8;
    uint64_t v19 = v9;
    uint64_t v21 = *(void *)(a1 + 72);
    id v10 = v6;
    id v20 = v10;
    [v5 enumerateObjectsUsingBlock:v17];
    id v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      __int16 v23 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Retrieved UserContexts for bundleIdentifiers:%@ -- %@", buf, 0x20u);
    }
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v10, v12, v13);
  }
}

void __77__INUserContextStore_userContextOfClass_forBundleIdentifiers_withCompletion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 objectAtIndex:a3];
  id v8 = [(id)objc_opt_class() findDataInValue:v6];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    id v15 = 0;
    id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:v9 fromData:v8 error:&v15];
    id v11 = v15;
    if (v11)
    {
      uint64_t v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        v17 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        uint64_t v21 = v7;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Error unarchiving UserContext from class:%@ for bundle:%@  - %@", buf, 0x2Au);
      }
    }
    [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[INUserContextStore userContextOfClass:forBundleIdentifiers:withCompletion:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_debug_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_DEBUG, "%s No UserContext for bundle:%@", buf, 0x16u);
    }
  }
}

- (void)storeUserContextViaHelper:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[INImageServiceConnection sharedConnection];
  [v7 storeUserContext:v6 forBundleIdentifier:v5];
}

- (void)removeUserContextOfClass:(Class)a3 forBundleIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(objc_class *)a3 _type];
  id v8 = [(id)objc_opt_class() keyForBundleIdentifier:v6 andType:v7];
  uint64_t v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v15 = "-[INUserContextStore removeUserContextOfClass:forBundleIdentifier:]";
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s Removing UserContext of type:%ld for bundle:%@ at key:%@...", buf, 0x2Au);
  }
  knowledgeStore = self->_knowledgeStore;
  id v13 = 0;
  [(CKKnowledgeStore *)knowledgeStore removeValueForKey:v8 error:&v13];
  id v11 = v13;
  if (v11)
  {
    uint64_t v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "-[INUserContextStore removeUserContextOfClass:forBundleIdentifier:]";
      __int16 v16 = 2112;
      uint64_t v17 = (uint64_t)v8;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Error removing value for key:%@ -- %@", buf, 0x20u);
    }
  }
}

- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() _type];
  uint64_t v9 = [(id)objc_opt_class() keyForBundleIdentifier:v7 andType:v8];
  id v10 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = "-[INUserContextStore storeUserContext:forBundleIdentifier:]";
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_INFO, "%s Setting UserContext of type:%ld for bundle:%@ at key:%@, with value: %@...", buf, 0x34u);
  }
  id v15 = 0;
  id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v12 = v15;
  if (v12)
  {
    id v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[INUserContextStore storeUserContext:forBundleIdentifier:]";
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v12;
      _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s Error archiving UserContext: %@", buf, 0x16u);
    }
  }
  else
  {
    [(CKKnowledgeStore *)self->_knowledgeStore setValue:v11 forKey:v9];
    uint64_t v14 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[INUserContextStore storeUserContext:forBundleIdentifier:]";
      _os_log_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_INFO, "%s UserContext saved.", buf, 0xCu);
    }
  }
}

+ (id)keyForBundleIdentifier:(id)a3 andType:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() keyPrefixForType:a4];
  id v7 = [NSString stringWithFormat:@"%@%@", v6, v5];

  return v7;
}

+ (id)keyPrefixForType:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"usercontext.%ld.", a3);
}

+ (id)findDataInValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA98] null];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v3;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v6 = v12;

              goto LABEL_15;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }
  id v6 = 0;
LABEL_15:

  return v6;
}

+ (id)sharedStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__INUserContextStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, block);
  }
  v2 = (void *)sharedStore_sharedStore;

  return v2;
}

uint64_t __33__INUserContextStore_sharedStore__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = sharedStore_sharedStore;
  sharedStore_sharedStore = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

@end