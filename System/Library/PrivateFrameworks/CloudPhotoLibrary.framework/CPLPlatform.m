@interface CPLPlatform
+ (id)defaultPlatform;
+ (void)setDefaultPlatform:(id)a3;
+ (void)setProxyImplementationForPlatform:(id)a3;
- (CPLPlatform)init;
- (Class)implementationClassForAbstractClass:(Class)a3;
- (NSString)suffix;
- (id)description;
- (id)newPlatformImplementationForObject:(id)a3;
- (void)setPlatformImplementation:(Class)a3 forClass:(Class)a4;
- (void)setSuffix:(id)a3;
@end

@implementation CPLPlatform

+ (void)setProxyImplementationForPlatform:(id)a3
{
  id v6 = a3;
  uint64_t v3 = objc_opt_class();
  [v6 setPlatformImplementation:v3 forClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  [v6 setPlatformImplementation:v4 forClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  [v6 setPlatformImplementation:v5 forClass:objc_opt_class()];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_abstractClassToImplementation, 0);
}

- (void)setSuffix:(id)a3
{
}

- (NSString)suffix
{
  return self->_suffix;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@ ", objc_opt_class()];
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CPLPlatform_description__block_invoke;
  block[3] = &unk_1E60A6728;
  block[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(lock, block);
  [v5 appendString:@">"];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __26__CPLPlatform_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24))
  {
    [*(id *)(a1 + 40) appendFormat:@"[%@]", *(void *)(v2 + 24)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v2 + 8) count])
  {
    [*(id *)(a1 + 40) appendString:@"\n"];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) dictionaryRepresentation];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __26__CPLPlatform_description__block_invoke_2;
    v4[3] = &unk_1E60AB3B8;
    id v5 = *(id *)(a1 + 40);
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

uint64_t __26__CPLPlatform_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@ -> %@\n", a2, a3];
}

- (id)newPlatformImplementationForObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(-[CPLPlatform implementationClassForAbstractClass:](self, "implementationClassForAbstractClass:", objc_opt_class())), "initWithAbstractObject:", v4);

  return v5;
}

- (Class)implementationClassForAbstractClass:(Class)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v20 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CPLPlatform_implementationClassForAbstractClass___block_invoke;
  block[3] = &unk_1E60AB390;
  void block[5] = &v17;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(lock, block);
  id v6 = (void *)v18[3];
  if (v6)
  {
    if (![v6 isSubclassOfClass:objc_opt_class()])
    {
      if (!_CPLSilentLogging)
      {
        id v10 = __CPLPlatformOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = v18[3];
          v12 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v11;
          __int16 v23 = 2112;
          v24 = v12;
          id v13 = v12;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "%@ is not a subclass of %@", buf, 0x16u);
        }
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m"];
      [v14 handleFailureInMethod:a2, self, v15, 132, @"%@ is not a subclass of %@", v18[3], objc_opt_class() object file lineNumber description];

      abort();
    }
    id v7 = (void *)v18[3];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);
  return (Class)v8;
}

void __51__CPLPlatform_implementationClassForAbstractClass___block_invoke(void *a1, __n128 a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)a1[6];
  a2.n128_u64[0] = 138412290;
  __n128 v13 = a2;
  while (1)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = (id)objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", v3, *(_OWORD *)&v13);
    if (*(void *)(*(void *)(a1[5] + 8) + 24)) {
      break;
    }
    if (*(void *)(a1[4] + 24))
    {
      id v4 = NSStringFromClass(v3);
      id v5 = [v4 stringByAppendingString:*(void *)(a1[4] + 24)];
      *(void *)(*(void *)(a1[5] + 8) + 24) = NSClassFromString(v5);
      uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
      if (v6)
      {
        if (!_CPLSilentLogging)
        {
          id v10 = __CPLPlatformOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v11 = a1[6];
            v12 = *(objc_class **)(*(void *)(a1[5] + 8) + 24);
            *(_DWORD *)buf = 138412546;
            v15 = v12;
            __int16 v16 = 2112;
            uint64_t v17 = v11;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Found %@ as implementation for %@", buf, 0x16u);
          }

          uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
        }
        [*(id *)(a1[4] + 8) setObject:v6 forKey:a1[6]];

        return;
      }
    }
    uint64_t v3 = (objc_class *)[(objc_class *)v3 superclass];
    if (!_CPLSilentLogging)
    {
      id v7 = __CPLPlatformOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v13.n128_u32[0];
        v15 = v3;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Trying %@", buf, 0xCu);
      }
    }
    if (v3 == (objc_class *)objc_opt_class())
    {
      if (!_CPLSilentLogging)
      {
        id v8 = __CPLPlatformOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = (objc_class *)a1[6];
          *(_DWORD *)buf = v13.n128_u32[0];
          v15 = v9;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Found no implementation for %@", buf, 0xCu);
        }
      }
      return;
    }
  }
  if (v3 != (objc_class *)a1[6]) {
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:");
  }
}

- (void)setPlatformImplementation:(Class)a3 forClass:(Class)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLPlatformOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = a3;
        __int16 v23 = 2112;
        id v24 = (id)objc_opt_class();
        id v12 = v24;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ should be a subclass of %@", buf, 0x16u);
      }
    }
    __n128 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m"];
    [v13 handleFailureInMethod:a2, self, v14, 89, @"%@ should be a subclass of %@", a3, objc_opt_class() object file lineNumber description];

    abort();
  }
  if (([(objc_class *)a4 conformsToProtocol:&unk_1F0D96410] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v15 = __CPLPlatformOSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = NSStringFromProtocol((Protocol *)&unk_1F0D96410);
        *(_DWORD *)buf = 138412546;
        id v22 = a4;
        __int16 v23 = 2112;
        id v24 = v16;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "%@ should conform to %@", buf, 0x16u);
      }
    }
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m"];
    uint64_t v19 = NSStringFromProtocol((Protocol *)&unk_1F0D96410);
    [v17 handleFailureInMethod:a2, self, v18, 90, @"%@ should conform to %@", a4, v19 object file lineNumber description];

    abort();
  }
  if (!_CPLSilentLogging)
  {
    id v8 = __CPLPlatformOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2048;
      id v24 = self;
      __int16 v25 = 2112;
      Class v26 = a4;
      __int16 v27 = 2112;
      Class v28 = a3;
      id v9 = v22;
      _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "<%@ %p> registering platform implementation %@ -> %@", buf, 0x2Au);
    }
  }
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CPLPlatform_setPlatformImplementation_forClass___block_invoke;
  block[3] = &unk_1E60AB368;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(lock, block);
}

uint64_t __50__CPLPlatform_setPlatformImplementation_forClass___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
}

- (CPLPlatform)init
{
  v8.receiver = self;
  v8.super_class = (Class)CPLPlatform;
  uint64_t v2 = [(CPLPlatform *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    abstractClassToImplementation = v2->_abstractClassToImplementation;
    v2->_abstractClassToImplementation = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cpl.platform", 0);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)defaultPlatform
{
  uint64_t v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = (id)_defaultPlatform;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setDefaultPlatform:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  if (!_CPLSilentLogging)
  {
    dispatch_queue_t v5 = __CPLPlatformOSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Setting default platform to %@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = (void *)_defaultPlatform;
  _defaultPlatform = (uint64_t)v3;

  objc_sync_exit(v4);
}

@end