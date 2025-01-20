@interface NSBundleResourceRequest
+ (id)_assetPackBundleForBundle:(id)a3 withAssetPackID:(id)a4;
+ (id)_connection;
+ (id)_extensionEndpoint;
+ (id)_extensionEndpointForMainBundleOfHostApplication:(id)a3;
+ (id)_manifestWithBundle:(id)a3 error:(id *)a4;
+ (void)_addExtensionEndpoint:(id)a3;
+ (void)_flushCacheForBundle:(id)a3;
+ (void)_setConnection:(id)a3;
- (NSBundle)bundle;
- (NSBundleResourceRequest)init;
- (NSBundleResourceRequest)initWithTag:(id)a3;
- (NSBundleResourceRequest)initWithTags:(NSSet *)tags;
- (NSBundleResourceRequest)initWithTags:(NSSet *)tags bundle:(NSBundle *)bundle;
- (NSProgress)progress;
- (NSSet)tags;
- (double)loadingPriority;
- (void)beginAccessingResourcesWithCompletionHandler:(void *)completionHandler;
- (void)conditionallyBeginAccessingResourcesWithCompletionHandler:(void *)completionHandler;
- (void)dealloc;
- (void)endAccessingResources;
- (void)setLoadingPriority:(double)loadingPriority;
@end

@implementation NSBundleResourceRequest

+ (id)_connection
{
  id result = (id)qword_1EB1E85C8;
  if (!qword_1EB1E85C8)
  {
    if (qword_1EB1E85D8 != -1) {
      dispatch_once(&qword_1EB1E85D8, &__block_literal_global_241);
    }
    return (id)qword_1EB1E85D0;
  }
  return result;
}

void __38__NSBundleResourceRequest__connection__block_invoke()
{
  v0 = [[NSXPCConnection alloc] initWithMachServiceName:@"com.apple.ondemandd.client" options:0];
  qword_1EB1E85D0 = (uint64_t)v0;

  _setupConnection(v0);
}

+ (void)_setConnection:(id)a3
{
  if (qword_1EB1E85C8)
  {
    [(id)qword_1EB1E85C8 invalidate];
  }
  id v4 = a3;
  qword_1EB1E85C8 = (uint64_t)v4;
  if (a3)
  {
    _setupConnection(v4);
  }
}

+ (void)_flushCacheForBundle:(id)a3
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1_0);
  if (qword_1EB1E85A8) {
    [(id)qword_1EB1E85A8 removeObjectForKey:a3];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_0);
}

- (NSBundleResourceRequest)init
{
}

- (NSBundleResourceRequest)initWithTag:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  v5 = +[NSBundle mainBundle];

  return [(NSBundleResourceRequest *)self initWithTags:v4 bundle:v5];
}

- (NSBundleResourceRequest)initWithTags:(NSSet *)tags
{
  v5 = +[NSBundle mainBundle];

  return [(NSBundleResourceRequest *)self initWithTags:tags bundle:v5];
}

- (NSBundleResourceRequest)initWithTags:(NSSet *)tags bundle:(NSBundle *)bundle
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSBundleResourceRequest;
  v6 = [(NSBundleResourceRequest *)&v9 init];
  if (v6)
  {
    v6->_tags = (NSSet *)[(NSSet *)tags copy];
    v6->_priority = 0.5;
    v6->_bundle = bundle;
    v7 = [[NSProgress alloc] initWithParent:0 userInfo:0];
    v6->_progress = v7;
    [(NSProgress *)v7 set_adoptChildUserInfo:1];
    [(NSProgress *)v6->_progress setTotalUnitCount:1];
    [(NSProgress *)v6->_progress setUserInfoObject:@"NSProgressFileOperationKindDownloading" forKey:@"NSProgressFileOperationKindKey"];
    v6->_fetchState = 0;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int64_t fetchState = self->_fetchState;
  if ((unint64_t)(fetchState - 3) >= 2)
  {
    if (fetchState == 2) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"There appears to have been an overrelease of the NSBundleResourceRequest object" userInfo:0]);
    }
  }
  else
  {
    [(NSBundleResourceRequest *)self endAccessingResources];
  }

  v4.receiver = self;
  v4.super_class = (Class)NSBundleResourceRequest;
  [(NSBundleResourceRequest *)&v4 dealloc];
}

+ (id)_assetPackBundleForBundle:(id)a3 withAssetPackID:(id)a4
{
  v6 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)a3, 0);
  if (!v6
    || (v7 = v6,
        [(NSLock *)v6->super._lock lock],
        uint64_t v8 = [(NSMutableDictionary *)v7->super._assetPackToURL objectForKey:a4],
        [(NSLock *)v7->super._lock unlock],
        !v8))
  {
    objc_super v9 = +[_NSBundleODRDataForExtensions dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForExtensions, (uint64_t)a3, 0);
    if (!v9) {
      return 0;
    }
    uint64_t v10 = v9;
    [(NSLock *)v9->super._lock lock];
    uint64_t v8 = [(NSMutableDictionary *)v10->super._assetPackToURL objectForKey:a4];
    [(NSLock *)v10->super._lock unlock];
    if (!v8) {
      return 0;
    }
  }

  return +[NSBundle bundleWithURL:v8];
}

+ (id)_manifestWithBundle:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"The bundle was nil" userInfo:0]);
  }
  uint64_t v5 = [a3 URLForResource:@"OnDemandResources.plist" withExtension:0];
  if (!v5)
  {
    if (a4)
    {
      uint64_t v8 = 100;
      uint64_t v9 = 0;
LABEL_13:
      v6 = 0;
      *a4 = +[NSError errorWithDomain:@"_NSBundleResourceRequestErrorDomain" code:v8 userInfo:v9];
      return v6;
    }
    return 0;
  }
  v15[0] = 0;
  if (![MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:0 error:v15])
  {
    if (a4)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15[0] forKey:@"NSUnderlyingError"];
      uint64_t v8 = 101;
      goto LABEL_13;
    }
    return 0;
  }
  v13[5] = 0;
  id v14 = 0;
  [MEMORY[0x1E4F1CAD0] setWithObject:@"NSBundleResourceRequestTags"];
  if ((_CFPropertyListCreateFiltered() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = @"Manifest is not a dictionary";
LABEL_18:
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"_NSBundleResourceRequestErrorDomain", 101, [v10 dictionaryWithObject:v11 forKey:@"NSDebugDescription"]);
    }
LABEL_19:

    return 0;
  }
  v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v7 = (void *)[v14 objectForKey:@"NSBundleResourceRequestTags"];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      v11 = @"Manifest has no tags";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__NSBundleResourceRequest__manifestWithBundle_error___block_invoke;
  v13[3] = &unk_1E51FA610;
  v13[4] = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  return v6;
}

uint64_t __53__NSBundleResourceRequest__manifestWithBundle_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 objectForKey:@"NSAssetPacks"];
  if (!v5) {
    uint64_t v5 = [MEMORY[0x1E4F1C978] array];
  }
  v6 = *(void **)(a1 + 32);

  return [v6 setObject:v5 forKey:a2];
}

- (NSProgress)progress
{
  v2 = self->_progress;

  return v2;
}

- (double)loadingPriority
{
  return self->_priority;
}

- (void)setLoadingPriority:(double)loadingPriority
{
  if (self->_priority != loadingPriority)
  {
    double v4 = 1.0;
    if (loadingPriority == 1.79769313e308 || loadingPriority <= 1.0) {
      double v4 = loadingPriority;
    }
    BOOL v6 = loadingPriority < 0.0;
    double v7 = 0.0;
    if (!v6) {
      double v7 = v4;
    }
    self->_double priority = v7;
    if (self->_fetchState == 2)
    {
      uint64_t v8 = objc_msgSend(+[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"), "remoteObjectProxy");
      double priority = self->_priority;
      tags = self->_tags;
      v11 = [(NSBundle *)self->_bundle bundleURL];
      [v8 setLoadingPriority:tags forTags:v11 inBundle:priority];
    }
  }
}

- (NSSet)tags
{
  v2 = (void *)[(NSSet *)self->_tags copy];

  return (NSSet *)v2;
}

- (NSBundle)bundle
{
  v2 = self->_bundle;

  return v2;
}

- (void)beginAccessingResourcesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = 0;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong_explicit(&self->_fetchState, (unint64_t *)&v4, 2uLL, memory_order_relaxed, memory_order_relaxed);
  if (v4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"beginAccessingResources was called more than once or at the wrong time (%ld)", self->_fetchState), 0 reason userInfo]);
  }
  if (qword_1EB1E8600 != -1) {
    dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
  }
  BOOL v6 = qword_1EB1E85F8;
  if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
  {
    bundle = self->_bundle;
    v17 = [(NSArray *)[(NSSet *)self->_tags allObjects] componentsJoinedByString:@","];
    *(_DWORD *)buf = 134218498;
    v21 = self;
    __int16 v22 = 2048;
    v23 = bundle;
    __int16 v24 = 2114;
    v25 = v17;
    _os_log_debug_impl(&dword_181795000, v6, OS_LOG_TYPE_DEBUG, "Begin: Request 0x%p / Bundle 0x%p / Tags: \"%{public}@\"", buf, 0x20u);
  }
  double v7 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self->_bundle, 1);
  id v8 = +[NSBundleResourceRequest _connection];
  if (v7)
  {
    initialStateGroup = v7->_initialStateGroup;
    dispatch_time_t v10 = dispatch_time(0, 3000000000);
    dispatch_group_wait(initialStateGroup, v10);
  }
  v11 = +[NSProgress progressWithTotalUnitCount:1 parent:self->_progress pendingUnitCount:1];
  [(NSProgress *)v11 set_adoptChildUserInfo:1];
  [(NSProgress *)v11 becomeCurrentWithPendingUnitCount:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E51FA638;
  v19[4] = self;
  v19[5] = completionHandler;
  v12 = (void *)[v8 remoteObjectProxyWithErrorHandler:v19];
  tags = self->_tags;
  id v14 = [(NSBundle *)self->_bundle bundleURL];
  double priority = self->_priority;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke_283;
  v18[3] = &unk_1E51FA660;
  v18[4] = v7;
  v18[5] = self;
  v18[6] = completionHandler;
  [v12 pinTags:tags inBundle:v14 priority:v18 completionHandler:priority];
  [(NSProgress *)v11 resignCurrent];
}

uint64_t __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 2;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(*(void *)(a1 + 32) + 40), (unint64_t *)&v2, 4uLL, memory_order_relaxed, memory_order_relaxed);
  if (v2 != 2)
  {
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    v3 = qword_1EB1E85F8;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_181795000, v3, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error handler) (%lld)", (uint8_t *)&v6, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 40) = 4;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke_283(uint64_t a1, void *a2, NSError *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    [*(id *)(v6 + 16) lock];
    id v7 = *(id *)(v6 + 56);
    [*(id *)(v6 + 16) unlock];
    if (v7)
    {
      uint64_t v8 = 2;
      atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(*(void *)(a1 + 40) + 40), (unint64_t *)&v8, 4uLL, memory_order_relaxed, memory_order_relaxed);
      if (v8 != 2)
      {
        if (qword_1EB1E8600 != -1) {
          dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
        }
        uint64_t v9 = qword_1EB1E85F8;
        if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 40);
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v29;
          _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error case) (%lld)", buf, 0xCu);
        }
        *(void *)(*(void *)(a1 + 40) + 40) = 4;
      }
      dispatch_time_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
      return v10();
    }
  }
  v11 = (atomic_ullong *)(*(void *)(a1 + 40) + 40);
  if (a3)
  {
    uint64_t v12 = 2;
    atomic_compare_exchange_strong_explicit(v11, (unint64_t *)&v12, 4uLL, memory_order_relaxed, memory_order_relaxed);
    if (v12 != 2)
    {
      if (qword_1EB1E8600 != -1) {
        dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
      }
      v13 = qword_1EB1E85F8;
      if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 40);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_error_impl(&dword_181795000, v13, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error case) (%lld)", buf, 0xCu);
      }
      *(void *)(*(void *)(a1 + 40) + 40) = 4;
    }
    if ([(NSString *)[(NSError *)a3 domain] isEqualToString:@"NSCocoaErrorDomain"]
      && [(NSError *)a3 code] == 3072)
    {
      if (qword_1EB1E8600 != -1) {
        dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
      }
      id v14 = qword_1EB1E85F8;
      if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v15;
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)a3;
        _os_log_debug_impl(&dword_181795000, v14, OS_LOG_TYPE_DEBUG, "Begin: Request 0x%p was cancelled (error: %@)", buf, 0x16u);
      }
    }
    else
    {
      if (qword_1EB1E8600 != -1) {
        dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
      }
      v16 = qword_1EB1E85F8;
      if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v30;
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)a3;
        _os_log_error_impl(&dword_181795000, v16, OS_LOG_TYPE_ERROR, "Begin: Request 0x%p response: Error: %@", buf, 0x16u);
      }
    }
    if ([(NSString *)[(NSError *)a3 domain] isEqualToString:@"_NSBundleResourceRequestErrorDomain"]&& [(NSError *)a3 code] == 101)
    {
      v17 = +[NSString stringWithFormat:@"At least one of the set of tags was not found in your application: %@", *(void *)(*(void *)(a1 + 40) + 8)];
      a3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4994, [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v17 forKey:*MEMORY[0x1E4F1D138]]);
    }
    if ([(NSString *)[(NSError *)a3 domain] isEqualToString:@"NSCocoaErrorDomain"])
    {
      if ([(NSError *)a3 code] == 4995)
      {
        uint64_t v18 = objc_msgSend(-[NSDictionary objectForKey:](-[NSError userInfo](a3, "userInfo"), "objectForKey:", @"_NSBundleResourceRequestServerBusyTimeIntervalKey"), "integerValue");
        if (v18)
        {
          uint64_t v19 = v18;
          v20 = objc_opt_new();
          [v20 setSecond:v19];
          v21 = objc_opt_new();
          [v21 setUnitsStyle:3];
          [v21 setAllowedUnits:240];
          __int16 v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"DetailedRecoverySuggestion4995" value:@"Try again in %@." table:@"FoundationErrors"], objc_msgSend(v21, "stringFromDateComponents:", v20));

          +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4995, [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v22 forKey:@"NSLocalizedRecoverySuggestion"]);
        }
      }
    }
    dispatch_time_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v10();
  }
  uint64_t v24 = 2;
  atomic_compare_exchange_strong_explicit(v11, (unint64_t *)&v24, 3uLL, memory_order_relaxed, memory_order_relaxed);
  uint64_t v25 = qword_1EB1E8600;
  if (v24 != 2)
  {
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    uint64_t v26 = qword_1EB1E85F8;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 40);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_error_impl(&dword_181795000, v26, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (success case) (%lld)", buf, 0xCu);
      uint64_t v25 = qword_1EB1E8600;
    }
    else
    {
      uint64_t v25 = -1;
    }
    *(void *)(*(void *)(a1 + 40) + 40) = 3;
  }
  if (v25 != -1) {
    dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
  }
  v27 = qword_1EB1E85F8;
  if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = *(void *)(a1 + 40);
    uint64_t v32 = [a2 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v31;
    __int16 v36 = 2048;
    uint64_t v37 = v32;
    _os_log_debug_impl(&dword_181795000, v27, OS_LOG_TYPE_DEBUG, "Begin: Request 0x%p response: %lu packs now available", buf, 0x16u);
  }
  *(void *)buf = 0;
  if ([*(id *)(a1 + 32) assetPacksBecameAvailable:a2 error:buf]) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = *(void *)buf;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v28);
}

- (void)conditionallyBeginAccessingResourcesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self->_bundle, 1);
  uint64_t v6 = 0;
  atomic_compare_exchange_strong_explicit(&self->_fetchState, (unint64_t *)&v6, 1uLL, memory_order_relaxed, memory_order_relaxed);
  if (v6) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"beginAccessingResources was called more than once or at the wrong time (%ld)", self->_fetchState), 0 reason userInfo]);
  }
  id v7 = v5;
  if (qword_1EB1E8600 != -1) {
    dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
  }
  uint64_t v8 = qword_1EB1E85F8;
  if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
  {
    bundle = self->_bundle;
    id v14 = [(NSArray *)[(NSSet *)self->_tags allObjects] componentsJoinedByString:@","];
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    v20 = bundle;
    __int16 v21 = 2114;
    __int16 v22 = v14;
    _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "Begin: Request (Conditional) 0x%p / Bundle 0x%p / Tags: \"%{public}@\"", buf, 0x20u);
  }
  id v9 = +[NSBundleResourceRequest _connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E51FA638;
  v16[4] = self;
  v16[5] = completionHandler;
  dispatch_time_t v10 = (void *)[v9 remoteObjectProxyWithErrorHandler:v16];
  tags = self->_tags;
  uint64_t v12 = [(NSBundle *)self->_bundle bundleURL];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke_298;
  v15[3] = &unk_1E51FA688;
  v15[5] = v7;
  v15[6] = completionHandler;
  v15[4] = self;
  [v10 conditionallyPinTags:tags inBundle:v12 completionHandler:v15];
}

uint64_t __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 1;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(*(void *)(a1 + 32) + 40), (unint64_t *)&v2, 0, memory_order_relaxed, memory_order_relaxed);
  if (v2 != 1)
  {
    if (qword_1EB1E8600 != -1) {
      dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
    }
    v3 = qword_1EB1E85F8;
    if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_181795000, v3, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (error handler) (%lld)", (uint8_t *)&v6, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke_298(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1E8600 != -1) {
    dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
  }
  int v6 = qword_1EB1E85F8;
  if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v15 = [a3 count];
    }
    else {
      uint64_t v15 = 0;
    }
    int v18 = 134218496;
    uint64_t v19 = v14;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    __int16 v22 = 1024;
    int v23 = a2;
    _os_log_debug_impl(&dword_181795000, v6, OS_LOG_TYPE_DEBUG, "Begin: Request (Conditional) 0x%p response: Available %lu : %d packs", (uint8_t *)&v18, 0x1Cu);
  }
  uint64_t v7 = (atomic_ullong *)(*(void *)(a1 + 32) + 40);
  if (a2)
  {
    uint64_t v8 = 1;
    atomic_compare_exchange_strong_explicit(v7, (unint64_t *)&v8, 3uLL, memory_order_relaxed, memory_order_relaxed);
    if (v8 != 1)
    {
      if (qword_1EB1E8600 != -1) {
        dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
      }
      id v9 = qword_1EB1E85F8;
      if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 40);
        int v18 = 134217984;
        uint64_t v19 = v16;
        _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (available case) (%lld)", (uint8_t *)&v18, 0xCu);
      }
      *(void *)(*(void *)(a1 + 32) + 40) = 3;
    }
    [*(id *)(a1 + 40) assetPacksBecameAvailable:a3 error:0];
    dispatch_time_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v11 = 1;
    atomic_compare_exchange_strong_explicit(v7, (unint64_t *)&v11, 0, memory_order_relaxed, memory_order_relaxed);
    if (v11 != 1)
    {
      if (qword_1EB1E8600 != -1) {
        dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
      }
      uint64_t v12 = qword_1EB1E85F8;
      if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 40);
        int v18 = 134217984;
        uint64_t v19 = v17;
        _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (unavailable case) (%lld)", (uint8_t *)&v18, 0xCu);
      }
      *(void *)(*(void *)(a1 + 32) + 40) = 0;
    }
    dispatch_time_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v10();
}

- (void)endAccessingResources
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1E8600 != -1) {
    dispatch_once(&qword_1EB1E8600, &__block_literal_global_349);
  }
  v3 = qword_1EB1E85F8;
  if (os_log_type_enabled((os_log_t)qword_1EB1E85F8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "End: Request 0x%p", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v4 = 3;
  atomic_compare_exchange_strong_explicit(&self->_fetchState, (unint64_t *)&v4, 5uLL, memory_order_relaxed, memory_order_relaxed);
  if (v4 == 3)
  {
    tags = self->_tags;
    bundle = self->_bundle;
    uint64_t v7 = tags;
    uint64_t v8 = bundle;
    id v9 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)bundle, 1);
    id v10 = +[NSBundleResourceRequest _connection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___endAccessingResources_block_invoke;
    v13[3] = &unk_1E51FA6D8;
    v13[4] = tags;
    v13[5] = bundle;
    uint64_t v11 = (void *)[v10 remoteObjectProxyWithErrorHandler:v13];
    uint64_t v12 = [(NSBundle *)bundle bundleURL];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v15 = ___endAccessingResources_block_invoke_2;
    uint64_t v16 = &unk_1E51FA700;
    uint64_t v17 = v9;
    id v18 = v10;
    uint64_t v19 = tags;
    __int16 v20 = bundle;
    [v11 unpinTags:tags inBundle:v12 completionHandler:&buf];
  }
}

+ (id)_extensionEndpoint
{
  return 0;
}

+ (id)_extensionEndpointForMainBundleOfHostApplication:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  int v6 = __123__NSBundleResourceRequest__NSBundleResourceRequestAppExtensionAdditions___extensionEndpointForMainBundleOfHostApplication___block_invoke;
  uint64_t v7 = &unk_1E51F71D0;
  id v8 = a3;
  if (qword_1EB1E85F0 != -1) {
    dispatch_once(&qword_1EB1E85F0, &v4);
  }
  return (id)objc_msgSend((id)qword_1EB1E85E0, "endpoint", v4, v5, v6, v7, v8, v9);
}

uint64_t __123__NSBundleResourceRequest__NSBundleResourceRequestAppExtensionAdditions___extensionEndpointForMainBundleOfHostApplication___block_invoke(uint64_t a1)
{
  qword_1EB1E85E0 = +[NSXPCListener anonymousListener];
  qword_1EB1E85E8 = (uint64_t)+[_NSBundleODRDataForExtensions dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForExtensions, *(void *)(a1 + 32), 1);
  [(id)qword_1EB1E85E0 setDelegate:qword_1EB1E85E8];
  uint64_t v2 = (void *)qword_1EB1E85E0;

  return [v2 resume];
}

+ (void)_addExtensionEndpoint:(id)a3
{
  v9[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)+[NSBundle mainBundle], 1);
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = [[NSXPCConnection alloc] initWithListenerEndpoint:a3];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:_appExtensionInterface()];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56___NSBundleODRDataForApplications_addExtensionEndpoint___block_invoke;
    v9[3] = &unk_1E51F6678;
    v9[4] = v5;
    v9[5] = v6;
    [(NSXPCConnection *)v6 setInvalidationHandler:v9];
    [(NSXPCConnection *)v6 resume];
    [(NSLock *)v5->super._lock lock];
    extensionConnections = v5->_extensionConnections;
    if (!extensionConnections)
    {
      extensionConnections = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v5->_extensionConnections = extensionConnections;
    }
    [(NSMutableSet *)extensionConnections addObject:v6];
    rootSandboxPath = v5->_rootSandboxPath;
    if (rootSandboxPath)
    {
      [(NSString *)rootSandboxPath UTF8String];
      objc_msgSend(-[NSXPCConnection remoteObjectProxy](v6, "remoteObjectProxy"), "accessSandboxExtension:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sandbox_extension_issue_file()));
    }
    [(NSLock *)v5->super._lock unlock];
  }
}

@end