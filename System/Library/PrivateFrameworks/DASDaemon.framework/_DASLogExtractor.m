@interface _DASLogExtractor
+ (id)extractorForArchive:(id)a3;
- (BOOL)didActivityRun:(id)a3 forActivity:(id)a4;
- (BOOL)didBARFinish:(id)a3 forApplication:(id)a4;
- (NSDateFormatter)dateFormatter;
- (NSString)category;
- (NSString)subsystem;
- (OSLogEventStore)logStore;
- (OSLogEventStream)eventStream;
- (_DASLogExtractor)initWithArchive:(id)a3;
- (id)copyActivitySummary:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6 error:(int *)a7;
- (id)copyApplicationSummary:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6 error:(int *)a7;
- (id)descriptionOfHigherThresholds:(id)a3;
- (id)descriptionOfIncompatibilityDenials:(id)a3;
- (id)descriptionOfPolicyToIntervalsMap:(id)a3;
- (id)getActivityStartBeforeDate:(id)a3 forActivity:(id)a4;
- (id)getAllBARActivityNames:(id)a3;
- (id)getAllPushLaunchActivityNames:(id)a3;
- (id)getBARSummaryFromLogs:(id)a3 forApplication:(id)a4 detail:(BOOL)a5;
- (id)getDefaultFilterPredicate;
- (id)getIncompatibilityReasons:(id)a3 forActivity:(id)a4;
- (id)getInstancesOfHigherThreshold:(id)a3 forActivity:(id)a4;
- (id)getMessagesActivityFinish:(id)a3 forActivity:(id)a4 isCompleted:(BOOL)a5;
- (id)getMessagesAfterRunning:(id)a3 forActivity:(id)a4;
- (id)getMessagesBeforeRunning:(id)a3 forActivity:(id)a4;
- (id)getMessagesForAllBARTasks:(id)a3;
- (id)getMessagesForBARLifecycle:(id)a3 forApplication:(id)a4 queryStatus:(id)a5 taskType:(id)a6;
- (id)getMessagesWhenAppBackgroundSwitch:(id)a3 forApplication:(id)a4 switchTo:(id)a5;
- (id)getPolicyDenialReasonsFromMessage:(id)a3;
- (id)getScheduledBlocksOfBARMessages:(id)a3 forApplication:(id)a4;
- (id)getScheduledBlocksOfMessages:(id)a3 forActivity:(id)a4;
- (id)getSummaryFromLogs:(id)a3 forActivity:(id)a4 detail:(BOOL)a5;
- (id)getpolicyToIntervals:(id)a3;
- (id)objectForTrigger:(id)a3 fromCondition:(id)a4 compactRepresentation:(BOOL)a5;
- (id)summarizeAllDenialsOverMessages:(id)a3 forActivity:(id)a4 detail:(BOOL)a5;
- (id)summarizePolicyDenialsOverMessages:(id)a3 maxDuration:(double)a4;
- (id)summarizeRuntimeOverMessages:(id)a3 forActivity:(id)a4;
- (int)didActivityFinish:(id)a3 forActivity:(id)a4;
- (int)didActivityFinish:(id)a3 forBARActivity:(id)a4;
- (int)handleLogEventsLogEvents:(id)a3 sinceDate:(id)a4 withHandler:(id)a5;
- (int)summarizeActivity:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6;
- (int)summarizeApplication:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6;
- (int)sysConditionsLog:(BOOL)a3 startDate:(id)a4 endDate:(id)a5;
- (void)addConditionToHistory:(id)a3 fromMessage:(id)a4 atTimestamp:(id)a5 compactRepresentation:(BOOL)a6;
- (void)setCategory:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setEventStream:(id)a3;
- (void)setLogStore:(id)a3;
- (void)setSubsystem:(id)a3;
@end

@implementation _DASLogExtractor

+ (id)extractorForArchive:(id)a3
{
  id v3 = a3;
  v4 = [[_DASLogExtractor alloc] initWithArchive:v3];

  return v4;
}

- (_DASLogExtractor)initWithArchive:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DASLogExtractor;
  v5 = [(_DASLogExtractor *)&v12 init];
  if (v5)
  {
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v6;

    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)@"com.apple.duetactivityscheduler";

    [(NSDateFormatter *)v5->_dateFormatter setDateFormat:@"y-MM-dd-HH-mm-ss.SSS-z"];
    if (v4) {
      [MEMORY[0x263F52748] storeWithArchiveURL:v4];
    }
    else {
    uint64_t v9 = [MEMORY[0x263F52748] localStore];
    }
    logStore = v5->_logStore;
    v5->_logStore = (OSLogEventStore *)v9;

    [(OSLogEventStore *)v5->_logStore setUpgradeConfirmationHandler:&__block_literal_global_146];
  }

  return v5;
}

- (id)getDefaultFilterPredicate
{
  if (getDefaultFilterPredicate_onceToken != -1) {
    dispatch_once(&getDefaultFilterPredicate_onceToken, &__block_literal_global_148);
  }
  v2 = (void *)getDefaultFilterPredicate_subpredicates;
  return v2;
}

- (int)handleLogEventsLogEvents:(id)a3 sinceDate:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v9 = [MEMORY[0x263EFF910] distantPast];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  logStore = self->_logStore;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke;
  v17[3] = &unk_26486D588;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  v22 = self;
  id v13 = v10;
  id v20 = v13;
  id v14 = v9;
  id v19 = v14;
  v21 = &v23;
  [(OSLogEventStore *)logStore prepareWithCompletionHandler:v17];
  int v15 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (id)getScheduledBlocksOfMessages:(id)a3 forActivity:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id v27 = 0;
    goto LABEL_27;
  }
  id v25 = v6;
  [MEMORY[0x263EFF980] array];
  id v26 = v5;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  char v11 = 1;
  uint64_t v12 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v29 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if (v11)
      {
        int v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) message];
        if ([v15 containsString:@"Submitted Activity:"])
        {

LABEL_11:
          uint64_t v18 = [MEMORY[0x263EFF980] array];
          char v11 = 0;
          goto LABEL_18;
        }
        v16 = [v14 message];
        int v17 = [v16 containsString:@"SUBMITTING:"];

        if (v17) {
          goto LABEL_11;
        }
      }
      id v19 = [v14 message];
      if ([v19 containsString:@"COMPLETED"])
      {
      }
      else
      {
        id v20 = [v14 message];
        int v21 = [v20 containsString:@"CANCELED"];

        if (!v21) {
          goto LABEL_19;
        }
      }
      [v10 addObject:v14];
      if ([v10 count])
      {
        v22 = (void *)[v10 copy];
        [v27 addObject:v22];
      }
      uint64_t v18 = 0;
      char v11 = 1;
LABEL_18:

      id v10 = (void *)v18;
LABEL_19:
      [v10 addObject:v14];
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v9);
LABEL_24:

  id v6 = v25;
  if ([v10 count])
  {
    uint64_t v23 = (void *)[v10 copy];
    [v27 addObject:v23];
  }
  id v5 = v26;
LABEL_27:

  return v27;
}

- (id)getScheduledBlocksOfBARMessages:(id)a3 forApplication:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id v25 = 0;
    goto LABEL_21;
  }
  id v23 = v6;
  id v25 = [MEMORY[0x263EFF980] array];
  id v7 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = v5;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v27;
  char v12 = 1;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ((v12 & 1) != 0
        && ([*(id *)(*((void *)&v26 + 1) + 8 * i) message],
            int v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v15 containsString:@"Setting process visibility to: Background"],
            v15,
            v16))
      {
        uint64_t v17 = [MEMORY[0x263EFF980] array];
        char v12 = 0;
      }
      else
      {
        uint64_t v18 = [v14 message];
        int v19 = [v18 containsString:@"Setting process visibility to: Foreground"];

        if (!v19) {
          goto LABEL_15;
        }
        [v7 addObject:v14];
        if ([v7 count])
        {
          id v20 = (void *)[v7 copy];
          [v25 addObject:v20];
        }
        uint64_t v17 = 0;
        char v12 = 1;
      }

      id v7 = (void *)v17;
LABEL_15:
      [v7 addObject:v14];
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v10);
LABEL_17:

  if ([v7 count])
  {
    int v21 = (void *)[v7 copy];
    [v25 addObject:v21];
  }
  id v6 = v23;
  id v5 = v24;
LABEL_21:

  return v25;
}

- (id)getMessagesBeforeRunning:(id)a3 forActivity:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = 0;
    uint64_t v29 = *(void *)v31;
LABEL_3:
    uint64_t v12 = 0;
    uint64_t v28 = v9;
    while (1)
    {
      if (*(void *)v31 != v29) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
      id v14 = [v13 message];
      int v15 = [NSString stringWithFormat:@"%@", v6];
      if (([v14 containsString:v15] & 1) == 0) {
        break;
      }
      int v16 = v11;
      id v17 = v7;
      id v18 = v6;
      int v19 = [v13 message];
      if ([v19 containsString:@"Submitted:"])
      {

        id v6 = v18;
        id v7 = v17;
        uint64_t v11 = v16;
        uint64_t v9 = v28;
      }
      else
      {
        [v13 message];
        v21 = char v20 = v10;
        int v27 = [v21 containsString:@"SUBMITTING:"];

        char v10 = v20;
        id v6 = v18;
        id v7 = v17;
        uint64_t v11 = v16;
        uint64_t v9 = v28;
        if (!v27) {
          goto LABEL_12;
        }
      }
      uint64_t v22 = [MEMORY[0x263EFF980] array];

      char v10 = 1;
      uint64_t v11 = (void *)v22;
LABEL_16:
      [v11 addObject:v13];
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_21;
      }
    }

LABEL_12:
    if (v10)
    {
      id v23 = [v13 message];
      char v24 = [v23 containsString:@"Running activities :"];

      if (v24)
      {
        [v11 addObject:v13];
        id v25 = v11;

        goto LABEL_22;
      }
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
    }
    goto LABEL_16;
  }
  uint64_t v11 = 0;
LABEL_21:

  id v25 = v11;
LABEL_22:

  return v25;
}

- (id)getAllBARActivityNames:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v15 = [MEMORY[0x263EFF9C0] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v10 = [v9 message];
        if ([v10 containsString:@"Submitted Activity: <_DASActivity: \"bgRefresh-"])
        {
          uint64_t v11 = [v9 message];
          char v12 = [v11 containsString:@"widget"];

          if (v12) {
            continue;
          }
          id v13 = [v9 message];
          char v10 = getSubstring(v13, @"Submitted: <_DASActivity: \", @"\", Background,"", 0);

          if (v10) {
            [v15 addObject:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v15;
}

- (id)getAllPushLaunchActivityNames:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v22 = [MEMORY[0x263EFF9C0] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = @"Submitted: <_DASActivity: ";
    uint64_t v8 = *(void *)v25;
    uint64_t v9 = @"widget";
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "message", v22);
        if ([v12 containsString:v7])
        {
          id v13 = [v11 message];
          if ([v13 containsString:v9])
          {
          }
          else
          {
            [v11 message];
            uint64_t v14 = v6;
            uint64_t v15 = v8;
            long long v16 = v7;
            id v17 = v4;
            v19 = long long v18 = v9;
            int v23 = [v19 containsString:@"pushLaunch"];

            uint64_t v9 = v18;
            id v4 = v17;
            uint64_t v7 = v16;
            uint64_t v8 = v15;
            uint64_t v6 = v14;

            if (!v23) {
              continue;
            }
            char v20 = [v11 message];
            char v12 = getSubstring(v20, @"Submitted: <_DASActivity: \", @"\", Maintenance,"", 0);

            if (v12) {
              [v22 addObject:v12];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  return v22;
}

- (id)getMessagesWhenAppBackgroundSwitch:(id)a3 forApplication:(id)a4 switchTo:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v13 message];
        uint64_t v15 = [NSString stringWithFormat:@"Setting process visibility to: %@", v7];
        char v16 = [v14 containsString:v15];

        if (v16)
        {
          long long v19 = [MEMORY[0x263EFF980] array];
          [v19 addObject:v13];
          id v18 = v19;

          id v17 = v18;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
  id v18 = v8;
LABEL_11:

  return v17;
}

- (id)getMessagesForAllBARTasks:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v25 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0x263F08000uLL;
    uint64_t v8 = *(void *)v30;
    uint64_t v9 = @"bgRefresh-";
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      uint64_t v23 = v6;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        char v12 = [v11 message];
        id v13 = [*(id *)(v7 + 2880) stringWithFormat:v9];
        int v14 = [v12 containsString:v13];
        if (v14)
        {
          id v3 = [v11 message];
          if (([v3 containsString:@"widget"] & 1) == 0)
          {

LABEL_17:
            [v25 addObject:v11];
            goto LABEL_18;
          }
        }
        long long v27 = v12;
        uint64_t v28 = v3;
        uint64_t v15 = [v11 message];
        char v16 = [*(id *)(v7 + 2880) stringWithFormat:@"Timeline for "];
        if ([v15 containsString:v16])
        {
          int v26 = 1;
        }
        else
        {
          id v17 = [v11 message];
          [*(id *)(v7 + 2880) stringWithFormat:@"pushLaunch"];
          id v18 = v9;
          v20 = unint64_t v19 = v7;
          int v26 = [v17 containsString:v20];

          unint64_t v7 = v19;
          uint64_t v9 = v18;
          uint64_t v6 = v23;

          uint64_t v8 = v22;
        }

        if (v14)
        {
          id v3 = v28;

          if (v26) {
            goto LABEL_17;
          }
        }
        else
        {

          id v3 = v28;
          if (v26) {
            goto LABEL_17;
          }
        }
LABEL_18:
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  return v25;
}

- (id)getMessagesForBARLifecycle:(id)a3 forApplication:(id)a4 queryStatus:(id)a5 taskType:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v29 = a6;
  id v28 = [MEMORY[0x263EFF980] array];
  long long v27 = v11;
  if ([v11 isEqual:@"Submitted"])
  {
    char v12 = @"Submitted: <_DASActivity: ";
  }
  else if (objc_msgSend(v11, "isEqual:", @"Completed", v11))
  {
    char v12 = @"COMPLETED ";
  }
  else if ([v11 isEqual:@"Prediction"])
  {
    char v12 = @"Timeline for ";
  }
  else
  {
    NSLog(&cfstr_UnsupportedInp.isa);
    char v12 = 0;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unint64_t v19 = objc_msgSend(v18, "message", v27);
        if (([v19 containsString:v10] & 1) == 0) {
          goto LABEL_18;
        }
        char v20 = [v18 message];
        if (([v20 containsString:v12] & 1) == 0)
        {

LABEL_18:
          continue;
        }
        [v18 message];
        uint64_t v21 = v16;
        id v22 = v10;
        id v23 = v13;
        id v25 = v24 = v12;
        int v30 = [v25 containsString:v29];

        char v12 = v24;
        id v13 = v23;
        id v10 = v22;
        uint64_t v16 = v21;

        if (v30) {
          [v28 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v15);
  }

  return v28;
}

- (id)getActivityStartBeforeDate:(id)a3 forActivity:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = a3;
  uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [v8 message];
        int v10 = [v9 containsString:@"Submitted:"];

        if (v10)
        {
          id v11 = [v8 message];
          char v12 = getSubstring(v11, @", [", @"], Group:", 0);

          id v13 = [v12 componentsSeparatedByString:@" "];
          uint64_t v14 = NSString;
          uint64_t v15 = [v13 objectAtIndexedSubscript:0];
          uint64_t v16 = [v13 objectAtIndexedSubscript:1];
          id v17 = [v13 objectAtIndexedSubscript:2];
          uint64_t v5 = [v14 stringWithFormat:@"%@ %@ %@", v15, v16, v17];

          goto LABEL_11;
        }
      }
      uint64_t v5 = (void *)[v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)didActivityRun:(id)a3 forActivity:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "message", (void)v13);
        char v10 = [v9 containsString:@"Running activities :"];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)getMessagesAfterRunning:(id)a3 forActivity:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v20 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        char v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v13 = [v12 message];
        int v14 = [v13 containsString:@"Running activities :"];

        if (v14)
        {
          uint64_t v15 = [MEMORY[0x263EFF980] array];

          id v9 = (void *)v15;
        }
        else
        {
          long long v16 = [v12 message];
          if ([v16 containsString:@"COMPLETED"])
          {

LABEL_15:
            if (!v9)
            {
              id v9 = [MEMORY[0x263EFF980] array];
            }
            [v9 addObject:v12];
            goto LABEL_18;
          }
          id v17 = [v12 message];
          int v18 = [v17 containsString:@"CANCELED"];

          if (v18) {
            goto LABEL_15;
          }
        }
        [v9 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_18:

  return v9;
}

- (int)didActivityFinish:(id)a3 forActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "message", (void)v16);
        char v11 = [v10 containsString:@"COMPLETED"];

        if (v11)
        {
          int v14 = 1;
          goto LABEL_14;
        }
        char v12 = [v9 message];
        char v13 = [v12 containsString:@"CANCELED"];

        if (v13)
        {
          int v14 = 2;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      int v14 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v14 = 0;
  }
LABEL_14:

  return v14;
}

- (int)didActivityFinish:(id)a3 forBARActivity:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v4);
        }
        char v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v12 = [v11 message];
        char v13 = [v12 containsString:@"COMPLETED"];

        if (v13)
        {
          char v8 = 1;
        }
        else
        {
          int v14 = [v11 message];
          char v15 = [v14 containsString:@"CANCELED"];

          v7 |= v15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
    if (v7) {
      int v16 = 2;
    }
    else {
      int v16 = 0;
    }
    if (v8) {
      int v17 = 1;
    }
    else {
      int v17 = v16;
    }
  }
  else
  {
    int v17 = 0;
  }

  return v17;
}

- (id)getMessagesActivityFinish:(id)a3 forActivity:(id)a4 isCompleted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        char v15 = objc_msgSend(v14, "message", (void)v23);
        int v16 = [v15 containsString:v8];

        if (v16)
        {
          int v17 = [v14 message];
          long long v18 = v17;
          long long v19 = v5 ? @"COMPLETED" : @"CANCELED";
          char v20 = [v17 containsString:v19];

          if (v20)
          {
            id v21 = v14;
            goto LABEL_15;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v21 = 0;
LABEL_15:

  return v21;
}

- (BOOL)didBARFinish:(id)a3 forApplication:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "message", (void)v13);
        char v10 = [v9 containsString:@"COMPLETED bgRefresh-"];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)summarizeRuntimeOverMessages:(id)a3 forActivity:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v34 = defaultFormatter();
    uint64_t v7 = [v5 firstObject];
    v37 = [v7 date];

    id v8 = [v5 lastObject];
    uint64_t v36 = [v8 date];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
    id v35 = v6;
    if (v10)
    {
      uint64_t v11 = v10;
      id v33 = v5;
      uint64_t v12 = 0;
      char v13 = 0;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v9);
          }
          long long v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          int v17 = [v16 message];
          int v18 = [v17 containsString:@"Suspending"];

          if (v18)
          {
            uint64_t v19 = [v16 date];

            char v13 = 1;
            uint64_t v12 = (void *)v19;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v11);

      char v20 = NSString;
      if (v13)
      {
        id v21 = v34;
        long long v22 = [v34 stringFromDate:v12];
        char v23 = 1;
        long long v24 = [v20 stringWithFormat:@"%d %@", 1, v22];

        id v5 = v33;
LABEL_17:
        long long v26 = NSString;
        long long v27 = getIntervalString(v37, v36);
        uint64_t v28 = [v21 stringFromDate:v37];
        id v29 = [v21 stringFromDate:v36];
        int v30 = [v26 stringWithFormat:@"Activity ran for %@, from %@ to %@(Was suspended = %@)\n", v27, v28, v29, v24];

        long long v25 = [MEMORY[0x263EFF9A0] dictionary];
        [v25 setObject:v30 forKeyedSubscript:@"result"];
        if (v23)
        {
          long long v31 = [v21 stringFromDate:v12];
          [v25 setObject:v31 forKeyedSubscript:@"suspendTime"];
        }
        else
        {
          [v25 setObject:&stru_26DDDA0E0 forKeyedSubscript:@"suspendTime"];
        }

        id v6 = v35;
        goto LABEL_21;
      }
      id v5 = v33;
    }
    else
    {

      uint64_t v12 = 0;
      char v20 = NSString;
    }
    id v21 = v34;
    long long v24 = [v20 stringWithFormat:@"%d %@", 0, &stru_26DDDA0E0];
    char v23 = 0;
    goto LABEL_17;
  }
  long long v25 = 0;
LABEL_21:

  return v25;
}

- (id)getPolicyDenialReasonsFromMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 containsString:@"Must Not Proceed}"])
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v15 = v3;
    id v5 = [v3 componentsSeparatedByString:@"\n"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v10 containsString:@"Not Proceed, Score:"])
          {
            uint64_t v11 = getSubstring(v10, @"\t{name: ", @",", 0);
            if (v11)
            {
              uint64_t v12 = getSubstring(v10, @"Rationale: [", @"]", 1);
              [v4 setObject:v12 forKeyedSubscript:v11];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    id v13 = v4;

    id v3 = v15;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)getpolicyToIntervals:(id)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v99 = defaultFormatter();
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v85 = *(void *)v118;
    char v8 = 1;
    v98 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v82 = v6;
      do
      {
        if (*(void *)v118 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v117 + 1) + 8 * v9);
        uint64_t v11 = [v10 message];
        uint64_t v12 = [(_DASLogExtractor *)self getPolicyDenialReasonsFromMessage:v11];

        v100 = v12;
        if (v12)
        {
          uint64_t v88 = v9;
          id v13 = (void *)MEMORY[0x263EFFA08];
          uint64_t v14 = [v7 allKeys];
          id v15 = [v13 setWithArray:v14];

          long long v16 = (void *)MEMORY[0x263EFFA08];
          long long v17 = [v12 allKeys];
          long long v18 = [v16 setWithArray:v17];

          id v89 = v7;
          v87 = v18;
          if (v8)
          {
            id v19 = v18;

            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            id v20 = v19;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v113 objects:v124 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              id v92 = v20;
              uint64_t v95 = *(void *)v114;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v114 != v95) {
                    objc_enumerationMutation(v92);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v113 + 1) + 8 * i);
                  long long v25 = [MEMORY[0x263EFF980] array];
                  [v4 setObject:v25 forKeyedSubscript:v24];

                  long long v26 = objc_opt_new();
                  long long v27 = [v10 date];
                  [v26 setStartDate:v27];

                  uint64_t v28 = [v10 date];
                  [v26 setEndDate:v28];

                  id v29 = [v100 objectForKeyedSubscript:v24];
                  int v30 = [MEMORY[0x263EFF980] array];
                  long long v31 = NSString;
                  long long v32 = [v10 date];
                  id v33 = [v99 stringFromDate:v32];
                  long long v34 = [v31 stringWithFormat:@"[%@] %@", v33, v29];
                  [v30 addObject:v34];

                  id v4 = v98;
                  [v26 setValue:v30];
                  id v35 = [v98 objectForKeyedSubscript:v24];
                  [v35 addObject:v26];
                }
                uint64_t v22 = [v92 countByEnumeratingWithState:&v113 objects:v124 count:16];
              }
              while (v22);
              id v20 = v92;
              uint64_t v36 = v92;
              id v7 = v89;
              uint64_t v6 = v82;
            }
            else
            {
              uint64_t v36 = v20;
            }
          }
          else
          {
            v37 = (void *)[v15 mutableCopy];
            [v37 unionSet:v18];
            [v37 minusSet:v18];
            v83 = (void *)[v37 copy];
            [v37 unionSet:v18];
            v84 = v15;
            [v37 minusSet:v15];
            id v93 = v37;
            long long v38 = (void *)[v37 copy];
            long long v109 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            id v91 = v38;
            uint64_t v39 = [v91 countByEnumeratingWithState:&v109 objects:v123 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v96 = *(void *)v110;
              do
              {
                for (uint64_t j = 0; j != v40; ++j)
                {
                  if (*(void *)v110 != v96) {
                    objc_enumerationMutation(v91);
                  }
                  uint64_t v42 = *(void *)(*((void *)&v109 + 1) + 8 * j);
                  uint64_t v43 = [v4 objectForKeyedSubscript:v42];

                  if (!v43)
                  {
                    v44 = [MEMORY[0x263EFF980] array];
                    [v4 setObject:v44 forKeyedSubscript:v42];
                  }
                  v45 = objc_opt_new();
                  v46 = [v10 date];
                  [v45 setStartDate:v46];

                  v47 = [v10 date];
                  [v45 setEndDate:v47];

                  v48 = [v100 objectForKeyedSubscript:v42];
                  v49 = [MEMORY[0x263EFF980] array];
                  v50 = NSString;
                  v51 = [v10 date];
                  v52 = [v99 stringFromDate:v51];
                  v53 = [v50 stringWithFormat:@"[%@] %@", v52, v48];
                  [v49 addObject:v53];

                  id v4 = v98;
                  [v45 setValue:v49];
                  v54 = [v98 objectForKeyedSubscript:v42];
                  [v54 addObject:v45];
                }
                uint64_t v40 = [v91 countByEnumeratingWithState:&v109 objects:v123 count:16];
              }
              while (v40);
            }

            [v93 unionSet:v84];
            [v93 minusSet:v91];
            [v93 minusSet:v83];
            v55 = (void *)[v93 copy];
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            id v90 = v55;
            v56 = v89;
            v57 = v100;
            uint64_t v97 = [v90 countByEnumeratingWithState:&v105 objects:v122 count:16];
            if (v97)
            {
              uint64_t v94 = *(void *)v106;
              do
              {
                for (uint64_t k = 0; k != v97; ++k)
                {
                  if (*(void *)v106 != v94) {
                    objc_enumerationMutation(v90);
                  }
                  uint64_t v59 = *(void *)(*((void *)&v105 + 1) + 8 * k);
                  v60 = [v4 objectForKeyedSubscript:v59];
                  [v60 count];
                  v61 = [v60 lastObject];
                  v62 = [v10 date];
                  [v61 setEndDate:v62];

                  v63 = [v57 objectForKeyedSubscript:v59];
                  v64 = [v56 objectForKeyedSubscript:v59];
                  if (([v63 isEqualToString:v64] & 1) == 0)
                  {
                    v65 = [v61 value];
                    v66 = NSString;
                    v67 = [v10 date];
                    v68 = [v99 stringFromDate:v67];
                    v69 = [v66 stringWithFormat:@"[%@] %@", v68, v63];
                    [v65 addObject:v69];

                    id v4 = v98;
                    v57 = v100;
                    v56 = v89;
                  }
                }
                uint64_t v97 = [v90 countByEnumeratingWithState:&v105 objects:v122 count:16];
              }
              while (v97);
            }

            id v7 = v57;
            uint64_t v6 = v82;
            id v20 = v93;
            uint64_t v36 = v84;
          }

          char v8 = 0;
          uint64_t v9 = v88;
        }

        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  v70 = [obj lastObject];
  v71 = [v70 date];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v72 = [v7 allKeys];
  uint64_t v73 = [v72 countByEnumeratingWithState:&v101 objects:v121 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v102;
    do
    {
      for (uint64_t m = 0; m != v74; ++m)
      {
        if (*(void *)v102 != v75) {
          objc_enumerationMutation(v72);
        }
        v77 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v101 + 1) + 8 * m)];
        [v77 count];
        v78 = [v77 lastObject];
        [v78 setEndDate:v71];
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v101 objects:v121 count:16];
    }
    while (v74);
  }

  id v79 = v4;
  return v79;
}

- (id)descriptionOfPolicyToIntervalsMap:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v3 = [v35 allKeys];
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263F089D8] string];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    int v30 = v3;
    id obj = v3;
    uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v53;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v53 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v5;
          uint64_t v6 = *(void *)(*((void *)&v52 + 1) + 8 * v5);
          [(__CFString *)v4 appendString:@"\n\n-------------------------------------------------------"];
          [(__CFString *)v4 appendString:@"-------------------------------------------------------\n"];
          id v7 = [NSString stringWithFormat:@"Policy: %@", v6];
          [(__CFString *)v4 appendString:v7];

          char v8 = [NSString stringWithFormat:@"\n\nDenial Intervals:\n"];
          [(__CFString *)v4 appendString:v8];

          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v38 = v6;
          uint64_t v9 = [v35 objectForKeyedSubscript:v6];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v49 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                id v15 = [v14 intervalString];
                long long v16 = [v14 durationString];
                long long v17 = [NSString stringWithFormat:@"\t%@\t%@\n", v15, v16];
                [(__CFString *)v4 appendString:v17];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v48 objects:v58 count:16];
            }
            while (v11);
          }

          long long v18 = [NSString stringWithFormat:@"\n\nRationales:\n"];
          [(__CFString *)v4 appendString:v18];

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v36 = [v35 objectForKeyedSubscript:v38];
          uint64_t v39 = [v36 countByEnumeratingWithState:&v44 objects:v57 count:16];
          if (v39)
          {
            uint64_t v37 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                if (*(void *)v45 != v37) {
                  objc_enumerationMutation(v36);
                }
                id v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                uint64_t v21 = [v20 intervalString];
                uint64_t v22 = [NSString stringWithFormat:@"\t%@:\n", v21];
                [(__CFString *)v4 appendString:v22];

                long long v42 = 0u;
                long long v43 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                char v23 = [v20 value];
                uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
                if (v24)
                {
                  uint64_t v25 = v24;
                  uint64_t v26 = *(void *)v41;
                  do
                  {
                    for (uint64_t k = 0; k != v25; ++k)
                    {
                      if (*(void *)v41 != v26) {
                        objc_enumerationMutation(v23);
                      }
                      uint64_t v28 = [NSString stringWithFormat:@"\t\t%@\n", *(void *)(*((void *)&v40 + 1) + 8 * k)];
                      [(__CFString *)v4 appendString:v28];
                    }
                    uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v56 count:16];
                  }
                  while (v25);
                }
              }
              uint64_t v39 = [v36 countByEnumeratingWithState:&v44 objects:v57 count:16];
            }
            while (v39);
          }

          uint64_t v5 = v34 + 1;
        }
        while (v34 + 1 != v33);
        uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v33);
    }

    [(__CFString *)v4 appendString:@"\n\n-------------------------------------------------------"];
    [(__CFString *)v4 appendString:@"-------------------------------------------------------"];
    id v3 = v30;
  }
  else
  {
    id v4 = &stru_26DDDA0E0;
  }

  return v4;
}

- (id)getIncompatibilityReasons:(id)a3 forActivity:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v38 = [MEMORY[0x263EFF980] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = @"Bailing  out.";
    uint64_t v12 = *(void *)v41;
    id v36 = v6;
    id v37 = v7;
    do
    {
      uint64_t v13 = 0;
      uint64_t v39 = v9;
      do
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
        id v15 = [v14 message];
        int v16 = [v15 containsString:v11];

        if (v16)
        {
          long long v17 = v11;
          long long v18 = [v14 message];
          id v19 = getSubstring(v18, @"'", @"' has compatibility", 0);

          id v20 = (void *)[v19 copy];
          uint64_t v21 = getSubstring(v20, 0, @":", 0);

          if ([v21 containsString:v6])
          {
            uint64_t v22 = [v14 message];
            char v23 = getSubstring(v22, @"with ", @". Bailing ", 0);

            uint64_t v24 = [v14 message];
            uint64_t v25 = getSubstring(v24, @"score of ", @" with", 0);

            if (v10)
            {
              if ([v23 isEqualToString:v10])
              {
                uint64_t v26 = [v14 date];
                long long v27 = [v38 lastObject];
                [v27 setEndDate:v26];
              }
              else
              {
                uint64_t v26 = objc_opt_new();
                long long v31 = [v14 date];
                [v26 setStartDate:v31];

                uint64_t v32 = [v14 date];
                [v26 setEndDate:v32];

                uint64_t v33 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v23, @"activity", v25, @"score", 0);
                [v26 setValue:v33];

                [v38 addObject:v26];
                id v34 = v23;

                id v10 = v34;
                id v6 = v36;
              }
            }
            else
            {
              uint64_t v26 = objc_opt_new();
              uint64_t v28 = [v14 date];
              [v26 setStartDate:v28];

              id v29 = [v14 date];
              [v26 setEndDate:v29];

              int v30 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v23, @"activity", v25, @"score", 0);
              [v26 setValue:v30];

              [v38 addObject:v26];
              id v10 = v23;
            }

            id v7 = v37;
          }

          uint64_t v11 = v17;
          uint64_t v9 = v39;
        }
        ++v13;
      }
      while (v9 != v13);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v38;
}

- (id)descriptionOfIncompatibilityDenials:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263F089D8] string];
    [(__CFString *)v4 appendString:@"\n"];
    [(__CFString *)v4 appendString:@"Denials due to incompatibility:\n"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v17 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v10 = [v9 value];
          uint64_t v11 = [v10 objectForKeyedSubscript:@"activity"];
          uint64_t v12 = NSString;
          uint64_t v13 = [v9 durationString];
          uint64_t v14 = [v9 intervalString];
          id v15 = [v12 stringWithFormat:@"\tDuration: %@ %@ Activity: %@ \n", v13, v14, v11];

          [(__CFString *)v4 appendString:v15];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    [(__CFString *)v4 appendString:@"\n\n-------------------------------------------------------"];
    [(__CFString *)v4 appendString:@"-------------------------------------------------------"];
    id v3 = v17;
  }
  else
  {
    id v4 = &stru_26DDDA0E0;
  }

  return v4;
}

- (id)getInstancesOfHigherThreshold:(id)a3 forActivity:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v27 = a4;
  id v29 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 1;
    uint64_t v30 = *(void *)v32;
    id v26 = v6;
    do
    {
      uint64_t v10 = 0;
      uint64_t v28 = v8;
      do
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        uint64_t v12 = [v11 message];
        uint64_t v13 = v12;
        if (v9)
        {
          int v14 = [v12 containsString:@"DecisionToRun:0"];

          if (v14)
          {
            id v15 = objc_opt_new();
            int v16 = [v11 date];
            [v15 setStartDate:v16];

            id v17 = [v11 date];
            [v15 setEndDate:v17];

            long long v18 = [NSString stringWithFormat:@"'%@", v27];
            long long v19 = [v11 message];
            long long v20 = getSubstring(v19, v18, @" CurrentScore:", 0);

            long long v21 = [NSString stringWithFormat:@"%@%@", v18, v20];
            long long v22 = [v11 message];
            char v23 = getSubstring(v22, v21, @" DecisionToRun", 0);
            [v15 setValue:v23];

            [v29 addObject:v15];
            id v6 = v26;
            uint64_t v8 = v28;

LABEL_11:
            v9 ^= 1u;

            goto LABEL_14;
          }
          char v9 = 1;
        }
        else
        {
          int v24 = [v12 containsString:@"Must Not Proceed"];

          if (v24)
          {
            id v15 = [v11 date];
            long long v18 = [v29 lastObject];
            [v18 setEndDate:v15];
            goto LABEL_11;
          }
          char v9 = 0;
        }
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  return v29;
}

- (id)descriptionOfHigherThresholds:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263F089D8] string];
    [(__CFString *)v4 appendString:@"\n"];
    [(__CFString *)v4 appendString:@"Denials due to higher Threshold scores:\n"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          char v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = [v9 value];
          uint64_t v11 = NSString;
          uint64_t v12 = [v9 durationString];
          uint64_t v13 = [v9 intervalString];
          int v14 = [v11 stringWithFormat:@"\t%@   Duration: %@   Values: %@\n", v12, v13, v10];

          [(__CFString *)v4 appendString:v14];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    [(__CFString *)v4 appendString:@"\n\n-------------------------------------------------------"];
    [(__CFString *)v4 appendString:@"-------------------------------------------------------"];
  }
  else
  {
    id v4 = &stru_26DDDA0E0;
  }

  return v4;
}

- (id)summarizePolicyDenialsOverMessages:(id)a3 maxDuration:(double)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v41 = v5;
  [v5 allKeys];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v12 = [v41 objectForKeyedSubscript:v11];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v45;
          double v17 = 0.0;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v45 != v16) {
                objc_enumerationMutation(v13);
              }
              [*(id *)(*((void *)&v44 + 1) + 8 * j) duration];
              if (v17 < 0.0)
              {
                double v17 = a4;
                goto LABEL_17;
              }
              double v17 = v17 + v19;
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        else
        {
          double v17 = 0.0;
        }
LABEL_17:

        long long v20 = [NSNumber numberWithDouble:v17];
        [v6 setObject:v20 forKeyedSubscript:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }
  long long v21 = [v6 allKeys];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __67___DASLogExtractor_summarizePolicyDenialsOverMessages_maxDuration___block_invoke;
  v42[3] = &unk_26486D5B0;
  id v22 = v6;
  id v43 = v22;
  char v23 = [v21 sortedArrayUsingComparator:v42];

  if ([v23 count])
  {
    int v24 = [MEMORY[0x263F089D8] stringWithFormat:@"\tThe top blocking policies are :\n"];
    uint64_t v25 = [MEMORY[0x263EFF910] date];
    unint64_t v26 = [v23 count];
    uint64_t v27 = 6;
    if (v26 < 6) {
      uint64_t v27 = v26;
    }
    if (v27)
    {
      for (unint64_t k = 0; k < v38; ++k)
      {
        id v29 = (void *)MEMORY[0x263EFF910];
        uint64_t v30 = [v23 objectAtIndexedSubscript:k];
        long long v31 = [v22 objectForKeyedSubscript:v30];
        [v31 doubleValue];
        long long v32 = objc_msgSend(v29, "dateWithTimeInterval:sinceDate:", v25);

        long long v33 = NSString;
        long long v34 = [v23 objectAtIndexedSubscript:k];
        id v35 = getIntervalString(v25, v32);
        uint64_t v36 = [v33 stringWithFormat:@"\t\t%@ : %@,\n", v34, v35];
        [(__CFString *)v24 appendString:v36];

        unint64_t v37 = [v23 count];
        unint64_t v38 = 6;
        if (v37 < 6) {
          unint64_t v38 = v37;
        }
      }
    }
  }
  else
  {
    int v24 = &stru_26DDDA0E0;
  }

  return v24;
}

- (id)summarizeAllDenialsOverMessages:(id)a3 forActivity:(id)a4 detail:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    uint64_t v10 = [MEMORY[0x263F089D8] string];
    uint64_t v11 = [v8 firstObject];
    uint64_t v12 = [v11 date];

    id v13 = [v8 lastObject];
    uint64_t v14 = [v13 date];

    uint64_t v25 = (void *)v12;
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;
    double v17 = [(_DASLogExtractor *)self getpolicyToIntervals:v8];
    long long v18 = [(_DASLogExtractor *)self summarizePolicyDenialsOverMessages:v17 maxDuration:v16];
    [(__CFString *)v10 appendString:v18];
    if (v5)
    {
      double v19 = [(_DASLogExtractor *)self descriptionOfPolicyToIntervalsMap:v17];
      [(__CFString *)v10 appendString:v19];
    }
    long long v20 = [(_DASLogExtractor *)self getIncompatibilityReasons:v8 forActivity:v9];
    long long v21 = [(_DASLogExtractor *)self descriptionOfIncompatibilityDenials:v20];
    [(__CFString *)v10 appendString:v21];
    id v22 = [(_DASLogExtractor *)self getInstancesOfHigherThreshold:v8 forActivity:v9];
    char v23 = [(_DASLogExtractor *)self descriptionOfHigherThresholds:v22];
    [(__CFString *)v10 appendString:v23];
  }
  else
  {
    uint64_t v10 = @"The task is not blocked";
  }

  return v10;
}

- (id)getSummaryFromLogs:(id)a3 forActivity:(id)a4 detail:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v65 = self;
  id v9 = [(_DASLogExtractor *)self getScheduledBlocksOfMessages:a3 forActivity:v8];
  v61 = defaultFormatter();
  id v66 = [MEMORY[0x263F089D8] string];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v59 = *(void *)v72;
    id v60 = v8;
    uint64_t v64 = 1;
    unsigned int v52 = v5;
    do
    {
      uint64_t v12 = 0;
      uint64_t v53 = v11;
      do
      {
        if (*(void *)v72 != v59) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v71 + 1) + 8 * v12);
        uint64_t v14 = [v13 firstObject];
        v70 = [v14 date];

        double v15 = [v13 lastObject];
        v68 = [v15 date];

        double v16 = [(_DASLogExtractor *)v65 getMessagesBeforeRunning:v13 forActivity:v8];
        double v17 = [(_DASLogExtractor *)v65 summarizeAllDenialsOverMessages:v16 forActivity:v8 detail:v5];
        if (([v17 isEqualToString:@"The task is not blocked"] & 1) == 0)
        {
          [(_DASLogExtractor *)v65 getActivityStartBeforeDate:v13 forActivity:v8];
          v58 = long long v18 = v61;
          objc_msgSend(v61, "dateFromString:");
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          long long v20 = v19;
          if (!v19 || ([v19 timeIntervalSinceDate:v70], id v69 = v20, v21 < 0.0))
          {
            id v69 = v70;
          }
          v57 = v20;
          BOOL v22 = [(_DASLogExtractor *)v65 didActivityRun:v13 forActivity:v8];
          v56 = v16;
          char v23 = [v16 lastObject];
          int v24 = [v23 date];

          if (v22)
          {
            uint64_t v25 = [(_DASLogExtractor *)v65 getMessagesAfterRunning:v13 forActivity:v8];
            unint64_t v26 = [(_DASLogExtractor *)v65 summarizeRuntimeOverMessages:v25 forActivity:v8];
            long long v55 = [v26 objectForKeyedSubscript:@"result"];
            v67 = [v26 objectForKeyedSubscript:@"suspendTime"];
            uint64_t v27 = NSString;
            uint64_t v28 = [v61 stringFromDate:v24];
            v63 = [v27 stringWithFormat:@"%@", v28];

            long long v18 = v61;
            id v29 = &stru_26DDDA0E0;
          }
          else
          {
            v63 = @"-";
            id v29 = &stru_26DDDA0E0;
            long long v55 = &stru_26DDDA0E0;
            v67 = &stru_26DDDA0E0;
          }
          uint64_t v30 = getIntervalString(v69, v24);
          if (([v30 isEqualToString:&stru_26DDDA0E0] & 1) == 0)
          {
            long long v31 = NSString;
            long long v32 = getIntervalString(v69, v24);
            id v29 = [v31 stringWithFormat:@"Activity was blocked for %@\n\n", v32];
          }
          int v33 = [(_DASLogExtractor *)v65 didActivityFinish:v13 forActivity:v60];
          if (v33)
          {
            long long v34 = NSString;
            id v35 = [v18 stringFromDate:v68];
            v62 = [v34 stringWithFormat:@"%@", v35];

            long long v18 = v61;
          }
          else
          {
            v62 = @"-";
          }
          uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"\n\n############################################# Scheduled Block %d #############################################\n\n", v64);
          [v66 appendString:v36];

          unint64_t v37 = NSString;
          [v18 stringFromDate:v70];
          v39 = unint64_t v38 = v18;
          long long v40 = [v37 stringWithFormat:@"Submitted at:         %@\n", v39];
          [v66 appendString:v40];

          long long v41 = NSString;
          long long v42 = [v38 stringFromDate:v69];
          id v43 = [v41 stringWithFormat:@"Eligible from:        %@\n", v42];
          [v66 appendString:v43];

          long long v44 = [NSString stringWithFormat:@"Activity ran at:      %@\n", v63];
          [v66 appendString:v44];

          if (([(__CFString *)v67 isEqualToString:&stru_26DDDA0E0] & 1) == 0)
          {
            long long v45 = [NSString stringWithFormat:@"Suspended at:         %@\n", v67];
            [v66 appendString:v45];
          }
          uint64_t v5 = v52;
          if (v33 == 1)
          {
            long long v46 = @"Completed at:        %@\n";
            id v8 = v60;
LABEL_24:
            long long v47 = objc_msgSend(NSString, "stringWithFormat:", v46, v62);
            [v66 appendString:v47];
          }
          else
          {
            id v8 = v60;
            if (v33 == 2)
            {
              long long v46 = @"Canceled at:         %@\n";
              goto LABEL_24;
            }
          }
          uint64_t v64 = (v64 + 1);
          long long v48 = [NSString stringWithFormat:@"\n%@\n", v55];
          [v66 appendString:v48];

          long long v49 = [NSString stringWithFormat:@"%@", v29];
          [v66 appendString:v49];

          long long v50 = [NSString stringWithFormat:@"%@\n", v17];
          [v66 appendString:v50];

          uint64_t v11 = v53;
          double v16 = v56;
        }

        ++v12;
      }
      while (v11 != v12);
      uint64_t v11 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
    }
    while (v11);
  }

  return v66;
}

- (id)getBARSummaryFromLogs:(id)a3 forApplication:(id)a4 detail:(BOOL)a5
{
  BOOL v160 = a5;
  uint64_t v181 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [(_DASLogExtractor *)self getScheduledBlocksOfBARMessages:a3 forApplication:v7];
  v159 = defaultFormatter();
  id v9 = [MEMORY[0x263F089D8] string];
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id obj = v8;
  unint64_t v10 = 0x263F08000uLL;
  v123 = v7;
  uint64_t v124 = [obj countByEnumeratingWithState:&v174 objects:v180 count:16];
  if (v124)
  {
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    uint64_t v122 = *(void *)v175;
    uint64_t v15 = 1;
    v157 = self;
    v158 = v9;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        uint64_t v146 = v15;
        if (*(void *)v175 != v122)
        {
          uint64_t v17 = v16;
          objc_enumerationMutation(obj);
          uint64_t v16 = v17;
        }
        uint64_t v130 = v16;
        uint64_t v18 = *(void *)(*((void *)&v174 + 1) + 8 * v16);
        v144 = [(_DASLogExtractor *)self getMessagesWhenAppBackgroundSwitch:v18 forApplication:v7 switchTo:@"Background"];
        v143 = [(_DASLogExtractor *)self getMessagesWhenAppBackgroundSwitch:v18 forApplication:v7 switchTo:@"Foreground"];
        uint64_t v165 = v18;
        uint64_t v19 = [(_DASLogExtractor *)self getMessagesForAllBARTasks:v18];
        uint64_t v20 = [(_DASLogExtractor *)self getMessagesForBARLifecycle:v19 forApplication:v7 queryStatus:@"Submitted" taskType:@"bgRefresh"];
        v148 = (void *)v19;
        uint64_t v21 = v19;
        BOOL v22 = (void *)v20;
        v156 = [(_DASLogExtractor *)self getMessagesForBARLifecycle:v21 forApplication:v7 queryStatus:@"Completed" taskType:@"bgRefresh"];
        if ([v22 count]) {
          uint64_t v142 = [v22 count];
        }
        else {
          uint64_t v142 = 0;
        }
        v145 = v22;
        if ([v156 count]) {
          uint64_t v141 = [v156 count];
        }
        else {
          uint64_t v141 = 0;
        }
        char v23 = [(_DASLogExtractor *)self getMessagesForBARLifecycle:v148 forApplication:v7 queryStatus:@"Submitted" taskType:@"pushLaunch"];
        v155 = [(_DASLogExtractor *)self getMessagesForBARLifecycle:v148 forApplication:v7 queryStatus:@"Completed" taskType:@"pushLaunch"];
        if ([v23 count]) {
          uint64_t v139 = [v23 count];
        }
        else {
          uint64_t v139 = 0;
        }
        int v133 = v13;
        int v134 = v14;
        int v131 = v11;
        int v132 = v12;
        v129 = v23;
        if ([v155 count]) {
          uint64_t v138 = [v155 count];
        }
        else {
          uint64_t v138 = 0;
        }
        v140 = [(_DASLogExtractor *)self getMessagesForBARLifecycle:v148 forApplication:v7 queryStatus:@"Prediction" taskType:&stru_26DDDA0E0];
        v147 = [(_DASLogExtractor *)self getAllBARActivityNames:v148];
        v136 = [(_DASLogExtractor *)self getAllPushLaunchActivityNames:v148];
        int v24 = [v144 lastObject];
        uint64_t v25 = [v24 date];

        unint64_t v26 = [v143 lastObject];
        uint64_t v27 = [v26 date];

        uint64_t v28 = [v156 lastObject];
        v135 = [v28 date];

        id v29 = *(void **)(v10 + 2880);
        v128 = (void *)v25;
        uint64_t v30 = [v159 stringFromDate:v25];
        v137 = [v29 stringWithFormat:@"%@", v30];

        long long v31 = *(void **)(v10 + 2880);
        v127 = (void *)v27;
        long long v32 = [v159 stringFromDate:v27];
        uint64_t v33 = [v31 stringWithFormat:@"%@", v32];

        BOOL v34 = [(_DASLogExtractor *)self didBARFinish:v148 forApplication:v7];
        id v35 = &stru_26DDDA0E0;
        if (v34)
        {
          uint64_t v36 = *(void **)(v10 + 2880);
          unint64_t v37 = [v159 stringFromDate:v135];
          id v35 = [v36 stringWithFormat:@"%@", v37];
        }
        int v38 = v146;
        uint64_t v39 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"\n\n######################## Scheduled Block %d ########################\n\n", v146);
        [v9 appendString:v39];

        long long v40 = [*(id *)(v10 + 2880) stringWithFormat:@"App switch to background at:                %@\n", v137];
        [v9 appendString:v40];

        uint64_t v126 = (void *)v33;
        long long v41 = [*(id *)(v10 + 2880) stringWithFormat:@"App switch to foreground at:                %@\n", v33];
        [v9 appendString:v41];

        long long v42 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Number of bgRefresh tasks submitted:        %lu\n", v142);
        [v9 appendString:v42];

        id v43 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Number of bgRefresh tasks completed:        %lu\n", v141);
        [v9 appendString:v43];

        long long v44 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Number of pushLaunch tasks submitted:       %lu\n", v139);
        [v9 appendString:v44];

        long long v45 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Number of pushLaunch tasks completed:       %lu\n", v138);
        [v9 appendString:v45];

        long long v46 = v145;
        if (v34)
        {
          long long v47 = [*(id *)(v10 + 2880) stringWithFormat:@"Last Background Refresh Task Completed at:  %@\n", v35];
          [v9 appendString:v47];
        }
        v125 = v35;
        if ([v140 count])
        {
          long long v48 = [v140 lastObject];
          long long v49 = [v48 date];

          long long v50 = *(void **)(v10 + 2880);
          long long v51 = [v159 stringFromDate:v49];
          unsigned int v52 = [v50 stringWithFormat:@"%@", v51];

          uint64_t v53 = [v140 lastObject];
          uint64_t v54 = [v53 message];

          long long v55 = [*(id *)(v10 + 2880) stringWithFormat:@"Last App Launch Prediction Generated at:    %@\n", v52];
          [v9 appendString:v55];

          v56 = [*(id *)(v10 + 2880) stringWithFormat:@"Last App Launch Prediction:                 %@\n", v54];
          [v9 appendString:v56];
        }
        if ([v147 count])
        {
          [v9 appendString:@"--------------------------------------------------------------------\n"];
          [v9 appendString:@"Summary for bgRefresh tasks:\n"];
          long long v172 = 0u;
          long long v173 = 0u;
          long long v170 = 0u;
          long long v171 = 0u;
          id v149 = v147;
          uint64_t v153 = [v149 countByEnumeratingWithState:&v170 objects:v179 count:16];
          if (!v153) {
            goto LABEL_45;
          }
          uint64_t v151 = *(void *)v171;
          while (1)
          {
            for (uint64_t i = 0; i != v153; ++i)
            {
              if (*(void *)v171 != v151) {
                objc_enumerationMutation(v149);
              }
              uint64_t v58 = *(void *)(*((void *)&v170 + 1) + 8 * i);
              uint64_t v59 = [*(id *)(v10 + 2880) stringWithFormat:@"Activity %@     \n", v58];
              [v9 appendString:v59];

              id v60 = [(_DASLogExtractor *)self getMessagesBeforeRunning:v165 forActivity:v58];
              LODWORD(v59) = [(_DASLogExtractor *)self didActivityRun:v165 forActivity:v58];
              v61 = [v60 lastObject];
              v163 = [v61 date];

              v62 = &stru_26DDDA0E0;
              v63 = &stru_26DDDA0E0;
              v161 = &stru_26DDDA0E0;
              if (v59)
              {
                uint64_t v64 = [(_DASLogExtractor *)self getMessagesAfterRunning:v165 forActivity:v58];
                v65 = [(_DASLogExtractor *)self summarizeRuntimeOverMessages:v64 forActivity:v58];
                v161 = [v65 objectForKeyedSubscript:@"result"];
                v63 = [v65 objectForKeyedSubscript:@"suspendTime"];
                id v66 = *(void **)(v10 + 2880);
                v67 = [v159 stringFromDate:v163];
                v62 = [v66 stringWithFormat:@"%@", v67];

                id v9 = v158;
                v68 = [*(id *)(v10 + 2880) stringWithFormat:@"Activity ran at:                            %@\n", v62];
                [v158 appendString:v68];

                if (([(__CFString *)v63 isEqualToString:&stru_26DDDA0E0] & 1) == 0)
                {
                  id v69 = [NSString stringWithFormat:@"Suspended at:                                %@\n", v63];
                  [v158 appendString:v69];
                }
                unint64_t v10 = 0x263F08000;
                self = v157;
              }
              int v70 = [(_DASLogExtractor *)self didActivityFinish:v156 forBARActivity:v58];
              if (v70 == 2)
              {
                v77 = [(_DASLogExtractor *)self getMessagesActivityFinish:v156 forActivity:v58 isCompleted:0];
                long long v73 = v77;
                if (!v77)
                {
                  long long v71 = &stru_26DDDA0E0;
                  goto LABEL_42;
                }
                long long v74 = [v77 date];
                v78 = NSString;
                id v79 = [v159 stringFromDate:v74];
                long long v71 = [v78 stringWithFormat:@"%@", v79];

                [NSString stringWithFormat:@"Canceled at:                                %@\n", v71];
                goto LABEL_40;
              }
              long long v71 = &stru_26DDDA0E0;
              if (v70 != 1) {
                goto LABEL_43;
              }
              long long v72 = [(_DASLogExtractor *)self getMessagesActivityFinish:v156 forActivity:v58 isCompleted:1];
              long long v73 = v72;
              if (v72)
              {
                long long v74 = [v72 date];
                uint64_t v75 = NSString;
                uint64_t v76 = [v159 stringFromDate:v74];
                long long v71 = [v75 stringWithFormat:@"%@", v76];

                [NSString stringWithFormat:@"Completed at:                               %@\n", v71];
                v80 = LABEL_40:;
                id v9 = v158;
                [v158 appendString:v80];

                self = v157;
              }
LABEL_42:

              unint64_t v10 = 0x263F08000uLL;
LABEL_43:
              v81 = [(_DASLogExtractor *)self summarizeAllDenialsOverMessages:v60 forActivity:v58 detail:v160];
              uint64_t v82 = [*(id *)(v10 + 2880) stringWithFormat:@"%@\n", v81];
              [v9 appendString:v82];
            }
            uint64_t v153 = [v149 countByEnumeratingWithState:&v170 objects:v179 count:16];
            if (!v153)
            {
LABEL_45:

              long long v46 = v145;
              int v38 = v146;
              break;
            }
          }
        }
        v83 = v136;
        if (![v136 count]) {
          goto LABEL_68;
        }
        [v9 appendString:@"--------------------------------------------------------------------\n"];
        [v9 appendString:@"Summary for pushLaunch tasks:\n"];
        long long v168 = 0u;
        long long v169 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        id v150 = v136;
        uint64_t v154 = [v150 countByEnumeratingWithState:&v166 objects:v178 count:16];
        if (!v154) {
          goto LABEL_67;
        }
        uint64_t v152 = *(void *)v167;
        do
        {
          for (uint64_t j = 0; j != v154; ++j)
          {
            if (*(void *)v167 != v152) {
              objc_enumerationMutation(v150);
            }
            uint64_t v85 = *(void *)(*((void *)&v166 + 1) + 8 * j);
            v86 = [*(id *)(v10 + 2880) stringWithFormat:@"Activity %@     \n", v85];
            [v9 appendString:v86];

            v87 = [(_DASLogExtractor *)self getMessagesBeforeRunning:v165 forActivity:v85];
            LODWORD(v86) = [(_DASLogExtractor *)self didActivityRun:v165 forActivity:v85];
            uint64_t v88 = [v87 lastObject];
            v164 = [v88 date];

            id v89 = &stru_26DDDA0E0;
            id v90 = &stru_26DDDA0E0;
            v162 = &stru_26DDDA0E0;
            if (v86)
            {
              id v91 = [(_DASLogExtractor *)self getMessagesAfterRunning:v165 forActivity:v85];
              id v92 = [(_DASLogExtractor *)self summarizeRuntimeOverMessages:v91 forActivity:v85];
              v162 = [v92 objectForKeyedSubscript:@"result"];
              id v89 = [v92 objectForKeyedSubscript:@"suspendTime"];
              id v93 = NSString;
              uint64_t v94 = [v159 stringFromDate:v164];
              id v90 = [v93 stringWithFormat:@"%@", v94];

              id v9 = v158;
              uint64_t v95 = [NSString stringWithFormat:@"Activity ran at:                            %@\n", v90];
              [v158 appendString:v95];

              if (([(__CFString *)v89 isEqualToString:&stru_26DDDA0E0] & 1) == 0)
              {
                uint64_t v96 = [NSString stringWithFormat:@"Suspended at:                                %@\n", v89];
                [v158 appendString:v96];
              }
              self = v157;
            }
            int v97 = [(_DASLogExtractor *)self didActivityFinish:v155 forBARActivity:v85];
            if (v97 == 2)
            {
              long long v104 = [(_DASLogExtractor *)self getMessagesActivityFinish:v155 forActivity:v85 isCompleted:0];
              v100 = v104;
              if (!v104)
              {
                v98 = &stru_26DDDA0E0;
                goto LABEL_64;
              }
              long long v101 = [v104 date];
              long long v105 = NSString;
              long long v106 = [v159 stringFromDate:v101];
              v98 = [v105 stringWithFormat:@"%@", v106];

              [NSString stringWithFormat:@"Canceled at:                                %@\n", v98];
              goto LABEL_62;
            }
            v98 = &stru_26DDDA0E0;
            if (v97 != 1) {
              goto LABEL_65;
            }
            v99 = [(_DASLogExtractor *)self getMessagesActivityFinish:v155 forActivity:v85 isCompleted:1];
            v100 = v99;
            if (v99)
            {
              long long v101 = [v99 date];
              long long v102 = NSString;
              long long v103 = [v159 stringFromDate:v101];
              v98 = [v102 stringWithFormat:@"%@", v103];

              [NSString stringWithFormat:@"Completed at:                               %@\n", v98];
              long long v107 = LABEL_62:;
              id v9 = v158;
              [v158 appendString:v107];

              self = v157;
            }
LABEL_64:

LABEL_65:
            long long v108 = [(_DASLogExtractor *)self summarizeAllDenialsOverMessages:v87 forActivity:v85 detail:v160];
            long long v109 = [NSString stringWithFormat:@"%@\n", v108];
            [v9 appendString:v109];

            unint64_t v10 = 0x263F08000uLL;
          }
          uint64_t v154 = [v150 countByEnumeratingWithState:&v166 objects:v178 count:16];
        }
        while (v154);
LABEL_67:

        long long v46 = v145;
        int v38 = v146;
        v83 = v136;
LABEL_68:
        int v14 = v142 + v134;
        int v13 = v141 + v133;
        int v12 = v139 + v132;
        uint64_t v15 = (v38 + 1);
        int v11 = v138 + v131;

        uint64_t v16 = v130 + 1;
        id v7 = v123;
      }
      while (v130 + 1 != v124);
      uint64_t v124 = [obj countByEnumeratingWithState:&v174 objects:v180 count:16];
      if (!v124)
      {
        int v110 = v139 + v132;
        goto LABEL_72;
      }
    }
  }
  int v11 = 0;
  int v110 = 0;
  int v13 = 0;
  int v14 = 0;
LABEL_72:

  long long v111 = [*(id *)(v10 + 2880) stringWithFormat:@"\n\n######################### Overall Summary #########################\n\n"];
  [v9 appendString:v111];

  long long v112 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Total Number of bgRefresh tasks submitted:  %lu\n", v14);
  [v9 appendString:v112];

  long long v113 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Total Number of bgRefresh tasks completed:  %lu\n", v13);
  [v9 appendString:v113];

  long long v114 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Total Number of pushLaunch tasks submitted: %lu\n", v110);
  [v9 appendString:v114];

  long long v115 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Total Number of pushLaunch tasks completed: %lu\n", v11);
  [v9 appendString:v115];

  double v116 = 0.0;
  double v117 = (float)((float)((float)v13 / (float)v14) * 100.0);
  if (!v14) {
    double v117 = 0.0;
  }
  long long v118 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Success rate of bgRefresh tasks completed: %.1f%%\n", *(void *)&v117);
  [v9 appendString:v118];

  if (v11) {
    double v116 = (float)((float)((float)v11 / (float)v110) * 100.0);
  }
  long long v119 = objc_msgSend(*(id *)(v10 + 2880), "stringWithFormat:", @"Success rate of pushLaunch tasks completed: %.1f%%\n", *(void *)&v116);
  [v9 appendString:v119];

  return v9;
}

- (int)summarizeActivity:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6
{
  int v10 = 0;
  id v6 = [(_DASLogExtractor *)self copyActivitySummary:a3 startDate:a4 endDate:a5 detail:a6 error:&v10];
  id v7 = v6;
  int v8 = v10;
  if (!v10) {
    NSLog(&cfstr_Summary.isa, v6);
  }

  return v8;
}

- (int)summarizeApplication:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6
{
  int v10 = 0;
  id v6 = [(_DASLogExtractor *)self copyApplicationSummary:a3 startDate:a4 endDate:a5 detail:a6 error:&v10];
  id v7 = v6;
  int v8 = v10;
  if (!v10) {
    NSLog(&cfstr_Summary_0.isa, v6);
  }

  return v8;
}

- (id)copyActivitySummary:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6 error:(int *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13)
  {
    id v13 = [MEMORY[0x263EFF910] distantPast];
  }
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  uint64_t v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"subsystem = %@", self->_subsystem];
  [v15 addObject:v16];

  uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"eventMessage contains %@", v12];
  [v15 addObject:v17];

  if (v14)
  {
    uint64_t v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"date <= %@", v14];
    [v15 addObject:v18];
  }
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = [MEMORY[0x263EFF980] array];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __71___DASLogExtractor_copyActivitySummary_startDate_endDate_detail_error___block_invoke;
  v22[3] = &unk_26486D5D8;
  v22[4] = &v23;
  int v19 = [(_DASLogExtractor *)self handleLogEventsLogEvents:v15 sinceDate:v13 withHandler:v22];
  if (v19)
  {
    uint64_t v20 = 0;
    if (a7) {
      *a7 = v19;
    }
  }
  else
  {
    uint64_t v20 = [(_DASLogExtractor *)self getSummaryFromLogs:v24[5] forActivity:v12 detail:v8];
  }
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)copyApplicationSummary:(id)a3 startDate:(id)a4 endDate:(id)a5 detail:(BOOL)a6 error:(int *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13)
  {
    id v13 = [MEMORY[0x263EFF910] distantPast];
  }
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  uint64_t v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"eventMessage contains %@", v12];
  [v15 addObject:v16];

  if (v14)
  {
    uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"date <= %@", v14];
    [v15 addObject:v17];
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  unint64_t v26 = __Block_byref_object_dispose_;
  id v27 = [MEMORY[0x263EFF980] array];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74___DASLogExtractor_copyApplicationSummary_startDate_endDate_detail_error___block_invoke;
  v21[3] = &unk_26486D5D8;
  v21[4] = &v22;
  int v18 = [(_DASLogExtractor *)self handleLogEventsLogEvents:v15 sinceDate:v13 withHandler:v21];
  if (v18)
  {
    int v19 = 0;
    if (a7) {
      *a7 = v18;
    }
  }
  else
  {
    int v19 = [(_DASLogExtractor *)self getBARSummaryFromLogs:v23[5] forApplication:v12 detail:v8];
  }
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)objectForTrigger:(id)a3 fromCondition:(id)a4 compactRepresentation:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEqualToString:@"/device/system/thermalpressure"])
  {
    if ([v8 isEqualToString:@"0"])
    {
LABEL_3:
      id v9 = @"Nominal";
LABEL_15:
      id v13 = +[_DASLogCondition withCondition:v9];
      id v14 = v13;
LABEL_16:
      [v13 setIsIdeal:1];
      goto LABEL_59;
    }
    if (v5)
    {
      int v11 = +[_DASLogCondition withCondition:@"Under Thermal Pressure"];
    }
    else
    {
      int v11 = 0;
    }
    if ([v8 isEqualToString:@"10"])
    {
      uint64_t v15 = @"Light";
LABEL_28:
      id v14 = +[_DASLogCondition withCondition:v15];

      goto LABEL_59;
    }
    if (([v8 isEqualToString:@"1"] & 1) != 0
      || [v8 isEqualToString:@"20"])
    {
      uint64_t v15 = @"Moderate";
      goto LABEL_28;
    }
    if (([v8 isEqualToString:@"2"] & 1) != 0
      || [v8 isEqualToString:@"30"])
    {
      uint64_t v15 = @"Heavy";
      goto LABEL_28;
    }
    if (([v8 isEqualToString:@"3"] & 1) != 0
      || [v8 isEqualToString:@"40"]
      || ([v8 isEqualToString:@"4"] & 1) != 0
      || [v8 isEqualToString:@"50"])
    {
      uint64_t v15 = @"Trapping";
      goto LABEL_28;
    }
    goto LABEL_63;
  }
  if ([v7 isEqualToString:@"/device/system/isPluggedIn"])
  {
    if (![v8 isEqualToString:@"0"])
    {
      id v9 = @"Plugged In";
      goto LABEL_15;
    }
    int v10 = @"Unplugged";
    goto LABEL_58;
  }
  if ([v7 isEqualToString:@"/device/system/cpuusage"])
  {
    if ([v8 isEqualToString:@"0"]) {
      goto LABEL_3;
    }
    int v12 = [v8 isEqualToString:@"50"];
    if (v5)
    {
      if (v12) {
        goto LABEL_3;
      }
      int v10 = @"Under CPU Load";
      goto LABEL_58;
    }
    if (v12)
    {
      id v9 = @"Light";
      goto LABEL_15;
    }
    if ([v8 isEqualToString:@"75"])
    {
      int v10 = @"Moderate";
      goto LABEL_58;
    }
    if ([v8 isEqualToString:@"90"])
    {
      int v10 = @"Somewhat Heavy";
      goto LABEL_58;
    }
    if ([v8 isEqualToString:@"95"])
    {
      int v10 = @"Really Heavy";
      goto LABEL_58;
    }
    goto LABEL_62;
  }
  if (([v7 isEqualToString:@"/device/system/wifi/status"] & 1) != 0
    || ([v7 isEqualToString:@"/device/system/cell/status"] & 1) != 0
    || [v7 isEqualToString:@"/device/system/wired/status"])
  {
    if ([v8 isEqualToString:@"0"])
    {
      int v10 = @"None";
LABEL_58:
      id v14 = +[_DASLogCondition withCondition:v10];
      goto LABEL_59;
    }
    if ([v8 isEqualToString:@"20"])
    {
      int v10 = @"Minimally Viable";
      goto LABEL_58;
    }
    if ([v8 isEqualToString:@"50"])
    {
      int v10 = @"Fair";
      goto LABEL_58;
    }
    if (![v8 isEqualToString:@"100"])
    {
LABEL_62:
      int v11 = 0;
LABEL_63:
      id v14 = +[_DASLogCondition withCondition:v8];

      goto LABEL_64;
    }
    id v14 = +[_DASLogCondition withCondition:@"Best"];
    if (([v7 containsString:@"cell"] & 1) == 0) {
      goto LABEL_64;
    }
  }
  else
  {
    int v11 = 0;
    if (![v7 isEqualToString:@"/device/system/batteryPercentage"] || !v5) {
      goto LABEL_63;
    }
    uint64_t v16 = [v8 intValue];
    if ((int)v16 <= 10)
    {
      int v11 = [NSNumber numberWithInt:v16];
      uint64_t v15 = v11;
      goto LABEL_28;
    }
    uint64_t v17 = [NSNumber numberWithInt:10 * (v16 / 0xA)];
    id v14 = +[_DASLogCondition withCondition:v17];

    if (v16 >= 0x15)
    {
LABEL_64:
      id v13 = v14;
      goto LABEL_16;
    }
  }
LABEL_59:
  id v18 = v14;

  return v18;
}

- (void)addConditionToHistory:(id)a3 fromMessage:(id)a4 atTimestamp:(id)a5 compactRepresentation:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 containsString:@"\n"])
  {
    id v13 = getSubstring(v11, @"[", @"]", 1);
    if ([v13 containsString:@"quality"])
    {
      [v13 componentsSeparatedByString:@"\n"];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        long long v32 = self;
        unsigned int v33 = v6;
        uint64_t v17 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v14);
            }
            int v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v19, "containsString:", @"quality", v32))
            {
              uint64_t v21 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" ;"];
              uint64_t v22 = [v19 componentsSeparatedByCharactersInSet:v21];
              uint64_t v23 = (void *)[v22 mutableCopy];

              uint64_t v24 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_656];
              [v23 filterUsingPredicate:v24];

              uint64_t v20 = [v23 lastObject];

              goto LABEL_15;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        uint64_t v20 = 0;
LABEL_15:
        uint64_t v6 = v33;
        self = v32;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v25 = [v11 componentsSeparatedByString:@" "];
  unint64_t v26 = [v25 objectAtIndexedSubscript:1];
  if (!v20)
  {
    id v27 = [v25 lastObject];
    id v28 = [v25 lastObject];
    uint64_t v20 = objc_msgSend(v27, "substringWithRange:", 1, objc_msgSend(v28, "length") - 2);
  }
  id v29 = [(_DASLogExtractor *)self objectForTrigger:v26 fromCondition:v20 compactRepresentation:v6];
  uint64_t v30 = [v10 objectForKeyedSubscript:v26];
  if (v30)
  {
    long long v31 = v30;
    [v30 addCondition:v29 atDate:v12];
  }
  else
  {
    long long v31 = +[_DASLogConditionHistory condition:v29 fromDate:v12];
  }
  [v10 setObject:v31 forKeyedSubscript:v26];
}

- (int)sysConditionsLog:(BOOL)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  id v11 = [MEMORY[0x263EFF980] array];
  id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"subsystem = %@", self->_subsystem];
  [v11 addObject:v12];

  id v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"eventMessage contains \"Trigger:\""];
  [v11 addObject:v13];

  if (v9)
  {
    id v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"date <= %@", v9];
    [v11 addObject:v14];
  }
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke;
  v78[3] = &unk_26486D620;
  v78[4] = self;
  id v15 = v10;
  id v79 = v15;
  BOOL v80 = a3;
  int v16 = [(_DASLogExtractor *)self handleLogEventsLogEvents:v11 sinceDate:v8 withHandler:v78];
  if (!v16)
  {
    id v62 = v8;
    uint64_t v17 = [MEMORY[0x263EFF980] array];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke_2;
    v76[3] = &unk_26486D648;
    id v18 = v17;
    id v77 = v18;
    [v15 enumerateKeysAndObjectsUsingBlock:v76];
    v65 = v11;
    id v66 = v9;
    id v63 = v18;
    id v64 = v15;
    if ((unint64_t)[v18 count] >= 2)
    {
      do
      {
        int v19 = [v18 objectAtIndexedSubscript:0];
        uint64_t v20 = [v18 objectAtIndexedSubscript:1];
        id v21 = v19;
        id v22 = v20;
        if ([v21 count] && objc_msgSend(v22, "count"))
        {
          int v70 = [MEMORY[0x263EFF980] array];
          if ([v21 count])
          {
            unint64_t v23 = 0;
            unsigned int v24 = 0;
            unsigned int v25 = 0;
            do
            {
              if ([v22 count] <= (unint64_t)v24) {
                break;
              }
              unsigned int v26 = v24;
              id v27 = [v21 objectAtIndexedSubscript:v23];
              id v28 = [v22 objectAtIndexedSubscript:v24];
              id v29 = [v27 intersectionWithDateInterval:v28];

              if (v29) {
                [v70 addObject:v29];
              }
              uint64_t v30 = [v21 objectAtIndexedSubscript:v23];
              long long v31 = [v30 endDate];
              long long v32 = [v22 objectAtIndexedSubscript:v24];
              unsigned int v33 = [v32 endDate];
              uint64_t v34 = [v31 compare:v33];

              unint64_t v23 = v34 == 1 ? v25 : v25 + 1;
              unsigned int v24 = v34 == 1 ? v26 + 1 : v26;

              unsigned int v25 = v23;
            }
            while ([v21 count] > v23);
          }
          long long v35 = (void *)[v70 copy];

          id v11 = v65;
          id v9 = v66;
          id v18 = v63;
          id v15 = v64;
        }
        else
        {
          long long v35 = (void *)MEMORY[0x263EFFA68];
        }

        [v18 addObject:v35];
        [v18 removeObjectAtIndex:0];
        [v18 removeObjectAtIndex:0];
      }
      while ((unint64_t)[v18 count] > 1);
    }
    fwrite("Ideal Conditions:-----------\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x263EF8358]);
    long long v36 = defaultFormatter();
    if (timeOnlyFormatter_onceToken != -1) {
      dispatch_once(&timeOnlyFormatter_onceToken, &__block_literal_global_751);
    }
    id v69 = (id)timeOnlyFormatter_timeOnlyFormatter;
    long long v37 = [MEMORY[0x263EFF8F0] currentCalendar];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    int v38 = [v18 firstObject];
    uint64_t v71 = [v38 countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v71)
    {
      id obj = v38;
      uint64_t v68 = *(void *)v73;
      double v39 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v71; ++i)
        {
          if (*(void *)v73 != v68) {
            objc_enumerationMutation(obj);
          }
          long long v41 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          long long v42 = [v41 startDate];
          id v43 = [v37 components:24 fromDate:v42];
          long long v44 = [v41 endDate];
          long long v45 = [v37 components:24 fromDate:v44];
          int v46 = [v43 isEqual:v45];

          long long v47 = (FILE *)*MEMORY[0x263EF8358];
          long long v48 = [v41 startDate];
          id v49 = [v36 stringFromDate:v48];
          long long v50 = (const char *)[v49 UTF8String];
          long long v51 = [v41 endDate];
          if (v46) {
            unsigned int v52 = v69;
          }
          else {
            unsigned int v52 = v36;
          }
          id v53 = [v52 stringFromDate:v51];
          fprintf(v47, "  %s - %s\n", v50, (const char *)[v53 UTF8String]);

          uint64_t v54 = [v41 endDate];
          long long v55 = [MEMORY[0x263EFF910] distantFuture];
          char v56 = [v54 isEqual:v55];

          if ((v56 & 1) == 0)
          {
            [v41 duration];
            double v39 = v39 + v57;
          }
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v71);

      uint64_t v58 = (FILE *)*MEMORY[0x263EF8358];
      if (v39 >= 3600.0)
      {
        uint64_t v59 = "hours";
        double v60 = v39 / 3600.0;
        id v11 = v65;
        id v9 = v66;
        id v18 = v63;
        id v15 = v64;
        goto LABEL_41;
      }
      id v11 = v65;
      id v9 = v66;
      id v18 = v63;
      id v15 = v64;
    }
    else
    {

      uint64_t v58 = (FILE *)*MEMORY[0x263EF8358];
      double v39 = 0.0;
    }
    uint64_t v59 = "minutes";
    double v60 = v39 / 60.0;
LABEL_41:
    fprintf(v58, "Over the course of the log, there was %5.2f %s of \"ideal\" conditions.\n", v60, v59);

    int v16 = 0;
    id v8 = v62;
  }

  return v16;
}

- (OSLogEventStore)logStore
{
  return self->_logStore;
}

- (void)setLogStore:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (OSLogEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logStore, 0);
}

@end