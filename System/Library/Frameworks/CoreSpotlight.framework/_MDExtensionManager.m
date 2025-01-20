@interface _MDExtensionManager
+ (BOOL)_isSupported:(id)a3 extension:(id)a4;
- (BOOL)extensionExistsForBundleId:(id)a3;
- (CSFileProviderDomainMonitor)fileProviderMoniter;
- (NSCondition)extensionsCondition;
- (NSDictionary)fileProviderBundleMap;
- (NSDictionary)indexExtensionsByBundleID;
- (NSSet)fileProviderBundleIDs;
- (OS_dispatch_queue)extensionManagerQueue;
- (OS_dispatch_queue)notifyQueue;
- (OS_dispatch_queue)queue;
- (_MDExtensionLoader)extensionLoader;
- (_MDExtensionManager)initWithQueueName:(const char *)a3;
- (id)allExtensionsWithBlock:(id)a3;
- (id)anyExtensionWithBlock:(id)a3;
- (id)extensionForFileType:(id)a3;
- (id)extensions;
- (int64_t)loaderCallbackCount;
- (void)_didRetryJobWithBundleID:(id)a3;
- (void)_notifyForLoadedExtensions;
- (void)_performJob:(id)a3 extensions:(id)a4 count:(unint64_t)a5 throttle:(id)a6 perExtensionCompletionHandler:(id)a7;
- (void)_performJob:(id)a3 extensions:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6;
- (void)_waitForLoadLocked;
- (void)_willRunJobWithBundleID:(id)a3;
- (void)findExtensionsWithCompletionBlock:(id)a3;
- (void)indexRequestsPerformDataJob:(id)a3 forBundle:(id)a4 completionHandler:(id)a5;
- (void)indexRequestsPerformJob:(id)a3 extensions:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6;
- (void)indexRequestsPerformJob:(id)a3 forBundle:(id)a4 completionHandler:(id)a5;
- (void)indexRequestsPerformJob:(id)a3 forBundles:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6;
- (void)indexRequestsPerformJob:(id)a3 perExtensionCompletionHandler:(id)a4 completionHandler:(id)a5;
- (void)setExtensionLoader:(id)a3;
- (void)setExtensionManagerQueue:(id)a3;
- (void)setExtensionsCondition:(id)a3;
- (void)setFileProviderBundleIDs:(id)a3;
- (void)setFileProviderBundleMap:(id)a3;
- (void)setFileProviderMoniter:(id)a3;
- (void)setIndexExtensionsByBundleID:(id)a3;
- (void)setLoaderCallbackCount:(int64_t)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _MDExtensionManager

- (void)indexRequestsPerformDataJob:(id)a3 forBundle:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 fileType];

  extensionManagerQueue = self->_extensionManagerQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79___MDExtensionManager_indexRequestsPerformDataJob_forBundle_completionHandler___block_invoke;
  v19[3] = &unk_1E5549E40;
  v19[4] = self;
  id v20 = v9;
  id v21 = v8;
  id v22 = v10;
  v12 = extensionManagerQueue;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  qos_class_t v16 = qos_class_self();
  if (v16 < 0x1A) {
    dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  }
  else {
    dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, v19);
  }
  v18 = v17;
  dispatch_async(v12, v17);
}

- (id)extensionForFileType:(id)a3
{
  id v4 = a3;
  if (self->_lastLoadCount != self->_loaderCallbackCount)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fileTypeToExtensionMapping = self->_fileTypeToExtensionMapping;
    self->_fileTypeToExtensionMapping = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    fileTypeNegativeCache = self->_fileTypeNegativeCache;
    self->_fileTypeNegativeCache = v7;

    self->_lastLoadCount = self->_loaderCallbackCount;
  }
  if ([v4 hasPrefix:@"dyn."])
  {
    id v9 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_MDExtensionManager extensionForFileType:](v9);
    }
LABEL_6:
    id v10 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_fileTypeToExtensionMapping objectForKey:v4];
  if (v11)
  {
    id v10 = (void *)v11;
    id v9 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_MDExtensionManager extensionForFileType:].cold.5();
    }
  }
  else
  {
    if ([(NSMutableSet *)self->_fileTypeNegativeCache containsObject:v4])
    {
      id v9 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[_MDExtensionManager extensionForFileType:]();
      }
      goto LABEL_6;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44___MDExtensionManager_extensionForFileType___block_invoke;
    v17[3] = &unk_1E554CC00;
    id v12 = v4;
    id v18 = v12;
    id v13 = [(_MDExtensionManager *)self anyExtensionWithBlock:v17];
    id v14 = logForCSLogCategoryDefault();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      if (v15) {
        -[_MDExtensionManager extensionForFileType:].cold.4();
      }

      [(NSMutableDictionary *)self->_fileTypeToExtensionMapping setObject:v13 forKey:v12];
    }
    else
    {
      if (v15) {
        -[_MDExtensionManager extensionForFileType:]();
      }

      [(NSMutableSet *)self->_fileTypeNegativeCache addObject:v12];
    }
    id v9 = v13;

    id v10 = v9;
  }
LABEL_21:

  return v10;
}

- (BOOL)extensionExistsForBundleId:(id)a3
{
  id v4 = a3;
  v5 = [(_MDExtensionManager *)self indexExtensionsByBundleID];
  v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (NSDictionary)indexExtensionsByBundleID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    indexExtensionsByBundleID = self->_indexExtensionsByBundleID;
    int v8 = 134217984;
    id v9 = indexExtensionsByBundleID;
    _os_log_impl(&dword_18D0E3000, v3, OS_LOG_TYPE_INFO, "indexExtensionsByBundleID %p", (uint8_t *)&v8, 0xCu);
  }

  [(NSCondition *)self->_extensionsCondition lock];
  v5 = self->_indexExtensionsByBundleID;
  if (!v5)
  {
    [(_MDExtensionManager *)self _waitForLoadLocked];
    v5 = self->_indexExtensionsByBundleID;
  }
  v6 = v5;
  [(NSCondition *)self->_extensionsCondition unlock];

  return v6;
}

- (_MDExtensionManager)initWithQueueName:(const char *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_MDExtensionManager;
  id v4 = [(_MDExtensionManager *)&v17 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create(a3, 0);
    [(_MDExtensionManager *)v4 setQueue:v5];

    v6 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
    extensionsCondition = v4->_extensionsCondition;
    v4->_extensionsCondition = v6;

    int v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.corespotlight.extensionManager", v8);
    extensionManagerQueue = v4->_extensionManagerQueue;
    v4->_extensionManagerQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fileTypeToExtensionMapping = v4->_fileTypeToExtensionMapping;
    v4->_fileTypeToExtensionMapping = v11;

    id v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    fileTypeNegativeCache = v4->_fileTypeNegativeCache;
    v4->_fileTypeNegativeCache = v13;

    BOOL v15 = +[CSFileProviderDomainMonitor sharedInstance];
    objc_storeWeak((id *)&v4->_fileProviderMoniter, v15);
  }
  return v4;
}

- (void)findExtensionsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  extensionLoader = self->_extensionLoader;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___MDExtensionManager_findExtensionsWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E554CBD8;
  id v8 = v4;
  id v6 = v4;
  [(_MDExtensionLoader *)extensionLoader findExtensionsWithCompletionBlock:v7];
}

- (void)_notifyForLoadedExtensions
{
  notifyQueue = self->_notifyQueue;
  if (notifyQueue)
  {
    v3 = notifyQueue;
    qos_class_t v4 = qos_class_self();
    if (v4 < 0x1A) {
      dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_37);
    }
    else {
      dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, &__block_literal_global_37);
    }
    dispatch_block_t block = v5;
    dispatch_async(v3, v5);
  }
  else
  {
    qos_class_t v6 = qos_class_self();
    if (v6 < 0x1A) {
      dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_37);
    }
    else {
      dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6, 0, &__block_literal_global_37);
    }
    dispatch_block_t block = v7;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

- (void)_waitForLoadLocked
{
  if (!self->_loaderCallbackCount)
  {
    [(_MDExtensionManager *)self loadExtensions];
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:60.0];
    [(NSCondition *)self->_extensionsCondition waitUntilDate:v3];
  }
}

- (NSDictionary)fileProviderBundleMap
{
  [(NSCondition *)self->_extensionsCondition lock];
  fileProviderBundleMap = self->_fileProviderBundleMap;
  if (!fileProviderBundleMap)
  {
    [(_MDExtensionManager *)self _waitForLoadLocked];
    fileProviderBundleMap = self->_fileProviderBundleMap;
  }
  qos_class_t v4 = fileProviderBundleMap;
  [(NSCondition *)self->_extensionsCondition unlock];

  return v4;
}

- (NSSet)fileProviderBundleIDs
{
  [(NSCondition *)self->_extensionsCondition lock];
  fileProviderBundleIDs = self->_fileProviderBundleIDs;
  if (!fileProviderBundleIDs)
  {
    [(_MDExtensionManager *)self _waitForLoadLocked];
    fileProviderBundleIDs = self->_fileProviderBundleIDs;
  }
  qos_class_t v4 = fileProviderBundleIDs;
  [(NSCondition *)self->_extensionsCondition unlock];

  return v4;
}

- (id)allExtensionsWithBlock:(id)a3
{
  qos_class_t v4 = (unsigned int (**)(id, void *))a3;
  dispatch_block_t v5 = [(_MDExtensionManager *)self indexExtensionsByBundleID];
  qos_class_t v6 = v5;
  if (v4)
  {
    dispatch_block_t v7 = objc_opt_new();
    id v8 = [v6 objectEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      do
      {
        if (v4[2](v4, v10)) {
          [v7 addObject:v10];
        }
        uint64_t v11 = [v8 nextObject];

        uint64_t v10 = (void *)v11;
      }
      while (v11);
    }
  }
  else
  {
    dispatch_block_t v7 = [v5 allValues];
  }

  return v7;
}

- (id)anyExtensionWithBlock:(id)a3
{
  qos_class_t v4 = (unsigned int (**)(id, void *))a3;
  dispatch_block_t v5 = [(_MDExtensionManager *)self indexExtensionsByBundleID];
  qos_class_t v6 = [v5 objectEnumerator];
  dispatch_block_t v7 = 0;
  while (1)
  {
    id v8 = v7;
    dispatch_block_t v7 = [v6 nextObject];

    if (!v7) {
      break;
    }
    if (!v4 || v4[2](v4, v7))
    {
      id v9 = v7;
      break;
    }
  }

  return v7;
}

- (id)extensions
{
  return [(_MDExtensionManager *)self allExtensionsWithBlock:0];
}

- (void)_willRunJobWithBundleID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

- (void)_didRetryJobWithBundleID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

- (void)_performJob:(id)a3 extensions:(id)a4 count:(unint64_t)a5 throttle:(id)a6 perExtensionCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  queue = self->_queue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91___MDExtensionManager__performJob_extensions_count_throttle_perExtensionCompletionHandler___block_invoke;
  v25[3] = &unk_1E5549D50;
  id v26 = v13;
  id v27 = v12;
  v28 = self;
  id v29 = v14;
  id v30 = v15;
  unint64_t v31 = a5;
  objc_super v17 = queue;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  id v21 = v13;
  qos_class_t v22 = qos_class_self();
  if (v22 < 0x1A) {
    dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v25);
  }
  else {
    dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v22, 0, v25);
  }
  v24 = v23;
  dispatch_async(v17, v23);
}

+ (BOOL)_isSupported:(id)a3 extension:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)([v5 jobType] - 1) >= 3)
  {
    qos_class_t v16 = [v6 containerID];
LABEL_22:
    BOOL v18 = 1;
    goto LABEL_23;
  }
  dispatch_block_t v7 = [v5 protectionClasses];
  if ([v7 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      uint64_t v12 = *MEMORY[0x1E4F28358];
      id v20 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v14 isEqualToString:v12] & 1) != 0
            || ([v14 isEqualToString:@"Default"] & 1) != 0
            || ([v14 isEqualToString:@"Priority"] & 1) != 0)
          {
            char v15 = 1;
            dispatch_block_t v7 = v20;
            goto LABEL_18;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        char v15 = 0;
        dispatch_block_t v7 = v20;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v15 = 0;
    }
LABEL_18:
  }
  else
  {
    char v15 = 1;
  }

  objc_super v17 = [v6 containerID];
  qos_class_t v16 = v17;
  if ((v15 & 1) != 0 || ([v17 hasPrefix:@"com.apple."] & 1) == 0) {
    goto LABEL_22;
  }
  BOOL v18 = 0;
LABEL_23:

  return v18;
}

- (void)_performJob:(id)a3 extensions:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v37 = a6;
  dispatch_group_t v12 = dispatch_group_create();
  uint64_t v13 = [v11 count];
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
  char v15 = [v10 excludedBundleIDs];
  v40 = (void *)v14;
  group = v12;
  v38 = self;
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    objc_super v17 = [v10 excludedBundleIDs];
    BOOL v18 = (void *)[v16 initWithArray:v17];
  }
  else
  {
    BOOL v18 = 0;
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v19 = v11;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v25 = [v24 containerID];
        if (v18
          && (([v18 containsObject:v25] & 1) != 0
           || ([v24 identifiers],
               uint64_t v26 = objc_claimAutoreleasedReturnValue(),
               int v27 = [v26 intersectsSet:v18],
               v26,
               v27)))
        {
          v28 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v54 = v10;
            __int16 v55 = 2112;
            v56 = v24;
            id v29 = v28;
            id v30 = "Skipping job:%@ for extension:%@ since it was excluded";
LABEL_22:
            _os_log_debug_impl(&dword_18D0E3000, v29, OS_LOG_TYPE_DEBUG, v30, buf, 0x16u);
          }
        }
        else if ([v10 jobType] == 3 && objc_msgSend(v24, "dontRunDuringMigration"))
        {
          v28 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v54 = v10;
            __int16 v55 = 2112;
            v56 = v24;
            id v29 = v28;
            id v30 = "Skipping job:%@ for extension:%@ since it doesn't do migration";
            goto LABEL_22;
          }
        }
        else
        {
          if (+[_MDExtensionManager _isSupported:v10 extension:v24])
          {
            [v40 addObject:v24];
            dispatch_group_enter(group);
            goto LABEL_24;
          }
          v28 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v54 = v10;
            __int16 v55 = 2112;
            v56 = v24;
            id v29 = v28;
            id v30 = "Skipping job:%@ for extension:%@ since it was not supported";
            goto LABEL_22;
          }
        }

LABEL_24:
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v21);
  }

  uint64_t v31 = [v40 count];
  v32 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    -[_MDExtensionManager _performJob:extensions:perExtensionCompletionHandler:completionHandler:]();
  }

  if (v31)
  {
    v33 = [[CSExtensionJobThrottle alloc] initWithDictionary:&unk_1EDBD6B88];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke;
    v46[3] = &unk_1E554CCA0;
    id v48 = v39;
    v47 = group;
    [(_MDExtensionManager *)v38 _performJob:v10 extensions:v40 count:v31 throttle:v33 perExtensionCompletionHandler:v46];
  }
  extensionManagerQueue = v38->_extensionManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94___MDExtensionManager__performJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke_2;
  block[3] = &unk_1E5549C10;
  id v43 = v10;
  id v44 = v37;
  uint64_t v45 = v31;
  id v35 = v37;
  id v36 = v10;
  dispatch_group_notify(group, extensionManagerQueue, block);
}

- (void)indexRequestsPerformJob:(id)a3 forBundle:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  extensionManagerQueue = self->_extensionManagerQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75___MDExtensionManager_indexRequestsPerformJob_forBundle_completionHandler___block_invoke;
  v19[3] = &unk_1E5549E40;
  id v20 = v8;
  uint64_t v21 = self;
  id v22 = v9;
  id v23 = v10;
  dispatch_group_t v12 = extensionManagerQueue;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  qos_class_t v16 = qos_class_self();
  if (v16 < 0x1A) {
    dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  }
  else {
    dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, v19);
  }
  BOOL v18 = v17;
  dispatch_async(v12, v17);
}

- (void)indexRequestsPerformJob:(id)a3 perExtensionCompletionHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  extensionManagerQueue = self->_extensionManagerQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95___MDExtensionManager_indexRequestsPerformJob_perExtensionCompletionHandler_completionHandler___block_invoke;
  v19[3] = &unk_1E554CCC8;
  void v19[4] = self;
  id v20 = v8;
  id v21 = v10;
  id v22 = v9;
  dispatch_group_t v12 = extensionManagerQueue;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  qos_class_t v16 = qos_class_self();
  if (v16 < 0x1A) {
    dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  }
  else {
    dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, v19);
  }
  BOOL v18 = v17;
  dispatch_async(v12, v17);
}

- (void)indexRequestsPerformJob:(id)a3 forBundles:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  extensionManagerQueue = self->_extensionManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106___MDExtensionManager_indexRequestsPerformJob_forBundles_perExtensionCompletionHandler_completionHandler___block_invoke;
  block[3] = &unk_1E554CCF0;
  id v24 = v10;
  v25 = self;
  id v26 = v11;
  id v27 = v13;
  id v28 = v12;
  id v15 = extensionManagerQueue;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  id v19 = v10;
  qos_class_t v20 = qos_class_self();
  if (v20 < 0x1A) {
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  }
  else {
    dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
  }
  id v22 = v21;
  dispatch_async(v15, v21);
}

- (void)indexRequestsPerformJob:(id)a3 extensions:(id)a4 perExtensionCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  extensionManagerQueue = self->_extensionManagerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106___MDExtensionManager_indexRequestsPerformJob_extensions_perExtensionCompletionHandler_completionHandler___block_invoke;
  block[3] = &unk_1E554CCF0;
  void block[4] = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v15 = extensionManagerQueue;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  qos_class_t v20 = qos_class_self();
  if (v20 < 0x1A) {
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  }
  else {
    dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
  }
  id v22 = v21;
  dispatch_async(v15, v21);
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (void)setFileProviderBundleMap:(id)a3
{
}

- (void)setFileProviderBundleIDs:(id)a3
{
}

- (void)setIndexExtensionsByBundleID:(id)a3
{
}

- (_MDExtensionLoader)extensionLoader
{
  return self->_extensionLoader;
}

- (void)setExtensionLoader:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSCondition)extensionsCondition
{
  return self->_extensionsCondition;
}

- (void)setExtensionsCondition:(id)a3
{
}

- (OS_dispatch_queue)extensionManagerQueue
{
  return self->_extensionManagerQueue;
}

- (void)setExtensionManagerQueue:(id)a3
{
}

- (int64_t)loaderCallbackCount
{
  return self->_loaderCallbackCount;
}

- (void)setLoaderCallbackCount:(int64_t)a3
{
  self->_loaderCallbackCount = a3;
}

- (CSFileProviderDomainMonitor)fileProviderMoniter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileProviderMoniter);

  return (CSFileProviderDomainMonitor *)WeakRetained;
}

- (void)setFileProviderMoniter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fileProviderMoniter);
  objc_storeStrong((id *)&self->_extensionManagerQueue, 0);
  objc_storeStrong((id *)&self->_extensionsCondition, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensionLoader, 0);
  objc_storeStrong((id *)&self->_indexExtensionsByBundleID, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleMap, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_fileTypeNegativeCache, 0);

  objc_storeStrong((id *)&self->_fileTypeToExtensionMapping, 0);
}

- (void)extensionForFileType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "Skipping dyn type", v1, 2u);
}

- (void)extensionForFileType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "Found cached negative for %@", v2, v3, v4, v5, v6);
}

- (void)extensionForFileType:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "Caching negative for %@", v2, v3, v4, v5, v6);
}

- (void)extensionForFileType:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "Caching extension for %@", v2, v3, v4, v5, v6);
}

- (void)extensionForFileType:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "Returning cached extension for %@", v2, v3, v4, v5, v6);
}

- (void)_performJob:extensions:perExtensionCompletionHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Performing job:%@ with %ld indexing extensions");
}

@end