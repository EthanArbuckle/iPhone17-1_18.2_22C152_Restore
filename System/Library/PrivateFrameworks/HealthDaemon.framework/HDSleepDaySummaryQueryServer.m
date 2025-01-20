@interface HDSleepDaySummaryQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDSleepDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_newCachingSessionWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11;
- (id)_newGregorianCalendar;
- (id)objectTypes;
- (void)_queue_start;
@end

@implementation HDSleepDaySummaryQueryServer

- (HDSleepDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSleepDaySummaryQueryServer;
  v12 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v11 client:a5 delegate:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_configuration, a4);
  }

  return v13;
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
  id v6 = a4;
  v7 = [v6 entitlements];
  uint64_t v8 = *MEMORY[0x1E4F2A548];
  char v9 = [v7 hasEntitlement:*MEMORY[0x1E4F2A548]];

  if ((v9 & 1) != 0
    || ([v6 entitlements],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = *MEMORY[0x1E4F2A538],
        char v12 = [v10 hasPrivateAccessEntitlementWithIdentifier:*MEMORY[0x1E4F2A538]],
        v10,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 4, @"Missing required entitlement: %@ for core apps or %@ for second-party access.", v8, v11);
    BOOL v13 = 0;
  }

  return v13;
}

- (id)objectTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = HKSleepDaySummarySampleTypes();
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)_queue_start
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  v3 = [(HDQueryServer *)self configuration];
  v112 = [v3 debugIdentifier];

  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v112;
    id v6 = *(id *)&buf[4];
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query Started", buf, 0x16u);
  }
  v119.receiver = self;
  v119.super_class = (Class)HDSleepDaySummaryQueryServer;
  [(HDQueryServer *)&v119 _queue_start];
  v7 = [(HDQueryServer *)self clientProxy];
  v111 = [v7 remoteObjectProxy];

  uint64_t v8 = [(HDQueryServer *)self client];
  char v9 = [v8 authorizationOracle];
  v10 = [(HDSleepDaySummaryQueryServer *)self objectTypes];
  id v118 = 0;
  v113 = [v9 readAuthorizationStatusesForTypes:v10 error:&v118];
  id v110 = v118;

  if (!v113)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR))
    {
      v92 = v24;
      v93 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v93;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v112;
      *(_WORD *)&buf[22] = 2114;
      v139 = v110;
      id v94 = v93;
      _os_log_error_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Unable to read authorization status due to error %{public}@", buf, 0x20u);
    }
    v23 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v111, "client_deliverError:forQuery:", v110, v23);
    goto LABEL_56;
  }
  uint64_t v11 = [(HDQueryServer *)self client];
  char v12 = [v11 authorizationOracle];
  char v13 = [v12 clientHasAuthorizationForAllTypes];

  if ((v13 & 1) == 0)
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v14 = [v113 allValues];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v114 objects:v137 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v115;
      char v17 = 1;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v115 != v16) {
            objc_enumerationMutation(v14);
          }
          if (v17) {
            char v17 = [*(id *)(*((void *)&v114 + 1) + 8 * i) canRead];
          }
          else {
            char v17 = 0;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v114 objects:v137 count:16];
      }
      while (v15);

      if ((v17 & 1) == 0)
      {
        _HKInitializeLogging();
        v19 = (void *)*MEMORY[0x1E4F29FA0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v112;
          *(_WORD *)&buf[22] = 2114;
          v139 = v113;
          id v22 = v21;
          _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x20u);
        }
        v23 = [(HDQueryServer *)self queryUUID];
        objc_msgSend(v111, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", MEMORY[0x1E4F1CBF0], 0, 1, v23);
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {
    }
  }
  uint64_t spid = _HKLogSignpostIDGenerate();
  _HKInitializeLogging();
  v25 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA0]))
  {
    v26 = v25;
    v27 = v26;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v112;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v27, OS_SIGNPOST_INTERVAL_BEGIN, spid, "sleep-day-summary-query", "name=%{public}@", buf, 0xCu);
    }
  }
  if (self)
  {
    uint64_t v131 = 0;
    v132 = &v131;
    uint64_t v133 = 0x3032000000;
    v134 = __Block_byref_object_copy__24;
    v135 = __Block_byref_object_dispose__24;
    id v136 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v127 = 0;
    v128 = &v127;
    uint64_t v129 = 0x2020000000;
    char v130 = 1;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    char v126 = 0;
    v122[0] = 0;
    v122[1] = v122;
    v122[2] = 0x2020000000;
    v122[3] = 0;
    uint64_t v104 = [(HKSleepDaySummaryQueryConfiguration *)self->_configuration limit];
    id v108 = [(HDSleepDaySummaryQueryServer *)self _newGregorianCalendar];
    v28 = [(HKSleepDaySummaryQueryConfiguration *)self->_configuration calendarOverrides];
    BOOL v29 = v28 == 0;

    if (!v29)
    {
      v30 = [(HKSleepDaySummaryQueryConfiguration *)self->_configuration calendarOverrides];
      objc_msgSend(v108, "setFirstWeekday:", objc_msgSend(v30, "firstWeekday"));
    }
    v31 = [(HDQueryServer *)self clientProxy];
    v107 = [v31 remoteObjectProxy];

    v32 = [(HDQueryServer *)self profile];
    v33 = [v32 sourceManager];
    id v121 = 0;
    v109 = [v33 localDeviceSourceWithError:&v121];
    id v34 = v121;

    if (!v109)
    {
      v52 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v107, "client_deliverError:forQuery:", v34, v52);
LABEL_49:

      _Block_object_dispose(v122, 8);
      _Block_object_dispose(&v123, 8);
      _Block_object_dispose(&v127, 8);
      _Block_object_dispose(&v131, 8);

      goto LABEL_50;
    }
    v35 = [(HDQueryServer *)self profile];
    configuration = self->_configuration;
    id v37 = v35;
    v38 = configuration;
    id v39 = v109;
    id v40 = v108;
    v103 = [(HKSleepDaySummaryQueryConfiguration *)v38 debugIdentifier];
    v41 = [v37 daemon];
    v42 = [v41 behavior];
    char v43 = [v42 supportsCachedSleepDaySummaryQueries];

    if (v43)
    {
      v44 = [(HKSleepDaySummaryQueryConfiguration *)v38 cacheSettings];
      BOOL v45 = v44 == 0;

      if (v45)
      {
        _HKInitializeLogging();
        v57 = (void *)*MEMORY[0x1E4F29FA0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
        {
          v95 = v57;
          v96 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v96;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v103;
          id v97 = v96;
          _os_log_debug_impl(&dword_1BCB7D000, v95, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Query caching settings not provided; caching disabled",
            buf,
            0x16u);
        }
      }
      else
      {
        v46 = [(HKSleepDaySummaryQueryConfiguration *)v38 cacheSettings];
        BOOL v47 = [v46 mode] == 1;

        if (!v47)
        {
          v81 = (void *)MEMORY[0x1E4F28C18];
          uint64_t v82 = [(HKSleepDaySummaryQueryConfiguration *)v38 morningIndexRange];
          v101 = objc_msgSend(v81, "hk_sleepDayIntervalForMorningIndexRange:calendar:", v82, v83, v40);
          id v102 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
          [v102 setDay:1];
          v84 = [(HKSleepDaySummaryQueryConfiguration *)v38 cacheSettings];
          v100 = [v84 identifier];

          _HKInitializeLogging();
          v85 = (void *)*MEMORY[0x1E4F29FA0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
          {
            v86 = v85;
            v87 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v87;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v103;
            *(_WORD *)&buf[22] = 2114;
            v139 = v100;
            id v88 = v87;
            _os_log_impl(&dword_1BCB7D000, v86, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Creating caching session with ID: %{public}@", buf, 0x20u);
          }
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __118__HDSleepDaySummaryQueryServer__newCachingSessionWithProfile_configuration_localDeviceSource_gregorianCalendar_error___block_invoke;
          v139 = &unk_1E62F6108;
          v140 = (HDSleepDaySummaryQueryServer *)v40;
          v99 = _Block_copy(buf);
          v98 = +[HDSleepDaySummaryEnumerator sleepAnalysisQueryDescriptorForDateInterval:0 options:[(HKSleepDaySummaryQueryConfiguration *)v38 options]];
          uint64_t v89 = objc_opt_class();
          v90 = [v101 startDate];
          id v105 = [(HDSleepDaySummaryQueryServer *)self _newCachingSessionWithProfile:v37 cachingIdentifier:v100 sourceEntity:v39 queryDescriptor:v98 cachedClass:v89 queryInterval:v101 anchorDate:v90 intervalComponents:v102 timeIntervalToBucketIndex:v99];

          v91 = +[HDSleepDaySummaryEnumerator sleepTypesQueryDescriptorsForDateInterval:0 options:[(HKSleepDaySummaryQueryConfiguration *)v38 options]];
          [v105 setInvalidationQueryDescriptors:v91];

          goto LABEL_43;
        }
        _HKInitializeLogging();
        v48 = (void *)*MEMORY[0x1E4F29FA0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
        {
          v49 = v48;
          v50 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v103;
          id v51 = v50;
          _os_log_debug_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Query caching settings specified user interactive mode; caching disabled",
            buf,
            0x16u);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v53 = (void *)*MEMORY[0x1E4F29FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG))
      {
        v54 = v53;
        v55 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v103;
        id v56 = v55;
        _os_log_debug_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_DEBUG, "[%{public}@:%{public}@] Query caching feature flag not enabled; caching disabled",
          buf,
          0x16u);
      }
    }
    id v105 = 0;
LABEL_43:

    v58 = v34;
    id v59 = v40;
    v60 = [HDSleepDaySummaryEnumerator alloc];
    v61 = [(HDQueryServer *)self profile];
    uint64_t v62 = [(HKSleepDaySummaryQueryConfiguration *)self->_configuration morningIndexRange];
    uint64_t v64 = v63;
    uint64_t v65 = [(HKSleepDaySummaryQueryConfiguration *)self->_configuration ascending];
    uint64_t v66 = [(HKSleepDaySummaryQueryConfiguration *)self->_configuration options];
    v67 = [(HKSleepDaySummaryQueryConfiguration *)self->_configuration debugIdentifier];
    v68 = -[HDSleepDaySummaryEnumerator initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:](v60, "initWithProfile:cachingSession:gregorianCalendar:morningIndexRange:ascending:options:debugIdentifier:", v61, v105, v59, v62, v64, v65, v66, v67);

    id v120 = v58;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __58__HDSleepDaySummaryQueryServer__queue_surfaceDaySummaries__block_invoke;
    v139 = &unk_1E62F60E0;
    v140 = self;
    v142 = &v123;
    v143 = &v131;
    id v69 = v107;
    id v141 = v69;
    v144 = &v127;
    v145 = v122;
    uint64_t v146 = v104;
    BOOL v70 = [(HDSleepDaySummaryEnumerator *)v68 enumerateWithError:&v120 handler:buf];
    id v71 = v120;

    if (!*((unsigned char *)v124 + 24))
    {
      if (v70)
      {
        uint64_t v72 = v132[5];
        int v73 = *((unsigned __int8 *)v128 + 24);
        v74 = [(HDQueryServer *)self queryUUID];
        objc_msgSend(v69, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v72, v73 != 0, 1, v74);
      }
      else
      {
        v74 = [(HDQueryServer *)self queryUUID];
        objc_msgSend(v69, "client_deliverError:forQuery:", v71, v74);
      }
    }
    id v34 = v71;
    v52 = v105;
    goto LABEL_49;
  }
LABEL_50:
  _HKInitializeLogging();
  v75 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    v76 = v75;
    v77 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v77;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v112;
    id v78 = v77;
    _os_log_impl(&dword_1BCB7D000, v76, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query complete", buf, 0x16u);
  }
  _HKInitializeLogging();
  v79 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F29FA0]))
  {
    v80 = v79;
    v23 = v80;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v112;
      _os_signpost_emit_with_name_impl(&dword_1BCB7D000, v23, OS_SIGNPOST_INTERVAL_END, spid, "sleep-day-summary-query", "name=%{public}@", buf, 0xCu);
    }
    goto LABEL_56;
  }
LABEL_57:
}

void __58__HDSleepDaySummaryQueryServer__queue_surfaceDaySummaries__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) != 0
    || [*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_4:
    *a3 = 1;
    goto LABEL_5;
  }
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] >= 0x190)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    v7 = *(void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v7, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v5, v6, 0, v8);

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v13];
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v12 = *(void *)(a1 + 80);
  if (v12 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= v12) {
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __118__HDSleepDaySummaryQueryServer__newCachingSessionWithProfile_configuration_localDeviceSource_gregorianCalendar_error___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v3 = objc_msgSend(v2, "hk_morningIndexWithCalendar:", *(void *)(a1 + 32));

  return v3;
}

- (id)_newCachingSessionWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [HDSampleAggregateCachingSession alloc];
  v25 = [v19 startDate];
  v26 = [(HDSampleAggregateCachingSession *)v24 initWithProfile:v23 cachingIdentifier:v22 sourceEntity:v21 queryDescriptor:v20 cachedClass:a7 queryInterval:v19 anchorDate:v25 intervalComponents:v18 timeIntervalToBucketIndex:v17];

  return v26;
}

- (id)_newGregorianCalendar
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  uint64_t v3 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [v2 setTimeZone:v3];

  return v2;
}

- (void).cxx_destruct
{
}

@end