@interface MDSearchableIndex
- (void)indexSearchableItems:(id)a3 stateInfo:(id)a4 completionHandler:(id)a5;
- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation MDSearchableIndex

- (void)indexSearchableItems:(id)a3 stateInfo:(id)a4 completionHandler:(id)a5
{
}

- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 jobOptions])
  {
    v11 = [CSSearchableIndex alloc];
    v12 = [(CSSearchableIndex *)self name];
    v13 = [(CSSearchableIndex *)self bundleIdentifier];
    v14 = -[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](v11, "_initWithName:protectionClass:bundleIdentifier:options:", v12, v9, v13, [v8 jobOptions]);
  }
  else
  {
    v14 = self;
  }
  if ([v8 jobType] == 1)
  {
    v15 = [(CSSearchableIndex *)self indexDelegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v8;
        __int16 v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_18D0E3000, v17, OS_LOG_TYPE_DEFAULT, "deprecated - reindexSearchableItemsWithIdentifiers, job:%@, index:%@", buf, 0x16u);
      }

      v18 = [(CSSearchableIndex *)self indexDelegate];
      v19 = [v8 identifiersToReindex];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke;
      v27[3] = &unk_1E5548ED8;
      id v28 = v10;
      [v18 index:v14 reindexSearchableItemsWithIdentifiers:v19 acknowledgementHandler:v27];

      v20 = v28;
      goto LABEL_12;
    }
LABEL_13:
    v24.receiver = self;
    v24.super_class = (Class)MDSearchableIndex;
    [(CSSearchableIndex *)&v24 performIndexJob:v8 protectionClass:v9 acknowledgementHandler:v10];
    goto LABEL_14;
  }
  if ([v8 jobType] != 2) {
    goto LABEL_13;
  }
  v21 = [(CSSearchableIndex *)self indexDelegate];
  char v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) == 0) {
    goto LABEL_13;
  }
  v23 = [(CSSearchableIndex *)self indexDelegate];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2;
  v25[3] = &unk_1E5548ED8;
  id v26 = v10;
  [v23 reindexAllSearchableItemsForIndex:v14 acknowledgementHandler:v25];

  v20 = v26;
LABEL_12:

LABEL_14:
}

uint64_t __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end