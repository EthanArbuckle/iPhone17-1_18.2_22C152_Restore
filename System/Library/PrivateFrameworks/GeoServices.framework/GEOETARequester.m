@interface GEOETARequester
+ (id)sharedRequester;
- (BOOL)_finishRequest:(id)a3;
- (BOOL)_finishSimpleRequest:(id)a3;
- (GEOETARequester)init;
- (void)cancelRequest:(id)a3;
- (void)cancelSimpleETARequest:(id)a3;
- (void)dealloc;
- (void)startRequest:(id)a3 connectionProperties:(id)a4 auditToken:(id)a5 throttleToken:(id)a6 callbackQueue:(id)a7 willSendRequest:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11;
- (void)startSimpleETARequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 callbackQueue:(id)a6 finished:(id)a7 networkActivity:(id)a8 error:(id)a9;
- (void)startSimpleETARequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 traits:(id)a6 callbackQueue:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10;
@end

@implementation GEOETARequester

void __34__GEOETARequester_sharedRequester__block_invoke()
{
  v0 = objc_alloc_init(GEOETARequester);
  v1 = (void *)_MergedGlobals_243;
  _MergedGlobals_243 = (uint64_t)v0;
}

- (GEOETARequester)init
{
  v11.receiver = self;
  v11.super_class = (Class)GEOETARequester;
  v2 = [(GEOETARequester *)&v11 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:5];
    pendingSimpleRequests = v2->_pendingSimpleRequests;
    v2->_pendingSimpleRequests = (NSHashTable *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:5];
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMapTable *)v7;

    v9 = v2;
  }

  return v2;
}

uint64_t __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

+ (id)sharedRequester
{
  if (qword_1EB29FC38 != -1) {
    dispatch_once(&qword_1EB29FC38, &__block_literal_global_94);
  }
  v2 = (void *)_MergedGlobals_243;

  return v2;
}

- (void)startSimpleETARequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 callbackQueue:(id)a6 finished:(id)a7 networkActivity:(id)a8 error:(id)a9
{
}

- (void)startSimpleETARequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 traits:(id)a6 callbackQueue:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10
{
  id v16 = a3;
  id v17 = a6;
  v33 = a7;
  id v32 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a5;
  id v21 = a4;
  v22 = +[GEOPlatform sharedPlatform];
  v23 = [v22 clientCapabilities];
  [v16 setClientCapabilities:v23];

  v24 = [v16 clientCapabilities];
  [v24 updateWithETARequest:v16];

  GEOETARequestRemoveFieldsForSendingRequest(v16);
  uint64_t v44 = MEMORY[0x1E4F143A8];
  uint64_t v45 = 3221225472;
  v46 = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke;
  v47 = &unk_1E53D8998;
  v48 = self;
  id v25 = v16;
  id v49 = v25;
  geo_isolate_sync_data();
  if (v17)
  {
    id v26 = v17;
  }
  else
  {
    id v17 = 0;
    v27 = +[GEOMapService sharedService];
    id v26 = [v27 defaultTraits];
  }
  v28 = [(GEOXPCRequest *)[GEOETARequestSimple alloc] initWithMessage:@"ETA.startSimpleETARequest" traits:v26 auditToken:v21 throttleToken:v20];

  if (v28)
  {
    if (v18)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_3;
      block[3] = &unk_1E53DA028;
      id v41 = v18;
      dispatch_async(v33, block);
    }
    [(GEOETARequestSimple *)v28 setRequest:v25];
    global_workloop = (void *)geo_get_global_workloop();
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_4;
    v34[3] = &unk_1E53E4668;
    v34[4] = self;
    id v35 = v25;
    v36 = v33;
    id v37 = v18;
    v30 = v32;
    id v38 = v32;
    id v39 = v19;
    [(GEOXPCRequest *)v28 send:0 withReply:global_workloop handler:v34];

    v31 = v35;
    goto LABEL_10;
  }
  v30 = v32;
  if (v19)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_2;
    v42[3] = &unk_1E53DA028;
    id v43 = v19;
    dispatch_async(v33, v42);
    v31 = v43;
LABEL_10:
  }
}

uint64_t __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  if (a1[4])
  {
    uint64_t result = a1[7];
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = a1[8];
    if (!result) {
      return result;
    }
  }
  v4 = *(uint64_t (**)(void))(result + 16);

  return v4();
}

void __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _finishSimpleRequest:*(void *)(a1 + 40)])
  {
    uint64_t v7 = [v5 response];
    v8 = (void *)v7;
    if (v6 && !v7)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"No ETA response" underlyingError:v6];

      id v6 = (id)v9;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_5;
    block[3] = &unk_1E53E4640;
    v10 = *(NSObject **)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v13 = v8;
    id v16 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 72);
    id v6 = v6;
    id v14 = v6;
    id v11 = v8;
    dispatch_async(v10, block);
  }
}

- (BOOL)_finishSimpleRequest:(id)a3
{
  id v4 = a3;
  uint64_t v7 = self->_isolater;
  _geo_isolate_lock_data();
  BOOL v5 = [(NSHashTable *)self->_pendingSimpleRequests containsObject:v4];
  if (v5) {
    [(NSHashTable *)self->_pendingSimpleRequests removeObject:v4];
  }
  _geo_isolate_unlock();

  return v5;
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
        [(GEOETARequester *)self cancelRequest:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)GEOETARequester;
  [(GEOETARequester *)&v8 dealloc];
}

- (void)startRequest:(id)a3 connectionProperties:(id)a4 auditToken:(id)a5 throttleToken:(id)a6 callbackQueue:(id)a7 willSendRequest:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v49 = a5;
  id v48 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  if (v19)
  {
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke;
    v71[3] = &unk_1E53E4578;
    id v72 = v18;
    id v73 = v19;
    v47 = (void *)MEMORY[0x18C120660](v71);

    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    v47 = 0;
    if (v20)
    {
LABEL_3:
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_3;
      v68[3] = &unk_1E53E45A0;
      id v69 = v18;
      id v70 = v20;
      v46 = (void *)MEMORY[0x18C120660](v68);

      if (v22) {
        goto LABEL_4;
      }
LABEL_8:
      v23 = 0;
      if (v21) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  v46 = 0;
  if (!v22) {
    goto LABEL_8;
  }
LABEL_4:
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_5;
  v65[3] = &unk_1E53D8C88;
  id v66 = v18;
  id v67 = v22;
  v23 = (void (**)(void, void))MEMORY[0x18C120660](v65);

  if (v21)
  {
LABEL_5:
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_7;
    v62[3] = &unk_1E53DA960;
    id v63 = v18;
    id v64 = v21;
    uint64_t v45 = (void *)MEMORY[0x18C120660](v62);

    goto LABEL_10;
  }
LABEL_9:
  uint64_t v45 = 0;
LABEL_10:
  if (![v16 hasXpcUuid])
  {
    id v42 = v22;
    id v43 = v19;
    id v25 = [MEMORY[0x1E4F29128] UUID];
    id v26 = [v25 UUIDString];
    [v16 setXpcUuid:v26];

    [v16 clearSensitiveFields:0];
    v27 = +[_GEOETARemoteProvider provderWithWillSendRequest:v47 finished:v46 networkActivity:v45 error:v23];
    uint64_t v55 = MEMORY[0x1E4F143A8];
    uint64_t v56 = 3221225472;
    v57 = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_9;
    v58 = &unk_1E53D99F0;
    v59 = self;
    id v24 = v27;
    id v60 = v24;
    id v28 = v16;
    id v61 = v28;
    geo_isolate_sync_data();
    v29 = +[GEOMapService sharedService];
    v30 = [v29 defaultTraits];

    v31 = [(GEOXPCRequest *)[GEOETARequestUpdateable alloc] initWithMessage:@"ETA.startETARequest" traits:v30 auditToken:v49 throttleToken:v48];
    id v32 = v31;
    if (v31)
    {
      id v39 = v21;
      id v40 = v20;
      [(GEOETARequestUpdateable *)v31 setRequest:v28];
      [(GEOETARequestUpdateable *)v32 setConnectionProperties:v17];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_10;
      v53[3] = &unk_1E53E1380;
      v33 = v24;
      v54 = v33;
      v34 = +[GEOXPCConnection createServerConnectionFor:4 debugIdentifier:@"com.apple.geo.eta.start" eventHandler:v53];
      -[_GEOAnchorPointListElement setAnchorPoint:]((uint64_t)v33, v34);

      id v41 = v17;
      if (v33) {
        id v35 = (void *)v33[1];
      }
      else {
        id v35 = 0;
      }
      id v36 = v35;
      global_workloop = (void *)geo_get_global_workloop();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_12;
      v50[3] = &unk_1E53E4618;
      v50[4] = self;
      id v51 = v28;
      v52 = v33;
      [(GEOXPCRequest *)v32 send:v36 withReply:global_workloop handler:v50];

      id v38 = v54;
      id v20 = v40;
      id v17 = v41;
      id v21 = v39;
    }
    else
    {
      if (!v23)
      {
LABEL_20:

        id v22 = v42;
        id v19 = v43;
        goto LABEL_21;
      }
      id v38 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Unable to create client request"];
      ((void (**)(void, void *))v23)[2](v23, v38);
    }

    goto LABEL_20;
  }
  if (v23)
  {
    id v24 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Request already has xpc uuid"];
    ((void (**)(void, id))v23)[2](v23, v24);
LABEL_21:
  }
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_2;
  v6[3] = &unk_1E53E4550;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_4;
  v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_6;
  v7[3] = &unk_1E53D7C50;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_7(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_8;
  v4[3] = &unk_1E53E45C8;
  id v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

uint64_t __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_9(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v3, "message");
    if (string && !strcmp(string, "ETA.willSendETARequest"))
    {
      char v6 = (objc_class *)objc_opt_class();
      id v7 = GEODecodeModernXPCMessage(v3, v6, 0);
      id v8 = [(GEOXPCReply *)[GEOETAUpdateableWillSendReply alloc] initWithRequest:v7];
      id v9 = v8;
      long long v10 = *(void **)(a1 + 32);
      if (v10 && (uint64_t v11 = v10[2]) != 0)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_11;
        v12[3] = &unk_1E53E45F0;
        id v13 = v10;
        uint64_t v14 = v9;
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
      }
      else
      {
        [(GEOXPCReply *)v8 send];
      }
    }
  }
  else if (v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520])
  {
    -[_GEOAnchorPointListElement setAnchorPoint:](*(void *)(a1 + 32), 0);
  }
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(void *)(v4 + 8))
  {
    id v5 = v3;
    [v3 clearSensitiveFields:0];
    [*(id *)(a1 + 40) setUpdatedRequest:v5];
    [*(id *)(a1 + 40) send];
    id v3 = v5;
  }
}

void __139__GEOETARequester_startRequest_connectionProperties_auditToken_throttleToken_callbackQueue_willSendRequest_finished_networkActivity_error___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  uint64_t v5 = a3;
  if ([*(id *)(a1 + 32) _finishRequest:*(void *)(a1 + 40)])
  {
    uint64_t v6 = [v20 response];
    if (!(v5 | v6))
    {
      uint64_t v5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
    }
    id v7 = *(void **)(a1 + 48);
    if (v7)
    {
      uint64_t v8 = v7[4];
      if (v8)
      {
        (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
        id v7 = *(void **)(a1 + 48);
      }
    }
    if (v6)
    {
      if (v7)
      {
        uint64_t v9 = v7[3];
        if (v9) {
          (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v6);
        }
      }
    }
    else if (v7 && v7[5])
    {
      long long v10 = [v20 errorInfo];
      if (v10)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
        long long v12 = [(id)v5 userInfo];
        id v13 = [v11 dictionaryWithDictionary:v12];

        uint64_t v14 = +[GEOETATrafficUpdateErrorInfo key];
        [v13 setObject:v10 forKeyedSubscript:v14];

        id v15 = (void *)MEMORY[0x1E4F28C58];
        id v16 = [(id)v5 domain];
        uint64_t v17 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, objc_msgSend((id)v5, "code"), v13);

        uint64_t v5 = v17;
      }
      uint64_t v18 = *(void *)(a1 + 48);
      if (v18) {
        uint64_t v19 = *(void *)(v18 + 40);
      }
      else {
        uint64_t v19 = 0;
      }
      (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v5);
    }
  }
  -[_GEOAnchorPointListElement setAnchorPoint:](*(void *)(a1 + 48), 0);
}

- (void)cancelRequest:(id)a3
{
  id v3 = a3;
  if ([v3 hasXpcUuid])
  {
    *(void *)buf = 0;
    uint64_t v9 = buf;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__46;
    long long v12 = __Block_byref_object_dispose__46;
    id v13 = 0;
    id v7 = v3;
    geo_isolate_sync_data();
    uint64_t v4 = [(GEOXPCRequest *)[GEOETARequestUpdateable alloc] initWithMessage:@"ETA.cancelETARequest" traits:0 auditToken:0 throttleToken:0];
    [(GEOETARequestUpdateable *)v4 setRequest:v7];
    uint64_t v5 = (void *)*((void *)v9 + 5);
    if (v5) {
      uint64_t v5 = (void *)v5[1];
    }
    uint64_t v6 = v5;
    [(GEOXPCRequest *)v4 send:v6];

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: request.hasXpcUuid", buf, 2u);
  }
}

void __33__GEOETARequester_cancelRequest___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = *(void **)(a1[4] + 24);
    [v6 removeObjectForKey:v5];
  }
}

void __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Unable to create client request"];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __118__GEOETARequester_startSimpleETARequest_auditToken_throttleToken_traits_callbackQueue_finished_networkActivity_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelSimpleETARequest:(id)a3
{
  id v5 = a3;
  if (-[GEOETARequester _finishSimpleRequest:](self, "_finishSimpleRequest:"))
  {
    uint64_t v4 = [(GEOXPCRequest *)[GEOETARequestSimple alloc] initWithMessage:@"ETA.cancelSimpleETARequest" traits:0 auditToken:0 throttleToken:0];
    [(GEOETARequestSimple *)v4 setRequest:v5];
    [(GEOXPCRequest *)v4 send:0];
  }
}

- (BOOL)_finishRequest:(id)a3
{
  id v4 = a3;
  id v7 = self->_isolater;
  _geo_isolate_lock_data();
  id v5 = [(NSMapTable *)self->_pendingRequests objectForKey:v4];

  if (v5) {
    [(NSMapTable *)self->_pendingRequests removeObjectForKey:v4];
  }
  _geo_isolate_unlock();

  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingSimpleRequests, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end