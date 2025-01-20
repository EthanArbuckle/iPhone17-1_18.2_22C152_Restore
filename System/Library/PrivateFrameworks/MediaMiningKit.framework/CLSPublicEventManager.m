@interface CLSPublicEventManager
- (CLSPublicEventManager)initWithURL:(id)a3;
- (double)queryRadius;
- (id)cachedPublicEventsForMuid:(unint64_t)a3;
- (id)loadInvalidationTokensAndInvalidateCachesIfNeeded;
- (id)publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples:(id)a3 progressBlock:(id)a4;
- (id)urlForEventsForCacheInvalidation;
- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3;
- (void)invalidateDiskCaches;
- (void)invalidateMemoryCaches;
- (void)setQueryRadius:(double)a3;
@end

@implementation CLSPublicEventManager

- (void).cxx_destruct
{
}

- (void)setQueryRadius:(double)a3
{
  self->_queryRadius = a3;
}

- (double)queryRadius
{
  return self->_queryRadius;
}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
}

- (void)invalidateDiskCaches
{
}

- (void)invalidateMemoryCaches
{
}

- (id)urlForEventsForCacheInvalidation
{
  v2 = [(CLSDBCache *)self->_cache diskCacheURL];
  v3 = [v2 URLByDeletingLastPathComponent];

  v4 = [v3 URLByAppendingPathComponent:@"eventsForCacheInvalidation.plist"];

  return v4;
}

- (id)loadInvalidationTokensAndInvalidateCachesIfNeeded
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (id)cachedPublicEventsForMuid:(unint64_t)a3
{
  return [(CLSPublicEventCache *)self->_cache publicEventsForMuid:a3];
}

- (id)publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples:(id)a3 progressBlock:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v38 = v6;
  uint64_t v8 = [v6 count];
  v37 = v7;
  if (!v8)
  {
    id v12 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_33;
  }
  unint64_t v36 = v8;
  uint64_t v9 = MEMORY[0x1D2602540](v7);
  v10 = (void (**)(void, void))v9;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  if (v9)
  {
    LOBYTE(v51) = 0;
    (*(void (**)(uint64_t, uint64_t *, double))(v9 + 16))(v9, &v51, 0.0);
    char v11 = *((unsigned char *)v56 + 24) | v51;
    *((unsigned char *)v56 + 24) = v11;
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 55;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      id v12 = (id)MEMORY[0x1E4F1CC08];
      goto LABEL_32;
    }
  }
  v13 = [(CLSPublicEventManager *)self loadInvalidationTokensAndInvalidateCachesIfNeeded];
  v35 = (void *)[v13 mutableCopy];

  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v39 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v51 = 0;
  v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v20 = [(CLSPublicEventCache *)self->_cache publicEventsForTimeLocationTuple:v19];
        if (v20)
        {
          v21 = [v19 timeLocationIdentifier];
          [v14 setObject:v20 forKeyedSubscript:v21];
        }
        else
        {
          [v39 addObject:v19];
        }
        v52[3] = 1.0 / (double)v36 * 0.35 + v52[3];
        if (v10)
        {
          buf[0] = 0;
          ((void (**)(void, uint8_t *))v10)[2](v10, buf);
          char v22 = *((unsigned char *)v56 + 24) | buf[0];
          *((unsigned char *)v56 + 24) = v22;
          if (v22)
          {

            goto LABEL_23;
          }
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v64 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  if (v10)
  {
LABEL_23:
    char v46 = 0;
    ((void (*)(void (**)(void, void), char *, double))v10[2])(v10, &v46, v52[3]);
    char v23 = *((unsigned char *)v56 + 24) | v46;
    *((unsigned char *)v56 + 24) = v23;
    if (v23)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 80;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      id v12 = (id)MEMORY[0x1E4F1CC08];
      v24 = v39;
      goto LABEL_31;
    }
  }
  v24 = v39;
  uint64_t v25 = [v39 count];
  double v26 = v52[3];
  if ([v39 count])
  {
    v27 = [[CLSPublicEventCacheCreator alloc] initWithCache:self->_cache queryRadius:self->_queryRadius];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __102__CLSPublicEventManager_publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples_progressBlock___block_invoke;
    v40[3] = &unk_1E690FE08;
    v42 = &v51;
    double v44 = v26;
    double v45 = 1.0 - v26;
    v41 = v10;
    v43 = &v55;
    v28 = [(CLSPublicEventCacheCreator *)v27 createCacheForTimeLocationTuples:v39 progressBlock:v40];
    v29 = [v28 resolvedPublicEventsByTimeLocationIdentifier];
    [v14 addEntriesFromDictionary:v29];

    v30 = [v28 invalidationTokenByTimeLocationIdentifier];
    [v35 addEntriesFromDictionary:v30];

    [(CLSPublicEventManager *)self saveEventsForCacheInvalidation:v35];
    uint64_t v31 = [v28 numberOfRequests];
    uint64_t v32 = [(CLSPublicEventCacheCreator *)v27 maximumBatchSize];

    v24 = v39;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
  }
  uint64_t v33 = [v14 count];
  *(void *)buf = v36;
  unint64_t v60 = v33 - (v36 - v25);
  unint64_t v61 = v36 - v25;
  uint64_t v62 = v31;
  uint64_t v63 = v32;
  CLSPrintQueryPerformerProtocolStatisticsDescription(@"CLSPublicEventGeoQuery", buf);
  id v12 = v14;
LABEL_31:
  _Block_object_dispose(&v51, 8);

LABEL_32:
  _Block_object_dispose(&v55, 8);

LABEL_33:
  return v12;
}

uint64_t __102__CLSPublicEventManager_publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) + a3 * *(double *)(a1 + 64);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

- (CLSPublicEventManager)initWithURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSPublicEventManager;
  v5 = [(CLSPublicEventManager *)&v12 init];
  char v6 = v5;
  if (v5)
  {
    v5->_queryRadius = 500.0;
    id v7 = [CLSPublicEventCache alloc];
    uint64_t v8 = +[CLSDBCache urlWithParentURL:v4];
    uint64_t v9 = [(CLSDBCache *)v7 initWithURL:v8];
    cache = v6->_cache;
    v6->_cache = (CLSPublicEventCache *)v9;
  }
  return v6;
}

@end