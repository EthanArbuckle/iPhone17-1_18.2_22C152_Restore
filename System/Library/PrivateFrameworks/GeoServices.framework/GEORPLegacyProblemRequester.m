@interface GEORPLegacyProblemRequester
+ (id)sharedRequester;
- (GEORPLegacyProblemRequester)init;
- (void)cancelRequest:(id)a3;
- (void)dealloc;
- (void)startStatusRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6;
- (void)startSubmissionRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6;
@end

@implementation GEORPLegacyProblemRequester

+ (id)sharedRequester
{
  if (qword_1EB29FE18 != -1) {
    dispatch_once(&qword_1EB29FE18, &__block_literal_global_117);
  }
  v2 = (void *)_MergedGlobals_261;

  return v2;
}

void __46__GEORPLegacyProblemRequester_sharedRequester__block_invoke()
{
  v0 = objc_alloc_init(GEORPLegacyProblemRequester);
  v1 = (void *)_MergedGlobals_261;
  _MergedGlobals_261 = (uint64_t)v0;
}

- (GEORPLegacyProblemRequester)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPLegacyProblemRequester;
  v2 = [(GEORPLegacyProblemRequester *)&v7 init];
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
        [(GEORPLegacyProblemRequester *)self cancelRequest:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)GEORPLegacyProblemRequester;
  [(GEORPLegacyProblemRequester *)&v8 dealloc];
}

- (void)startSubmissionRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke;
  v31[3] = &unk_1E53E77C8;
  v31[4] = self;
  id v14 = v10;
  id v32 = v14;
  id v15 = v12;
  id v33 = v15;
  id v16 = v11;
  id v34 = v16;
  v17 = (void *)MEMORY[0x18C120660](v31);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke_2;
  v26 = &unk_1E53E77F0;
  v27 = self;
  id v18 = v14;
  id v28 = v18;
  id v19 = v15;
  id v29 = v19;
  id v20 = v13;
  id v30 = v20;
  v21 = (void *)MEMORY[0x18C120660](&v23);
  v22 = objc_alloc_init(GEORPProblemProvider);
  os_unfair_lock_lock_with_options();
  -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v22, v18, v23, v24, v25, v26, v27);
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  if (v19) {
    (*((void (**)(id, uint64_t))v19 + 2))(v19, 1);
  }
  [(GEORPProblemProvider *)v22 startSubmissionRequest:v18 finished:v17 error:v21];
}

void __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  uint64_t v5 = a1[7];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke_2(void *a1, void *a2)
{
  id v6 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  uint64_t v5 = a1[7];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)startStatusRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke;
  v31[3] = &unk_1E53E7818;
  v31[4] = self;
  id v14 = v10;
  id v32 = v14;
  id v15 = v12;
  id v33 = v15;
  id v16 = v11;
  id v34 = v16;
  v17 = (void *)MEMORY[0x18C120660](v31);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke_2;
  v26 = &unk_1E53E77F0;
  v27 = self;
  id v18 = v14;
  id v28 = v18;
  id v19 = v15;
  id v29 = v19;
  id v20 = v13;
  id v30 = v20;
  v21 = (void *)MEMORY[0x18C120660](&v23);
  v22 = objc_alloc_init(GEORPProblemProvider);
  os_unfair_lock_lock_with_options();
  -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v22, v18, v23, v24, v25, v26, v27);
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  if (v19) {
    (*((void (**)(id, uint64_t))v19 + 2))(v19, 1);
  }
  [(GEORPProblemProvider *)v22 startStatusRequest:v18 finished:v17 error:v21];
}

void __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  uint64_t v5 = a1[7];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke_2(void *a1, void *a2)
{
  id v6 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  uint64_t v5 = a1[7];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
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