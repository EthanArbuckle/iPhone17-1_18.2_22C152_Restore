@interface GEOAddressCorrectionRequester
+ (id)sharedRequester;
- (GEOAddressCorrectionRequester)init;
- (void)cancelRequest:(id)a3;
- (void)dealloc;
- (void)startAddressCorrectionInitRequest:(id)a3 finished:(id)a4 error:(id)a5;
- (void)startAddressCorrectionUpdateRequest:(id)a3 finished:(id)a4 error:(id)a5;
@end

@implementation GEOAddressCorrectionRequester

+ (id)sharedRequester
{
  if (qword_1EB29FED0 != -1) {
    dispatch_once(&qword_1EB29FED0, &__block_literal_global_126);
  }
  v2 = (void *)_MergedGlobals_269;

  return v2;
}

void __48__GEOAddressCorrectionRequester_sharedRequester__block_invoke()
{
  v0 = objc_alloc_init(GEOAddressCorrectionRequester);
  v1 = (void *)_MergedGlobals_269;
  _MergedGlobals_269 = (uint64_t)v0;
}

- (GEOAddressCorrectionRequester)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionRequester;
  v2 = [(GEOAddressCorrectionRequester *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:5];
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMapTable *)v3;

    v2->_pendingRequestsLock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_pendingRequests;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GEOAddressCorrectionRequester *)self cancelRequest:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionRequester;
  [(GEOAddressCorrectionRequester *)&v8 dealloc];
}

- (void)startAddressCorrectionInitRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = objc_alloc_init(GEOVoltaireAddressCorrectionProvider);
  os_unfair_lock_lock_with_options();
  [(NSMapTable *)self->_pendingRequests setObject:v11 forKey:v8];
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke;
  v25[3] = &unk_1E53E83A8;
  v25[4] = self;
  id v12 = v8;
  id v26 = v12;
  id v27 = v9;
  id v13 = v9;
  uint64_t v14 = (void *)MEMORY[0x18C120660](v25);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke_2;
  v21 = &unk_1E53E83D0;
  v22 = self;
  id v23 = v12;
  id v24 = v10;
  id v15 = v10;
  id v16 = v12;
  v17 = (void *)MEMORY[0x18C120660](&v18);
  -[GEOVoltaireAddressCorrectionProvider startInitRequest:finished:error:](v11, "startInitRequest:finished:error:", v16, v14, v17, v18, v19, v20, v21, v22);
}

void __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke(void *a1, void *a2)
{
  id v5 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke_2(void *a1, void *a2)
{
  id v5 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)startAddressCorrectionUpdateRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = objc_alloc_init(GEOVoltaireAddressCorrectionProvider);
  os_unfair_lock_lock_with_options();
  [(NSMapTable *)self->_pendingRequests setObject:v11 forKey:v8];
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke;
  v25[3] = &unk_1E53E83F8;
  v25[4] = self;
  id v12 = v8;
  id v26 = v12;
  id v27 = v9;
  id v13 = v9;
  uint64_t v14 = (void *)MEMORY[0x18C120660](v25);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke_2;
  v21 = &unk_1E53E83D0;
  v22 = self;
  id v23 = v12;
  id v24 = v10;
  id v15 = v10;
  id v16 = v12;
  v17 = (void *)MEMORY[0x18C120660](&v18);
  -[GEOVoltaireAddressCorrectionProvider startUpdateRequest:finished:error:](v11, "startUpdateRequest:finished:error:", v16, v14, v17, v18, v19, v20, v21, v22);
}

void __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke(void *a1, void *a2)
{
  id v5 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke_2(void *a1, void *a2)
{
  id v5 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)cancelRequest:(id)a3
{
  p_pendingRequestsLock = &self->_pendingRequestsLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMapTable *)self->_pendingRequests objectForKey:v5];
  [(NSMapTable *)self->_pendingRequests removeObjectForKey:v5];

  os_unfair_lock_unlock(p_pendingRequestsLock);
  [v6 cancelRequest];
}

- (void).cxx_destruct
{
}

@end