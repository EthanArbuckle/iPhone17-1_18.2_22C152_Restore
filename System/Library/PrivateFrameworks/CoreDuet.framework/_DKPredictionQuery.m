@interface _DKPredictionQuery
+ (BOOL)supportsSecureCoding;
+ (id)predictionQueryForStream:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5;
+ (id)predictionQueryForStreams:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5;
+ (id)topNPredictionQueryForStream:(id)a3 withPredicate:(id)a4 withTopN:(int64_t)a5 withMinLikelihood:(double)a6;
+ (uint64_t)calendar:(void *)a3 isWeekendWithIntervalToWeekdayWeekendTransition:(void *)a4 containingOrAfterDate:;
- (BOOL)both:(void *)a3 and:(void *)a4 areSameDayOfWeekWith:;
- (BOOL)useHistoricalHistogram;
- (NSDate)asOfDate;
- (_DKKnowledgeStorage)storage;
- (_DKPredictionQuery)initWithCoder:(id)a3;
- (id)constructTimelineWithObservations:(void *)a3 withFirstEventDate:(void *)a4 withHistogramInterval:(void *)a5 withPredictionStartDate:(double)a6 durationSinceFirstEvent:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4;
- (id)handleResults:(id)a3 error:(id)a4;
- (id)likelihoodForTopN:(void *)a3 withMinLikelihood:(double)a4 withData:;
- (id)predictionHandler;
- (id)predictionOfType:(void *)a3 withData:;
- (int)minimumDaysOfHistory;
- (int)slotDuration;
- (uint64_t)both:(void *)a3 and:(void *)a4 areWeekendOrWeekdayWithCalendar:;
- (uint64_t)shouldIncludeEventWithStartDate:(int)a3 eventSlot:(void *)a4 withPredictionStartDate:(uint64_t)a5 withPartitionType:(void *)a6 andCalendar:;
- (unint64_t)partitionType;
- (unint64_t)type;
- (void)addEventsToObservations:(void *)a3 startingHistogram:(void *)a4 endingHistogram:(void *)a5 withPredictionDate:;
- (void)encodeWithCoder:(id)a3;
- (void)handleEventPredictionWithEventStartDate:(void *)a3 eventEndDate:(void *)a4 predictionStartDate:(void *)a5 durationSinceFirstEvent:(void *)a6 calendar:(int)a7 observations:(double)a8 useWeights:;
- (void)handleImpulsePredictionWithEventStartDate:(void *)a3 predictionStartDate:(void *)a4 durationSinceFirstEvent:(void *)a5 calendar:(void *)a6 observations:(_DWORD *)a7 lastDate:(double)a8 lastSlot:;
- (void)setAsOfDate:(id)a3;
- (void)setMinimumDaysOfHistory:(int)a3;
- (void)setPartitionType:(unint64_t)a3;
- (void)setPredictionHandler:(id)a3;
- (void)setSlotDuration:(int)a3;
- (void)setStorage:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUseHistoricalHistogram:(BOOL)a3;
- (void)setValueForIndex:(void *)a3 forObservations:(double)a4 withDenominator:;
@end

@implementation _DKPredictionQuery

- (id)constructTimelineWithObservations:(void *)a3 withFirstEventDate:(void *)a4 withHistogramInterval:(void *)a5 withPredictionStartDate:(double)a6 durationSinceFirstEvent:
{
  v70[1] = *(double *)MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    uint64_t v15 = *(void *)(a1 + 152);
    if (a6 < 1209600.0) {
      uint64_t v15 = 0;
    }
    if (v15 == 2)
    {
      id v24 = v12;
      [v24 timeIntervalSinceDate:v14];
      double v25 = 0.0;
      if (v26 >= 0.0)
      {
        v27 = v24;
      }
      else
      {
        do
        {
          v27 = [v24 dateByAddingTimeInterval:604800.0];

          double v25 = v25 + 1.0;
          [v27 timeIntervalSinceDate:v14];
          id v24 = v27;
        }
        while (v28 < 0.0);
      }
      v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
      if (v13)
      {
        v42 = [v13 startDate];
        [v42 timeIntervalSinceDate:v41];
        double v44 = v43;

        if (v44 >= -4233600.0)
        {
          int v45 = vcvtpd_s64_f64(v44 / -604800.0);
          double v46 = 1.0;
          if (v45 >= 2)
          {
            for (int i = 1; i != v45; ++i)
              double v46 = v46 + 1.0 / ldexp(1.0, i);
          }
          double v25 = v25 + v46;
        }
        else
        {
          double v25 = v25 + 2.0;
        }
      }
      v48 = [v14 dateByAddingTimeInterval:86400.0];
      [v27 timeIntervalSinceDate:v48];
      double v50 = v49;

      if (v50 >= 0.0)
      {
        if (*(int *)(a1 + 140) >= 1)
        {
          int v57 = 0;
          do
            -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v57++, v11, v25 + -1.0);
          while (v57 < *(_DWORD *)(a1 + 140));
        }
      }
      else
      {
        v68 = &v62;
        id v51 = v14;
        [v27 timeIntervalSinceDate:v14];
        if (v52 < 0.0) {
          double v52 = v52 + ceil(v52 / -86400.0) * 86400.0;
        }
        uint64_t v53 = *(int *)(a1 + 140);
        if ((int)v53 >= 1)
        {
          int v54 = 0;
          int v55 = (uint64_t)v52 / *(int *)(a1 + 132) % v53;
          do
          {
            if (v54 >= v55) {
              double v56 = 0.0;
            }
            else {
              double v56 = 1.0;
            }
            -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v54++, v11, v25 - v56);
          }
          while (v54 < *(_DWORD *)(a1 + 140));
        }
        id v14 = v51;
      }
    }
    else
    {
      if (v15 != 1)
      {
        if (!v15)
        {
          [v12 timeIntervalSinceDate:v14];
          double v17 = v16;
          if (v16 < 0.0) {
            double v17 = v16 + ceil(v16 / -86400.0) * 86400.0;
          }
          uint64_t v18 = *(int *)(a1 + 132);
          uint64_t v19 = *(int *)(a1 + 140);
          [v12 timeIntervalSinceDate:v14];
          if (*(int *)(a1 + 140) >= 1)
          {
            uint64_t v21 = 0;
            int v22 = -(int)(v20 / 86400.0);
            uint64_t v23 = ((uint64_t)v17 / v18 % v19);
            do
            {
              if (v23 == v21) {
                ++v22;
              }
              if (v22) {
                -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v21, v11, (double)v22);
              }
              else {
                [v11 setObject:&unk_1EDE1DCA0 atIndexedSubscript:v21];
              }
              ++v21;
            }
            while (v21 < *(int *)(a1 + 140));
          }
        }
        goto LABEL_67;
      }
      id v63 = v13;
      v27 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      double v69 = 0.0;
      v70[0] = 0.0;
      LODWORD(v68) = +[_DKPredictionQuery calendar:isWeekendWithIntervalToWeekdayWeekendTransition:containingOrAfterDate:]((uint64_t)_DKPredictionQuery, v27, v70, v12);
      int v67 = +[_DKPredictionQuery calendar:isWeekendWithIntervalToWeekdayWeekendTransition:containingOrAfterDate:]((uint64_t)_DKPredictionQuery, v27, &v69, v14);
      v65 = &v62;
      v29 = (char *)&v62 - ((4 * *(unsigned int *)(a1 + 140) + 15) & 0x7FFFFFFF0);
      bzero(v29, 4 * *(int *)(a1 + 140));
      id v64 = v12;
      id v30 = v12;
      [v14 timeIntervalSinceDate:v30];
      double v32 = v31;
      id v66 = v14;
      [v30 timeIntervalSinceDate:v14];
      if (v33 < 0.0) {
        double v33 = v33 + ceil(v33 / -86400.0) * 86400.0;
      }
      uint64_t v34 = *(int *)(a1 + 132);
      uint64_t v35 = *(int *)(a1 + 140);
      int v36 = (uint64_t)v33 / v34 % v35;
      double v37 = v69 - (double)((int)v34 * v36);
      int v38 = v67;
      if (v37 <= 0.0)
      {
        int v38 = v67 ^ 1;
        double v37 = 1.79769313e308;
      }
      if (v32 <= 0.0)
      {
        v39 = v30;
      }
      else
      {
        while (1)
        {
          if (((v68 ^ v38) & 1) == 0) {
            ++*(_DWORD *)&v29[4 * v36];
          }
          v39 = [v30 dateByAddingTimeInterval:(double)*(int *)(a1 + 132)];

          double v40 = (double)*(int *)(a1 + 132);
          double v32 = v32 - v40;
          if (v32 <= 0.0) {
            break;
          }
          v70[0] = v70[0] - v40;
          if (v70[0] <= 0.0)
          {
            LODWORD(v68) = v68 ^ 1;
            +[_DKPredictionQuery calendar:isWeekendWithIntervalToWeekdayWeekendTransition:containingOrAfterDate:]((uint64_t)_DKPredictionQuery, v27, v70, v39);
          }
          ++v36;
          LODWORD(v35) = *(_DWORD *)(a1 + 140);
          if (v36 == v35)
          {
            int v36 = 0;
            double v37 = v69;
            int v38 = v67;
          }
          else if (v37 - (double)*(int *)(a1 + 132) > 0.0)
          {
            double v37 = v37 - (double)*(int *)(a1 + 132);
          }
          else
          {
            v38 ^= 1u;
            double v37 = 1.79769313e308;
          }
          id v30 = v39;
          if (v32 <= 0.0) {
            goto LABEL_62;
          }
        }
        LODWORD(v35) = *(_DWORD *)(a1 + 140);
      }
LABEL_62:
      id v13 = v63;
      id v12 = v64;
      if ((int)v35 >= 1)
      {
        uint64_t v58 = 0;
        do
        {
          -[_DKPredictionQuery setValueForIndex:forObservations:withDenominator:](a1, v58, v11, (double)*(int *)&v29[4 * v58]);
          ++v58;
        }
        while (v58 < *(int *)(a1 + 140));
      }

      id v14 = v66;
    }

LABEL_67:
    v59 = [MEMORY[0x1E4F1C978] arrayWithArray:v11];
    v60 = +[_DKPredictionTimeline timelineWithValues:v59 eachWithDuration:v14 startingAt:(double)*(int *)(a1 + 132)];

    goto LABEL_68;
  }
  v60 = 0;
LABEL_68:

  return v60;
}

- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4
{
  if (self->_isTopNPrediction)
  {
    v19.receiver = self;
    v19.super_class = (Class)_DKPredictionQuery;
    id v6 = a3;
    v7 = [(_DKEventQuery *)&v19 executeUsingCoreDataStorage:v6 error:a4];

    if (a4) {
      id v8 = *a4;
    }
    else {
      id v8 = 0;
    }
    v18.receiver = self;
    v18.super_class = (Class)_DKPredictionQuery;
    id v11 = [(_DKEventQuery *)&v18 handleResults:v7 error:v8];
    uint64_t v12 = -[_DKPredictionQuery likelihoodForTopN:withMinLikelihood:withData:]((uint64_t)self, self->_topN, v11, self->_minLikelihood);
  }
  else
  {
    id v9 = a3;
    [(_DKEventQuery *)self setResultType:3];
    [(_DKEventQuery *)self setGroupByProperties:&unk_1EDE1E6E0];
    v16.receiver = self;
    v16.super_class = (Class)_DKPredictionQuery;
    id v17 = 0;
    v10 = [(_DKEventQuery *)&v16 executeUsingCoreDataStorage:v9 error:&v17];

    id v11 = v17;
    v15.receiver = self;
    v15.super_class = (Class)_DKPredictionQuery;
    v7 = [(_DKEventQuery *)&v15 handleResults:v10 error:v11];

    if (a4 && v11) {
      *a4 = v11;
    }
    uint64_t v12 = -[_DKPredictionQuery predictionOfType:withData:]((uint64_t)self, self->_type, v7);
  }
  id v13 = (void *)v12;

  return v13;
}

- (id)predictionOfType:(void *)a3 withData:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (a1)
  {
    if ([v4 count])
    {
      id v88 = *(id *)(a1 + 160);
      id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(int *)(a1 + 140)];
      if (*(int *)(a1 + 140) >= 1)
      {
        uint64_t v7 = 0;
        do
          [v6 setObject:&unk_1EDE1DCA0 atIndexedSubscript:v7++];
        while (v7 < *(int *)(a1 + 140));
      }
      v86 = v6;
      uint64_t v87 = a1;
      v85 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v89 = [MEMORY[0x1E4F1CA48] array];
      id v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      uint64_t v9 = [v8 secondsFromGMT];

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      v82 = v5;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v95 objects:v108 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        double v13 = (double)v9;
        uint64_t v14 = *(void *)v96;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v96 != v14) {
              objc_enumerationMutation(v10);
            }
            objc_super v16 = *(void **)(*((void *)&v95 + 1) + 8 * i);
            id v17 = [v16 valueForKey:@"secondsFromGMT"];
            [v17 doubleValue];
            double v19 = v18;

            if (v19 == v13)
            {
              [v89 addObject:v16];
            }
            else
            {
              double v20 = [v16 objectForKeyedSubscript:@"startDate"];
              uint64_t v21 = [v16 objectForKeyedSubscript:@"endDate"];
              double v22 = v19 - v13;
              uint64_t v23 = [v20 dateByAddingTimeInterval:v22];

              id v24 = [v21 dateByAddingTimeInterval:v22];

              v106[0] = @"startDate";
              v106[1] = @"endDate";
              v107[0] = v23;
              v107[1] = v24;
              double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:2];
              [v89 addObject:v25];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v95 objects:v108 count:16];
        }
        while (v12);
      }

      [v89 sortUsingComparator:&__block_literal_global_44];
      double v26 = [v89 firstObject];
      v27 = [v26 objectForKeyedSubscript:@"startDate"];
      [v88 timeIntervalSinceDate:v27];
      double v29 = v28;

      double v30 = (double)(86400 * *(_DWORD *)(v87 + 136));
      double v31 = +[_CDLogging knowledgeChannel];
      double v32 = v31;
      if (v29 < v30)
      {
        double v33 = v86;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[_DKPredictionQuery predictionOfType:withData:]();
        }

        uint64_t v34 = +[_DKPredictionTimeline predictionUnavailable];
LABEL_73:
        v5 = v82;

        goto LABEL_74;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v42 = [v89 firstObject];
        double v43 = [v42 objectForKeyedSubscript:@"startDate"];
        *(_DWORD *)buf = 138412802;
        id v101 = v88;
        __int16 v102 = 2112;
        v103 = v43;
        __int16 v104 = 2048;
        double v105 = v29;
        _os_log_debug_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_DEBUG, "Prediction Start Date %@, First Object Start: %@, Duration: %lf", buf, 0x20u);
      }
      if (*(unsigned char *)(v87 + 128))
      {
        uint64_t v36 = *(void *)(v87 + 152);
        switch(v36)
        {
          case 2:
            v39 = [(id)v87 storage];
            double v40 = v39;
            if (v39)
            {
              v41 = v39;
            }
            else
            {
              v41 = +[_DKKnowledgeStore knowledgeStoreWithDirectReadOnlyAccess];
            }
            double v37 = v41;

            double v44 = objc_alloc_init(_DKDeviceActivityStandingQuery);
            uint64_t v45 = [v85 component:512 fromDate:v88];
            double v46 = [v88 dateByAddingTimeInterval:86399.0];
            uint64_t v47 = [v85 component:512 fromDate:v46];

            v48 = [(_DKDeviceActivityStandingQuery *)v44 fetchResultForDayOfWeek:v45 withStorage:v37];
            if (v45 == v47)
            {
              double v49 = 0;
            }
            else
            {
              double v49 = [(_DKDeviceActivityStandingQuery *)v44 fetchResultForDayOfWeek:v47 withStorage:v37];
            }
            -[_DKPredictionQuery addEventsToObservations:startingHistogram:endingHistogram:withPredictionDate:](v87, v86, v48, v49, v88);
            if (v48 && v49)
            {
              double v50 = [v48 interval];
              id v51 = [v50 startDate];
              double v52 = [v49 interval];
              uint64_t v53 = [v52 startDate];
              [v51 timeIntervalSinceDate:v53];
              if (v54 > 0.0) {
                int v55 = v49;
              }
              else {
                int v55 = v48;
              }
              uint64_t v38 = [v55 interval];

              id v80 = v48;
              id v79 = v49;
            }
            else if (v48)
            {
              uint64_t v38 = [v48 interval];
              id v79 = 0;
              id v80 = v48;
            }
            else
            {
              uint64_t v38 = [v49 interval];
              id v79 = v49;
              id v80 = 0;
            }

            goto LABEL_51;
          case 1:
            double v37 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[_DKPredictionQuery predictionOfType:withData:].cold.4();
            }
            goto LABEL_36;
          case 0:
            double v37 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[_DKPredictionQuery predictionOfType:withData:]();
            }
LABEL_36:
            id v79 = 0;
            id v80 = 0;
            uint64_t v38 = 0;
LABEL_51:

            goto LABEL_52;
        }
      }
      id v79 = 0;
      id v80 = 0;
      uint64_t v38 = 0;
LABEL_52:
      v81 = (void *)v38;
      *(_DWORD *)buf = -1;
      double v56 = [MEMORY[0x1E4F1C9C8] distantPast];
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id obj = v89;
      uint64_t v57 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
      if (!v57)
      {
        id v59 = 0;
LABEL_71:

        double v33 = v86;
        v74 = v81;
        uint64_t v34 = -[_DKPredictionQuery constructTimelineWithObservations:withFirstEventDate:withHistogramInterval:withPredictionStartDate:durationSinceFirstEvent:](v87, v86, v59, v81, v88, v29);
        v75 = v80;
        [v34 setStartHistogram:v80];
        v76 = v79;
        [v34 setEndHistogram:v79];
LABEL_72:

        goto LABEL_73;
      }
      uint64_t v58 = v57;
      id v59 = 0;
      uint64_t v60 = *(void *)v92;
      v78 = v56;
LABEL_54:
      uint64_t v61 = 0;
      while (1)
      {
        if (*(void *)v92 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = *(void **)(*((void *)&v91 + 1) + 8 * v61);
        id v63 = [v62 valueForKey:@"startDate"];
        id v64 = [v62 valueForKey:@"endDate"];
        if (!v59) {
          id v59 = v63;
        }
        if (a2 == 2)
        {
          uint64_t v66 = v87;
          int v67 = v88;
          v68 = v63;
          double v69 = v64;
          double v70 = v29;
          v71 = v85;
          v72 = v86;
          int v73 = 0;
        }
        else
        {
          if (a2 != 1)
          {
            if (a2)
            {

              uint64_t v34 = 0;
              double v33 = v86;
              v75 = v80;
              v74 = v81;
              double v56 = v78;
              v76 = v79;
              goto LABEL_72;
            }
            id v90 = v56;
            -[_DKPredictionQuery handleImpulsePredictionWithEventStartDate:predictionStartDate:durationSinceFirstEvent:calendar:observations:lastDate:lastSlot:](v87, v63, v88, v85, v86, &v90, buf, v29);
            id v65 = v90;

            double v56 = v65;
            goto LABEL_66;
          }
          uint64_t v66 = v87;
          int v67 = v88;
          v68 = v63;
          double v69 = v64;
          double v70 = v29;
          v71 = v85;
          v72 = v86;
          int v73 = 1;
        }
        -[_DKPredictionQuery handleEventPredictionWithEventStartDate:eventEndDate:predictionStartDate:durationSinceFirstEvent:calendar:observations:useWeights:](v66, v68, v69, v67, v71, v72, v73, v70);
LABEL_66:

        if (v58 == ++v61)
        {
          uint64_t v58 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
          if (v58) {
            goto LABEL_54;
          }
          goto LABEL_71;
        }
      }
    }
    uint64_t v35 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictionQuery predictionOfType:withData:]();
    }

    uint64_t v34 = +[_DKPredictionTimeline predictionUnavailable];
  }
  else
  {
    uint64_t v34 = 0;
  }
LABEL_74:

  return v34;
}

- (void)predictionOfType:withData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Prediction is unavailable because no data was provided.", v2, v3, v4, v5, v6);
}

+ (uint64_t)calendar:(void *)a3 isWeekendWithIntervalToWeekdayWeekendTransition:(void *)a4 containingOrAfterDate:
{
  id v6 = a2;
  id v7 = a4;
  self;
  id v18 = 0;
  double v19 = 0.0;
  uint64_t v8 = [v6 rangeOfWeekendStartDate:&v18 interval:&v19 containingDate:v7];
  id v9 = v18;
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 dateByAddingTimeInterval:v19];
    [v11 timeIntervalSinceDate:v7];
    uint64_t v13 = v12;

    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v17 = 0;
  [v6 nextWeekendStartDate:&v17 interval:0 options:4096 afterDate:v7];
  id v14 = v17;

  [v14 timeIntervalSinceDate:v7];
  uint64_t v13 = v15;
  id v10 = v14;
  if (a3) {
LABEL_5:
  }
    *a3 = v13;
LABEL_6:

  return v8;
}

+ (id)predictionQueryForStream:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_class();
  v13[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  uint64_t v11 = [v9 predictionQueryForStreams:v10 withPredicate:v7 withPredictionType:a5];

  return v11;
}

+ (id)predictionQueryForStreams:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v15[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v12 = [v9 eventQueryWithPredicate:v7 eventStreams:v8 offset:0 limit:0 sortDescriptors:v11];

  [v12 setType:a5];
  [v12 setSlotDuration:900];
  [v12 setReadMetadata:0];
  [v12 setDeduplicateValues:1];
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  [v12 setAsOfDate:v13];

  return v12;
}

- (void)setAsOfDate:(id)a3
{
}

- (_DKPredictionQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DKPredictionQuery;
  uint64_t v5 = [(_DKEventQuery *)&v13 initWithCoder:v4];
  if (!v5)
  {
LABEL_9:
    id v10 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = [v4 decodeIntForKey:@"slotDuration"];
  if (!v6)
  {
    uint64_t v11 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictionQuery initWithCoder:](v11);
    }

    goto LABEL_9;
  }
  [(_DKPredictionQuery *)v5 setSlotDuration:v6];
  -[_DKPredictionQuery setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asOfDate"];
  asOfDate = v5->_asOfDate;
  v5->_asOfDate = (NSDate *)v7;

  v5->_partitionType = [v4 decodeIntegerForKey:@"partitionType"];
  v5->_useHistoricalHistogram = [v4 decodeBoolForKey:@"useHist"];
  v5->_minimumDaysOfHistory = [v4 decodeIntForKey:@"minDays"];
  if ([v4 containsValueForKey:@"isTopN"])
  {
    v5->_isTopNPrediction = 1;
    v5->_topN = [v4 decodeIntegerForKey:@"topN"];
    [v4 decodeDoubleForKey:@"minLikelihood"];
    v5->_minLikelihood = v9;
  }
  id v10 = v5;
LABEL_10:

  return v10;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setSlotDuration:(int)a3
{
  if (!a3 || 86400 % a3) {
    a3 = 900;
  }
  self->_slotDuration = a3;
  self->_totalSlotsInDay = 86400 / a3;
  asOfDate = self->_asOfDate;
  if (asOfDate)
  {
    uint64_t v5 = asOfDate;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v6 = self->_asOfDate;
  self->_asOfDate = v5;
  MEMORY[0x1F41817F8](v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predictionHandler, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_asOfDate, 0);
}

- (id)handleResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  predictionHandler = (void (**)(id, _DKPredictionQuery *, id, id))self->_predictionHandler;
  if (predictionHandler) {
    predictionHandler[2](predictionHandler, self, v6, a4);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_DKPredictionQuery;
  [(_DKEventQuery *)&v5 encodeWithCoder:v4];
  [v4 encodeInt:self->_slotDuration forKey:@"slotDuration"];
  [v4 encodeInteger:self->_type forKey:@"type"];
  [v4 encodeObject:self->_asOfDate forKey:@"asOfDate"];
  [v4 encodeInteger:self->_partitionType forKey:@"partitionType"];
  [v4 encodeBool:self->_useHistoricalHistogram forKey:@"useHist"];
  [v4 encodeInteger:self->_minimumDaysOfHistory forKey:@"minDays"];
  if (self->_isTopNPrediction)
  {
    [v4 encodeBool:1 forKey:@"isTopN"];
    [v4 encodeInteger:self->_topN forKey:@"topN"];
    [v4 encodeDouble:@"minLikelihood" forKey:self->_minLikelihood];
  }
}

+ (id)topNPredictionQueryForStream:(id)a3 withPredicate:(id)a4 withTopN:(int64_t)a5 withMinLikelihood:(double)a6
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(id)objc_opt_class() predictionQueryForStream:v10 withPredicate:v9 withPredictionType:0];

  if (v11)
  {
    *(unsigned char *)(v11 + 129) = 1;
    *(void *)(v11 + 184) = a5;
    *(double *)(v11 + 192) = a6;
  }
  [(id)v11 setReadMetadata:0];
  [(id)v11 setDeduplicateValues:1];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  [(id)v11 setAsOfDate:v12];

  return (id)v11;
}

- (uint64_t)both:(void *)a3 and:(void *)a4 areWeekendOrWeekdayWithCalendar:
{
  if (result)
  {
    id v6 = a4;
    id v7 = a3;
    LODWORD(a2) = [v6 isDateInWeekend:a2];
    int v8 = [v6 isDateInWeekend:v7];

    return a2 ^ v8 ^ 1;
  }
  return result;
}

- (BOOL)both:(void *)a3 and:(void *)a4 areSameDayOfWeekWith:
{
  if (!a1) {
    return 0;
  }
  id v6 = a4;
  id v7 = a3;
  int v8 = [v6 components:512 fromDate:a2];
  id v9 = [v6 components:512 fromDate:v7];

  uint64_t v10 = [v8 weekday];
  BOOL v11 = v10 == [v9 weekday];

  return v11;
}

- (uint64_t)shouldIncludeEventWithStartDate:(int)a3 eventSlot:(void *)a4 withPredictionStartDate:(uint64_t)a5 withPartitionType:(void *)a6 andCalendar:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a6;
  if (a1)
  {
    if (a5 == 2)
    {
      id v14 = [v12 dateByAddingTimeInterval:(double)(*(_DWORD *)(a1 + 132) * a3)];
      uint64_t v15 = -[_DKPredictionQuery both:and:areSameDayOfWeekWith:](a1, (uint64_t)v11, v14, v13);
    }
    else
    {
      if (a5 != 1)
      {
        a1 = 1;
        goto LABEL_8;
      }
      id v14 = [v12 dateByAddingTimeInterval:(double)(*(_DWORD *)(a1 + 132) * a3)];
      uint64_t v15 = -[_DKPredictionQuery both:and:areWeekendOrWeekdayWithCalendar:](a1, (uint64_t)v11, v14, v13);
    }
    a1 = v15;
  }
LABEL_8:

  return a1;
}

- (void)setValueForIndex:(void *)a3 forObservations:(double)a4 withDenominator:
{
  if (a1)
  {
    uint64_t v6 = a2;
    id v7 = a3;
    int v8 = [v7 objectAtIndexedSubscript:v6];
    [v8 doubleValue];
    double v10 = v9 / a4;

    if (*(void *)(a1 + 144) == 1) {
      double v10 = 1.0 / (pow(2.71828183, (v10 + -0.5) * -12.0) + 1.0);
    }
    double v11 = 1.0;
    if (v10 <= 0.98)
    {
      double v11 = v10;
      if (v10 < 0.02) {
        double v11 = 0.0;
      }
    }
    id v13 = [NSNumber numberWithDouble:v11];
    id v12 = objc_msgSend(v13, "dk_dedup");
    [v7 setObject:v12 atIndexedSubscript:v6];
  }
}

- (void)handleImpulsePredictionWithEventStartDate:(void *)a3 predictionStartDate:(void *)a4 durationSinceFirstEvent:(void *)a5 calendar:(void *)a6 observations:(_DWORD *)a7 lastDate:(double)a8 lastSlot:
{
  id v25 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (a1)
  {
    [v25 timeIntervalSinceDate:v15];
    if (v18 < 0.0) {
      double v18 = v18 + ceil(v18 / -86400.0) * 86400.0;
    }
    uint64_t v19 = (uint64_t)v18 / *(int *)(a1 + 132) % *(int *)(a1 + 140);
    if (a8 >= 1209600.0) {
      uint64_t v20 = *(void *)(a1 + 152);
    }
    else {
      uint64_t v20 = 0;
    }
    if (-[_DKPredictionQuery shouldIncludeEventWithStartDate:eventSlot:withPredictionStartDate:withPartitionType:andCalendar:](a1, v25, v19, v15, v20, v16))
    {
      if (*a7 != v19 || ([v25 timeIntervalSinceDate:*a6], v21 >= (double)*(int *)(a1 + 132)))
      {
        double v22 = NSNumber;
        uint64_t v23 = [v17 objectAtIndexedSubscript:v19];
        id v24 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "integerValue") + 1);
        [v17 setObject:v24 atIndexedSubscript:v19];

        *a7 = v19;
        *a6 = v25;
      }
    }
  }
}

- (void)handleEventPredictionWithEventStartDate:(void *)a3 eventEndDate:(void *)a4 predictionStartDate:(void *)a5 durationSinceFirstEvent:(void *)a6 calendar:(int)a7 observations:(double)a8 useWeights:
{
  id v56 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v57 = a6;
  if (a1)
  {
    [v14 timeIntervalSinceDate:v56];
    double v18 = v17;
    [v56 timeIntervalSinceDate:v15];
    uint64_t v20 = [v15 dateByAddingTimeInterval:(double)(*(_DWORD *)(a1 + 132) * (int)(v19 / (double)*(int *)(a1 + 132)))];
    [v56 timeIntervalSinceDate:v15];
    if (v21 < 0.0) {
      double v21 = v21 + ceil(v21 / -86400.0) * 86400.0;
    }
    uint64_t v22 = (uint64_t)v21 / *(int *)(a1 + 132) % *(int *)(a1 + 140);
    int v23 = v22;
    if (a8 >= 1209600.0) {
      uint64_t v24 = *(void *)(a1 + 152);
    }
    else {
      uint64_t v24 = 0;
    }
    [v14 timeIntervalSinceDate:v20];
    double v26 = v25;
    int v27 = -[_DKPredictionQuery shouldIncludeEventWithStartDate:eventSlot:withPredictionStartDate:withPartitionType:andCalendar:](a1, v56, v22, v15, v24, v16);
    if (v26 <= 0.0)
    {
      if (!v27)
      {
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v53 = v20;
      uint64_t v35 = NSNumber;
      uint64_t v36 = [v57 objectAtIndexedSubscript:v22];
      double v37 = v36;
      if (a7)
      {
        [v36 doubleValue];
        [v35 numberWithDouble:v38 + v18 / (double)*(int *)(a1 + 132)];
      }
      else
      {
        objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v36, "integerValue") + 1);
      id v51 = };
      [v57 setObject:v51 atIndexedSubscript:v22];
    }
    else
    {
      if (v27)
      {
        double v28 = v20;
        id v52 = v16;
        double v29 = NSNumber;
        double v30 = [v57 objectAtIndexedSubscript:v22];
        double v31 = v30;
        if (a7)
        {
          [v30 doubleValue];
          double v33 = v32;
          [v20 timeIntervalSinceDate:v56];
          [v29 numberWithDouble:v33 + v34 / (double)*(int *)(a1 + 132)];
        }
        else
        {
          objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "integerValue") + 1);
        v39 = };
        [v57 setObject:v39 atIndexedSubscript:v22];

        id v16 = v52;
        uint64_t v20 = v28;
      }
      uint64_t v53 = v20;
      id v40 = v20;
      [v14 timeIntervalSinceDate:v40];
      if (v41 <= 0.0)
      {
        double v37 = v40;
      }
      else
      {
        double v42 = v41;
        uint64_t v54 = v24;
        do
        {
          int v43 = v23 + 1;
          int v44 = *(_DWORD *)(a1 + 140);
          int v23 = (v23 + 1) % v44;
          if (-[_DKPredictionQuery shouldIncludeEventWithStartDate:eventSlot:withPredictionStartDate:withPartitionType:andCalendar:](a1, v40, v43 % v44, v15, v24, v16))
          {
            uint64_t v45 = NSNumber;
            double v46 = [v57 objectAtIndexedSubscript:v23];
            uint64_t v47 = v46;
            if (a7)
            {
              [v46 doubleValue];
              objc_msgSend(v45, "numberWithDouble:", v48 + fmin(v42 / (double)*(int *)(a1 + 132), 1.0));
            }
            else
            {
              objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "integerValue") + 1);
            double v49 = };
            [v57 setObject:v49 atIndexedSubscript:v23];

            uint64_t v24 = v54;
          }
          double v37 = [v40 dateByAddingTimeInterval:(double)*(int *)(a1 + 132)];

          [v14 timeIntervalSinceDate:v37];
          double v42 = v50;
          id v40 = v37;
        }
        while (v50 > 0.0);
      }
    }

    uint64_t v20 = v53;
    goto LABEL_29;
  }
LABEL_30:
}

- (void)addEventsToObservations:(void *)a3 startingHistogram:(void *)a4 endingHistogram:(void *)a5 withPredictionDate:
{
  id v29 = a2;
  unint64_t v9 = a3;
  unint64_t v10 = a4;
  id v28 = a5;
  if (a1 && v9 | v10)
  {
    int v27 = [v28 slotFromMidnightWithTotalSlotsInDay:*(unsigned int *)(a1 + 140)];
    if (v9 && v27 < *(_DWORD *)(a1 + 140))
    {
      unint64_t v11 = 0;
      do
      {
        if ((v11 & 0x80000000) == 0 && [v29 count] - 1 >= v11)
        {
          id v12 = NSNumber;
          id v13 = [v29 objectAtIndexedSubscript:v11];
          [v13 doubleValue];
          double v15 = v14;
          id v16 = [NSNumber numberWithInt:v27 + v11];
          double v17 = objc_msgSend(v12, "numberWithDouble:", v15 + (double)(unint64_t)objc_msgSend((id)v9, "countForValue:", v16));
          [v29 setObject:v17 atIndexedSubscript:v11];
        }
        ++v11;
      }
      while (v27 + (int)v11 < *(_DWORD *)(a1 + 140));
    }
    if (v10 && v27 >= 1)
    {
      uint64_t v18 = 0;
      int v19 = *(_DWORD *)(a1 + 140) - v27;
      do
      {
        if (((v19 + v18) & 0x80000000) == 0
          && [v29 count] - 1 >= (unint64_t)(v19 + v18))
        {
          uint64_t v20 = (v19 + v18);
          double v21 = NSNumber;
          uint64_t v22 = [v29 objectAtIndexedSubscript:v20];
          [v22 doubleValue];
          double v24 = v23;
          double v25 = [NSNumber numberWithInt:v18];
          double v26 = objc_msgSend(v21, "numberWithDouble:", v24 + (double)(unint64_t)objc_msgSend((id)v10, "countForValue:", v25));
          [v29 setObject:v26 atIndexedSubscript:v20];
        }
        ++v18;
      }
      while (v27 != v18);
    }
  }
}

- (id)likelihoodForTopN:(void *)a3 withMinLikelihood:(double)a4 withData:
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = v7;
  if (a1)
  {
    if ([v7 count])
    {
      unint64_t v82 = a2;
      uint64_t v91 = a1;
      id v90 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v9 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      uint64_t v10 = [v9 secondsFromGMT];

      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      v81 = v8;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v101 objects:v114 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        double v14 = (double)v10;
        uint64_t v15 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v102 != v15) {
              objc_enumerationMutation(v11);
            }
            double v17 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            uint64_t v18 = [v17 value];
            int v19 = [v18 stringValue];

            if (v19)
            {
              uint64_t v20 = [v17 timeZone];
              double v21 = (double)[v20 secondsFromGMT];

              uint64_t v22 = [v17 valueForKey:@"startDate"];
              double v23 = v22;
              if (v21 != v14)
              {
                uint64_t v24 = [v22 dateByAddingTimeInterval:v21 - v14];

                double v23 = (void *)v24;
              }
              v112[0] = @"startDate";
              v112[1] = @"bundleID";
              v113[0] = v23;
              v113[1] = v19;
              double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:2];
              [v90 addObject:v25];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v101 objects:v114 count:16];
        }
        while (v13);
      }

      double v26 = v90;
      [v90 sortUsingComparator:&__block_literal_global_25];
      id v27 = *(id *)(v91 + 160);
      id v28 = [v90 firstObject];
      uint64_t v29 = [v28 valueForKey:@"startDate"];

      v89 = v27;
      double v30 = v27;
      double v31 = (void *)v29;
      [v30 timeIntervalSinceDate:v29];
      if (v32 >= (double)(86400 * *(_DWORD *)(v91 + 136)))
      {
        id v80 = (void *)v29;
        uint64_t v36 = (void *)MEMORY[0x1E4F1CC08];
        long long v93 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        long long v92 = (void *)[v36 mutableCopy];
        v86 = (void *)[v36 mutableCopy];
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id obj = v90;
        uint64_t v37 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v87 = *(void *)v98;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v98 != v87) {
                objc_enumerationMutation(obj);
              }
              id v40 = *(void **)(*((void *)&v97 + 1) + 8 * j);
              double v41 = (void *)MEMORY[0x192FB2F20]();
              double v42 = [v40 valueForKey:@"bundleID"];
              int v43 = [v40 valueForKey:@"startDate"];
              int v44 = [v92 objectForKeyedSubscript:v42];
              uint64_t v45 = [v93 objectForKeyedSubscript:v42];
              if (v44)
              {
                int v46 = [v44 intValue];
              }
              else
              {
                uint64_t v47 = [MEMORY[0x1E4F1C9C8] distantPast];

                int v46 = -1;
                uint64_t v45 = (void *)v47;
              }
              [v43 timeIntervalSinceDate:v89];
              if (v48 < 0.0) {
                double v48 = v48 + ceil(v48 / -86400.0) * 86400.0;
              }
              uint64_t v49 = ((uint64_t)v48 / *(int *)(v91 + 132) % *(int *)(v91 + 140));
              if (v46 != v49
                || ([v43 timeIntervalSinceDate:v45], v50 >= (double)*(int *)(v91 + 132)))
              {
                id v51 = [v86 objectForKeyedSubscript:v42];
                if (!v51)
                {
                  id v51 = [MEMORY[0x1E4F28BD0] set];
                }
                id v52 = [NSNumber numberWithInt:v49];
                [v51 addObject:v52];
                [v86 setObject:v51 forKeyedSubscript:v42];
                [v92 setObject:v52 forKeyedSubscript:v42];
                [v93 setObject:v43 forKeyedSubscript:v42];
              }
            }
            uint64_t v38 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
          }
          while (v38);
        }

        double v31 = v80;
        [v80 timeIntervalSinceDate:v89];
        double v54 = v53;
        if (v53 < 0.0) {
          double v54 = v53 + ceil(v53 / -86400.0) * 86400.0;
        }
        uint64_t v55 = v91;
        uint64_t v56 = *(int *)(v91 + 132);
        uint64_t v57 = *(int *)(v91 + 140);
        [v80 timeIntervalSinceDate:v89];
        int v59 = (int)(v58 / 86400.0);
        uint64_t v60 = -v59;
        uint64_t v61 = v86;
        if (v59 < 1)
        {
          id obja = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(int *)(v91 + 140)];
          id v63 = [v86 allKeys];
          id v64 = (void *)[v63 mutableCopy];

          if (*(int *)(v91 + 140) >= 1)
          {
            uint64_t v65 = 0;
            int v83 = (uint64_t)v54 / v56 % v57;
            do
            {
              uint64_t v66 = [MEMORY[0x1E4F1CA60] dictionary];
              if (v65 == v83) {
                LODWORD(v60) = v60 + 1;
              }
              if (v60)
              {
                v94[0] = MEMORY[0x1E4F143A8];
                v94[1] = 3221225472;
                v94[2] = __67___DKPredictionQuery_likelihoodForTopN_withMinLikelihood_withData___block_invoke_28;
                v94[3] = &unk_1E560EFD0;
                id v67 = v61;
                id v95 = v67;
                int v96 = v65;
                [v64 sortUsingComparator:v94];
                int v88 = v60;
                if ([v64 count] <= v82) {
                  uint64_t v68 = 0;
                }
                else {
                  uint64_t v68 = [v64 count] - v82;
                }
                uint64_t v69 = [v64 count] - 1;
                if (v69 >= v68)
                {
                  double v70 = (double)(int)v60;
                  do
                  {
                    v71 = [v64 objectAtIndexedSubscript:v69];
                    v72 = [v67 objectForKeyedSubscript:v71];
                    int v73 = [NSNumber numberWithInt:v65];
                    double v74 = (double)(unint64_t)[v72 countForObject:v73] / v70;

                    if (v74 >= a4)
                    {
                      v75 = [NSNumber numberWithDouble:v74];
                      v76 = objc_msgSend(v75, "dk_dedup");
                      [v66 setObject:v76 forKeyedSubscript:v71];
                    }
                    --v69;
                  }
                  while (v69 >= v68);
                }
                v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v66];
                [obja addObject:v77];

                uint64_t v55 = v91;
                uint64_t v61 = v86;
                LODWORD(v60) = v88;
              }
              else
              {
                [obja addObject:MEMORY[0x1E4F1CC08]];
              }

              uint64_t v65 = (v65 + 1);
            }
            while ((int)v65 < *(_DWORD *)(v55 + 140));
          }
          double v34 = +[_DKPredictionTimeline timelineWithValues:obja eachWithDuration:v89 startingAt:(double)*(int *)(v55 + 132)];

          double v31 = v80;
          int v8 = v81;
        }
        else
        {
          uint64_t v62 = +[_CDLogging knowledgeChannel];
          int v8 = v81;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            id v79 = [NSNumber numberWithInt:v60];
            *(_DWORD *)buf = 138412802;
            v106 = v79;
            __int16 v107 = 2112;
            v108 = v80;
            __int16 v109 = 2112;
            v110 = v89;
            _os_log_error_impl(&dword_18ECEB000, v62, OS_LOG_TYPE_ERROR, "Invalid minimum appearances (%@) calculated from firstDate %@ and predictionStartDate %@", buf, 0x20u);
          }
          double v34 = +[_DKPredictionTimeline predictionUnavailable];
        }

        double v26 = v90;
      }
      else
      {
        double v33 = +[_CDLogging knowledgeChannel];
        int v8 = v81;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[_DKPredictionQuery predictionOfType:withData:]();
        }

        double v34 = +[_DKPredictionTimeline predictionUnavailable];
      }
    }
    else
    {
      uint64_t v35 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[_DKPredictionQuery predictionOfType:withData:]();
      }

      double v34 = +[_DKPredictionTimeline predictionUnavailable];
    }
  }
  else
  {
    double v34 = 0;
  }

  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_DKPredictionQuery;
  id v4 = [(_DKEventQuery *)&v6 copyWithZone:a3];
  [v4 setSlotDuration:self->_slotDuration];
  [v4 setType:self->_type];
  [v4 setAsOfDate:self->_asOfDate];
  [v4 setPartitionType:self->_partitionType];
  [v4 setUseHistoricalHistogram:self->_useHistoricalHistogram];
  [v4 setMinimumDaysOfHistory:self->_minimumDaysOfHistory];
  if (v4)
  {
    *((unsigned char *)v4 + 129) = self->_isTopNPrediction;
    *((void *)v4 + 23) = self->_topN;
    *((void *)v4 + 24) = *(void *)&self->_minLikelihood;
  }
  return v4;
}

- (int)slotDuration
{
  return self->_slotDuration;
}

- (int)minimumDaysOfHistory
{
  return self->_minimumDaysOfHistory;
}

- (void)setMinimumDaysOfHistory:(int)a3
{
  self->_minimumDaysOfHistory = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)partitionType
{
  return self->_partitionType;
}

- (void)setPartitionType:(unint64_t)a3
{
  self->_partitionType = a3;
}

- (BOOL)useHistoricalHistogram
{
  return self->_useHistoricalHistogram;
}

- (void)setUseHistoricalHistogram:(BOOL)a3
{
  self->_useHistoricalHistogram = a3;
}

- (NSDate)asOfDate
{
  return self->_asOfDate;
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (id)predictionHandler
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setPredictionHandler:(id)a3
{
}

- (void)predictionOfType:withData:.cold.2()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_2_6();
  uint64_t v2 = objc_msgSend(v1, "numberWithInt:");
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v3, v4, "Insufficient history for prediction (%@ seconds, need %@ seconds).", v5, v6, v7, v8, v9);
}

- (void)predictionOfType:withData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Historical histogram option not supported with _DKDataPartitionTypeNone", v2, v3, v4, v5, v6);
}

- (void)predictionOfType:withData:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Historical histogram option not supported with _DKDataPartitionTypeWeekdayWeekend", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSNumber numberWithInt:0];
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18ECEB000, a1, OS_LOG_TYPE_ERROR, "Invalid slotDuration: %@", (uint8_t *)&v3, 0xCu);
}

@end