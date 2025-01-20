@interface CTKAssets
+ (void)initialize;
- (CTKAssets)init;
- (id)_getPlistFromPath:(id)a3;
- (id)_getPlistWithAsset:(id)a3 resourceName:(id)a4;
- (id)_loadIndexAsset:(id)a3 isFallback:(BOOL)a4;
- (id)_loadMetadataPlist:(id)a3;
- (id)common;
- (id)expectedIndexAssetLanguageCodes;
- (id)index;
- (void)_invokeIndexChangeHandler;
- (void)_loadCommonAsset;
- (void)_loadFallbackAsset;
- (void)_reloadPlists;
- (void)dealloc;
- (void)registerIndexChangeHandler:(id)a3;
@end

@implementation CTKAssets

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.siri.context.service", "Assets");
    v3 = (void *)qword_100563088;
    qword_100563088 = (uint64_t)v2;

    objc_opt_class();
  }
}

- (CTKAssets)init
{
  v54.receiver = self;
  v54.super_class = (Class)CTKAssets;
  os_log_t v2 = [(CTKAssets *)&v54 init];
  if (v2)
  {
    *(void *)v55 = 0;
    *(void *)&v55[8] = 0;
    if (pthread_mutexattr_init((pthread_mutexattr_t *)v55))
    {
      BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v3) {
        sub_1002B5F5C(v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    if (pthread_mutexattr_settype((pthread_mutexattr_t *)v55, 2))
    {
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v11) {
        sub_1002B5F20(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    if (pthread_mutex_init(&v2->_indexAssetLock, (const pthread_mutexattr_t *)v55))
    {
      BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v19) {
        sub_1002B5EE4(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    pthread_mutexattr_destroy((pthread_mutexattr_t *)v55);
    dispatch_queue_t v27 = dispatch_queue_create("CTKAssets-notification", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v27;

    v29 = +[NSBundle bundleForClass:objc_opt_class()];
    v30 = [v29 pathForResource:@"commonAsset" ofType:@"bundle"];

    if (!v30)
    {
      CFStringRef v58 = @"name";
      CFStringRef v59 = @"commonAsset";
      v47 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      id v48 = +[NSException exceptionWithName:@"DefaultCommonAssetException" reason:@"default common asset could not be found" userInfo:v47];

      objc_exception_throw(v48);
    }
    v31 = +[CTKPaths assetTypeDescriptor];
    id v32 = objc_alloc((Class)_PASAsset2);
    CFStringRef v56 = @"CTKAssetIdentifier";
    CFStringRef v57 = @"common";
    v33 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    LOBYTE(v49) = 1;
    v34 = (_PASAsset2 *)[v32 initWithAssetTypeDescriptorPath:v31 defaultBundlePath:v30 matchingKeysAndValues:v33 notificationQueue:v2->_queue logHandle:&_os_log_default enableAssetUpdates:1 purgeObsoleteInstalledAssets:v49];
    commonAsset = v2->_commonAsset;
    v2->_commonAsset = v34;

    if ([(_PASAsset2 *)v2->_commonAsset compatibilityVersion] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v36 = +[NSFileManager defaultManager];
      unsigned int v37 = [v36 fileExistsAtPath:v31];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v55 = 138412546;
        *(void *)&v55[4] = v31;
        *(_WORD *)&v55[12] = 1024;
        *(_DWORD *)&v55[14] = v37;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read compatibility version from AssetTypeDescriptor: %@ (exists:%i)", v55, 0x12u);
      }
    }
    v38 = v2->_commonAsset;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1002B4DA0;
    v52[3] = &unk_10048BCC0;
    v39 = v2;
    v53 = v39;
    id v40 = [(_PASAsset2 *)v38 registerUpdateHandler:v52];
    v41 = objc_opt_new();
    [v41 setUnderlyingQueue:v2->_queue];
    v42 = +[NSNotificationCenter defaultCenter];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1002B4DEC;
    v50[3] = &unk_10048BCE8;
    v43 = v39;
    v51 = v43;
    id v44 = [v42 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v41 usingBlock:v50];

    [(CTKAssets *)v43 _loadCommonAsset];
    v45 = +[MetricsLogging instance];
    [v45 recordAssetInfo:v43];
  }
  return v2;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_indexAssetLock);
  v3.receiver = self;
  v3.super_class = (Class)CTKAssets;
  [(CTKAssets *)&v3 dealloc];
}

- (id)common
{
  return self->_commonAsset;
}

- (id)index
{
  p_indexAssetLock = &self->_indexAssetLock;
  pthread_mutex_lock(&self->_indexAssetLock);
  if (self->_indexAsset && self->_indexId)
  {
    uint64_t v4 = +[_PASTuple2 tupleWithFirst:second:](_PASTuple2, "tupleWithFirst:second:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  pthread_mutex_unlock(p_indexAssetLock);
  return v4;
}

- (void)registerIndexChangeHandler:(id)a3
{
  p_indexAssetLock = &self->_indexAssetLock;
  id v5 = a3;
  pthread_mutex_lock(p_indexAssetLock);
  id v6 = objc_retainBlock(v5);

  id indexChangeHandler = self->_indexChangeHandler;
  self->_id indexChangeHandler = v6;

  pthread_mutex_unlock(p_indexAssetLock);
}

- (id)expectedIndexAssetLanguageCodes
{
  commonAsset = self->_commonAsset;
  if (commonAsset)
  {
    objc_super v3 = [(CTKAssets *)self _getPlistWithAsset:commonAsset resourceName:@"IndexMetadata"];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = [v3 objectForKeyedSubscript:@"LanguageMapping"];
      if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1002B50A8;
        v9[3] = &unk_10048BD10;
        id v10 = (id)objc_opt_new();
        id v6 = v10;
        [v5 enumerateKeysAndObjectsUsingBlock:v9];
        uint64_t v7 = [v6 allObjects];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)_getPlistWithAsset:(id)a3 resourceName:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = +[NSString stringWithFormat:@"%@.plist", a4];
    uint64_t v8 = [v6 filesystemPathForAssetDataRelativePath:v7];

    if (v8)
    {
      uint64_t v9 = [(CTKAssets *)self _getPlistFromPath:v8];
    }
    else
    {
      id v10 = qword_100563088;
      if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Warning] Asset not yet available.", buf, 2u);
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)_getPlistFromPath:(id)a3
{
  id v3 = a3;
  id v13 = 0;
  uint64_t v4 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = qword_100563088;
    if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Warning] Failed to read plist at %@: %@", buf, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v12 = 0;
    uint64_t v9 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v12];
    id v6 = v12;
    id v10 = qword_100563088;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v3;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Warning] Failed to decode plist at %@: %@", buf, 0x16u);
      }
      id v8 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
        sub_1002B6088();
      }
      id v8 = v9;
    }
  }
  return v8;
}

- (id)_loadMetadataPlist:(id)a3
{
  id v3 = [(CTKAssets *)self _getPlistWithAsset:a3 resourceName:@"IndexMetadata"];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"LanguageMapping"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = v5;
    }
    else
    {
      uint64_t v7 = qword_100563088;
      if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_ERROR)) {
        sub_1002B60F0(v7);
      }
      id v6 = 0;
    }
  }
  else
  {
    id v8 = qword_100563088;
    if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      CFStringRef v11 = @"IndexMetadata";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Warning] %@ is not available; aborting.",
        (uint8_t *)&v10,
        0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (void)_loadCommonAsset
{
  id v3 = [(CTKAssets *)self _loadMetadataPlist:self->_commonAsset];
  if (v3)
  {
    v29 = self;
    uint64_t v4 = +[NSLocale preferredLanguages];
    id v5 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v11 = [*(id *)(*((void *)&v34 + 1) + 8 * i) componentsSeparatedByString:@"-"];
          if ([v11 count])
          {
            id v12 = [v11 objectAtIndexedSubscript:0];
            id v13 = [v12 length];

            if (v13)
            {
              uint64_t v14 = [v11 objectAtIndexedSubscript:0];
              [v5 addObject:v14];
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v8);
    }

    id v15 = [v6 arrayByAddingObjectsFromArray:v5];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v31;
      while (2)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
          if (v21)
          {
            id v26 = v21;
            if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
              sub_1002B6264();
            }

            uint64_t v25 = 0;
            id v24 = v16;
            goto LABEL_33;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    uint64_t v22 = qword_100563088;
    if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
      sub_1002B6220(v22);
    }
    uint64_t v23 = [v3 objectForKeyedSubscript:@"fallback"];
    id v24 = v23;
    if (v23)
    {
      id v24 = v23;
      if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
        sub_1002B61B8();
      }
      uint64_t v25 = 1;
    }
    else
    {
      dispatch_queue_t v27 = qword_100563088;
      if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
        sub_1002B6174(v27);
      }
      uint64_t v25 = 0;
    }
    id v26 = v24;
LABEL_33:

    id v28 = [(CTKAssets *)v29 _loadIndexAsset:v26 isFallback:v25];
    [(CTKAssets *)v29 _reloadPlists];
  }
}

- (void)_reloadPlists
{
  id v11 = [(CTKAssets *)self _getPlistWithAsset:self->_commonAsset resourceName:@"ContextConfiguration"];
  id v3 = [(CTKAssets *)self _getPlistWithAsset:self->_indexAsset resourceName:@"ContextConfiguration"];
  uint64_t v4 = [@"ContextConfiguration" stringByAppendingPathExtension:@"plist"];
  id v5 = +[CTKPaths database];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = +[NSFileManager defaultManager];
  unsigned int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    uint64_t v9 = [(CTKAssets *)self _getPlistFromPath:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v10 = +[NSString stringWithFormat:@"0-%ld-%ld-%ld-%ld", [(_PASAsset2 *)self->_commonAsset compatibilityVersion], [(_PASAsset2 *)self->_commonAsset assetVersion], [(_PASAsset2 *)self->_indexAsset compatibilityVersion], [(_PASAsset2 *)self->_indexAsset assetVersion]];
  +[ContextConfiguration reloadFromGlobalPlist:v11 indexSpecificPlist:v3 developerPlist:v9 indexVersionId:v10];
}

- (void)_invokeIndexChangeHandler
{
  p_indexAssetLock = &self->_indexAssetLock;
  pthread_mutex_lock(&self->_indexAssetLock);
  [(CTKAssets *)self _reloadPlists];
  id indexChangeHandler = self->_indexChangeHandler;
  if (indexChangeHandler) {
    dispatch_async((dispatch_queue_t)self->_queue, indexChangeHandler);
  }
  pthread_mutex_unlock(p_indexAssetLock);
}

- (id)_loadIndexAsset:(id)a3 isFallback:(BOOL)a4
{
  id v6 = a3;
  p_indexAssetLock = &self->_indexAssetLock;
  pthread_mutex_lock(&self->_indexAssetLock);
  if (a4)
  {
    char v8 = 0;
    uint64_t v9 = @"fallback";
  }
  else
  {
    uint64_t v9 = (__CFString *)[v6 copy];
    if (v9)
    {
      char v8 = 0;
    }
    else
    {
      if (!self->_indexId) {
        goto LABEL_8;
      }
      char v8 = 1;
    }
  }
  if ([(__CFString *)v9 isEqualToString:self->_indexId])
  {
LABEL_8:
    int v10 = qword_100563088;
    if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
      sub_1002B62D8((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_27;
  }
  id v17 = qword_100563088;
  if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
    sub_1002B63B0(&self->_indexId, (uint64_t)v9, v17);
  }
  if (self->indexNotificationToken)
  {
    if ((-[_PASAsset2 deregisterUpdateHandlerAsyncWithToken:](self->_indexAsset, "deregisterUpdateHandlerAsyncWithToken:") & 1) == 0)
    {
      id v18 = qword_100563088;
      if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Warning] Unexpected failure to deregister notification token", buf, 2u);
      }
    }
    indexNotificationToken = self->indexNotificationToken;
    self->indexNotificationToken = 0;
  }
  if (v8)
  {
    indexId = self->_indexId;
    self->_indexId = 0;

    indexAsset = self->_indexAsset;
    self->_indexAsset = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_indexId, v9);
    id v22 = objc_alloc((Class)_PASAsset2);
    uint64_t v23 = +[CTKPaths assetTypeDescriptor];
    CFStringRef v37 = @"CTKAssetIdentifier";
    id v38 = v6;
    id v24 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    LOBYTE(v34) = 1;
    uint64_t v25 = (_PASAsset2 *)[v22 initWithAssetTypeDescriptorPath:v23 defaultBundlePath:0 matchingKeysAndValues:v24 notificationQueue:self->_queue logHandle:&_os_log_default enableAssetUpdates:1 purgeObsoleteInstalledAssets:v34];
    id v26 = self->_indexAsset;
    self->_indexAsset = v25;

    dispatch_queue_t v27 = self->_indexAsset;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1002B5DC4;
    v35[3] = &unk_10048BCC0;
    v35[4] = self;
    id v28 = [(_PASAsset2 *)v27 registerUpdateHandler:v35];
    v29 = self->indexNotificationToken;
    self->indexNotificationToken = v28;

    if (!a4)
    {
      long long v30 = [(_PASAsset2 *)self->_indexAsset filesystemPathForAssetDataRelativePath:@"lucene.tagged.53.idx"];
      if (!v30)
      {
        if (os_log_type_enabled((os_log_t)qword_100563088, OS_LOG_TYPE_DEBUG)) {
          sub_1002B6348();
        }
        [(CTKAssets *)self _loadFallbackAsset];
      }
    }
  }
  id indexChangeHandler = self->_indexChangeHandler;
  if (indexChangeHandler) {
    dispatch_async((dispatch_queue_t)self->_queue, indexChangeHandler);
  }
LABEL_27:
  long long v32 = self->_indexAsset;

  pthread_mutex_unlock(p_indexAssetLock);
  return v32;
}

- (void)_loadFallbackAsset
{
  id v3 = [(CTKAssets *)self _loadMetadataPlist:self->_commonAsset];
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [v3 objectForKeyedSubscript:@"fallback"];
    if (v4) {
      id v5 = [(CTKAssets *)self _loadIndexAsset:v4 isFallback:1];
    }

    id v3 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_indexChangeHandler, 0);
  objc_storeStrong((id *)&self->indexNotificationToken, 0);
  objc_storeStrong((id *)&self->_indexId, 0);
  objc_storeStrong((id *)&self->_indexAsset, 0);
  objc_storeStrong((id *)&self->_commonAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end