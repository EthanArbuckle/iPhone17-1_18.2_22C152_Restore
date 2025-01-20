@interface _GCConfigurationBundleLocator
- (NSString)configurationType;
- (_GCConfigurationBundleLocator)init;
- (_GCConfigurationBundleLocator)initWithConfigurationType:(id)a3 provider:(id)a4;
- (id)fetchBundles;
- (uint64_t)_onqueue_asset_updateBundles;
- (uint64_t)_onqueue_filesystem_updateBundles;
- (void)_assetDidChange:(id)a3;
- (void)_filesystemDidChange:(id)a3;
- (void)_onqueue_asset_updateBundles;
- (void)_onqueue_filesystem_updateBundles;
- (void)_onqueue_loadBundlesIfNeeded;
- (void)_onqueue_rebuildBundleCollection;
- (void)dealloc;
@end

@implementation _GCConfigurationBundleLocator

- (_GCConfigurationBundleLocator)initWithConfigurationType:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v57.receiver = self;
  v57.super_class = (Class)_GCConfigurationBundleLocator;
  id v8 = [(_GCConfigurationBundleLocator *)&v57 init];
  uint64_t v9 = [v6 copy];
  v10 = (void *)*((void *)v8 + 11);
  *((void *)v8 + 11) = v9;

  id v11 = v6;
  uint64_t v12 = gc_log_create_configuration((char *)[v11 UTF8String]);
  v13 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v12;

  uint64_t v14 = GCLookupDispatchWorkloop(v7, 1);
  v15 = (void *)*((void *)v8 + 2);
  *((void *)v8 + 2) = v14;

  id v16 = +[NSString stringWithFormat:@"ConfigBundleLocator:%@", v11];
  dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
  v18 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v17;

  v19 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = &__NSArray0__struct;

  objc_initWeak(&location, v8);
  v20 = +[NSNotificationCenter defaultCenter];
  uint64_t v21 = GCLookupService(v7, (objc_class *)&unk_26BEE50A0, 0, 0);
  v22 = (void *)*((void *)v8 + 6);
  *((void *)v8 + 6) = v21;

  if (*((void *)v8 + 6))
  {
    dispatch_source_t v23 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, *((dispatch_queue_t *)v8 + 2));
    v24 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v23;

    v25 = *((void *)v8 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke;
    handler[3] = &unk_26BEC49A8;
    objc_copyWeak(&v55, &location);
    dispatch_source_set_event_handler(v25, handler);
    dispatch_activate(*((dispatch_object_t *)v8 + 5));
    [v20 addObserver:v8 selector:sel__filesystemDidChange_ name:@"GCConfigurationBundleSourceBundlesDidChangeNotification" object:*((void *)v8 + 6)];
    objc_destroyWeak(&v55);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v34 = *((void *)v8 + 1);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[_GCConfigurationBundleLocator initWithConfigurationType:provider:](v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }
  uint64_t v26 = GCLookupService(v7, (objc_class *)&unk_26BEED838, 0, 0);
  v27 = (void *)*((void *)v8 + 9);
  *((void *)v8 + 9) = v26;

  if (*((void *)v8 + 9))
  {
    dispatch_source_t v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, *((dispatch_queue_t *)v8 + 2));
    v29 = (void *)*((void *)v8 + 8);
    *((void *)v8 + 8) = v28;

    v30 = *((void *)v8 + 8);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_9;
    v52[3] = &unk_26BEC49A8;
    objc_copyWeak(&v53, &location);
    dispatch_source_set_event_handler(v30, v52);
    dispatch_activate(*((dispatch_object_t *)v8 + 8));
    [v20 addObserver:v8 selector:sel__assetDidChange_ name:@"GCConfigurationBundleSourceBundlesDidChangeNotification" object:*((void *)v8 + 9)];
    objc_destroyWeak(&v53);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v42 = *((void *)v8 + 1);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      -[_GCConfigurationBundleLocator initWithConfigurationType:provider:](v42, v43, v44, v45, v46, v47, v48, v49);
    }
  }
  v31 = *((void *)v8 + 2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_12;
  block[3] = &unk_26BEC49A8;
  objc_copyWeak(&v51, &location);
  dispatch_block_t v32 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, -10, block);
  dispatch_async(v31, v32);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);

  return (_GCConfigurationBundleLocator *)v8;
}

- (uint64_t)_onqueue_filesystem_updateBundles
{
  uint64_t v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v2 = *(id *)(v1 + 48);
    v3 = v2;
    if (v2)
    {
      v4 = [v2 configurationBundleURLsForType:*(void *)(v1 + 88)];
      if ([v4 waitUntilFinished] == 1)
      {
        v5 = *(NSObject **)(v1 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          [(_GCConfigurationBundleLocator *)v5 _onqueue_filesystem_updateBundles];
        }
        uint64_t v1 = 0;
      }
      else
      {
        id v6 = [v4 result];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke;
        v9[3] = &unk_26BEC49F8;
        v9[4] = v1;
        id v7 = objc_msgSend(v6, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, v9);
        if (os_log_type_enabled(*(os_log_t *)(v1 + 8), OS_LOG_TYPE_DEBUG)) {
          -[_GCConfigurationBundleLocator _onqueue_filesystem_updateBundles]();
        }
        if (([v7 count] || objc_msgSend(*(id *)(v1 + 56), "count"))
          && ([v7 isEqual:*(void *)(v1 + 56)] & 1) == 0)
        {
          objc_setProperty_atomic((id)v1, sel__onqueue_filesystem_updateBundles, v7, 56);
          uint64_t v1 = 1;
        }
        else
        {
          uint64_t v1 = 0;
        }
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)_onqueue_rebuildBundleCollection
{
  if (a1)
  {
    id v2 = objc_getProperty(a1, sel__onqueue_rebuildBundleCollection, 56, 1);
    v3 = objc_getProperty(a1, sel__onqueue_rebuildBundleCollection, 80, 1);
    v4 = objc_opt_new();
    v5 = v4;
    if (v3) {
      [v4 addObjectsFromArray:v3];
    }
    if (v2) {
      [v5 addObjectsFromArray:v2];
    }
    id v6 = a1[1];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = [v5 count];
      _os_log_impl(&dword_20AD04000, v7, OS_LOG_TYPE_INFO, "Now tracking %llu bundles.", buf, 0xCu);
    }
    objc_setProperty_atomic(a1, sel__onqueue_rebuildBundleCollection, v5, 32);
    id v8 = a1[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __65___GCConfigurationBundleLocator__onqueue_rebuildBundleCollection__block_invoke;
    block[3] = &unk_26BEC3CA8;
    void block[4] = a1;
    dispatch_async(v8, block);
  }
}

- (uint64_t)_onqueue_asset_updateBundles
{
  uint64_t v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v2 = *(id *)(v1 + 72);
    v3 = v2;
    if (v2)
    {
      v4 = [v2 configurationBundleURLsForType:*(void *)(v1 + 88)];
      if ([v4 waitUntilFinished] == 1)
      {
        v5 = *(NSObject **)(v1 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          [(_GCConfigurationBundleLocator *)(uint64_t)v3 _onqueue_asset_updateBundles];
        }
        uint64_t v1 = 0;
      }
      else
      {
        id v6 = [v4 result];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke;
        v9[3] = &unk_26BEC49F8;
        v9[4] = v1;
        id v7 = objc_msgSend(v6, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, v9);
        if (os_log_type_enabled(*(os_log_t *)(v1 + 8), OS_LOG_TYPE_DEBUG)) {
          -[_GCConfigurationBundleLocator _onqueue_asset_updateBundles]();
        }
        if (([v7 count] || objc_msgSend(*(id *)(v1 + 80), "count"))
          && ([v7 isEqual:*(void *)(v1 + 80)] & 1) == 0)
        {
          objc_setProperty_atomic((id)v1, sel__onqueue_asset_updateBundles, v7, 80);
          uint64_t v1 = 1;
        }
        else
        {
          uint64_t v1 = 0;
        }
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)_onqueue_loadBundlesIfNeeded
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    if (*(void *)(a1 + 48) && !*(void *)(a1 + 56)) {
      int updated = -[_GCConfigurationBundleLocator _onqueue_filesystem_updateBundles](a1);
    }
    else {
      int updated = 0;
    }
    if (*(void *)(a1 + 72) && !*(void *)(a1 + 80))
    {
      if (((updated | -[_GCConfigurationBundleLocator _onqueue_asset_updateBundles](a1)) & 1) == 0) {
        return;
      }
    }
    else if (!updated)
    {
      return;
    }
    -[_GCConfigurationBundleLocator _onqueue_rebuildBundleCollection]((void *)a1);
  }
}

- (_GCConfigurationBundleLocator)init
{
  return 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = v3;
  if (self->_filesystemSource)
  {
    objc_msgSend(v3, "removeObserver:name:object:", self, @"GCConfigurationBundleSourceBundlesDidChangeNotification");
    dispatch_source_cancel((dispatch_source_t)self->_filesystemChangedEventSource);
  }
  if (self->_assetSource)
  {
    objc_msgSend(v4, "removeObserver:name:object:", self, @"GCConfigurationBundleSourceBundlesDidChangeNotification");
    dispatch_source_cancel((dispatch_source_t)self->_assetsChangedEventSource);
  }

  v5.receiver = self;
  v5.super_class = (Class)_GCConfigurationBundleLocator;
  [(_GCConfigurationBundleLocator *)&v5 dealloc];
}

- (id)fetchBundles
{
  v4 = objc_getProperty(self, a2, 56, 1);
  objc_super v5 = objc_getProperty(self, a2, 80, 1);
  id v6 = objc_getProperty(self, a2, 32, 1);
  id v7 = v6;
  if (self->_filesystemSource) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 || self->_assetSource && !v5 || ![v6 count])
  {
    id v10 = [[GCOperation alloc] initOnQueue:self->_workloop withOptions:256];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __45___GCConfigurationBundleLocator_fetchBundles__block_invoke;
    v12[3] = &unk_26BEC49D0;
    v12[4] = self;
    [v10 setSyncBlock:v12];
    uint64_t v9 = [v10 activate];
  }
  else
  {
    uint64_t v9 = +[GCFuture futureWithResult:v7];
  }

  return v9;
}

- (void)_filesystemDidChange:(id)a3
{
}

- (void)_assetDidChange:(id)a3
{
}

- (NSString)configurationType
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationType, 0);
  objc_storeStrong((id *)&self->_assetBundles, 0);
  objc_storeStrong((id *)&self->_assetSource, 0);
  objc_storeStrong((id *)&self->_assetsChangedEventSource, 0);
  objc_storeStrong((id *)&self->_filesystemBundles, 0);
  objc_storeStrong((id *)&self->_filesystemSource, 0);
  objc_storeStrong((id *)&self->_filesystemChangedEventSource, 0);
  objc_storeStrong((id *)&self->_mergedBundles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithConfigurationType:(uint64_t)a3 provider:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithConfigurationType:(uint64_t)a3 provider:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_onqueue_filesystem_updateBundles
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_20AD04000, v0, v1, "[Source/FS] New bundles: %@.", v2);
}

- (void)_onqueue_asset_updateBundles
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_20AD04000, v0, v1, "[Source/Asset] New configuration bundles: %@.", v2);
}

@end