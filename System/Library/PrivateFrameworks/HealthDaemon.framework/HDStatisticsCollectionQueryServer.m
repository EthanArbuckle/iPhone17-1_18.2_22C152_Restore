@interface HDStatisticsCollectionQueryServer
+ (BOOL)supportsAnchorBasedAuthorization;
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_shouldListenForUpdates;
- (BOOL)_shouldObserveDatabaseProtectedDataAvailability;
- (HDStatisticsCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSDate)anchorDate;
- (id)_newCachingSessionWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11;
- (id)quantityType;
- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5;
- (id)unitTest_queryServerStatisticsEnumerationHandler;
- (id)unitTest_queryServerUnableToUpdateStatisticsHandler;
- (id)unitTest_queryServerUpdateStatisticsHandler;
- (uint64_t)_queue_accumulateUpdatedStatistics:(void *)a3 accumulatedStatistics:(void *)a4 sendHandler:;
- (unint64_t)statisticsOptions;
- (void)_queue_deliverUpdatedStatistics:(void *)a3 error:;
- (void)_queue_fetchAndDeliverAllStatistics;
- (void)_queue_scheduleUpdate;
- (void)_queue_sendAccumulatedStatistics:(void *)a3 cachedStatistics:(uint64_t)a4 isFinal:(void *)a5 statisticsCount:(unsigned char *)a6 shouldResetStatistics:;
- (void)_queue_start;
- (void)_queue_updateStatistics;
- (void)_queue_useCachedStatistics;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4;
- (void)setUnitTest_queryServerStatisticsEnumerationHandler:(id)a3;
- (void)setUnitTest_queryServerUnableToUpdateStatisticsHandler:(id)a3;
- (void)setUnitTest_queryServerUpdateStatisticsHandler:(id)a3;
@end

@implementation HDStatisticsCollectionQueryServer

- (HDStatisticsCollectionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v52.receiver = self;
  v52.super_class = (Class)HDStatisticsCollectionQueryServer;
  v11 = [(HDQueryServer *)&v52 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (!v11) {
    goto LABEL_14;
  }
  v12 = [v10 intervalComponents];
  v13 = [v12 calendar];

  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v15 = [v10 intervalComponents];
    [v15 setCalendar:v14];
  }
  id v16 = objc_alloc(MEMORY[0x1E4F2B8A8]);
  v17 = [v10 anchorDate];
  v18 = [v10 intervalComponents];
  uint64_t v19 = [v16 initWithAnchorDate:v17 intervalComponents:v18];
  intervalCollection = v11->_intervalCollection;
  v11->_intervalCollection = (_HKDateIntervalCollection *)v19;

  v51.receiver = v11;
  v51.super_class = (Class)HDStatisticsCollectionQueryServer;
  uint64_t v21 = [(HDQueryServer *)&v51 quantityType];
  quantityType = v11->_quantityType;
  v11->_quantityType = (HKQuantityType *)v21;

  if (!v11->_quantityType)
  {
    v23 = [(HDQueryServer *)v11 sampleType];
    int v24 = [v23 conformsToProtocol:&unk_1F1843450];

    if (v24)
    {
      v25 = [(HDQueryServer *)v11 sampleType];
      uint64_t v26 = +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithConfigurationProviding:v25];
      v27 = v11->_quantityType;
      v11->_quantityType = (HKQuantityType *)v26;
    }
    else
    {
      if (v11->_quantityType) {
        goto LABEL_10;
      }
      v28 = [(HDQueryServer *)v11 sampleType];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_10;
      }
      v25 = [(HDQueryServer *)v11 sampleType];
      v27 = [MEMORY[0x1E4F2B618] countUnit];
      uint64_t v49 = +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:v25 aggregationStyle:1 canonicalUnit:v27];
      v50 = v11->_quantityType;
      v11->_quantityType = (HKQuantityType *)v49;
    }
  }
LABEL_10:
  v30 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
  v31 = [(HDQueryServer *)v11 profile];
  uint64_t v32 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)v30 initWithProfile:v31 quantityType:v11->_quantityType];
  sourceOrderProvider = v11->_sourceOrderProvider;
  v11->_sourceOrderProvider = (HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)v32;

  uint64_t v34 = +[HDStatisticsCollectionCalculator calculatorForQuantityType:intervalCollection:options:mergeStrategy:](HDStatisticsCollectionCalculator, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v11->_quantityType, v11->_intervalCollection, [v10 options], objc_msgSend(v10, "mergeStrategy"));
  calculator = v11->_calculator;
  v11->_calculator = (HDStatisticsCollectionCalculator *)v34;

  [(HDStatisticsCollectionCalculator *)v11->_calculator setSourceOrderProvider:v11->_sourceOrderProvider];
  uint64_t v36 = [v10 anchorDate];
  anchorDate = v11->_anchorDate;
  v11->_anchorDate = (NSDate *)v36;

  v11->_unint64_t statisticsOptions = [v10 options];
  v11->_deliversUpdates = [v10 shouldDeactivateAfterInitialResults] ^ 1;
  uint64_t v38 = [v10 dateInterval];
  resultsDateInterval = v11->_resultsDateInterval;
  v11->_resultsDateInterval = (NSDateInterval *)v38;

  v11->_mergeStrategy = [v10 mergeStrategy];
  unint64_t statisticsOptions = v11->_statisticsOptions;
  if ((_HKStatisticsOptionBaselineRelativeQuantities() & statisticsOptions) == 0)
  {
    v41 = [(HDQueryServer *)v11 profile];
    v42 = [v41 daemon];
    v43 = [v42 behavior];
    int v44 = [v43 supportsCachedStatisticsCollectionQueries];

    if (v44)
    {
      v45 = [v10 cacheSettings];
      uint64_t v46 = [v45 copy];
      cacheSettings = v11->_cacheSettings;
      v11->_cacheSettings = (HKStatisticsCollectionCacheSettings *)v46;
    }
  }
  v11->_requiresFetch = 1;
LABEL_14:

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  self;
  uint64_t v11 = [v10 options];
  if ((_HKStatisticsOptionPercentile() & v11) != 0
    || (uint64_t v12 = [v10 options], (_HKStatisticsOptionPresence() & v12) != 0)
    || (uint64_t v13 = [v10 options], (_HKStatisticOptionsAverageSampleDuration() & v13) != 0)
    || (uint64_t v14 = [v10 options], (_HKStatisticsOptionBaselineRelativeQuantities() & v14) != 0)
    || (uint64_t v15 = [v10 options], (_HKStatisticsOptionSleepStages() & v15) != 0))
  {
  }
  else
  {
    v27 = [v10 objectType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
LABEL_8:
      uint64_t v16 = [v10 options];
      if ((_HKStatisticsOptionBaselineRelativeQuantities() & v16) != 0)
      {
        v17 = [v10 objectType];
        objc_opt_class();
        char v18 = objc_opt_isKindOfClass();

        if ((v18 & 1) == 0)
        {
          uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
          v22 = @"Only quantity types are supported for baseline relative calculations";
LABEL_15:
          objc_msgSend(v21, "hk_assignError:code:format:", a5, 3, v22);
          goto LABEL_16;
        }
        uint64_t v19 = [v10 objectType];
        if (([v19 _supportsRelativeDataCalculation] & 1) == 0)
        {
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = [v19 identifier];
          objc_msgSend(v25, "hk_assignError:code:format:", a5, 3, @"%@ does not support baseline relative calculations", v26);

          goto LABEL_16;
        }
      }
      uint64_t v20 = [v10 options];
      if ((_HKStatisticsOptionSleepStages() & v20) == 0)
      {
        v29.receiver = a1;
        v29.super_class = (Class)&OBJC_METACLASS___HDStatisticsCollectionQueryServer;
        unsigned __int8 v23 = objc_msgSendSuper2(&v29, sel_validateConfiguration_client_error_, v10, v9, a5);
        goto LABEL_17;
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      v22 = @"This statistics option is currently only intended to be used via HDStatisticsCalculator directly.";
      goto LABEL_15;
    }
  }
  if ([v9 hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:a5]) {
    goto LABEL_8;
  }
LABEL_16:
  unsigned __int8 v23 = 0;
LABEL_17:

  return v23;
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (BOOL)_shouldListenForUpdates
{
  return self->_deliversUpdates;
}

- (void)_queue_start
{
  v3.receiver = self;
  v3.super_class = (Class)HDStatisticsCollectionQueryServer;
  [(HDQueryServer *)&v3 _queue_start];
  if (self->_requiresFetch)
  {
    -[HDStatisticsCollectionQueryServer _queue_fetchAndDeliverAllStatistics]((uint64_t)self);
  }
  else if ([(NSMutableDictionary *)self->_pendingQuantitiesBySeries count])
  {
    -[HDStatisticsCollectionQueryServer _queue_updateStatistics]((uint64_t)self);
  }
}

- (void)_queue_fetchAndDeliverAllStatistics
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [(id)a1 queryQueue];
    dispatch_assert_queue_V2(v2);

    if (([(id)a1 _shouldStopProcessingQuery] & 1) == 0)
    {
      v86 = [(id)a1 clientProxy];
      v108[0] = 0;
      v108[1] = v108;
      v108[2] = 0x2020000000;
      char v109 = 1;
      objc_super v3 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = 0;

      v4 = [(id)a1 sampleType];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v6 = [(id)a1 profile];
        v7 = [v6 dataManager];
        id v8 = [v7 quantitySeriesManager];
        id v9 = [(id)a1 quantityType];
        [v8 removeObserver:a1 forType:v9];
      }
      id v10 = [(id)a1 sampleType];
      id v107 = 0;
      uint64_t v11 = [(id)a1 readAuthorizationStatusForType:v10 error:&v107];
      id v87 = v107;

      if (!v11)
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v87;
          _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status; skipping statistics fetch: %{public}@",
            buf,
            0xCu);
        }
        goto LABEL_41;
      }
      if (([v11 canRead] & 1) == 0)
      {
        char v18 = [(id)a1 queryUUID];
        objc_msgSend(v86, "client_deliverStatisticsBatch:resetStatistics:isFinal:anchor:query:", MEMORY[0x1E4F1CBF0], 1, 1, 0, v18);

LABEL_41:
        _Block_object_dispose(v108, 8);

        return;
      }
      uint64_t v12 = [(id)a1 filter];
      if (v12)
      {
        uint64_t v13 = [(id)a1 profile];
        uint64_t v14 = [v12 predicateWithProfile:v13];

        if (!v14)
        {
          id v85 = [(id)a1 clientProxy];
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__queue_fetchAndDeliverAllStatistics, @"Error building predicate for query"");
          uint64_t v16 = [(id)a1 queryUUID];
          objc_msgSend(v85, "client_deliverError:forQuery:", v15, v16);

LABEL_40:
          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v19 = (void *)MEMORY[0x1E4F65D08];
      uint64_t v20 = [v11 authorizationPredicate];
      uint64_t v21 = [v19 compoundPredicateWithPredicate:v14 otherPredicate:v20];

      v22 = [v11 restrictedSourceEntities];
      id v85 = v21;
      id v23 = v22;
      id v83 = v12;
      uint64_t v24 = *(void *)(a1 + 304);
      if ((_HKStatisticsOptionBaselineRelativeQuantities() & v24) != 0)
      {
        v25 = [HDStatisticsCollectionCalculatorRelativeDataSource alloc];
        uint64_t v26 = [(id)a1 profile];
        v27 = [(id)a1 quantityType];
        v28 = [(id)a1 quantityType];
        objc_super v29 = HKRollingBaselineConfigurationForQuantityType();
        v30 = [MEMORY[0x1E4F1C9C8] date];
        id v31 = [(HDStatisticsCollectionCalculatorRelativeDataSource *)v25 initForProfile:v26 quantityType:v27 predicate:v85 restrictedSourceEntities:v23 configuration:v29 currentDate:v30];
      }
      else
      {
        uint64_t v32 = *(void *)(a1 + 304);
        if ((_HKStatisticsOptionAttenuateSamples() & v32) == 0) {
          goto LABEL_19;
        }
        v33 = [(id)a1 quantityType];
        uint64_t v34 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7F0]];
        int v35 = [v33 isEqual:v34];

        if (!v35) {
          goto LABEL_19;
        }
        uint64_t v36 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:272];
        v37 = [HDStatisticsCollectionCalculatorAttenuatedDataSource alloc];
        uint64_t v38 = [(id)a1 profile];
        v39 = [(id)a1 quantityType];
        id v31 = [(HDStatisticsCollectionCalculatorAttenuatedDataSource *)v37 initForProfile:v38 quantityType:v39 predicate:v85 restrictedSourceEntities:v23 attenuationType:v36];

        if (!v31)
        {
LABEL_19:
          v40 = [HDStatisticsCollectionCalculatorDefaultDataSource alloc];
          v41 = [(id)a1 profile];
          v42 = [(id)a1 quantityType];
          id v31 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)v40 initForProfile:v41 quantityType:v42 predicate:v85 restrictedSourceEntities:v23];
        }
        [v31 setIncludeUnfrozenSeries:1];
        [v31 setFilter:v83];
        [v31 setShouldContinueFrequency:1];
      }

      v43 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v31;

      [*(id *)(a1 + 224) setDataSource:*(void *)(a1 + 208)];
      [*(id *)(a1 + 224) reset];
      objc_initWeak(&location, (id)a1);
      v105[0] = 0;
      v105[1] = v105;
      v105[2] = 0x2020000000;
      v105[3] = 0;
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke;
      aBlock[3] = &unk_1E6307578;
      objc_copyWeak(&v104, &location);
      id v45 = v44;
      id v101 = v45;
      v102 = v105;
      v103 = v108;
      uint64_t v46 = _Block_copy(aBlock);
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_2;
      v96[3] = &unk_1E63075A0;
      objc_copyWeak(&v99, &location);
      id v81 = v45;
      id v97 = v81;
      id v82 = v46;
      id v98 = v82;
      [*(id *)(a1 + 224) setStatisticsHandler:v96];
      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x2020000000;
      char v95 = 0;
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_3;
      v92[3] = &unk_1E63075C8;
      objc_copyWeak(&v93, &location);
      v92[4] = v94;
      [*(id *)(a1 + 208) setShouldContinueHandler:v92];
      [(id)a1 setDataCount:0];
      if (*(void *)(a1 + 272))
      {
        _HKInitializeLogging();
        v47 = (void *)*MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
        {
          v48 = v47;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v77 = [*(id *)(a1 + 272) identifier];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v77;
            _os_log_debug_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_DEBUG, "%{public}@ Using cached statistics for %@.", buf, 0x16u);
          }
        }
        [v11 restrictedSourceEntities];
        id v91 = v87;
        id v84 = (id)objc_claimAutoreleasedReturnValue();
        id v49 = v85;
        v50 = [(id)a1 queryQueue];
        dispatch_assert_queue_V2(v50);

        objc_super v51 = [HDQueryDescriptor alloc];
        objc_super v52 = (void *)MEMORY[0x1E4F1CAD0];
        v53 = [(id)a1 quantityType];
        v54 = [v52 setWithObject:v53];
        v80 = [(HDQueryDescriptor *)v51 initWithSampleTypes:v54 encodingOptions:0 restrictedSourceEntities:v84 authorizationFilter:0 samplePredicate:v49];

        v55 = [(id)a1 profile];
        v56 = [v55 sourceManager];
        v57 = [v56 localDeviceSourceWithError:&v91];

        if (v57)
        {
          v58 = [*(id *)(a1 + 200) intervalComponents];
          v59 = (void *)[v58 copy];

          v60 = [(id)a1 profile];
          v61 = [*(id *)(a1 + 272) identifier];
          uint64_t v79 = objc_opt_class();
          uint64_t v62 = *(void *)(a1 + 256);
          v63 = v12;
          uint64_t v64 = *(void *)(a1 + 296);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __103__HDStatisticsCollectionQueryServer__queue_cachingSessionWithPredicate_restrictedSourceEntities_error___block_invoke;
          v111 = &unk_1E62F6108;
          id v112 = v59;
          id v65 = v59;
          uint64_t v78 = v64;
          uint64_t v12 = v63;
          uint64_t v66 = [(id)a1 _newCachingSessionWithProfile:v60 cachingIdentifier:v61 sourceEntity:v57 queryDescriptor:v80 cachedClass:v79 queryInterval:v62 anchorDate:v78 intervalComponents:v65 timeIntervalToBucketIndex:buf];
        }
        else
        {
          uint64_t v66 = 0;
        }

        id v67 = v91;
        v68 = *(void **)(a1 + 280);
        *(void *)(a1 + 280) = v66;

        v69 = *(void **)(a1 + 280);
        if (!v69)
        {
          v76 = [(id)a1 queryUUID];
          objc_msgSend(v86, "client_deliverError:forQuery:", v67, v76);

          id v87 = v67;
          goto LABEL_39;
        }
        id v90 = v67;
        uint64_t v70 = [v69 cachesExistWithError:&v90];
        id v87 = v90;

        if (v70 == 1)
        {
          -[HDStatisticsCollectionQueryServer _queue_useCachedStatistics](a1);
          goto LABEL_39;
        }
        if (!v70)
        {
          v71 = [(id)a1 queryUUID];
          objc_msgSend(v86, "client_deliverError:forQuery:", v87, v71);

LABEL_39:
          objc_destroyWeak(&v93);
          _Block_object_dispose(v94, 8);

          objc_destroyWeak(&v99);
          objc_destroyWeak(&v104);

          _Block_object_dispose(v105, 8);
          objc_destroyWeak(&location);
          goto LABEL_40;
        }
      }

      v72 = [(id)a1 profile];
      v73 = [v72 database];
      v88[4] = a1;
      id v89 = 0;
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_380;
      v88[3] = &unk_1E62F6130;
      BOOL v74 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v73 error:&v89 block:v88];
      id v87 = v89;

      if (v74)
      {
        *(unsigned char *)(a1 + 241) = 0;
        (*((void (**)(id, uint64_t))v82 + 2))(v82, 1);
      }
      else if ((objc_msgSend(v87, "hk_isHealthKitErrorWithCode:", 128) & 1) == 0)
      {
        v75 = [(id)a1 queryUUID];
        objc_msgSend(v86, "client_deliverError:forQuery:", v87, v75);
      }
      goto LABEL_39;
    }
  }
}

- (void)_queue_updateStatistics
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [(id)a1 queryQueue];
    dispatch_assert_queue_V2(v2);

    *(unsigned char *)(a1 + 240) = 0;
    if ([*(id *)(a1 + 232) count])
    {
      objc_super v3 = _Block_copy(*(const void **)(a1 + 320));
      v4 = v3;
      if (v3) {
        (*((void (**)(void *, uint64_t))v3 + 2))(v3, a1);
      }
      v5 = [(id)a1 sampleType];
      id v33 = 0;
      v6 = [(id)a1 readAuthorizationStatusForType:v5 error:&v33];
      id v7 = v33;

      if (v6)
      {
        if ([v6 canRead])
        {
          id v8 = [v6 restrictedSourceEntities];
          [*(id *)(a1 + 208) setRestrictedSourceEntities:v8];

          objc_initWeak(&location, (id)a1);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke;
          v30[3] = &unk_1E6307550;
          objc_copyWeak(&v31, &location);
          [*(id *)(a1 + 224) setStatisticsHandler:v30];

          id v29 = 0;
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v10 = [(id)a1 client];
          uint64_t v11 = [v10 authorizationOracle];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __75__HDStatisticsCollectionQueryServer__queue_filteredPendingSeriesWithError___block_invoke;
          int v35 = &unk_1E6307528;
          uint64_t v36 = a1;
          id v37 = v9;
          id v12 = v9;
          LODWORD(v9) = [v11 performReadAuthorizationTransactionWithError:&v29 handler:buf];

          if (v9) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 0;
          }
          id v14 = v13;

          id v7 = v29;
          if (v14)
          {
            if ([v14 count])
            {
              uint64_t v15 = [(id)a1 quantityType];
              uint64_t v16 = [(id)v15 canonicalUnit];

              v17 = *(void **)(a1 + 224);
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke_363;
              v25[3] = &unk_1E62F9F48;
              id v26 = v14;
              uint64_t v27 = a1;
              id v18 = v16;
              id v28 = v18;
              id v24 = 0;
              LOBYTE(v15) = [v17 performAddSampleTransaction:v25 error:&v24];
              id v7 = v24;
              [*(id *)(a1 + 224) setStatisticsHandler:0];
              if ((v15 & 1) == 0)
              {
                if (objc_msgSend(v7, "hk_isDatabaseAccessibilityError"))
                {
                  _HKInitializeLogging();
                  uint64_t v19 = *MEMORY[0x1E4F29F90];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(void *)&buf[4] = a1;
                    _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_INFO, "%{public}@: unable to update statistics because of database accessibility error", buf, 0xCu);
                  }
                  *(unsigned char *)(a1 + 240) = 1;
                  uint64_t v20 = _Block_copy(*(const void **)(a1 + 328));
                  uint64_t v21 = v20;
                  if (v20) {
                    (*((void (**)(void *, uint64_t))v20 + 2))(v20, a1);
                  }
                }
                else
                {
                  -[HDStatisticsCollectionQueryServer _queue_deliverUpdatedStatistics:error:]((void *)a1, 0, v7);
                }
              }
              if (!*(unsigned char *)(a1 + 240)) {
                [*(id *)(a1 + 232) removeAllObjects];
              }
            }
          }
          else
          {
            _HKInitializeLogging();
            id v23 = *MEMORY[0x1E4F29F90];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v7;
              _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", buf, 0x16u);
            }
          }

          objc_destroyWeak(&v31);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v7;
          _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status; ignoring statistics update: %{public}@",
            buf,
            0xCu);
        }
      }
    }
  }
}

- (BOOL)_shouldObserveDatabaseProtectedDataAvailability
{
  return 1;
}

- (void)_queue_scheduleUpdate
{
  if (a1
    && ([*(id *)(a1 + 232) count] || *(unsigned char *)(a1 + 241))
    && !*(unsigned char *)(a1 + 242)
    && ([(id)a1 _shouldSuspendQuery] & 1) == 0)
  {
    *(unsigned char *)(a1 + 242) = 1;
    objc_initWeak(&location, (id)a1);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __58__HDStatisticsCollectionQueryServer__queue_scheduleUpdate__block_invoke;
    v2[3] = &unk_1E62F6BD0;
    objc_copyWeak(&v3, &location);
    [(id)a1 scheduleDatabaseAccessOnQueueWithBlock:v2];
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __58__HDStatisticsCollectionQueryServer__queue_scheduleUpdate__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[242] = 0;
    v2 = WeakRetained;
    if (WeakRetained[241]) {
      -[HDStatisticsCollectionQueryServer _queue_fetchAndDeliverAllStatistics]((uint64_t)WeakRetained);
    }
    else {
      -[HDStatisticsCollectionQueryServer _queue_updateStatistics]((uint64_t)WeakRetained);
    }
    WeakRetained = v2;
  }
}

- (id)quantityType
{
  return self->_quantityType;
}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  id v7 = [(HDQueryServer *)self queryQueue];
  dispatch_assert_queue_V2(v7);

  if (a4)
  {
    id v8 = 0;
  }
  else
  {
    if (!self->_pendingQuantitiesBySeries)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      pendingQuantitiesBySeries = self->_pendingQuantitiesBySeries;
      self->_pendingQuantitiesBySeries = v9;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HDStatisticsCollectionQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
    aBlock[3] = &unk_1E6307500;
    void aBlock[4] = self;
    id v8 = _Block_copy(aBlock);
  }

  return v8;
}

void __98__HDStatisticsCollectionQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  id v64 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = [*(id *)(a1 + 32) queryQueue];
  dispatch_assert_queue_V2(v17);

  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) == 0)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = v64;
    id v61 = v13;
    id v62 = v14;
    id v63 = v15;
    id v60 = v16;
    if (v18)
    {
      uint64_t v20 = *(void *)(v18 + 304);
      if ((_HKStatisticsOptionBaselineRelativeQuantities() & v20) != 0)
      {
        *(unsigned char *)(v18 + 241) = 1;
      }
      else
      {
        uint64_t v21 = [(id)v18 filter];
        v59 = v21;
        if (!v21) {
          goto LABEL_32;
        }
        int v22 = [v21 acceptsDataObject:v63];
        id v23 = v59;
        if (v22)
        {
          v53 = (void *)MEMORY[0x1E4F2B8E8];
          v55 = [v62 startDate];
          [v55 timeIntervalSinceReferenceDate];
          double v25 = v24;
          objc_super v52 = [v62 startDate];
          [v52 timeIntervalSinceReferenceDate];
          double v27 = v26;
          [v62 duration];
          double v29 = v27 + v28;
          [v61 canonicalUnit];
          int v57 = a7;
          id v31 = v30 = v19;
          [v30 doubleValueForUnit:v31];
          int v33 = [v53 filter:v59 acceptsDataObjectWithStartTimestamp:v25 endTimestamp:v29 valueInCanonicalUnit:v32];

          id v19 = v30;
          a7 = v57;

          id v23 = v59;
          if (v33)
          {
LABEL_32:
            if ([(id)v18 _shouldSuspendQuery])
            {
              *(unsigned char *)(v18 + 241) = 1;
            }
            else
            {
              int v58 = a7;
              v56 = v19;
              uint64_t v54 = [*(id *)(v18 + 232) objectForKeyedSubscript:v63];
              if (v54) {
                goto LABEL_15;
              }
              uint64_t v34 = [_HDStatisticsCollectionQueryPendingSeries alloc];
              id v35 = v63;
              id v36 = v60;
              if (v34)
              {
                v65.receiver = v34;
                v65.super_class = (Class)_HDStatisticsCollectionQueryPendingSeries;
                id v37 = (_HDStatisticsCollectionQueryPendingSeries *)objc_msgSendSuper2(&v65, sel_init);
                uint64_t v34 = v37;
                if (v37)
                {
                  objc_storeStrong((id *)&v37->_series, a5);
                  uint64_t v38 = [v36 copy];
                  anchor = v34->_anchor;
                  v34->_anchor = (NSNumber *)v38;

                  v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  quantities = v34->_quantities;
                  v34->_quantities = v40;
                }
              }

              [*(id *)(v18 + 232) setObject:v34 forKeyedSubscript:v35];
              uint64_t v54 = (uint64_t)v34;
              if (v34)
              {
LABEL_15:
                id v42 = v62;
                id v43 = v56;
                id v44 = [_HDStatisticsCollectionQueryPendingQuantity alloc];
                id v45 = v43;
                id v46 = v42;
                if (v44)
                {
                  v65.receiver = v44;
                  v65.super_class = (Class)_HDStatisticsCollectionQueryPendingQuantity;
                  id v44 = (_HDStatisticsCollectionQueryPendingQuantity *)objc_msgSendSuper2(&v65, sel_init);
                  v47 = (id *)v54;
                  if (v44)
                  {
                    uint64_t v48 = [v45 copy];
                    quantity = v44->_quantity;
                    v44->_quantity = (HKQuantity *)v48;

                    uint64_t v50 = [v46 copy];
                    dateInterval = v44->_dateInterval;
                    v44->_dateInterval = (NSDateInterval *)v50;
                  }
                  id v19 = v56;
                }
                else
                {
                  v47 = (id *)v54;
                  id v19 = v56;
                }

                [v47[3] addObject:v44];
              }
              else
              {
                v47 = 0;
                id v19 = v56;
              }
              a7 = v58;
            }
            id v23 = v59;
          }
        }
      }
    }

    if (a7) {
      -[HDStatisticsCollectionQueryServer _queue_scheduleUpdate](*(void *)(a1 + 32));
    }
  }
}

- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4
{
  v5 = [(HDQueryServer *)self queryQueue];
  dispatch_assert_queue_V2(v5);

  self->_requiresFetch = 1;

  -[HDStatisticsCollectionQueryServer _queue_scheduleUpdate]((uint64_t)self);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HDQueryServer *)self queryQueue];
  dispatch_assert_queue_V2(v7);

  v8.receiver = self;
  v8.super_class = (Class)HDStatisticsCollectionQueryServer;
  [(HDQueryServer *)&v8 database:v6 protectedDataDidBecomeAvailable:v4];

  if (v4
    && ![(HDQueryServer *)self _shouldStopProcessingQuery]
    && self->_addedSamplesRequireProtectedData)
  {
    -[HDStatisticsCollectionQueryServer _queue_scheduleUpdate]((uint64_t)self);
  }
}

uint64_t __75__HDStatisticsCollectionQueryServer__queue_filteredPendingSeriesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v21 = a1;
  id obj = [*(id *)(*(void *)(a1 + 32) + 232) allValues];
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v20 = a3;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        if (v10)
        {
          id v11 = *(id *)(v10 + 8);
          id v12 = *(void **)(v10 + 16);
        }
        else
        {
          id v11 = 0;
          id v12 = 0;
        }
        id v23 = 0;
        id v13 = (uint64_t (*)(void *, id, id, id *))v5[2];
        id v14 = v12;
        int v15 = v13(v5, v11, v14, &v23);
        id v16 = v23;

        if (v15)
        {
          [*(id *)(v21 + 40) addObject:v10];
        }
        else if (v16)
        {
          if (v20) {
            *uint64_t v20 = v16;
          }
          else {
            _HKLogDroppedError();
          }

          uint64_t v18 = 0;
          goto LABEL_20;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v7 = v17;
      if (v17) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 1;
LABEL_20:

  return v18;
}

void __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  -[HDStatisticsCollectionQueryServer _queue_deliverUpdatedStatistics:error:](WeakRetained, v4, 0);
}

- (void)_queue_deliverUpdatedStatistics:(void *)a3 error:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [a1 queryQueue];
    dispatch_assert_queue_V2(v6);

    uint64_t v7 = [a1 clientProxy];
    if (v5)
    {
      uint64_t v8 = [a1 queryUUID];
      objc_msgSend(v7, "client_deliverError:forQuery:", v5, v8);
    }
    else
    {
      if (!v9)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v8 = [a1 queryUUID];
      objc_msgSend(v7, "client_deliverUpdatedStatistics:anchor:query:", v9, 0, v8);
    }

    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __60__HDStatisticsCollectionQueryServer__queue_updateStatistics__block_invoke_363(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v36 = [v3 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v36)
  {
    uint64_t v4 = *(void *)v51;
    uint64_t v38 = v3;
    uint64_t v40 = v2;
    uint64_t v35 = *(void *)v51;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v51 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v6 = *(void *)(*((void *)&v50 + 1) + 8 * v5);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v37 = v5;
        if (v6) {
          uint64_t v7 = *(void **)(v6 + 24);
        }
        else {
          uint64_t v7 = 0;
        }
        id obj = v7;
        uint64_t v44 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v44)
        {
          uint64_t v41 = v6;
          uint64_t v42 = *(void *)v47;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v47 != v42) {
                objc_enumerationMutation(obj);
              }
              uint64_t v9 = *(void *)(*((void *)&v46 + 1) + 8 * v8);
              uint64_t v10 = *(void **)(*(void *)(v2 + 40) + 224);
              if (v9) {
                id v11 = *(void **)(v9 + 8);
              }
              else {
                id v11 = 0;
              }
              id v12 = v11;
              [v12 doubleValueForUnit:*(void *)(v2 + 48)];
              double v14 = v13;
              if (v9) {
                int v15 = *(void **)(v9 + 16);
              }
              else {
                int v15 = 0;
              }
              id v16 = v15;
              uint64_t v17 = [v16 startDate];
              [v17 timeIntervalSinceReferenceDate];
              double v19 = v18;
              id v45 = v12;
              if (v9) {
                uint64_t v20 = *(void **)(v9 + 16);
              }
              else {
                uint64_t v20 = 0;
              }
              id v21 = v20;
              int v22 = [v21 endDate];
              [v22 timeIntervalSinceReferenceDate];
              double v24 = v23;
              if (v6) {
                long long v25 = *(void **)(v6 + 8);
              }
              else {
                long long v25 = 0;
              }
              id v26 = v25;
              long long v27 = [v26 sourceRevision];
              double v28 = [v27 source];
              uint64_t v29 = [v28 _sourceID];
              int v30 = objc_msgSend(v10, "addSampleValue:startTime:endTime:sourceID:error:", objc_msgSend(v29, "longLongValue"), a2, v14, v19, v24);

              if (!v30)
              {

                uint64_t v33 = 0;
                id v3 = v38;
                goto LABEL_36;
              }
              ++v8;
              uint64_t v2 = v40;
              uint64_t v6 = v41;
            }
            while (v44 != v8);
            uint64_t v31 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
            uint64_t v44 = v31;
          }
          while (v31);
        }

        uint64_t v5 = v37 + 1;
        id v3 = v38;
        uint64_t v4 = v35;
      }
      while (v37 + 1 != v36);
      uint64_t v32 = [v38 countByEnumeratingWithState:&v50 objects:v55 count:16];
      uint64_t v33 = 1;
      uint64_t v36 = v32;
    }
    while (v32);
  }
  else
  {
    uint64_t v33 = 1;
  }
LABEL_36:

  return v33;
}

- (void)_queue_sendAccumulatedStatistics:(void *)a3 cachedStatistics:(uint64_t)a4 isFinal:(void *)a5 statisticsCount:(unsigned char *)a6 shouldResetStatistics:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  if (a1)
  {
    id v12 = [(id)a1 clientProxy];
    double v13 = *(void **)(a1 + 272);
    if (v13)
    {
      uint64_t v34 = a5;
      uint64_t v14 = [v13 identifier];
      _HKInitializeLogging();
      int v15 = (void *)*MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = v15;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v11 count];
        *(_WORD *)&buf[22] = 2112;
        uint64_t v41 = (void *)v14;
        _os_log_debug_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ Updating %lu cached statistics for %@.", buf, 0x20u);
      }
      id v16 = v11;
      uint64_t v17 = (void *)v14;
      double v18 = [*(id *)(a1 + 208) maxRowID];
      uint64_t v33 = v16;
      id v19 = v16;
      id v20 = v18;
      id v21 = [(id)a1 queryQueue];
      dispatch_assert_queue_V2(v21);

      if (*(void *)(a1 + 272) && [v19 count] && objc_msgSend(*(id *)(a1 + 272), "mode") != 1)
      {
        int v22 = *(void **)(a1 + 280);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __67__HDStatisticsCollectionQueryServer__queue_cacheStatistics_anchor___block_invoke;
        uint64_t v41 = &unk_1E62F2978;
        uint64_t v42 = a1;
        [v22 insertCaches:v19 anchor:v20 completion:buf];
      }

      a5 = v34;
      if (a4)
      {
        _HKInitializeLogging();
        double v23 = *MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v17;
          _os_log_debug_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session for %@.", buf, 0x16u);
        }
        uint64_t v24 = *(void *)(a1 + 288);
        long long v25 = *(void **)(a1 + 280);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __133__HDStatisticsCollectionQueryServer__queue_sendAccumulatedStatistics_cachedStatistics_isFinal_statisticsCount_shouldResetStatistics___block_invoke;
        v36[3] = &unk_1E6300260;
        v36[4] = a1;
        id v37 = v17;
        id v38 = v12;
        uint64_t v39 = v24;
        [v25 finishWithCompletion:v36];
      }
      id v11 = v33;
    }
    if ((a4 & 1) != 0 || [v10 count])
    {
      id v26 = (void *)[v10 copy];
      [v10 removeAllObjects];
      uint64_t v27 = *a5;
      uint64_t v28 = [v26 count] + v27;
      uint64_t v29 = *(void *)(a1 + 312);
      if (v29) {
        (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v29 + 16))(v29, a1, v26, v28);
      }
      uint64_t v30 = *a6;
      uint64_t v31 = [(id)a1 queryUUID];
      objc_msgSend(v12, "client_deliverStatisticsBatch:resetStatistics:isFinal:anchor:query:", v26, v30, a4, 0, v31);

      *a6 = 0;
      *a5 = v28;
    }
  }
}

void __133__HDStatisticsCollectionQueryServer__queue_sendAccumulatedStatistics_cachedStatistics_isFinal_statisticsCount_shouldResetStatistics___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@ encountered error when finishing caching session for %@: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "client_finishedCachingStatisticsWithCacheHits:error:", *(void *)(a1 + 56), v5);
}

- (uint64_t)_queue_accumulateUpdatedStatistics:(void *)a3 accumulatedStatistics:(void *)a4 sendHandler:
{
  id v7 = a2;
  id v8 = a3;
  int v9 = a4;
  if (a1)
  {
    if ((unint64_t)[v8 count] >= 0x64) {
      v9[2](v9, 0);
    }
    id v10 = v7;
    __int16 v11 = v10;
    id v12 = *(id *)(a1 + 256);
    if (v12)
    {
      __int16 v13 = [v10 startDate];
      id v14 = [v11 endDate];
      int v15 = objc_msgSend(v12, "hk_intersectsDateIntervalWithStartDate:endDate:", v13, v14);

      if (!v15
        || ([v11 endDate],
            id v16 = objc_claimAutoreleasedReturnValue(),
            [*(id *)(a1 + 256) startDate],
            uint64_t v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v16 isEqualToDate:v17],
            v17,
            v16,
            v18))
      {

LABEL_8:
        a1 = 0;
        goto LABEL_12;
      }
      id v19 = [v11 startDate];
      id v20 = [*(id *)(a1 + 256) endDate];
      int v21 = [v19 isEqualToDate:v20];

      if (v21) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    [v8 addObject:v11];
    objc_msgSend((id)a1, "setDataCount:", objc_msgSend((id)a1, "dataCount") + objc_msgSend(v11, "dataCount"));
    a1 = 1;
  }
LABEL_12:

  return a1;
}

void __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[HDStatisticsCollectionQueryServer _queue_sendAccumulatedStatistics:cachedStatistics:isFinal:statisticsCount:shouldResetStatistics:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 32), a2, (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
}

void __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_2(void **a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1 + 6;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[HDStatisticsCollectionQueryServer _queue_accumulateUpdatedStatistics:accumulatedStatistics:sendHandler:]((uint64_t)WeakRetained, v5, a1[4], a1[5]);
}

uint64_t __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_13:
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || ([WeakRetained _shouldStopProcessingQuery] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 _shouldSuspendQuery];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 128, @"Query suspended or aborted");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2) {
        *a2 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_13;
  }
  uint64_t v8 = 1;
LABEL_14:

  return v8;
}

- (void)_queue_useCachedStatistics
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)a1 queryQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = *(void **)(a1 + 280);
  id v73 = 0;
  uint64_t v4 = [v3 persistentAnchorDateWithError:&v73];
  id v41 = v73;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F2B8A8]);
    char v6 = [*(id *)(a1 + 200) intervalComponents];
    id v7 = (void *)[v5 initWithAnchorDate:v4 intervalComponents:v6];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_initWeak(&location, (id)a1);
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v71[3] = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2020000000;
    char v70 = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke;
    aBlock[3] = &unk_1E63075F0;
    id v12 = v8;
    id v64 = v12;
    id v13 = v10;
    id v65 = v13;
    objc_copyWeak(&v68, &location);
    uint64_t v66 = v71;
    id v67 = v69;
    id v14 = _Block_copy(aBlock);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_2;
    v55[3] = &unk_1E6307618;
    id v15 = v9;
    id v56 = v15;
    objc_copyWeak(&v62, &location);
    id v16 = v12;
    id v57 = v16;
    id v17 = v14;
    id v61 = v17;
    id v40 = v13;
    id v58 = v40;
    id v18 = v11;
    id v59 = v18;
    id v19 = v7;
    id v60 = v19;
    [*(id *)(a1 + 224) setStatisticsHandler:v55];
    *(void *)(a1 + 288) = 0;
    uint64_t v51 = 0;
    long long v52 = &v51;
    uint64_t v53 = 0x2020000000;
    uint64_t v54 = 0;
    id v20 = *(void **)(a1 + 224);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_3;
    v44[3] = &unk_1E6307668;
    v44[4] = a1;
    id v21 = v16;
    id v45 = v21;
    id v22 = v17;
    id v49 = v22;
    id v39 = v15;
    id v46 = v39;
    id v23 = v19;
    id v47 = v23;
    id v24 = v18;
    id v48 = v24;
    long long v50 = &v51;
    id v43 = 0;
    int v25 = [v20 performAddSampleTransaction:v44 error:&v43];
    id v26 = v43;
    _HKInitializeLogging();
    uint64_t v27 = (void *)*MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = [*(id *)(a1 + 272) identifier];
        uint64_t v37 = *(void *)(a1 + 288);
        uint64_t v38 = v52[3];
        *(_DWORD *)buf = 138544130;
        v75 = (void *)a1;
        __int16 v76 = 2112;
        v77 = v36;
        __int16 v78 = 2048;
        uint64_t v79 = v37;
        __int16 v80 = 2048;
        uint64_t v81 = v38;
        _os_log_debug_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ Finished fetching statistics for %@ with %ld cache hits and %ld cache misses.", buf, 0x2Au);
      }
    }
    if (v25)
    {
      *(unsigned char *)(a1 + 241) = 0;
      uint64_t v29 = *(void **)(a1 + 280);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_393;
      v42[3] = &unk_1E62F2978;
      v42[4] = a1;
      [v29 deleteCachesForIntervals:v24 completion:v42];
      (*((void (**)(id, uint64_t))v22 + 2))(v22, 1);
    }
    else if ((objc_msgSend(v26, "hk_isHealthKitErrorWithCode:", 128) & 1) == 0)
    {
      uint64_t v31 = [(id)a1 clientProxy];
      uint64_t v32 = [(id)a1 queryUUID];
      objc_msgSend(v31, "client_deliverError:forQuery:", v26, v32);
    }
    _Block_object_dispose(&v51, 8);

    objc_destroyWeak(&v62);
    objc_destroyWeak(&v68);

    _Block_object_dispose(v69, 8);
    _Block_object_dispose(v71, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v30 = (void *)*MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = *(void **)(a1 + 272);
      uint64_t v34 = v30;
      uint64_t v35 = [v33 identifier];
      *(_DWORD *)buf = 138412290;
      v75 = v35;
      _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Failed to fetch persisted anchor date for cached query %@", buf, 0xCu);
    }
    id v23 = [(id)a1 clientProxy];
    id v21 = [(id)a1 queryUUID];
    objc_msgSend(v23, "client_deliverError:forQuery:", v41, v21);
  }
}

uint64_t __72__HDStatisticsCollectionQueryServer__queue_fetchAndDeliverAllStatistics__block_invoke_380(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 243))
  {
    [*(id *)(v6 + 232) removeAllObjects];
    id v7 = [*(id *)(a1 + 32) sampleType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v6 = *(void *)(a1 + 32);
    if (isKindOfClass)
    {
      id v9 = [(id)v6 profile];
      id v10 = [v9 dataManager];
      id v11 = [v10 quantitySeriesManager];
      id v12 = *(void **)(a1 + 32);
      id v13 = [v12 quantityType];
      id v14 = [*(id *)(a1 + 32) queryQueue];
      [v11 addObserver:v12 forType:v13 queue:v14];

      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  uint64_t v15 = [*(id *)(v6 + 224) queryForInitialStatisticsWithError:a3];

  return v15;
}

void __67__HDStatisticsCollectionQueryServer__queue_cacheStatistics_anchor___block_invoke(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a3;
    id v8 = [v5 clientProxy];
    id v7 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v8, "client_deliverError:forQuery:", v6, v7);
  }
}

uint64_t __103__HDStatisticsCollectionQueryServer__queue_cachingSessionWithPredicate_restrictedSourceEntities_error___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  id v7 = (void *)[[v5 alloc] initWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v8 = objc_msgSend(v4, "hk_indexForDate:anchorDate:", v7, v6);

  return v8;
}

void __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) objectsAtIndexes:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  -[HDStatisticsCollectionQueryServer _queue_sendAccumulatedStatistics:cachedStatistics:isFinal:statisticsCount:shouldResetStatistics:]((uint64_t)WeakRetained, *(void **)(a1 + 32), v5, a2, (void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));

  [*(id *)(a1 + 40) removeAllIndexes];
}

void __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v13 = v4;
  id v6 = [v4 startDate];
  LOBYTE(v5) = [v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    int v8 = -[HDStatisticsCollectionQueryServer _queue_accumulateUpdatedStatistics:accumulatedStatistics:sendHandler:]((uint64_t)WeakRetained, v13, *(void **)(a1 + 40), *(void **)(a1 + 72));

    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = [v13 startDate];
      [v9 addObject:v10];

      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    }
    id v11 = *(void **)(a1 + 56);
    id v12 = objc_msgSend(*(id *)(a1 + 64), "dateIntervalAtIndex:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    [v11 removeObject:v12];
  }
}

uint64_t __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 280);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_4;
  v10[3] = &unk_1E6307640;
  v10[4] = v4;
  id v11 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 80);
  id v14 = v6;
  uint64_t v16 = v7;
  uint64_t v8 = [v5 activateWithError:a2 cacheHandler:v10];

  return v8;
}

uint64_t __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_4(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = v9;
  if (a3) {
    goto LABEL_6;
  }
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[HDStatisticsCollectionQueryServer _queue_accumulateUpdatedStatistics:accumulatedStatistics:sendHandler:](*(void *)(a1 + 32), v10, *(void **)(a1 + 40), *(void **)(a1 + 72));
      id v11 = *(void **)(a1 + 48);
      id v12 = [v10 startDate];
      [v11 addObject:v12];

      goto LABEL_5;
    }
LABEL_6:
    id v13 = [*(id *)(a1 + 56) dateIntervalAtIndex:a4];
    [*(id *)(a1 + 64) addObject:v13];
    [*(id *)(*(void *)(a1 + 32) + 224) invalidateInterval:v13 error:a5];
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);

    goto LABEL_7;
  }
LABEL_5:
  ++*(void *)(*(void *)(a1 + 32) + 288);
LABEL_7:

  return 1;
}

void __63__HDStatisticsCollectionQueryServer__queue_useCachedStatistics__block_invoke_393(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a3;
    id v8 = [v5 clientProxy];
    uint64_t v7 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v8, "client_deliverError:forQuery:", v6, v7);
  }
}

- (id)_newCachingSessionWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  int v25 = [[HDSampleAggregateCachingSession alloc] initWithProfile:v24 cachingIdentifier:v23 sourceEntity:v22 queryDescriptor:v21 cachedClass:a7 queryInterval:v20 anchorDate:v19 intervalComponents:v18 timeIntervalToBucketIndex:v17];

  return v25;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (unint64_t)statisticsOptions
{
  return self->_statisticsOptions;
}

- (id)unitTest_queryServerStatisticsEnumerationHandler
{
  return self->_unitTest_queryServerStatisticsEnumerationHandler;
}

- (void)setUnitTest_queryServerStatisticsEnumerationHandler:(id)a3
{
}

- (id)unitTest_queryServerUpdateStatisticsHandler
{
  return self->_unitTest_queryServerUpdateStatisticsHandler;
}

- (void)setUnitTest_queryServerUpdateStatisticsHandler:(id)a3
{
}

- (id)unitTest_queryServerUnableToUpdateStatisticsHandler
{
  return self->_unitTest_queryServerUnableToUpdateStatisticsHandler;
}

- (void)setUnitTest_queryServerUnableToUpdateStatisticsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_queryServerUnableToUpdateStatisticsHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerUpdateStatisticsHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerStatisticsEnumerationHandler, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_cachingSession, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_resultsDateInterval, 0);
  objc_storeStrong((id *)&self->_pendingQuantitiesBySeries, 0);
  objc_storeStrong((id *)&self->_calculator, 0);
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_intervalCollection, 0);
}

@end