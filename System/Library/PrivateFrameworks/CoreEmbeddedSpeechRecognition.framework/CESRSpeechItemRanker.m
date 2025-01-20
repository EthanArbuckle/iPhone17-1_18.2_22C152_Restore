@interface CESRSpeechItemRanker
+ (id)rankersForInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 sets:(id)a6;
+ (void)refreshRankedItemCachesForInstance:(id)a3 speechProfileSite:(id)a4;
- (BOOL)addSet:(id)a3;
- (BOOL)enumerateAllItemsOfSet:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)hasSets;
- (BOOL)isEqual:(id)a3;
- (BOOL)refreshRankedItemCache:(id *)a3;
- (CESRSpeechItemRanker)init;
- (CESRSpeechItemRanker)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5;
- (CESRSpeechProfileCategoryGroup)categoryGroup;
- (CESRSpeechProfileInstance)instance;
- (CESRSpeechProfileSite)speechProfileSite;
- (id)description;
- (id)getActivatedCodepathIds;
- (id)getAllCodepathIds;
- (id)sets;
- (int64_t)enumeratedItemCount;
- (unint64_t)hash;
- (unsigned)calculateItemLimit;
@end

@implementation CESRSpeechItemRanker

uint64_t __78__CESRSpeechItemRanker_AppShortcuts_enumerateRankedItemsWithError_usingBlock___block_invoke_2(void *a1)
{
  uint64_t v1 = *(void *)(a1[5] + 8);
  unint64_t v2 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = v2 + 1;
  if (v2 >= a1[6]) {
    return 1;
  }
  else {
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
}

uint64_t __78__CESRSpeechItemRanker_AppShortcuts_enumerateRankedItemsWithError_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __73__CESRSpeechItemRanker_Contact_enumerateRankedItemsWithError_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 metaContent];
      v5 = [v4 sourceItemIdentifier];

      if (v5)
      {
        v6 = [*(id *)(a1 + 32) objectForKey:v5];
        if (v6)
        {
          v7 = v6;
          [v6 ordinality];
          uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_11:
          goto LABEL_12;
        }
      }
    }
    else
    {
      v5 = 0;
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    int v10 = *(_DWORD *)(v9 + 24);
    if (v10)
    {
      *(_DWORD *)(v9 + 24) = v10 - 1;
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v8 = 1;
    }
    goto LABEL_11;
  }
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_12:

  return v8;
}

uint64_t __53__CESRSpeechItemRanker_Media__queryAndRankMediaItems__block_invoke(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 content],
        v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    uint64_t v20 = 0;
    goto LABEL_21;
  }
  v6 = [v3 metaContent];
  v7 = [v6 sourceItemIdentifier];
  if (![a1[4] containsObject:v7]) {
    goto LABEL_19;
  }
  v22 = v6;
  id v23 = v3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v6 linkedIdentifiers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v25;
  v12 = a1 + 7;
  v13 = a1 + 6;
  v14 = a1 + 5;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      v17 = [v16 sourceItemIdentifier];
      if (v17)
      {
        int v18 = [v16 type];
        if (v18 == 3)
        {
          v19 = v12;
LABEL_15:
          [*v19 setObject:v17 forKey:v7];
          goto LABEL_16;
        }
        v19 = v14;
        if (v18 == 2) {
          goto LABEL_15;
        }
        v19 = v13;
        if (v18 == 1) {
          goto LABEL_15;
        }
      }
LABEL_16:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v10);
LABEL_18:

  v6 = v22;
  id v3 = v23;
LABEL_19:

  uint64_t v20 = 1;
LABEL_21:

  return v20;
}

uint64_t __71__CESRSpeechItemRanker_Media_enumerateRankedItemsWithError_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 metaContent];
    v5 = [v4 sourceItemIdentifier];

    if (v5 && [*(id *)(*(void *)(a1 + 32) + 56) count])
    {
      v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v5];
      v7 = v6;
      if (v6 && *(void *)(a1 + 72) > (unint64_t)[v6 unsignedIntValue]
        || ([*(id *)(a1 + 40) containsObject:v5] & 1) != 0)
      {
        uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_15;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if (+[CESRSpeechItemRanker_Media _isPlayableItem:v3]
    && (uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8), (v10 = *(void *)(v9 + 24)) != 0)
    || +[CESRSpeechItemRanker_Media _isArtistItem:v3]
    && (uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8), (v10 = *(void *)(v9 + 24)) != 0))
  {
    *(void *)(v9 + 24) = v10 - 1;
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = 1;
  }
LABEL_15:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryGroup, 0);
  objc_storeStrong((id *)&self->_speechProfileSite, 0);
  objc_storeStrong((id *)&self->_instance, 0);

  objc_storeStrong((id *)&self->_sets, 0);
}

- (CESRSpeechProfileCategoryGroup)categoryGroup
{
  return self->_categoryGroup;
}

- (CESRSpeechProfileSite)speechProfileSite
{
  return self->_speechProfileSite;
}

- (CESRSpeechProfileInstance)instance
{
  return self->_instance;
}

- (BOOL)refreshRankedItemCache:(id *)a3
{
  return 1;
}

- (int64_t)enumeratedItemCount
{
  return self->_enumeratedItemCount;
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_sets;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __65__CESRSpeechItemRanker_enumerateRankedItemsWithError_usingBlock___block_invoke;
        v15[3] = &unk_1E61C34A8;
        v15[4] = self;
        id v16 = v6;
        LODWORD(v11) = [(CESRSpeechItemRanker *)self enumerateAllItemsOfSet:v11 error:a3 usingBlock:v15];

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

uint64_t __65__CESRSpeechItemRanker_enumerateRankedItemsWithError_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)enumerateAllItemsOfSet:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3106;
  v40 = __Block_byref_object_dispose__3107;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  uint64_t v10 = [(CESRSpeechProfileInstance *)self->_instance changeRegistry];
  uint64_t v11 = [v8 changePublisherWithUseCase:@"SpeechProfile"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke;
  v27[3] = &unk_1E61C3458;
  id v12 = v10;
  id v28 = v12;
  id v13 = v8;
  id v29 = v13;
  v30 = &v36;
  v31 = &v32;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke_19;
  v23[3] = &unk_1E61C3480;
  id v14 = v9;
  id v24 = v14;
  long long v25 = &v36;
  long long v26 = &v32;
  id v15 = (id)[v11 drivableSinkWithBookmark:0 completion:v27 shouldContinue:v23];

  id v16 = v37;
  if (*((unsigned char *)v33 + 24) && !v37[5])
  {
    BOOL v18 = 1;
  }
  else
  {
    long long v17 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      instance = self->_instance;
      uint64_t v22 = v16[5];
      *(_DWORD *)buf = 136315906;
      v43 = "-[CESRSpeechItemRanker enumerateAllItemsOfSet:error:usingBlock:]";
      __int16 v44 = 2112;
      v45 = instance;
      __int16 v46 = 2112;
      id v47 = v13;
      __int16 v48 = 2112;
      uint64_t v49 = v22;
      _os_log_error_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_ERROR, "%s (%@) Enumeration for set: %@ aborted: %@", buf, 0x2Au);
      id v16 = v37;
    }
    BOOL v18 = 0;
    if (a4)
    {
      long long v19 = (void *)v16[5];
      if (v19)
      {
        BOOL v18 = 0;
        *a4 = v19;
      }
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

void __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 state])
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    uint64_t v7 = [v5 error];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v12 + 40);
    char v13 = [v10 updateBookmark:v6 forSet:v11 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if ((v13 & 1) == 0)
    {
      id v14 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
        *(_DWORD *)buf = 136315394;
        BOOL v18 = "-[CESRSpeechItemRanker enumerateAllItemsOfSet:error:usingBlock:]_block_invoke";
        __int16 v19 = 2112;
        uint64_t v20 = v15;
        _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Failed to update bookmark, error: %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __64__CESRSpeechItemRanker_enumerateAllItemsOfSet_error_usingBlock___block_invoke_19(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 addedLocalInstances];
  if ([v4 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = [v3 addedLocalInstances];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = a1[4];
          uint64_t v11 = *(void *)(a1[5] + 8);
          id obj = *(id *)(v11 + 40);
          char v12 = (*(uint64_t (**)(void))(v10 + 16))();
          objc_storeStrong((id *)(v11 + 40), obj);
          if ((v12 & 1) == 0)
          {
            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;

            uint64_t v13 = 0;
            goto LABEL_15;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v14 = a1[4];
    uint64_t v15 = [v3 sharedItem];
    uint64_t v16 = *(void *)(a1[5] + 8);
    id v18 = *(id *)(v16 + 40);
    LOBYTE(v14) = (*(uint64_t (**)(uint64_t, void *, id *))(v14 + 16))(v14, v15, &v18);
    objc_storeStrong((id *)(v16 + 40), v18);

    if ((v14 & 1) == 0)
    {
      uint64_t v13 = 0;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      goto LABEL_15;
    }
  }
  uint64_t v13 = 1;
LABEL_15:

  return v13;
}

- (id)getActivatedCodepathIds
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)getAllCodepathIds
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (unsigned)calculateItemLimit
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(CESRSpeechProfileCategoryGroup *)self->_categoryGroup speechCategories];
  id v3 = +[CESRSpeechProfileBuilder categoryToLimitHintMap];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    unsigned int v8 = -1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend(v3, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        uint64_t v11 = v10;
        if (v10 && [v10 unsignedIntValue] < v8) {
          unsigned int v8 = [v11 unsignedIntValue];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v8 = -1;
  }

  char v12 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v4 allObjects];
    uint64_t v15 = [v14 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136315650;
    long long v22 = "-[CESRSpeechItemRanker calculateItemLimit]";
    __int16 v23 = 1024;
    unsigned int v24 = v8;
    __int16 v25 = 2112;
    long long v26 = v15;
    _os_log_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_INFO, "%s Resolved Limit: %u from categories: %@", buf, 0x1Cu);
  }
  return v8;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CESRSpeechItemRanker *)self instance];
  uint64_t v7 = [(CESRSpeechItemRanker *)self sets];
  unsigned int v8 = [v3 stringWithFormat:@"%@ (%@) - sets: %@", v5, v6, v7];

  return v8;
}

- (BOOL)hasSets
{
  return [(NSMutableArray *)self->_sets count] != 0;
}

- (id)sets
{
  return self->_sets;
}

- (BOOL)addSet:(id)a3
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_sets hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = (CESRSpeechItemRanker *)a3;
  unsigned int v8 = v7;
  if (v7 == self)
  {
    char v11 = 1;
    goto LABEL_23;
  }
  if (!v7 || ![(CESRSpeechItemRanker *)v7 isMemberOfClass:objc_opt_class()])
  {
    char v11 = 0;
    goto LABEL_23;
  }
  uint64_t v9 = [(CESRSpeechItemRanker *)self instance];
  if (v9
    || ([(CESRSpeechItemRanker *)v8 instance], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [(CESRSpeechItemRanker *)self instance];
    id v4 = [(CESRSpeechItemRanker *)v8 instance];
    if (![v3 isEqual:v4])
    {
      char v11 = 0;
LABEL_19:

      goto LABEL_20;
    }
    int v10 = 1;
  }
  else
  {
    uint64_t v16 = 0;
    int v10 = 0;
  }
  char v12 = [(CESRSpeechItemRanker *)self sets];
  if (v12 || ([(CESRSpeechItemRanker *)v8 sets], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = [(CESRSpeechItemRanker *)self sets];
    uint64_t v14 = [(CESRSpeechItemRanker *)v8 sets];
    char v11 = [v13 isEqual:v14];

    if (v12) {
      goto LABEL_18;
    }
  }
  else
  {
    char v11 = 1;
  }

LABEL_18:
  if (v10) {
    goto LABEL_19;
  }
LABEL_20:
  if (!v9) {

  }
LABEL_23:
  return v11;
}

- (CESRSpeechItemRanker)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CESRSpeechItemRanker;
  char v12 = [(CESRSpeechItemRanker *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_instance, a3);
    objc_storeStrong((id *)&v13->_speechProfileSite, a4);
    objc_storeStrong((id *)&v13->_categoryGroup, a5);
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sets = v13->_sets;
    v13->_sets = v14;

    v13->_enumeratedItemCount = 0;
  }

  return v13;
}

- (CESRSpeechItemRanker)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

+ (void)refreshRankedItemCachesForInstance:(id)a3 speechProfileSite:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[CESRSpeechItemRanker_Media alloc] initWithInstance:v5 speechProfileSite:v6 categoryGroup:0];

  id v10 = 0;
  LOBYTE(v6) = [(CESRSpeechItemRanker_Media *)v7 refreshRankedItemCache:&v10];
  id v8 = v10;
  if ((v6 & 1) == 0)
  {
    id v9 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      char v12 = "+[CESRSpeechItemRanker refreshRankedItemCachesForInstance:speechProfileSite:]";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s (%@) Ranked item cache refresh failed: %@", buf, 0x20u);
    }
  }
}

+ (id)rankersForInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 sets:(id)a6
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = [[CESRSpeechItemRanker_Contact alloc] initWithInstance:v9 speechProfileSite:v10 categoryGroup:v11];
  v54[0] = v13;
  id v14 = [[CESRSpeechItemRanker_Media alloc] initWithInstance:v9 speechProfileSite:v10 categoryGroup:v11];
  v54[1] = v14;
  v37 = v10;
  uint64_t v38 = v9;
  uint64_t v36 = v11;
  __int16 v15 = [[CESRSpeechItemRanker alloc] initWithInstance:v9 speechProfileSite:v10 categoryGroup:v11];
  v54[2] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v23 = v16;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v44;
LABEL_8:
          uint64_t v27 = 0;
          while (1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            if ([*(id *)(*((void *)&v43 + 1) + 8 * v27) addSet:v22]) {
              break;
            }
            if (v25 == ++v27)
            {
              uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
              if (v25) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v19);
  }

  uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v29 = v16;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        if ([v34 hasSets]) {
          [v28 addObject:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v31);
  }

  return v28;
}

@end