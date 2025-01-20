@interface CAFGroupRequest
- (BOOL)forced;
- (BOOL)performed;
- (CAFCachedDescription)cachedDescription;
- (CAFCachedDescription)cachedFullDescription;
- (CAFCachedDescription)cachedRequestsDescription;
- (CAFCar)car;
- (CAFGroupRequest)initWithCar:(id)a3;
- (NSMutableDictionary)errors;
- (NSMutableDictionary)requests;
- (NSString)description;
- (NSString)fullDescription;
- (NSUUID)uniqueIdentifier;
- (id)_currentDescriptionForFull;
- (id)_currentDescriptionForRequests;
- (id)currentDescriptionForCache:(id)a3;
- (os_unfair_lock_s)lock;
- (unint64_t)count;
- (unint64_t)pendingGroups;
- (void)_addRequest:(id)a3;
- (void)_lockedPerformBlock:(id)a3;
- (void)addCharacteristic:(id)a3;
- (void)addCharacteristics:(id)a3;
- (void)performWithCompletion:(id)a3;
- (void)setCachedDescription:(id)a3;
- (void)setCachedFullDescription:(id)a3;
- (void)setCachedRequestsDescription:(id)a3;
- (void)setForced:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPendingGroups:(unint64_t)a3;
- (void)setPerformed:(BOOL)a3;
@end

@implementation CAFGroupRequest

- (CAFGroupRequest)initWithCar:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CAFGroupRequest;
  v5 = [(CAFGroupRequest *)&v21 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSUUID *)v7;

    objc_storeWeak((id *)&v6->_car, v4);
    uint64_t v9 = objc_opt_new();
    requests = v6->_requests;
    v6->_requests = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    errors = v6->_errors;
    v6->_errors = (NSMutableDictionary *)v11;

    v13 = [[CAFCachedDescription alloc] initWithCacheable:v6];
    cachedDescription = v6->_cachedDescription;
    v6->_cachedDescription = v13;

    v15 = [[CAFCachedDescription alloc] initWithCacheable:v6 lazyRefreshDescription:1];
    cachedRequestsDescription = v6->_cachedRequestsDescription;
    v6->_cachedRequestsDescription = v15;

    v17 = [[CAFCachedDescription alloc] initWithCacheable:v6 lazyRefreshDescription:1];
    cachedFullDescription = v6->_cachedFullDescription;
    v6->_cachedFullDescription = v17;

    v19 = CAFGroupRequestLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CAFGroupRequest initWithCar:]();
    }
  }
  return v6;
}

- (unint64_t)count
{
  v2 = [(CAFGroupRequest *)self requests];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)addCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __37__CAFGroupRequest_addCharacteristic___block_invoke;
  uint64_t v11 = &unk_265263280;
  v12 = self;
  id v13 = v4;
  id v5 = v4;
  [(CAFGroupRequest *)self _lockedPerformBlock:&v8];
  v6 = [(CAFGroupRequest *)self cachedRequestsDescription];
  [v6 setNeedsRefreshDescription];

  uint64_t v7 = [(CAFGroupRequest *)self cachedFullDescription];
  [v7 setNeedsRefreshDescription];
}

uint64_t __37__CAFGroupRequest_addCharacteristic___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestForCharacteristic:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(a1 + 32) _addRequest:v2];
  }
  return MEMORY[0x270F9A758]();
}

- (void)addCharacteristics:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __38__CAFGroupRequest_addCharacteristics___block_invoke;
  uint64_t v11 = &unk_265263280;
  id v12 = v4;
  id v13 = self;
  id v5 = v4;
  [(CAFGroupRequest *)self _lockedPerformBlock:&v8];
  v6 = [(CAFGroupRequest *)self cachedRequestsDescription];
  [v6 setNeedsRefreshDescription];

  uint64_t v7 = [(CAFGroupRequest *)self cachedFullDescription];
  [v7 setNeedsRefreshDescription];
}

void __38__CAFGroupRequest_addCharacteristics___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "requestForCharacteristic:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        if (v7) {
          [*(id *)(a1 + 40) _addRequest:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(CAFGroupRequest *)self performed])
  {
    uint64_t v6 = CAFGroupRequestLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CAFGroupRequest performWithCompletion:](self);
    }

    if (v4)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "CAF_groupRequestAlreadyPerformed");
      v4[2](v4, v7);
    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_21;
  }
  [(CAFGroupRequest *)self setPerformed:1];
  os_unfair_lock_unlock(&self->_lock);
  long long v8 = [(CAFGroupRequest *)self cachedFullDescription];
  [v8 setNeedsRefreshDescription];

  long long v9 = [(CAFGroupRequest *)self requests];
  -[CAFGroupRequest setPendingGroups:](self, "setPendingGroups:", [v9 count]);

  long long v10 = [(CAFGroupRequest *)self requests];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = CAFGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CAFGroupRequest performWithCompletion:](self);
    }

    uint64_t v13 = CARSignpostLogForCategory();
    if (self)
    {
      v14 = CARSignpostLogForCategory();
      os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);

      if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_20:

        v18 = [(CAFGroupRequest *)self requests];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __41__CAFGroupRequest_performWithCompletion___block_invoke;
        v19[3] = &unk_2652644B8;
        v19[4] = self;
        v20 = v4;
        [v18 enumerateKeysAndObjectsUsingBlock:v19];

        goto LABEL_21;
      }
    }
    else
    {
      os_signpost_id_t v15 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_signpost_emit_with_name_impl(&dword_249710000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Perform", "GroupRequest %@", buf, 0xCu);
    }
    goto LABEL_20;
  }
  v16 = CAFGroupRequestLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[CAFGroupRequest performWithCompletion:](self);
  }

  if (v4)
  {
    v17 = objc_msgSend(MEMORY[0x263F087E8], "CAF_groupRequestWithNoCharacteristics");
    v4[2](v4, v17);
  }
LABEL_21:
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CAFGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_2(a1);
  }

  long long v8 = CARSignpostLogForCategory();
  if (v5)
  {
    long long v9 = CARSignpostLogForCategory();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v5);

    if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_9;
    }
  }
  else
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v8))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v29 = v5;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    _os_signpost_emit_with_name_impl(&dword_249710000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Perform", "Request %@ from %@", buf, 0x16u);
  }
LABEL_9:

  id v12 = (id *)(a1 + 32);
  uint64_t v13 = [*(id *)(a1 + 32) groupRequestValueForRequests:v6];
  if (v13)
  {
    v14 = [*(id *)(a1 + 32) car];
    uint64_t v15 = *(void *)(a1 + 32);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __41__CAFGroupRequest_performWithCompletion___block_invoke_26;
    v23[3] = &unk_265264490;
    v16 = v5;
    uint64_t v17 = *(void *)(a1 + 32);
    v24 = v16;
    uint64_t v25 = v17;
    id v26 = v6;
    id v27 = *(id *)(a1 + 40);
    [v14 performGroupedRequest:v15 key:v16 value:v13 withResponse:v23];

    v18 = v24;
  }
  else
  {
    v19 = (void *)MEMORY[0x263F087E8];
    v20 = [v6 valueForKey:@"characteristic"];
    objc_super v21 = objc_msgSend(v19, "CAF_groupRequestNilForCharacteristics:", v20);
    v22 = [*v12 errors];
    [v22 setObject:v21 forKeyedSubscript:v5];

    v18 = CAFGroupRequestLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_1(v12);
    }
  }
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CAFGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 error];
    uint64_t v7 = [v3 values];
    *(_DWORD *)buf = 138412802;
    v48 = v5;
    __int16 v49 = 2112;
    v50 = v6;
    __int16 v51 = 2048;
    uint64_t v52 = [v7 count];
    _os_log_impl(&dword_249710000, v4, OS_LOG_TYPE_DEFAULT, "Perform group request completed key: %@ error=%@ value count: %ld", buf, 0x20u);
  }
  long long v8 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "setPendingGroups:", objc_msgSend(*(id *)(a1 + 40), "pendingGroups") - 1);
  long long v9 = [*(id *)(a1 + 40) cachedFullDescription];
  [v9 setNeedsRefreshDescription];

  os_signpost_id_t v10 = CAFGroupRequestLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v39 = [*(id *)(a1 + 40) description];
    v40 = *(void **)(a1 + 32);
    v41 = [v3 error];
    *(_DWORD *)buf = 138412802;
    v48 = v39;
    __int16 v49 = 2112;
    v50 = v40;
    __int16 v51 = 2112;
    uint64_t v52 = (uint64_t)v41;
    _os_log_debug_impl(&dword_249710000, v10, OS_LOG_TYPE_DEBUG, "%@ completed request %@ error=%@", buf, 0x20u);
  }
  os_signpost_id_t v11 = 0xEEEEB0B5B2B2EEEELL;

  id v12 = CARSignpostLogForCategory();
  os_signpost_id_t v13 = 0xEEEEB0B5B2B2EEEELL;
  if (!*(void *)(a1 + 32)
    || (CARSignpostLogForCategory(),
        v14 = objc_claimAutoreleasedReturnValue(),
        os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v14, *(const void **)(a1 + 32)),
        v14,
        v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_249710000, v12, OS_SIGNPOST_INTERVAL_END, v13, "Perform", (const char *)&unk_2497DFEC6, buf, 2u);
    }
  }

  [*(id *)(a1 + 40) completedRequests:*(void *)(a1 + 48) withResponse:v3];
  uint64_t v15 = [v3 error];

  if (v15)
  {
    v16 = [v3 error];
    uint64_t v17 = [*(id *)(a1 + 40) errors];
    [v17 setObject:v16 forKeyedSubscript:*(void *)(a1 + 32)];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v42 + 1) + 8 * v22);
          v24 = objc_msgSend(v3, "error", (void)v42);
          uint64_t v25 = [v23 characteristic];
          [v25 setError:v24];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v20);
    }
  }
  if (!objc_msgSend(*v8, "pendingGroups", (void)v42))
  {
    id v26 = [*v8 errors];
    uint64_t v27 = [v26 count];

    v28 = [*v8 errors];
    id v29 = v28;
    if (v27 == 1)
    {
      __int16 v30 = [v28 allValues];
      uint64_t v31 = [v30 firstObject];
    }
    else
    {
      unint64_t v32 = [v28 count];

      if (v32 < 2)
      {
        v34 = 0;
        goto LABEL_25;
      }
      v33 = (void *)MEMORY[0x263F087E8];
      id v29 = [*v8 errors];
      __int16 v30 = [v29 allValues];
      uint64_t v31 = objc_msgSend(v33, "CAF_groupRequestErrors:", v30);
    }
    v34 = (void *)v31;

LABEL_25:
    v35 = CAFGeneralLogging();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      __41__CAFGroupRequest_performWithCompletion___block_invoke_26_cold_1((id *)(a1 + 40));
    }

    v36 = CARSignpostLogForCategory();
    if (!*v8
      || (CARSignpostLogForCategory(),
          v37 = objc_claimAutoreleasedReturnValue(),
          os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v37, *v8),
          v37,
          v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_249710000, v36, OS_SIGNPOST_INTERVAL_END, v11, "Perform", (const char *)&unk_2497DFEC6, buf, 2u);
      }
    }

    uint64_t v38 = *(void *)(a1 + 56);
    if (v38) {
      (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v34);
    }
  }
}

- (NSString)description
{
  id v2 = [(CAFGroupRequest *)self cachedDescription];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)fullDescription
{
  id v2 = [(CAFGroupRequest *)self cachedFullDescription];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (void)_lockedPerformBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(CAFGroupRequest *)self performed])
  {
    id v5 = CAFGroupRequestLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CAFGroupRequest _lockedPerformBlock:]();
    }
  }
  else
  {
    v4[2](v4);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_addRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestKey];
  if ([(CAFGroupRequest *)self forced])
  {
    id v6 = CAFGroupRequestLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(CAFGroupRequest *)(uint64_t)self _addRequest:v6];
    }

    uint64_t v7 = [v5 copyWithPriority:0x26FD90ED0];
    id v5 = (void *)v7;
  }
  long long v8 = [(CAFGroupRequest *)self requests];
  long long v9 = [v8 objectForKeyedSubscript:v5];

  if (!v9)
  {
    long long v9 = objc_opt_new();
    os_signpost_id_t v10 = [(CAFGroupRequest *)self requests];
    [v10 setObject:v9 forKeyedSubscript:v5];
  }
  [v9 addObject:v4];
}

- (id)currentDescriptionForCache:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFGroupRequest *)self cachedFullDescription];

  if (v5 == v4)
  {
    uint64_t v11 = [(CAFGroupRequest *)self _currentDescriptionForFull];
  }
  else
  {
    id v6 = [(CAFGroupRequest *)self cachedRequestsDescription];

    if (v6 != v4)
    {
      uint64_t v7 = NSString;
      uint64_t v8 = objc_opt_class();
      long long v9 = [(CAFGroupRequest *)self uniqueIdentifier];
      os_signpost_id_t v10 = [v7 stringWithFormat:@"<%@: %p %@>", v8, self, v9];

      goto LABEL_7;
    }
    uint64_t v11 = [(CAFGroupRequest *)self _currentDescriptionForRequests];
  }
  os_signpost_id_t v10 = (void *)v11;
LABEL_7:

  return v10;
}

- (id)_currentDescriptionForFull
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CAFGroupRequest *)self uniqueIdentifier];
  BOOL v6 = [(CAFGroupRequest *)self performed];
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" Pending=%lu", -[CAFGroupRequest pendingGroups](self, "pendingGroups"));
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = &stru_26FD46EB0;
  }
  uint64_t v8 = [(CAFGroupRequest *)self cachedRequestsDescription];
  long long v9 = [v3 stringWithFormat:@"<%@: %p %@%@ {%@}>", v4, self, v5, v7, v8];

  if (v6) {
  return v9;
  }
}

- (id)_currentDescriptionForRequests
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(CAFGroupRequest *)self requests];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__CAFGroupRequest__currentDescriptionForRequests__block_invoke;
  v8[3] = &unk_2652644E0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  BOOL v6 = [v5 componentsJoinedByString:@", "];

  return v6;
}

void __49__CAFGroupRequest__currentDescriptionForRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = NSString;
  id v6 = a2;
  id v7 = [v5 stringWithFormat:@"%@: %lu", v6, objc_msgSend(a3, "count")];

  [v4 addObject:v7];
}

- (CAFCar)car
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_car);
  return (CAFCar *)WeakRetained;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (NSMutableDictionary)errors
{
  return self->_errors;
}

- (BOOL)performed
{
  return self->_performed;
}

- (void)setPerformed:(BOOL)a3
{
  self->_performed = a3;
}

- (unint64_t)pendingGroups
{
  return self->_pendingGroups;
}

- (void)setPendingGroups:(unint64_t)a3
{
  self->_pendingGroups = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
}

- (CAFCachedDescription)cachedRequestsDescription
{
  return self->_cachedRequestsDescription;
}

- (void)setCachedRequestsDescription:(id)a3
{
}

- (CAFCachedDescription)cachedFullDescription
{
  return self->_cachedFullDescription;
}

- (void)setCachedFullDescription:(id)a3
{
}

- (BOOL)forced
{
  return self->_forced;
}

- (void)setForced:(BOOL)a3
{
  self->_forced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFullDescription, 0);
  objc_storeStrong((id *)&self->_cachedRequestsDescription, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_car);
}

- (void)initWithCar:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_249710000, v0, OS_LOG_TYPE_DEBUG, "%@", v1, 0xCu);
}

- (void)performWithCompletion:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_20(&dword_249710000, v2, v3, "%@ already performed", v4, v5, v6, v7, v8);
}

- (void)performWithCompletion:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_20(&dword_249710000, v2, v3, "%@ no characteristics", v4, v5, v6, v7, v8);
}

- (void)performWithCompletion:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 fullDescription];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_20(&dword_249710000, v2, v3, "%@ start ", v4, v5, v6, v7, v8);
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%@ nil groupRequest %@", v4, v5, v6, v7, v8);
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) description];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%@ performing %@", v4, v5, v6, v7, v8);
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_26_cold_1(id *a1)
{
  v1 = [*a1 fullDescription];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%@ completed all requests error=%@", v4, v5, v6, v7, v8);
}

- (void)_lockedPerformBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_249710000, v0, OS_LOG_TYPE_DEBUG, "%@ already performed", v1, 0xCu);
}

- (void)_addRequest:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_249710000, log, OS_LOG_TYPE_DEBUG, "%@ forcing priority to %@", (uint8_t *)&v3, 0x16u);
}

@end