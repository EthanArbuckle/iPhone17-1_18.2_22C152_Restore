@interface ENAdvertisementDatabaseQuerySession
- (BOOL)enumerateAdvertisementsMatchingKeys:(id)a3 attenuationThreshold:(unsigned __int8)a4 timestampTolerance:(double)a5 error:(id *)a6 handler:(id)a7;
- (ENAdvertisementDatabase)database;
- (ENAdvertisementDatabaseQuerySession)initWithDatabase:(id)a3 attenuationThreshold:(unsigned __int8)a4 advertisementCount:(unsigned int)a5 queue:(id)a6;
- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5 error:(id *)a6;
- (unsigned)attenuationThreshold;
- (unsigned)storedAdvertisementCount;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ENAdvertisementDatabaseQuerySession

- (ENAdvertisementDatabaseQuerySession)initWithDatabase:(id)a3 attenuationThreshold:(unsigned __int8)a4 advertisementCount:(unsigned int)a5 queue:(id)a6
{
  uint64_t v8 = a4;
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ENAdvertisementDatabaseQuerySession;
  v13 = [(ENAdvertisementDatabaseQuerySession *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_attenuationThreshold = v8;
    objc_storeStrong((id *)&v13->_database, a3);
    objc_storeStrong((id *)&v14->_queue, a6);
    v14->_storedAdvertisementCount = a5;
    v14->_tekCount = 0;
    database = v14->_database;
    v16 = [(ENAdvertisementDatabase *)database queryFilterWithBufferSize:1638400 hashCount:3 attenuationThreshold:v8];
    [(ENAdvertisementDatabase *)database setInlineQueryFilter:v16];
  }
  return v14;
}

- (void)dealloc
{
  v3 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v4 = [v3 isSensitiveLoggingAllowed];

  if (v4
    && gLogCategory_ENAdvertisementDatabaseQuerySession <= 50
    && (gLogCategory_ENAdvertisementDatabaseQuerySession != -1 || _LogCategory_Initialize()))
  {
    uint64_t tekCount = self->_tekCount;
    LogPrintF_safe();
  }
  [(ENAdvertisementDatabaseQuerySession *)self invalidate];
  v6.receiver = self;
  v6.super_class = (Class)ENAdvertisementDatabaseQuerySession;
  [(ENAdvertisementDatabaseQuerySession *)&v6 dealloc];
}

- (void)invalidate
{
}

- (BOOL)enumerateAdvertisementsMatchingKeys:(id)a3 attenuationThreshold:(unsigned __int8)a4 timestampTolerance:(double)a5 error:(id *)a6 handler:(id)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v47 = (void (**)(id, void *, id))a7;
  self->_tekCount += [v11 count];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v63 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        objc_super v18 = [v17 keyData];
        [v12 setObject:v17 forKey:v18];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v14);
  }

  v19 = [v12 allValues];

  v45 = (void *)MEMORY[0x1D9439DC0]();
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__ENAdvertisementDatabaseQuerySession_enumerateAdvertisementsMatchingKeys_attenuationThreshold_timestampTolerance_error_handler___block_invoke;
  block[3] = &unk_1E69ACAA0;
  v53 = &v56;
  block[4] = self;
  id v46 = v19;
  id v52 = v46;
  unsigned __int8 v55 = a4;
  double v54 = a5;
  dispatch_sync(queue, block);
  v21 = (void *)v57[5];
  v44 = v21;
  if (v21)
  {
    uint64_t v48 = [v21 bytes];
    unint64_t v22 = 0;
    unint64_t v23 = [(id)v57[5] length] / 0x28uLL;
    while (v22 < v23)
    {
      contexta = (void *)MEMORY[0x1D9439DC0]();
      uint64_t v24 = v48 + 40 * v22;
      int v26 = *(_DWORD *)(v24 + 28);
      v25 = (unsigned int *)(v24 + 28);
      if (v26 == -1)
      {
        unint64_t v31 = v22 + 1;
      }
      else
      {
        id v27 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
        uint64_t v28 = 0;
        uint64_t v29 = *v25;
        v30 = (void *)(v48 + 32 + 40 * v22);
        unint64_t v31 = v22;
        do
        {
          v71[0] = *((_OWORD *)v30 - 2);
          *(_OWORD *)((char *)v71 + 12) = *(_OWORD *)((char *)v30 - 20);
          int v32 = *((_DWORD *)v30 - 1);
          if (v32 == -1)
          {
            uint64_t v28 = (v28 + 1);
          }
          else
          {
            if (v32 != v29) {
              goto LABEL_19;
            }
            uint64_t v33 = *v30;
            v34 = [ENAdvertisement alloc];
            *(_OWORD *)v68 = v71[0];
            *(_OWORD *)&v68[12] = *(_OWORD *)((char *)v71 + 12);
            int v69 = v29;
            uint64_t v70 = v33;
            v35 = [(ENAdvertisement *)v34 initWithStructRepresentation:v68];
            [v27 addObject:v35];
          }
          v30 += 5;
          ++v31;
        }
        while (v23 != v31);
        unint64_t v31 = v23;
LABEL_19:
        v36 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v37 = [v36 isSensitiveLoggingAllowed];

        if (v37
          && gLogCategory_ENAdvertisementDatabaseQuerySession <= 10
          && (gLogCategory_ENAdvertisementDatabaseQuerySession != -1 || _LogCategory_Initialize()))
        {
          unint64_t v42 = v31 - v22;
          uint64_t v43 = v28;
          unint64_t v41 = v22;
          LogPrintF_safe();
        }
        v38 = objc_msgSend(v46, "objectAtIndexedSubscript:", v29, v41, v42, v43);
        v47[2](v47, v38, v27);
      }
      unint64_t v22 = v31;
    }

    _Block_object_dispose(&v56, 8);
  }
  else
  {

    _Block_object_dispose(&v56, 8);
    uint64_t v66 = *MEMORY[0x1E4F28570];
    v67 = @"Error encountered querying database";
    v39 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C50] errorWithDomain:*MEMORY[0x1E4F25700] code:16 userInfo:v39];
    }
  }
  return v44 != 0;
}

uint64_t __129__ENAdvertisementDatabaseQuerySession_enumerateAdvertisementsMatchingKeys_attenuationThreshold_timestampTolerance_error_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) advertisementsBufferMatchingDailyKeys:*(void *)(a1 + 40) attenuationThreshold:*(unsigned __int8 *)(a1 + 64) timestampTolerance:*(double *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5 error:(id *)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (self->_database)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    unint64_t v31 = __Block_byref_object_copy_;
    int v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    id v12 = (void *)MEMORY[0x1D9439DC0]();
    queue = self->_queue;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __100__ENAdvertisementDatabaseQuerySession_beaconCountMetricsWithStartDate_endDate_windowDuration_error___block_invoke;
    unint64_t v22 = &unk_1E69ACAC8;
    int v26 = &v28;
    unint64_t v23 = self;
    id v24 = v10;
    id v25 = v11;
    double v27 = a5;
    dispatch_sync(queue, &v19);

    uint64_t v14 = (void *)v29[5];
    if (a6 && !v14)
    {
      uint64_t v34 = *MEMORY[0x1E4F28570];
      v35 = @"Nil beacon count metrics";
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E0], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1, v19, v20, v21, v22, v23);
      *a6 = [MEMORY[0x1E4F28C50] errorWithDomain:*MEMORY[0x1E4F25700] code:11 userInfo:v15];

      uint64_t v14 = (void *)v29[5];
    }
    id v16 = v14;
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    uint64_t v36 = *MEMORY[0x1E4F28570];
    v37[0] = @"Nil advertisement database";
    v17 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C50] errorWithDomain:*MEMORY[0x1E4F25700] code:11 userInfo:v17];
    }

    id v16 = 0;
  }

  return v16;
}

uint64_t __100__ENAdvertisementDatabaseQuerySession_beaconCountMetricsWithStartDate_endDate_windowDuration_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) beaconCountMetricsWithStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) windowDuration:*(double *)(a1 + 64)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (unsigned)attenuationThreshold
{
  return self->_attenuationThreshold;
}

- (ENAdvertisementDatabase)database
{
  return self->_database;
}

- (unsigned)storedAdvertisementCount
{
  return self->_storedAdvertisementCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end