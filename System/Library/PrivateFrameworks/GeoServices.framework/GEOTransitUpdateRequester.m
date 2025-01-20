@interface GEOTransitUpdateRequester
+ (id)sharedRequester;
- (BOOL)_finishRequest:(id)a3;
- (GEOTransitUpdateRequester)init;
- (void)cancelTransitRouteUpdateRequest:(id)a3;
- (void)startTransitRouteUpdateRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 queue:(id)a6 networkActivity:(id)a7 completion:(id)a8;
@end

@implementation GEOTransitUpdateRequester

+ (id)sharedRequester
{
  if (qword_1EB2A03A8 != -1) {
    dispatch_once(&qword_1EB2A03A8, &__block_literal_global_174);
  }
  v2 = (void *)_MergedGlobals_312;

  return v2;
}

void __44__GEOTransitUpdateRequester_sharedRequester__block_invoke()
{
  v0 = objc_alloc_init(GEOTransitUpdateRequester);
  v1 = (void *)_MergedGlobals_312;
  _MergedGlobals_312 = (uint64_t)v0;
}

- (GEOTransitUpdateRequester)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEOTransitUpdateRequester;
  v2 = [(GEOTransitUpdateRequester *)&v9 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:5];
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSHashTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)startTransitRouteUpdateRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 queue:(id)a6 networkActivity:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v17)
  {
    v18 = v14;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke;
    v42[3] = &unk_1E53ECA48;
    id v28 = v15;
    id v19 = v15;
    id v43 = v19;
    id v44 = v17;
    id v20 = a5;
    id v21 = a4;
    v22 = (void *)MEMORY[0x18C120660](v42);
    if (v16)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_3;
      v39[3] = &unk_1E53DA960;
      id v40 = v19;
      id v41 = v16;
      v23 = (void *)MEMORY[0x18C120660](v39);
    }
    else
    {
      v23 = 0;
    }
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_5;
    v36 = &unk_1E53D8998;
    v37 = self;
    id v38 = v18;
    geo_isolate_sync_data();
    v24 = [(GEOXPCRequest *)[GEOTransitRouteUpdateRequestSimple alloc] initWithMessage:@"TransitUpdate.startTransitRouteUpdateRequest" traits:0 auditToken:v21 throttleToken:v20];

    id v14 = v18;
    [(GEOTransitRouteUpdateRequestSimple *)v24 setRequest:v38];
    global_workloop = (void *)geo_get_global_workloop();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_6;
    v29[3] = &unk_1E53ECA70;
    v29[4] = self;
    id v30 = v38;
    id v31 = v23;
    id v32 = v22;
    id v26 = v22;
    id v27 = v23;
    [(GEOXPCRequest *)v24 send:0 withReply:global_workloop handler:v29];

    id v15 = v28;
  }
}

void __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_2;
  block[3] = &unk_1E53D95B8;
  v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_3(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_4;
  v4[3] = &unk_1E53E45C8;
  uint64_t v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

void __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) _finishRequest:*(void *)(a1 + 40)])
  {
    char v6 = [v10 response];
    id v7 = v5;
    if (v7 && !v6)
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];

      id v7 = (id)v8;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)cancelTransitRouteUpdateRequest:(id)a3
{
  id v5 = a3;
  if (-[GEOTransitUpdateRequester _finishRequest:](self, "_finishRequest:"))
  {
    v4 = [(GEOXPCRequest *)[GEOTransitRouteUpdateRequestSimple alloc] initWithMessage:@"TransitUpdate.cancelTransitRouteUpdateRequest" traits:0 auditToken:0 throttleToken:0];
    [(GEOTransitRouteUpdateRequestSimple *)v4 setRequest:v5];
    [(GEOXPCRequest *)v4 send:0];
  }
}

- (BOOL)_finishRequest:(id)a3
{
  id v4 = a3;
  id v7 = self->_isolater;
  _geo_isolate_lock_data();
  BOOL v5 = [(NSHashTable *)self->_pendingRequests containsObject:v4];
  if (v5) {
    [(NSHashTable *)self->_pendingRequests removeObject:v4];
  }
  _geo_isolate_unlock();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end