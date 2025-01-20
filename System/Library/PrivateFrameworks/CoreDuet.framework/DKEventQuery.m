@interface DKEventQuery
@end

@implementation DKEventQuery

void __32___DKEventQuery_onlyLocalDevice__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  strcpy(v4, "OnlyLocalDevice");
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4];
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, 0);
  v3 = (void *)onlyLocalDevice_set;
  onlyLocalDevice_set = v2;
}

void __27___DKEventQuery_allDevices__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)"AllDevices";
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v4];
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, 0);
  v3 = (void *)allDevices_set;
  allDevices_set = v2;
}

void __33___DKEventQuery_onlyRemoteDevice__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)"OnlyRemoteDevice";
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v4];
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, 0);
  v3 = (void *)onlyRemoteDevice_set;
  onlyRemoteDevice_set = v2;
}

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke(uint64_t a1)
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v3 = (void *)MEMORY[0x1E4F1C0A8];
  long long v4 = +[_DKEvent entityName];
  uint64_t v5 = [v3 entityForName:v4 inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v5];

  [v2 setPredicate:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) limit] < 0) {
    [*(id *)(a1 + 48) setLimit:0];
  }
  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "limit"));
  objc_msgSend(v2, "setFetchOffset:", objc_msgSend(*(id *)(a1 + 48), "offset"));
  v6 = [*(id *)(a1 + 48) sortDescriptors];
  [v2 setSortDescriptors:v6];

  v7 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a1 + 48) readMetadata])
  {
    v8 = [*(id *)(a1 + 48) excludedMetadataKeys];
    if (!v8
      || ([*(id *)(a1 + 48) excludedMetadataKeys],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 count],
          v9,
          v8,
          !v10))
    {
      [v7 addObject:@"customMetadata"];
    }
    [v7 addObject:@"structuredMetadata"];
  }
  v11 = [v2 sortDescriptors];

  if (v11)
  {
    v12 = [v2 sortDescriptors];
    BOOL v13 = +[_DKPredicateValidator validateSortDescriptors:v12];

    if (v13)
    {
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      v14 = [v2 sortDescriptors];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v105 objects:v131 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v106;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v106 != v16) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v105 + 1) + 8 * i) allowEvaluation];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v105 objects:v131 count:16];
        }
        while (v15);
      }
    }
    else
    {
      v14 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_3(v2);
      }
    }
  }
  v18 = [v2 predicate];

  if (!v18) {
    goto LABEL_24;
  }
  v19 = [v2 predicate];
  id v104 = 0;
  BOOL v20 = +[_DKPredicateValidator validatePredicate:v19 allowedKeys:0 error:&v104];
  id v21 = v104;

  if (v20)
  {
    v22 = [v2 predicate];
    [v22 allowEvaluation];

LABEL_24:
    if (([*(id *)(a1 + 48) deduplicateValues] & 1) == 0) {
      [v7 addObject:@"value"];
    }
    if (([*(id *)(a1 + 48) deduplicateValues] & 1) == 0)
    {
      v23 = (void *)[v7 copy];
      [v2 setRelationshipKeyPathsForPrefetching:v23];
    }
    if ([*(id *)(a1 + 48) resultType] == 3
      || [*(id *)(a1 + 48) resultType] == 4
      || [*(id *)(a1 + 48) resultType] == 6)
    {
      [v2 setResultType:2];
    }
    v24 = [*(id *)(a1 + 48) groupByProperties];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      [v2 setResultType:2];
      objc_msgSend(v2, "setReturnsDistinctResults:", objc_msgSend(*(id *)(a1 + 48), "returnsDistinctResults"));
      uint64_t v26 = [*(id *)(a1 + 48) resultType];
      v27 = *(void **)(a1 + 48);
      if (v26 == 4)
      {
        v28 = [v27 groupByProperties];
        [v2 setPropertiesToGroupBy:v28];

        v29 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"streamName"];
        v30 = (void *)MEMORY[0x1E4F28C68];
        v130 = v29;
        v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
        v32 = [v30 expressionForFunction:@"count:" arguments:v31];

        id v33 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
        [v33 setExpression:v32];
        [v33 setName:@"count"];
        [v33 setExpressionResultType:300];
        id v129 = v33;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
        v35 = [*(id *)(a1 + 48) groupByProperties];
        v36 = [v34 arrayByAddingObjectsFromArray:v35];
        [v2 setPropertiesToFetch:v36];
      }
      else if ([v27 resultType] == 5)
      {
        v29 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"startDate.timeIntervalSinceReferenceDate"];
        v40 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"endDate.timeIntervalSinceReferenceDate"];
        v41 = (void *)MEMORY[0x1E4F28C68];
        v128[0] = v40;
        v128[1] = v29;
        v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
        v43 = [v41 expressionForFunction:@"from:subtract:" arguments:v42];

        id v44 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
        [v44 setExpression:v43];
        [v44 setName:@"duration"];
        [v44 setExpressionResultType:500];
        v45 = [*(id *)(a1 + 48) groupByProperties];
        v127[0] = v44;
        v127[1] = @"startDate";
        v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
        v47 = [v45 arrayByAddingObjectsFromArray:v46];
        [v2 setPropertiesToFetch:v47];
      }
      else if ([*(id *)(a1 + 48) resultType] == 6)
      {
        v29 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"endDate.timeIntervalSinceReferenceDate"];
        v48 = (void *)MEMORY[0x1E4F28C68];
        v126 = v29;
        v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
        v50 = [v48 expressionForFunction:@"max:" arguments:v49];

        id v51 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
        [v51 setExpression:v50];
        [v51 setName:@"endDate"];
        [v51 setExpressionResultType:900];
        v52 = [*(id *)(a1 + 48) groupByProperties];
        [v2 setPropertiesToGroupBy:v52];

        v53 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"endDate" ascending:0];
        v125 = v53;
        v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
        [v2 setSortDescriptors:v54];

        v55 = [*(id *)(a1 + 48) groupByProperties];
        id v124 = v51;
        v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
        v57 = [v55 arrayByAddingObjectsFromArray:v56];
        [v2 setPropertiesToFetch:v57];
      }
      else
      {
        v58 = [*(id *)(a1 + 48) groupByProperties];
        [v2 setPropertiesToGroupBy:v58];

        v29 = [*(id *)(a1 + 48) groupByProperties];
        [v2 setPropertiesToFetch:v29];
      }
    }
    v39 = +[_CDMutablePerfMetric perfMetricForFetchRequest:type:]((uint64_t)_CDMutablePerfMetric, v2, @"Event Queries");
    v103[0] = 0;
    v103[1] = 0;
    v59 = [MEMORY[0x1E4F1C9C8] date];
    CDPerfMetricStartTiming(v103);
    if ([*(id *)(a1 + 48) resultType] == 1)
    {
      v60 = NSNumber;
      v61 = *(void **)(a1 + 32);
      id v102 = 0;
      uint64_t v62 = [v61 countForFetchRequest:v2 error:&v102];
      id v63 = v102;
      v64 = [v60 numberWithUnsignedInteger:v62];
    }
    else
    {
      v65 = *(void **)(a1 + 32);
      id v101 = 0;
      v64 = [v65 executeFetchRequest:v2 error:&v101];
      id v63 = v101;
    }
    if (!_DKEventQueryPerformanceTesting)
    {
      v66 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v88 = [*(id *)(a1 + 48) resultType];
        v89 = "executeFetchRequest";
        if (v88 == 1) {
          v89 = "countForFetchRequest";
        }
        v95 = v89;
        uint64_t v94 = [v2 fetchLimit];
        [v59 timeIntervalSinceNow];
        double v91 = v90;
        uint64_t v100 = [*(id *)(a1 + 48) resultType];
        v97 = v64;
        if (v100 != 1)
        {
          v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
        }
        int v92 = _DKQueryLoggingEnabled();
        if (v92)
        {
          v96 = [v2 predicate];
        }
        else
        {
          v96 = @"<not shown>";
        }
        v93 = [v2 sortDescriptors];
        *(_DWORD *)buf = 136316418;
        v113 = v95;
        __int16 v114 = 2048;
        uint64_t v115 = v94;
        __int16 v116 = 2048;
        double v117 = -v91;
        __int16 v118 = 2112;
        v119 = v97;
        __int16 v120 = 2112;
        v121 = v96;
        __int16 v122 = 2112;
        v123 = v93;
        _os_log_debug_impl(&dword_18ECEB000, v66, OS_LOG_TYPE_DEBUG, "_DKEventQuery executeUsingCoreDataStorage finished %s, fetchLimit %lu object(s), elapsed %f(sec), returned %@ object(s), Predicate: %@, Sort descriptors: %@ ", buf, 0x3Eu);

        if (v92) {
        if (v100 != 1)
        }
      }
    }
    if (v63)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v63);
      CDPerfMetricEndTimingAndIncrementErrorCount(v39, (uint64_t)v103);
    }
    else
    {
      v67 = objc_alloc_init(_DKObjectMOConverter);
      -[_DKObjectMOConverter setReadMetadata:](v67, "setReadMetadata:", [*(id *)(a1 + 48) readMetadata]);
      -[_DKObjectMOConverter setDeduplicateValues:](v67, "setDeduplicateValues:", [*(id *)(a1 + 48) deduplicateValues]);
      v68 = [*(id *)(a1 + 48) excludedMetadataKeys];
      [(_DKObjectMOConverter *)v67 setExcludedMetadataKeys:v68];

      switch([*(id *)(a1 + 48) resultType])
      {
        case 0:
          uint64_t v79 = [(_DKObjectMOConverter *)v67 objectsFromManagedObjects:v64];
          uint64_t v80 = *(void *)(*(void *)(a1 + 72) + 8);
          v81 = *(void **)(v80 + 40);
          *(void *)(v80 + 40) = v79;

          if (_os_feature_enabled_impl())
          {
            v82 = *(void **)(a1 + 56);
            if (v82)
            {
              if ([v82 count])
              {
                uint64_t v76 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) arrayByAddingObjectsFromArray:*(void *)(a1 + 56)];
                uint64_t v77 = *(void *)(a1 + 72);
                goto LABEL_56;
              }
            }
          }
          goto LABEL_63;
        case 1:
          v99 = NSNumber;
          uint64_t v83 = [v64 unsignedIntegerValue];
          v71 = [*(id *)(a1 + 56) firstObject];
          v84 = objc_msgSend(v99, "numberWithUnsignedInteger:", objc_msgSend(v71, "unsignedIntegerValue") + v83);
          v111 = v84;
          uint64_t v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
          uint64_t v86 = *(void *)(*(void *)(a1 + 72) + 8);
          v87 = *(void **)(v86 + 40);
          *(void *)(v86 + 40) = v85;

          goto LABEL_62;
        case 2:
          uint64_t v76 = [(_DKObjectMOConverter *)v67 dataIntervalsFromManagedObjects:v64];
          uint64_t v77 = *(void *)(a1 + 72);
LABEL_56:
          uint64_t v78 = *(void *)(v77 + 8);
          v71 = *(void **)(v78 + 40);
          *(void *)(v78 + 40) = v76;
          goto LABEL_62;
        case 3:
        case 4:
        case 5:
        case 6:
          uint64_t v69 = *(void *)(*(void *)(a1 + 72) + 8);
          id v70 = v64;
          v71 = *(void **)(v69 + 40);
          *(void *)(v69 + 40) = v70;
          goto LABEL_62;
        default:
          v71 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported result type: %ld", objc_msgSend(*(id *)(a1 + 48), "resultType"));
          v98 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v109 = *MEMORY[0x1E4F28568];
          v110 = v71;
          v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
          uint64_t v73 = [v98 errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:v72];
          uint64_t v74 = *(void *)(*(void *)(a1 + 64) + 8);
          v75 = *(void **)(v74 + 40);
          *(void *)(v74 + 40) = v73;

LABEL_62:
LABEL_63:
          CDPerfMetricEndTimingAndSetResultCount(v39, (uint64_t)v103, [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count]);

          break;
      }
    }

    goto LABEL_65;
  }
  v37 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
    __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_2(v2);
  }

  uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
  v39 = *(void **)(v38 + 40);
  *(void *)(v38 + 40) = v21;
LABEL_65:
}

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "[_DKEventQuery executeUsingCoreDataStorage] caught %@", v1, 0xCu);
}

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_2(void *a1)
{
  v1 = [a1 predicate];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_18ECEB000, v2, v3, "Client provided invalid predicate %@", v4, v5, v6, v7, v8);
}

void __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke_cold_3(void *a1)
{
  v1 = [a1 sortDescriptors];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17(&dword_18ECEB000, v2, v3, "Client provided invalid sortDescriptors %@", v4, v5, v6, v7, v8);
}

@end