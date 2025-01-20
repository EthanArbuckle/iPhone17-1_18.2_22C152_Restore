@interface CKDPublicIdentityLookupService
- (CKDContainer)container;
- (CKDIdentityCache)cache;
- (CKDPublicIdentityLookupService)initWithContainer:(id)a3;
- (void)configureRequest:(id)a3;
- (void)removeCacheForLookupInfos:(id)a3;
- (void)scheduleRequest:(id)a3;
- (void)setCache:(id)a3;
@end

@implementation CKDPublicIdentityLookupService

- (CKDPublicIdentityLookupService)initWithContainer:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDPublicIdentityLookupService;
  v5 = [(CKDPublicIdentityLookupService *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_container, v4);
    uint64_t v9 = objc_msgSend_publicIdentitiesDiskCache(v4, v7, v8);
    cache = v6->_cache;
    v6->_cache = (CKDIdentityCache *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cloudkit.PILSQueue", v11);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;
  }
  return v6;
}

- (void)scheduleRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Starting lookup for request %@", buf, 0xCu);
  }
  if (objc_msgSend_isCancelled(v4, v6, v7))
  {
    objc_msgSend_finishWithError_(v4, v8, 0);
  }
  else
  {
    objc_msgSend_configureRequest_(self, v8, (uint64_t)v4);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F6E2D0;
    block[3] = &unk_1E64F05C8;
    id v11 = v4;
    dispatch_async(queue, block);
  }
}

- (void)configureRequest:(id)a3
{
  id v25 = a3;
  uint64_t v7 = objc_msgSend_container(self, v5, v6);
  v10 = objc_msgSend_serverConfig(v7, v8, v9);
  id v13 = objc_msgSend_containerID(v7, v11, v12);
  uint64_t v15 = objc_msgSend_maxBatchSize_(v10, v14, (uint64_t)v13);

  if (v15
    || (objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v16, v17),
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = objc_msgSend_maxBatchSize(v18, v19, v20),
        v18,
        v15))
  {
    objc_msgSend_setFetchBatchSize_(v25, v16, v15);
  }
  else
  {
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v21);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CKDPublicIdentityLookupService.m", 61, @"Batch size is zero, we won't make any progress");

    objc_msgSend_setFetchBatchSize_(v25, v24, 0);
  }
}

- (void)removeCacheForLookupInfos:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        cache = self->_cache;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
        objc_msgSend_removeCachedValueForLookupInfo_container_(cache, v13, v10, WeakRetained);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v14, (uint64_t)&v15, v19, 16);
    }
    while (v7);
  }
}

- (CKDContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (CKDContainer *)WeakRetained;
}

- (CKDIdentityCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end