@interface _CDInBedDetector
+ (double)hoursOfSleepForResult:(id)a3;
+ (id)inBedDetector;
+ (id)inBedDetectorWithKnowledge:(id)a3;
+ (id)inBedDetectorWithKnowledge:(id)a3 method:(unint64_t)a4;
- (OS_os_log)log;
- (_CDInBedDetector)initWithKnowledge:(id)a3 method:(unint64_t)a4;
- (_DKKnowledgeQuerying)knowledge;
- (id)detectInBedBetweenBedtimeDate:(id)a3 wakupDate:(id)a4 error:(id *)a5;
- (id)detectInBedWithPolicyV1BetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (id)detectInBedWithPolicyV2BetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 motionBased:(BOOL)a6;
- (id)findDateIntervalOfEventInStream:(id)a3 datePredicate:(id)a4 valuePredicate:(id)a5 sortDescriptor:(id)a6 error:(id *)a7;
- (id)findLastTimeDeviceWasLockedBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (id)findLastTimeDeviceWasPluggedInBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (id)findLatestEndOfMovementBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (id)findMotionTerminusBetweenStartDate:(id)a3 endDate:(id)a4 latest:(BOOL)a5 error:(id *)a6;
- (id)lockedTimesBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (id)stationaryIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (unint64_t)method;
- (void)setKnowledge:(id)a3;
- (void)setLog:(id)a3;
- (void)setMethod:(unint64_t)a3;
@end

@implementation _CDInBedDetector

+ (id)inBedDetectorWithKnowledge:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithKnowledge:v4 method:2];

  return v5;
}

+ (id)inBedDetectorWithKnowledge:(id)a3 method:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithKnowledge:v6 method:a4];

  return v7;
}

+ (id)inBedDetector
{
  v3 = +[_DKKnowledgeStore knowledgeStore];
  id v4 = [a1 inBedDetectorWithKnowledge:v3];

  return v4;
}

- (_CDInBedDetector)initWithKnowledge:(id)a3 method:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CDInBedDetector;
  v8 = [(_CDInBedDetector *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_knowledge, a3);
    v9->_method = a4;
    os_log_t v10 = os_log_create("com.apple.coreduet.inBedDetector", "");
    os_log_t v11 = v10;
    if (v10) {
      os_log_t v12 = v10;
    }
    else {
      os_log_t v12 = (os_log_t)MEMORY[0x1E4F14500];
    }
    objc_storeStrong((id *)&v9->_log, v12);
  }
  return v9;
}

+ (double)hoursOfSleepForResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        os_log_t v10 = [v9 endDate];
        os_log_t v11 = [v9 startDate];
        [v10 timeIntervalSinceDate:v11];
        double v7 = v7 + v12 / 3600.0;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)detectInBedBetweenBedtimeDate:(id)a3 wakupDate:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_log_t v10 = (void *)MEMORY[0x192FB2F20]();
  if (![(_CDInBedDetector *)self method])
  {
    v31 = 0;
    os_log_t v11 = [(_CDInBedDetector *)self lockedTimesBetweenStartDate:v8 endDate:v9 error:&v31];
    double v12 = v31;
    goto LABEL_5;
  }
  if ([(_CDInBedDetector *)self method] == 1)
  {
    v30 = 0;
    os_log_t v11 = [(_CDInBedDetector *)self detectInBedWithPolicyV1BetweenStartDate:v8 endDate:v9 error:&v30];
    double v12 = v30;
LABEL_5:
    id v13 = v12;
    goto LABEL_6;
  }
  id v29 = 0;
  os_log_t v11 = [(_CDInBedDetector *)self detectInBedWithPolicyV2BetweenStartDate:v8 endDate:v9 error:&v29 motionBased:0];
  id v13 = v29;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = log;
    [(id)objc_opt_class() hoursOfSleepForResult:v11];
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = v17;
    _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEFAULT, "ProactiveSleepDebugging: Sleep time under modified model - simple lock-based session splitting %f", buf, 0xCu);
  }
  if (+[_CDDeviceInfo isRunningOnInternalBuild])
  {
    id v28 = v13;
    v18 = [(_CDInBedDetector *)self detectInBedWithPolicyV1BetweenStartDate:v8 endDate:v9 error:&v28];
    id v19 = v28;

    v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      [(id)objc_opt_class() hoursOfSleepForResult:v18];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v22;
      _os_log_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_DEFAULT, "ProactiveSleepDebugging: Sleep time under old model %f", buf, 0xCu);
    }
    id v27 = v19;
    v23 = [(_CDInBedDetector *)self detectInBedWithPolicyV2BetweenStartDate:v8 endDate:v9 error:&v27 motionBased:1];
    id v13 = v27;

    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      [(id)objc_opt_class() hoursOfSleepForResult:v23];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v26;
      _os_log_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEFAULT, "ProactiveSleepDebugging: Sleep time under modified model - motion-based session splitting %f", buf, 0xCu);
    }
  }
LABEL_6:
  if (a5 && v13) {
    *a5 = v13;
  }

  return v11;
}

- (id)lockedTimesBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v69 = v8;
  os_log_t v10 = +[_DKQuery predicateForEventsIntersectingDateRangeFrom:v8 to:v9];
  os_log_t v11 = +[_DKBoolCategory no];
  uint64_t v12 = +[_DKQuery predicateForEventsWithCategoryValue:v11];

  id v13 = objc_alloc_init(_DKEventQuery);
  long long v14 = [NSString stringWithUTF8String:"_CDInBedDetector.m"];
  long long v15 = objc_msgSend(v14, "stringByAppendingFormat:", @":%d", 123);
  [(_DKQuery *)v13 setClientName:v15];

  [(_DKQuery *)v13 setTracker:&__block_literal_global_27];
  long long v16 = +[_DKSystemEventStreams deviceIsLockedStream];
  v81[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  [(_DKEventQuery *)v13 setEventStreams:v17];

  v18 = (void *)MEMORY[0x1E4F28BA0];
  v80[0] = v10;
  v80[1] = v12;
  v67 = (void *)v12;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
  v20 = [v18 andPredicateWithSubpredicates:v19];
  [(_DKEventQuery *)v13 setPredicate:v20];

  v21 = +[_DKQuery startDateSortDescriptorAscending:1];
  v79 = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  [(_DKEventQuery *)v13 setSortDescriptors:v22];

  [(_DKEventQuery *)v13 setResultType:2];
  v23 = [(_CDInBedDetector *)self knowledge];
  id v76 = 0;
  v68 = v13;
  v24 = [v23 executeQuery:v13 error:&v76];
  id v25 = v76;

  if (a5 && v25)
  {
    id v26 = v25;
    id v70 = 0;
    *a5 = v26;
    id v27 = v67;
    id v28 = v69;
  }
  else
  {
    v63 = v24;
    v64 = v10;
    id v29 = +[_DKSystemEventStreams deviceIsLockedStream];
    id v28 = v69;
    v65 = v9;
    v30 = +[_DKQuery predicateForEventsWithEndInDateRangeFrom:v69 to:v9];
    v31 = +[_DKBoolCategory yes];
    v32 = +[_DKQuery predicateForEventsWithCategoryValue:v31];
    uint64_t v33 = +[_DKQuery endDateSortDescriptorAscending:0];
    id v75 = v25;
    uint64_t v34 = [(_CDInBedDetector *)self findDateIntervalOfEventInStream:v29 datePredicate:v30 valuePredicate:v32 sortDescriptor:v33 error:&v75];
    id v35 = v75;

    v36 = [v34 endDate];

    id v26 = v35;
    if (a5 && v35)
    {
      id v70 = 0;
      *a5 = v35;
      os_log_t v10 = v64;
      id v9 = v65;
      id v27 = v67;
      v24 = v63;
    }
    else
    {
      if (v36)
      {
        v24 = v63;
        os_log_t v10 = v64;
        id v9 = v65;
        if (![v63 count]) {
          goto LABEL_11;
        }
        v37 = [v63 lastObject];
        v38 = [v37 endDate];
        v39 = v36;
        uint64_t v40 = [v38 compare:v36];

        BOOL v41 = v40 == -1;
        v36 = v39;
        if (v41)
        {
LABEL_11:
          id v42 = v36;

          id v9 = v42;
        }
      }
      else
      {
        os_log_t v10 = v64;
        id v9 = v65;
        v24 = v63;
      }
      if ([v24 count])
      {
        v61 = v36;
        id v62 = v26;
        id v66 = v9;
        id v70 = [MEMORY[0x1E4F1CA48] array];
        id v43 = v69;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v44 = v24;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v71 objects:v77 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v72;
          v48 = v43;
          do
          {
            uint64_t v49 = 0;
            v50 = v48;
            do
            {
              if (*(void *)v72 != v47) {
                objc_enumerationMutation(v44);
              }
              v51 = *(void **)(*((void *)&v71 + 1) + 8 * v49);
              v52 = objc_alloc_init(_CDInBedDetection);
              [(_CDInBedDetection *)v52 setStartDate:v50];
              v53 = [v51 startDate];
              v54 = [v53 laterDate:v43];
              [(_CDInBedDetection *)v52 setEndDate:v54];

              [(_CDInBedDetection *)v52 setConfidence:1.0];
              [(_CDInBedDetection *)v52 duration];
              if (v55 > 0.0) {
                [v70 addObject:v52];
              }
              v48 = [v51 endDate];

              ++v49;
              v50 = v48;
            }
            while (v46 != v49);
            uint64_t v46 = [v44 countByEnumeratingWithState:&v71 objects:v77 count:16];
          }
          while (v46);
        }
        else
        {
          v48 = v43;
        }

        id v9 = v66;
        v57 = [v48 earlierDate:v66];
        int v58 = [v57 isEqualToDate:v48];

        if (v58)
        {
          v59 = objc_alloc_init(_CDInBedDetection);
          [(_CDInBedDetection *)v59 setStartDate:v48];
          [(_CDInBedDetection *)v59 setEndDate:v66];
          [v70 addObject:v59];
        }
        id v28 = v69;
        v24 = v63;
        os_log_t v10 = v64;
        id v27 = v67;
        v36 = v61;
        id v26 = v62;
      }
      else
      {
        v56 = objc_alloc_init(_CDInBedDetection);
        [(_CDInBedDetection *)v56 setStartDate:v69];
        [(_CDInBedDetection *)v56 setEndDate:v9];
        v78 = v56;
        id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];

        id v27 = v67;
      }
    }
  }
  return v70;
}

- (id)detectInBedWithPolicyV1BetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v8 dateByAddingTimeInterval:-3600.0];
  v51[1] = 0;
  uint64_t v46 = v48 = v7;
  id v9 = -[_CDInBedDetector findLatestEndOfMovementBetweenStartDate:endDate:error:](self, "findLatestEndOfMovementBetweenStartDate:endDate:error:", v7);
  id v10 = 0;
  if (v10)
  {
    os_log_t v11 = v10;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:]();
    }
  }
  else if (!v9 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:]();
  }
  uint64_t v12 = v48;
  if (v9) {
    uint64_t v12 = v9;
  }
  id v13 = v12;

  id v14 = v13;
  long long v15 = [v14 dateByAddingTimeInterval:5400.0];
  v51[0] = 0;
  long long v16 = [(_CDInBedDetector *)self findLastTimeDeviceWasLockedBetweenStartDate:v14 endDate:v15 error:v51];
  id v17 = v51[0];
  if (v17)
  {
    v18 = v17;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v53 = v14;
      __int16 v54 = 2112;
      id v55 = v15;
      __int16 v56 = 2112;
      id v57 = v18;
      _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Error finding last lock date between %@ and %@: %@", buf, 0x20u);
    }
  }
  v20 = v14;
  if (v16)
  {
    v20 = [v14 laterDate:v16];
  }
  id v50 = 0;
  v21 = [(_CDInBedDetector *)self findLastTimeDeviceWasPluggedInBetweenStartDate:v14 endDate:v15 error:&v50];
  id v22 = v50;
  if (v22)
  {
    v23 = v22;
    v24 = v21;
    id v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v53 = v14;
      __int16 v54 = 2112;
      id v55 = v15;
      __int16 v56 = 2112;
      id v57 = v23;
      _os_log_error_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_ERROR, "Error finding last date device was plugged in between %@ and %@: %@", buf, 0x20u);
    }

    v21 = v24;
  }
  if (v21)
  {
    uint64_t v26 = [v20 laterDate:v21];

    v20 = (void *)v26;
  }
  if ([0 count])
  {
    id v27 = (void *)[0 copy];
    id v47 = 0;
    id v28 = @"motion";
  }
  else
  {
    id v49 = 0;
    id v27 = [(_CDInBedDetector *)self lockedTimesBetweenStartDate:v20 endDate:v8 error:&v49];
    id v47 = v49;
    if (v47)
    {
      if (a5) {
        *a5 = v47;
      }
      id v29 = self->_log;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v53 = v20;
        __int16 v54 = 2112;
        id v55 = v8;
        __int16 v56 = 2112;
        id v57 = v47;
        _os_log_error_impl(&dword_18ECEB000, v29, OS_LOG_TYPE_ERROR, "Error identifying locked times between %@ and %@: %@", buf, 0x20u);
      }
    }
    else
    {
      id v47 = 0;
    }
    id v28 = @"screenlock";
  }
  uint64_t v45 = v28;
  v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = v21;
    v31 = NSNumber;
    v32 = v30;
    uint64_t v33 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
    uint64_t v34 = [v27 firstObject];
    [v34 startDate];
    id v35 = v43 = v8;
    [v27 lastObject];
    v36 = BOOL v41 = v16;
    [v36 endDate];
    v37 = v27;
    v39 = v38 = v15;
    *(_DWORD *)buf = 138413058;
    id v53 = v33;
    __int16 v54 = 2112;
    id v55 = v35;
    __int16 v56 = 2112;
    id v57 = v39;
    __int16 v58 = 2112;
    v59 = v45;
    _os_log_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_DEFAULT, "Found %@ in-bed intervals between %@ & %@ using %@-based heuristic", buf, 0x2Au);

    long long v15 = v38;
    id v27 = v37;

    long long v16 = v41;
    id v8 = v43;

    v21 = v42;
  }

  return v27;
}

- (id)detectInBedWithPolicyV2BetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5 motionBased:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  os_log_t v11 = [v9 dateByAddingTimeInterval:14400.0];
  uint64_t v12 = [v10 dateByAddingTimeInterval:-60.0];
  v82 = v11;
  id v13 = [v11 earlierDate:v12];
  id v97 = 0;
  id v14 = [(_CDInBedDetector *)self findLatestEndOfMovementBetweenStartDate:v9 endDate:v13 error:&v97];
  id v15 = v97;

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:]();
    }
  }
  else if (!v14 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[_CDInBedDetector detectInBedWithPolicyV1BetweenStartDate:endDate:error:]();
  }
  if (v14) {
    long long v16 = v14;
  }
  else {
    long long v16 = v9;
  }
  id v17 = v16;

  id v18 = v17;
  id v19 = [v18 dateByAddingTimeInterval:5400.0];
  v20 = [v10 dateByAddingTimeInterval:-60.0];
  uint64_t v21 = [v19 earlierDate:v20];

  id v96 = 0;
  id v22 = [(_CDInBedDetector *)self findLastTimeDeviceWasLockedBetweenStartDate:v18 endDate:v21 error:&v96];
  id v23 = v96;
  if (v23)
  {
    v24 = v23;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v99 = v18;
      __int16 v100 = 2112;
      uint64_t v101 = v21;
      __int16 v102 = 2112;
      v103 = v24;
      _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Error finding last lock date between %@ and %@: %@", buf, 0x20u);
    }
  }
  uint64_t v26 = v18;
  if (v22)
  {
    uint64_t v26 = [v18 laterDate:v22];
  }
  id v95 = 0;
  v87 = [(_CDInBedDetector *)self findLastTimeDeviceWasPluggedInBetweenStartDate:v18 endDate:v21 error:&v95];
  id v27 = v95;
  if (v27)
  {
    id v28 = v27;
    id v29 = v26;
    v30 = self->_log;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v99 = v18;
      __int16 v100 = 2112;
      uint64_t v101 = v21;
      __int16 v102 = 2112;
      v103 = v28;
      _os_log_error_impl(&dword_18ECEB000, v30, OS_LOG_TYPE_ERROR, "Error finding last date device was plugged in between %@ and %@: %@", buf, 0x20u);
    }

    uint64_t v26 = v29;
  }
  if (v87)
  {
    uint64_t v31 = objc_msgSend(v26, "laterDate:");

    uint64_t v26 = (void *)v31;
  }
  v32 = [v10 dateByAddingTimeInterval:-3600.0];
  [v32 timeIntervalSinceReferenceDate];
  double v34 = v33;
  [v26 timeIntervalSinceReferenceDate];
  v85 = v32;
  v86 = v26;
  if (v34 <= v35)
  {
    v39 = self->_log;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v39, OS_LOG_TYPE_DEFAULT, "Bedtime started less than an hour before end date, not performing further movement based changes on end date", buf, 2u);
    }
LABEL_33:
    uint64_t v36 = 0;
    goto LABEL_34;
  }
  id v94 = 0;
  uint64_t v36 = [(_CDInBedDetector *)self findMotionTerminusBetweenStartDate:v32 endDate:v10 latest:0 error:&v94];
  id v37 = v94;
  if (!v37)
  {
    if (v36) {
      goto LABEL_34;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:]();
    }
    goto LABEL_33;
  }
  v38 = v37;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    -[_CDInBedDetector detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:]();
  }

LABEL_34:
  v79 = (void *)v36;
  if (v36) {
    uint64_t v40 = (void *)v36;
  }
  else {
    uint64_t v40 = v10;
  }
  id v41 = v40;

  id v83 = v9;
  v84 = v41;
  v80 = (void *)v21;
  v81 = v18;
  if (v6)
  {
    id v93 = 0;
    id v42 = [(_CDInBedDetector *)self stationaryIntervalsBetweenStartDate:v26 endDate:v41 error:&v93];
    id v43 = v93;
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = self->_log;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v99 = v86;
        __int16 v100 = 2112;
        uint64_t v101 = (uint64_t)v84;
        __int16 v102 = 2112;
        v103 = v44;
        _os_log_error_impl(&dword_18ECEB000, v45, OS_LOG_TYPE_ERROR, "Error finding stationary intervals between %@ and %@: %@", buf, 0x20u);
      }
    }
    uint64_t v46 = [MEMORY[0x1E4F1CA48] array];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v47 = v42;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v89 objects:v106 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v90 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          [v52 duration];
          if (v53 >= 300.0)
          {
            __int16 v54 = objc_alloc_init(_CDInBedDetection);
            id v55 = [v52 startDate];
            [(_CDInBedDetection *)v54 setStartDate:v55];

            __int16 v56 = [v52 endDate];
            [(_CDInBedDetection *)v54 setEndDate:v56];

            [(_CDInBedDetection *)v54 setConfidence:1.0];
            [v46 addObject:v54];
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v89 objects:v106 count:16];
      }
      while (v49);
    }
    id v57 = self;

    __int16 v58 = v83;
    uint64_t v26 = v86;
  }
  else
  {
    id v57 = self;
    __int16 v58 = v9;
    uint64_t v46 = 0;
  }
  v59 = v85;
  if ([v46 count])
  {
    uint64_t v60 = (void *)[v46 copy];
    v61 = 0;
    id v62 = @"motion";
  }
  else
  {
    id v88 = 0;
    uint64_t v60 = [(_CDInBedDetector *)v57 lockedTimesBetweenStartDate:v26 endDate:v84 error:&v88];
    id v63 = v88;
    v61 = v63;
    if (v63)
    {
      if (a5)
      {
        *a5 = v63;
        v59 = v85;
      }
      v64 = v57->_log;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v99 = v86;
        __int16 v100 = 2112;
        uint64_t v101 = (uint64_t)v84;
        __int16 v102 = 2112;
        v103 = v61;
        _os_log_error_impl(&dword_18ECEB000, v64, OS_LOG_TYPE_ERROR, "Error identifying locked times between %@ and %@: %@", buf, 0x20u);
      }
    }
    id v62 = @"screenlock";
  }
  v65 = v57->_log;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v78 = v62;
    id v66 = NSNumber;
    v67 = v65;
    v68 = objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v60, "count"));
    v69 = [v60 firstObject];
    id v70 = [v69 startDate];
    long long v71 = [v60 lastObject];
    [v71 endDate];
    long long v72 = v61;
    long long v73 = v60;
    v75 = long long v74 = v22;
    *(_DWORD *)buf = 138413058;
    id v99 = v68;
    __int16 v100 = 2112;
    uint64_t v101 = (uint64_t)v70;
    __int16 v102 = 2112;
    v103 = v75;
    __int16 v104 = 2112;
    v105 = v78;
    _os_log_impl(&dword_18ECEB000, v67, OS_LOG_TYPE_DEFAULT, "Found %@ in-bed intervals between %@ & %@ using %@-based heuristic", buf, 0x2Au);

    id v22 = v74;
    uint64_t v60 = v73;
    v61 = v72;

    __int16 v58 = v83;
    v59 = v85;
  }
  return v60;
}

- (id)findLatestEndOfMovementBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  return [(_CDInBedDetector *)self findMotionTerminusBetweenStartDate:a3 endDate:a4 latest:1 error:a5];
}

- (id)findMotionTerminusBetweenStartDate:(id)a3 endDate:(id)a4 latest:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  os_log_t v11 = [v9 earlierDate:v10];
  int v12 = [v11 isEqualToDate:v10];

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:]();
    }
LABEL_22:
    id v19 = 0;
    goto LABEL_40;
  }
  if (([getCMMotionActivityManagerClass() isActivityAvailable] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:]();
    }
    goto LABEL_22;
  }
  id v13 = objc_alloc_init((Class)getCMMotionActivityManagerClass());
  id v14 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v14 setName:@"com.apple.coreduet.inbed.coremotion"];
  uint64_t v53 = 0;
  __int16 v54 = &v53;
  uint64_t v55 = 0x3032000000;
  __int16 v56 = __Block_byref_object_copy__8;
  id v57 = __Block_byref_object_dispose__8;
  id v58 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__8;
  v51 = __Block_byref_object_dispose__8;
  id v52 = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __76___CDInBedDetector_findMotionTerminusBetweenStartDate_endDate_latest_error___block_invoke;
  v43[3] = &unk_1E560E768;
  uint64_t v45 = &v53;
  uint64_t v46 = &v47;
  v32 = v14;
  dispatch_semaphore_t dsema = v15;
  dispatch_semaphore_t v44 = dsema;
  uint64_t v31 = v13;
  [v13 queryActivityStartingFromDate:v9 toDate:v10 toQueue:v14 withHandler:v43];
  dispatch_time_t v16 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(dsema, v16))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:]();
    }
    [v14 cancelAllOperations];
  }
  id v17 = v10;
  if (v6)
  {
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    long long v39 = 0uLL;
    long long v40 = 0uLL;
    id v18 = [(id)v48[5] reverseObjectEnumerator];
    id v19 = (void *)[v18 countByEnumeratingWithState:&v39 objects:v60 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v40;
      id v21 = v17;
      while (2)
      {
        id v22 = 0;
        id v23 = v17;
        v24 = v21;
        do
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v18);
          }
          id v25 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v22);
          if (([v25 stationary] & 1) == 0 && objc_msgSend(v25, "confidence") == 1)
          {
            id v21 = v24;
            id v17 = v23;
            id v19 = v21;
            goto LABEL_36;
          }
          id v17 = [v25 startDate];

          id v21 = [v25 startDate];

          id v22 = (char *)v22 + 1;
          id v23 = v17;
          v24 = v21;
        }
        while (v19 != v22);
        id v19 = (void *)[v18 countByEnumeratingWithState:&v39 objects:v60 count:16];
        if (v19) {
          continue;
        }
        goto LABEL_36;
      }
    }
  }
  else
  {
    long long v37 = 0uLL;
    long long v38 = 0uLL;
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    id v18 = [(id)v48[5] objectEnumerator];
    id v19 = (void *)[v18 countByEnumeratingWithState:&v35 objects:v59 count:16];
    if (v19)
    {
      uint64_t v26 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v18);
          }
          id v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (([v28 stationary] & 1) == 0 && objc_msgSend(v28, "confidence") == 1)
          {
            id v19 = [v28 startDate];
            goto LABEL_34;
          }
        }
        id v19 = (void *)[v18 countByEnumeratingWithState:&v35 objects:v59 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
LABEL_34:
  id v21 = v17;
LABEL_36:

  if (a6)
  {
    id v29 = (void *)v54[5];
    if (v29) {
      *a6 = v29;
    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

LABEL_40:
  return v19;
}

- (id)stationaryIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v33 = v7;
  id v9 = [v7 earlierDate:v8];
  char v10 = [v9 isEqualToDate:v8];

  if (v10)
  {
LABEL_2:
    os_log_t v11 = 0;
    goto LABEL_28;
  }
  if (([getCMMotionActivityManagerClass() isActivityAvailable] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:]();
    }
    goto LABEL_2;
  }
  id v12 = objc_alloc_init((Class)getCMMotionActivityManagerClass());
  id v13 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v13 setName:@"com.apple.coreduet.inbed.coremotion"];
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__8;
  id v52 = __Block_byref_object_dispose__8;
  id v53 = 0;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__8;
  uint64_t v46 = __Block_byref_object_dispose__8;
  id v47 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __70___CDInBedDetector_stationaryIntervalsBetweenStartDate_endDate_error___block_invoke;
  v38[3] = &unk_1E560E768;
  long long v40 = &v48;
  long long v41 = &v42;
  v30 = v13;
  dispatch_semaphore_t dsema = v14;
  dispatch_semaphore_t v39 = dsema;
  id v29 = v12;
  [v12 queryActivityStartingFromDate:v7 toDate:v8 toQueue:v13 withHandler:v38];
  dispatch_time_t v15 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(dsema, v15))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[_CDInBedDetector findMotionTerminusBetweenStartDate:endDate:latest:error:]();
    }
    [v13 cancelAllOperations];
  }
  dispatch_time_t v16 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = (id)v43[5];
  id v18 = 0;
  uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (!v19)
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v20 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v35 != v20) {
        objc_enumerationMutation(v17);
      }
      id v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if ([v22 stationary] && objc_msgSend(v22, "confidence") == 2)
      {
        uint64_t v23 = [v22 startDate];
      }
      else
      {
        if (!v18) {
          continue;
        }
        id v24 = objc_alloc(MEMORY[0x1E4F28C18]);
        id v25 = [v22 startDate];
        uint64_t v26 = (void *)[v24 initWithStartDate:v18 endDate:v25];
        [v16 addObject:v26];

        uint64_t v23 = 0;
      }

      id v18 = (void *)v23;
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v54 count:16];
  }
  while (v19);

  if (v18)
  {
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v18 endDate:v8];
    [v16 addObject:v17];
    goto LABEL_23;
  }
LABEL_24:
  if (a5)
  {
    id v27 = (void *)v49[5];
    if (v27) {
      *a5 = v27;
    }
  }
  os_log_t v11 = (void *)[v16 copy];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

LABEL_28:
  return v11;
}

- (id)findLastTimeDeviceWasLockedBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = +[_DKSystemEventStreams deviceIsLockedStream];
  os_log_t v11 = +[_DKQuery predicateForEventsWithEndInDateRangeFrom:v9 to:v8];

  id v12 = +[_DKBoolCategory no];
  id v13 = +[_DKQuery predicateForEventsWithCategoryValue:v12];
  dispatch_semaphore_t v14 = +[_DKQuery endDateSortDescriptorAscending:0];
  dispatch_time_t v15 = [(_CDInBedDetector *)self findDateIntervalOfEventInStream:v10 datePredicate:v11 valuePredicate:v13 sortDescriptor:v14 error:a5];
  dispatch_time_t v16 = [v15 endDate];

  return v16;
}

- (id)findLastTimeDeviceWasPluggedInBetweenStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = +[_DKSystemEventStreams deviceIsPluggedInStream];
  os_log_t v11 = +[_DKQuery predicateForEventsWithEndInDateRangeFrom:v9 to:v8];

  id v12 = +[_DKBoolCategory no];
  id v13 = +[_DKQuery predicateForEventsWithCategoryValue:v12];
  dispatch_semaphore_t v14 = +[_DKQuery endDateSortDescriptorAscending:0];
  dispatch_time_t v15 = [(_CDInBedDetector *)self findDateIntervalOfEventInStream:v10 datePredicate:v11 valuePredicate:v13 sortDescriptor:v14 error:a5];
  dispatch_time_t v16 = [v15 endDate];

  return v16;
}

- (id)findDateIntervalOfEventInStream:(id)a3 datePredicate:(id)a4 valuePredicate:(id)a5 sortDescriptor:(id)a6 error:(id *)a7
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  dispatch_time_t v16 = objc_alloc_init(_DKEventQuery);
  id v17 = [NSString stringWithUTF8String:"_CDInBedDetector.m"];
  id v18 = objc_msgSend(v17, "stringByAppendingFormat:", @":%d", 638);
  [(_DKQuery *)v16 setClientName:v18];

  [(_DKQuery *)v16 setTracker:&__block_literal_global_545];
  v32[0] = v12;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [(_DKEventQuery *)v16 setEventStreams:v19];

  uint64_t v20 = (void *)MEMORY[0x1E4F28BA0];
  v31[0] = v13;
  v31[1] = v14;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  id v22 = [v20 andPredicateWithSubpredicates:v21];
  [(_DKEventQuery *)v16 setPredicate:v22];

  id v30 = v15;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [(_DKEventQuery *)v16 setSortDescriptors:v23];

  [(_DKEventQuery *)v16 setLimit:1];
  [(_DKEventQuery *)v16 setResultType:2];
  id v24 = [(_CDInBedDetector *)self knowledge];
  id v29 = 0;
  id v25 = [v24 executeQuery:v16 error:&v29];
  id v26 = v29;

  if (v26)
  {
    id v27 = 0;
    if (a7) {
      *a7 = v26;
    }
  }
  else
  {
    id v27 = [v25 firstObject];
  }

  return v27;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledge
{
  return (_DKKnowledgeQuerying *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKnowledge:(id)a3
{
}

- (unint64_t)method
{
  return self->_method;
}

- (void)setMethod:(unint64_t)a3
{
  self->_method = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledge, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)detectInBedWithPolicyV1BetweenStartDate:endDate:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Unable to find last end of movement. Falling back to provided start time.", v2, v3, v4, v5, v6);
}

- (void)detectInBedWithPolicyV1BetweenStartDate:endDate:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error finding last end of movement: %@", v2, v3, v4, v5, v6);
}

- (void)detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Unable to find first start of movement. Falling back to provided end time.", v2, v3, v4, v5, v6);
}

- (void)detectInBedWithPolicyV2BetweenStartDate:endDate:error:motionBased:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error finding first start of movement: %@", v2, v3, v4, v5, v6);
}

- (void)findMotionTerminusBetweenStartDate:endDate:latest:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18ECEB000, v1, OS_LOG_TYPE_ERROR, "InBed endDate (%@) is before startDate (%@)", v2, 0x16u);
}

- (void)findMotionTerminusBetweenStartDate:endDate:latest:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Timeout during queryActivityStartingFromDate.", v2, v3, v4, v5, v6);
}

- (void)findMotionTerminusBetweenStartDate:endDate:latest:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Motion activity is not available for in bed detection", v2, v3, v4, v5, v6);
}

@end