@interface BWDeferredCaptureContainerManager
+ (id)sharedInstance;
- (BOOL)_removeContainerForCaptureRequestIdentifier:(void *)a3 array:;
- (BOOL)canDefer;
- (BWDeferredCaptureContainerManager)init;
- (__CVBuffer)newPixelBuffer:(id)a3;
- (id)copyRemoteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5;
- (id)createCaptureContainerWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5;
- (id)lookupCaptureContainer:(id)a3;
- (id)manifestsForApplicationID:(id)a3 err:(int *)a4;
- (int)abortContainer:(id)a3 error:(int)a4;
- (int)addBufferPool:(id)a3;
- (int)addCaptureContainer:(id)a3;
- (int)commitContainer:(id)a3;
- (int)containerWaitForFlush:(id)a3;
- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4;
- (int)queryContainerStatusForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 status:(int *)a5;
- (int)releaseRemoteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4;
- (int)removeBufferPool:(id)a3;
- (uint64_t)_containerForCaptureRequestIdentifier:(void *)a3 array:(uint64_t *)a4 index:;
- (uint64_t)_enumerateManifestsForApplicationID:(void *)a3 manifestArray:(int)a4 deleteInvalidContainers:;
- (uint64_t)_flushContainer:(void *)a3 container:;
- (uint64_t)_handleExpiryTimer;
- (uint64_t)_queryLowDiskThresholds:(uint64_t *)a3 veryLowDiskThresholdBytes:;
- (uint64_t)_reportCoreAnalyticsDataWithError:(void *)a3 container:;
- (void)_rescheduleCacheExpiryTimer;
- (void)_updateCacheEntryForContainer:(int)a3 release:;
- (void)flush:(id)a3 toMinimumCapacity:(unint64_t)a4;
@end

@implementation BWDeferredCaptureContainerManager

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_85);
  }
  return (id)sharedInstance_sharedInstance;
}

BWDeferredCaptureContainerManager *__51__BWDeferredCaptureContainerManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(BWDeferredCaptureContainerManager);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (BWDeferredCaptureContainerManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredCaptureContainerManager;
  id v2 = [(BWDeferredContainerManagerBase *)&v5 initWithQueuePriority:14];
  v3 = (BWDeferredCaptureContainerManager *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 54) = 0;
    *((_DWORD *)v2 + 55) = 10;
    *((void *)v2 + 28) = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 26));
    v3->_stagedContainers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_cachedContainers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_inflightContainers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_flushQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v3->_flushQueueBackground = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v3->_pools = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[BWDeferredCaptureContainerManager _queryLowDiskThresholds:veryLowDiskThresholdBytes:]((uint64_t)v3, (uint64_t *)&v3->_cachedLowDiskThresholdBytes, 0);
  }
  return v3;
}

- (uint64_t)_queryLowDiskThresholds:(uint64_t *)a3 veryLowDiskThresholdBytes:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  memset(&v10, 0, 512);
  uint64_t v9 = 0;
  objc_super v5 = [(NSString *)NSHomeDirectory() fileSystemRepresentation];
  if (!statfs(v5, &v10)
    && !fsctl(v10.f_mntonname, 0x4004681CuLL, (char *)&v9 + 4, 0)
    && !fsctl(v10.f_mntonname, 0x4004681BuLL, &v9, 0))
  {
    uint64_t v6 = v10.f_bsize * HIDWORD(v9);
    uint64_t v7 = (v9 * v10.f_bsize);
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  FigDebugAssert3();
  uint64_t v7 = 524288000;
  uint64_t v6 = 734003200;
  if (a2) {
LABEL_6:
  }
    *a2 = v6;
LABEL_7:
  if (a3) {
    *a3 = v7;
  }
  return 0;
}

- (uint64_t)_containerForCaptureRequestIdentifier:(void *)a3 array:(uint64_t *)a4 index:
{
  if (result)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__BWDeferredCaptureContainerManager__containerForCaptureRequestIdentifier_array_index___block_invoke;
    v7[3] = &unk_1E5C26F50;
    v7[4] = a2;
    uint64_t v6 = [a3 indexOfObjectPassingTest:v7];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      if (a4) {
        *a4 = v6;
      }
      return [a3 objectAtIndexedSubscript:v6];
    }
  }
  return result;
}

uint64_t __87__BWDeferredCaptureContainerManager__containerForCaptureRequestIdentifier_array_index___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 captureRequestIdentifier];
  return [v2 isEqualToString:v3];
}

- (BOOL)_removeContainerForCaptureRequestIdentifier:(void *)a3 array:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v4 = -[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:](a1, a2, a3, &v7);
  BOOL v5 = v4 != 0;
  if (v4) {
    [a3 removeObjectAtIndex:v7];
  }
  return v5;
}

- (uint64_t)_flushContainer:(void *)a3 container:
{
  if (a1)
  {
    [a3 preflush];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__BWDeferredCaptureContainerManager__flushContainer_container___block_invoke;
    block[3] = &unk_1E5C26F78;
    block[4] = a3;
    block[5] = a1;
    int v8 = 0;
    dispatch_async(a2, block);
  }
  return 0;
}

uint64_t __63__BWDeferredCaptureContainerManager__flushContainer_container___block_invoke(uint64_t a1)
{
  id v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v3 = [*(id *)(a1 + 32) captureRequestIdentifier];
  [*(id *)(a1 + 32) flush];
  -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:](*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void **)(a1 + 32));
  pthread_rwlock_wrlock((pthread_rwlock_t *)(*(void *)(a1 + 40) + 8));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:](v4, v3, *(void **)(v4 + 240));
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t result = pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 8));
  if (*v2 == 1)
  {
    return kdebug_trace();
  }
  return result;
}

- (uint64_t)_reportCoreAnalyticsDataWithError:(void *)a3 container:
{
  if (result)
  {
    uint64_t v5 = objc_alloc_init(BWDeferredCaptureAnalyticsPayload);
    [(BWDeferredCaptureAnalyticsPayload *)v5 setError:a2];
    if (a3)
    {
      -[BWDeferredCaptureAnalyticsPayload setProcessingType:](v5, "setProcessingType:", [a3 processingType]);
      -[BWDeferredCaptureAnalyticsPayload setFileBacked:](v5, "setFileBacked:", [a3 cached] ^ 1);
      -[BWDeferredCaptureAnalyticsPayload setCommitDurationInMilliseconds:](v5, "setCommitDurationInMilliseconds:", [a3 commitDurationNS] / 0xF4240uLL);
      -[BWDeferredCaptureAnalyticsPayload setFlushDurationInMilliseconds:](v5, "setFlushDurationInMilliseconds:", [a3 flushDurationNS] / 0xF4240uLL);
    }
    uint64_t v6 = +[BWCoreAnalyticsReporter sharedInstance];
    return [(BWCoreAnalyticsReporter *)v6 sendEvent:v5];
  }
  return result;
}

- (void)_rescheduleCacheExpiryTimer
{
  if (a1)
  {
    id v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
    if ([*(id *)(a1 + 248) count])
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "firstObject"), "cacheExpiryTime"), 0xFFFFFFFFFFFFFFFFLL, 0);
      uint64_t v3 = *(NSObject **)(a1 + 224);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __64__BWDeferredCaptureContainerManager__rescheduleCacheExpiryTimer__block_invoke;
      handler[3] = &unk_1E5C24430;
      handler[4] = a1;
      dispatch_source_set_event_handler(v3, handler);
      dispatch_resume(*(dispatch_object_t *)(a1 + 224));
    }
    else
    {
      FigDebugAssert3();
    }
    if (*v2 == 1) {
      kdebug_trace();
    }
  }
}

uint64_t __64__BWDeferredCaptureContainerManager__rescheduleCacheExpiryTimer__block_invoke(uint64_t a1)
{
  return -[BWDeferredCaptureContainerManager _handleExpiryTimer](*(void *)(a1 + 32));
}

- (uint64_t)_handleExpiryTimer
{
  uint64_t v1 = a1;
  if (!a1) {
    return v1;
  }
  id v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  dispatch_suspend(*(dispatch_object_t *)(v1 + 224));
  uint64_t v3 = (pthread_rwlock_t *)(v1 + 8);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v1 + 8));
  if (![*(id *)(v1 + 248) count]) {
    goto LABEL_7;
  }
  uint64_t v4 = [*(id *)(v1 + 248) objectAtIndexedSubscript:0];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    [*(id *)(v1 + 240) addObject:v4];
    [*(id *)(v1 + 248) removeObjectAtIndex:0];
    uint64_t v6 = *(NSObject **)(v1 + 264);
    [v5 preflush];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__BWDeferredCaptureContainerManager__flushContainer_container___block_invoke;
    block[3] = &unk_1E5C26F78;
    block[4] = v5;
    block[5] = v1;
    int v9 = 0;
    dispatch_async(v6, block);
    -[BWDeferredCaptureContainerManager _rescheduleCacheExpiryTimer](v1);
LABEL_7:
    uint64_t v1 = 0;
    goto LABEL_8;
  }
  FigDebugAssert3();
  uint64_t v1 = 4294951160;
LABEL_8:
  pthread_rwlock_unlock(v3);
  if (*v2 == 1) {
    kdebug_trace();
  }
  return v1;
}

- (void)_updateCacheEntryForContainer:(int)a3 release:
{
  if (a1)
  {
    if ([*(id *)(a1 + 248) count]) {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 224));
    }
    if (a3)
    {
      if (!-[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:](a1, [a2 captureRequestIdentifier], *(void **)(a1 + 248)))FigDebugAssert3(); {
    }
      }
    else
    {
      id v6 = a2;
      -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:](a1, [a2 captureRequestIdentifier], *(void **)(a1 + 248));
      [a2 setCached:1];
      objc_msgSend(a2, "setCacheExpiryTime:", dispatch_time(0, 1000000000 * *(unsigned int *)(a1 + 220)));
      objc_msgSend(*(id *)(a1 + 248), "insertObject:atIndex:", a2, objc_msgSend(*(id *)(a1 + 248), "indexOfObject:inSortedRange:options:usingComparator:", a2, 0, objc_msgSend(*(id *)(a1 + 248), "count"), 1024, &__block_literal_global_97));
    }
    -[BWDeferredCaptureContainerManager _rescheduleCacheExpiryTimer](a1);
  }
}

uint64_t __75__BWDeferredCaptureContainerManager__updateCacheEntryForContainer_release___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 cacheExpiryTime];
  if (v5 > [a3 cacheExpiryTime]) {
    return 1;
  }
  unint64_t v7 = [a2 cacheExpiryTime];
  if (v7 >= [a3 cacheExpiryTime]) {
    return 0;
  }
  else {
    return -1;
  }
}

- (BOOL)canDefer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(&v5, 0, 512);
  uint64_t v3 = [(NSString *)NSHomeDirectory() fileSystemRepresentation];
  if (!statfs(v3, &v5))
  {
    if (v5.f_bavail * v5.f_bsize > self->_cachedLowDiskThresholdBytes) {
      return 1;
    }
    -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, 4294951160, 0);
  }
  return 0;
}

- (id)createCaptureContainerWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5
{
  int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (a3 && a4)
  {
    char v17 = 0;
    uint64_t v16 = 0;
    statfs v10 = -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 0, &v17, 0, &v16);
    if (!v17)
    {
      uint64_t v11 = v10;
      BOOL v12 = self->_cacheSize == 0;
      v13 = [BWDeferredCaptureContainer alloc];
      v14 = [(BWDeferredCaptureContainer *)v13 initWithApplicationID:v16 captureRequestIdentifier:a4 baseFolderURL:v11 flushBuffersUponCommit:v12 err:a5];
      LODWORD(a4) = 0;
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    a4 = (id)4294951161;
  }
  else
  {
    FigDebugAssert3();
    a4 = (id)4294954516;
  }
  -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, (uint64_t)a4, 0);
  v14 = 0;
  if (a5) {
LABEL_7:
  }
    *a5 = (int)a4;
LABEL_8:
  if (*v9 == 1) {
    kdebug_trace();
  }
  return v14;
}

- (int)addCaptureContainer:(id)a3
{
  statfs v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3)
  {
    [(NSMutableArray *)self->_stagedContainers addObject:a3];
    int v6 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v6 = -12780;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1) {
    kdebug_trace();
  }
  return v6;
}

- (id)lookupCaptureContainer:(id)a3
{
  statfs v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_rdlock(&self->super._lock);
  if (a3)
  {
    if (self) {
      a3 = (id)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a3, self->_stagedContainers, 0);
    }
    else {
      a3 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1) {
    kdebug_trace();
  }
  id v6 = a3;
  return v6;
}

- (int)commitContainer:(id)a3
{
  statfs v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3
    && self
    && (id v6 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a3, self->_stagedContainers, 0)) != 0)
  {
    unint64_t v7 = v6;
    id v8 = v6;
    -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:]((uint64_t)self, (uint64_t)a3, self->_stagedContainers);
    uint64_t v9 = [v7 commit];
    unsigned int v11 = v9;
    if (v9 || ([v7 valid:&v11], (uint64_t v9 = v11) != 0))
    {
      -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, v9, v7);
    }
    else if ([(NSMutableArray *)self->_cachedContainers count] >= (unint64_t)self->_cacheSize)
    {
      [(NSMutableArray *)self->_inflightContainers addObject:v7];
      -[BWDeferredCaptureContainerManager _flushContainer:container:]((uint64_t)self, self->_flushQueue, v7);
    }
    else
    {
      -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v7, 0);
    }
  }
  else
  {
    FigDebugAssert3();
    unint64_t v7 = 0;
    unsigned int v11 = -12780;
  }
  pthread_rwlock_unlock(&self->super._lock);

  if (*v5 == 1) {
    kdebug_trace();
  }
  return v11;
}

- (int)containerWaitForFlush:(id)a3
{
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  if (self
    && (id v6 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a3, self->_inflightContainers, 0)) != 0)
  {
    int v7 = [v6 waitForFlush];
  }
  else
  {
    int v7 = 0;
  }
  pthread_rwlock_unlock(p_lock);
  return v7;
}

- (int)abortContainer:(id)a3 error:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3
    && self
    && (id v8 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a3, self->_stagedContainers, 0)) != 0)
  {
    uint64_t v9 = v8;
    int v10 = [v8 abort];
    if (v10) {
      FigDebugAssert3();
    }
    -[BWDeferredCaptureContainerManager _reportCoreAnalyticsDataWithError:container:]((uint64_t)self, v4, v9);
    uint64_t v11 = [v9 applicationID];
    -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:]((uint64_t)self, (uint64_t)a3, self->_stagedContainers);
    v15.receiver = self;
    v15.super_class = (Class)BWDeferredCaptureContainerManager;
    unsigned int v12 = [(BWDeferredContainerManagerBase *)&v15 deleteContainerForApplicationID:v11 captureRequestIdentifier:a3];
    if ((v12 & 0xFFFFFFFB) != 0) {
      int v13 = v12;
    }
    else {
      int v13 = v10;
    }
  }
  else
  {
    FigDebugAssert3();
    int v13 = -12780;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v7 == 1) {
    kdebug_trace();
  }
  return v13;
}

- (uint64_t)_enumerateManifestsForApplicationID:(void *)a3 manifestArray:(int)a4 deleteInvalidContainers:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v6 = result;
    unsigned int v49 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.applicationID == %@", a2];
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v6 + 8));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v8 = (void *)[*(id *)(v6 + 248) filteredArrayUsingPredicate:v7];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(v8);
          }
          -[BWDeferredContainerManagerBase _insertUniqueManifestIntoTimeSortedArray:manifestArray:](v6, [*(id *)(*((void *)&v45 + 1) + 8 * i) manifest], a3);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v10);
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v13 = (void *)[*(id *)(v6 + 240) filteredArrayUsingPredicate:v7];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          -[BWDeferredContainerManagerBase _insertUniqueManifestIntoTimeSortedArray:manifestArray:](v6, [*(id *)(*((void *)&v41 + 1) + 8 * j) manifest], a3);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v15);
    }
    pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 8));
    v50[0] = @"/var/mobile/Media/Deferred/CaptureContainers";
    v50[1] = a2;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v50, 2));
    v19 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = (id)[v19 enumeratorAtURL:v18 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:5 errorHandler:0];
    uint64_t result = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (result)
    {
      uint64_t v20 = result;
      int v21 = 0;
      int v34 = 0;
      uint64_t v36 = *(void *)v38;
      while (1)
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v38 != v36) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v37 + 1) + 8 * v22);
          v24 = (void *)MEMORY[0x1A6272C70]();
          id v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(v23, "lastPathComponent"));
          if (v25)
          {
            v26 = v25;
            pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 8));
            if (-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:](v6, [v26 UUIDString], *(void **)(v6 + 232), 0)|| -[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:](v6, objc_msgSend(v26, "UUIDString"), *(void **)(v6 + 240), 0))
            {
              pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 8));
              goto LABEL_25;
            }
            pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 8));
            id v27 = +[BWDeferredContainer manifestDictionaryForURL:v23 err:&v49];
            if (!v49)
            {
              -[BWDeferredContainerManagerBase _insertUniqueManifestIntoTimeSortedArray:manifestArray:](v6, (uint64_t)v27, a3);
              goto LABEL_25;
            }
            FigDebugAssert3();
          }
          else
          {
            FigDebugAssert3();
            unsigned int v49 = -16132;
          }
          if (a4)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v50[0] = 0;
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", v23, v50);
            int v28 = v34;
            if (v50[0]) {
              int v28 = v34 + 1;
            }
            int v34 = v28;
          }
          else
          {
            v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
LABEL_25:
          if ((v21 + v22 + 1) >= 0x400)
          {
            v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            goto LABEL_41;
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
        uint64_t v20 = v29;
        v21 += v22;
        if (!v29)
        {
LABEL_41:
          if (v34) {
            return 4294951157;
          }
          else {
            return v49;
          }
        }
      }
    }
  }
  return result;
}

- (id)manifestsForApplicationID:(id)a3 err:(int *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!a3)
  {
    FigDebugAssert3();
    id v8 = 0;
    int v17 = -16134;
    if (!a4) {
      goto LABEL_19;
    }
LABEL_18:
    *a4 = v17;
    goto LABEL_19;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([a3 isEqualToString:0x1EFA44100] & 1) == 0
    && ![a3 isEqualToString:0x1EFA55820])
  {
    int v17 = -[BWDeferredCaptureContainerManager _enumerateManifestsForApplicationID:manifestArray:deleteInvalidContainers:]((uint64_t)self, (uint64_t)a3, v8, 1);
    goto LABEL_17;
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Media/Deferred/CaptureContainers"];
  uint64_t v11 = (void *)[v9 enumeratorAtURL:v10 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:5 errorHandler:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = -[BWDeferredCaptureContainerManager _enumerateManifestsForApplicationID:manifestArray:deleteInvalidContainers:]((uint64_t)self, [*(id *)(*((void *)&v19 + 1) + 8 * i) lastPathComponent], v8, 1);
      }
      int v17 = v16;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
LABEL_17:
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  int v17 = 0;
  if (a4) {
    goto LABEL_18;
  }
LABEL_19:
  if (*v7 == 1) {
    kdebug_trace();
  }
  return v8;
}

- (int)queryContainerStatusForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 status:(int *)a5
{
  id v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  if (!self) {
    goto LABEL_8;
  }
  uint64_t v10 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a4, self->_cachedContainers, 0);
  if (v10)
  {
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v10, 0);
    LODWORD(self) = 0;
    LODWORD(v11) = 1;
    goto LABEL_10;
  }
  uint64_t v12 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a4, self->_inflightContainers, 0);
  uint64_t v11 = v12;
  if (v12)
  {
    id v13 = v12;
    LODWORD(self) = [v11 waitForFlushWithTimeoutInSeconds:7];

LABEL_8:
    LODWORD(v11) = 0;
    goto LABEL_10;
  }
  LODWORD(self) = 0;
LABEL_10:
  pthread_rwlock_unlock(p_lock);
  if (a5) {
    *a5 = (int)v11;
  }
  if (*v8 == 1) {
    kdebug_trace();
  }
  return (int)self;
}

- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  id v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  if (!a3)
  {
    uint64_t v22 = v4;
    int v21 = 0;
LABEL_26:
    FigDebugAssert3();
    goto LABEL_27;
  }
  if (!a4)
  {
    uint64_t v22 = v4;
    int v21 = 0;
    goto LABEL_26;
  }
  if (!self)
  {
LABEL_27:
    LODWORD(v10) = 0;
    goto LABEL_28;
  }
  uint64_t v9 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a4, self->_stagedContainers, 0);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = v9;
    -[BWDeferredCaptureContainerManager _removeContainerForCaptureRequestIdentifier:array:]((uint64_t)self, (uint64_t)a4, self->_stagedContainers);
LABEL_12:
    int v16 = [v10 waitForFlush];

    LODWORD(v10) = 1;
    goto LABEL_13;
  }
  uint64_t v12 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a4, self->_cachedContainers, 0);
  if (v12)
  {
    uint64_t v10 = v12;
    id v13 = v12;
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v10, 1);
    goto LABEL_12;
  }
  uint64_t v14 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a4, self->_inflightContainers, 0);
  uint64_t v10 = v14;
  if (v14)
  {
    id v15 = v14;
    goto LABEL_12;
  }
LABEL_28:
  int v16 = 0;
LABEL_13:
  v23.receiver = self;
  v23.super_class = (Class)BWDeferredCaptureContainerManager;
  unsigned int v17 = -[BWDeferredContainerManagerBase deleteContainerForApplicationID:captureRequestIdentifier:](&v23, sel_deleteContainerForApplicationID_captureRequestIdentifier_, a3, a4, v21, v22);
  if (v17 == 4) {
    int v18 = (int)v10;
  }
  else {
    int v18 = 0;
  }
  if (!v17) {
    int v18 = 1;
  }
  if (v18) {
    int v19 = v16;
  }
  else {
    int v19 = v17;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v8 == 1) {
    kdebug_trace();
  }
  return v19;
}

- (id)copyRemoteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5
{
  id v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  int v15 = 0;
  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);
  if (self
    && (uint64_t v10 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a4, self->_cachedContainers, 0)) != 0)
  {
    id v11 = v10;
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v10, 0);
    uint64_t v12 = (void *)[v11 copyXPCEncoding:&v15];
    if (v12) {
      goto LABEL_6;
    }
    FigDebugAssert3();
    int v14 = -16132;
  }
  else
  {
    FigDebugAssert3();
    uint64_t v12 = 0;
    int v14 = -16134;
  }
  int v15 = v14;
LABEL_6:
  pthread_rwlock_unlock(p_lock);
  if (a5) {
    *a5 = v15;
  }
  if (*v8 == 1) {
    kdebug_trace();
  }
  return v12;
}

- (int)releaseRemoteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_rdlock(&self->super._lock);
  if (self
    && (uint64_t v7 = (void *)-[BWDeferredCaptureContainerManager _containerForCaptureRequestIdentifier:array:index:]((uint64_t)self, (uint64_t)a4, self->_cachedContainers, 0)) != 0)
  {
    -[BWDeferredCaptureContainerManager _updateCacheEntryForContainer:release:]((uint64_t)self, v7, 0);
    int v8 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v8 = -16134;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v6 == 1) {
    kdebug_trace();
  }
  return v8;
}

- (int)addBufferPool:(id)a3
{
  statfs v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (a3)
  {
    uint64_t v6 = -[BWDeferredContainerPixelBufferPoolWrapper initWithVideoFormat:capacity:name:]([BWDeferredContainerPixelBufferPoolWrapper alloc], "initWithVideoFormat:capacity:name:", [a3 videoFormat], objc_msgSend(a3, "capacity") * (self->_cacheSize + 1), objc_msgSend(a3, "name"));
    pthread_rwlock_wrlock(&self->super._lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pools, "setObject:forKeyedSubscript:", v6, [MEMORY[0x1E4F29238] valueWithPointer:a3]);
  }
  else
  {
    FigDebugAssert3();
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (int)removeBufferPool:(id)a3
{
  statfs v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  pthread_rwlock_wrlock(&self->super._lock);
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_pools, "removeObjectForKey:", [MEMORY[0x1E4F29238] valueWithPointer:a3]);
  }
  else {
    FigDebugAssert3();
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (*v5 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (__CVBuffer)newPixelBuffer:(id)a3
{
  id v3 = a3;
  if (a3
    && (p_lock = &self->super._lock,
        pthread_rwlock_rdlock(&self->super._lock),
        v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", [MEMORY[0x1E4F29238] valueWithPointer:v3]), id v6 = v3, pthread_rwlock_unlock(p_lock), v3))
  {
    uint64_t v7 = (__CVBuffer *)-[BWDeferredContainerPixelBufferPoolWrapper newPixelBuffer]((uint64_t)v3);
  }
  else
  {
    FigDebugAssert3();
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)flush:(id)a3 toMinimumCapacity:(unint64_t)a4
{
  if (a3)
  {
    p_lock = &self->super._lock;
    pthread_rwlock_rdlock(&self->super._lock);
    id v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", [MEMORY[0x1E4F29238] valueWithPointer:a3]);
    id v8 = v10;
    pthread_rwlock_unlock(p_lock);
    [v10 flushToMinimumCapacity:a4];
    uint64_t v9 = v10;
  }
  else
  {
    FigDebugAssert3();
    uint64_t v9 = 0;
  }
}

@end