@interface ARPHomeControlSuggester
+ (id)defaultCorrelationsSessionFile;
+ (id)suggester;
- (ARPHomeControlSuggester)initWithScoreThresholdForMicrolocationSuggestionsConsidered:(double)a3 highScoreThresholdForMicroLocationSuggestionMerge:(double)a4 lowScoreThresholdForMicroLocationSuggestionMerge:(double)a5 highScoreThresholdForTimeBasedSuggestionMerge:(double)a6 lowScoreThresholdForTimeBasedSuggestionMerge:(double)a7;
- (NSArray)homeKitEventsSortedByStartDate;
- (NSString)correlationsSessionFile;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)highScoreThresholdForMicroLocationSuggestionMerge;
- (double)highScoreThresholdForTimeBasedSuggestionMerge;
- (double)lowScoreThresholdForMicroLocationSuggestionMerge;
- (double)lowScoreThresholdForTimeBasedSuggestionMerge;
- (double)scoreSceneBoost;
- (double)scoreThresholdForMicrolocationSuggestionsConsidered;
- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3;
- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3 events:(id)a4;
- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3 events:(id)a4 useScenes:(BOOL)a5;
- (id)homeKitEventsWithLookbackDays:(int64_t)a3;
- (id)microlocationBasedsuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5;
- (id)mostRecentHomeKitEvent;
- (id)nextActionBasedsuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5;
- (id)suggestionsWithMaxSuggestions:(unint64_t)a3;
- (id)suggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5;
- (id)timeBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4;
- (id)timeBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 fallBackToFrequency:(BOOL)a5;
- (id)timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 events:(id)a4 referenceDate:(id)a5;
- (void)setCorrelationsSessionFile:(id)a3;
- (void)setHighScoreThresholdForMicroLocationSuggestionMerge:(double)a3;
- (void)setHighScoreThresholdForTimeBasedSuggestionMerge:(double)a3;
- (void)setHomeKitEventsSortedByStartDate:(id)a3;
- (void)setLowScoreThresholdForMicroLocationSuggestionMerge:(double)a3;
- (void)setLowScoreThresholdForTimeBasedSuggestionMerge:(double)a3;
- (void)setScoreSceneBoost:(double)a3;
- (void)setScoreThresholdForMicrolocationSuggestionsConsidered:(double)a3;
@end

@implementation ARPHomeControlSuggester

- (id)suggestionsWithMaxSuggestions:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [(id)objc_opt_class() defaultCorrelationsSessionFile];
  v7 = [(ARPHomeControlSuggester *)self suggestionsWithMaxSuggestions:a3 referenceDate:v5 correlationsFile:v6];

  return v7;
}

+ (id)defaultCorrelationsSessionFile
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = sysconf(71);
  if (v2 == -1) {
    size_t v3 = 4096;
  }
  else {
    size_t v3 = v2;
  }
  v15 = 0;
  uid_t v4 = geteuid();
  if (!v4) {
    uid_t v4 = getuid();
  }
  memset(&v14, 0, sizeof(v14));
  if (getpwuid_r(v4, &v14, (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3, &v15)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v15 == 0;
  }
  if (v5)
  {
    v6 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v9 = [v6 firstObject];

    v10 = [v9 stringByAppendingPathComponent:@"AirPlayRoutePrediction/HomeControlSuggestions/correlations.archive"];
    v11 = ARPHomeControlLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    v7 = "ARPHomeControlSuggester defaultCorrelationsSessionFile returning fallback path: %@";
    goto LABEL_15;
  }
  v8 = [MEMORY[0x263F08850] defaultManager];
  v9 = [v8 stringWithFileSystemRepresentation:v15->pw_dir length:strlen(v15->pw_dir)];

  v10 = [v9 stringByAppendingPathComponent:@"/Library/AirPlayRoutePrediction/HomeControlSuggestions/correlations.archive"];
  v11 = ARPHomeControlLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    v7 = "ARPHomeControlSuggester defaultCorrelationsSessionFile returning getpwuid_r path: %@";
LABEL_15:
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
  }
LABEL_16:

  return v10;
}

- (id)suggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = [(ARPHomeControlSuggester *)self timeBasedSuggestionsWithMaxSuggestions:a3 referenceDate:v8 fallBackToFrequency:0];
  v11 = ARPHomeControlLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)buf = 138412290;
    v129 = v12;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "Total suggestions from time-bucketing = %@", buf, 0xCu);
  }
  v13 = [(ARPHomeControlSuggester *)self microlocationBasedsuggestionsWithMaxSuggestions:a3 referenceDate:v8 correlationsFile:v9];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    passwd v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    *(_DWORD *)buf = 138412290;
    v129 = v14;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "Total suggestions from micro-locations = %@", buf, 0xCu);
  }
  v104 = v13;

  v15 = [(ARPHomeControlSuggester *)self homeKitEventsSortedByStartDate];
  v16 = [(ARPHomeControlSuggester *)self frequencybasedSuggestionsWitMaxSuggestions:a3 events:v15 useScenes:0];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    *(_DWORD *)buf = 138412290;
    v129 = v17;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "Total suggestions from frequency MRU = %@", buf, 0xCu);
  }
  v99 = v16;

  v98 = self;
  unint64_t v106 = a3;
  v102 = v9;
  v103 = v8;
  uint64_t v18 = [(ARPHomeControlSuggester *)self nextActionBasedsuggestionsWithMaxSuggestions:a3 referenceDate:v8 correlationsFile:v9];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
    *(_DWORD *)buf = 138412290;
    v129 = v19;
    _os_log_impl(&dword_20BE41000, v11, OS_LOG_TYPE_INFO, "Total suggestions from next-actiouint64_t n = %@", buf, 0xCu);
  }
  v100 = v18;

  v20 = [MEMORY[0x263EFF9A0] dictionary];
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  obuint64_t j = v10;
  uint64_t v21 = [obj countByEnumeratingWithState:&v124 objects:v136 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v125 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v124 + 1) + 8 * i);
        [v25 setSuggestionReason:@"Time-bucket"];
        v26 = NSNumber;
        v27 = [v20 objectForKeyedSubscript:v25];
        [v27 doubleValue];
        double v29 = v28;
        [v25 score];
        v31 = [v26 numberWithDouble:v29 + v30 * 2.0];
        [v20 setObject:v31 forKeyedSubscript:v25];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v124 objects:v136 count:16];
    }
    while (v22);
  }
  oslog = v11;

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v32 = v104;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v121;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v121 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v120 + 1) + 8 * j);
        [v37 setSuggestionReason:@"Microlocation"];
        v38 = NSNumber;
        v39 = [v20 objectForKeyedSubscript:v37];
        [v39 doubleValue];
        double v41 = v40;
        [v37 score];
        v43 = [v38 numberWithDouble:v41 + v42];
        [v20 setObject:v43 forKeyedSubscript:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v120 objects:v135 count:16];
    }
    while (v34);
  }
  id v105 = v32;

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v44 = v100;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v116 objects:v134 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v117;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v117 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v116 + 1) + 8 * k);
        [v49 setSuggestionReason:@"Next Action"];
        v50 = NSNumber;
        v51 = [v20 objectForKeyedSubscript:v49];
        [v51 doubleValue];
        double v53 = v52;
        [v49 score];
        v55 = [v50 numberWithDouble:v53 + v54];
        [v20 setObject:v55 forKeyedSubscript:v49];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v116 objects:v134 count:16];
    }
    while (v46);
  }
  v101 = v44;

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v56 = v99;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v112 objects:v133 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v113;
    do
    {
      for (uint64_t m = 0; m != v58; ++m)
      {
        if (*(void *)v113 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v112 + 1) + 8 * m);
        [v61 setSuggestionReason:@"Frequency-MRU"];
        v62 = NSNumber;
        v63 = [v20 objectForKeyedSubscript:v61];
        [v63 doubleValue];
        double v65 = v64;
        [v61 score];
        v67 = [v62 numberWithDouble:v65 + v66];
        [v20 setObject:v67 forKeyedSubscript:v61];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v112 objects:v133 count:16];
    }
    while (v58);
  }

  v68 = [v20 keysSortedByValueUsingComparator:&__block_literal_global_2];
  v69 = [v68 firstObject];
  [v69 score];
  double v71 = v70;
  v72 = [v68 lastObject];
  [v72 score];
  double v74 = v71 - v73;

  if (v74 <= 0.00001)
  {
    v76 = [(ARPHomeControlSuggester *)v98 homeKitEventsSortedByStartDate];
    unint64_t v75 = v106;
    uint64_t v77 = [(ARPHomeControlSuggester *)v98 frequencybasedSuggestionsWitMaxSuggestions:v106 events:v76 useScenes:1];

    v68 = (void *)v77;
  }
  else
  {
    unint64_t v75 = v106;
  }
  unint64_t v78 = [v68 count];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v79 = v68;
  uint64_t v80 = [v79 countByEnumeratingWithState:&v108 objects:v132 count:16];
  v81 = v105;
  if (v80)
  {
    uint64_t v82 = v80;
    double v83 = (double)v78 + 1.0;
    uint64_t v84 = *(void *)v109;
    do
    {
      for (uint64_t n = 0; n != v82; ++n)
      {
        if (*(void *)v109 != v84) {
          objc_enumerationMutation(v79);
        }
        [*(id *)(*((void *)&v108 + 1) + 8 * n) setScore:v83];
        double v83 = v83 + -1.0;
      }
      uint64_t v82 = [v79 countByEnumeratingWithState:&v108 objects:v132 count:16];
    }
    while (v82);
  }

  if (v75)
  {
    unint64_t v86 = [v79 count];
    if (v86 >= v75) {
      unint64_t v87 = v75;
    }
    else {
      unint64_t v87 = v86;
    }
    objc_msgSend(v79, "subarrayWithRange:", 0, v87);
    id v88 = (id)objc_claimAutoreleasedReturnValue();
    if ([v88 count])
    {
      v89 = ARPLog();
      unint64_t v90 = 0;
      do
      {
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v91 = v90 + 1;
          [NSNumber numberWithInt:v90 + 1];
          v93 = v92 = v88;
          v94 = [v92 objectAtIndexedSubscript:v90];
          *(_DWORD *)buf = 138412546;
          v129 = v93;
          __int16 v130 = 2112;
          v131 = v94;
          _os_log_impl(&dword_20BE41000, v89, OS_LOG_TYPE_DEFAULT, "Home Control Suggestion %@: %@", buf, 0x16u);

          id v88 = v92;
          unint64_t v90 = v91;
        }
        else
        {
          ++v90;
        }
      }
      while ([v88 count] > v90);
      v81 = v105;
    }
  }
  else
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v95 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v79, "count"));
      *(_DWORD *)buf = 138412290;
      v129 = v95;
      _os_log_impl(&dword_20BE41000, oslog, OS_LOG_TYPE_DEFAULT, "Total Home Control suggestions returned = %@", buf, 0xCu);
    }
    id v88 = v79;
  }

  return v88;
}

- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3 events:(id)a4 useScenes:(BOOL)a5
{
  BOOL v132 = a5;
  unint64_t v129 = a3;
  v170[5] = *MEMORY[0x263EF8340];
  id v148 = a4;
  v147 = [MEMORY[0x263EFF9A0] dictionary];
  v131 = [MEMORY[0x263EFF9A0] dictionary];
  v150 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F35188];
  v170[0] = *MEMORY[0x263F35168];
  v170[1] = v6;
  uint64_t v7 = *MEMORY[0x263F35180];
  v170[2] = *MEMORY[0x263F35178];
  v170[3] = v7;
  v170[4] = *MEMORY[0x263F35170];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v170 count:5];
  id v9 = [v5 setWithArray:v8];

  uint64_t v137 = (void *)MEMORY[0x263EFFA08];
  v10 = getHMServiceTypeSpeaker();
  v169[0] = v10;
  v145 = getHMServiceTypeDoorbell();
  v169[1] = v145;
  v143 = getHMServiceTypeMicrophone();
  v169[2] = v143;
  v141 = getHMServiceTypeTemperatureSensor();
  v169[3] = v141;
  v139 = getHMServiceTypeAirQualitySensor();
  v169[4] = v139;
  v135 = getHMServiceTypeHumiditySensor();
  v169[5] = v135;
  v133 = getHMServiceTypeCarbonMonoxideSensor();
  v169[6] = v133;
  v11 = getHMServiceTypeContactSensor();
  v169[7] = v11;
  v12 = getHMServiceTypeLeakSensor();
  v169[8] = v12;
  v13 = getHMServiceTypeLightSensor();
  v169[9] = v13;
  passwd v14 = getHMServiceTypeMotionSensor();
  v169[10] = v14;
  v15 = getHMServiceTypeOccupancySensor();
  v169[11] = v15;
  v16 = getHMServiceTypeSmokeSensor();
  v169[12] = v16;
  v17 = getHMServiceTypeCarbonDioxideSensor();
  v169[13] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v169 count:14];
  v138 = [v137 setWithArray:v18];

  v19 = [v148 lastObject];
  v20 = [v19 eventBody];
  uint64_t v21 = [v20 valueForKey:@"base"];
  uint64_t v22 = [v21 dateInterval];
  v146 = [v22 startDate];

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v23 = v148;
  v134 = v9;
  v136 = v23;
  uint64_t v149 = [v23 countByEnumeratingWithState:&v161 objects:v168 count:16];
  if (!v149)
  {
    id v140 = 0;
    v24 = 0;
    v26 = v147;
    goto LABEL_38;
  }
  id v140 = 0;
  v24 = 0;
  uint64_t v25 = *(void *)v162;
  v26 = v147;
  uint64_t v144 = *(void *)v162;
  do
  {
    uint64_t v27 = 0;
    do
    {
      if (*(void *)v162 != v25) {
        objc_enumerationMutation(v23);
      }
      double v28 = *(void **)(*((void *)&v161 + 1) + 8 * v27);
      double v29 = objc_msgSend(v28, "eventBody", v129);
      double v30 = [v29 valueForKey:@"base"];

      if (!v30)
      {
        double v41 = ARPLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[ARPHomeControlSuggester frequencybasedSuggestionsWitMaxSuggestions:events:useScenes:](&v159, v160, v41);
        }
        goto LABEL_31;
      }
      v31 = [v30 source];
      char v32 = [v9 containsObject:v31];

      if (v32) {
        goto LABEL_32;
      }
      uint64_t v33 = [v30 dateInterval];
      uint64_t v34 = [v33 startDate];
      [v146 timeIntervalSinceDate:v34];
      int v36 = (int)(v35 / 86400.0);

      double v37 = exp((double)v36 * -0.5);
      v38 = [v28 eventBody];
      getBMHomeKitClientAccessoryControlEventClass();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      double v40 = [v28 eventBody];
      double v41 = v40;
      if (isKindOfClass)
      {
        double v42 = [v40 serviceType];
        char v43 = [v138 containsObject:v42];

        if (v43)
        {
          v26 = v147;
          goto LABEL_17;
        }
        double v53 = objc_alloc_init(ARPHomeControlSuggestion);
        [(ARPHomeControlSuggestion *)v53 setType:0];
        double v54 = [v41 accessoryUniqueIdentifier];
        [(ARPHomeControlSuggestion *)v53 setTargetUUID:v54];

        v55 = [v30 homeUniqueIdentifier];
        [(ARPHomeControlSuggestion *)v53 setHomeUUID:v55];

        id v56 = [v41 serviceUniqueIdentifier];
        [(ARPHomeControlSuggestion *)v53 setAccessoryServiceUUID:v56];

        uint64_t v57 = [v24 dateInterval];
        uint64_t v58 = [v57 startDate];
        v142 = v24;
        if (v58)
        {
          uint64_t v59 = (void *)v58;
          v60 = v24;
          v61 = [v30 dateInterval];
          v62 = [v61 startDate];
          v63 = [v60 dateInterval];
          double v64 = [v63 startDate];
          [v62 timeIntervalSinceDate:v64];
          double v66 = v65;

          goto LABEL_23;
        }
LABEL_25:

        goto LABEL_26;
      }
      getBMHomeKitClientActionSetEventClass();
      objc_opt_class();
      char v44 = objc_opt_isKindOfClass();

      double v41 = [v28 eventBody];
      if (v44)
      {
        uint64_t v45 = objc_alloc_init(ARPHomeControlSuggestion);
        [(ARPHomeControlSuggestion *)v45 setType:1];
        uint64_t v46 = [v41 actionSetUniqueIdentifier];
        [(ARPHomeControlSuggestion *)v45 setTargetUUID:v46];

        uint64_t v47 = [v30 homeUniqueIdentifier];
        [(ARPHomeControlSuggestion *)v45 setHomeUUID:v47];

        v26 = v147;
        if (v132)
        {
          v48 = NSNumber;
          v49 = [v150 objectForKeyedSubscript:v45];
          [v49 floatValue];
          v51 = [v48 numberWithDouble:v37 + v50];
          [v150 setObject:v51 forKeyedSubscript:v45];

          id v23 = v136;
        }
        id v52 = v30;

        v24 = v52;
LABEL_17:
        uint64_t v25 = v144;
LABEL_31:

        goto LABEL_32;
      }
      getBMHomeKitClientMediaAccessoryControlEventClass();
      objc_opt_class();
      char v67 = objc_opt_isKindOfClass();

      if (v67)
      {
        double v41 = [v28 eventBody];
        double v53 = objc_alloc_init(ARPHomeControlSuggestion);
        [(ARPHomeControlSuggestion *)v53 setType:0];
        v68 = [v41 accessoryUniqueIdentifier];
        [(ARPHomeControlSuggestion *)v53 setTargetUUID:v68];

        v69 = [v30 homeUniqueIdentifier];
        [(ARPHomeControlSuggestion *)v53 setHomeUUID:v69];

        uint64_t v57 = [v24 dateInterval];
        uint64_t v70 = [v57 startDate];
        v142 = v24;
        if (!v70) {
          goto LABEL_25;
        }
        uint64_t v59 = (void *)v70;
        double v71 = [v30 dateInterval];
        v72 = [v71 startDate];
        double v73 = [v24 dateInterval];
        double v74 = [v73 startDate];
        [v72 timeIntervalSinceDate:v74];
        double v66 = v75;

LABEL_23:
        if (v66 <= 1.0)
        {
          v76 = NSNumber;
          uint64_t v77 = [v131 objectForKeyedSubscript:v53];
          [v77 doubleValue];
          id v79 = [v76 numberWithDouble:v37 + v78];
          [v131 setObject:v79 forKeyedSubscript:v53];

          v26 = v147;
          goto LABEL_29;
        }
LABEL_26:
        uint64_t v80 = [v140 dateInterval];
        v81 = [v80 startDate];
        uint64_t v82 = [v30 dateInterval];
        double v83 = [v82 startDate];
        char v84 = [v81 isEqualToDate:v83];

        v26 = v147;
        if (v84)
        {
          id v9 = v134;
          id v23 = v136;
          v24 = v142;
        }
        else
        {
          v85 = NSNumber;
          unint64_t v86 = [v147 objectForKeyedSubscript:v53];
          [v86 doubleValue];
          id v88 = [v85 numberWithDouble:v37 + v87];
          [v147 setObject:v88 forKeyedSubscript:v53];

          uint64_t v77 = v140;
          id v140 = v30;
LABEL_29:
          id v9 = v134;
          v24 = v142;

          id v23 = v136;
        }
        uint64_t v25 = v144;

        goto LABEL_31;
      }
      v26 = v147;
      uint64_t v25 = v144;
LABEL_32:

      ++v27;
    }
    while (v149 != v27);
    uint64_t v89 = [v23 countByEnumeratingWithState:&v161 objects:v168 count:16];
    uint64_t v149 = v89;
  }
  while (v89);
LABEL_38:
  unint64_t v90 = v24;

  unint64_t v91 = [v26 allValues];
  v92 = [v91 valueForKeyPath:@"@sum.self"];
  [v92 doubleValue];
  double v94 = v93;

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  v95 = [v26 allKeys];
  uint64_t v96 = [v95 countByEnumeratingWithState:&v155 objects:v167 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v156;
    do
    {
      for (uint64_t i = 0; i != v97; ++i)
      {
        if (*(void *)v156 != v98) {
          objc_enumerationMutation(v95);
        }
        v100 = *(void **)(*((void *)&v155 + 1) + 8 * i);
        v101 = objc_msgSend(v26, "objectForKeyedSubscript:", v100, v129);
        [v101 doubleValue];
        [v100 setScore:v102 / v94];
      }
      uint64_t v97 = [v95 countByEnumeratingWithState:&v155 objects:v167 count:16];
    }
    while (v97);
  }

  v103 = [v150 allValues];
  v104 = [v103 valueForKeyPath:@"@sum.self"];
  [v104 doubleValue];
  double v106 = v105;

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  v107 = [v150 allKeys];
  uint64_t v108 = [v107 countByEnumeratingWithState:&v151 objects:v166 count:16];
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = *(void *)v152;
    do
    {
      for (uint64_t j = 0; j != v109; ++j)
      {
        if (*(void *)v152 != v110) {
          objc_enumerationMutation(v107);
        }
        long long v112 = *(void **)(*((void *)&v151 + 1) + 8 * j);
        long long v113 = objc_msgSend(v150, "objectForKeyedSubscript:", v112, v129);
        [v113 doubleValue];
        [v112 setScore:v114 / v106];
      }
      uint64_t v109 = [v107 countByEnumeratingWithState:&v151 objects:v166 count:16];
    }
    while (v109);
  }

  long long v115 = (void *)MEMORY[0x263EFF980];
  long long v116 = [v26 allKeys];
  long long v117 = [v115 arrayWithArray:v116];

  if (![v117 count])
  {
    long long v118 = (void *)MEMORY[0x263EFF980];
    long long v119 = [v131 allKeys];
    uint64_t v120 = [v118 arrayWithArray:v119];

    long long v117 = (void *)v120;
  }
  long long v121 = objc_msgSend(v150, "allKeys", v129);
  [v117 addObjectsFromArray:v121];

  long long v122 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"score" ascending:0];
  v165 = v122;
  long long v123 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v165 count:1];
  [v117 sortUsingDescriptors:v123];

  if (v130)
  {
    unint64_t v124 = [v117 count];
    if (v124 >= v130) {
      unint64_t v125 = v130;
    }
    else {
      unint64_t v125 = v124;
    }
    objc_msgSend(v117, "subarrayWithRange:", 0, v125);
    id v126 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v126 = v117;
  }
  long long v127 = v126;

  return v127;
}

- (NSArray)homeKitEventsSortedByStartDate
{
  return self->_homeKitEventsSortedByStartDate;
}

- (id)timeBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 fallBackToFrequency:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [(ARPHomeControlSuggester *)self homeKitEventsWithLookbackDays:30];
  [(ARPHomeControlSuggester *)self setHomeKitEventsSortedByStartDate:v9];
  v10 = ARPHomeControlLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl(&dword_20BE41000, v10, OS_LOG_TYPE_INFO, "Total HomeKit events = %@", buf, 0xCu);
  }
  v12 = [MEMORY[0x263EFF9B0] orderedSet];
  char v32 = v8;
  v13 = [(ARPHomeControlSuggester *)self timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:a3 events:v9 referenceDate:v8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        [v12 addObject:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v15);
  }
  if (v5)
  {
    if (a3)
    {
      if ([v12 count] >= a3) {
        goto LABEL_32;
      }
      [(ARPHomeControlSuggester *)self frequencybasedSuggestionsWitMaxSuggestions:a3 events:v9 useScenes:0];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v38;
LABEL_15:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * v22);
          if ([v12 count] >= a3) {
            break;
          }
          [v12 addObject:v23];
          if (v20 == ++v22)
          {
            uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v20) {
              goto LABEL_15;
            }
            break;
          }
        }
      }
    }
    else
    {
      v24 = [(ARPHomeControlSuggester *)self frequencybasedSuggestionsWitMaxSuggestions:0 events:v9 useScenes:0];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
        *(_DWORD *)buf = 138412290;
        v49 = v25;
        _os_log_impl(&dword_20BE41000, v10, OS_LOG_TYPE_INFO, "Total suggestions from frequency-based MRU = %@", buf, 0xCu);
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v18 = v24;
      uint64_t v26 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v34 != v28) {
              objc_enumerationMutation(v18);
            }
            [v12 addObject:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          }
          uint64_t v27 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
        }
        while (v27);
      }
    }
  }
LABEL_32:
  double v30 = [v12 array];

  return v30;
}

- (id)timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 events:(id)a4 referenceDate:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  uint64_t v28 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v25 = v7;
  id v8 = [v28 components:32 fromDate:v7];
  uint64_t v9 = [v8 hour];
  uint64_t v26 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = [v14 eventBody];
        uint64_t v16 = [v15 valueForKey:@"base"];
        v17 = [v16 dateInterval];
        id v18 = [v17 startDate];

        if (v18)
        {
          uint64_t v19 = [v28 components:32 fromDate:v18];

          if (([v19 hour] ^ (unint64_t)v9) <= 3) {
            [v26 addObject:v14];
          }
          id v8 = v19;
        }
        else
        {
          uint64_t v20 = ARPLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[ARPHomeControlSuggester timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:events:referenceDate:](&v29, v30, v20);
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  uint64_t v21 = [(ARPHomeControlSuggester *)self frequencybasedSuggestionsWitMaxSuggestions:a3 events:v26];

  return v21;
}

- (void)setHomeKitEventsSortedByStartDate:(id)a3
{
}

- (id)nextActionBasedsuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5
{
  v92[14] = *MEMORY[0x263EF8340];
  id v7 = a5;
  if (!v7)
  {
    id v18 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_44;
  }
  id v90 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v7 options:1 error:&v90];
  id v9 = v90;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = ARPLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ARPHomeControlSuggester nextActionBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
    id v18 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_43;
  }
  unint64_t v71 = a3;
  id v75 = v7;
  id v89 = 0;
  double v74 = v8;
  uint64_t v19 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v89];
  id v73 = v89;
  uint64_t v11 = [v19 nextActionCorrelationsDictionary];
  v72 = [v19 archiveDate];

  uint64_t v20 = [(ARPHomeControlSuggester *)self mostRecentHomeKitEvent];
  uint64_t v82 = (void *)MEMORY[0x263EFFA08];
  char v84 = (void *)v20;
  v81 = getHMServiceTypeSpeaker();
  v92[0] = v81;
  uint64_t v80 = getHMServiceTypeDoorbell();
  v92[1] = v80;
  id v79 = getHMServiceTypeMicrophone();
  v92[2] = v79;
  double v78 = getHMServiceTypeTemperatureSensor();
  v92[3] = v78;
  uint64_t v77 = getHMServiceTypeAirQualitySensor();
  v92[4] = v77;
  v76 = getHMServiceTypeHumiditySensor();
  v92[5] = v76;
  uint64_t v21 = getHMServiceTypeCarbonMonoxideSensor();
  v92[6] = v21;
  uint64_t v22 = getHMServiceTypeContactSensor();
  v92[7] = v22;
  uint64_t v23 = getHMServiceTypeLeakSensor();
  v92[8] = v23;
  v24 = getHMServiceTypeLightSensor();
  v92[9] = v24;
  uint64_t v25 = getHMServiceTypeMotionSensor();
  v92[10] = v25;
  uint64_t v26 = getHMServiceTypeOccupancySensor();
  v92[11] = v26;
  uint64_t v27 = getHMServiceTypeSmokeSensor();
  v92[12] = v27;
  uint64_t v28 = getHMServiceTypeCarbonDioxideSensor();
  v92[13] = v28;
  uint8_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:14];
  double v83 = [v82 setWithArray:v29];

  double v30 = v84;
  if (!v84)
  {
    long long v32 = 0;
LABEL_26:
    uint64_t v50 = [MEMORY[0x263EFF9B0] orderedSet];
    v51 = [v32 allValues];
    id v52 = [v51 valueForKeyPath:@"@sum.self"];
    [v52 doubleValue];
    double v54 = v53;

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v55 = [v11 allKeys];
    uint64_t v56 = [v55 countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v86 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          v61 = [v32 objectForKeyedSubscript:v60];
          [v61 floatValue];
          double v63 = v62 + 1.0;
          double v64 = [v11 allKeys];
          objc_msgSend(v60, "setScore:", v63 / (v54 + (double)(unint64_t)objc_msgSend(v64, "count")));

          [v50 addObject:v60];
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v57);
    }

    double v65 = [v50 array];
    double v66 = (void *)[v65 mutableCopy];

    if (v71)
    {
      unint64_t v67 = [v66 count];
      if (v67 >= v71) {
        unint64_t v68 = v71;
      }
      else {
        unint64_t v68 = v67;
      }
      objc_msgSend(v66, "subarrayWithRange:", 0, v68);
      id v69 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v69 = v66;
    }
    id v18 = v69;
    double v30 = v84;

    goto LABEL_42;
  }
  long long v31 = [v84 eventBody];
  long long v32 = [v31 valueForKey:@"base"];

  if (!v32)
  {
    long long v32 = ARPLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ARPHomeControlSuggester nextActionBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:](v32, v43, v44);
    }
    goto LABEL_41;
  }
  long long v33 = [v84 eventBody];
  getBMHomeKitClientAccessoryControlEventClass();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  long long v35 = [v84 eventBody];
  uint64_t v36 = v35;
  if ((isKindOfClass & 1) == 0)
  {
    getBMHomeKitClientActionSetEventClass();
    objc_opt_class();
    char v45 = objc_opt_isKindOfClass();

    uint64_t v36 = [v84 eventBody];
    if (v45)
    {
      long long v39 = objc_alloc_init(ARPHomeControlSuggestion);
      [(ARPHomeControlSuggestion *)v39 setType:1];
      uint64_t v46 = [v36 actionSetUniqueIdentifier];
    }
    else
    {
      getBMHomeKitClientMediaAccessoryControlEventClass();
      objc_opt_class();
      char v47 = objc_opt_isKindOfClass();

      if ((v47 & 1) == 0)
      {
        long long v39 = 0;
        goto LABEL_23;
      }
      uint64_t v36 = [v84 eventBody];
      long long v39 = objc_alloc_init(ARPHomeControlSuggestion);
      [(ARPHomeControlSuggestion *)v39 setType:0];
      uint64_t v46 = [v36 accessoryUniqueIdentifier];
    }
    v48 = (void *)v46;
    [(ARPHomeControlSuggestion *)v39 setTargetUUID:v46];

    long long v42 = [v32 homeUniqueIdentifier];
    [(ARPHomeControlSuggestion *)v39 setHomeUUID:v42];
LABEL_20:

    if (v39)
    {
      uint64_t v36 = [v11 objectForKeyedSubscript:v39];
      goto LABEL_24;
    }
LABEL_23:
    uint64_t v36 = 0;
LABEL_24:
    uint64_t v49 = [v36 count];

    if (v49)
    {

      long long v32 = v36;
      goto LABEL_26;
    }
    goto LABEL_40;
  }
  long long v37 = [v35 serviceType];
  char v38 = [v83 containsObject:v37];

  if ((v38 & 1) == 0)
  {
    long long v39 = objc_alloc_init(ARPHomeControlSuggestion);
    [(ARPHomeControlSuggestion *)v39 setType:0];
    long long v40 = [v36 accessoryUniqueIdentifier];
    [(ARPHomeControlSuggestion *)v39 setTargetUUID:v40];

    long long v41 = [v32 homeUniqueIdentifier];
    [(ARPHomeControlSuggestion *)v39 setHomeUUID:v41];

    long long v42 = [v36 serviceUniqueIdentifier];
    [(ARPHomeControlSuggestion *)v39 setAccessoryServiceUUID:v42];
    goto LABEL_20;
  }
LABEL_40:

LABEL_41:
  id v18 = (void *)MEMORY[0x263EFFA68];
LABEL_42:
  id v8 = v74;
  id v7 = v75;
  uint64_t v10 = v73;

LABEL_43:
LABEL_44:

  return v18;
}

- (void)nextActionBasedsuggestionsWithMaxSuggestions:(uint64_t)a3 referenceDate:(uint64_t)a4 correlationsFile:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3 events:(id)a4
{
  return [(ARPHomeControlSuggester *)self frequencybasedSuggestionsWitMaxSuggestions:a3 events:a4 useScenes:1];
}

+ (id)suggester
{
  uint64_t v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithScoreThresholdForMicrolocationSuggestionsConsidered:0.1 highScoreThresholdForMicroLocationSuggestionMerge:0.4 lowScoreThresholdForMicroLocationSuggestionMerge:0.2 highScoreThresholdForTimeBasedSuggestionMerge:0.3 lowScoreThresholdForTimeBasedSuggestionMerge:0.2];
  return v2;
}

- (ARPHomeControlSuggester)initWithScoreThresholdForMicrolocationSuggestionsConsidered:(double)a3 highScoreThresholdForMicroLocationSuggestionMerge:(double)a4 lowScoreThresholdForMicroLocationSuggestionMerge:(double)a5 highScoreThresholdForTimeBasedSuggestionMerge:(double)a6 lowScoreThresholdForTimeBasedSuggestionMerge:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)ARPHomeControlSuggester;
  result = [(ARPHomeControlSuggester *)&v13 init];
  if (result)
  {
    result->_scoreThresholdForMicrolocationSuggestionsConsidered = a3;
    result->_highScoreThresholdForMicroLocationSuggestionMerge = a4;
    result->_lowScoreThresholdForMicroLocationSuggestionMerge = a5;
    result->_highScoreThresholdForTimeBasedSuggestionMerge = a6;
    result->_lowScoreThresholdForTimeBasedSuggestionMerge = a7;
    result->_scoreSceneBoost = 0.0;
  }
  return result;
}

- (id)homeKitEventsWithLookbackDays:(int64_t)a3
{
  uint8_t v29 = self;
  v43[2] = *MEMORY[0x263EF8340];
  CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() + (double)(1440 * a3) * -60.0;
  getBMHomeKitClientAccessoryControlStreamClass();
  uid_t v4 = objc_opt_new();
  double v30 = [v4 publisherFromStartTime:v3];

  getBMHomeKitClientActionSetStreamClass();
  BOOL v5 = objc_opt_new();
  id v6 = [v5 publisherFromStartTime:v3];

  getBMHomeKitClientMediaAccessoryControlStreamClass();
  id v7 = objc_opt_new();
  id v8 = [v7 publisherFromStartTime:v3];

  if (v30) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    uint64_t v15 = ARPLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(ARPHomeControlSuggester *)v15 homeKitEventsWithLookbackDays:v12];
    }
    objc_super v13 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v43[0] = v6;
    v43[1] = v8;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    uint64_t v15 = [v30 orderedMergeWithOthers:v14 comparator:&__block_literal_global_59];

    uint64_t v36 = 0;
    long long v37 = &v36;
    uint64_t v38 = 0x3032000000;
    long long v39 = __Block_byref_object_copy_;
    long long v40 = __Block_byref_object_dispose_;
    id v41 = [MEMORY[0x263EFF980] arrayWithCapacity:3000];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __57__ARPHomeControlSuggester_homeKitEventsWithLookbackDays___block_invoke_2;
    v35[3] = &unk_2640B41A8;
    v35[4] = &v36;
    v35[5] = 3000;
    id v16 = (id)[v15 sinkWithCompletion:&__block_literal_global_63 receiveInput:v35];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = (id)v37[5];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v42 count:16];
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = *(void *)v32;
      double v21 = 0.0;
      double v22 = 0.0;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          v24 = *(void **)(*((void *)&v31 + 1) + 8 * v23);
          uint64_t v25 = objc_msgSend(v24, "eventBody", v29);
          getBMHomeKitClientMediaAccessoryControlEventClass();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            double v21 = v21 + 1.0;
          }
          else
          {
            uint64_t v26 = [v24 eventBody];
            getBMHomeKitClientAccessoryControlEventClass();
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              double v21 = v21 + 1.0;
            }
            else {
              double v22 = v22 + 1.0;
            }
          }
          ++v23;
        }
        while (v19 != v23);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v19);

      if (v22 > 0.0) {
        [(ARPHomeControlSuggester *)v29 setScoreSceneBoost:v21 / v22 * 4.0];
      }
    }
    else
    {
    }
    objc_super v13 = objc_msgSend((id)v37[5], "copy", v29);
    _Block_object_dispose(&v36, 8);
  }
  return v13;
}

- (id)microlocationBasedsuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4 correlationsFile:(id)a5
{
  v102[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v98 = 0;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v9 options:1 error:&v98];
    id v11 = v98;
    if (v11)
    {
      id v12 = v11;
      objc_super v13 = ARPLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ARPHomeControlSuggester microlocationBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:]((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
      }
      uint64_t v20 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      unint64_t v84 = a3;
      id v97 = 0;
      long long v86 = v10;
      double v21 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v97];
      id v87 = v97;
      id v90 = [v21 microlocationCorrelationsDictionary];
      uint64_t v91 = [v21 archiveDate];

      uint64_t v22 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:0];
      uint64_t v23 = (void *)MEMORY[0x263F35090];
      v24 = [MEMORY[0x263EFF910] distantPast];
      uint64_t v25 = [v23 predicateForEventsWithStartInDateRangeFrom:v24 to:v8];
      uint64_t v26 = [MEMORY[0x263F35148] microLocationVisitStream];
      v102[0] = v26;
      uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v102 count:1];
      long long v85 = (void *)v22;
      uint64_t v101 = v22;
      uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v101 count:1];
      uint8_t v29 = [v23 eventQueryWithPredicate:v25 eventStreams:v27 offset:0 limit:1 sortDescriptors:v28];

      double v30 = v29;
      long long v31 = [NSString stringWithUTF8String:"ARPHomeControlSuggester.m"];
      long long v32 = objc_msgSend(v31, "stringByAppendingFormat:", @":%d", 217);
      [v29 setClientName:v32];

      [v29 setTracker:&__block_literal_global_37];
      long long v33 = [(ARPHomeControlSuggester *)self knowledgeStore];
      id v96 = v87;
      long long v34 = [v33 executeQuery:v29 error:&v96];
      id v12 = v96;

      id v89 = v34;
      if (v12)
      {
        long long v35 = (void *)v91;
        uint64_t v36 = ARPLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[ARPHomeControlSuggester microlocationBasedsuggestionsWithMaxSuggestions:referenceDate:correlationsFile:]((uint64_t)v12, v36, v37, v38, v39, v40, v41, v42);
        }
        uint64_t v20 = (void *)MEMORY[0x263EFFA68];
        uint64_t v43 = v85;
        uint64_t v10 = v86;
        objc_super v13 = v90;
      }
      else
      {
        uint64_t v82 = v29;
        long long v88 = [v34 firstObject];
        uint64_t v44 = [v88 startDate];
        char v45 = 0;
        v81 = (void *)v44;
        if (v91)
        {
          uint64_t v46 = v44;
          if (v44)
          {
            objc_msgSend(v8, "timeIntervalSinceDate:");
            if (v47 <= 600.0 && ([v8 timeIntervalSinceDate:v46], v48 <= 600.0))
            {
              uint64_t v49 = [v88 metadata];
              uint64_t v50 = [MEMORY[0x263F350D8] probabilityVector];
              v51 = [v49 objectForKeyedSubscript:v50];

              id v52 = [v51 allValues];
              double v53 = [v52 valueForKeyPath:@"@max.self"];

              [v53 doubleValue];
              double v55 = v54;
              [(ARPHomeControlSuggester *)self scoreThresholdForMicrolocationSuggestionsConsidered];
              if (v55 >= v56)
              {
                uint64_t v57 = [v51 allKeysForObject:v53];
                uint64_t v58 = [v57 firstObject];

                uint64_t v59 = [v58 UUIDString];
                char v45 = [v90 objectForKeyedSubscript:v59];
              }
              else
              {
                char v45 = 0;
              }
            }
            else
            {
              char v45 = 0;
            }
          }
        }
        id v83 = v8;
        v60 = [MEMORY[0x263EFF9B0] orderedSet];
        v61 = [v45 allValues];
        float v62 = [v61 valueForKeyPath:@"@sum.self"];
        [v62 doubleValue];
        double v64 = v63;

        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        double v65 = [v45 allKeys];
        uint64_t v66 = [v65 countByEnumeratingWithState:&v92 objects:v100 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          uint64_t v68 = *(void *)v93;
          do
          {
            for (uint64_t i = 0; i != v67; ++i)
            {
              if (*(void *)v93 != v68) {
                objc_enumerationMutation(v65);
              }
              uint64_t v70 = *(void **)(*((void *)&v92 + 1) + 8 * i);
              unint64_t v71 = [v45 objectForKeyedSubscript:v70];
              [v71 floatValue];
              [v70 setScore:v72 / v64];

              [v60 addObject:v70];
            }
            uint64_t v67 = [v65 countByEnumeratingWithState:&v92 objects:v100 count:16];
          }
          while (v67);
        }

        id v73 = [v60 array];
        double v74 = (void *)[v73 mutableCopy];

        id v75 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"score" ascending:0];
        v99 = v75;
        v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v99 count:1];
        [v74 sortUsingDescriptors:v76];

        if (v84)
        {
          unint64_t v77 = [v74 count];
          if (v77 >= v84) {
            unint64_t v78 = v84;
          }
          else {
            unint64_t v78 = v77;
          }
          objc_msgSend(v74, "subarrayWithRange:", 0, v78);
          id v79 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v79 = v74;
        }
        uint64_t v20 = v79;
        uint64_t v10 = v86;
        objc_super v13 = v90;
        long long v35 = (void *)v91;

        double v30 = v82;
        id v8 = v83;
        uint64_t v43 = v85;
        uint64_t v36 = v88;
      }
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x263EFFA68];
  }

  return v20;
}

- (void)microlocationBasedsuggestionsWithMaxSuggestions:(uint64_t)a3 referenceDate:(uint64_t)a4 correlationsFile:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __88__ARPHomeControlSuggester_suggestionsWithMaxSuggestions_referenceDate_correlationsFile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 >= v8)
  {
    [v4 doubleValue];
    double v11 = v10;
    [v5 doubleValue];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __106__ARPHomeControlSuggester_microlocationBasedsuggestionsWithMaxSuggestions_referenceDate_correlationsFile___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)timeBasedSuggestionsWithMaxSuggestions:(unint64_t)a3 referenceDate:(id)a4
{
  return [(ARPHomeControlSuggester *)self timeBasedSuggestionsWithMaxSuggestions:a3 referenceDate:a4 fallBackToFrequency:1];
}

- (id)frequencybasedSuggestionsWitMaxSuggestions:(unint64_t)a3
{
  id v5 = [(ARPHomeControlSuggester *)self homeKitEventsWithLookbackDays:30];
  double v6 = [(ARPHomeControlSuggester *)self frequencybasedSuggestionsWitMaxSuggestions:a3 events:v5];

  return v6;
}

uint64_t __57__ARPHomeControlSuggester_homeKitEventsWithLookbackDays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 eventBody];
  double v6 = [v5 valueForKey:@"base"];
  double v7 = [v6 dateInterval];
  double v8 = [v7 startDate];
  uint64_t v9 = [v4 eventBody];

  double v10 = [v9 valueForKey:@"base"];
  double v11 = [v10 dateInterval];
  double v12 = [v11 startDate];
  uint64_t v13 = [v8 compare:v12];

  return v13;
}

void __57__ARPHomeControlSuggester_homeKitEventsWithLookbackDays___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3 == *(void *)(a1 + 40))
  {
    [v4 removeObjectAtIndex:0];
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v5];
}

- (id)mostRecentHomeKitEvent
{
  v26[2] = *MEMORY[0x263EF8340];
  CFAbsoluteTime v2 = CFAbsoluteTimeGetCurrent() + -2592000.0;
  getBMHomeKitClientAccessoryControlStreamClass();
  uint64_t v3 = objc_opt_new();
  id v4 = [v3 publisherFromStartTime:v2];

  getBMHomeKitClientActionSetStreamClass();
  id v5 = objc_opt_new();
  double v6 = [v5 publisherFromStartTime:v2];

  getBMHomeKitClientMediaAccessoryControlStreamClass();
  double v7 = objc_opt_new();
  double v8 = [v7 publisherFromStartTime:v2];

  if (v4) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    uint64_t v14 = ARPLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(ARPHomeControlSuggester *)v14 homeKitEventsWithLookbackDays:v12];
    }
    id v17 = 0;
  }
  else
  {
    v26[0] = v6;
    v26[1] = v8;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    uint64_t v14 = [v4 orderedMergeWithOthers:v13 comparator:&__block_literal_global_66];

    uint64_t v15 = [v14 last];
    uint64_t v20 = 0;
    double v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __49__ARPHomeControlSuggester_mostRecentHomeKitEvent__block_invoke_3;
    v19[3] = &unk_2640B41D0;
    v19[4] = &v20;
    id v16 = (id)[v15 sinkWithCompletion:&__block_literal_global_68 receiveInput:v19];
    id v17 = (id)v21[5];
    _Block_object_dispose(&v20, 8);
  }
  return v17;
}

uint64_t __49__ARPHomeControlSuggester_mostRecentHomeKitEvent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 eventBody];
  double v6 = [v5 valueForKey:@"base"];
  double v7 = [v6 dateInterval];
  double v8 = [v7 startDate];
  BOOL v9 = [v4 eventBody];

  double v10 = [v9 valueForKey:@"base"];
  uint64_t v11 = [v10 dateInterval];
  uint64_t v12 = [v11 startDate];
  uint64_t v13 = [v8 compare:v12];

  return v13;
}

void __49__ARPHomeControlSuggester_mostRecentHomeKitEvent__block_invoke_3(uint64_t a1, void *a2)
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (double)scoreThresholdForMicrolocationSuggestionsConsidered
{
  return self->_scoreThresholdForMicrolocationSuggestionsConsidered;
}

- (void)setScoreThresholdForMicrolocationSuggestionsConsidered:(double)a3
{
  self->_scoreThresholdForMicrolocationSuggestionsConsidered = a3;
}

- (double)highScoreThresholdForMicroLocationSuggestionMerge
{
  return self->_highScoreThresholdForMicroLocationSuggestionMerge;
}

- (void)setHighScoreThresholdForMicroLocationSuggestionMerge:(double)a3
{
  self->_highScoreThresholdForMicroLocationSuggestionMerge = a3;
}

- (double)lowScoreThresholdForMicroLocationSuggestionMerge
{
  return self->_lowScoreThresholdForMicroLocationSuggestionMerge;
}

- (void)setLowScoreThresholdForMicroLocationSuggestionMerge:(double)a3
{
  self->_lowScoreThresholdForMicroLocationSuggestionMerge = a3;
}

- (double)highScoreThresholdForTimeBasedSuggestionMerge
{
  return self->_highScoreThresholdForTimeBasedSuggestionMerge;
}

- (void)setHighScoreThresholdForTimeBasedSuggestionMerge:(double)a3
{
  self->_highScoreThresholdForTimeBasedSuggestionMerge = a3;
}

- (double)lowScoreThresholdForTimeBasedSuggestionMerge
{
  return self->_lowScoreThresholdForTimeBasedSuggestionMerge;
}

- (void)setLowScoreThresholdForTimeBasedSuggestionMerge:(double)a3
{
  self->_lowScoreThresholdForTimeBasedSuggestionMerge = a3;
}

- (double)scoreSceneBoost
{
  return self->_scoreSceneBoost;
}

- (void)setScoreSceneBoost:(double)a3
{
  self->_scoreSceneBoost = a3;
}

- (NSString)correlationsSessionFile
{
  return self->_correlationsSessionFile;
}

- (void)setCorrelationsSessionFile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationsSessionFile, 0);
  objc_storeStrong((id *)&self->_homeKitEventsSortedByStartDate, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)microlocationBasedsuggestionsWithMaxSuggestions:(uint64_t)a3 referenceDate:(uint64_t)a4 correlationsFile:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)nextActionBasedsuggestionsWithMaxSuggestions:(NSObject *)a1 referenceDate:(uint64_t)a2 correlationsFile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20BE41000, a1, a3, "Skipping nextAction suggestions - BMHomeKitClientBase is nil", v3);
}

- (void)timeBucketFrequencyBasedSuggestionsWithMaxSuggestions:(uint8_t *)a1 events:(unsigned char *)a2 referenceDate:(NSObject *)a3 .cold.1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20BE41000, a3, (uint64_t)a3, "Skipping HomeKit donation - BMHomeKitClientBase or dateInterval is nil", a1);
}

- (void)frequencybasedSuggestionsWitMaxSuggestions:(uint8_t *)a1 events:(unsigned char *)a2 useScenes:(NSObject *)a3 .cold.1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20BE41000, a3, (uint64_t)a3, "Skipping suggestion - BMHomeKitClientBase is nil", a1);
}

- (void)homeKitEventsWithLookbackDays:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20BE41000, a1, a3, "One or more Biome HomeKit publishers are nil. Please check for the right entitlements", v3);
}

@end