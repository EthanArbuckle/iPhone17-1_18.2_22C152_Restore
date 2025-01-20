@interface HDDatabaseDailyAnalytics
- (HDDatabaseDailyAnalytics)initWithProfile:(id)a3;
- (id)_binnedAnalyticsValue:(int64_t)a3 error:(id)a4;
- (id)_predicateForDeletedObjectsBetweenDate:(id)a3 andOlderDate:(id)a4;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
@end

@implementation HDDatabaseDailyAnalytics

- (HDDatabaseDailyAnalytics)initWithProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDatabaseDailyAnalytics;
  v5 = [(HDDatabaseDailyAnalytics *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    serialAsynchronousQueue = v6->_serialAsynchronousQueue;
    v6->_serialAsynchronousQueue = (OS_dispatch_queue *)v7;

    v9 = [v4 daemon];
    [v9 registerDaemonReadyObserver:v6 queue:v6->_serialAsynchronousQueue];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  v5 = [v4 analyticsSubmissionCoordinator];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HDDatabaseDailyAnalytics;
  [(HDDatabaseDailyAnalytics *)&v6 dealloc];
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  v5 = [v4 analyticsSubmissionCoordinator];
  [v5 addObserver:self queue:self->_serialAsynchronousQueue];
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  p_profile = &self->_profile;
  id v138 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_super v6 = [WeakRetained database];
  uint64_t v7 = (void *)[v6 _newCorruptionEventStore];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:&unk_1F17EB460 forKeyedSubscript:@"hfdSchema"];
  id v9 = objc_loadWeakRetained((id *)p_profile);
  v10 = [v9 profileIdentifier];
  objc_super v11 = [v7 mostRecentCorruptionEventForProfileIdentifier:v10 component:2];
  v12 = [v11 date];

  id v13 = objc_loadWeakRetained((id *)p_profile);
  v14 = [v13 profileIdentifier];
  v15 = [v7 mostRecentCorruptionEventForProfileIdentifier:v14 component:1];
  v16 = [v15 date];

  v17 = (id *)p_profile;
  id v18 = objc_loadWeakRetained((id *)p_profile);
  v19 = [v18 profileIdentifier];
  v20 = [v7 mostRecentCorruptionEventForProfileIdentifier:v19 component:0];
  v21 = [v20 date];

  v139 = v7;
  uint64_t v22 = [v7 dateOfMostRecentDeviceOutOfSpaceEvent];
  uint64_t v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  if (v12)
  {
    BOOL v24 = [v12 compare:v23] == 1;
    if (v16) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v25 = 0;
    if (v21) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  BOOL v24 = 0;
  if (!v16) {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v25 = [v16 compare:v23] == 1;
  if (v21)
  {
LABEL_4:
    v26 = (void *)v23;
    BOOL v27 = [v21 compare:v23] == 1;
    goto LABEL_8;
  }
LABEL_7:
  v26 = (void *)v23;
  BOOL v27 = 0;
LABEL_8:
  v136 = v16;
  v137 = v12;
  v134 = (void *)v22;
  v135 = v21;
  v133 = v26;
  if (v22) {
    uint64_t v22 = [(id)v22 compare:v26] == 1;
  }
  v28 = [NSNumber numberWithBool:v24];
  [v8 setObject:v28 forKeyedSubscript:@"corruptionSeen.hfd"];

  v29 = [NSNumber numberWithBool:v25];
  [v8 setObject:v29 forKeyedSubscript:@"corruptionSeen.protected"];

  v30 = [NSNumber numberWithBool:v27];
  [v8 setObject:v30 forKeyedSubscript:@"corruptionSeen.unprotected"];

  v31 = [NSNumber numberWithBool:v22];
  [v8 setObject:v31 forKeyedSubscript:@"outOfSpaceSeen"];

  if (v22) {
    v32 = &unk_1F17EB478;
  }
  else {
    v32 = &unk_1F17EB490;
  }
  [v8 setObject:v32 forKeyedSubscript:@"deviceOutOfSpaceCount"];
  if (v24) {
    v33 = &unk_1F17EB478;
  }
  else {
    v33 = &unk_1F17EB490;
  }
  [v8 setObject:v33 forKeyedSubscript:@"hfdCorruptionDailyCount"];
  if (v25 || v27) {
    v34 = &unk_1F17EB478;
  }
  else {
    v34 = &unk_1F17EB490;
  }
  [v8 setObject:v34 forKeyedSubscript:@"sqliteCorruptionDailyCount"];
  id v35 = objc_loadWeakRetained(v17);
  v36 = [v35 database];
  v161[0] = 0;
  int64_t v37 = +[HDHealthEntity countOfObjectsWithPredicate:0 healthDatabase:v36 error:v161];
  id v38 = v161[0];

  v39 = [(HDDatabaseDailyAnalytics *)self _binnedAnalyticsValue:v37 error:v38];

  [v8 setObject:v39 forKeyedSubscript:@"numberOfSourceRows"];
  id v40 = objc_loadWeakRetained(v17);
  v41 = [v40 database];
  id v160 = 0;
  int64_t v42 = +[HDHealthEntity countOfObjectsWithPredicate:0 healthDatabase:v41 error:&v160];
  id v43 = v160;

  v44 = [(HDDatabaseDailyAnalytics *)self _binnedAnalyticsValue:v42 error:v43];

  [v8 setObject:v44 forKeyedSubscript:@"numberOfLogicalSourceRows"];
  id v45 = objc_loadWeakRetained(v17);
  v46 = [v45 database];
  id v159 = 0;
  int64_t v47 = +[HDHealthEntity countOfObjectsWithPredicate:0 healthDatabase:v46 error:&v159];
  id v48 = v159;

  v49 = [(HDDatabaseDailyAnalytics *)self _binnedAnalyticsValue:v47 error:v48];

  [v8 setObject:v49 forKeyedSubscript:@"numberOfSourceOrderRows"];
  id v50 = objc_loadWeakRetained(v17);
  v51 = [v50 database];
  id v158 = 0;
  v52 = +[HDHealthEntity countDistinctForProperty:@"logical_source_id" healthDatabase:v51 error:&v158];
  id v53 = v158;
  uint64_t v54 = [v52 integerValue];

  v55 = [(HDDatabaseDailyAnalytics *)self _binnedAnalyticsValue:v54 error:v53];

  [v8 setObject:v55 forKeyedSubscript:@"numberOfUniqueSources"];
  id v56 = objc_loadWeakRetained(v17);
  v57 = [v56 database];
  id v157 = 0;
  int64_t v58 = +[HDHealthEntity countOfObjectsWithPredicate:0 healthDatabase:v57 error:&v157];
  id v59 = v157;

  v60 = [(HDDatabaseDailyAnalytics *)self _binnedAnalyticsValue:v58 error:v59];

  [v8 setObject:v60 forKeyedSubscript:@"numberOfQueriesUsingCachedData"];
  id v61 = objc_loadWeakRetained(v17);
  v62 = [v61 database];
  id v156 = 0;
  int64_t v63 = +[HDHealthEntity countOfObjectsWithPredicate:0 healthDatabase:v62 error:&v156];
  id v64 = v156;

  v65 = [(HDDatabaseDailyAnalytics *)self _binnedAnalyticsValue:v63 error:v64];

  v140 = v8;
  [v8 setObject:v65 forKeyedSubscript:@"cacheRowCount"];

  id v66 = objc_loadWeakRetained(v17);
  v67 = [v66 database];
  id v155 = 0;
  int64_t v68 = +[HDHealthEntity sizeOfDatabaseTableInHealthDatabase:v67 error:&v155];
  id v69 = v155;

  v70 = [(HDDatabaseDailyAnalytics *)self _binnedAnalyticsValue:v68 error:v69];

  [v8 setObject:v70 forKeyedSubscript:@"cacheSizeInKB"];
  uint64_t v71 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"type" equalToValue:&unk_1F17EB4A8];
  v132 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
  v72 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-7776000.0];
  v144 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-15552000.0];
  v143 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-31104000.0];
  v141 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-93312000.0];
  v142 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-155520000.0];
  v73 = (void *)MEMORY[0x1E4F65D08];
  v74 = [(HDDatabaseDailyAnalytics *)self _predicateForDeletedObjectsBetweenDate:v132 andOlderDate:v72];
  v145 = (void *)v71;
  v75 = [v73 compoundPredicateWithPredicate:v74 otherPredicate:v71];

  v76 = NSNumber;
  id v77 = objc_loadWeakRetained(v17);
  v78 = [v77 database];
  id v154 = 0;
  int64_t v79 = +[HDDataEntity countOfObjectsWithPredicate:v75 healthDatabase:v78 error:&v154];
  id v80 = v154;
  v81 = [v76 numberWithInteger:v79];
  [v140 setObject:v81 forKeyedSubscript:@"countDeletedSamplesOneToThreeMonthsOld"];

  v82 = (void *)MEMORY[0x1E4F65D08];
  v83 = [(HDDatabaseDailyAnalytics *)self _predicateForDeletedObjectsBetweenDate:v72 andOlderDate:v144];
  v84 = [v82 compoundPredicateWithPredicate:v83 otherPredicate:v71];

  v85 = NSNumber;
  id v86 = objc_loadWeakRetained(v17);
  v87 = [v86 database];
  id v153 = v80;
  int64_t v88 = +[HDDataEntity countOfObjectsWithPredicate:v84 healthDatabase:v87 error:&v153];
  id v89 = v153;

  v90 = [v85 numberWithInteger:v88];
  [v140 setObject:v90 forKeyedSubscript:@"countDeletedSamplesThreeToSixMonthsOld"];

  v91 = (void *)MEMORY[0x1E4F65D08];
  v92 = [(HDDatabaseDailyAnalytics *)self _predicateForDeletedObjectsBetweenDate:v144 andOlderDate:v143];
  v93 = [v91 compoundPredicateWithPredicate:v92 otherPredicate:v145];

  v94 = NSNumber;
  id v95 = objc_loadWeakRetained(v17);
  v96 = [v95 database];
  id v152 = v89;
  int64_t v97 = +[HDDataEntity countOfObjectsWithPredicate:v93 healthDatabase:v96 error:&v152];
  id v131 = v152;

  v98 = [v94 numberWithInteger:v97];
  [v140 setObject:v98 forKeyedSubscript:@"countDeletedSamplesSixToTwelveMonthsOld"];

  v99 = (void *)MEMORY[0x1E4F65D08];
  v100 = [(HDDatabaseDailyAnalytics *)self _predicateForDeletedObjectsBetweenDate:v143 andOlderDate:v141];
  v130 = [v99 compoundPredicateWithPredicate:v100 otherPredicate:v145];

  v101 = NSNumber;
  id v102 = objc_loadWeakRetained(v17);
  v103 = [v102 database];
  id v151 = v131;
  int64_t v104 = +[HDDataEntity countOfObjectsWithPredicate:v130 healthDatabase:v103 error:&v151];
  id v105 = v151;

  v106 = [v101 numberWithInteger:v104];
  [v140 setObject:v106 forKeyedSubscript:@"countDeletedSamplesTwelveToThirtySixMonthsOld"];

  v107 = (void *)MEMORY[0x1E4F65D08];
  v108 = [(HDDatabaseDailyAnalytics *)self _predicateForDeletedObjectsBetweenDate:v141 andOlderDate:v142];
  v147 = [v107 compoundPredicateWithPredicate:v108 otherPredicate:v145];

  v109 = NSNumber;
  id v110 = objc_loadWeakRetained(v17);
  v111 = [v110 database];
  id v150 = v105;
  int64_t v112 = +[HDDataEntity countOfObjectsWithPredicate:v147 healthDatabase:v111 error:&v150];
  id v113 = v150;

  v114 = [v109 numberWithInteger:v112];
  [v140 setObject:v114 forKeyedSubscript:@"countDeletedSamplesThirtySixToSixtyMonthsOld"];

  v115 = (void *)MEMORY[0x1E4F65D08];
  v116 = HDDataEntityPredicateForCreationDate(3);
  v117 = [v115 compoundPredicateWithPredicate:v116 otherPredicate:v145];

  v118 = NSNumber;
  id v119 = objc_loadWeakRetained(v17);
  v120 = [v119 database];
  id v149 = v113;
  int64_t v121 = +[HDDataEntity countOfObjectsWithPredicate:v117 healthDatabase:v120 error:&v149];
  id v122 = v149;

  v123 = [v118 numberWithInteger:v121];
  [v140 setObject:v123 forKeyedSubscript:@"countDeletedSamplesGreaterThanSixtyMonthsOld"];

  v124 = NSNumber;
  id v125 = objc_loadWeakRetained(v17);
  v126 = [v125 database];
  id v148 = v122;
  int64_t v127 = +[HDDataEntity countOfObjectsWithPredicate:v145 healthDatabase:v126 error:&v148];
  id v128 = v148;

  v129 = [v124 numberWithInteger:v127];
  [v140 setObject:v129 forKeyedSubscript:@"totalCountDeletedSamples"];

  (*((void (**)(id, void *, void, void))v138 + 2))(v138, v140, 0, 0);
}

- (id)_predicateForDeletedObjectsBetweenDate:(id)a3 andOlderDate:(id)a4
{
  id v4 = a4;
  v5 = HDDataEntityPredicateForCreationDate(3);
  objc_super v6 = HDDataEntityPredicateForCreationDate(5);

  uint64_t v7 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v5 otherPredicate:v6];

  return v7;
}

- (id)_binnedAnalyticsValue:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    objc_super v6 = &unk_1F17EB4C0;
    goto LABEL_17;
  }
  if (a3 <= 99)
  {
    uint64_t v7 = 10;
    if (a3 >= 11) {
      uint64_t v7 = 10 * (a3 / 0xAu);
    }
    if (a3) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    goto LABEL_16;
  }
  if (a3 != 100)
  {
    if ((unint64_t)a3 < 0x3E9)
    {
      uint64_t v9 = 100;
    }
    else
    {
      uint64_t v8 = 1000000;
      if ((unint64_t)a3 >= 0xF4240) {
        goto LABEL_16;
      }
      uint64_t v9 = 1000;
    }
    uint64_t v8 = (uint64_t)((double)v9 * (double)(a3 / v9));
    goto LABEL_16;
  }
  uint64_t v8 = 100;
LABEL_16:
  objc_super v6 = [NSNumber numberWithInteger:v8];
LABEL_17:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialAsynchronousQueue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end