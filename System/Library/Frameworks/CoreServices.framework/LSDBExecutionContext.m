@interface LSDBExecutionContext
+ (id)sharedServerInstance;
- (PerThreadContext)_perThreadContextsLock_createPerThreadContextForThisThread;
- (PerThreadContext)_perThreadContextsLock_findPerThreadContextForThisThread;
- (PerThreadContext)_perThreadContextsLock_findPerThreadContextForThisThreadIfExists;
- (id).cxx_construct;
- (id)_init;
- (id)maintenanceQueue;
- (os_unfair_lock_s)getPerThreadDatabaseWithError:(os_unfair_lock_s *)a1;
- (uint64_t)rawWriteAccessContextForDBInit;
- (void)_perThreadContextsLock_destroyPerThreadContextForThisThread;
- (void)assertActiveForThisThread;
- (void)assertNotActiveForThisThread;
- (void)beginServerDBBootstrap:(uint64_t)a1;
- (void)performAsyncRead:(uint64_t)a1;
- (void)performAsyncWrite:(uint64_t)a1;
- (void)setServerDatabase:(uint64_t)a1;
- (void)syncRead:(os_unfair_lock_s *)a1;
- (void)syncWrite:(uint64_t)a1;
@end

@implementation LSDBExecutionContext

uint64_t __33__LSDBExecutionContext_syncRead___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 80);
  uint64_t result = _LSDatabaseIsMutable(*(void *)(a1 + 40));
  if (v2)
  {
    if (result)
    {
      -[_LSDatabase setAccessContext:](*(void **)(a1 + 40), *(CFTypeRef *)(*(void *)(a1 + 32) + 72));
      _LSDatabaseSetMutable();
    }
    uint64_t result = (uint64_t)-[_LSDatabase setAccessContext:](*(void **)(a1 + 40), *(CFTypeRef *)(*(void *)(a1 + 32) + 64));
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  }
  else if (result)
  {
    v4 = _LSDatabaseGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __33__LSDBExecutionContext_syncRead___block_invoke_cold_1(v4);
    }

    abort();
  }
  return result;
}

void __33__LSDBExecutionContext_syncRead___block_invoke_14(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x18530F680]();
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, *(void *)(a1 + 40));
}

- (void)syncRead:(os_unfair_lock_s *)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock(a1 + 4);
    os_unfair_lock_lock(a1 + 5);
    uint64_t v4 = [(os_unfair_lock_s *)a1 _perThreadContextsLock_createPerThreadContextForThisThread];
    id v10 = 0;
    v5 = LaunchServices::PerThreadContext::getDatabase((id *)v4, &v10);
    id v6 = v10;
    if (v5)
    {
      id v9 = v5;
      _CSStoreAccessContextAccessForRead();
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v4 + 20));

    os_unfair_lock_unlock(a1 + 5);
    os_unfair_lock_unlock(a1 + 4);
    id v8 = v3;
    id v7 = v6;
    _CSStoreAccessContextAccessForRead();
    LaunchServices::PerThreadContext::releaseDatabase((LaunchServices::PerThreadContext *)v4);
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
    os_unfair_lock_lock(a1 + 5);
    [(os_unfair_lock_s *)a1 _perThreadContextsLock_destroyPerThreadContextForThisThread];
    os_unfair_lock_unlock(a1 + 5);
  }
}

- (void)_perThreadContextsLock_destroyPerThreadContextForThisThread
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  pthread_t v3 = pthread_self();
  std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::__erase_unique<_opaque_pthread_t *>(&self->_perThreadContexts.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (PerThreadContext)_perThreadContextsLock_createPerThreadContextForThisThread
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  pthread_t v12 = pthread_self();
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x30uLL);
  v4->__shared_owners_ = 0;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ECB176B8;
  v4[1].__shared_owners_ = 0;
  v4[1].__shared_weak_owners_ = 0;
  v4[1].__vftable = 0;
  id v10 = v4 + 1;
  v11 = v4;
  v14 = &v12;
  v13 = &v10;
  v5 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::__emplace_unique_key_args<_opaque_pthread_t *,std::piecewise_construct_t const&,std::tuple<_opaque_pthread_t *&&>,std::tuple<std::shared_ptr<LaunchServices::PerThreadContext>&&>>((uint64_t)&self->_perThreadContexts, &v12, (uint64_t)&std::piecewise_construct, &v14, (uint64_t *)&v13);
  char v7 = v6;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"LSServerDBExecutionContext.mm", 122, @"calling %s but already had a per thread context!", "-[LSDBExecutionContext _perThreadContextsLock_createPerThreadContextForThisThread]");
  }
  return (PerThreadContext *)*((void *)v5 + 3);
}

- (os_unfair_lock_s)getPerThreadDatabaseWithError:(os_unfair_lock_s *)a1
{
  int v2 = a1;
  if (a1)
  {
    uint64_t v4 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    uint64_t v5 = [(os_unfair_lock_s *)v2 _perThreadContextsLock_findPerThreadContextForThisThread];
    int v2 = *(os_unfair_lock_s **)v5;
    if (*(void *)v5)
    {
      char v6 = v2;
    }
    else if (a2)
    {
      *a2 = *(id *)(v5 + 8);
    }
    os_unfair_lock_unlock(v4);
  }

  return v2;
}

- (void)assertActiveForThisThread
{
  if (a1)
  {
    int v2 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    [(os_unfair_lock_s *)a1 _perThreadContextsLock_findPerThreadContextForThisThread];
    os_unfair_lock_unlock(v2);
  }
}

- (PerThreadContext)_perThreadContextsLock_findPerThreadContextForThisThread
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  pthread_t v7 = pthread_self();
  uint64_t v4 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>(&self->_perThreadContexts.__table_.__bucket_list_.__ptr_.__value_, &v7);
  if (!v4)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"LSServerDBExecutionContext.mm", 107, @"Calling %s but didn't have a per thread context!", "-[LSDBExecutionContext _perThreadContextsLock_findPerThreadContextForThisThread]");
  }
  return (PerThreadContext *)v4[3];
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)LSDBExecutionContext;
  int v2 = [(LSDBExecutionContext *)&v11 init];
  if (v2)
  {
    pthread_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.LSDBExecutionContext", v3);
    maintenanceQueue = v2->_maintenanceQueue;
    v2->_maintenanceQueue = (OS_dispatch_queue *)v4;

    SharedReadingContext = (__CSStoreAccessContext *)_CSStoreAccessContextCreateSharedReadingContext();
    fItem = v2->_readAccessContext.fItem;
    if (fItem != SharedReadingContext)
    {
      v2->_readAccessContext.fItem = SharedReadingContext;
      SharedReadingContext = fItem;
    }
    if (SharedReadingContext) {
      CFRelease(SharedReadingContext);
    }
    id v8 = (__CSStoreAccessContext *)_CSStoreAccessContextCreateWithLock();
    id v9 = v2->_writeAccessContext.fItem;
    if (v9 != v8)
    {
      v2->_writeAccessContext.fItem = v8;
      id v8 = v9;
    }
    if (v8) {
      CFRelease(v8);
    }
    v2->_databaseLeftWritable = 0;
  }
  return v2;
}

- (PerThreadContext)_perThreadContextsLock_findPerThreadContextForThisThreadIfExists
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_perThreadContextsLock);
  pthread_t v4 = pthread_self();
  uint64_t result = (PerThreadContext *)std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>(&self->_perThreadContexts.__table_.__bucket_list_.__ptr_.__value_, &v4);
  if (result) {
    return (PerThreadContext *)result[1].var0;
  }
  return result;
}

- (void)assertNotActiveForThisThread
{
  if (a1)
  {
    int v2 = a1 + 5;
    os_unfair_lock_lock(a1 + 5);
    if ([(os_unfair_lock_s *)a1 _perThreadContextsLock_findPerThreadContextForThisThreadIfExists])
    {
      pthread_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      [v3 handleFailureInMethod:sel_assertNotActiveForThisThread object:a1 file:@"LSServerDBExecutionContext.mm" lineNumber:152 description:@"Had a context for this thread?"];
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)syncWrite:(uint64_t)a1
{
  pthread_t v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v14 = 0;
    v15 = 0;
    uint64_t v16 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    uint64_t v4 = objc_msgSend((id)a1, "_perThreadContextsLock_createPerThreadContextForThisThread");
    *(unsigned char *)(v4 + 16) = 1;
    for (i = *(uint64_t **)(a1 + 40); i; i = (uint64_t *)*i)
    {
      if (i[3] != v4) {
        std::vector<std::shared_ptr<LaunchServices::PerThreadContext>>::push_back[abi:nn180100](&v14, (long long *)(i + 3));
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    char v6 = v14;
    pthread_t v7 = v15;
    while (v6 != v7)
    {
      id v8 = *(os_unfair_lock_s **)v6;
      v6 += 16;
      os_unfair_lock_lock(v8 + 5);
      os_unfair_lock_unlock(v8 + 5);
    }
    id v9 = (void *)MEMORY[0x18530F680]();
    id v13 = 0;
    id v10 = LaunchServices::PerThreadContext::getDatabase((id *)v4, &v13);
    id v11 = v13;
    if (v10)
    {
      -[_LSDatabase setAccessContext:](v10, *(CFTypeRef *)(a1 + 72));
      if ((_LSDatabaseIsMutable((uint64_t)v10) & 1) == 0) {
        _LSDatabaseSetMutable();
      }
      v3[2](v3, a1, 0);
      *(unsigned char *)(a1 + 80) = 1;
    }
    else
    {
      id v12 = *(id *)(v4 + 8);

      id v11 = v12;
      ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v12);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    objc_msgSend((id)a1, "_perThreadContextsLock_destroyPerThreadContextForThisThread");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    v17 = &v14;
    std::vector<std::shared_ptr<LaunchServices::PerThreadContext>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v17);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (void)beginServerDBBootstrap:(uint64_t)a1
{
  uint64_t v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    *(unsigned char *)(objc_msgSend((id)a1, "_perThreadContextsLock_createPerThreadContextForThisThread") + 16) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    pthread_t v3 = (void *)MEMORY[0x18530F680]();
    v4[2]();
    *(unsigned char *)(a1 + 80) = 1;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    objc_msgSend((id)a1, "_perThreadContextsLock_destroyPerThreadContextForThisThread");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (void)setServerDatabase:(uint64_t)a1
{
  uint64_t v4 = a2;
  if (a1)
  {
    id v8 = v4;
    if (!v4)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_setServerDatabase_ object:a1 file:@"LSServerDBExecutionContext.mm" lineNumber:310 description:@"setting nil database"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    uint64_t v5 = objc_msgSend((id)a1, "_perThreadContextsLock_findPerThreadContextForThisThread");
    if (!*(unsigned char *)(v5 + 16))
    {
      pthread_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_setServerDatabase_ object:a1 file:@"LSServerDBExecutionContext.mm" lineNumber:314 description:@"must be in write context to set new server database"];
    }
    -[_LSDatabase setAccessContext:](v8, *(CFTypeRef *)(a1 + 72));
    if ((_LSDatabaseIsMutable((uint64_t)v8) & 1) == 0) {
      _LSDatabaseSetMutable();
    }
    _LSSetLocalDatabase(v8);
    objc_storeStrong((id *)v5, a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    uint64_t v4 = v8;
  }
}

- (void)performAsyncWrite:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__LSDBExecutionContext_performAsyncWrite___block_invoke;
    v6[3] = &unk_1E522C3B0;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __42__LSDBExecutionContext_performAsyncWrite___block_invoke(uint64_t a1)
{
}

- (void)performAsyncRead:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__LSDBExecutionContext_performAsyncRead___block_invoke;
    v6[3] = &unk_1E522C3B0;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __41__LSDBExecutionContext_performAsyncRead___block_invoke(uint64_t a1)
{
}

- (uint64_t)rawWriteAccessContextForDBInit
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (id)maintenanceQueue
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)sharedServerInstance
{
  self;
  if (+[LSDBExecutionContext sharedServerInstance]::onceToken != -1) {
    dispatch_once(&+[LSDBExecutionContext sharedServerInstance]::onceToken, &__block_literal_global_7);
  }
  v0 = (void *)+[LSDBExecutionContext sharedServerInstance]::result;

  return v0;
}

void __44__LSDBExecutionContext_sharedServerInstance__block_invoke()
{
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    id v0 = [[LSDBExecutionContext alloc] _init];
    uint64_t v1 = (void *)+[LSDBExecutionContext sharedServerInstance]::result;
    +[LSDBExecutionContext sharedServerInstance]::uint64_t result = (uint64_t)v0;
  }
}

- (void).cxx_destruct
{
  fItem = self->_writeAccessContext.fItem;
  if (fItem) {
    CFRelease(fItem);
  }
  self->_writeAccessContext.fItem = 0;
  uint64_t v4 = self->_readAccessContext.fItem;
  if (v4) {
    CFRelease(v4);
  }
  self->_readAccessContext.fItem = 0;
  std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::~__hash_table((uint64_t)&self->_perThreadContexts);

  objc_storeStrong((id *)&self->_maintenanceQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

void __33__LSDBExecutionContext_syncRead___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Database was mutable but a note attesting to that was not left for us!", v1, 2u);
}

@end