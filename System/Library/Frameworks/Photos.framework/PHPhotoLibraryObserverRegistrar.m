@interface PHPhotoLibraryObserverRegistrar
+ (BOOL)_isInternalObserver:(id)a3;
- (BOOL)_lock_hasChangeObservers;
- (BOOL)clearsOIDCacheAfterFetchResultDealloc;
- (BOOL)postsPersistentHistoryChangedNotifications;
- (PHPhotoLibraryObserverRegistrar)initWithLibraryBundle:(id)a3 changeHandlingDebugger:(id)a4 uniqueObjectIDCache:(id)a5;
- (unint64_t)countOfRegisteredFetchResults;
- (void)_lock_clearOIDCache;
- (void)_lock_pauseChangeHandlingIfNeeded;
- (void)_lock_resumeChangeHandlingIfNeeded;
- (void)addObservers:(id)a3 authorizationStatus:(int64_t)a4;
- (void)clearIsChangeProcessingPending;
- (void)dealloc;
- (void)getObserversWithBlock:(id)a3;
- (void)publishChangesToObserversOnQueue:(id)a3 withBlock:(id)a4;
- (void)registerFetchResult:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setClearsOIDCacheAfterFetchResultDealloc:(BOOL)a3;
- (void)setPostsPersistentHistoryChangedNotifications:(BOOL)a3;
- (void)throttlePendingChangesTimerFiredWithBlock:(id)a3;
- (void)throttlePendingChangesWithBlock:(id)a3;
- (void)unregisterFetchResult:(id)a3;
@end

@implementation PHPhotoLibraryObserverRegistrar

- (void)registerFetchResult:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    PLRunWithUnfairLock();
  }
}

uint64_t __55__PHPhotoLibraryObserverRegistrar_registerFetchResult___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_lock_resumeChangeHandlingIfNeeded");
}

- (void)unregisterFetchResult:(id)a3
{
  if (a3) {
    PLRunWithUnfairLock();
  }
}

- (void)addObservers:(id)a3 authorizationStatus:(int64_t)a4
{
  id v5 = a3;
  id v4 = v5;
  PLRunWithUnfairLock();
}

uint64_t __57__PHPhotoLibraryObserverRegistrar_unregisterFetchResult___block_invoke(uint64_t a1)
{
  NSHashRemove(*(NSHashTable **)(*(void *)(a1 + 32) + 40), *(const void **)(a1 + 40));
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[39])
  {
    objc_msgSend(v2, "_lock_clearOIDCache");
    v2 = *(unsigned char **)(a1 + 32);
  }

  return objc_msgSend(v2, "_lock_pauseChangeHandlingIfNeeded");
}

uint64_t __68__PHPhotoLibraryObserverRegistrar_addObservers_authorizationStatus___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 36))
  {
    if ((unint64_t)(*(void *)(a1 + 48) - 3) > 1)
    {
      id v3 = PLChangeHandlingGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v4 = *(void *)(a1 + 48) - 1;
        if (v4 > 3) {
          id v5 = @"not determined";
        }
        else {
          id v5 = off_1E5844F98[v4];
        }
        v6 = v5;
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "_addObserver:authorizationStatus: waiting for authorization (%@)", buf, 0xCu);
      }
    }
    else
    {
      *(unsigned char *)(v2 + 36) = 1;
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (+[PHPhotoLibraryObserverRegistrar _isInternalObserver:](PHPhotoLibraryObserverRegistrar, "_isInternalObserver:", v12, (void)v15))
        {
          uint64_t v13 = 48;
        }
        else
        {
          uint64_t v13 = 56;
        }
        [*(id *)(*(void *)(a1 + 32) + v13) addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_lock_resumeChangeHandlingIfNeeded");
}

- (void)_lock_resumeChangeHandlingIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v4 = [(NSHashTable *)self->_lock_internalChangeObservers count];
    NSUInteger v5 = [(NSHashTable *)self->_lock_externalChangeObservers count];
    NSUInteger v6 = [(NSHashTable *)self->_lock_fetchResults count];
    BOOL lock_isChangeHandlingActive = self->_lock_isChangeHandlingActive;
    BOOL lock_isChangeHandlingAuthorized = self->_lock_isChangeHandlingAuthorized;
    int v10 = 134219008;
    NSUInteger v11 = v4;
    __int16 v12 = 2048;
    NSUInteger v13 = v5;
    __int16 v14 = 2048;
    NSUInteger v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = lock_isChangeHandlingActive;
    __int16 v18 = 1024;
    BOOL v19 = lock_isChangeHandlingAuthorized;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "_resumeChangeHandlingIfNeeded - internal: %tu external: %tu fetchResults: %tu isActive: %d authorized: %d", (uint8_t *)&v10, 0x2Cu);
  }

  if (!self->_lock_isChangeHandlingActive)
  {
    if ([(PHPhotoLibraryObserverRegistrar *)self _lock_hasChangeObservers])
    {
      if (self->_lock_isChangeHandlingAuthorized
        || (BOOL v9 = +[PHPhotoLibrary checkAuthorizationStatusForAPIAccessLevel:2 suppressPrompt:1], self->_lock_isChangeHandlingAuthorized = v9, v9))
      {
        [(PLPhotoLibraryBundle *)self->_photoLibraryBundle beginObservingChanges];
        self->_BOOL lock_isChangeHandlingActive = 1;
        [(PHChangeHandlingDebugger *)self->_changeHandlingDebugger changeHandlingActiveStateDidChange:1];
      }
    }
  }
}

- (void)_lock_pauseChangeHandlingIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v4 = [(NSHashTable *)self->_lock_internalChangeObservers count];
    NSUInteger v5 = [(NSHashTable *)self->_lock_externalChangeObservers count];
    NSUInteger v6 = [(NSHashTable *)self->_lock_fetchResults count];
    BOOL lock_isChangeHandlingActive = self->_lock_isChangeHandlingActive;
    int v8 = 134218752;
    NSUInteger v9 = v4;
    __int16 v10 = 2048;
    NSUInteger v11 = v5;
    __int16 v12 = 2048;
    NSUInteger v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = lock_isChangeHandlingActive;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "_pauseChangeHandlingIfNeeded - internal: %tu external: %tu fetchResults: %tu isActive: %d", (uint8_t *)&v8, 0x26u);
  }

  if (self->_lock_isChangeHandlingActive
    && ![(PHPhotoLibraryObserverRegistrar *)self _lock_hasChangeObservers])
  {
    [(PLPhotoLibraryBundle *)self->_photoLibraryBundle endObservingChanges];
    self->_BOOL lock_isChangeHandlingActive = 0;
    [(PHChangeHandlingDebugger *)self->_changeHandlingDebugger changeHandlingActiveStateDidChange:0];
  }
}

- (BOOL)_lock_hasChangeObservers
{
  os_unfair_lock_assert_owner(&self->_lock);
  NSUInteger v3 = [(NSHashTable *)self->_lock_internalChangeObservers count];
  NSUInteger v4 = [(NSHashTable *)self->_lock_externalChangeObservers count] + v3;
  return v4
       + [(NSHashTable *)self->_lock_fetchResults count]
       + self->_lock_postsPersistentHistoryChangedNotifications != 0;
}

+ (BOOL)_isInternalObserver:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (PHPhotoLibraryObserverRegistrar)initWithLibraryBundle:(id)a3 changeHandlingDebugger:(id)a4 uniqueObjectIDCache:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PHPhotoLibraryObserverRegistrar;
  __int16 v12 = [(PHPhotoLibraryObserverRegistrar *)&v24 init];
  NSUInteger v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibraryBundle, a3);
    objc_storeStrong((id *)&v13->_changeHandlingDebugger, a4);
    objc_storeStrong((id *)&v13->_uniqueObjectIDCache, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v13->_BOOL lock_isChangeHandlingAuthorized = 0;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    lock_fetchResults = v13->_lock_fetchResults;
    v13->_lock_fetchResults = (NSHashTable *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_internalChangeObservers = v13->_lock_internalChangeObservers;
    v13->_lock_internalChangeObservers = (NSHashTable *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_externalChangeObservers = v13->_lock_externalChangeObservers;
    v13->_lock_externalChangeObservers = (NSHashTable *)v18;

    v13->_pendingLock._os_unfair_lock_opaque = 0;
    v13->_pendingLock_isChangeProcessingPending = 0;
    [(PHChangeHandlingDebugger *)v13->_changeHandlingDebugger changeHandlingActiveStateDidChange:v13->_lock_isChangeHandlingActive];
    uint64_t v20 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)buf = 138413314;
      uint64_t v26 = v21;
      __int16 v27 = 2048;
      v28 = v13;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v10;
      __int16 v33 = 2112;
      id v34 = v11;
      _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryBundle:%@ changeHandlingDebugger:%@ uniqueObjectIDCache:%@", buf, 0x34u);
    }

    uint64_t v22 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_externalChangeObservers, 0);
  objc_storeStrong((id *)&self->_lock_internalChangeObservers, 0);
  objc_storeStrong((id *)&self->_lock_fetchResults, 0);
  objc_storeStrong((id *)&self->_uniqueObjectIDCache, 0);
  objc_storeStrong((id *)&self->_changeHandlingDebugger, 0);

  objc_storeStrong((id *)&self->_photoLibraryBundle, 0);
}

- (void)clearIsChangeProcessingPending
{
}

void __65__PHPhotoLibraryObserverRegistrar_clearIsChangeProcessingPending__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 68);
  *(unsigned char *)(v2 + 68) = 0;
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 72) = CFAbsoluteTimeGetCurrent();
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    NSUInteger v5 = *(void **)(v4 + 16);
    uint64_t v6 = *(unsigned __int8 *)(v4 + 68);
    [v5 processPendingChangesStateDidChange:v6];
  }
}

- (void)throttlePendingChangesTimerFiredWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  [(PHPhotoLibraryObserverRegistrar *)self clearIsChangeProcessingPending];
  v4[2]();
}

- (void)throttlePendingChangesWithBlock:(id)a3
{
  int v3 = (void (**)(void, double))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = 0;
  NSUInteger v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  PLRunWithUnfairLock();
  if (!*((unsigned char *)v9 + 24)) {
    v3[2](v3, v5[3]);
  }
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v8, 8);
}

void *__67__PHPhotoLibraryObserverRegistrar_throttlePendingChangesWithBlock___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(result[4] + 68);
  *(unsigned char *)(result[4] + 68) = 1;
  *(void *)(*(void *)(result[6] + 8) + 24) = *(void *)(result[4] + 72);
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24)) {
    return (void *)[*(id *)(result[4] + 16) processPendingChangesStateDidChange:1];
  }
  return result;
}

- (void)publishChangesToObserversOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke;
  v10[3] = &unk_1E58479A8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PHPhotoLibraryObserverRegistrar *)self throttlePendingChangesWithBlock:v10];
}

void __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke(uint64_t a1, double a2)
{
  double v3 = CFAbsoluteTimeGetCurrent() - a2;
  if (v3 <= 0.0) {
    double v4 = 0.3;
  }
  else {
    double v4 = 0.3 - v3;
  }
  double v5 = v4 * 1000000000.0;
  BOOL v6 = v4 <= 0.0;
  double v7 = 0.0;
  if (!v6) {
    double v7 = v5;
  }
  int64_t v8 = (uint64_t)v7;
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v9 = dispatch_time(0, v8);
  uint64_t v10 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke_2;
  block[3] = &unk_1E5847980;
  objc_copyWeak(&v13, &location);
  id v12 = *(id *)(a1 + 48);
  dispatch_after(v9, v10, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __78__PHPhotoLibraryObserverRegistrar_publishChangesToObserversOnQueue_withBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained throttlePendingChangesTimerFiredWithBlock:*(void *)(a1 + 32)];
}

- (void)getObserversWithBlock:(id)a3
{
  double v3 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = __Block_byref_object_copy__40430;
  uint64_t v20 = __Block_byref_object_dispose__40431;
  id v21 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__40430;
  uint64_t v14 = __Block_byref_object_dispose__40431;
  id v15 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x3032000000;
  double v7 = __Block_byref_object_copy__40430;
  int64_t v8 = __Block_byref_object_dispose__40431;
  id v9 = (id)MEMORY[0x1E4F1CBF0];
  PLRunWithUnfairLock();
  v3[2](v3, v17[5], v11[5], v5[5]);
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void __57__PHPhotoLibraryObserverRegistrar_getObserversWithBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) allObjects];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 56) allObjects];
  uint64_t v6 = *(void *)(a1[6] + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1[4] + 40) allObjects];
  uint64_t v9 = *(void *)(a1[7] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)_lock_clearOIDCache
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = [(NSHashTable *)self->_lock_fetchResults allObjects];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_40433];
  uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

  NSUInteger v6 = [(NSHashTable *)self->_lock_fetchResults count];
  if (v6 == [v5 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "fetchedObjectIDs", (void)v14);
          id v13 = -[PHUniqueObjectIDCache uniquedOIDs:](self->_uniqueObjectIDCache, v12);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __54__PHPhotoLibraryObserverRegistrar__lock_clearOIDCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 preventsClearingOIDCache] ^ 1;
}

- (unint64_t)countOfRegisteredFetchResults
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  PLRunWithUnfairLock();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __64__PHPhotoLibraryObserverRegistrar_countOfRegisteredFetchResults__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)clearsOIDCacheAfterFetchResultDealloc
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  PLRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __72__PHPhotoLibraryObserverRegistrar_clearsOIDCacheAfterFetchResultDealloc__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 39);
  return result;
}

- (void)setClearsOIDCacheAfterFetchResultDealloc:(BOOL)a3
{
}

uint64_t __76__PHPhotoLibraryObserverRegistrar_setClearsOIDCacheAfterFetchResultDealloc___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 39) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)postsPersistentHistoryChangedNotifications
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  PLRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __77__PHPhotoLibraryObserverRegistrar_postsPersistentHistoryChangedNotifications__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 38);
  return result;
}

- (void)setPostsPersistentHistoryChangedNotifications:(BOOL)a3
{
}

uint64_t __81__PHPhotoLibraryObserverRegistrar_setPostsPersistentHistoryChangedNotifications___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 38) != v2)
  {
    *(unsigned char *)(v1 + 38) = v2;
    uint64_t v3 = *(unsigned char **)(result + 32);
    if (v3[38]) {
      return objc_msgSend(v3, "_lock_resumeChangeHandlingIfNeeded");
    }
    else {
      return objc_msgSend(v3, "_lock_pauseChangeHandlingIfNeeded");
    }
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

uint64_t __50__PHPhotoLibraryObserverRegistrar_removeObserver___block_invoke(uint64_t a1)
{
  BOOL v2 = +[PHPhotoLibraryObserverRegistrar _isInternalObserver:*(void *)(a1 + 32)];
  uint64_t v3 = 56;
  if (v2) {
    uint64_t v3 = 48;
  }
  [*(id *)(*(void *)(a1 + 40) + v3) removeObject:*(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 40);

  return objc_msgSend(v4, "_lock_pauseChangeHandlingIfNeeded");
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PHPhotoLibraryObserverRegistrar;
  [(PHPhotoLibraryObserverRegistrar *)&v4 dealloc];
}

@end