@interface CKChatItemSizeCache
+ (id)sharedInstance;
+ (id)test_cachePath;
- (BOOL)cachedSizeForChatItem:(id)a3 size:(CGSize *)a4 textAlignmentInsets:(UIEdgeInsets *)a5 fittingSize:(CGSize)a6;
- (BOOL)test_throwExceptionDuringInflate;
- (CKChatItemSizeCache)init;
- (IMDoubleLinkedList)orderedKeys;
- (IMScheduledUpdater)evictionUpdater;
- (NSData)test_cacheData;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)chatItemGUIDToCacheKeyMap;
- (NSString)preferredLocalization;
- (OS_dispatch_queue)cacheDiskQueue;
- (id)_fontCacheKey;
- (id)_generateChatItemGuidToCacheKeyMapWithCache:(id)a3;
- (id)_systemVersion;
- (id)cacheKeyForChatItem:(id)a3 fittingSize:(CGSize)a4;
- (id)initForTestAndThrowException:(BOOL)a3 cacheFileData:(id)a4;
- (void)___invalidateSizeCacheMetricsForKeys:(id)a3;
- (void)_commonInit;
- (void)_evictIfNeeded;
- (void)_inflateCache;
- (void)_persistCache;
- (void)_updateKeyMap:(id)a3 forKey:(id)a4 sizeCacheKey:(id)a5;
- (void)dealloc;
- (void)invalidateCachedSizeForChatItems:(id)a3 reason:(id)a4;
- (void)invalidateCachedSizeForGUIDPrefix:(id)a3 reason:(id)a4;
- (void)setCache:(id)a3;
- (void)setCacheDiskQueue:(id)a3;
- (void)setCachedSizeForChatItem:(id)a3 size:(CGSize)a4 textAlignmentInsets:(UIEdgeInsets)a5 fittingSize:(CGSize)a6;
- (void)setChatItemGUIDToCacheKeyMap:(id)a3;
- (void)setEvictionUpdater:(id)a3;
- (void)setOrderedKeys:(id)a3;
- (void)setPreferredLocalization:(id)a3;
- (void)setTest_cacheData:(id)a3;
- (void)setTest_throwExceptionDuringInflate:(BOOL)a3;
@end

@implementation CKChatItemSizeCache

void __37__CKChatItemSizeCache_sharedInstance__block_invoke()
{
  if (CKIsRunningInMessages())
  {
    v0 = objc_alloc_init(CKChatItemSizeCache);
    v1 = (void *)sharedInstance_sSizeCache;
    sharedInstance_sSizeCache = (uint64_t)v0;
  }
}

- (CKChatItemSizeCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKChatItemSizeCache;
  v2 = [(CKChatItemSizeCache *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKChatItemSizeCache *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  if (!CKIsRunningInIMTranscoderAgent())
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[CKChatItemSizeCache setCache:](self, "setCache:");
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKChatItemSizeCache *)self setChatItemGUIDToCacheKeyMap:v3];
    id v4 = objc_alloc_init(MEMORY[0x1E4F6C330]);
    [(CKChatItemSizeCache *)self setOrderedKeys:v4];
    [(CKChatItemSizeCache *)self _inflateCache];
    objc_super v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v6 = [v5 componentsJoinedByString:@"-"];

    [(CKChatItemSizeCache *)self setPreferredLocalization:v6];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F6C3D8]) initWithTarget:self action:sel__evictIfNeeded];
    [(CKChatItemSizeCache *)self setEvictionUpdater:v7];
    v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.messages.chatitemsizemetricdiskqueue", 0);
    cacheDiskQueue = self->_cacheDiskQueue;
    self->_cacheDiskQueue = v8;

    if (CKIsRunningInMacCatalyst())
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel_applicationWillResignActive name:*MEMORY[0x1E4F43710] object:0];
    }
    else
    {
      v10 = [MEMORY[0x1E4F6C3E0] sharedInstance];
      [v10 addListener:self];
    }
  }
}

- (void)setPreferredLocalization:(id)a3
{
}

- (void)setOrderedKeys:(id)a3
{
}

- (void)setEvictionUpdater:(id)a3
{
}

- (void)_inflateCache
{
  v68[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(CKChatItemSizeCache *)self test_cacheData];
  if (v3)
  {
    id v4 = [(CKChatItemSizeCache *)self test_cacheData];
  }
  else
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1C9B8];
    v6 = NSString;
    v7 = [@"/var/mobile/Library/SMS/" stringByAppendingString:@"com.apple.messages.geometrycache_v%d.plist"];
    v8 = objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, @"%d", 0, 15);
    id v4 = [v5 dataWithContentsOfFile:v8];
  }
  if (v4)
  {
    v49 = v4;
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v68[0] = objc_opt_class();
    v68[1] = objc_opt_class();
    v68[2] = objc_opt_class();
    v68[3] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];
    v48 = [v9 setWithArray:v10];

    id v61 = 0;
    id v11 = self;
    v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v48 fromData:v4 error:&v61];
    v47 = (char *)v61;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(CKChatItemSizeCache *)self test_throwExceptionDuringInflate])
      {
        v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"TestException" reason:@"CKChatItemSizeCache test exception" userInfo:0];
        [v13 raise];

        id v11 = self;
      }
      v14 = [v12 objectForKeyedSubscript:@"ChatItemSizeMetricCache"];
      v46 = v14;
      if (v14)
      {
        id v15 = v14;

        v12 = v15;
        id v11 = self;
      }
      v16 = (void *)[v12 mutableCopy];
      [(CKChatItemSizeCache *)v11 setCache:v16];

      v17 = [v12 allKeys];
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      obuint64_t j = v17;
      uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v57 + 1) + 8 * i);
            v23 = [v12 objectForKeyedSubscript:v22];
            [v23 setKey:v22];
            [v18 addObject:v23];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
        }
        while (v19);
      }

      [v18 sortUsingComparator:&__block_literal_global_161_0];
      v24 = [(CKChatItemSizeCache *)self orderedKeys];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v25 = v18;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v66 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v54 != v27) {
              objc_enumerationMutation(v25);
            }
            v29 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            id v30 = objc_alloc(MEMORY[0x1E4F6C338]);
            v31 = [v29 key];
            v32 = (void *)[v30 initWithObject:v31];

            [v29 setNode:v32];
            [v24 pushLinkedListNode:v32];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v66 count:16];
        }
        while (v26);
      }

      v33 = [(CKChatItemSizeCache *)self cache];
      v34 = [(CKChatItemSizeCache *)self _generateChatItemGuidToCacheKeyMapWithCache:v33];

      [(CKChatItemSizeCache *)self setChatItemGUIDToCacheKeyMap:v34];
    }
    else if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v47;
        _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "CKChatItemSizeCache: Failed to unarchive with error %@", buf, 0xCu);
      }
    }
    id v4 = v49;
  }
  else if (IMOSLoggingEnabled())
  {
    v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "-[CKChatItemSizeCache _inflateCache]";
      _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "%s No size metrics cache found on disk", buf, 0xCu);
    }
  }
  uint64_t v37 = 0;
  do
  {
    v38 = NSString;
    v39 = [@"/var/mobile/Library/SMS/" stringByAppendingString:@"com.apple.messages.geometrycache_v%d.plist"];
    objc_msgSend(v38, "stringWithValidatedFormat:validFormatSpecifiers:error:", v39, @"%d", 0, v37);
    v40 = (char *)objc_claimAutoreleasedReturnValue();

    v41 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v42 = [v41 fileExistsAtPath:v40];

    if (v42)
    {
      v43 = [MEMORY[0x1E4F28CB8] defaultManager];
      v52[0] = 0;
      [v43 removeItemAtPath:v40 error:v52];
      id v44 = v52[0];

      if (v44 && IMOSLoggingEnabled())
      {
        v45 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v63 = v40;
          __int16 v64 = 2112;
          id v65 = v44;
          _os_log_impl(&dword_18EF18000, v45, OS_LOG_TYPE_INFO, "CKChatItemSizeCache: Failed to purge legacy cache at path %@ with error %@", buf, 0x16u);
        }
      }
    }

    uint64_t v37 = (v37 + 1);
  }
  while (v37 != 15);
}

- (void)setChatItemGUIDToCacheKeyMap:(id)a3
{
}

- (void)setCache:(id)a3
{
}

- (BOOL)test_throwExceptionDuringInflate
{
  return self->_test_throwExceptionDuringInflate;
}

- (NSData)test_cacheData
{
  return self->_test_cacheData;
}

- (IMDoubleLinkedList)orderedKeys
{
  return self->_orderedKeys;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (id)_generateChatItemGuidToCacheKeyMapWithCache:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(v4, "allValues", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 chatItemGUID];
        uint64_t v13 = [v11 key];
        v14 = (void *)v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [(CKChatItemSizeCache *)self _updateKeyMap:v5 forKey:v12 sizeCacheKey:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)sharedInstance
{
  if (CKIsRunningInCKTester())
  {
    id v2 = 0;
  }
  else
  {
    if (sharedInstance_onceToken_0 != -1) {
      dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_25);
    }
    id v2 = (id)sharedInstance_sSizeCache;
  }

  return v2;
}

- (void)dealloc
{
  [(IMScheduledUpdater *)self->_evictionUpdater invalidate];
  evictionUpdater = self->_evictionUpdater;
  self->_evictionUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)CKChatItemSizeCache;
  [(CKChatItemSizeCache *)&v4 dealloc];
}

- (id)initForTestAndThrowException:(BOOL)a3 cacheFileData:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKChatItemSizeCache;
  uint64_t v7 = [(CKChatItemSizeCache *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(CKChatItemSizeCache *)v7 setTest_throwExceptionDuringInflate:v4];
    [(CKChatItemSizeCache *)v8 setTest_cacheData:v6];
    [(CKChatItemSizeCache *)v8 _commonInit];
  }

  return v8;
}

- (BOOL)cachedSizeForChatItem:(id)a3 size:(CGSize *)a4 textAlignmentInsets:(UIEdgeInsets *)a5 fittingSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  if (CKDisableChatItemSizeCache() || CKIsRunningInIMTranscoderAgent())
  {
    BOOL v12 = 0;
    goto LABEL_4;
  }
  v14 = -[CKChatItemSizeCache cacheKeyForChatItem:fittingSize:](self, "cacheKeyForChatItem:fittingSize:", v11, width, height);
  BOOL v15 = [(CKChatItemSizeCache *)self cache];
  v16 = [v15 objectForKey:v14];

  BOOL v12 = v16 != 0;
  if (!v16)
  {
    CGFloat v25 = *MEMORY[0x1E4F1DB30];
    CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    CGFloat v29 = *MEMORY[0x1E4F437F8];
    CGFloat v31 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    CGFloat v33 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    CGFloat v35 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  long long v17 = [v16 node];
  id v18 = objc_alloc(MEMORY[0x1E4F6C338]);
  long long v19 = [v17 object];
  long long v20 = (void *)[v18 initWithObject:v19];

  [v16 setKey:v14];
  [v16 setNode:v20];
  v21 = [MEMORY[0x1E4F1C9C8] date];
  [v16 setLastAccess:v21];

  uint64_t v22 = [(CKChatItemSizeCache *)self orderedKeys];
  [v22 removeLinkedListNode:v17];

  v23 = [(CKChatItemSizeCache *)self orderedKeys];
  [v23 pushLinkedListNode:v20];

  [v16 size];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [v16 textAlignmentInsets];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  if (a4)
  {
LABEL_7:
    a4->double width = v25;
    a4->double height = v27;
  }
LABEL_8:
  if (a5)
  {
    a5->top = v29;
    a5->left = v31;
    a5->bottom = v33;
    a5->right = v35;
  }

LABEL_4:
  return v12;
}

- (void)setCachedSizeForChatItem:(id)a3 size:(CGSize)a4 textAlignmentInsets:(UIEdgeInsets)a5 fittingSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double v12 = a4.height;
  double v13 = a4.width;
  id v25 = a3;
  if (!CKDisableChatItemSizeCache()
    && !CKIsRunningInIMTranscoderAgent()
    && !+[CKApplicationState isResizing])
  {
    BOOL v15 = [v25 IMChatItem];
    v16 = [v15 guid];

    long long v17 = -[CKChatItemSizeCache cacheKeyForChatItem:fittingSize:](self, "cacheKeyForChatItem:fittingSize:", v25, width, height);
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F6C338]) initWithObject:v17];
    long long v19 = objc_alloc_init(CKChatItemCachedSizeMetrics);
    [(CKChatItemCachedSizeMetrics *)v19 setChatItemGUID:v16];
    -[CKChatItemCachedSizeMetrics setSize:](v19, "setSize:", v13, v12);
    -[CKChatItemCachedSizeMetrics setTextAlignmentInsets:](v19, "setTextAlignmentInsets:", top, left, bottom, right);
    [(CKChatItemCachedSizeMetrics *)v19 setKey:v17];
    long long v20 = [MEMORY[0x1E4F1C9C8] date];
    [(CKChatItemCachedSizeMetrics *)v19 setLastAccess:v20];

    [(CKChatItemCachedSizeMetrics *)v19 setNode:v18];
    v21 = [(CKChatItemSizeCache *)self cache];
    [v21 setObject:v19 forKey:v17];

    uint64_t v22 = [(CKChatItemSizeCache *)self orderedKeys];
    [v22 pushLinkedListNode:v18];

    v23 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
    [(CKChatItemSizeCache *)self _updateKeyMap:v23 forKey:v16 sizeCacheKey:v17];

    double v24 = [(CKChatItemSizeCache *)self evictionUpdater];
    [v24 setNeedsUpdate];
  }
}

- (void)invalidateCachedSizeForChatItems:(id)a3 reason:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  uint64_t v7 = IMLogHandleForCategory();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  uint64_t v9 = v7;
  objc_super v10 = v9;
  unint64_t v29 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InvalidateChatItems", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;

  id v11 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [*(id *)(*((void *)&v31 + 1) + 8 * i) IMChatItem];
        id v18 = [v17 guid];

        long long v19 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
        long long v20 = [v19 objectForKey:v18];

        [v11 unionSet:v20];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v14);
  }

  v21 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
  uint64_t v22 = [v21 count];

  uint64_t v23 = [v11 count];
  [(CKChatItemSizeCache *)self ___invalidateSizeCacheMetricsForKeys:v11];
  double v24 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
  uint64_t v25 = [v24 count];

  double v26 = v10;
  CGFloat v27 = v26;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v36 = v22;
    __int16 v37 = 2048;
    uint64_t v38 = v23;
    __int16 v39 = 2048;
    uint64_t v40 = v25;
    __int16 v41 = 2112;
    id v42 = v30;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v27, OS_SIGNPOST_INTERVAL_END, spid, "InvalidateChatItems", "InvalidateChatItems: old number of cached size = %lu, number of invalidated sizes = %lu, number of new chaches size = %lu, reason: %@", buf, 0x2Au);
  }
}

- (void)invalidateCachedSizeForGUIDPrefix:(id)a3 reason:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  uint64_t v7 = IMLogHandleForCategory();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  uint64_t v9 = v7;
  objc_super v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InvalidateChatItems", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;

  id v12 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
  uint64_t v13 = [v12 allKeys];

  uint64_t v14 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v20, "containsString:", v6, spid)) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v17);
  }

  v21 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
  uint64_t v22 = [v21 count];

  uint64_t v23 = [v14 count];
  [(CKChatItemSizeCache *)self ___invalidateSizeCacheMetricsForKeys:v14];
  double v24 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
  uint64_t v25 = [v24 count];

  double v26 = v10;
  CGFloat v27 = v26;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v35 = v22;
    __int16 v36 = 2048;
    uint64_t v37 = v23;
    __int16 v38 = 2048;
    uint64_t v39 = v25;
    __int16 v40 = 2112;
    id v41 = v29;
    _os_signpost_emit_with_name_impl(&dword_18EF18000, v27, OS_SIGNPOST_INTERVAL_END, spid, "InvalidateChatItems", "InvalidateChatItems: old number of cached size = %lu, number of invalidated sizes = %lu, number of new chaches size = %lu, reason: %@", buf, 0x2Au);
  }
}

- (void)___invalidateSizeCacheMetricsForKeys:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * v9);
        unint64_t v11 = [(CKChatItemSizeCache *)self cache];
        id v12 = [v11 objectForKeyedSubscript:v10];

        if (v12)
        {
          uint64_t v13 = [v12 chatItemGUID];
          BOOL v14 = !v13 || v10 == 0;
          BOOL v15 = !v14;

          if (v15) {
            [v5 addObject:v10];
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v7);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [(CKChatItemSizeCache *)self cache];
      uint64_t v18 = [v17 count];
      uint64_t v19 = [v5 count];
      long long v20 = [(CKChatItemSizeCache *)self cache];
      uint64_t v21 = [v20 count];
      uint64_t v22 = [v5 count];
      *(_DWORD *)buf = 134218496;
      uint64_t v45 = v18;
      __int16 v46 = 2048;
      uint64_t v47 = v19;
      __int16 v48 = 2048;
      uint64_t v49 = v21 - v22;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "___invalidateSizeCacheMetrics: Current cache count: %ld – invalidation count: %ld – expected new count: %ld", buf, 0x20u);
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v36;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * v26);
        double v28 = [(CKChatItemSizeCache *)self cache];
        id v29 = [v28 objectForKeyedSubscript:v27];

        long long v30 = [(CKChatItemSizeCache *)self chatItemGUIDToCacheKeyMap];
        long long v31 = [v29 chatItemGUID];
        [v30 removeObjectForKey:v31];

        long long v32 = [(CKChatItemSizeCache *)self orderedKeys];
        long long v33 = [v29 node];
        [v32 removeLinkedListNode:v33];

        long long v34 = [(CKChatItemSizeCache *)self cache];
        [v34 removeObjectForKey:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v24);
  }
}

- (id)cacheKeyForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  CGFloat width = a4.width;
  id v6 = a3;
  uint64_t v7 = [(CKChatItemSizeCache *)self _fontCacheKey];
  uint64_t v8 = [(CKChatItemSizeCache *)self _systemVersion];
  BOOL v9 = [(CKChatItemSizeCache *)self _boldTextEnabled];
  uint64_t v10 = NSString;
  unint64_t v11 = [v6 IMChatItem];

  id v12 = [v11 guid];
  uint64_t v13 = [(CKChatItemSizeCache *)self preferredLocalization];
  BOOL v14 = [NSNumber numberWithBool:v9];
  BOOL v15 = [v10 stringWithFormat:@"<%@-%f-%@-%@-%@-%@>", v12, *(void *)&width, v7, v8, v13, v14];

  return v15;
}

- (id)_systemVersion
{
  if (_systemVersion_onceToken != -1) {
    dispatch_once(&_systemVersion_onceToken, &__block_literal_global_129);
  }
  id v2 = (void *)_systemVersion_sSystemVersion;

  return v2;
}

void __37__CKChatItemSizeCache__systemVersion__block_invoke()
{
  id v2 = [MEMORY[0x1E4F61740] sharedInstance];
  uint64_t v0 = [v2 productOSVersion];
  v1 = (void *)_systemVersion_sSystemVersion;
  _systemVersion_sSystemVersion = v0;
}

- (id)_fontCacheKey
{
  id v2 = [MEMORY[0x1E4F42738] sharedApplication];
  id v3 = [v2 preferredContentSizeCategory];

  return v3;
}

- (void)_evictIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKChatItemSizeCache *)self orderedKeys];
  unint64_t v4 = [v3 count];
  if (v4 >= 0xBB9 && IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      unint64_t v11 = "-[CKChatItemSizeCache _evictIfNeeded]";
      __int16 v12 = 2048;
      unint64_t v13 = v4;
      __int16 v14 = 1024;
      int v15 = 3000;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s - Current %tu max %d will evict", (uint8_t *)&v10, 0x1Cu);
    }
  }
  for (uint64_t i = [MEMORY[0x1E4F1CA80] set];
  {
    uint64_t v7 = [v3 last];
    uint64_t v8 = v7;
    if (v7)
    {
      BOOL v9 = [v7 object];
      [i addObject:v9];
    }
  }
  [(CKChatItemSizeCache *)self ___invalidateSizeCacheMetricsForKeys:i];
}

- (void)_persistCache
{
  id v3 = [(CKChatItemSizeCache *)self evictionUpdater];
  [v3 updateIfNeeded];

  unint64_t v4 = [(CKChatItemSizeCache *)self cache];
  id v5 = (void *)[v4 copy];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CKChatItemSizeCache__persistCache__block_invoke;
  aBlock[3] = &unk_1E5620C40;
  id v9 = v5;
  id v6 = v5;
  uint64_t v7 = _Block_copy(aBlock);
  dispatch_async((dispatch_queue_t)self->_cacheDiskQueue, v7);
}

void __36__CKChatItemSizeCache__persistCache__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v13 = 0;
  id v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v13];
  id v3 = v13;
  if (v3) {
    goto LABEL_13;
  }
  uint64_t v4 = CKIsRunningInMacCatalyst() ? 1 : 1073741825;
  id v5 = NSString;
  id v6 = [@"/var/mobile/Library/SMS/" stringByAppendingString:@"com.apple.messages.geometrycache_v%d.plist"];
  uint64_t v7 = objc_msgSend(v5, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, @"%d", 0, 15);
  id v12 = 0;
  [v2 writeToFile:v7 options:v4 error:&v12];
  id v3 = v12;

  if (v3)
  {
LABEL_13:
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = NSString;
        int v10 = [@"/var/mobile/Library/SMS/" stringByAppendingString:@"com.apple.messages.geometrycache_v%d.plist"];
        unint64_t v11 = objc_msgSend(v9, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, @"%d", 0, 15);
        *(_DWORD *)buf = 138412546;
        id v15 = v3;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKChatItemSizeCache: failed serializing or persisting serialized cache %@ %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __36__CKChatItemSizeCache__inflateCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 lastAccess];
  id v6 = [v4 lastAccess];

  if (v5 || !v6) {
    uint64_t v7 = [v5 compare:v6];
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)_updateKeyMap:(id)a3 forKey:(id)a4 sizeCacheKey:(id)a5
{
  id v7 = a5;
  if (a3 && a4 && v7)
  {
    id v12 = v7;
    id v8 = a4;
    id v9 = a3;
    int v10 = [v9 objectForKey:v8];
    if (v10)
    {
      unint64_t v11 = v10;
      [v10 addObject:v12];
    }
    else
    {
      unint64_t v11 = [MEMORY[0x1E4F1CA80] setWithObject:v12];
    }
    [v9 setObject:v11 forKey:v8];

    id v7 = v12;
  }
}

+ (id)test_cachePath
{
  id v2 = NSString;
  id v3 = [@"/var/mobile/Library/SMS/" stringByAppendingString:@"com.apple.messages.geometrycache_v%d.plist"];
  id v4 = objc_msgSend(v2, "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, @"%d", 0, 15);

  return v4;
}

- (NSMutableDictionary)chatItemGUIDToCacheKeyMap
{
  return self->_chatItemGUIDToCacheKeyMap;
}

- (OS_dispatch_queue)cacheDiskQueue
{
  return self->_cacheDiskQueue;
}

- (void)setCacheDiskQueue:(id)a3
{
}

- (IMScheduledUpdater)evictionUpdater
{
  return self->_evictionUpdater;
}

- (NSString)preferredLocalization
{
  return self->_preferredLocalization;
}

- (void)setTest_throwExceptionDuringInflate:(BOOL)a3
{
  self->_test_throwExceptionDuringInflate = a3;
}

- (void)setTest_cacheData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_cacheData, 0);
  objc_storeStrong((id *)&self->_preferredLocalization, 0);
  objc_storeStrong((id *)&self->_evictionUpdater, 0);
  objc_storeStrong((id *)&self->_cacheDiskQueue, 0);
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_chatItemGUIDToCacheKeyMap, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end