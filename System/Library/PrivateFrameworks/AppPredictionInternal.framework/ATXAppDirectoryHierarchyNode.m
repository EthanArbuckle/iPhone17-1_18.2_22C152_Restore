@interface ATXAppDirectoryHierarchyNode
+ (id)dynamicCategoriesForAppBundleIDs:(id)a3 screenTimeMappings:(id)a4 iTunesMappings:(id)a5;
+ (id)initializeHierarchyForAppBundleIDs:(id)a3 screenTimeMappings:(id)a4 iTunesMappings:(id)a5;
+ (id)lazyGetNodeForCategoryID:(id)a3 inDictionary:(id)a4;
+ (unint64_t)effectiveCategoryIDForBundleID:(id)a3 withScreenTimeMappings:(id)a4 iTunesMappings:(id)a5;
- (ATXAppDirectoryHierarchyNode)initWithCategoryID:(unint64_t)a3;
- (ATXAppDirectoryHierarchyNode)parent;
- (BOOL)_isRoot;
- (BOOL)enabled;
- (NSMutableArray)appBundleIDs;
- (NSMutableArray)children;
- (id)_allAppBundleIDs;
- (id)_allNodes;
- (id)_categoryDictionary;
- (unint64_t)_enabledNodeCount;
- (unint64_t)categoryID;
- (unint64_t)size;
- (void)_addAppBundleID:(id)a3;
- (void)_addChild:(id)a3;
- (void)_computeSize;
- (void)_displayTree;
- (void)_displayTreeWithCurrString:(id)a3;
- (void)_preorderTraverseWithBlock:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation ATXAppDirectoryHierarchyNode

- (ATXAppDirectoryHierarchyNode)initWithCategoryID:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ATXAppDirectoryHierarchyNode;
  v4 = [(ATXAppDirectoryHierarchyNode *)&v11 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_parent, 0);
    uint64_t v6 = objc_opt_new();
    children = v5->_children;
    v5->_children = (NSMutableArray *)v6;

    v5->_size = 0;
    v5->_enabled = 0;
    uint64_t v8 = objc_opt_new();
    appBundleIDs = v5->_appBundleIDs;
    v5->_appBundleIDs = (NSMutableArray *)v8;

    v5->_categoryID = a3;
  }
  return v5;
}

- (void)_computeSize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_size = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_children;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "_computeSize", (void)v9);
        if (([v8 enabled] & 1) == 0) {
          self->_size += [v8 size];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->_size += [(NSMutableArray *)self->_appBundleIDs count];
}

- (BOOL)_isRoot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  BOOL v3 = WeakRetained == 0;

  return v3;
}

- (void)_addAppBundleID:(id)a3
{
}

- (void)_addChild:(id)a3
{
  id v4 = a3;
  [v4 setParent:self];
  [(NSMutableArray *)self->_children addObject:v4];
}

- (void)_displayTree
{
  BOOL v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "------------------------------------", buf, 2u);
  }

  [(ATXAppDirectoryHierarchyNode *)self _displayTreeWithCurrString:&stru_1F2740B58];
  id v4 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "------------------------------------", v5, 2u);
  }
}

- (void)_displayTreeWithCurrString:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_enabled) {
      uint64_t v6 = @"xx";
    }
    else {
      uint64_t v6 = @"--";
    }
    v7 = [MEMORY[0x1E4F4AEB0] localizedStringForCategoryID:self->_categoryID];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_appBundleIDs, "count"));
    long long v9 = [NSNumber numberWithUnsignedInteger:self->_size];
    *(_DWORD *)buf = 138413314;
    v23 = v6;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 2112;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@%@%@:%@:%@", buf, 0x34u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_children;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        v16 = [NSString stringWithFormat:@"%@--", v4];
        [v15 _displayTreeWithCurrString:v16];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)_preorderTraverseWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, ATXAppDirectoryHierarchyNode *))a3;
  v4[2](v4, self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(ATXAppDirectoryHierarchyNode *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _preorderTraverseWithBlock:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_allNodes
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__64;
  long long v10 = __Block_byref_object_dispose__64;
  id v11 = (id)objc_opt_new();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ATXAppDirectoryHierarchyNode__allNodes__block_invoke;
  v5[3] = &unk_1E68B2BD8;
  v5[4] = &v6;
  [(ATXAppDirectoryHierarchyNode *)self _preorderTraverseWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __41__ATXAppDirectoryHierarchyNode__allNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (unint64_t)_enabledNodeCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__ATXAppDirectoryHierarchyNode__enabledNodeCount__block_invoke;
  v4[3] = &unk_1E68B2BD8;
  v4[4] = &v5;
  [(ATXAppDirectoryHierarchyNode *)self _preorderTraverseWithBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __49__ATXAppDirectoryHierarchyNode__enabledNodeCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 enabled];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (id)_allAppBundleIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableArray *)self->_appBundleIDs mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_children;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "enabled", (void)v12) & 1) == 0)
        {
          long long v10 = [v9 _allAppBundleIDs];
          [v3 addObjectsFromArray:v10];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_categoryDictionary
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__64;
  long long v13 = __Block_byref_object_dispose__64;
  id v14 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ATXAppDirectoryHierarchyNode__categoryDictionary__block_invoke;
  v8[3] = &unk_1E68B2BD8;
  v8[4] = &v9;
  [(ATXAppDirectoryHierarchyNode *)self _preorderTraverseWithBlock:v8];
  id v3 = [(id)v10[5] objectForKeyedSubscript:&unk_1F27F1830];
  if (v3)
  {
    id v4 = [(id)v10[5] objectForKeyedSubscript:&unk_1F27F1848];

    if (v4)
    {
      uint64_t v5 = [(id)v10[5] objectForKeyedSubscript:&unk_1F27F1830];
      [(id)v10[5] setObject:v5 forKeyedSubscript:&unk_1F27F1860];

      [(id)v10[5] removeObjectForKey:&unk_1F27F1830];
    }
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__ATXAppDirectoryHierarchyNode__categoryDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 enabled])
  {
    id v3 = [v6 _allAppBundleIDs];
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "categoryID"));
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

+ (id)lazyGetNodeForCategoryID:(id)a3 inDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    uint64_t v8 = -[ATXAppDirectoryHierarchyNode initWithCategoryID:]([ATXAppDirectoryHierarchyNode alloc], "initWithCategoryID:", [v5 unsignedIntegerValue]);
    [v6 setObject:v8 forKeyedSubscript:v5];
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:v5];

  return v9;
}

+ (unint64_t)effectiveCategoryIDForBundleID:(id)a3 withScreenTimeMappings:(id)a4 iTunesMappings:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a5 objectForKeyedSubscript:v7];
  long long v10 = [v8 objectForKeyedSubscript:v7];

  if (v10)
  {
    if (!v9
      || (objc_msgSend(MEMORY[0x1E4F4AEB0], "isCategory:descendantOfCategory:", objc_msgSend(v9, "integerValue"), objc_msgSend(v10, "integerValue")) & 1) == 0)
    {
      uint64_t v11 = v10;
LABEL_9:
      unint64_t v13 = [v11 unsignedIntegerValue];
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v11 = v9;
    goto LABEL_9;
  }
  long long v12 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[ATXAppDirectoryHierarchyNode effectiveCategoryIDForBundleID:withScreenTimeMappings:iTunesMappings:]((uint64_t)v7, v12);
  }

  if (v9) {
    goto LABEL_8;
  }
  long long v15 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[ATXAppDirectoryHierarchyNode effectiveCategoryIDForBundleID:withScreenTimeMappings:iTunesMappings:]((uint64_t)v7, v15);
  }

  unint64_t v13 = 1008;
LABEL_10:

  return v13;
}

+ (id)initializeHierarchyForAppBundleIDs:(id)a3 screenTimeMappings:(id)a4 iTunesMappings:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v17 = [a1 effectiveCategoryIDForBundleID:v16 withScreenTimeMappings:v9 iTunesMappings:v10];
        long long v18 = [NSNumber numberWithUnsignedInteger:v17];
        long long v19 = [a1 lazyGetNodeForCategoryID:v18 inDictionary:v11];

        [v19 _addAppBundleID:v16];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }

  long long v20 = [v11 allKeys];
  v21 = (void *)[v20 mutableCopy];

  while ([v21 count])
  {
    v22 = [v21 lastObject];
    [v21 removeLastObject];
    if ([v22 unsignedIntegerValue] != 1008)
    {
      v23 = [v11 objectForKeyedSubscript:v22];
      __int16 v24 = [v23 parent];

      if (!v24)
      {
        uint64_t v25 = objc_msgSend(MEMORY[0x1E4F4AEB0], "parentCategoryForCategory:", objc_msgSend(v22, "integerValue"));
        __int16 v26 = [NSNumber numberWithUnsignedInteger:v25];
        v27 = [a1 lazyGetNodeForCategoryID:v26 inDictionary:v11];

        __int16 v28 = [v11 objectForKeyedSubscript:v22];
        [v27 _addChild:v28];

        v29 = [NSNumber numberWithUnsignedInteger:v25];
        [v21 addObject:v29];
      }
    }
  }
  __int16 v30 = [v11 objectForKeyedSubscript:&unk_1F27F1878];

  return v30;
}

+ (id)dynamicCategoriesForAppBundleIDs:(id)a3 screenTimeMappings:(id)a4 iTunesMappings:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 initializeHierarchyForAppBundleIDs:a3 screenTimeMappings:a4 iTunesMappings:a5];
  [v5 setEnabled:1];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v6 = [v5 children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * i) setEnabled:1];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [v5 _enabledNodeCount];
  uint64_t v12 = [v5 size];
  if ((unint64_t)(((__PAIR128__(v11, v12) - 1) >> 64) + 2) >= 0xE) {
    unint64_t v13 = 14;
  }
  else {
    unint64_t v13 = ((__PAIR128__(v11, v12) - 1) >> 64) + 2;
  }
  [v5 _computeSize];
  [v5 _displayTree];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke;
  v61[3] = &unk_1E68B2C00;
  id v14 = v5;
  id v62 = v14;
  [v14 _preorderTraverseWithBlock:v61];
  [v14 _computeSize];
  objc_msgSend(v14, "setEnabled:", objc_msgSend(v14, "size") != 0);
  [v14 _displayTree];
  id v43 = v14;
  unint64_t v44 = v13;
  do
  {
    if ([v14 _enabledNodeCount] >= v13) {
      break;
    }
    long long v15 = [v14 _allNodes];
    uint64_t v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_135];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v16;
    uint64_t v17 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (!v17)
    {

      break;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v58;
    char v42 = 1;
    uint64_t v45 = *(void *)v58;
LABEL_15:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v58 != v19) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v57 + 1) + 8 * v20);
      if ([v14 _enabledNodeCount] > v13) {
        break;
      }
      if ([v21 enabled])
      {
        if ((unint64_t)[v21 size] > 0xB) {
          goto LABEL_29;
        }
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v22 = [v21 children];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v68 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          char v25 = 0;
          uint64_t v26 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v54 != v26) {
                objc_enumerationMutation(v22);
              }
              uint64_t v28 = [*(id *)(*((void *)&v53 + 1) + 8 * j) size];
              v25 |= v28 == [v21 size];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v68 count:16];
          }
          while (v24);

          id v14 = v43;
          unint64_t v13 = v44;
          uint64_t v19 = v45;
          if ((v25 & 1) == 0) {
            goto LABEL_49;
          }
LABEL_29:
          v29 = [v21 children];
          __int16 v30 = [v29 sortedArrayUsingComparator:&__block_literal_global_25_1];

          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v22 = v30;
          uint64_t v31 = [v22 countByEnumeratingWithState:&v49 objects:v67 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v50;
            while (2)
            {
              for (uint64_t k = 0; k != v32; ++k)
              {
                if (*(void *)v50 != v33) {
                  objc_enumerationMutation(v22);
                }
                long long v35 = *(void **)(*((void *)&v49 + 1) + 8 * k);
                if (([v35 enabled] & 1) == 0)
                {
                  if (!objc_msgSend(MEMORY[0x1E4F4AEB0], "shouldCategoryAlwaysMergeWithParent:", objc_msgSend(v35, "categoryID"))|| (uint64_t v36 = objc_msgSend(v35, "size"), v36 == objc_msgSend(v21, "size")))
                  {
                    if ((unint64_t)[v35 size] >= 6
                      && (uint64_t v37 = [v21 size], (unint64_t)(v37 - objc_msgSend(v35, "size")) > 5)
                      || (uint64_t v38 = [v35 size], v38 == objc_msgSend(v21, "size")))
                    {
                      [v35 setEnabled:1];
                      [v21 _computeSize];
                      if (![v21 size]) {
                        [v21 setEnabled:0];
                      }
                      char v42 = 0;
                      goto LABEL_46;
                    }
                  }
                }
              }
              uint64_t v32 = [v22 countByEnumeratingWithState:&v49 objects:v67 count:16];
              if (v32) {
                continue;
              }
              break;
            }
LABEL_46:
            id v14 = v43;
            unint64_t v13 = v44;
            uint64_t v19 = v45;
          }
        }
      }
LABEL_49:
      if (++v20 == v18)
      {
        uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
        if (v18) {
          goto LABEL_15;
        }
        break;
      }
    }
  }
  while ((v42 & 1) == 0);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_4;
  v47[3] = &unk_1E68B2C00;
  id v48 = v14;
  id v39 = v14;
  [v39 _preorderTraverseWithBlock:v47];
  [v39 _computeSize];
  [v39 _displayTree];
  v40 = [v39 _categoryDictionary];

  return v40;
}

uint64_t __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  unint64_t v4 = v3;
  if (*(void *)(a1 + 32) != v3)
  {
    id v6 = (void *)v3;
    unint64_t v3 = [(id)v3 enabled];
    unint64_t v4 = (unint64_t)v6;
    if (v3)
    {
      unint64_t v3 = objc_msgSend(MEMORY[0x1E4F4AEB0], "shouldCategoryNeverMergeWithParent:", objc_msgSend(v6, "categoryID"));
      unint64_t v4 = (unint64_t)v6;
      if ((v3 & 1) == 0)
      {
        unint64_t v3 = [v6 size];
        unint64_t v4 = (unint64_t)v6;
        if (v3 <= 3)
        {
          unint64_t v3 = [v6 setEnabled:0];
          unint64_t v4 = (unint64_t)v6;
        }
      }
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 size];
  if (v6 > [v5 size])
  {
LABEL_5:
    uint64_t v8 = -1;
    goto LABEL_6;
  }
  unint64_t v7 = [v4 size];
  if (v7 >= [v5 size])
  {
    unint64_t v9 = [v4 categoryID];
    if (v9 >= [v5 categoryID])
    {
      unint64_t v11 = [v4 categoryID];
      uint64_t v8 = v11 > [v5 categoryID];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = 1;
LABEL_6:

  return v8;
}

uint64_t __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 size];
  if (v6 > [v5 size])
  {
LABEL_5:
    uint64_t v8 = -1;
    goto LABEL_6;
  }
  unint64_t v7 = [v4 size];
  if (v7 >= [v5 size])
  {
    unint64_t v9 = [v4 categoryID];
    if (v9 >= [v5 categoryID])
    {
      unint64_t v11 = [v4 categoryID];
      uint64_t v8 = v11 > [v5 categoryID];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = 1;
LABEL_6:

  return v8;
}

void __99__ATXAppDirectoryHierarchyNode_dynamicCategoriesForAppBundleIDs_screenTimeMappings_iTunesMappings___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) != v3 && [v3 enabled])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(v4, "children", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (([v10 enabled] & 1) == 0)
          {
            uint64_t v11 = [v10 size];
            if (v11 == [v4 size])
            {
              [v4 setEnabled:0];
              [v10 setEnabled:1];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (ATXAppDirectoryHierarchyNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (ATXAppDirectoryHierarchyNode *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (unint64_t)categoryID
{
  return self->_categoryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIDs, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

+ (void)effectiveCategoryIDForBundleID:(uint64_t)a1 withScreenTimeMappings:(NSObject *)a2 iTunesMappings:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "iTunes category missing as well for %@, defaulting to Other", (uint8_t *)&v2, 0xCu);
}

+ (void)effectiveCategoryIDForBundleID:(uint64_t)a1 withScreenTimeMappings:(NSObject *)a2 iTunesMappings:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Screentime category missing for %@, solely relying on iTunes category", (uint8_t *)&v2, 0xCu);
}

@end