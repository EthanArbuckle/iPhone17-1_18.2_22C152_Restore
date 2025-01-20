@interface GEOImageServiceRequester
+ (id)sharedRequester;
- (BOOL)_finishRequest:(id)a3;
- (GEOImageServiceRequester)init;
- (unint64_t)calculateFreeableSize;
- (unint64_t)shrinkDiskCacheToSize:(unint64_t)a3;
- (void)cancelImageServiceRequest:(id)a3;
- (void)startImageServiceRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 queue:(id)a6 finished:(id)a7 networkActivity:(id)a8 error:(id)a9;
@end

@implementation GEOImageServiceRequester

+ (id)sharedRequester
{
  if (qword_1EB2A0690 != -1) {
    dispatch_once(&qword_1EB2A0690, &__block_literal_global_188);
  }
  v2 = (void *)_MergedGlobals_326;

  return v2;
}

void __43__GEOImageServiceRequester_sharedRequester__block_invoke()
{
  v0 = objc_alloc_init(GEOImageServiceRequester);
  v1 = (void *)_MergedGlobals_326;
  _MergedGlobals_326 = (uint64_t)v0;
}

- (GEOImageServiceRequester)init
{
  v11.receiver = self;
  v11.super_class = (Class)GEOImageServiceRequester;
  v2 = [(GEOImageServiceRequester *)&v11 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:5];
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSHashTable *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:5];
    requestToIdentifier = v2->_requestToIdentifier;
    v2->_requestToIdentifier = (NSMapTable *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)startImageServiceRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 queue:(id)a6 finished:(id)a7 networkActivity:(id)a8 error:(id)a9
{
  id v15 = a3;
  id v38 = a4;
  id v37 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v20 = v19;
  if (v17)
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke;
    v57[3] = &unk_1E53EDBD0;
    id v58 = v16;
    id v59 = v17;
    v34 = (void *)MEMORY[0x18C120660](v57);

    if (v20)
    {
LABEL_3:
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_3;
      v54[3] = &unk_1E53D8C88;
      id v55 = v16;
      id v56 = v20;
      v21 = (void *)MEMORY[0x18C120660](v54);

      goto LABEL_6;
    }
  }
  else
  {
    v34 = 0;
    if (v19) {
      goto LABEL_3;
    }
  }
  v21 = 0;
LABEL_6:
  v35 = v20;
  v36 = v17;
  v33 = v18;
  if (v18)
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_5;
    v51[3] = &unk_1E53DA960;
    id v52 = v16;
    id v53 = v18;
    id v18 = (id)MEMORY[0x18C120660](v51);
  }
  v22 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v16);
  uint64_t v44 = MEMORY[0x1E4F143A8];
  uint64_t v45 = 3221225472;
  v46 = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_7;
  v47 = &unk_1E53D99F0;
  v48 = self;
  id v49 = v15;
  id v50 = v22;
  id v23 = v22;
  geo_isolate_sync_data();
  v24 = +[GEOMapService sharedService];
  v25 = [v24 defaultTraits];

  v26 = [(GEOXPCRequest *)[GEOImageServiceRequestSimple alloc] initWithMessage:@"ImageService.startImageServiceRequest" traits:v25 auditToken:v38 throttleToken:v37];
  [(GEOImageServiceRequestSimple *)v26 setRequest:v49];
  [(GEOImageServiceRequestSimple *)v26 setIdentifier:v23];
  global_workloop = (void *)geo_get_global_workloop();
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_11;
  v39[3] = &unk_1E53EDBF8;
  v39[4] = self;
  id v40 = v49;
  id v41 = v18;
  id v42 = v34;
  id v43 = v21;
  id v28 = v21;
  id v29 = v34;
  id v30 = v18;
  id v31 = v49;
  [(GEOXPCRequest *)v26 send:0 withReply:global_workloop handler:v39];
}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_2;
  v7[3] = &unk_1E53D7C50;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_4;
  v7[3] = &unk_1E53D7C50;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_5(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_6;
  v4[3] = &unk_1E53E45C8;
  id v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_7(void *a1)
{
  if ([*(id *)(a1[4] + 16) containsObject:a1[5]])
  {
    if (qword_1EB2A06A0 != -1) {
      dispatch_once(&qword_1EB2A06A0, &__block_literal_global_47_1);
    }
    v2 = qword_1EB2A0698;
    if (os_log_type_enabled((os_log_t)qword_1EB2A0698, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_FAULT, "Attempting to start a request which has already been started", v4, 2u);
    }
  }
  [*(id *)(a1[4] + 16) addObject:a1[5]];
  return [*(id *)(a1[4] + 24) setObject:a1[6] forKey:a1[5]];
}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) _finishRequest:*(void *)(a1 + 40)])
  {
    char v6 = [v13 response];
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
    if (v6)
    {
      uint64_t v10 = *(void *)(a1 + 56);
      if (v10)
      {
        objc_super v11 = *(void (**)(void))(v10 + 16);
LABEL_12:
        v11();
      }
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 64);
      if (v12)
      {
        objc_super v11 = *(void (**)(void))(v12 + 16);
        goto LABEL_12;
      }
    }
  }
}

- (void)cancelImageServiceRequest:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__95;
  id v19 = __Block_byref_object_dispose__95;
  id v20 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __54__GEOImageServiceRequester_cancelImageServiceRequest___block_invoke;
  objc_super v11 = &unk_1E53DC248;
  v14 = &v15;
  uint64_t v12 = self;
  id v5 = v4;
  id v13 = v5;
  geo_isolate_sync_data();
  if ([(GEOImageServiceRequester *)self _finishRequest:v5])
  {
    if (v16[5])
    {
      char v6 = [(GEOXPCRequest *)[GEOImageServiceRequestSimple alloc] initWithMessage:@"ImageService.cancelImageServiceRequest" traits:0 auditToken:0 throttleToken:0];
      [(GEOImageServiceRequestSimple *)v6 setRequest:v5];
      [(GEOImageServiceRequestSimple *)v6 setIdentifier:v16[5]];
      [(GEOXPCRequest *)v6 send:0];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: uuid != ((void *)0)", v7, 2u);
    }
  }

  _Block_object_dispose(&v15, 8);
}

void __54__GEOImageServiceRequester_cancelImageServiceRequest___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
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
  [(NSMapTable *)self->_requestToIdentifier removeObjectForKey:v4];
  _geo_isolate_unlock();

  return v5;
}

- (unint64_t)calculateFreeableSize
{
  uint64_t v2 = [(GEOXPCRequest *)[GEOImageServiceCalculateFreeableSizeRequest alloc] initWithMessage:@"ImageService.calculateFreeable" traits:0 auditToken:0 throttleToken:0];
  uint64_t v7 = 0;
  uint64_t v3 = [(GEOXPCRequest *)v2 sendSync:0 error:&v7];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 size];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)shrinkDiskCacheToSize:(unint64_t)a3
{
  id v4 = [(GEOXPCRequest *)[GEOImageServicePurgeCacheToSizeRequest alloc] initWithMessage:@"ImageService.purgeDiskCache" traits:0 auditToken:0 throttleToken:0];
  [(GEOImageServicePurgeCacheToSizeRequest *)v4 setTargetSize:a3];
  uint64_t v9 = 0;
  unint64_t v5 = [(GEOXPCRequest *)v4 sendSync:0 error:&v9];
  char v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 amountDeleted];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

@end