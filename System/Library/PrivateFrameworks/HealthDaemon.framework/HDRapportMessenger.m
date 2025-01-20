@interface HDRapportMessenger
- (id)initForCompanionDevice;
- (id)newRapportClient;
- (void)_handleIncomingRequest:(id)a3 responseHandler:(id)a4;
- (void)addObserver:(id)a3 forSchemaIdentifier:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forSchemaIdentifier:(int64_t)a4;
- (void)sendRequest:(id)a3 data:(id)a4 completion:(id)a5;
@end

@implementation HDRapportMessenger

- (id)initForCompanionDevice
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HDRapportMessenger;
  v2 = [(HDRapportMessenger *)&v17 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(HDRapportMessenger *)v2 newRapportClient];
    rapportClient = v3->_rapportClient;
    v3->_rapportClient = (RPCompanionLinkClient *)v4;

    [(RPCompanionLinkClient *)v3->_rapportClient setServiceType:@"com.apple.healthd.rapport"];
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersBySchemaIdentifier = v3->_observersBySchemaIdentifier;
    v3->_observersBySchemaIdentifier = v6;

    v3->_lock._os_unfair_lock_opaque = 0;
    v8 = NSStringForRapportSchemaIdentifier(0);
    objc_initWeak(&location, v3);
    _HKInitializeLogging();
    v9 = (id)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      __int16 v20 = 2114;
      v21 = v8;
      id v11 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Registering Rapport requestID %{public}@", buf, 0x16u);
    }
    v12 = v3->_rapportClient;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__HDRapportMessenger_initForCompanionDevice__block_invoke;
    v14[3] = &unk_1E630EA68;
    objc_copyWeak(&v15, &location);
    [(RPCompanionLinkClient *)v12 registerRequestID:v8 options:0 handler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __44__HDRapportMessenger_initForCompanionDevice__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleIncomingRequest:v7 responseHandler:v6];
}

- (id)newRapportClient
{
  return objc_alloc_init(MEMORY[0x1E4F946E0]);
}

- (void)sendRequest:(id)a3 data:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v26 = a5;
  v10 = [MEMORY[0x1E4F29128] UUID];
  id v11 = [v10 UUIDString];
  v12 = [v11 substringToIndex:4];

  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    id v15 = objc_opt_class();
    id v16 = v15;
    *(_DWORD *)buf = 138544130;
    v32 = v15;
    __int16 v33 = 2114;
    v34 = v12;
    __int16 v35 = 2114;
    id v36 = v8;
    __int16 v37 = 2048;
    uint64_t v38 = [v9 length];
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending request [%{public}@] %{public}@ (%lu bytes)", buf, 0x2Au);
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "schemaIdentifier"));
  [v17 setObject:v18 forKeyedSubscript:@"schemaId"];

  v19 = [v8 name];
  [v17 setObject:v19 forKeyedSubscript:@"requestName"];

  [v17 setObject:v12 forKeyedSubscript:@"requestId"];
  [v17 setObject:v9 forKeyedSubscript:@"data"];
  __int16 v20 = NSStringForRapportSchemaIdentifier([v8 schemaIdentifier]);
  rapportClient = self->_rapportClient;
  uint64_t v22 = (void *)[v17 copy];
  uint64_t v23 = *MEMORY[0x1E4F94748];
  uint64_t v29 = *MEMORY[0x1E4F94780];
  uint64_t v30 = MEMORY[0x1E4F1CC38];
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__HDRapportMessenger_sendRequest_data_completion___block_invoke;
  v27[3] = &unk_1E630EA90;
  v27[4] = self;
  id v28 = v26;
  id v25 = v26;
  [(RPCompanionLinkClient *)rapportClient sendRequestID:v20 request:v22 destinationID:v23 options:v24 responseHandler:v27];
}

void __50__HDRapportMessenger_sendRequest_data_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"errorDomain"];
  id v9 = [v6 objectForKeyedSubscript:@"errorCode"];
  uint64_t v10 = [v9 integerValue];

  id v11 = [v6 objectForKeyedSubscript:@"errorDescription"];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"requestName"];
  v13 = (void *)v12;
  v14 = @"[missing name]";
  if (v12) {
    v14 = (__CFString *)v12;
  }
  id v15 = v14;

  uint64_t v16 = [v6 objectForKeyedSubscript:@"requestId"];
  id v17 = (void *)v16;
  v18 = &stru_1F1728D60;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  v19 = v18;

  id v20 = v7;
  v21 = v20;
  if (v8)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    if (v11)
    {
      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35[0] = v11;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    }
    else
    {
      uint64_t v23 = 0;
    }
    v21 = [v22 errorWithDomain:v8 code:v10 userInfo:v23];

    if (v11) {
  }
    }
  if (v21)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = v24;
      *(_DWORD *)v31 = 138544130;
      *(void *)&v31[4] = objc_opt_class();
      *(_WORD *)&v31[12] = 2114;
      *(void *)&v31[14] = v19;
      *(_WORD *)&v31[22] = 2114;
      v32 = v15;
      LOWORD(v33) = 2114;
      *(void *)((char *)&v33 + 2) = v21;
      id v30 = *(id *)&v31[4];
      _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Request %{public}@:%{public}@ failed with error: %{public}@", v31, 0x2Au);
    }
  }
  id v25 = objc_msgSend(v21, "domain", *(_OWORD *)v31, *(void *)&v31[16], v32, v33);
  int v26 = [v25 isEqualToString:*MEMORY[0x1E4F94770]];

  if (v26)
  {
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 300, @"Remote device is unreachable", v20);

    v21 = (void *)v27;
  }
  id v28 = [v6 objectForKeyedSubscript:@"data"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addObserver:(id)a3 forSchemaIdentifier:(int64_t)a4
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v6 = NSStringForRapportSchemaIdentifier(a4);
  id v7 = [(NSMutableDictionary *)self->_observersBySchemaIdentifier objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    id v7 = (void *)[v8 initWithName:v6 loggingCategory:*MEMORY[0x1E4F29FA8]];
    [(NSMutableDictionary *)self->_observersBySchemaIdentifier setObject:v7 forKeyedSubscript:v6];
  }
  [v7 registerObserver:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3 forSchemaIdentifier:(int64_t)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  observersBySchemaIdentifier = self->_observersBySchemaIdentifier;
  id v9 = NSStringForRapportSchemaIdentifier(a4);
  uint64_t v10 = [(NSMutableDictionary *)observersBySchemaIdentifier objectForKeyedSubscript:v9];
  [v10 unregisterObserver:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NSMutableDictionary *)self->_observersBySchemaIdentifier allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) unregisterObserver:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleIncomingRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"schemaId"];
  uint64_t v9 = [v8 integerValue];

  uint64_t v10 = [HDRapportRequestIdentifier alloc];
  long long v11 = [v7 objectForKeyedSubscript:@"requestName"];
  long long v12 = [(HDRapportRequestIdentifier *)v10 initWithSchemaIdentifier:v9 name:v11];

  long long v13 = [v7 objectForKeyedSubscript:@"requestId"];
  long long v14 = [v7 objectForKeyedSubscript:@"data"];

  _HKInitializeLogging();
  id v15 = (os_log_t *)MEMORY[0x1E4F29FA8];
  uint64_t v16 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    v18 = objc_opt_class();
    id v19 = v18;
    *(_DWORD *)buf = 138544130;
    id v36 = v18;
    __int16 v37 = 2114;
    uint64_t v38 = v13;
    __int16 v39 = 2114;
    v40 = v12;
    __int16 v41 = 2048;
    uint64_t v42 = [v14 length];
    _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Received request [%{public}@] %{public}@ (%lu bytes)", buf, 0x2Au);
  }
  if (v12)
  {
    os_unfair_lock_lock(&self->_lock);
    observersBySchemaIdentifier = self->_observersBySchemaIdentifier;
    v21 = NSStringForRapportSchemaIdentifier(v9);
    uint64_t v22 = [(NSMutableDictionary *)observersBySchemaIdentifier objectForKeyedSubscript:v21];

    os_unfair_lock_unlock(&self->_lock);
    if ([v22 count])
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke;
      v30[3] = &unk_1E630EAE0;
      v30[4] = self;
      v31 = v12;
      id v32 = v14;
      long long v33 = v13;
      id v34 = v6;
      [v22 notifyObservers:v30];
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v26 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = v26;
        id v28 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v36 = v28;
        __int16 v37 = 2114;
        uint64_t v38 = v12;
        id v29 = v28;
        _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: No observer to handle incoming request %{public}@", buf, 0x16u);
      }
    }
    goto LABEL_10;
  }
  _HKInitializeLogging();
  os_log_t v23 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = v23;
    v24 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v36 = v24;
    id v25 = v24;
    _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Malformed incoming request does not have an identifier", buf, 0xCu);

LABEL_10:
  }
}

void __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke_2;
  v7[3] = &unk_1E630EAB8;
  id v8 = v4;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [a2 rapportMessenger:v5 didReceiveRequest:v8 data:v6 responseHandler:v7];
}

void __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v14 = objc_alloc_init(v5);
  id v8 = [*(id *)(a1 + 32) name];
  [v14 setObject:v8 forKeyedSubscript:@"requestName"];

  [v14 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"requestId"];
  [v14 setObject:v7 forKeyedSubscript:@"data"];

  id v9 = [v6 domain];
  [v14 setObject:v9 forKeyedSubscript:@"errorDomain"];

  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
  [v14 setObject:v10 forKeyedSubscript:@"errorCode"];

  long long v11 = [v6 localizedDescription];

  [v14 setObject:v11 forKeyedSubscript:@"errorDescription"];
  uint64_t v12 = *(void *)(a1 + 48);
  long long v13 = (void *)[v14 copy];
  (*(void (**)(uint64_t, void *, void, void))(v12 + 16))(v12, v13, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersBySchemaIdentifier, 0);

  objc_storeStrong((id *)&self->_rapportClient, 0);
}

@end