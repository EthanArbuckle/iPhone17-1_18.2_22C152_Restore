@interface GEODirectionsRequesterRemoteProxy
- (GEODirectionsRequesterRemoteProxy)init;
- (id)_takeConnectionForRequest:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 requestPriority:(id)a7 callbackQueue:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11;
@end

@implementation GEODirectionsRequesterRemoteProxy

- (GEODirectionsRequesterRemoteProxy)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEODirectionsRequesterRemoteProxy;
  v2 = [(GEODirectionsRequesterRemoteProxy *)&v9 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:5];
    pendingRequestConnections = v2->_pendingRequestConnections;
    v2->_pendingRequestConnections = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 requestPriority:(id)a7 callbackQueue:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11
{
  BOOL v31 = a6;
  id v16 = a3;
  id v30 = a9;
  id v17 = a10;
  id v18 = a11;
  id v32 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  [v16 clearSensitiveFields:0];
  v22 = +[GEOXPCConnection createServerConnectionFor:3 debugIdentifier:@"Directions.start" eventHandler:0];
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  v40 = __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke;
  v41 = &unk_1E53D99F0;
  v42 = self;
  id v43 = v22;
  id v44 = v16;
  id v23 = v22;
  geo_isolate_sync_data();
  v24 = [(GEOXPCRequest *)[GEOXPCDirectionsRequest alloc] initWithMessage:@"directions.start" traits:v21 auditToken:v20 throttleToken:0];

  [(GEOXPCDirectionsRequest *)v24 setDirectionsRequest:v44];
  uint64_t v25 = [v19 intValue];

  [(GEOXPCDirectionsRequest *)v24 setPriority:v25];
  [(GEOXPCDirectionsRequest *)v24 setUseBackgroundURL:v31];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke_2;
  v33[3] = &unk_1E53E0C90;
  v33[4] = self;
  id v34 = v44;
  id v35 = v17;
  id v36 = v30;
  id v37 = v18;
  id v26 = v18;
  id v27 = v30;
  id v28 = v17;
  id v29 = v44;
  [(GEOXPCRequest *)v24 send:v23 withReply:v32 handler:v33];

  +[GEODirectionsAnalyticsReporter reportDirectionsAnalyticsForRequest:]((uint64_t)GEODirectionsAnalyticsReporter, v29);
}

uint64_t __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

void __146__GEODirectionsRequesterRemoteProxy_startRequest_traits_auditToken_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) _takeConnectionForRequest:*(void *)(a1 + 40)];
  if (!v6) {
    goto LABEL_15;
  }
  v7 = [v14 directionsResponse];
  v8 = [v14 directionsError];
  if (v5)
  {
    id v9 = v5;
  }
  else
  {
    if (v7)
    {
      v10 = 0;
      goto LABEL_7;
    }
    id v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 userInfo:0];
  }
  v10 = v9;
LABEL_7:
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
  if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12) {
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v7);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    if (v13) {
      (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v10, v8);
    }
  }
  [v6 close];

LABEL_15:
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsRequesterRemoteProxy *)self _takeConnectionForRequest:v4];
  if (v5)
  {
    v6 = [(GEOXPCRequest *)[GEOXPCDirectionsRequest alloc] initWithMessage:@"directions.cancel" traits:0 auditToken:0 throttleToken:0];
    [(GEOXPCDirectionsRequest *)v6 setDirectionsRequest:v4];
    global_queue = (void *)geo_get_global_queue();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__GEODirectionsRequesterRemoteProxy_cancelRequest___block_invoke;
    v8[3] = &unk_1E53E0CB8;
    id v9 = v5;
    [(GEOXPCRequest *)v6 send:v9 withReply:global_queue handler:v8];
  }
}

uint64_t __51__GEODirectionsRequesterRemoteProxy_cancelRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

- (id)_takeConnectionForRequest:(id)a3
{
  id v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock_data();
  id v5 = [(NSMapTable *)self->_pendingRequestConnections objectForKey:v4];
  if (v5) {
    [(NSMapTable *)self->_pendingRequestConnections removeObjectForKey:v4];
  }
  _geo_isolate_unlock();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestConnections, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end