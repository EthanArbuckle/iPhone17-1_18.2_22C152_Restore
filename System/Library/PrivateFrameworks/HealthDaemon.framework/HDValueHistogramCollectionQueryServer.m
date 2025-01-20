@interface HDValueHistogramCollectionQueryServer
+ (Class)queryClass;
- (HDValueHistogramCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDValueHistogramCollectionQueryServer

- (HDValueHistogramCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDValueHistogramCollectionQueryServer;
  v11 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    valueHistogramCollectionQueryServerConfiguration = v11->_valueHistogramCollectionQueryServerConfiguration;
    v11->_valueHistogramCollectionQueryServerConfiguration = (HKValueHistogramCollectionQueryServerConfiguration *)v12;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)HDValueHistogramCollectionQueryServer;
  [(HDQueryServer *)&v40 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self quantityType];
  id v39 = 0;
  v6 = [(HDQueryServer *)self readAuthorizationStatusForType:v5 error:&v39];
  id v7 = v39;

  if (v6)
  {
    if ([v6 canRead])
    {
      id v38 = v7;
      if (self)
      {
        v35 = [(HKValueHistogramCollectionQueryServerConfiguration *)self->_valueHistogramCollectionQueryServerConfiguration quantityRanges];
        v37 = [(HKValueHistogramCollectionQueryServerConfiguration *)self->_valueHistogramCollectionQueryServerConfiguration anchorDate];
        v36 = [(HKValueHistogramCollectionQueryServerConfiguration *)self->_valueHistogramCollectionQueryServerConfiguration intervalComponents];
        v34 = (void *)[objc_alloc(MEMORY[0x1E4F2B8A8]) initWithAnchorDate:v37 intervalComponents:v36];
        v8 = [HDValueHistogramCollectionCalculator alloc];
        v9 = [(HDQueryServer *)self quantityType];
        id v10 = [(HDValueHistogramCollectionCalculator *)v8 initWithQuantityType:v9 quantityRanges:v35 intervalCollection:v34];

        v11 = [(HDQueryServer *)self filter];
        uint64_t v12 = [(HDQueryServer *)self profile];
        v33 = [v11 predicateWithProfile:v12];

        v13 = [(HDQueryServer *)self objectType];
        v14 = HDSampleEntityPredicateForDataType(v13);

        objc_super v15 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v33 otherPredicate:v14];
        uint64_t v41 = 0;
        v42 = &v41;
        uint64_t v43 = 0x2020000000;
        char v44 = 0;
        v16 = [(HDQueryServer *)self profile];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __87__HDValueHistogramCollectionQueryServer__queue_fetchValueHistogramCollectionWithError___block_invoke;
        v46 = &unk_1E63024F0;
        v17 = v10;
        v47 = v17;
        v48 = self;
        v49 = &v41;
        +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v15 profile:v16 options:0 error:&v38 handler:buf];

        if (*((unsigned char *)v42 + 24))
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Query stopped before completing sample enumeration");
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18) {
            id v38 = v18;
          }

          v20 = 0;
        }
        else
        {
          v20 = [(HDValueHistogramCollectionCalculator *)v17 result];
        }

        _Block_object_dispose(&v41, 8);
        v30 = v38;
      }
      else
      {
        v20 = 0;
        v30 = v7;
      }
      id v31 = v30;

      v32 = [(HDQueryServer *)self queryUUID];
      if (v31) {
        objc_msgSend(v4, "client_deliverError:forQuery:", v31, v32);
      }
      else {
        objc_msgSend(v4, "client_deliverValueHistogramCollection:forQuery:", v20, v32);
      }

      id v7 = v31;
    }
    else
    {
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        id v24 = v23;
        _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);
      }
      v20 = [(HKValueHistogramCollectionQueryServerConfiguration *)self->_valueHistogramCollectionQueryServerConfiguration quantityRanges];
      id v25 = objc_alloc(MEMORY[0x1E4F2B6C8]);
      v26 = [(HKValueHistogramCollectionQueryServerConfiguration *)self->_valueHistogramCollectionQueryServerConfiguration anchorDate];
      v27 = [(HKValueHistogramCollectionQueryServerConfiguration *)self->_valueHistogramCollectionQueryServerConfiguration intervalComponents];
      v28 = (void *)[v25 initWithQuantityRanges:v20 valueHistogramsByDateIntervalIndex:MEMORY[0x1E4F1CC08] anchorDate:v26 intervalComponents:v27];

      v29 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v4, "client_deliverValueHistogramCollection:forQuery:", v28, v29);
    }
  }
  else
  {
    v20 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v20);
  }
}

uint64_t __87__HDValueHistogramCollectionQueryServer__queue_fetchValueHistogramCollectionWithError___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  [*(id *)(a1 + 32) addSampleValue:a4 startTime:a2];
  int v5 = [*(id *)(a1 + 40) _shouldStopProcessingQuery];
  if (v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return v5 ^ 1u;
}

- (void).cxx_destruct
{
}

@end