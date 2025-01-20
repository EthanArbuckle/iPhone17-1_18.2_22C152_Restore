@interface CacheDeleteManagedAssets
+ (CacheDeleteManagedAssets)cacheDeleteManagedAssetsWithInfo:(id)a3 atUrgency:(int)a4;
- (BOOL)cancel;
- (BOOL)dateHasExpired:(id)a3 interval:(double)a4;
- (BOOL)periodicShouldRemoveAsset:(id)a3;
- (CacheDeleteManagedAssets)initWithInfo:(id)a3 atUrgency:(int)a4;
- (NSDictionary)info;
- (NSString)volume;
- (id)analytics;
- (id)assetsFromArray:(id)a3 forAmount:(unint64_t)a4;
- (id)sizeEligibleAsset:(int64_t *)a3;
- (id)sortAssets:(id)a3;
- (int)urgency;
- (unint64_t)purgeAssets:(unint64_t)a3 testObject:(id)a4;
- (void)cancelPurge;
- (void)periodic:(id)a3;
- (void)setCancel:(BOOL)a3;
@end

@implementation CacheDeleteManagedAssets

+ (CacheDeleteManagedAssets)cacheDeleteManagedAssetsWithInfo:(id)a3 atUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [[CacheDeleteManagedAssets alloc] initWithInfo:v5 atUrgency:v4];

  return v6;
}

- (id)sizeEligibleAsset:(int64_t *)a3
{
  id v5 = +[NSMutableArray array];
  v6 = [(CacheDeleteManagedAssets *)self info];
  CFBooleanRef v7 = (const __CFBoolean *)CacheDeleteUserManagedAssetsPurgeable();

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if (kCFBooleanTrue == v7)
  {
    id v9 = v5;
    CacheManagementEnumerateAssets();
  }
  if (a3) {
    *a3 = v11[3];
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (CacheDeleteManagedAssets)initWithInfo:(id)a3 atUrgency:(int)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CacheDeleteManagedAssets;
  v8 = [(CacheDeleteManagedAssets *)&v17 init];
  id v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_info, a3);
  uint64_t v10 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v11 = evaluateStringProperty();
  volume = v9->_volume;
  v9->_volume = (NSString *)v11;

  if (!v9->_volume)
  {
    v14 = CDGetLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16[0] = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing volume parameter", (uint8_t *)v16, 2u);
    }

    goto LABEL_8;
  }
  v9->_urgency = a4;
  if ((a4 - 5) < 0xFFFFFFFC)
  {
LABEL_8:
    uint64_t v13 = 0;
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v13 = v9;
LABEL_9:

  return v13;
}

- (NSDictionary)info
{
  return self->_info;
}

- (BOOL)dateHasExpired:(id)a3 interval:(double)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  v6 = +[NSDate date];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  [v5 timeIntervalSinceReferenceDate];
  double v10 = v9;

  return v8 - v10 > a4 && v8 >= v10;
}

- (BOOL)periodicShouldRemoveAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 expirationDate];
  unsigned __int8 v6 = [(CacheDeleteManagedAssets *)self dateHasExpired:v5 interval:0.0];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    double v8 = [v4 downloadCompletionDate];

    if (v8)
    {
      BOOL v7 = 0;
    }
    else
    {
      double v9 = [v4 downloadStartDate];
      BOOL v7 = [(CacheDeleteManagedAssets *)self dateHasExpired:v9 interval:2592000.0];
    }
  }

  return v7;
}

- (id)sortAssets:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __39__CacheDeleteManagedAssets_sortAssets___block_invoke;
  v5[3] = &unk_10000C5F0;
  v5[4] = self;
  v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

uint64_t __39__CacheDeleteManagedAssets_sortAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  LODWORD(v6) = objc_msgSend(v7, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v6 < objc_msgSend(v8, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency")))
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_3:
      uint64_t v10 = -1;
      goto LABEL_7;
    }
    int v31 = 67109634;
    int v32 = 120;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
LABEL_26:
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SORT %d\nassetOne: %@\nassetTwo: %@", (uint8_t *)&v31, 0x1Cu);
    goto LABEL_3;
  }
  unsigned int v11 = objc_msgSend(v7, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v11 > objc_msgSend(v8, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency")))
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_6:
      uint64_t v10 = 1;
      goto LABEL_7;
    }
    int v31 = 67109634;
    int v32 = 123;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
LABEL_33:
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SORT %d\nassetOne: %@\nassetTwo: %@", (uint8_t *)&v31, 0x1Cu);
    goto LABEL_6;
  }
  uint64_t v13 = [v7 expirationDate];

  v14 = [v8 expirationDate];

  if (v13)
  {
    if (!v14)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v31 = 67109634;
      int v32 = 137;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      goto LABEL_26;
    }
    v15 = [v7 expirationDate];
    v16 = [v8 expirationDate];
    uint64_t v10 = (uint64_t)[v15 compare:v16];

    if (v10)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v31 = 67109634;
      int v32 = 133;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
LABEL_13:
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SORT %d\nassetOne: %@\nassetTwo: %@", (uint8_t *)&v31, 0x1Cu);
      goto LABEL_7;
    }
  }
  else if (v14)
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v31 = 67109634;
    int v32 = 141;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    goto LABEL_33;
  }
  int v17 = [v7 priority];
  if (v17 < (int)[v8 priority])
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_3;
    }
    int v31 = 67109634;
    int v32 = 147;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    goto LABEL_26;
  }
  int v18 = [v7 priority];
  if (v18 > (int)[v8 priority])
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v31 = 67109634;
    int v32 = 150;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    goto LABEL_33;
  }
  v19 = [v7 consumedDate];

  v20 = [v8 consumedDate];

  if (v19)
  {
    if (!v20)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v31 = 67109634;
      int v32 = 164;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      goto LABEL_26;
    }
    v21 = [v7 consumedDate];
    v22 = [v8 consumedDate];
    uint64_t v10 = (uint64_t)[v21 compare:v22];

    if (v10)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v31 = 67109634;
      int v32 = 160;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      goto LABEL_13;
    }
  }
  else if (v20)
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v31 = 67109634;
    int v32 = 168;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    goto LABEL_33;
  }
  v23 = [v7 downloadCompletionDate];

  v24 = [v8 downloadCompletionDate];

  if (v23)
  {
    if (!v24)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v31 = 67109634;
      int v32 = 182;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      goto LABEL_26;
    }
    v25 = [v7 downloadCompletionDate];
    v26 = [v8 downloadCompletionDate];
    uint64_t v10 = (uint64_t)[v25 compare:v26];

    if (v10)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v31 = 67109634;
      int v32 = 178;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      goto LABEL_13;
    }
  }
  else if (v24)
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v31 = 67109634;
    int v32 = 186;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    goto LABEL_33;
  }
  v27 = [v7 downloadStartDate];

  v28 = [v8 downloadStartDate];

  if (v27)
  {
    if (!v28)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v31 = 67109634;
      int v32 = 200;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      goto LABEL_26;
    }
    v29 = [v7 downloadStartDate];
    v30 = [v8 downloadStartDate];
    uint64_t v10 = (uint64_t)[v29 compare:v30];

    if (v10)
    {
      double v9 = CDGetLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v31 = 67109634;
      int v32 = 196;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      goto LABEL_13;
    }
  }
  else if (v28)
  {
    double v9 = CDGetLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v31 = 67109634;
    int v32 = 204;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    goto LABEL_33;
  }
  double v9 = CDGetLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v31 = 67109634;
    int v32 = 209;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SORT %d\nassetOne: %@\nassetTwo: %@", (uint8_t *)&v31, 0x1Cu);
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

uint64_t __46__CacheDeleteManagedAssets_sizeEligibleAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = objc_msgSend(v3, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v4 && v4 <= [*(id *)(a1 + 32) urgency])
  {
    id v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "purgeable: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 40) addObject:v3];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 size];
  }

  return 1;
}

- (id)assetsFromArray:(id)a3 forAmount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "identifier", (void)v19);
      v15 = [v6 objectForKeyedSubscript:v14];

      if (!v15)
      {
        v15 = +[NSMutableArray array];
        v16 = [v13 identifier];
        [v6 setObject:v15 forKeyedSubscript:v16];
      }
      [v15 addObject:v13];
      v10 += (unint64_t)[v13 sizeCached:1];

      if (v10 >= a4) {
        break;
      }
      if (v9 == (id)++v12)
      {
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v17 = [v6 copy];

  return v17;
}

- (unint64_t)purgeAssets:(unint64_t)a3 testObject:(id)a4
{
  id v6 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  unint64_t v24 = 0;
  id v7 = [(CacheDeleteManagedAssets *)self sizeEligibleAsset:&v24];
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = dispatch_queue_create("com.apple.mobile.cache_delete_managed_assets.CacheManagementAsset.Purge", 0);
  if (v24 <= a3)
  {
    id v11 = [v7 mutableCopy];
  }
  else
  {
    unint64_t v10 = [(CacheDeleteManagedAssets *)self sortAssets:v7];
    id v11 = [v10 mutableCopy];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke;
  block[3] = &unk_10000C6B0;
  long long v22 = &v25;
  unint64_t v23 = a3;
  id v18 = v11;
  long long v19 = self;
  id v20 = v6;
  dispatch_group_t v21 = v8;
  uint64_t v12 = v8;
  id v13 = v6;
  id v14 = v11;
  dispatch_group_async(v12, v9, block);
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v15 = v26[3];

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke(uint64_t a1)
{
  while (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) < *(void *)(a1 + 72))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "count", v16)) {
      break;
    }
    v2 = [*(id *)(a1 + 40) assetsFromArray:*(void *)(a1 + 32) forAmount:*(void *)(a1 + 72) - *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v19;
LABEL_5:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        id v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, v16);
        uint64_t v22 = v8;
        unint64_t v10 = +[NSArray arrayWithObjects:&v22 count:1];
        id v17 = v9;
        long long v16 = *(_OWORD *)(a1 + 56);
        id v11 = (id)v16;
        id v12 = v9;
        id v13 = (id)assert_group_cache_deletion();

        [*(id *)(a1 + 32) removeObjectsInArray:v12];
        unint64_t v14 = *(void *)(a1 + 72);
        unint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

        if (v15 >= v14) {
          break;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v5) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
}

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_2(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v4 = 136315394;
    long long v14 = v4;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
      unsigned __int8 v9 = objc_msgSend(*(id *)(a1 + 40), "cancel", v14);
      uint64_t v10 = *(void *)(a1 + 56);
      unint64_t v11 = *(void *)(a1 + 64);
      if ((v9 & 1) == 0 && *(void *)(*(void *)(v10 + 8) + 24) < v11)
      {
        [v8 sizeCached:1];
        id v12 = CDGetLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          long long v21 = "com.apple.mobile.cache_delete_managed_assets";
          __int16 v22 = 2112;
          unint64_t v23 = v8;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s purging %@", buf, 0x16u);
        }

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        long long v15 = *(_OWORD *)(a1 + 48);
        id v13 = (id)v15;
        CacheManagementRemove();

        uint64_t v10 = *(void *)(a1 + 56);
        unint64_t v11 = *(void *)(a1 + 64);
      }
      if (*(void *)(*(void *)(v10 + 8) + 24) >= v11) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    long long v4 = CDGetLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "purge CacheManagementRemove ERROR: %@, for asset: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(a1 + 56);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_13(id a1, NSError *a2, NSString *a3)
{
  long long v4 = a2;
  uint64_t v5 = a3;
  int v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    __int16 v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to acquire termination assertion for '%@': %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)cancelPurge
{
}

- (void)periodic:(id)a3
{
  id v4 = a3;
  +[NSMutableDictionary dictionary];
  long long v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  unint64_t v23 = __37__CacheDeleteManagedAssets_periodic___block_invoke;
  unint64_t v24 = &unk_10000C6D8;
  uint64_t v25 = self;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  CacheManagementEnumerateAssets();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v26;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v27 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1, v13, v14, v15, v16);
        id v13 = _NSConcreteStackBlock;
        uint64_t v14 = 3221225472;
        long long v15 = __37__CacheDeleteManagedAssets_periodic___block_invoke_2;
        long long v16 = &unk_10000C728;
        id v11 = v5;
        id v12 = (id)assert_group_cache_deletion();
      }
      id v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16, _NSConcreteStackBlock, 3221225472, __37__CacheDeleteManagedAssets_periodic___block_invoke_2, &unk_10000C728);
    }
    while (v7);
  }
}

uint64_t __37__CacheDeleteManagedAssets_periodic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) periodicShouldRemoveAsset:v3])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [v3 identifier];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      id v6 = +[NSMutableSet set];
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v3 identifier];
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
    [v6 addObject:v3];
  }
  return 1;
}

void __37__CacheDeleteManagedAssets_periodic___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = (char *)[v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        CacheManagementRemove();
      }
      id v3 = (char *)[v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __37__CacheDeleteManagedAssets_periodic___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "periodic CacheManagementRemove error: %@, %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = *(void **)(a1 + 32);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "periodic removed: %@", (uint8_t *)&v8, 0xCu);
  }
}

void __37__CacheDeleteManagedAssets_periodic___block_invoke_16(id a1, NSError *a2, NSString *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  uint64_t v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to acquire termination assertion for '%@': %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)analytics
{
  id v3 = [(CacheDeleteManagedAssets *)self info];
  uint64_t v25 = (void *)CacheDeleteUserManagedAssetsPurgeable();

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  unsigned int v4 = [(CacheDeleteManagedAssets *)self urgency] - 1;
  if (v4 >= 4) {
    CFStringRef v5 = @"???";
  }
  else {
    CFStringRef v5 = *(&off_10000C840 + (int)v4);
  }
  uint64_t v6 = +[NSString stringWithFormat:@"ManagedAssets_%@", v5];
  CacheManagementEnumerateAssets();
  v58[0] = @"ManagedAssets_autoPurgeEnabled";
  v59[0] = v25;
  unint64_t v24 = [v6 stringByAppendingString:@"_size"];
  v58[1] = v24;
  unint64_t v23 = +[NSNumber numberWithUnsignedLong:v55[3]];
  v59[1] = v23;
  uint64_t v22 = [v6 stringByAppendingString:@"_count"];
  v58[2] = v22;
  long long v21 = +[NSNumber numberWithUnsignedLong:v51[3]];
  v59[2] = v21;
  long long v20 = [v6 stringByAppendingString:@"_eligibleSize"];
  v58[3] = v20;
  long long v19 = +[NSNumber numberWithUnsignedLong:v47[3]];
  v59[3] = v19;
  long long v18 = [v6 stringByAppendingString:@"_eligibleCount"];
  v58[4] = v18;
  int v7 = +[NSNumber numberWithUnsignedLong:v43[3]];
  v59[4] = v7;
  int v8 = [v6 stringByAppendingString:@"_watchedSize"];
  v58[5] = v8;
  __int16 v9 = +[NSNumber numberWithUnsignedLong:v39[3]];
  v59[5] = v9;
  __int16 v10 = [v6 stringByAppendingString:@"_watchedCount"];
  v58[6] = v10;
  uint64_t v11 = +[NSNumber numberWithUnsignedLong:v35[3]];
  v59[6] = v11;
  id v12 = [v6 stringByAppendingString:@"_downloadingSize"];
  v58[7] = v12;
  id v13 = +[NSNumber numberWithUnsignedLong:v31[3]];
  v59[7] = v13;
  uint64_t v14 = [v6 stringByAppendingString:@"_downloadingCount"];
  v58[8] = v14;
  long long v15 = +[NSNumber numberWithUnsignedLong:v27[3]];
  v59[8] = v15;
  id v17 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:9];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v17;
}

uint64_t __37__CacheDeleteManagedAssets_analytics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 size];
  unsigned int v4 = objc_msgSend(v3, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v4 && v4 <= [*(id *)(a1 + 32) urgency])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v3 size];
  }
  CFStringRef v5 = [v3 consumedDate];

  if (v5)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v3 size];
  }
  uint64_t v6 = [v3 downloadCompletionDate];

  if (!v6)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += [v3 size];
  }

  return 1;
}

- (NSString)volume
{
  return self->_volume;
}

- (int)urgency
{
  return self->_urgency;
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_volume, 0);
}

@end