@interface BSUIMappedImageCache
- (BSUIMappedImageCache)init;
- (BSUIMappedImageCache)initWithName:(id)a3 options:(unint64_t)a4;
- (BSUIMappedImageCache)initWithUniqueIdentifier:(id)a3;
- (BSUIMappedImageCache)initWithUniqueIdentifier:(id)a3 options:(id)a4;
- (NSString)debugDescription;
- (NSString)description;
- (id)_imageForKey:(id)a3 withCPBitmapReadFlags:(int)a4 generatingIfNecessaryWithBlock:(id)a5;
- (id)_imageForKey:(int)a3 withCPBitmapReadFlags:(void *)a4 generatingIfNecessaryWithBlock:(void *)a5 completion:;
- (id)allKeys;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)imageForKey:(id)a3;
- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4;
- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4 completion:(id)a5;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_noteExternalChangeForKey:(id)a3;
- (void)_setImage:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)_setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5 andCPBitmapReadFlags:(int)a6;
- (void)_setImage:(void *)a3 forKey:(uint64_t)a4 withPersistenceOptions:(int)a5 andCPBitmapReadFlags:(void *)a6 completion:;
- (void)_warmupImageForKey:(id)a3;
- (void)dealloc;
- (void)releaseRecoverableResources;
- (void)removeAllImagesWithCompletion:(id)a3;
- (void)removeAllObjects;
- (void)removeImageForKey:(id)a3;
- (void)removeImageForKey:(id)a3 withCompletion:(id)a4;
- (void)setImage:(id)a3 forKey:(id)a4;
- (void)setImage:(id)a3 forKey:(id)a4 withCompletion:(id)a5;
- (void)setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5;
- (void)setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5 completion:(id)a6;
@end

@implementation BSUIMappedImageCache

void __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke(uint64_t a1)
{
  v19 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = -[BSUIMappedImageCacheFuture cacheImage](v19);
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v6 = *(void **)(*(void *)(a1 + 32) + 40);
    if (v5)
    {
      [v6 setObject:v5 forKey:*(void *)(a1 + 40)];
    }
    else
    {
      [v6 removeObjectForKey:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
    }
    goto LABEL_11;
  }
  if (v19)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    v8 = v19;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
LABEL_9:

    goto LABEL_11;
  }
  v10 = __pathForKeyAndExtension(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40), @"cpbitmap");
  v11 = _readCPBitmapImageFromPathWithOptions(v10);

  if (v11
    || (unsigned int v12 = *(_DWORD *)(a1 + 72),
        __pathForKeyAndExtension(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40), @"surface"),
        v13 = objc_claimAutoreleasedReturnValue(),
        +[BSUIMappedSurfaceImage mappedSurfaceImageFromPath:loadEagerly:]((uint64_t)BSUIMappedSurfaceImage, v13, (v12 >> 1) & 1), v11 = objc_claimAutoreleasedReturnValue(), v13, v11))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v11 forKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v11;
    id v9 = v11;

    goto LABEL_9;
  }
LABEL_11:
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && *(void *)(a1 + 48))
  {
    v16 = objc_alloc_init(BSUIMappedImageCacheFuture);
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [*(id *)(*(void *)(a1 + 32) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  }
}

- (BSUIMappedImageCache)initWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F7C8] pathProviderForCurrentContainer];
  v6 = +[BSUIMappedImageCacheOptions optionsWithContainerPathProvider:v5];

  uint64_t v7 = [(BSUIMappedImageCache *)self initWithUniqueIdentifier:v4 options:v6];
  return v7;
}

- (BSUIMappedImageCache)initWithUniqueIdentifier:(id)a3 options:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    v57 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"uniqueIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v76 = v58;
      __int16 v77 = 2114;
      v78 = v60;
      __int16 v79 = 2048;
      *(void *)v80 = self;
      *(_WORD *)&v80[8] = 2114;
      *(void *)&v80[10] = @"BSUIMappedImageCache.m";
      __int16 v81 = 1024;
      int v82 = 206;
      __int16 v83 = 2114;
      v84 = v57;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v57 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B0EFF0);
  }
  if (!v8)
  {
    v61 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"options"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v76 = v62;
      __int16 v77 = 2114;
      v78 = v64;
      __int16 v79 = 2048;
      *(void *)v80 = self;
      *(_WORD *)&v80[8] = 2114;
      *(void *)&v80[10] = @"BSUIMappedImageCache.m";
      __int16 v81 = 1024;
      int v82 = 207;
      __int16 v83 = 2114;
      v84 = v61;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v61 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B0F0F0);
  }
  v74.receiver = self;
  v74.super_class = (Class)BSUIMappedImageCache;
  v10 = [(BSUIMappedImageCache *)&v74 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v11;

    v13 = v10->_uniqueIdentifier;
    id v14 = v9;
    self;
    if (!v13)
    {
      v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"uniqueIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v66 = [NSString stringWithUTF8String:"+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]"];
        *(_DWORD *)buf = 138544130;
        id v76 = v66;
        __int16 v77 = 2114;
        v78 = @"BSUIMappedImageCache.m";
        __int16 v79 = 1024;
        *(_DWORD *)v80 = 114;
        *(_WORD *)&v80[4] = 2114;
        *(void *)&v80[6] = v65;
        _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v65 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A2B0F1C4);
    }
    v15 = [v14 containerPathProvider];
    v16 = [v15 cachesPath];

    if (!v16)
    {
      v67 = [NSString stringWithFormat:@"invalid cachesPath for BSUIMappedImageCache %@", v13];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v68 = [NSString stringWithUTF8String:"+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]"];
        *(_DWORD *)buf = 138544130;
        id v76 = v68;
        __int16 v77 = 2114;
        v78 = @"BSUIMappedImageCache.m";
        __int16 v79 = 1024;
        *(_DWORD *)v80 = 117;
        *(_WORD *)&v80[4] = 2114;
        *(void *)&v80[6] = v67;
        _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v67 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A2B0F290);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_9);
    if (qword_1EB3A3938)
    {
      uint64_t v17 = [(id)qword_1EB3A3938 objectForKey:v16];
      if (v17) {
        goto LABEL_15;
      }
      v18 = -[BSUIMappedImageCacheRegistry _initWithCachesPath:]([BSUIMappedImageCacheRegistry alloc], v16);
      if (v18) {
        uint64_t v19 = v18[1];
      }
      else {
        uint64_t v19 = 0;
      }
      [(id)qword_1EB3A3938 setObject:v18 forKey:v19];
    }
    else
    {
      v20 = -[BSUIMappedImageCacheRegistry _initWithCachesPath:]([BSUIMappedImageCacheRegistry alloc], v16);
      v18 = v20;
      v21 = (void *)MEMORY[0x1E4F1CA60];
      if (v20) {
        v22 = (void *)v20[1];
      }
      else {
        v22 = 0;
      }
      id v23 = v22;
      uint64_t v24 = [v21 dictionaryWithObject:v18 forKey:v23];
      v25 = (void *)qword_1EB3A3938;
      qword_1EB3A3938 = v24;
    }
    uint64_t v17 = (uint64_t)v18;
    if (!v18)
    {
      v69 = NSString;
      v70 = [v14 containerPathProvider];
      v71 = [v69 stringWithFormat:@"must have a registry : uniqueIdentifier='%@' cachesPath='%@' (provider=%@)", v13, v16, v70];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v72 = [NSString stringWithUTF8String:"+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]"];
        *(_DWORD *)buf = 138544130;
        id v76 = v72;
        __int16 v77 = 2114;
        v78 = @"BSUIMappedImageCache.m";
        __int16 v79 = 1024;
        *(_DWORD *)v80 = 133;
        *(_WORD *)&v80[4] = 2114;
        *(void *)&v80[6] = v71;
        _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v71 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A2B0F378);
    }
LABEL_15:
    v26 = *(void **)(v17 + 24);
    if (v26)
    {
      if ([v26 containsObject:v13])
      {
        v55 = [NSString stringWithFormat:@"a cache with uniqueIdentifier='%@' cachesPath='%@' already exists", v13, v16];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v56 = [NSString stringWithUTF8String:"+[BSUIMappedImageCacheRegistry acquireUniqueIdentifier:withOptions:]"];
          *(_DWORD *)buf = 138544130;
          id v76 = v56;
          __int16 v77 = 2114;
          v78 = @"BSUIMappedImageCache.m";
          __int16 v79 = 1024;
          *(_DWORD *)v80 = 139;
          *(_WORD *)&v80[4] = 2114;
          *(void *)&v80[6] = v55;
          _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        [v55 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A2B0EEF0);
      }
      [*(id *)(v17 + 24) addObject:v13];
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F1CA80] setWithObject:v13];
      v28 = *(void **)(v17 + 24);
      *(void *)(v17 + 24) = v27;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_9);

    registry = v10->_registry;
    v10->_registry = (BSUIMappedImageCacheRegistry *)v17;

    v30 = v10->_registry;
    if (v30) {
      v30 = (BSUIMappedImageCacheRegistry *)v30->_cachesPath;
    }
    v31 = v30;
    v32 = v10->_uniqueIdentifier;
    v33 = [(BSUIMappedImageCacheRegistry *)v31 path];
    v34 = [v33 stringByAppendingPathComponent:@"MappedImageCache"];
    v35 = [v34 stringByAppendingPathComponent:v32];

    uint64_t v36 = [v35 copy];
    path = v10->_path;
    v10->_path = (NSString *)v36;

    v38 = v10->_path;
    if (v38)
    {
      v39 = objc_opt_new();
      v40 = v10->_path;
      id v73 = 0;
      char v41 = [v39 createDirectoryAtPath:v40 withIntermediateDirectories:1 attributes:0 error:&v73];
      id v42 = v73;

      if (v41)
      {
        id v43 = [NSString stringWithFormat:@"com.apple.baseboardui.mappedImageCache:%@", v10->_uniqueIdentifier];
        [v43 UTF8String];
        uint64_t v44 = BSDispatchQueueCreateWithQualityOfService();
        queue = v10->_queue;
        v10->_queue = (OS_dispatch_queue *)v44;

        v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        queue_keysToImagesOrFutures = v10->_queue_keysToImagesOrFutures;
        v10->_queue_keysToImagesOrFutures = v46;

        uint64_t v48 = dispatch_get_global_queue(9, 0);
        calloutQueue = v10->_calloutQueue;
        v10->_calloutQueue = (OS_dispatch_queue *)v48;

        goto LABEL_24;
      }
      v38 = v10->_path;
    }
    else
    {
      id v42 = 0;
    }
    v51 = [NSString stringWithFormat:@"Couldn't create directory at %@ with error %@", v38, v42];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v76 = v52;
      __int16 v77 = 2114;
      v78 = v54;
      __int16 v79 = 2048;
      *(void *)v80 = v10;
      *(_WORD *)&v80[8] = 2114;
      *(void *)&v80[10] = @"BSUIMappedImageCache.m";
      __int16 v81 = 1024;
      int v82 = 222;
      __int16 v83 = 2114;
      v84 = v51;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B0EE24);
  }
LABEL_24:

  return v10;
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4
{
  id v4 = -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, 0, a4, 0);

  return v4;
}

- (id)_imageForKey:(int)a3 withCPBitmapReadFlags:(void *)a4 generatingIfNecessaryWithBlock:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = BSDispatchQueueAssertNot();
    uint64_t v51 = 0;
    id v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy_;
    v55 = __Block_byref_object_dispose_;
    id v56 = 0;
    if (v9)
    {
      v13 = (void *)MEMORY[0x1A623AD30](v12);
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x3032000000;
      uint64_t v48 = __Block_byref_object_copy_;
      v49 = __Block_byref_object_dispose_;
      id v50 = 0;
      id v14 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke;
      block[3] = &unk_1E5ABD270;
      block[4] = a1;
      id v15 = v9;
      id v40 = v15;
      id v42 = &v51;
      int v44 = a3;
      id v16 = v10;
      id v41 = v16;
      id v43 = &v45;
      dispatch_sync(v14, block);
      if (v46[5])
      {
        uint64_t v38 = 0;
        uint64_t v17 = (*((void (**)(id, uint64_t *))v16 + 2))(v16, &v38);
        v18 = (void *)v46[5];
        if (v17)
        {
          v30 = v13;
          uint64_t v19 = v38;
          v20 = -[BSUIMappedImageCacheRegistry tmpPath](*(void *)(a1 + 16));
          v21 = _workBlockGenerator(v18, v17, 1, v15, v19, a3, v20, *(void **)(a1 + 24), *(void **)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40), v11);
          -[BSUIMappedImageCacheFuture submitWorkBlock:]((uint64_t)v18, v21);

          if (v38)
          {
            v26 = v52;
            id v27 = v17;
            id v23 = (void *)v26[5];
            v26[5] = (uint64_t)v27;
          }
          else
          {
            uint64_t v22 = -[BSUIMappedImageCacheFuture cacheImage]((os_unfair_lock_s *)v46[5]);
            id v23 = (void *)v52[5];
            v52[5] = v22;
          }
          v13 = v30;
        }
        else
        {
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_2;
          v36[3] = &unk_1E5ABD298;
          id v37 = v11;
          -[BSUIMappedImageCacheFuture submitWorkBlock:]((uint64_t)v18, v36);
          id v23 = v37;
        }
      }
      else if (v11)
      {
        v25 = *(NSObject **)(a1 + 56);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_3;
        v33[3] = &unk_1E5ABD2C0;
        id v34 = v11;
        v35 = &v51;
        dispatch_async(v25, v33);
      }
      _Block_object_dispose(&v45, 8);
    }
    else if (v11)
    {
      uint64_t v24 = *(NSObject **)(a1 + 56);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_4;
      v31[3] = &unk_1E5ABD2E8;
      id v32 = v11;
      dispatch_async(v24, v31);
    }
    id v28 = (id)v52[5];
    _Block_object_dispose(&v51, 8);
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (BSUIMappedImageCache)init
{
  return [(BSUIMappedImageCache *)self initWithName:0 options:0];
}

- (BSUIMappedImageCache)initWithName:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if ((v4 & 2) != 0) {
    [MEMORY[0x1E4F4F7C8] pathProviderForSystemContainerForCurrentProcess];
  }
  else {
  id v7 = [MEMORY[0x1E4F4F7C8] pathProviderForCurrentContainer];
  }
  id v8 = +[BSUIMappedImageCacheOptions optionsWithContainerPathProvider:v7];
  id v9 = [(BSUIMappedImageCache *)self initWithUniqueIdentifier:v6 options:v8];

  return v9;
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  registry = self->_registry;
  char v4 = self->_uniqueIdentifier;
  uint64_t v5 = v4;
  if (registry)
  {
    if (!v4)
    {
      id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"uniqueIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [NSString stringWithUTF8String:"-[BSUIMappedImageCacheRegistry releaseUniqueIdentifier:]"];
        *(_DWORD *)buf = 138544130;
        uint64_t v22 = v12;
        __int16 v23 = 2114;
        uint64_t v24 = @"BSUIMappedImageCache.m";
        __int16 v25 = 1024;
        int v26 = 147;
        __int16 v27 = 2114;
        id v28 = v11;
        _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A2B15F20);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_9);
    if (([(NSMutableSet *)registry->_uniqueIdentifiers containsObject:v5] & 1) == 0)
    {
      v13 = [NSString stringWithFormat:@"cannot release an identifier we haven't acquired : uniqueIdentifier='%@' cachesPath='%@' : acquired_identifiers=%@", v5, registry->_cachesPath, registry->_uniqueIdentifiers];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v14 = [NSString stringWithUTF8String:"-[BSUIMappedImageCacheRegistry releaseUniqueIdentifier:]"];
        *(_DWORD *)buf = 138544130;
        uint64_t v22 = v14;
        __int16 v23 = 2114;
        uint64_t v24 = @"BSUIMappedImageCache.m";
        __int16 v25 = 1024;
        int v26 = 151;
        __int16 v27 = 2114;
        id v28 = v13;
        _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A2B15FF8);
    }
    uint64_t v6 = [(NSMutableSet *)registry->_uniqueIdentifiers count];
    uniqueIdentifiers = registry->_uniqueIdentifiers;
    if (v6 == 1)
    {
      registry->_uniqueIdentifiers = 0;

      id v8 = [(id)qword_1EB3A3938 objectForKey:registry->_cachesPath];

      if (v8 != registry)
      {
        id v15 = NSString;
        cachesPath = registry->_cachesPath;
        uint64_t v17 = [(id)qword_1EB3A3938 keyEnumerator];
        v18 = [v15 stringWithFormat:@"cannot release an identifier we haven't acquired : uniqueIdentifier='%@' cachesPath='%@' : acquired_paths=%@", v5, cachesPath, v17];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [NSString stringWithUTF8String:"-[BSUIMappedImageCacheRegistry releaseUniqueIdentifier:]"];
          *(_DWORD *)buf = 138544130;
          uint64_t v22 = v19;
          __int16 v23 = 2114;
          uint64_t v24 = @"BSUIMappedImageCache.m";
          __int16 v25 = 1024;
          int v26 = 154;
          __int16 v27 = 2114;
          id v28 = v18;
          _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        [v18 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A2B160E4);
      }
      uint64_t v9 = [(id)qword_1EB3A3938 count];
      id v10 = (void *)qword_1EB3A3938;
      if (v9 == 1)
      {
        qword_1EB3A3938 = 0;
      }
      else
      {
        [(id)qword_1EB3A3938 removeObjectForKey:registry->_cachesPath];
      }
    }
    else
    {
      [(NSMutableSet *)uniqueIdentifiers removeObject:v5];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_9);
  }

  v20.receiver = self;
  v20.super_class = (Class)BSUIMappedImageCache;
  [(BSUIMappedImageCache *)&v20 dealloc];
}

void __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_2(uint64_t a1, void *a2)
{
  char v4 = a2;
  v4[2](v4, 0);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 1, 0);
  }
}

uint64_t __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __101__BSUIMappedImageCache__imageForKey_withCPBitmapReadFlags_generatingIfNecessaryWithBlock_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setImage:(void *)a3 forKey:(uint64_t)a4 withPersistenceOptions:(int)a5 andCPBitmapReadFlags:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if (a1)
  {
    BSDispatchQueueAssertNot();
    if (v11 && v12)
    {
      id v14 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke;
      block[3] = &unk_1E5ABD310;
      block[4] = a1;
      id v20 = v12;
      id v21 = v11;
      uint64_t v23 = a4;
      int v24 = a5;
      id v22 = v13;
      dispatch_sync(v14, block);

      id v15 = v20;
LABEL_7:

      goto LABEL_8;
    }
    if (v13)
    {
      id v16 = *(NSObject **)(a1 + 56);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke_2;
      v17[3] = &unk_1E5ABD2E8;
      id v18 = v13;
      dispatch_async(v16, v17);
      id v15 = v18;
      goto LABEL_7;
    }
  }
LABEL_8:
}

void __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke(uint64_t a1)
{
  id v8 = objc_alloc_init(BSUIMappedImageCacheFuture);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setObject:forKey:");
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  int v5 = *(_DWORD *)(a1 + 72);
  uint64_t v6 = -[BSUIMappedImageCacheRegistry tmpPath](*(void *)(*(void *)(a1 + 32) + 16));
  id v7 = _workBlockGenerator(v8, v2, 0, v3, v4, v5, v6, *(void **)(*(void *)(a1 + 32) + 24), *(void **)(*(void *)(a1 + 32) + 32), *(void **)(*(void *)(a1 + 32) + 56), *(void **)(*(void *)(a1 + 32) + 40), *(void **)(a1 + 56));
  -[BSUIMappedImageCacheFuture submitWorkBlock:]((uint64_t)v8, v7);
}

uint64_t __96__BSUIMappedImageCache__setImage_forKey_withPersistenceOptions_andCPBitmapReadFlags_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)imageForKey:(id)a3
{
  uint64_t v3 = -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, 0, 0, 0);

  return v3;
}

- (id)imageForKey:(id)a3 generatingIfNecessaryWithBlock:(id)a4 completion:(id)a5
{
  int v5 = -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, 0, a4, a5);

  return v5;
}

- (void)setImage:(id)a3 forKey:(id)a4
{
}

- (void)setImage:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
}

- (void)setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5
{
}

- (void)setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5 completion:(id)a6
{
}

- (void)removeImageForKey:(id)a3
{
}

- (void)removeImageForKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertNot();
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__BSUIMappedImageCache_removeImageForKey_withCompletion___block_invoke;
    block[3] = &unk_1E5ABD338;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
  else if (v7)
  {
    dispatch_async((dispatch_queue_t)self->_calloutQueue, v7);
  }
}

void __57__BSUIMappedImageCache_removeImageForKey_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  id v5 = (id)objc_opt_new();
  uint64_t v2 = __pathForKeyAndExtension(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40), @"cpbitmap");
  [v5 removeItemAtPath:v2 error:0];

  uint64_t v3 = __pathForKeyAndExtension(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40), @"surface");
  [v5 removeItemAtPath:v3 error:0];

  uint64_t v4 = *(void **)(a1 + 48);
  if (v4) {
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56), v4);
  }
}

- (id)allKeys
{
  BSDispatchQueueAssertNot();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__BSUIMappedImageCache_allKeys__block_invoke;
  v6[3] = &unk_1E5ABD388;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__BSUIMappedImageCache_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 40) allKeys];
    uint64_t v5 = [v3 initWithArray:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;

    id v8 = objc_opt_new();
    uint64_t v9 = [v8 contentsOfDirectoryAtPath:*(void *)(*(void *)(a1 + 32) + 24) error:0];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __31__BSUIMappedImageCache_allKeys__block_invoke_2;
    v13[3] = &unk_1E5ABD360;
    v13[4] = *(void *)(a1 + 32);
    [v9 enumerateObjectsUsingBlock:v13];

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v10 = [v2 allObjects];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __31__BSUIMappedImageCache_allKeys__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 pathExtension];
  if (([v3 isEqualToString:@"cpbitmap"] & 1) != 0
    || [v3 isEqualToString:@"surface"])
  {
    id v4 = [v6 stringByDeletingPathExtension];
    uint64_t v5 = [v4 stringByRemovingPercentEncoding];
  }
  else
  {
    uint64_t v5 = 0;
  }

  if (v5) {
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:v5];
  }
}

- (void)removeAllObjects
{
}

- (void)releaseRecoverableResources
{
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__BSUIMappedImageCache_releaseRecoverableResources__block_invoke;
  block[3] = &unk_1E5ABD3B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __51__BSUIMappedImageCache_releaseRecoverableResources__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

- (void)removeAllImagesWithCompletion:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__BSUIMappedImageCache_removeAllImagesWithCompletion___block_invoke;
  v7[3] = &unk_1E5ABD3D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __54__BSUIMappedImageCache_removeAllImagesWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  id v3 = (id)objc_opt_new();
  [v3 removeItemAtPath:*(void *)(*(void *)(a1 + 32) + 24) error:0];
  [v3 createDirectoryAtPath:*(void *)(*(void *)(a1 + 32) + 24) withIntermediateDirectories:1 attributes:0 error:0];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56), v2);
  }
}

- (NSString)description
{
  return (NSString *)[(BSUIMappedImageCache *)self descriptionWithMultilinePrefix:@"\t"];
}

- (NSString)debugDescription
{
  return (NSString *)[(BSUIMappedImageCache *)self debugDescriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BSUIMappedImageCache *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  id v6 = (id)[v4 appendObject:self->_path withName:@"path"];

  return v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(BSUIMappedImageCache *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = -[BSUIMappedImageCache descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:");
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(BSUIMappedImageCache *)self allKeys];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [(BSUIMappedImageCache *)self imageForKey:v10];
        id v12 = v11;
        if (!v11)
        {
          id v3 = [MEMORY[0x1E4F1CA98] null];
          id v12 = v3;
        }
        [v5 setObject:v12 forKey:v10];
        if (!v11) {
      }
        }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [v16 appendDictionarySection:v5 withName:@"Contents" skipIfEmpty:0];
  id v13 = [v16 build];

  return v13;
}

- (id)_imageForKey:(id)a3 withCPBitmapReadFlags:(int)a4 generatingIfNecessaryWithBlock:(id)a5
{
  id v5 = -[BSUIMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:completion:]((uint64_t)self, a3, a4, a5, 0);

  return v5;
}

- (void)_setImage:(id)a3 forKey:(id)a4 completion:(id)a5
{
}

- (void)_setImage:(id)a3 forKey:(id)a4 withPersistenceOptions:(unint64_t)a5 andCPBitmapReadFlags:(int)a6
{
}

- (void)_warmupImageForKey:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  if (v4)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__BSUIMappedImageCache__warmupImageForKey___block_invoke;
    v6[3] = &unk_1E5ABD400;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

void __43__BSUIMappedImageCache__warmupImageForKey___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v3 = __pathForKeyAndExtension(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40), @"cpbitmap");
  objc_msgSend(v2, "bs_safeAddObject:", v3);

  id v4 = __pathForKeyAndExtension(*(void **)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40), @"surface");
  objc_msgSend(v2, "bs_safeAddObject:", v4);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = (void *)MEMORY[0x1E4F14B00];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        MappedDataFromPath = (void *)CPBitmapCreateMappedDataFromPath();
        uint64_t v11 = MappedDataFromPath;
        if (MappedDataFromPath)
        {
          id v12 = MappedDataFromPath;
          uint64_t v13 = objc_msgSend(v12, "bytes", v17);
          unint64_t v14 = [v12 length];
          if (v13) {
            BOOL v15 = v14 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            unint64_t v16 = 0;
            do
              v16 += *v8;
            while (v16 < v14);
          }
        }

        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_noteExternalChangeForKey:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertNot();
  if (v4)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__BSUIMappedImageCache__noteExternalChangeForKey___block_invoke;
    v6[3] = &unk_1E5ABD400;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

void __50__BSUIMappedImageCache__noteExternalChangeForKey___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue_allKeys, 0);
  objc_storeStrong((id *)&self->_queue_keysToImagesOrFutures, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_registry, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end