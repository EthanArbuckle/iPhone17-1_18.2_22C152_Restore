@interface KMCoreRoutineBridge
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMCoreRoutineBridge)init;
- (id)_fetchLocationOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation KMCoreRoutineBridge

- (void).cxx_destruct
{
}

- (id)_fetchLocationOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1709;
  v32 = __Block_byref_object_dispose__1710;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1709;
  v26 = __Block_byref_object_dispose__1710;
  id v27 = 0;
  v9 = [MEMORY[0x263F37F08] defaultManager];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__KMCoreRoutineBridge__fetchLocationOfInterestBetweenStartDate_endDate_error___block_invoke;
  v18[3] = &unk_2646DBB18;
  v20 = &v28;
  v21 = &v22;
  v10 = v8;
  v19 = v10;
  [v9 fetchLocationsOfInterestVisitedBetweenStartDate:v6 endDate:v7 withHandler:v18];

  dispatch_time_t v11 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F07F80];
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"Fetch CoreRoutine LOI timed out after %f second(s)", 0x3FF0000000000000);
    v35[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v15 = [v12 errorWithDomain:@"com.apple.siri.vocabulary.donate.coreroutine.loi" code:1 userInfo:v14];
    KVSetError();

LABEL_5:
    id v16 = 0;
    goto LABEL_6;
  }
  if (v23[5])
  {
    KVSetError();
    goto LABEL_5;
  }
  id v16 = (id)v29[5];
LABEL_6:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __78__KMCoreRoutineBridge__fetchLocationOfInterestBetweenStartDate_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v33 = (uint64_t (**)(id, void *))a4;
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v7 = [v6 dateByAddingUnit:16 value:-90 toDate:v5 options:0];

  dispatch_semaphore_t v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v9 = [v8 dateByAddingUnit:16 value:10 toDate:v5 options:0];

  id v39 = 0;
  v10 = self;
  id v11 = [(KMCoreRoutineBridge *)self _fetchLocationOfInterestBetweenStartDate:v7 endDate:v9 error:&v39];
  id v12 = v39;
  if (v11)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v31 = v11;
    id obj = v11;
    uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      v29 = v7;
      uint64_t v30 = v5;
      uint64_t v28 = v9;
      while (2)
      {
        uint64_t v16 = 0;
        v17 = v12;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * v16);
          v19 = (void *)MEMORY[0x22A6168F0]();
          itemMapper = v10->_itemMapper;
          id v34 = v17;
          v21 = [(KVItemMapper *)itemMapper mapObject:v18 error:&v34];
          id v12 = v34;

          if ([v21 count] != 1)
          {
            v26 = KMLogContextCore;
            uint64_t v9 = v28;
            if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v41 = "-[KMCoreRoutineBridge enumerateItemsWithError:usingBlock:]";
              __int16 v42 = 2112;
              id v43 = v21;
              __int16 v44 = 2112;
              id v45 = v12;
              _os_log_error_impl(&dword_22475B000, v26, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
            }

            BOOL v24 = 0;
            uint64_t v7 = v29;
            id v5 = v30;
            goto LABEL_20;
          }
          uint64_t v22 = [v21 firstObject];
          int v23 = v33[2](v33, v22);

          if (!v23)
          {
            BOOL v24 = 0;
            uint64_t v7 = v29;
            id v5 = v30;
            uint64_t v9 = v28;
            goto LABEL_20;
          }
          ++v16;
          v17 = v12;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
        BOOL v24 = 1;
        uint64_t v7 = v29;
        id v5 = v30;
        uint64_t v9 = v28;
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v24 = 1;
    }
LABEL_20:

    id v11 = v31;
  }
  else
  {
    v25 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[KMCoreRoutineBridge enumerateItemsWithError:usingBlock:]";
      __int16 v42 = 2112;
      id v43 = v12;
      _os_log_error_impl(&dword_22475B000, v25, OS_LOG_TYPE_ERROR, "%s Could not get CoreRoutine LOIs: %@", buf, 0x16u);
    }
    BOOL v24 = 0;
  }

  return v24;
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51068];
}

- (unsigned)cascadeItemType
{
  return 15757;
}

- (KMCoreRoutineBridge)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)KMCoreRoutineBridge;
  v2 = [(KMCoreRoutineBridge *)&v10 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v9 = 0;
  uint64_t v3 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v9];
  id v4 = v9;
  itemMapper = v2->_itemMapper;
  v2->_itemMapper = (KVItemMapper *)v3;

  if (v2->_itemMapper)
  {

LABEL_4:
    id v6 = v2;
    goto LABEL_8;
  }
  uint64_t v7 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[KMCoreRoutineBridge init]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_error_impl(&dword_22475B000, v7, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  id v6 = 0;
LABEL_8:

  return v6;
}

@end