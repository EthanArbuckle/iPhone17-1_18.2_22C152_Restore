@interface CLSPublicEventCacheCreator
- (BOOL)simulatesTimeout;
- (CLSPublicEventCache)cache;
- (CLSPublicEventCacheCreator)initWithCache:(id)a3 queryRadius:(double)a4;
- (double)queryRadius;
- (id)_queryEventsForTimeLocationTuples:(id)a3 invalidationTokens:(id *)a4 progressBlock:(id)a5 error:(id *)a6;
- (id)createCacheForTimeLocationTuples:(id)a3 progressBlock:(id)a4;
- (unint64_t)maximumBatchSize;
- (void)setSimulatesTimeout:(BOOL)a3;
@end

@implementation CLSPublicEventCacheCreator

- (void).cxx_destruct
{
}

- (void)setSimulatesTimeout:(BOOL)a3
{
  self->_simulatesTimeout = a3;
}

- (BOOL)simulatesTimeout
{
  return self->_simulatesTimeout;
}

- (double)queryRadius
{
  return self->_queryRadius;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (CLSPublicEventCache)cache
{
  return self->_cache;
}

- (id)_queryEventsForTimeLocationTuples:(id)a3 invalidationTokens:(id *)a4 progressBlock:(id)a5 error:(id *)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = MEMORY[0x1D2602540]();
  v13 = (void (**)(void, void, double))v12;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  if (!v12
    || (LOBYTE(v38) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v12 + 16))(v12, &v38, 0.0),
        char v14 = *((unsigned char *)v45 + 24) | v38,
        (*((unsigned char *)v45 + 24) = v14) == 0))
  {
    uint64_t buf = 0;
    p_uint64_t buf = &buf;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy_;
    v54 = __Block_byref_object_dispose_;
    id v55 = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    v42 = __Block_byref_object_dispose_;
    id v43 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    v16 = [[CLSPublicEventGeoServiceQuery alloc] initWithTimeLocationTuples:v10 radius:self->_queryRadius];
    if (v16)
    {
      dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global);
      v18 = [[CLSQueueBasedGeoMapQueryHelper alloc] initWithQueryObject:v16];
      [(CLSQueueBasedGeoMapQueryHelper *)v18 setSimulatesTimeout:self->_simulatesTimeout];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_2;
      v31[3] = &unk_1E690FB40;
      v32 = v13;
      v33 = &v44;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_3;
      v26[3] = &unk_1E690E718;
      v28 = &v34;
      v29 = &buf;
      v30 = &v38;
      id v19 = v17;
      id v27 = v19;
      [(CLSQueueBasedGeoMapQueryHelper *)v18 launchQueryWithCancellerBlock:v31 completionBlock:v26];
      dispatch_block_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (v13
      && (char v25 = 0,
          ((void (**)(void, char *, double))v13)[2](v13, &v25, 0.8),
          char v20 = *((unsigned char *)v45 + 24) | v25,
          (*((unsigned char *)v45 + 24) = v20) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v48 = 67109120;
        int v49 = 181;
        v21 = MEMORY[0x1E4F14500];
LABEL_24:
        _os_log_impl(&dword_1D2150000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&v48, 8u);
      }
    }
    else
    {
      if (*((unsigned char *)v35 + 24))
      {
        if (a4)
        {
          *a4 = [(CLSPublicEventGeoServiceQuery *)v16 invalidationTokens];
        }
        v22 = [(CLSPublicEventCacheCreator *)self cache];
        [v22 insertBatchesOfPublicEventsByTimeLocationIdentifier:v39[5] forTimeLocationTuples:v10];
      }
      else if (a4)
      {
        *a4 = 0;
      }
      if (a6) {
        *a6 = (id) p_buf[5];
      }
      if (!v13
        || (char v25 = 0,
            ((void (**)(void, char *, double))v13)[2](v13, &v25, 1.0),
            char v23 = *((unsigned char *)v45 + 24) | v25,
            (*((unsigned char *)v45 + 24) = v23) == 0))
      {
        id v15 = (id)v39[5];
        goto LABEL_27;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v48 = 67109120;
        int v49 = 204;
        v21 = MEMORY[0x1E4F14500];
        goto LABEL_24;
      }
    }
    id v15 = (id)MEMORY[0x1E4F1CC08];
LABEL_27:

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&buf, 8);
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x9904000100;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  id v15 = (id)MEMORY[0x1E4F1CC08];
LABEL_28:
  _Block_object_dispose(&v44, 8);

  return v15;
}

uint64_t __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

void __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_3(void *a1, int a2, void *a3, void *a4)
{
  id v12 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (a2)
  {
    uint64_t v9 = [v8 resolvedPublicEventsForTimeLocationTuples];
    uint64_t v10 = *(void *)(a1[7] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (id)createCacheForTimeLocationTuples:(id)a3 progressBlock:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t maximumBatchSize = self->_maximumBatchSize;
  uint64_t v9 = objc_alloc_init(CLSPublicEventCacheCreatorResult);
  uint64_t v10 = v9;
  if (maximumBatchSize)
  {
    id v11 = (void (**)(void, void, double))MEMORY[0x1D2602540](v7);
    id v12 = v10;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    if (v11
      && (LOBYTE(v58[0]) = 0,
          ((void (**)(void, void *, double))v11)[2](v11, v58, 0.0),
          char v13 = *((unsigned char *)v60 + 24) | LOBYTE(v58[0]),
          (*((unsigned char *)v60 + 24) = v13) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 0x4504000100;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
    }
    else
    {
      char v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v12);
      id v27 = [MEMORY[0x1E4F1CA60] dictionary];
      id v31 = v7;
      v32 = v11;
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:maximumBatchSize];
      uint64_t buf = 0;
      p_uint64_t buf = &buf;
      uint64_t v67 = 0x2020000000;
      uint64_t v68 = 0;
      unint64_t v16 = [v6 count];
      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x2020000000;
      v58[3] = 0;
      uint64_t v54 = 0;
      id v55 = &v54;
      uint64_t v56 = 0x2020000000;
      char v57 = 0;
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x2020000000;
      char v53 = 0;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __77__CLSPublicEventCacheCreator_createCacheForTimeLocationTuples_progressBlock___block_invoke;
      v38[3] = &unk_1E690E6F0;
      uint64_t v44 = &buf;
      v38[4] = self;
      id v17 = v15;
      id v39 = v17;
      id v42 = v7;
      id v29 = v14;
      id v40 = v29;
      id v30 = v27;
      id v41 = v30;
      v45 = &v50;
      uint64_t v46 = v58;
      double v49 = (double)maximumBatchSize / (double)v16;
      id v28 = v32;
      id v43 = v28;
      char v47 = &v59;
      int v48 = &v54;
      v18 = (void (**)(void))MEMORY[0x1D2602540](v38);
      if (v16)
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v19 = v6;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v64 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v35;
LABEL_9:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v19);
            }
            [v17 addObject:*(void *)(*((void *)&v34 + 1) + 8 * v22)];
            if ([v17 count] >= maximumBatchSize) {
              v18[2](v18);
            }
            if (*((unsigned char *)v55 + 24) || *((unsigned char *)v51 + 24)) {
              break;
            }
            if (v20 == ++v22)
            {
              uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v64 count:16];
              if (v20) {
                goto LABEL_9;
              }
              break;
            }
          }
        }

        id v7 = v31;
        if ([v17 count] && !*((unsigned char *)v55 + 24) && !*((unsigned char *)v51 + 24)) {
          v18[2](v18);
        }
      }
      if (v32
        && (char v33 = 0,
            (*((void (**)(id, char *, double))v28 + 2))(v28, &v33, 1.0),
            char v23 = *((unsigned char *)v60 + 24) | v33,
            (*((unsigned char *)v60 + 24) = v23) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          v63[0] = 67109120;
          v63[1] = 136;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)v63, 8u);
        }
      }
      else
      {
        [v26 setResolvedPublicEventsByTimeLocationIdentifier:v29];
        [v26 setInvalidationTokenByTimeLocationIdentifier:v30];
        [v26 setNumberOfRequests:p_buf[3]];
      }

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v54, 8);
      _Block_object_dispose(v58, 8);
      _Block_object_dispose(&buf, 8);

      id v11 = (void (**)(void, void, double))v32;
    }
    _Block_object_dispose(&v59, 8);
  }
  else
  {
    v24 = v9;
  }

  return v10;
}

uint64_t __77__CLSPublicEventCacheCreator_createCacheForTimeLocationTuples_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D2602300]();
  ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0;
  id v11 = 0;
  char v5 = [v3 _queryEventsForTimeLocationTuples:v4 invalidationTokens:&v11 progressBlock:*(void *)(a1 + 64) error:&v10];
  id v6 = v11;
  id v7 = v10;
  if (v5)
  {
    [*(id *)(a1 + 48) addEntriesFromDictionary:v5];
    if (v6) {
      [*(id *)(a1 + 56) addEntriesFromDictionary:v6];
    }
  }
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Received a geo error, stopping the public event creation: (%@)", buf, 0xCu);
    }
  }

  *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                          + 24);
  uint64_t v8 = *(void *)(a1 + 72);
  if (!v8) {
    return [*(id *)(a1 + 40) removeAllObjects];
  }
  buf[0] = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint8_t *, double))(v8 + 16))(v8, buf, *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) |= buf[0];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
    return [*(id *)(a1 + 40) removeAllObjects];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
  return result;
}

- (CLSPublicEventCacheCreator)initWithCache:(id)a3 queryRadius:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSPublicEventCacheCreator;
  uint64_t v8 = [(CLSPublicEventCacheCreator *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cache, a3);
    v9->_queryRadius = a4;
    v9->_unint64_t maximumBatchSize = +[CLSPublicEventGeoServiceQuery maximumBatchSize];
  }

  return v9;
}

@end