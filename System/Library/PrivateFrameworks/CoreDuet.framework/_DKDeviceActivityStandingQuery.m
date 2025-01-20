@interface _DKDeviceActivityStandingQuery
- (NSString)queryIdentifier;
- (OS_xpc_object)activity;
- (_DKDeviceActivityStandingQuery)init;
- (_DKHistogram)histogramForDate:(void *)a3 withReference:(void *)a4 andUpdate:;
- (double)_deviceActivityEphemerality;
- (id)_customIdentifierForDayOfWeek:(void *)a1;
- (id)_predicateForDeletedEventsWithReferenceDate:(uint64_t)a1;
- (id)fetchResult;
- (id)fetchResultForDayOfWeek:(int64_t)a3;
- (id)fetchResultForDayOfWeek:(int64_t)a3 withStorage:(id)a4;
- (id)fetchResultFromStorage:(id)a3;
- (uint64_t)_shouldDefer;
- (void)executeWithStorage:(id)a3;
- (void)executeWithStorage:(id)a3 referenceDate:(id)a4;
- (void)setActivity:(id)a3;
- (void)setQueryIdentifier:(id)a3;
@end

@implementation _DKDeviceActivityStandingQuery

- (_DKDeviceActivityStandingQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKDeviceActivityStandingQuery;
  v2 = [(_DKDeviceActivityStandingQuery *)&v6 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    [(_DKDeviceActivityStandingQuery *)v2 setQueryIdentifier:v4];
  }
  return v2;
}

- (uint64_t)_shouldDefer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    result = [(id)result activity];
    if (result)
    {
      v2 = (void *)result;
      v3 = [v1 activity];
      BOOL should_defer = xpc_activity_should_defer(v3);

      if (should_defer)
      {
        v5 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v6 = [v1 queryIdentifier];
          int v7 = 138412290;
          v8 = v6;
          _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "Activity deferral requested for %@", (uint8_t *)&v7, 0xCu);
        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (double)_deviceActivityEphemerality
{
  if (!a1) {
    return 0.0;
  }
  v1 = +[_DKSystemEventStreams deviceActivityLevelStream];
  v2 = +[_CDEventStreams eventStreamPropertiesForEventStream:v1];
  [v2 timeToLive];
  double v4 = v3;

  return v4;
}

- (id)_customIdentifierForDayOfWeek:(void *)a1
{
  if (a1)
  {
    double v3 = NSString;
    double v4 = [a1 queryIdentifier];
    v5 = [NSNumber numberWithInteger:a2];
    objc_super v6 = [v3 stringWithFormat:@"%@-%@-%@", v4, v5, &unk_1EDE1E0D8];
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (id)_predicateForDeletedEventsWithReferenceDate:(uint64_t)a1
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    double v4 = [v3 dateByAddingTimeInterval:--[_DKDeviceActivityStandingQuery _deviceActivityEphemerality](a1)];

    v5 = +[_DKQuery predicateForEventsWithStartDateOrCreationDateBefore:v4];
    objc_super v6 = +[_DKPredictor deviceActivityLikelihoodQueryPredicate];
    int v7 = (void *)MEMORY[0x1E4F28BA0];
    v11[0] = v6;
    v11[1] = v5;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)executeWithStorage:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [(_DKDeviceActivityStandingQuery *)self executeWithStorage:v5 referenceDate:v6];
}

- (_DKHistogram)histogramForDate:(void *)a3 withReference:(void *)a4 andUpdate:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v11 = [v10 component:512 fromDate:v7];

    v12 = [NSNumber numberWithInteger:v11];
    v13 = [v9 objectForKeyedSubscript:v12];

    if (!v13)
    {
      v13 = objc_alloc_init(_DKHistogram);
      v14 = +[_DKSystemEventStreams deviceActivityLevelStream];
      [(_DKHistogram *)v13 setStream:v14];

      v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
      [(_DKHistogram *)v13 setInterval:v15];

      v16 = -[_DKDeviceActivityStandingQuery _customIdentifierForDayOfWeek:](a1, v11);
      [(_DKHistogram *)v13 setCustomIdentifier:v16];

      v17 = [NSNumber numberWithInteger:v11];
      [v9 setObject:v13 forKeyedSubscript:v17];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)executeWithStorage:(id)a3 referenceDate:(id)a4
{
  v131[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self) & 1) == 0)
  {
    uint64_t v8 = -[_DKDeviceActivityStandingQuery _predicateForDeletedEventsWithReferenceDate:]((uint64_t)self, v7);
    id v9 = +[_DKSystemEventStreams deviceActivityLevelStream];
    v131[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:1];
    uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v130 = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
    v97 = (void *)v8;
    v13 = +[_DKEventQuery eventQueryWithPredicate:v8 eventStreams:v10 offset:0 limit:0 sortDescriptors:v12];

    v14 = [(_DKDeviceActivityStandingQuery *)self queryIdentifier];
    if (v14)
    {
      [v13 setClientName:v14];
    }
    else
    {
      v15 = [NSString stringWithUTF8String:"_DKStandingQuery.m"];
      v16 = objc_msgSend(v15, "stringByAppendingFormat:", @":%d", 118);
      [v13 setClientName:v16];
    }
    id v121 = 0;
    v17 = [v6 executeQuery:v13 error:&v121];
    id v18 = v121;
    if (-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self)) {
      goto LABEL_77;
    }
    if (v18)
    {
      v19 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.6((uint64_t)v18, v19);
      }
    }
    if (![v17 count])
    {
      v106 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG)) {
        -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:](v106, v68, v69);
      }
      goto LABEL_76;
    }
    id v94 = v18;
    v106 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:7];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    obj = v17;
    v20 = "apport(Push), Cloud(Down) & Cloud(Up)";
    uint64_t v100 = [obj countByEnumeratingWithState:&v117 objects:v129 count:16];
    id v102 = v6;
    v95 = v17;
    v96 = v13;
    if (v100)
    {
      uint64_t v98 = *(void *)v118;
LABEL_13:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v118 != v98) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v117 + 1) + 8 * v21);
        if (-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self)) {
          break;
        }
        v23 = (void *)MEMORY[0x192FB2F20]();
        v24 = [v22 startDate];
        v25 = v24;
        if (self) {
          uint64_t v26 = (int)[v24 slotFromMidnightWithTotalSlotsInDay:96];
        }
        else {
          uint64_t v26 = 0;
        }

        v27 = [v22 startDate];
        v28 = -[_DKDeviceActivityStandingQuery histogramForDate:withReference:andUpdate:](self, v27, v7, v106);

        v29 = [v22 startDate];
        [v7 timeIntervalSinceDate:v29];
        double v31 = v30;
        double v32 = -[_DKDeviceActivityStandingQuery _deviceActivityEphemerality]((uint64_t)self);
        if (v31 <= v32)
        {
          v70 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
            -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:].cold.5(v70, v71, v72);
          }

          v17 = v95;
          v13 = v96;
          v20 = "apport(Push), Cloud(Down) & Cloud(Up)";
          goto LABEL_55;
        }
        double v33 = v32;
        context = v23;
        float v34 = (v31 - v32) / -604800.0;
        double v35 = exp2f(v34);
        v36 = [NSNumber numberWithInteger:v26];
        [v28 addValue:v36 withCount:v35];

        v37 = [v22 endDate];
        [v37 timeIntervalSinceDate:v29];
        int v39 = (int)v38;

        v40 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = [v22 endDate];
          *(_DWORD *)buf = 138412802;
          id v124 = v29;
          __int16 v125 = 2112;
          v126 = v41;
          __int16 v127 = 1024;
          int v128 = v39;
          _os_log_impl(&dword_18ECEB000, v40, OS_LOG_TYPE_INFO, "Binning event with startDate: %@, endDate: %@ (excessTime = %d)", buf, 0x1Cu);
        }
        if (v39 < 1)
        {
          v43 = v29;
          v45 = v28;
        }
        else
        {
          while (1)
          {
            v42 = (void *)MEMORY[0x192FB2F20]();
            if (v39 <= 0x384) {
              break;
            }
            v43 = [v29 dateByAddingTimeInterval:900.0];

            if (self) {
              uint64_t v44 = (int)[v43 slotFromMidnightWithTotalSlotsInDay:96];
            }
            else {
              uint64_t v44 = 0;
            }
            v45 = -[_DKDeviceActivityStandingQuery histogramForDate:withReference:andUpdate:](self, v43, v7, v106);

            [v7 timeIntervalSinceDate:v43];
            if (v46 <= v33)
            {
              v66 = +[_CDLogging knowledgeChannel];
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
                -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:](&v113, v114, v66);
              }
              v29 = v43;
LABEL_39:

              goto LABEL_41;
            }
            float v47 = (v46 - v33) / -604800.0;
            double v48 = exp2f(v47);
            v49 = [NSNumber numberWithInteger:v44];
            [v45 addValue:v49 withCount:v48];

            v50 = [v22 endDate];
            [v50 timeIntervalSinceDate:v43];
            int v39 = (int)v51;

            v28 = v45;
            v29 = v43;
            if (v39 <= 0) {
              goto LABEL_42;
            }
          }
          [v29 timeIntervalSince1970];
          double v53 = fmod(v52, 900.0);
          v54 = [v22 endDate];
          [v54 timeIntervalSinceDate:v29];
          double v56 = v55;

          if (v53 + v56 > 900.0)
          {
            v57 = objc_msgSend(v22, "endDate", v53 + v56);
            v58 = v57;
            if (self) {
              uint64_t v59 = (int)[v57 slotFromMidnightWithTotalSlotsInDay:96];
            }
            else {
              uint64_t v59 = 0;
            }

            v60 = [v22 endDate];
            v45 = -[_DKDeviceActivityStandingQuery histogramForDate:withReference:andUpdate:](self, v60, v7, v106);

            v61 = [v22 endDate];
            [v7 timeIntervalSinceDate:v61];
            double v63 = v62;

            if (v63 <= v33)
            {
              v66 = +[_CDLogging knowledgeChannel];
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
                -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:](&v115, v116, v66);
              }
            }
            else
            {
              float v64 = (v63 - v33) / -604800.0;
              double v65 = exp2f(v64);
              v66 = [NSNumber numberWithInteger:v59];
              [v45 addValue:v66 withCount:v65];
            }
            goto LABEL_39;
          }
          v45 = v28;
LABEL_41:
          v43 = v29;
        }
LABEL_42:

        ++v21;
        id v6 = v102;
        if (v21 == v100)
        {
          uint64_t v67 = [obj countByEnumeratingWithState:&v117 objects:v129 count:16];
          v17 = v95;
          v13 = v96;
          v20 = "Rapport(Push), Cloud(Down) & Cloud(Up)" + 1;
          uint64_t v100 = v67;
          if (v67) {
            goto LABEL_13;
          }
          goto LABEL_55;
        }
      }
    }
    else
    {
LABEL_55:

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      obj = v106;
      uint64_t v101 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
      if (!v101)
      {
LABEL_75:
        id v18 = v94;

LABEL_76:
LABEL_77:

        goto LABEL_78;
      }
      uint64_t v99 = *(void *)v110;
      double v73 = *((double *)v20 + 171);
LABEL_57:
      uint64_t v74 = 0;
      while (1)
      {
        if (*(void *)v110 != v99) {
          objc_enumerationMutation(obj);
        }
        v75 = *(void **)(*((void *)&v109 + 1) + 8 * v74);
        if (-[_DKDeviceActivityStandingQuery _shouldDefer]((uint64_t)self)) {
          break;
        }
        uint64_t v76 = -[_DKDeviceActivityStandingQuery _customIdentifierForDayOfWeek:](self, [v75 integerValue]);
        v77 = +[_DKSystemEventStreams deviceActivityLevelStream];
        contexta = (void *)v76;
        v78 = +[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:v77 withCustomIdentifier:v76];

        id v108 = 0;
        v79 = [v6 executeQuery:v78 error:&v108];
        id v80 = v108;
        if (v80)
        {
          v81 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v124 = v80;
            _os_log_debug_impl(&dword_18ECEB000, v81, OS_LOG_TYPE_DEBUG, "Encountered error while fetching existing device activity histogram: %@", buf, 0xCu);
          }
        }
        v82 = [obj objectForKeyedSubscript:v75];
        if (v79)
        {
          uint64_t v83 = [v6 deleteHistogram:v79];
          if (v83 != 1)
          {
            uint64_t v92 = v83;
            v93 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
              -[_DKDeviceActivityStandingQuery executeWithStorage:referenceDate:](v92, v93);
            }

            break;
          }
          v84 = [v79 interval];
          v85 = [v84 endDate];
          [v7 timeIntervalSinceDate:v85];
          double v87 = v86;

          id v6 = v102;
          float v88 = v87 / v73;
          double v89 = exp2f(v88);
          v90 = [obj objectForKeyedSubscript:v75];
          [v79 addHistogram:v90 decayingExistingCounts:v89];

          id v91 = v79;
          v82 = v91;
        }
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __67___DKDeviceActivityStandingQuery_executeWithStorage_referenceDate___block_invoke;
        v107[3] = &unk_1E5610478;
        v107[4] = v75;
        [v6 saveHistogram:v82 responseQueue:0 withCompletion:v107];

        if (v101 == ++v74)
        {
          uint64_t v101 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
          if (v101) {
            goto LABEL_57;
          }
          break;
        }
      }
    }
    v17 = v95;
    v13 = v96;
    goto LABEL_75;
  }
LABEL_78:
}

- (id)fetchResult
{
  id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v3 component:512 fromDate:v4];

  return [(_DKDeviceActivityStandingQuery *)self fetchResultForDayOfWeek:v5];
}

- (id)fetchResultForDayOfWeek:(int64_t)a3
{
  uint64_t v5 = +[_DKKnowledgeStore knowledgeStore];
  id v6 = [(_DKDeviceActivityStandingQuery *)self fetchResultForDayOfWeek:a3 withStorage:v5];

  return v6;
}

- (id)fetchResultFromStorage:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v6 component:512 fromDate:v7];

  id v9 = [(_DKDeviceActivityStandingQuery *)self fetchResultForDayOfWeek:v8 withStorage:v5];

  return v9;
}

- (id)fetchResultForDayOfWeek:(int64_t)a3 withStorage:(id)a4
{
  id v6 = a4;
  id v7 = -[_DKDeviceActivityStandingQuery _customIdentifierForDayOfWeek:](self, a3);
  uint64_t v8 = +[_DKSystemEventStreams deviceActivityLevelStream];
  id v9 = +[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:v8 withCustomIdentifier:v7];

  v10 = [v6 executeQuery:v9 error:0];

  return v10;
}

- (NSString)queryIdentifier
{
  return self->queryIdentifier;
}

- (void)setQueryIdentifier:(id)a3
{
}

- (OS_xpc_object)activity
{
  return self->activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->activity, 0);
  objc_storeStrong((id *)&self->queryIdentifier, 0);
}

- (void)executeWithStorage:(uint64_t)a3 referenceDate:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  OUTLINED_FUNCTION_0_14(&dword_18ECEB000, a1, a3, "No device activity events to process.", v3);
}

- (void)executeWithStorage:(uint64_t)a1 referenceDate:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithUnsignedInteger:a1];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Did not delete expected number of histograms (%@).", (uint8_t *)&v4, 0xCu);
}

- (void)executeWithStorage:(NSObject *)a3 referenceDate:.cold.3(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_14(&dword_18ECEB000, a3, (uint64_t)a3, "Encountered event still has time to live, skip soon-to-to-deleted histogram construction as this point.", a1);
}

- (void)executeWithStorage:(uint64_t)a3 referenceDate:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  OUTLINED_FUNCTION_0_14(&dword_18ECEB000, a1, a3, "Encountered event still has time to live, skip soon-to-to-deleted historgram construction as this point.", v3);
}

- (void)executeWithStorage:(uint64_t)a1 referenceDate:(NSObject *)a2 .cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Encountered error while fetching device activity events to be deleted: %@.", (uint8_t *)&v2, 0xCu);
}

@end