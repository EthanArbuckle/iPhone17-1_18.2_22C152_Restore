@interface HDDatabaseChangesQueryServer
+ (Class)queryClass;
- (BOOL)_shouldListenForUpdates;
- (BOOL)validateConfiguration:(id *)a3;
- (HDDatabaseChangesQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_authorizedObjectTypes;
- (id)objectTypes;
- (void)_queue_deliverQueryAnchor:(void *)a3 sampleTypeChanges:;
- (void)_queue_start;
- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation HDDatabaseChangesQueryServer

- (HDDatabaseChangesQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDDatabaseChangesQueryServer;
  v11 = [(HDQueryServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v12 = [v10 anchor];
    uint64_t v13 = [v12 copy];
    anchor = v11->_anchor;
    v11->_anchor = (HKQueryAnchor *)v13;
  }
  return v11;
}

- (BOOL)validateConfiguration:(id *)a3
{
  v5 = [(HDDatabaseChangesQueryServer *)self objectTypes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)HDDatabaseChangesQueryServer;
    return [(HDQueryServer *)&v8 validateConfiguration:a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Must provide at least one object type");
    return 0;
  }
}

- (id)objectTypes
{
  if (self)
  {
    v2 = [(HDQueryServer *)self configuration];
  }
  else
  {
    v2 = 0;
  }
  v3 = [v2 sampleTypes];

  return v3;
}

- (void)_queue_start
{
  v32.receiver = self;
  v32.super_class = (Class)HDDatabaseChangesQueryServer;
  [(HDQueryServer *)&v32 _queue_start];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__102;
  v30 = __Block_byref_object_dispose__102;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = self->_anchor;
  uint64_t v4 = [(HKQueryAnchor *)v3 _rowid];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__102;
  v24 = __Block_byref_object_dispose__102;
  id v25 = 0;
  v5 = [(HDQueryServer *)self profile];
  uint64_t v6 = [v5 database];
  v18[7] = v4;
  id v19 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__HDDatabaseChangesQueryServer__queue_start__block_invoke;
  v18[3] = &unk_1E6301700;
  v18[5] = &v20;
  v18[6] = &v26;
  v18[4] = self;
  BOOL v7 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:&v19 block:v18];
  id v8 = v19;

  detailsQueryDateIndexSQL = self->_detailsQueryDateIndexSQL;
  self->_detailsQueryDateIndexSQL = 0;

  detailsQueryAnchorIndexSQL = self->_detailsQueryAnchorIndexSQL;
  self->_detailsQueryAnchorIndexSQL = 0;

  if (v7)
  {
    v11 = v21;
    v12 = (void *)v21[5];
    if (v12)
    {
      uint64_t v13 = [v12 _rowid];
      v11 = v21;
      if (v13 > v4)
      {
        -[HDQueryServer setDataCount:](self, "setDataCount:", [(id)v21[5] _rowid] - v4);
        v11 = v21;
      }
    }
    if ([(id)v11[5] _rowid] > v4 || !self->_hasDeliveredInitialResults)
    {
      -[HDDatabaseChangesQueryServer _queue_deliverQueryAnchor:sampleTypeChanges:]((id *)&self->super.super.isa, (void *)v21[5], (void *)v27[5]);
      self->_hasDeliveredInitialResults = 1;
    }
  }
  else
  {
    id v14 = v8;
    v15 = [(HDQueryServer *)self queryQueue];
    dispatch_assert_queue_V2(v15);

    objc_super v16 = [(HDQueryServer *)self clientProxy];
    v17 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v16, "client_deliverError:forQuery:", v14, v17);
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

BOOL __44__HDDatabaseChangesQueryServer__queue_start__block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v77 = a2;
  v3 = [v77 protectedDatabase];
  v81 = +[HDSQLiteEntity maxValueForProperty:predicate:database:error:](HDDataEntity, "maxValueForProperty:predicate:database:error:");
  id v78 = 0;

  if (!v81)
  {
    id v9 = v78;
    id v10 = v9;
    BOOL v8 = v9 == 0;
    if (v9)
    {
      if (a3) {
        *a3 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_78;
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F2B3C8], "_anchorWithRowid:", objc_msgSend(v81, "longLongValue"));
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = a1[7];
  if (v7 > [*(id *)(*(void *)(a1[5] + 8) + 40) _rowid])
  {
    BOOL v8 = 1;
    goto LABEL_78;
  }
  v11 = (void *)a1[4];
  v12 = [v77 protectedDatabase];
  v84 = (void *)a1[7];
  id v75 = v12;
  if (!v11)
  {
    id v66 = 0;
    goto LABEL_77;
  }
  uint64_t v13 = [v11 queryQueue];
  dispatch_assert_queue_V2(v13);

  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v73 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v82 = [NSString stringWithFormat:@"SELECT MAX(%@) FROM %@ WHERE %@ = ?", @"data_id", v73, @"data_type"];
  id v14 = -[HDDatabaseChangesQueryServer _authorizedObjectTypes](v11);
  v15 = [v11 configuration];
  int v76 = [v15 includeChangeDetails];

  id v74 = v14;
  id v86 = v75;
  objc_super v16 = NSString;
  v17 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v18 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v19 = [v16 stringWithFormat:@"SELECT %@, COUNT(*) FROM %@ CROSS JOIN %@ USING (%@) WHERE %@ IS NOT NULL GROUP BY %@", @"data_type", v17, v18, @"data_id", @"insertion_era", @"data_type"];

  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x3032000000;
  v133 = __Block_byref_object_copy__102;
  v134 = __Block_byref_object_dispose__102;
  id v135 = 0;
  uint64_t v99 = MEMORY[0x1E4F143A8];
  uint64_t v100 = 3221225472;
  v101 = __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke;
  v102 = &unk_1E62F3640;
  v103 = &v130;
  if ([v86 executeUncachedSQL:v19 error:a3 bindingHandler:0 enumerationHandler:&v99])
  {
    if ([(id)v131[5] count])
    {
      *(void *)&long long v95 = MEMORY[0x1E4F143A8];
      *((void *)&v95 + 1) = 3221225472;
      *(void *)&long long v96 = __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke_2;
      *((void *)&v96 + 1) = &unk_1E6301728;
      *(void *)&long long v97 = &v130;
      objc_msgSend(v74, "hk_filter:", &v95);
    }
    else
    {
      [MEMORY[0x1E4F1CAD0] set];
    v83 = };
  }
  else
  {
    v83 = 0;
  }
  _Block_object_dispose(&v130, 8);

  if (!v83)
  {
LABEL_73:
    id v66 = 0;
    goto LABEL_76;
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v96 = 0u;
  long long v95 = 0u;
  id obj = v74;
  uint64_t v20 = [obj countByEnumeratingWithState:&v95 objects:&v130 count:16];
  if (!v20) {
    goto LABEL_75;
  }
  uint64_t v21 = *(void *)v96;
  double v22 = *MEMORY[0x1E4F29A78];
  v70 = v11;
  uint64_t v71 = *(void *)v96;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v96 != v21) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v95 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v24;
        uint64_t v91 = 0;
        v92 = &v91;
        uint64_t v93 = 0x2020000000;
        uint64_t v94 = -1;
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke;
        v89[3] = &unk_1E62F43C8;
        id v26 = v25;
        id v90 = v26;
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke_2;
        v88[3] = &unk_1E62F3640;
        v88[4] = &v91;
        if (([v86 executeSQL:v82 error:a3 bindingHandler:v89 enumerationHandler:v88] & 1) == 0)
        {

          _Block_object_dispose(&v91, 8);
          goto LABEL_73;
        }
        if (v92[3] <= (uint64_t)v84)
        {
          if ([v83 containsObject:v26])
          {
            objc_super v32 = (void *)[objc_alloc(MEMORY[0x1E4F2B450]) _initWithSampleType:v26 startTime:1 endTime:0 hasUnfrozenSeries:v22 queryStrategy:v22];
            [v79 setObject:v32 forKeyedSubscript:v26];
          }
LABEL_68:
          _Block_object_dispose(&v91, 8);

          continue;
        }
        if (!v76)
        {
          v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B450]), "_initWithSampleType:startTime:endTime:hasUnfrozenSeries:queryStrategy:", v26, objc_msgSend(v83, "containsObject:", v26), 0, v22, v22);
LABEL_66:
          if (!v33)
          {
LABEL_74:

            _Block_object_dispose(&v91, 8);
            goto LABEL_75;
          }
          [v79 setObject:v33 forKeyedSubscript:v26];

          goto LABEL_68;
        }
        unsigned int v72 = [v83 containsObject:v26];
        uint64_t v27 = v92[3];
        id v28 = v26;
        v29 = [v11 queryQueue];
        dispatch_assert_queue_V2(v29);

        v30 = [v11 configuration];
        uint64_t v31 = [v30 changeDetailsQueryStrategy];

        if (v31)
        {

          if (v31 != 1)
          {
            if (v31 != 2) {
              goto LABEL_74;
            }
            goto LABEL_55;
          }
        }
        else
        {
          if (v84)
          {
            v34 = [v11 configuration];
            BOOL v35 = v27 - (uint64_t)v84 > [v34 anchorStrategyChangeCountLimit];

            if (!v35)
            {

LABEL_55:
              id v52 = v28;
              id v53 = v86;
              v54 = [v11 queryQueue];
              dispatch_assert_queue_V2(v54);

              uint64_t v55 = v11[29];
              if (!v55)
              {
                v56 = NSString;
                v57 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
                uint64_t v58 = [v56 stringWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@ > ? AND %@ = ?", @"start_date", @"end_date", v57, @"data_id", @"data_type", 0];
                v59 = (void *)v11[29];
                v11[29] = v58;

                uint64_t v55 = v11[29];
              }
              uint64_t v126 = 0;
              v127 = (double *)&v126;
              uint64_t v128 = 0x2020000000;
              double v129 = v22;
              uint64_t v122 = 0;
              v123 = (double *)&v122;
              uint64_t v124 = 0x2020000000;
              double v125 = v22;
              uint64_t v118 = 0;
              v119 = &v118;
              uint64_t v120 = 0x2020000000;
              LOBYTE(v121) = 0;
              uint64_t v108 = MEMORY[0x1E4F143A8];
              uint64_t v109 = 3221225472;
              v110 = __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke;
              v111 = &unk_1E62F33F8;
              v113 = v84;
              id v60 = v52;
              id v112 = v60;
              uint64_t v99 = MEMORY[0x1E4F143A8];
              uint64_t v100 = 3221225472;
              v101 = __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2;
              v102 = &unk_1E6301750;
              v103 = &v118;
              v104 = &v126;
              v106 = v84;
              v105 = &v122;
              v61 = v53;
              if ([v53 executeSQL:v55 error:a3 bindingHandler:&v108 enumerationHandler:&v99])
              {
                id v62 = objc_alloc(MEMORY[0x1E4F2B450]);
                if (*((unsigned char *)v119 + 24)) {
                  v63 = (double *)MEMORY[0x1E4F29A78];
                }
                else {
                  v63 = v127 + 3;
                }
                double v64 = *v63;
                v65 = v123 + 3;
                if (*((unsigned char *)v119 + 24)) {
                  v65 = (double *)MEMORY[0x1E4F29A78];
                }
                v33 = (void *)[v62 _initWithSampleType:v60 startTime:v72 endTime:2 hasUnfrozenSeries:v64 queryStrategy:*v65];
              }
              else
              {
                v33 = 0;
              }

              _Block_object_dispose(&v118, 8);
              _Block_object_dispose(&v122, 8);
              _Block_object_dispose(&v126, 8);

              goto LABEL_66;
            }
          }
        }
        id v36 = v28;
        id v37 = v86;
        v38 = [v11 queryQueue];
        dispatch_assert_queue_V2(v38);

        uint64_t v39 = v11[28];
        if (!v39)
        {
          v40 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
          objc_msgSend(NSString, "stringWithFormat:", @"SELECT (SELECT MIN(%@) FROM %@ WHERE %@ > ? AND %@ = ?) AS min_start_date,(SELECT MAX(%@) FROM %@ WHERE %@ > ? AND %@ = ?) AS max_start_date,(SELECT MAX(%@) FROM %@ WHERE %@ = ?) as max_end_date,(SELECT %@ FROM %@ WHERE %@ > ? AND %@ = ? AND %@ IS NULL AND %@ IS NULL LIMIT 1) as deletions", @"start_date", v40, @"data_id", @"data_type", @"start_date", v40, @"data_id", @"data_type", @"end_date", v40, @"data_type", @"data_id", v40, @"data_id", @"data_type", @"start_date",
            @"end_date",
          uint64_t v41 = 0);
          v42 = (void *)v11[28];
          v11[28] = v41;

          uint64_t v39 = v11[28];
        }
        uint64_t v126 = 0;
        v127 = (double *)&v126;
        uint64_t v128 = 0x2020000000;
        double v129 = v22;
        uint64_t v122 = 0;
        v123 = (double *)&v122;
        uint64_t v124 = 0x2020000000;
        double v125 = v22;
        uint64_t v118 = 0;
        v119 = &v118;
        uint64_t v120 = 0x2020000000;
        double v121 = v22;
        uint64_t v114 = 0;
        v115 = &v114;
        uint64_t v116 = 0x2020000000;
        char v117 = 0;
        uint64_t v108 = MEMORY[0x1E4F143A8];
        uint64_t v109 = 3221225472;
        v110 = __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke;
        v111 = &unk_1E62F33F8;
        id v43 = v36;
        id v112 = v43;
        v113 = v84;
        uint64_t v99 = MEMORY[0x1E4F143A8];
        uint64_t v100 = 3221225472;
        v101 = __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2;
        v102 = &unk_1E6301778;
        v103 = &v126;
        v104 = &v122;
        v107 = v84;
        v105 = &v118;
        v106 = &v114;
        if ([v37 executeSQL:v39 error:a3 bindingHandler:&v108 enumerationHandler:&v99])
        {
          if (v127[3] != v22
            && *((double *)v119 + 3) != v22
            && [v43 isMaximumDurationRestricted])
          {
            double v44 = *((double *)v119 + 3);
            double v45 = v123[3];
            [v43 maximumAllowedDuration];
            double v47 = v45 + v46;
            if (v44 < v47) {
              double v47 = v44;
            }
            *((double *)v119 + 3) = v47;
          }
          id v48 = objc_alloc(MEMORY[0x1E4F2B450]);
          if (*((unsigned char *)v115 + 24)) {
            v49 = (double *)MEMORY[0x1E4F29A78];
          }
          else {
            v49 = v127 + 3;
          }
          double v50 = *v49;
          v51 = (double *)(v119 + 3);
          if (*((unsigned char *)v115 + 24)) {
            v51 = (double *)MEMORY[0x1E4F29A78];
          }
          v33 = (void *)[v48 _initWithSampleType:v43 startTime:v72 endTime:1 hasUnfrozenSeries:v50 queryStrategy:*v51];
        }
        else
        {
          v33 = 0;
        }

        v11 = v70;
        uint64_t v21 = v71;
        _Block_object_dispose(&v114, 8);
        _Block_object_dispose(&v118, 8);
        _Block_object_dispose(&v122, 8);
        _Block_object_dispose(&v126, 8);

        goto LABEL_66;
      }
    }
    uint64_t v20 = [obj countByEnumeratingWithState:&v95 objects:&v130 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_75:

  id v66 = v79;
LABEL_76:

LABEL_77:
  uint64_t v67 = *(void *)(a1[6] + 8);
  v68 = *(void **)(v67 + 40);
  *(void *)(v67 + 40) = v66;

  BOOL v8 = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
LABEL_78:

  return v8;
}

- (void)_queue_deliverQueryAnchor:(void *)a3 sampleTypeChanges:
{
  id v10 = a2;
  if (a1)
  {
    id v6 = a3;
    uint64_t v7 = [a1 queryQueue];
    dispatch_assert_queue_V2(v7);

    BOOL v8 = [a1 clientProxy];
    id v9 = [a1 queryUUID];
    objc_msgSend(v8, "client_deliverQueryAnchor:sampleTypeChanges:queryUUID:", v10, v6, v9);

    objc_storeStrong(a1 + 26, a2);
  }
}

- (id)_authorizedObjectTypes
{
  id v1 = a1;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 objectTypes];
    if ([v2 count])
    {
      v3 = [v1 client];
      uint64_t v4 = [v3 authorizationOracle];
      id v10 = 0;
      uint64_t v5 = [v4 readAuthorizationStatusesForTypes:v2 error:&v10];
      id v6 = v10;

      if (v5)
      {
        uint64_t v7 = objc_msgSend(v5, "hk_filterKeysWithBlock:", &__block_literal_global_111);
      }
      else
      {
        _HKInitializeLogging();
        BOOL v8 = *MEMORY[0x1E4F29F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v12 = v1;
          __int16 v13 = 2114;
          id v14 = v6;
          _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error reading authorization statuses: %{public}@", buf, 0x16u);
        }
        uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
      }
      id v1 = (id)v7;
    }
    else
    {
      id v1 = [MEMORY[0x1E4F1CAD0] set];
    }
  }

  return v1;
}

uint64_t __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) code];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __83__HDDatabaseChangesQueryServer__queue_changesByTypeWithDatabase_sinceAnchor_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    sqlite3_int64 v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  BOOL v8 = MEMORY[0x1C1879F70](a2, 0);
  [v3 addObject:v8];

  return 1;
}

uint64_t __107__HDDatabaseChangesQueryServer__queue_sampleTypeCodesWithUnfrozenSeriesWithAuthorizedTypes_database_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_int64 v4 = [*(id *)(a1 + 32) code];

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __130__HDDatabaseChangesQueryServer__queue_detailedChangeUsingAnchorIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2(void *a1, uint64_t a2)
{
  if (MEMORY[0x1C1879FC0](a2, 0) && MEMORY[0x1C1879FC0](a2, 1) && (uint64_t)a1[7] >= 1)
  {
    uint64_t v4 = 0;
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  }
  else
  {
    double v5 = MEMORY[0x1C1879F40](a2, 0);
    uint64_t v6 = *(void *)(a1[5] + 8);
    double v7 = *(double *)(v6 + 24);
    if (v7 < v5 && v7 != *MEMORY[0x1E4F29A78]) {
      double v5 = *(double *)(v6 + 24);
    }
    *(double *)(v6 + 24) = v5;
    double v9 = *(double *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v4 = 1;
    double v10 = MEMORY[0x1C1879F40](a2, 1);
    if (v9 >= v10) {
      double v10 = v9;
    }
    *(double *)(*(void *)(a1[6] + 8) + 24) = v10;
  }
  return v4;
}

uint64_t __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = [*(id *)(a1 + 32) code];
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, v4);
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 4, v4);
  sqlite3_bind_int64(a2, 5, v4);
  sqlite3_bind_int64(a2, 6, *(void *)(a1 + 40));

  return sqlite3_bind_int64(a2, 7, v4);
}

uint64_t __128__HDDatabaseChangesQueryServer__queue_detailedChangeUsingDateIndexStrategyForType_sinceAnchor_hasUnfrozenSeries_database_error___block_invoke_2(void *a1, uint64_t a2)
{
  if (HDSQLiteColumnIsNonNull()) {
    *(double *)(*(void *)(a1[4] + 8) + 24) = MEMORY[0x1C1879F40](a2, 0);
  }
  if (HDSQLiteColumnIsNonNull()) {
    *(double *)(*(void *)(a1[5] + 8) + 24) = MEMORY[0x1C1879F40](a2, 1);
  }
  if (HDSQLiteColumnIsNonNull()) {
    *(double *)(*(void *)(a1[6] + 8) + 24) = MEMORY[0x1C1879F40](a2, 2);
  }
  if ((uint64_t)a1[8] >= 1 && HDSQLiteColumnIsNonNull()) {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = HDSQLiteColumnAsInt64() > 0;
  }
  return 1;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HDDatabaseChangesQueryServer_samplesAdded_anchor___block_invoke;
  v10[3] = &unk_1E62F30F8;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [(HDQueryServer *)self onQueue:v10];
}

void __52__HDDatabaseChangesQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) longLongValue];
  if (v2 > [*(id *)(*(void *)(a1 + 40) + 208) _rowid])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v22 = *(void *)v24;
      double v5 = *MEMORY[0x1E4F29A78];
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v24 != v22) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(id **)(a1 + 40);
          id v8 = *(id *)(*((void *)&v23 + 1) + 8 * v6);
          if (v7)
          {
            id v9 = [v7 queryQueue];
            dispatch_assert_queue_V2(v9);

            if (!v7[25])
            {
              id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v11 = v7[25];
              v7[25] = v10;
            }
            id v12 = [v8 sampleType];
            id v13 = [v7[25] objectForKeyedSubscript:v12];
            id v14 = [v7 configuration];
            int v15 = [v14 includeChangeDetails];

            if (v13)
            {
              if (v15) {
                [v13 _extendDateIntervalWithSample:v8];
              }
            }
            else
            {
              id v16 = objc_alloc(MEMORY[0x1E4F2B450]);
              double v17 = v5;
              double v18 = v5;
              if (v15)
              {
                [v8 _startTimestamp];
                double v17 = v19;
                [v8 _endTimestamp];
                double v18 = v20;
              }
              id v13 = (void *)[v16 _initWithSampleType:v12 startTime:0 endTime:0 hasUnfrozenSeries:v17 queryStrategy:v18];
              [v7[25] setObject:v13 forKeyedSubscript:v12];
            }
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v4);
    }
  }
}

- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke;
  v7[3] = &unk_1E62F31C0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [(HDQueryServer *)self onQueue:v7];
}

void __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) longLongValue];
  if (v2 > [*(id *)(*(void *)(a1 + 40) + 208) _rowid])
  {
    uint64_t v3 = -[HDDatabaseChangesQueryServer _authorizedObjectTypes](*(id *)(a1 + 40));
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F2B3C8], "_anchorWithRowid:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
    id v5 = *(void **)(*(void *)(a1 + 40) + 200);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke_2;
    v10[3] = &unk_1E63017A0;
    id v6 = v3;
    id v11 = v6;
    id v7 = objc_msgSend(v5, "hk_filter:", v10);
    if ([v7 count]) {
      -[HDDatabaseChangesQueryServer _queue_deliverQueryAnchor:sampleTypeChanges:](*(id **)(a1 + 40), v4, v7);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 200);
    *(void *)(v8 + 200) = 0;
  }
}

uint64_t __60__HDDatabaseChangesQueryServer_didAddSamplesOfTypes_anchor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HDDatabaseChangesQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v10[3] = &unk_1E62F30F8;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [(HDQueryServer *)self onQueue:v10];
}

void __65__HDDatabaseChangesQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] longLongValue];
  if (v2 > [*((id *)a1[5] + 26) _rowid])
  {
    uint64_t v3 = -[HDDatabaseChangesQueryServer _authorizedObjectTypes](a1[5]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = a1[6];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      double v9 = *MEMORY[0x1E4F29A78];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v3, "containsObject:", v11, (void)v14))
          {
            id v12 = (void *)[objc_alloc(MEMORY[0x1E4F2B450]) _initWithSampleType:v11 startTime:0 endTime:0 hasUnfrozenSeries:v9 queryStrategy:v9];
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F2B3C8], "_anchorWithRowid:", objc_msgSend(a1[4], "longLongValue"));
      -[HDDatabaseChangesQueryServer _queue_deliverQueryAnchor:sampleTypeChanges:]((id *)a1[5], v13, v4);
    }
  }
}

BOOL __54__HDDatabaseChangesQueryServer__authorizedObjectTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 canRead])
  {
    uint64_t v3 = [v2 restrictedBundleIdentifier];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsQueryAnchorIndexSQL, 0);
  objc_storeStrong((id *)&self->_detailsQueryDateIndexSQL, 0);
  objc_storeStrong((id *)&self->_anchor, 0);

  objc_storeStrong((id *)&self->_pendingSampleTypeChanges, 0);
}

@end