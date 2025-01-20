@interface HDRaceRouteLocationSeriesEntity
+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (BOOL)enumerateRoutePointsForSeries:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 startDuration:(double)a6 finishDuration:(double)a7 transaction:(id)a8 error:(id *)a9 handler:(id)a10;
+ (BOOL)enumerateRoutePointsForSeries:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 transaction:(id)a6 error:(id *)a7 handler:(id)a8;
+ (BOOL)hasROWID;
+ (BOOL)insertCodableRoutePoints:(id)a3 seriesKey:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_allEntityProperties;
+ (id)_maxSeriesIdentifierWithDatabase:(uint64_t)a3 error:;
+ (id)createRoutePointsFromWorkout:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)createTableSQLWithBehavior:(id)a3;
+ (id)databaseTable;
+ (id)indicesWithBehavior:(id)a3;
+ (id)insertCodableRoutePoints:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)primaryKeyColumns;
+ (id)triggersWithBehavior:(id)a3;
+ (int64_t)protectionClass;
+ (uint64_t)_insertRoutePoint:(uint64_t)a3 seriesIdentifier:(void *)a4 database:(uint64_t)a5 error:;
@end

@implementation HDRaceRouteLocationSeriesEntity

+ (id)createRoutePointsFromWorkout:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  v139[1] = *MEMORY[0x1E4F143B8];
  id v70 = a3;
  id v10 = a4;
  id v69 = a5;
  v72 = v10;
  v11 = [v10 databaseForEntityClass:a1];
  v68 = v11;
  v12 = +[HDRaceRouteLocationSeriesEntity _maxSeriesIdentifierWithDatabase:error:]((uint64_t)a1, v11, (uint64_t)a6);
  v67 = v12;
  if (v12)
  {
    uint64_t v13 = [v12 longLongValue];
    id v14 = v70;
    id v71 = v11;
    self;
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F65D68]);
    v16 = [MEMORY[0x1E4F2B498] workoutRouteType];
    v17 = HDSampleEntityPredicateForDataType(v16);

    v18 = HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject([v14 persistentID]);
    v19 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v17 otherPredicate:v18];
    [v15 setPredicate:v19];

    [v15 setEntityClass:objc_opt_class()];
    v20 = (void *)MEMORY[0x1E4F65D50];
    objc_opt_class();
    v21 = objc_msgSend(v20, "orderingTermWithProperty:entityClass:ascending:");
    uint64_t v60 = v13;
    v137[0] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:1];
    [v15 setOrderingTerms:v22];

    v23 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v71 descriptor:v15];
    v131 = @"hfd_key";
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
    uint64_t v114 = MEMORY[0x1E4F143A8];
    uint64_t v115 = 3221225472;
    uint64_t v116 = (uint64_t)__84__HDRaceRouteLocationSeriesEntity__routeSeriesIdentifiersForWorkout_database_error___block_invoke;
    v117 = (__n128 (*)(__n128 *, uint64_t))&unk_1E62F5790;
    v25 = (void (*)(uint64_t))v65;
    v118 = v25;
    LODWORD(v19) = [v23 enumerateProperties:v24 error:a6 enumerationHandler:&v114];

    if (v19) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
    v66 = v26;

    if (v66)
    {
      v61 = [v14 totalDistanceInCanonicalUnitWithTransaction:v72 error:a6];
      if (v61)
      {
        v59 = [v14 workoutDurationWithTransaction:v72 error:a6];
        if (v59)
        {
          v57 = [v14 workoutStartDateWithTransaction:v72 error:a6];
          if (v57)
          {
            v56 = [v14 mainWorkoutActivityTypeWithTransaction:v72 error:a6];
            if (v56
              && (objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "persistentID")),
                  v27 = objc_claimAutoreleasedReturnValue(),
                  +[HDWorkoutEventEntity workoutEventsWithOwnerID:v27 database:v71 error:a6], v28 = objc_claimAutoreleasedReturnValue(), v27, v28))
            {
              v29 = objc_msgSend(v28, "hk_filter:", &__block_literal_global_20);
              v63 = [v29 sortedArrayUsingComparator:&__block_literal_global_302_0];

              [v56 integerValue];
              v62 = _HKWorkoutDistanceTypeForActivityType();
              v64 = +[HDSampleEntity entityEnumeratorWithType:profile:](HDQuantitySampleEntity, "entityEnumeratorWithType:profile:");
              v30 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
              v139[0] = v30;
              v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:1];
              [v64 setOrderingTerms:v31];

              v55 = HDSampleEntityPredicateForDataType(v62);
              v54 = HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject([v14 persistentID]);
              v32 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v55 otherPredicate:v54];
              [v64 setPredicate:v32];

              uint64_t v126 = 0;
              v127 = &v126;
              uint64_t v128 = 0x2020000000;
              char v129 = 0;
              v137[0] = 0;
              v137[1] = v137;
              v137[2] = 0x3032000000;
              v137[3] = __Block_byref_object_copy__17;
              v137[4] = __Block_byref_object_dispose__17;
              id v138 = v57;
              v125[0] = 0;
              v125[1] = v125;
              v125[2] = 0x2020000000;
              v125[3] = 0;
              [v59 doubleValue];
              double v34 = v33;
              self;
              unsigned int v35 = fmax(ceil(v34 / 2.5), 1.0);
              if (v35 >= 0x1388) {
                unint64_t v36 = 5000;
              }
              else {
                unint64_t v36 = v35;
              }
              uint64_t v114 = 0;
              uint64_t v115 = (uint64_t)&v114;
              uint64_t v116 = 0x6012000000;
              v117 = __Block_byref_object_copy__308;
              v118 = __Block_byref_object_dispose__309;
              v119 = &unk_1BD44B655;
              int v120 = v36;
              char v121 = 0;
              long long v122 = 0u;
              long long v123 = 0u;
              uint64_t v124 = 0;
              if (v36)
              {
                v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v36);
                v39 = (char *)*((void *)&v122 + 1);
                v40 = (char *)v122;
                v41 = v37;
                if (*((void *)&v122 + 1) != (void)v122)
                {
                  do
                  {
                    long long v42 = *(_OWORD *)(v39 - 24);
                    *((void *)v41 - 1) = *((void *)v39 - 1);
                    *(_OWORD *)(v41 - 24) = v42;
                    v41 -= 24;
                    v39 -= 24;
                  }
                  while (v39 != v40);
                  v39 = (char *)v122;
                }
                *(void *)&long long v122 = v41;
                *((void *)&v122 + 1) = v37;
                *(void *)&long long v123 = &v37[24 * v38];
                if (v39)
                {
                  operator delete(v39);
                  v41 = (char *)v122;
                }
              }
              else
              {
                v41 = 0;
              }
              *((void *)&v123 + 1) = v41;
              v131 = 0;
              v132 = &v131;
              uint64_t v133 = 0x3032000000;
              v134 = __Block_byref_object_copy__17;
              v135 = __Block_byref_object_dispose__17;
              v113[0] = MEMORY[0x1E4F143A8];
              v113[1] = 3221225472;
              v113[2] = __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_310;
              v113[3] = &unk_1E62F56C8;
              v113[4] = v137;
              objc_msgSend(v63, "hk_firstObjectPassingTest:", v113);
              id v136 = (id)objc_claimAutoreleasedReturnValue();
              v111[0] = 0;
              v111[1] = v111;
              v111[2] = 0x3032000000;
              v111[3] = __Block_byref_object_copy__17;
              v111[4] = __Block_byref_object_dispose__17;
              v44 = [(__CFString *)v132[5] dateInterval];
              id v112 = [v44 endDate];

              uint64_t v107 = 0;
              v108 = &v107;
              uint64_t v109 = 0x2020000000;
              uint64_t v110 = 0;
              uint64_t v110 = [v63 indexOfObject:v132[5]];
              v105[0] = 0;
              v105[1] = v105;
              v105[2] = 0x2020000000;
              BOOL v106 = 0;
              unint64_t v45 = v108[3];
              BOOL v106 = v45 < [v63 count];
              v103[0] = 0;
              v103[1] = v103;
              v103[2] = 0x2020000000;
              char v104 = 1;
              v102[0] = 0;
              v102[1] = v102;
              v102[2] = 0x2020000000;
              v102[3] = 0;
              long long v98 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              obj = v66;
              uint64_t v46 = [obj countByEnumeratingWithState:&v98 objects:v130 count:16];
              if (v46)
              {
                uint64_t v47 = *(void *)v99;
                while (2)
                {
                  for (uint64_t i = 0; i != v46; ++i)
                  {
                    if (*(void *)v99 != v47) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v49 = *(void *)(*((void *)&v98 + 1) + 8 * i);
                    uint64_t v92 = 0;
                    v93 = &v92;
                    uint64_t v94 = 0x3032000000;
                    v95 = __Block_byref_object_copy__17;
                    v96 = __Block_byref_object_dispose__17;
                    id v97 = 0;
                    v73[0] = MEMORY[0x1E4F143A8];
                    v73[1] = 3221225472;
                    v73[2] = __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_2_312;
                    v73[3] = &unk_1E62F5718;
                    v79 = v137;
                    id v90 = a1;
                    id v74 = v64;
                    id v75 = v62;
                    v80 = &v114;
                    id v76 = v72;
                    v81 = &v92;
                    v82 = v125;
                    v83 = v102;
                    v84 = v105;
                    v85 = v111;
                    v86 = v103;
                    v87 = &v131;
                    v88 = &v107;
                    id v77 = v63;
                    v89 = &v126;
                    uint64_t v91 = v60 + 1;
                    id v78 = v71;
                    BOOL v50 = +[HDLocationSeriesSampleEntity enumerateLocationDataInDatabase:v78 HFDKey:v49 error:a6 handler:v73];
                    id v51 = (id)v93[5];
                    v52 = v51;
                    if (v51)
                    {
                      if (a6) {
                        *a6 = v51;
                      }
                      else {
                        _HKLogDroppedError();
                      }
                    }

                    _Block_object_dispose(&v92, 8);
                    if (!v50)
                    {

                      v43 = 0;
                      goto LABEL_44;
                    }
                  }
                  uint64_t v46 = [obj countByEnumeratingWithState:&v98 objects:v130 count:16];
                  if (v46) {
                    continue;
                  }
                  break;
                }
              }

              if (*((unsigned char *)v127 + 24)) {
                [NSNumber numberWithLongLong:v60 + 1];
              }
              else {
              v43 = [NSNumber numberWithLongLong:0];
              }
LABEL_44:
              _Block_object_dispose(v102, 8);
              _Block_object_dispose(v103, 8);
              _Block_object_dispose(v105, 8);
              _Block_object_dispose(&v107, 8);
              _Block_object_dispose(v111, 8);

              _Block_object_dispose(&v131, 8);
              _Block_object_dispose(&v114, 8);
              if ((void)v122)
              {
                *((void *)&v122 + 1) = v122;
                operator delete((void *)v122);
              }
              _Block_object_dispose(v125, 8);
              _Block_object_dispose(v137, 8);

              _Block_object_dispose(&v126, 8);
            }
            else
            {
              v43 = 0;
            }
          }
          else
          {
            v43 = 0;
          }
        }
        else
        {
          v43 = 0;
        }
      }
      else
      {
        v43 = 0;
      }
    }
    else
    {
      v43 = 0;
    }
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

+ (id)_maxSeriesIdentifierWithDatabase:(uint64_t)a3 error:
{
  id v4 = a2;
  uint64_t v5 = self;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = v5;
  v6 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke_2;
  v9[3] = &unk_1E62F5278;
  v9[4] = &v11;
  if ([v4 executeCachedStatementForKey:&+[HDRaceRouteLocationSeriesEntity _maxSeriesIdentifierWithDatabase:error:]::HDRaceRouteLocationSeriesEntityCacheKeyMaxIdentifier error:a3 SQLGenerator:v6 bindingHandler:0 enumerationHandler:v9])
  {
    v7 = [NSNumber numberWithLongLong:v12[3]];
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v11, 8);

  return v7;
}

BOOL __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 1 || objc_msgSend(v2, "type") == 2;

  return v3;
}

uint64_t __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 dateInterval];
  v6 = [v5 startDate];
  v7 = [v4 dateInterval];
  v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_310(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 dateInterval];
  id v4 = [v3 endDate];
  uint64_t v5 = objc_msgSend(v4, "hk_isAfterOrEqualToDate:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));

  return v5;
}

uint64_t __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_2_312(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 timestamp];
  if ((objc_msgSend(v4, "hk_isBeforeDate:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) & 1) == 0)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) endDate:v4];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v4);
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v9 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v11 = *(void **)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    v12 = *(void **)(a1 + 48);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v64 = __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_3;
    id v65 = &unk_1E62F56F0;
    uint64_t v66 = *(void *)(a1 + 96);
    id obj = v11;
    id v61 = v7;
    id v13 = v6;
    id v60 = v12;
    uint64_t v14 = v63;
    self;
    id v15 = (double *)&v74;
    uint64_t v74 = 0;
    id v75 = (double *)&v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    v16 = *(double **)(v8 + 80);
    if (v16 == *(double **)(v8 + 64))
    {
      v17 = v61;
LABEL_9:
      if (!*(unsigned char *)(v8 + 52))
      {
        uint64_t v50 = [v17 predicate];
        v57 = (void *)v50;
        v58 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(v8 + 88)];
        if (v58)
        {
          id v51 = HDSampleEntityPredicateForStartDate(5);
          v52 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v50 otherPredicate:v51];
          [v61 setPredicate:v52];
        }
        uint64_t v53 = *(void *)(v8 + 56);
        *(void *)(v8 + 64) = v53;
        *(void *)(v8 + 80) = v53;
        uint64_t v54 = [MEMORY[0x1E4F2B618] meterUnit];
        unint64_t v55 = *(unsigned int *)(v8 + 48);
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __124__HDRaceRouteLocationSeriesEntity__distanceWithEnumerator_dateInterval_distanceType_sampleBuffer_transaction_error_handler___block_invoke;
        v68[3] = &unk_1E62F57B8;
        v56 = (void *)v54;
        v68[4] = v54;
        id v69 = v13;
        id v70 = &v74;
        uint64_t v71 = v8 + 56;
        unint64_t v72 = v55;
        int v59 = [v61 enumerateInTransaction:v60 error:&obj handler:v68];
        [v61 setPredicate:v57];
        if (v59 && 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v8 + 64) - *(void *)(v8 + 56)) >> 3) < v55) {
          *(unsigned char *)(v8 + 52) = 1;
        }
        v64((uint64_t)v14, v75[3]);

        _Block_object_dispose(&v74, 8);
        objc_storeStrong(v10, obj);
        if ((v59 & 1) == 0)
        {
          uint64_t v5 = 0;
LABEL_30:

          goto LABEL_31;
        }
LABEL_11:
        double v19 = *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)
          && objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "hk_isAfterDate:", *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)))
        {
          v20 = [v13 startDate];
          do
          {
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24))
            {
              [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) timeIntervalSinceReferenceDate];
              double v22 = v21;
              [v20 timeIntervalSinceReferenceDate];
              *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v22
                                                                           - v23
                                                                           + *(double *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                                       + 24);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 136)+ 8)+ 40), "type", v56) != 1;
            unint64_t v24 = ++*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v24 < [*(id *)(a1 + 56) count];
            id v25 = *(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);

            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)) {
              break;
            }
            uint64_t v26 = [*(id *)(a1 + 56) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24)];
            uint64_t v27 = *(void *)(*(void *)(a1 + 136) + 8);
            v28 = *(void **)(v27 + 40);
            *(void *)(v27 + 40) = v26;

            v29 = [*(id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40) dateInterval];
            uint64_t v30 = [v29 endDate];
            uint64_t v31 = *(void *)(*(void *)(a1 + 120) + 8);
            v32 = *(void **)(v31 + 40);
            *(void *)(v31 + 40) = v30;

            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24)) {
              break;
            }
            v20 = v25;
          }
          while ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "hk_isAfterDate:", *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)) & 1) != 0);
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24))
          {
            double v33 = [v13 endDate];
            [v33 timeIntervalSinceReferenceDate];
            double v35 = v34;
            [v25 timeIntervalSinceReferenceDate];
            *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v35
                                                                         - v36
                                                                         + *(double *)(*(void *)(*(void *)(a1 + 104)
                                                                                                 + 8)
                                                                                     + 24);
          }
        }
        else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24))
        {
          [v13 duration];
          *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v37
                                                                       + *(double *)(*(void *)(*(void *)(a1 + 104)
                                                                                               + 8)
                                                                                   + 24);
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24)
          && *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) == v19)
        {
          uint64_t v5 = 1;
        }
        else
        {
          id v38 = objc_alloc(MEMORY[0x1E4F1E650]);
          [v3 coordinate];
          double v40 = v39;
          [v3 coordinate];
          double v42 = v41;
          [v3 altitude];
          v44 = objc_msgSend(v38, "initWithLatitude:longitude:altitude:odometer:timestamp:signalEnvironmentType:", objc_msgSend(v3, "signalEnvironmentType"), v40, v42, v43, *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
          uint64_t v45 = *(void *)(a1 + 160);
          uint64_t v46 = *(void *)(a1 + 168);
          uint64_t v47 = *(void **)(a1 + 64);
          uint64_t v48 = *(void *)(*(void *)(a1 + 88) + 8);
          id v62 = *(id *)(v48 + 40);
          uint64_t v5 = +[HDRaceRouteLocationSeriesEntity _insertRoutePoint:seriesIdentifier:database:error:](v45, v44, v46, v47, (uint64_t)&v62);
          objc_storeStrong((id *)(v48 + 40), v62);
          if (v5) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = 1;
          }
        }
        goto LABEL_30;
      }
    }
    else
    {
      v17 = v61;
      while (1)
      {
        BOOL v73 = 0;
        double v18 = _overlappingSampleDistanceForInterval(v13, v16, &v73);
        id v15 = v75;
        v75[3] = v18 + v75[3];
        *(double *)(v8 + 88) = *v16;
        if (!v73) {
          break;
        }
        v16 = (double *)(*(void *)(v8 + 80) + 24);
        *(void *)(v8 + 80) = v16;
        if (v16 == *(double **)(v8 + 64)) {
          goto LABEL_9;
        }
      }
    }
    v64((uint64_t)v14, v15[3]);
    _Block_object_dispose(&v74, 8);

    objc_storeStrong(v10, obj);
    goto LABEL_11;
  }
  uint64_t v5 = 1;
LABEL_31:

  return v5;
}

double __90__HDRaceRouteLocationSeriesEntity_createRoutePointsFromWorkout_transaction_profile_error___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

+ (uint64_t)_insertRoutePoint:(uint64_t)a3 seriesIdentifier:(void *)a4 database:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a4;
  uint64_t v10 = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = v10;
  uint64_t v11 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke_2;
  v15[3] = &unk_1E62F5768;
  uint64_t v17 = a3;
  id v12 = v8;
  id v16 = v12;
  uint64_t v13 = [v9 executeCachedStatementForKey:&+[HDRaceRouteLocationSeriesEntity _insertRoutePoint:seriesIdentifier:database:error:]::HDRaceRouteLocationSeriesEntityCacheKeyInsert error:a5 SQLGenerator:v11 bindingHandler:v15 enumerationHandler:0];

  return v13;
}

+ (BOOL)enumerateRoutePointsForSeries:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 transaction:(id)a6 error:(id *)a7 handler:(id)a8
{
  return [a1 enumerateRoutePointsForSeries:a3 timestampAnchor:a5 limit:a6 startDuration:a7 finishDuration:a8 transaction:a4 error:0.0 handler:0.0];
}

+ (BOOL)enumerateRoutePointsForSeries:(int64_t)a3 timestampAnchor:(double)a4 limit:(unint64_t)a5 startDuration:(double)a6 finishDuration:(double)a7 transaction:(id)a8 error:(id *)a9 handler:(id)a10
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v45 = a8;
  id v44 = a10;
  id v18 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v18 setEntityClass:a1];
  [v18 setLimitCount:a5];
  double v19 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"timestamp" entityClass:a1 ascending:1];
  v53[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  [v18 setOrderingTerms:v20];

  double v21 = (void *)MEMORY[0x1E4F65D00];
  double v22 = [NSNumber numberWithLongLong:a3];
  uint64_t v46 = [v21 predicateWithProperty:@"series_id" equalToValue:v22];

  double v23 = (void *)MEMORY[0x1E4F65D00];
  unint64_t v24 = [NSNumber numberWithDouble:a4];
  id v25 = [v23 predicateWithProperty:@"timestamp" greaterThanValue:v24];

  v52[0] = v46;
  v52[1] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  uint64_t v27 = (void *)[v26 mutableCopy];

  if (a6 > 0.0)
  {
    v28 = (void *)MEMORY[0x1E4F65D00];
    v29 = [NSNumber numberWithDouble:a6];
    uint64_t v30 = [v28 predicateWithProperty:@"timestamp" greaterThanOrEqualToValue:v29];

    [v27 addObject:v30];
  }
  if (a7 > a6)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F65D00];
    v32 = [NSNumber numberWithDouble:a7];
    double v33 = [v31 predicateWithProperty:@"timestamp" lessThanOrEqualToValue:v32];

    [v27 addObject:v33];
  }
  double v34 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v27];
  [v18 setPredicate:v34];

  double v35 = +[HDRaceRouteLocationSeriesEntity _allEntityProperties]();
  id v51 = @"series_id";
  double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  double v37 = [v35 arrayByExcludingObjectsInArray:v36];

  id v38 = [v18 selectSQLForProperties:v37];
  double v39 = [v45 databaseForEntityClass:a1];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke;
  v49[3] = &unk_1E62F52C8;
  id v40 = v18;
  id v50 = v40;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke_2;
  v47[3] = &unk_1E62F5740;
  id v41 = v44;
  id v48 = v41;
  char v42 = [v39 executeSQL:v38 error:a9 bindingHandler:v49 enumerationHandler:v47];

  return v42;
}

+ (id)_allEntityProperties
{
  v2[7] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"series_id";
  v2[1] = @"timestamp";
  v2[2] = @"latitude";
  v2[3] = @"longitude";
  v2[4] = @"altitude";
  v2[5] = @"distance";
  v2[6] = @"signal_type";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];

  return v0;
}

uint64_t __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = 1;
  return [*(id *)(a1 + 32) bindToSelectStatement:a2 bindingIndex:&v3];
}

uint64_t __142__HDRaceRouteLocationSeriesEntity_enumerateRoutePointsForSeries_timestampAnchor_limit_startDuration_finishDuration_transaction_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4 = MEMORY[0x1C1879F40](a2, 0);
  double v5 = MEMORY[0x1C1879F40](a2, 1);
  double v6 = MEMORY[0x1C1879F40](a2, 2);
  double v7 = MEMORY[0x1C1879F40](a2, 3);
  double v8 = MEMORY[0x1C1879F40](a2, 4);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E650]) initWithLatitude:HDSQLiteColumnAsInt64() longitude:v5 altitude:v6 odometer:v7 timestamp:v8 signalEnvironmentType:v4];
  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v10;
}

+ (BOOL)deleteSeriesDataWithIdentifier:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e15___NSString_8__0l;
  aBlock[4] = a1;
  id v9 = _Block_copy(aBlock);
  uint64_t v10 = [v8 databaseForEntityClass:a1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke_2;
  v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v12[4] = a3;
  LOBYTE(a5) = [v10 executeCachedStatementForKey:&+[HDRaceRouteLocationSeriesEntity deleteSeriesDataWithIdentifier:transaction:error:]::deleteSQLCacheKey error:a5 SQLGenerator:v9 bindingHandler:v12 enumerationHandler:0];

  return (char)a5;
}

id __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) databaseTable];
  int v3 = [v1 stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?", v2, @"series_id"];

  return v3;
}

uint64_t __84__HDRaceRouteLocationSeriesEntity_deleteSeriesDataWithIdentifier_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

id __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[HDRaceRouteLocationSeriesEntity _allEntityProperties]();
  int v3 = [v1 insertSQLForProperties:v2 shouldReplace:1];

  return v3;
}

uint64_t __85__HDRaceRouteLocationSeriesEntity__insertRoutePoint_seriesIdentifier_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "timestamp_s");
  sqlite3_bind_double(a2, 2, v4);
  objc_msgSend(*(id *)(a1 + 32), "latitude_deg");
  sqlite3_bind_double(a2, 3, v5);
  objc_msgSend(*(id *)(a1 + 32), "longitude_deg");
  sqlite3_bind_double(a2, 4, v6);
  objc_msgSend(*(id *)(a1 + 32), "altitude_m");
  sqlite3_bind_double(a2, 5, v7);
  objc_msgSend(*(id *)(a1 + 32), "odometer_m");
  sqlite3_bind_double(a2, 6, v8);
  int v9 = [*(id *)(a1 + 32) signalEnvironmentType];

  return sqlite3_bind_int(a2, 7, v9);
}

id __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [*(id *)(a1 + 32) databaseTable];
  int v3 = [v1 stringWithFormat:@"SELECT MAX(%@) FROM %@", @"series_id", v2, 0];

  return v3;
}

uint64_t __74__HDRaceRouteLocationSeriesEntity__maxSeriesIdentifierWithDatabase_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 0;
}

uint64_t __84__HDRaceRouteLocationSeriesEntity__routeSeriesIdentifiersForWorkout_database_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  [v1 addObject:v2];

  return 1;
}

BOOL __124__HDRaceRouteLocationSeriesEntity__distanceWithEnumerator_dateInterval_distanceType_sampleBuffer_transaction_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 startDate];
  [v4 timeIntervalSinceReferenceDate];
  *(void *)&long long v43 = v5;
  double v6 = [v3 endDate];
  [v6 timeIntervalSinceReferenceDate];
  *((void *)&v43 + 1) = v7;
  double v8 = [v3 quantity];
  [v8 doubleValueForUnit:*(void *)(a1 + 32)];
  uint64_t v44 = v9;

  BOOL v42 = 0;
  uint64_t v10 = [v3 startDate];
  uint64_t v11 = [*(id *)(a1 + 40) endDate];
  LODWORD(v8) = objc_msgSend(v10, "hk_isAfterDate:", v11);

  if (!v8)
  {
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = _overlappingSampleDistanceForInterval(*(void **)(a1 + 40), (double *)&v43, &v42)+ *(double *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24);
    if (!v42)
    {
      id v16 = *(void ***)(a1 + 56);
      id v18 = (char *)v16[1];
      uint64_t v17 = (char *)v16[2];
      if (v18 >= v17)
      {
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v18 - (unsigned char *)*v16) >> 3);
        unint64_t v26 = v25 + 1;
        if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_40;
        }
        unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v17 - (unsigned char *)*v16) >> 3);
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x555555555555555) {
          unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28) {
          unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v28);
        }
        else {
          uint64_t v29 = 0;
        }
        unint64_t v36 = v28 + 24 * v25;
        unint64_t v37 = v28 + 24 * v29;
        *(_OWORD *)unint64_t v36 = v43;
        *(void *)(v36 + 16) = v44;
        double v19 = (void *)(v36 + 24);
        double v39 = (char *)*v16;
        id v38 = (char *)v16[1];
        if (v38 != *v16)
        {
          do
          {
            long long v40 = *(_OWORD *)(v38 - 24);
            *(void *)(v36 - 8) = *((void *)v38 - 1);
            *(_OWORD *)(v36 - 24) = v40;
            v36 -= 24;
            v38 -= 24;
          }
          while (v38 != v39);
          id v38 = (char *)*v16;
        }
        double *v16 = (void *)v36;
        v16[1] = v19;
        v16[2] = (void *)v37;
        if (v38) {
          operator delete(v38);
        }
      }
      else
      {
        *(_OWORD *)id v18 = v43;
        *((void *)v18 + 2) = v44;
        double v19 = v18 + 24;
      }
      v16[1] = v19;
      if (!v42) {
        goto LABEL_30;
      }
    }
    BOOL v35 = 1;
    goto LABEL_39;
  }
  id v12 = *(void ***)(a1 + 56);
  uint64_t v14 = (char *)v12[1];
  uint64_t v13 = (char *)v12[2];
  if (v14 >= v13)
  {
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (unsigned char *)*v12) >> 3);
    unint64_t v21 = v20 + 1;
    if (v20 + 1 <= 0xAAAAAAAAAAAAAAALL)
    {
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (unsigned char *)*v12) >> 3);
      if (2 * v22 > v21) {
        unint64_t v21 = 2 * v22;
      }
      if (v22 >= 0x555555555555555) {
        unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23) {
        unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v23);
      }
      else {
        uint64_t v24 = 0;
      }
      unint64_t v30 = v23 + 24 * v20;
      unint64_t v31 = v23 + 24 * v24;
      *(_OWORD *)unint64_t v30 = v43;
      *(void *)(v30 + 16) = v44;
      id v15 = (void *)(v30 + 24);
      double v33 = (char *)*v12;
      v32 = (char *)v12[1];
      if (v32 != *v12)
      {
        do
        {
          long long v34 = *(_OWORD *)(v32 - 24);
          *(void *)(v30 - 8) = *((void *)v32 - 1);
          *(_OWORD *)(v30 - 24) = v34;
          v30 -= 24;
          v32 -= 24;
        }
        while (v32 != v33);
        v32 = (char *)*v12;
      }
      void *v12 = (void *)v30;
      v12[1] = v15;
      v12[2] = (void *)v31;
      if (v32) {
        operator delete(v32);
      }
      goto LABEL_29;
    }
LABEL_40:
    std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
  }
  *(_OWORD *)uint64_t v14 = v43;
  *((void *)v14 + 2) = v44;
  id v15 = v14 + 24;
LABEL_29:
  v12[1] = v15;
LABEL_30:
  BOOL v35 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(*(void *)(a1 + 56) + 8) - **(void **)(a1 + 56)) >> 3) < *(void *)(a1 + 64);
LABEL_39:

  return v35;
}

+ (id)databaseTable
{
  return @"RacePreviousRoute_location_series";
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  {
    uint64_t v5 = a3;
    a3 = v5;
    if (v4)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor, 0, &dword_1BCB7D000);
      a3 = v5;
    }
  }
  *a3 = 7;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDRaceRouteLocationSeriesEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (BOOL)hasROWID
{
  return 0;
}

+ (id)primaryKeyColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"series_id";
  v4[1] = @"timestamp";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)insertCodableRoutePoints:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    uint64_t v10 = [v9 databaseForEntityClass:a1];
    uint64_t v11 = +[HDRaceRouteLocationSeriesEntity _maxSeriesIdentifierWithDatabase:error:]((uint64_t)a1, v10, (uint64_t)a5);

    if (v11
      && (uint64_t v12 = [v11 longLongValue] + 1,
          [a1 insertCodableRoutePoints:v8 seriesKey:v12 transaction:v9 error:a5]))
    {
      uint64_t v13 = [NSNumber numberWithLongLong:v12];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = [NSNumber numberWithLongLong:0];
  }

  return v13;
}

+ (BOOL)insertCodableRoutePoints:(id)a3 seriesKey:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [a5 databaseForEntityClass:a1];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v29 = v10;
    uint64_t v13 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v16 = objc_alloc(MEMORY[0x1E4F1E650]);
        objc_msgSend(v15, "latitude", v29);
        double v18 = v17;
        [v15 longitude];
        double v20 = v19;
        [v15 altitude];
        double v22 = v21;
        [v15 odometer];
        double v24 = v23;
        [v15 timestamp];
        unint64_t v26 = objc_msgSend(v16, "initWithLatitude:longitude:altitude:odometer:timestamp:signalEnvironmentType:", objc_msgSend(v15, "signalEnvironmentType"), v18, v20, v22, v24, v25);
        LODWORD(v15) = +[HDRaceRouteLocationSeriesEntity _insertRoutePoint:seriesIdentifier:database:error:]((uint64_t)a1, v26, a4, v11, (uint64_t)a6);

        if (!v15)
        {
          BOOL v27 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v27 = 1;
LABEL_11:

  return v27;
}

+ (id)createTableSQLWithBehavior:(id)a3
{
  id v3 = objc_msgSend(a1, "createTableSQL", a3);

  return v3;
}

+ (id)indicesWithBehavior:(id)a3
{
  id v3 = objc_msgSend(a1, "indices", a3);

  return v3;
}

+ (id)triggersWithBehavior:(id)a3
{
  id v3 = objc_msgSend(a1, "triggers", a3);

  return v3;
}

@end