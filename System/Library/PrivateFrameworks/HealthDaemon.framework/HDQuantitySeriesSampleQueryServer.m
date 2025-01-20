@interface HDQuantitySeriesSampleQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDQuantitySeriesSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_clientProxy;
- (id)unitTest_batchWillDeliver;
- (uint64_t)_deliverEnumerationResults:(uint64_t)a1 latestUUID:(void *)a2 latestSampleStartTime:(void *)a3 sampleIDsToLookup:(void *)a4 isFinal:(unsigned int)a5 error:(double)a6;
- (void)_deliverEnumerationResults:(uint64_t)a3 isFinal:;
- (void)_deliverError:(void *)a1;
- (void)_deliverQuantitySeries:(uint64_t)a3 seriesAnchor:(uint64_t)a4 isFinal:;
- (void)_queue_start;
- (void)setUnitTest_batchWillDeliver:(id)a3;
- (void)unitTest_setBatchThreshold:(int64_t)a3;
@end

@implementation HDQuantitySeriesSampleQueryServer

- (HDQuantitySeriesSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDQuantitySeriesSampleQueryServer;
  v11 = [(HDQueryServer *)&v21 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 quantitySample];
    sample = v11->_sample;
    v11->_sample = (HKQuantitySample *)v12;

    v11->_lastDatumIndex = [v10 seriesAnchor];
    v11->_mode = [v10 mode];
    v11->_options = [v10 options];
    uint64_t v14 = [v10 maximumStartDate];
    maximumDeliveredStartDate = v11->_maximumDeliveredStartDate;
    v11->_maximumDeliveredStartDate = (NSDate *)v14;

    uint64_t v16 = [v10 latestUUID];
    latestDeliveredUUID = v11->_latestDeliveredUUID;
    v11->_latestDeliveredUUID = (NSUUID *)v16;

    uint64_t v18 = [v10 latestSampleStartDate];
    latestDeliveredSampleStartDate = v11->_latestDeliveredSampleStartDate;
    v11->_latestDeliveredSampleStartDate = (NSDate *)v18;

    v11->_batchThreshold = 400;
  }

  return v11;
}

- (void)unitTest_setBatchThreshold:(int64_t)a3
{
  self->_batchThreshold = a3;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_queue_start
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)HDQuantitySeriesSampleQueryServer;
  [(HDQueryServer *)&v61 _queue_start];
  v3 = [(HDQueryServer *)self quantityType];
  id v60 = 0;
  v4 = [(HDQueryServer *)self readAuthorizationStatusForType:v3 error:&v60];
  id v5 = v60;

  if (!v4)
  {
    -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v5);
    goto LABEL_43;
  }
  if ([v4 canRead])
  {
    int64_t mode = self->_mode;
    if (mode != 1)
    {
      if (!mode)
      {
        if ([(HKQuantitySample *)self->_sample count] == 1)
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F2ADA8]);
          id v8 = objc_alloc_init(MEMORY[0x1E4F2ADB0]);
          v9 = [(HKQuantitySample *)self->_sample quantity];
          id v10 = [(HKQuantitySample *)self->_sample quantity];
          v11 = [v10 _unit];
          [v9 doubleValueForUnit:v11];
          objc_msgSend(v8, "setValue:");

          uint64_t v12 = [(HKQuantitySample *)self->_sample startDate];
          [v12 timeIntervalSinceReferenceDate];
          objc_msgSend(v8, "setTimeInterval:");

          [v7 addValues:v8];
          -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:]((const void **)&self->super.super.isa, v7, self->_lastDatumIndex, 1);
        }
        else
        {
          uint64_t v68 = 0;
          v69 = &v68;
          uint64_t v70 = 0x2020000000;
          char v71 = 1;
          uint64_t v64 = 0;
          v65 = (double *)&v64;
          uint64_t v66 = 0x2020000000;
          uint64_t v67 = 0;
          v85 = 0;
          v86 = &v85;
          uint64_t v87 = 0x3032000000;
          v88 = __Block_byref_object_copy__141;
          v89 = __Block_byref_object_dispose__141;
          id v90 = objc_alloc_init(MEMORY[0x1E4F2ADA8]);
          v27 = [(HKQuantitySample *)self->_sample UUID];
          v28 = [(HDQueryServer *)self profile];
          id v72 = 0;
          v73 = (void *)MEMORY[0x1E4F143A8];
          uint64_t v74 = 3221225472;
          v75 = __65__HDQuantitySeriesSampleQueryServer__queue_startSingleSeriesMode__block_invoke;
          v76 = &unk_1E6305E38;
          v77 = self;
          v78 = &v68;
          v79 = &v64;
          v80 = &v85;
          BOOL v29 = +[HDQuantitySampleSeriesEntity enumerateDataWithIdentifier:v27 profile:v28 error:&v72 handler:&v73];
          id v7 = v72;

          if (v29)
          {
            if (*((unsigned char *)v69 + 24))
            {
              int64_t v30 = *((void *)v65 + 3);
              self->_lastDatumIndex = v30;
              -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:]((const void **)&self->super.super.isa, v86[5], v30, 1);
            }
          }
          else
          {
            -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v7);
          }
          _Block_object_dispose(&v85, 8);

          _Block_object_dispose(&v64, 8);
          _Block_object_dispose(&v68, 8);
        }
        goto LABEL_19;
      }
      goto LABEL_43;
    }
    id v72 = 0;
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
    v15 = [(HDQueryServer *)self quantityType];
    uint64_t v16 = HDSampleEntityPredicateForDataType(v15);
    v17 = [v14 arrayWithObject:v16];

    uint64_t v18 = [(HDQueryServer *)self filter];
    v19 = [(HDQueryServer *)self profile];
    v20 = [v18 predicateWithProfile:v19];

    if (v20) {
      [v17 addObject:v20];
    }
    objc_super v21 = [(HDQueryServer *)self client];
    v22 = [v21 authorizationOracle];
    v23 = [(HDQueryServer *)self objectType];
    v24 = [v22 additionalAuthorizationPredicateForObjectType:v23 error:&v72];

    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v72, 3, @"Unable to determine authorization status.");
      v58 = 0;
LABEL_28:

      id v39 = v72;
      if (v58)
      {
        uint64_t v68 = 0;
        v69 = &v68;
        uint64_t v70 = 0x2020000000;
        char v71 = 1;
        unint64_t options = self->_options;
        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v42 = objc_alloc_init(MEMORY[0x1E4F2ADC0]);
        v56 = v41;
        v85 = 0;
        v86 = &v85;
        uint64_t v87 = 0x3032000000;
        v88 = __Block_byref_object_copy__141;
        v89 = __Block_byref_object_dispose__141;
        id v90 = 0;
        uint64_t v64 = 0;
        v65 = (double *)&v64;
        uint64_t v66 = 0x2020000000;
        uint64_t v67 = 0;
        v43 = [(HDQueryServer *)self profile];
        LOBYTE(v41) = options & 1;
        unint64_t v44 = options & 2;
        id v63 = v39;
        v73 = (void *)MEMORY[0x1E4F143A8];
        uint64_t v74 = 3221225472;
        v75 = __64__HDQuantitySeriesSampleQueryServer__queue_startEnumerationMode__block_invoke;
        v76 = &unk_1E6305E60;
        v77 = self;
        v80 = (void **)&v68;
        char v83 = v44 >> 1;
        v45 = (uint64_t *)v42;
        v78 = v45;
        v81 = &v85;
        v82 = &v64;
        v57 = v56;
        v79 = v57;
        char v84 = (char)v41;
        v46 = &v73;
        id v47 = v43;
        id v48 = v58;
        self;
        if (v44) {
          BOOL v49 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesBySeriesForPredicate:v48 profile:v47 options:3 error:&v63 handler:v46];
        }
        else {
          BOOL v49 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v48 profile:v47 options:0 error:&v63 handler:v46];
        }
        BOOL v50 = v49;

        id v51 = v63;
        if (!v50) {
          -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v51);
        }
        if (*((unsigned char *)v69 + 24))
        {
          v52 = v86[5];
          double v53 = v65[3];
          id v62 = v51;
          char v54 = -[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:latestUUID:latestSampleStartTime:sampleIDsToLookup:isFinal:error:]((uint64_t)self, v45, v52, v57, 1u, v53);
          id v39 = v62;

          if ((v54 & 1) == 0) {
            -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v39);
          }
        }
        else
        {
          id v39 = v51;
        }

        _Block_object_dispose(&v64, 8);
        _Block_object_dispose(&v85, 8);

        _Block_object_dispose(&v68, 8);
      }
      else
      {
        -[HDQuantitySeriesSampleQueryServer _deliverError:](self, v39);
      }

      goto LABEL_43;
    }
    [v17 addObject:v24];
    unint64_t v25 = 0x1E4F65000;
    if ((self->_options & 2) != 0)
    {
      if (self->_latestDeliveredSampleStartDate)
      {
        v26 = HDSampleEntityPredicateForStartDate(1);
        v31 = (void *)MEMORY[0x1E4F65D00];
        v32 = _HDSQLiteValueForUUID();
        v59 = [v31 predicateWithProperty:@"uuid" greaterThanOrEqualToValue:v32];

        v33 = (void *)MEMORY[0x1E4F65D08];
        v73 = v26;
        uint64_t v74 = (uint64_t)v59;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:2];
        v55 = [v33 predicateMatchingAllPredicates:v34];

        v35 = HDSampleEntityPredicateForStartDate(5);
        v36 = (void *)MEMORY[0x1E4F65D08];
        v85 = v35;
        v86 = v55;
        v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:2];
        v38 = [v36 predicateMatchingAnyPredicates:v37];

        [v17 addObject:v38];
        goto LABEL_26;
      }
    }
    else if (self->_maximumDeliveredStartDate)
    {
      v26 = HDSampleEntityPredicateForEndDate(6);
      [v17 addObject:v26];
LABEL_26:

      unint64_t v25 = 0x1E4F65000uLL;
    }
    v58 = [*(id *)(v25 + 3336) predicateMatchingAllPredicates:v17];
    goto LABEL_28;
  }
  if (self)
  {
    int64_t v13 = self->_mode;
    if (v13 == 1)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F2ADC0]);
      -[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:isFinal:]((const void **)&self->super.super.isa, v7, 1);
    }
    else
    {
      if (v13) {
        goto LABEL_43;
      }
      id v7 = objc_alloc_init(MEMORY[0x1E4F2ADA8]);
      -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:]((const void **)&self->super.super.isa, v7, self->_lastDatumIndex, 1);
    }
LABEL_19:
  }
LABEL_43:
}

- (void)_deliverError:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[HDQuantitySeriesSampleQueryServer _clientProxy](a1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [a1 queryUUID];
    objc_msgSend(v5, "client_deliverError:forQuery:", v3, v4);
  }
}

- (id)_clientProxy
{
  v2 = [a1 client];
  id v3 = [v2 connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__HDQuantitySeriesSampleQueryServer__clientProxy__block_invoke;
  v6[3] = &unk_1E62F3170;
  v6[4] = a1;
  v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

- (void)_deliverQuantitySeries:(uint64_t)a3 seriesAnchor:(uint64_t)a4 isFinal:
{
  id v7 = a2;
  if (a1)
  {
    id v12 = v7;
    id v8 = -[HDQuantitySeriesSampleQueryServer _clientProxy](a1);
    v9 = [a1 queryUUID];
    id v10 = _Block_copy(a1[33]);
    v11 = v10;
    if (v10) {
      (*((void (**)(void *, const void **))v10 + 2))(v10, a1);
    }
    objc_msgSend(v8, "client_deliverQuantitySeries:seriesAnchor:isFinal:query:", v12, a3, a4, v9);

    id v7 = v12;
  }
}

- (void)_deliverEnumerationResults:(uint64_t)a3 isFinal:
{
  id v9 = a2;
  id v5 = -[HDQuantitySeriesSampleQueryServer _clientProxy](a1);
  v6 = [a1 queryUUID];
  id v7 = _Block_copy(a1[33]);
  id v8 = v7;
  if (v7) {
    (*((void (**)(void *, const void **))v7 + 2))(v7, a1);
  }
  objc_msgSend(v5, "client_deliverEnumerationResults:isFinal:query:", v9, a3, v6);
}

void __49__HDQuantitySeriesSampleQueryServer__clientProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error during XPC call to client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __65__HDQuantitySeriesSampleQueryServer__queue_startSingleSeriesMode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) != 0
    || [*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    uint64_t v4 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(*(void *)(a1 + 32) + 216))
    {
      uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) values];
      unint64_t v6 = [v5 count];
      unint64_t v7 = *(void *)(*(void *)(a1 + 32) + 208);

      if (v6 >= v7)
      {
        *(void *)(*(void *)(a1 + 32) + 216) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        -[HDQuantitySeriesSampleQueryServer _deliverQuantitySeries:seriesAnchor:isFinal:](*(const void ***)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(*(void *)(a1 + 32) + 216), 0);
        id v8 = objc_alloc_init(MEMORY[0x1E4F2ADA8]);
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addValues:v3];
    }
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __64__HDQuantitySeriesSampleQueryServer__queue_startEnumerationMode__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) == 0
    && ![*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    v23 = (void *)MEMORY[0x1E4F2B8E8];
    v24 = [*(id *)(a1 + 32) filter];
    LODWORD(v23) = [v23 filter:v24 acceptsDataObjectWithStartTimestamp:a6 endTimestamp:a7 valueInCanonicalUnit:a5];

    if (!v23) {
      return 1;
    }
    unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a9];
    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 240);
    v28 = *(void **)(v26 + 248);
    int v29 = *(unsigned __int8 *)(a1 + 80);
    id obj = v25;
    id v30 = v25;
    id v31 = v27;
    id v32 = v28;
    self;
    if (v31)
    {
      [v31 timeIntervalSinceReferenceDate];
      double v34 = v33;
      if (v29)
      {
LABEL_8:
        if (v34 >= a6 && ([v30 isEqual:v32] & 1) != 0)
        {
LABEL_25:

          unint64_t v44 = v30;
          goto LABEL_26;
        }
LABEL_17:

        v37 = [*(id *)(a1 + 40) results];
        unint64_t v38 = [v37 count];
        unint64_t v39 = *(void *)(*(void *)(a1 + 32) + 208);

        if (v38 >= v39)
        {
          uint64_t v21 = 0;
          if (!-[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:latestUUID:latestSampleStartTime:sampleIDsToLookup:isFinal:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void **)(a1 + 48), 0, *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)))
          {
LABEL_28:

            return v21;
          }
          [*(id *)(a1 + 48) removeAllObjects];
          v40 = [*(id *)(a1 + 40) results];
          [v40 removeAllObjects];

          uint64_t v41 = *(void *)(*(void *)(a1 + 64) + 8);
          id v42 = *(void **)(v41 + 40);
          *(void *)(v41 + 40) = 0;
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), obj);
        *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a3;
        if (*(unsigned char *)(a1 + 81)) {
          id v43 = v30;
        }
        else {
          id v43 = 0;
        }
        unint64_t v44 = [MEMORY[0x1E4F2ADB8] resultWithID:a2 UUID:v43 value:a11 count:a12 startTime:a5 endTime:a6 seriesIndex:a7];
        [*(id *)(a1 + 40) addResults:v44];
        if (!*(unsigned char *)(a1 + 81))
        {
LABEL_27:

          uint64_t v21 = 1;
          goto LABEL_28;
        }
        v45 = *(void **)(a1 + 48);
        id v31 = [NSNumber numberWithLongLong:a2];
        [v45 addObject:v31];
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      v35 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v35 timeIntervalSinceReferenceDate];
      double v34 = v36;

      if (v29) {
        goto LABEL_8;
      }
    }
    if (v34 > a6 || v32 && v34 == a6 && objc_msgSend(v30, "hk_compare:", v32) != 1) {
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  uint64_t v21 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  return v21;
}

- (uint64_t)_deliverEnumerationResults:(uint64_t)a1 latestUUID:(void *)a2 latestSampleStartTime:(void *)a3 sampleIDsToLookup:(void *)a4 isFinal:(unsigned int)a5 error:(double)a6
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (!a1) {
    goto LABEL_5;
  }
  int64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v14 = [v10 results];
  v15 = [v14 lastObject];
  [v15 startTime];
  uint64_t v16 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v17 = *(void **)(a1 + 240);
  *(void *)(a1 + 240) = v16;

  objc_storeStrong((id *)(a1 + 248), a3);
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a6];
  v19 = *(void **)(a1 + 256);
  *(void *)(a1 + 256) = v18;

  v20 = objc_msgSend(v11, "hk_dataForUUIDBytes");
  uint64_t v21 = [v10 results];
  v22 = [v21 lastObject];
  [v22 setUuid:v20];

  [v10 setLatestSampleStartTime:a6];
  if (![v12 count]
    || (id v27 = v12,
        id v28 = v10,
        int v23 = HKWithAutoreleasePool(),
        v28,
        v27,
        v23))
  {
    -[HDQuantitySeriesSampleQueryServer _deliverEnumerationResults:isFinal:]((const void **)a1, v10, a5);
    uint64_t v24 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v24 = 0;
  }

  return v24;
}

uint64_t __129__HDQuantitySeriesSampleQueryServer__deliverEnumerationResults_latestUUID_latestSampleStartTime_sampleIDsToLookup_isFinal_error___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a1[4] newDataEntityEnumerator];
  uint64_t v5 = [a1[5] allObjects];
  unint64_t v6 = HDDataEntityPredicateForRowIDs((uint64_t)v5);
  [v4 setPredicate:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __129__HDQuantitySeriesSampleQueryServer__deliverEnumerationResults_latestUUID_latestSampleStartTime_sampleIDsToLookup_isFinal_error___block_invoke_2;
  v27[3] = &unk_1E6300148;
  id v22 = v7;
  id v28 = v22;
  if ([v4 enumerateWithError:a2 handler:v27])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = [a1[6] results];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v21 = v4;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "persistentID"));
          if (([v8 containsObject:v15] & 1) == 0)
          {
            [v8 addObject:v15];
            uint64_t v16 = [v22 objectForKeyedSubscript:v15];
            uint64_t v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:a2];
            if (!v17)
            {

              uint64_t v19 = 0;
              goto LABEL_15;
            }
            uint64_t v18 = (void *)v17;
            [v14 setQuantitySample:v17];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      uint64_t v19 = 1;
LABEL_15:
      uint64_t v4 = v21;
    }
    else
    {
      uint64_t v19 = 1;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

uint64_t __129__HDQuantitySeriesSampleQueryServer__deliverEnumerationResults_latestUUID_latestSampleStartTime_sampleIDsToLookup_isFinal_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithLongLong:a3];
  [v4 setObject:v6 forKeyedSubscript:v7];

  return 1;
}

- (id)unitTest_batchWillDeliver
{
  return self->_unitTest_batchWillDeliver;
}

- (void)setUnitTest_batchWillDeliver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_batchWillDeliver, 0);
  objc_storeStrong((id *)&self->_latestDeliveredSampleStartDate, 0);
  objc_storeStrong((id *)&self->_latestDeliveredUUID, 0);
  objc_storeStrong((id *)&self->_maximumDeliveredStartDate, 0);

  objc_storeStrong((id *)&self->_sample, 0);
}

@end