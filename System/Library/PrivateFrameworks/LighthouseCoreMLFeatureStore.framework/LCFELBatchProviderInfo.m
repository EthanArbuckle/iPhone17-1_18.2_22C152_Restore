@interface LCFELBatchProviderInfo
+ (id)meanOf:(id)a3;
+ (id)standardDeviationOf:(id)a3;
- (NSArray)negativeFeatureStatistics;
- (NSArray)positiveFeatureStatistics;
- (NSDictionary)totalFeatureStatistics;
- (NSNumber)featureCount;
- (NSNumber)timeRange;
- (NSString)featureStoreKey;
- (NSUUID)contextId;
- (NSUUID)eventId;
- (id)init:(id)a3 labelFeatureName:(id)a4;
@end

@implementation LCFELBatchProviderInfo

+ (id)meanOf:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "doubleValue", (void)v14);
          double v8 = v8 + v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:", v8 / (double)(unint64_t)objc_msgSend(v4, "count"));
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087B0] notANumber];
  }
  v12 = (void *)v11;

  return v12;
}

+ (id)standardDeviationOf:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[LCFELBatchProviderInfo meanOf:v3];
    [v4 doubleValue];
    double v6 = v5;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "doubleValue", (void)v17);
          double v11 = v11 + (v13 - v6) * (v13 - v6);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    uint64_t v14 = objc_msgSend(NSNumber, "numberWithDouble:", sqrt(v11 / (double)(unint64_t)objc_msgSend(v7, "count")));
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087B0] notANumber];
  }
  long long v15 = (void *)v14;

  return v15;
}

- (id)init:(id)a3 labelFeatureName:(id)a4
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v107 = a4;
  v141.receiver = self;
  v141.super_class = (Class)LCFELBatchProviderInfo;
  id v7 = [(LCFELBatchProviderInfo *)&v141 init];
  if (!v7) {
    goto LABEL_49;
  }
  uint64_t v8 = +[LCFFeatureStoreContextId getContextId];
  contextId = v7->_contextId;
  v7->_contextId = (NSUUID *)v8;

  uint64_t v10 = [MEMORY[0x263F08C38] UUID];
  eventId = v7->_eventId;
  v7->_eventId = (NSUUID *)v10;

  uint64_t v12 = [v6 featureStoreKey];
  featureStoreKey = v7->_featureStoreKey;
  v7->_featureStoreKey = (NSString *)v12;

  uint64_t v14 = NSNumber;
  long long v15 = [v6 timeLast];
  long long v16 = [v6 timeFirst];
  [v15 timeIntervalSinceDate:v16];
  uint64_t v17 = objc_msgSend(v14, "numberWithDouble:");
  timeRange = v7->_timeRange;
  v7->_timeRange = (NSNumber *)v17;

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "count"));
  featureCount = v7->_featureCount;
  v104 = v7;
  v7->_featureCount = (NSNumber *)v19;

  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v117 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v116 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v103 = v6;
  obuint64_t j = [v6 featureProviders];
  v120 = v21;
  v108 = (char *)[obj countByEnumeratingWithState:&v137 objects:v146 count:16];
  if (!v108) {
    goto LABEL_27;
  }
  uint64_t v106 = *(void *)v138;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v138 != v106) {
        objc_enumerationMutation(obj);
      }
      v113 = v22;
      v23 = +[LCFCoreMLFeatureProvider fromMLProvider:*(void *)(*((void *)&v137 + 1) + 8 * (void)v22)];
      v24 = [v23 featureValues];
      v25 = [v24 objectForKeyedSubscript:v107];

      id v110 = v25;
      uint64_t v26 = [v25 int64Value];
      v27 = v117;
      if (v26 <= 0) {
        v27 = v116;
      }
      id v28 = v27;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      v29 = [v23 featureValues];
      v30 = [v29 allKeys];

      id v118 = v30;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v133 objects:v145 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v134;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v134 != v33) {
              objc_enumerationMutation(v118);
            }
            uint64_t v35 = *(void *)(*((void *)&v133 + 1) + 8 * i);
            v36 = [v28 allKeys];
            char v37 = [v36 containsObject:v35];

            if ((v37 & 1) == 0)
            {
              id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v28 setObject:v38 forKeyedSubscript:v35];
            }
            v39 = [v21 allKeys];
            char v40 = [v39 containsObject:v35];

            if ((v40 & 1) == 0)
            {
              id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v21 setObject:v41 forKeyedSubscript:v35];
            }
            v42 = [v23 featureValues];
            v43 = [v42 objectForKeyedSubscript:v35];

            uint64_t v44 = [v43 type];
            if (v44 == 2)
            {
              v49 = [v28 objectForKeyedSubscript:v35];
              v50 = NSNumber;
              [v43 doubleValue];
              v51 = objc_msgSend(v50, "numberWithDouble:");
              [v49 addObject:v51];

              id v21 = v120;
              v47 = [v120 objectForKeyedSubscript:v35];
              v52 = NSNumber;
              [v43 doubleValue];
              uint64_t v48 = objc_msgSend(v52, "numberWithDouble:");
            }
            else
            {
              if (v44 != 1) {
                goto LABEL_23;
              }
              v45 = [v28 objectForKeyedSubscript:v35];
              v46 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v43, "int64Value"));
              [v45 addObject:v46];

              id v21 = v120;
              v47 = [v120 objectForKeyedSubscript:v35];
              uint64_t v48 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v43, "int64Value"));
            }
            v53 = (void *)v48;
            [v47 addObject:v48];

LABEL_23:
          }
          uint64_t v32 = [v118 countByEnumeratingWithState:&v133 objects:v145 count:16];
        }
        while (v32);
      }

      uint64_t v22 = v113 + 1;
    }
    while (v113 + 1 != v108);
    v108 = (char *)[obj countByEnumeratingWithState:&v137 objects:v146 count:16];
  }
  while (v108);
LABEL_27:

  id v119 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v114 = [v117 allKeys];
  uint64_t v54 = [v114 countByEnumeratingWithState:&v129 objects:v144 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v130;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v130 != v56) {
          objc_enumerationMutation(v114);
        }
        uint64_t v58 = *(void *)(*((void *)&v129 + 1) + 8 * j);
        v59 = [v117 objectForKeyedSubscript:v58];
        v60 = +[LCFELBatchProviderInfo meanOf:v59];

        v61 = [v117 objectForKeyedSubscript:v58];
        v62 = +[LCFELBatchProviderInfo standardDeviationOf:v61];

        v63 = [LCFELFeatureValueStatistic alloc];
        v64 = NSNumber;
        v65 = [v117 objectForKeyedSubscript:v58];
        v66 = objc_msgSend(v64, "numberWithUnsignedInteger:", objc_msgSend(v65, "count"));
        id v67 = [(LCFELFeatureValueStatistic *)v63 init:v58 count:v66 mean:v60 stddev:v62];

        [v119 addObject:v67];
      }
      uint64_t v55 = [v114 countByEnumeratingWithState:&v129 objects:v144 count:16];
    }
    while (v55);
  }

  uint64_t v68 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v119];
  positiveFeatureStatistics = v104->_positiveFeatureStatistics;
  v104->_positiveFeatureStatistics = (NSArray *)v68;

  id v115 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v111 = [v116 allKeys];
  uint64_t v70 = [v111 countByEnumeratingWithState:&v125 objects:v143 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v126;
    do
    {
      for (uint64_t k = 0; k != v71; ++k)
      {
        if (*(void *)v126 != v72) {
          objc_enumerationMutation(v111);
        }
        uint64_t v74 = *(void *)(*((void *)&v125 + 1) + 8 * k);
        v75 = [v116 objectForKeyedSubscript:v74];
        v76 = +[LCFELBatchProviderInfo meanOf:v75];

        v77 = [v116 objectForKeyedSubscript:v74];
        v78 = +[LCFELBatchProviderInfo standardDeviationOf:v77];

        v79 = [LCFELFeatureValueStatistic alloc];
        v80 = NSNumber;
        v81 = [v116 objectForKeyedSubscript:v74];
        v82 = objc_msgSend(v80, "numberWithUnsignedInteger:", objc_msgSend(v81, "count"));
        id v83 = [(LCFELFeatureValueStatistic *)v79 init:v74 count:v82 mean:v76 stddev:v78];

        [v115 addObject:v83];
      }
      uint64_t v71 = [v111 countByEnumeratingWithState:&v125 objects:v143 count:16];
    }
    while (v71);
  }

  uint64_t v84 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v115];
  negativeFeatureStatistics = v104->_negativeFeatureStatistics;
  v104->_negativeFeatureStatistics = (NSArray *)v84;

  id v112 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v109 = [v120 allKeys];
  uint64_t v86 = [v109 countByEnumeratingWithState:&v121 objects:v142 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v122;
    do
    {
      for (uint64_t m = 0; m != v87; ++m)
      {
        if (*(void *)v122 != v88) {
          objc_enumerationMutation(v109);
        }
        uint64_t v90 = *(void *)(*((void *)&v121 + 1) + 8 * m);
        v91 = [v120 objectForKeyedSubscript:v90];
        v92 = +[LCFELBatchProviderInfo meanOf:v91];

        v93 = [v120 objectForKeyedSubscript:v90];
        v94 = +[LCFELBatchProviderInfo standardDeviationOf:v93];

        v95 = [LCFELFeatureValueStatistic alloc];
        v96 = NSNumber;
        v97 = [v120 objectForKeyedSubscript:v90];
        v98 = objc_msgSend(v96, "numberWithUnsignedInteger:", objc_msgSend(v97, "count"));
        id v99 = [(LCFELFeatureValueStatistic *)v95 init:v90 count:v98 mean:v92 stddev:v94];

        [v112 setObject:v99 forKeyedSubscript:v90];
      }
      uint64_t v87 = [v109 countByEnumeratingWithState:&v121 objects:v142 count:16];
    }
    while (v87);
  }

  uint64_t v100 = [objc_alloc(NSDictionary) initWithDictionary:v112];
  id v7 = v104;
  totalFeatureStatistics = v104->_totalFeatureStatistics;
  v104->_totalFeatureStatistics = (NSDictionary *)v100;

  id v6 = v103;
LABEL_49:

  return v7;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSUUID)eventId
{
  return self->_eventId;
}

- (NSString)featureStoreKey
{
  return self->_featureStoreKey;
}

- (NSNumber)timeRange
{
  return self->_timeRange;
}

- (NSNumber)featureCount
{
  return self->_featureCount;
}

- (NSDictionary)totalFeatureStatistics
{
  return self->_totalFeatureStatistics;
}

- (NSArray)positiveFeatureStatistics
{
  return self->_positiveFeatureStatistics;
}

- (NSArray)negativeFeatureStatistics
{
  return self->_negativeFeatureStatistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeFeatureStatistics, 0);
  objc_storeStrong((id *)&self->_positiveFeatureStatistics, 0);
  objc_storeStrong((id *)&self->_totalFeatureStatistics, 0);
  objc_storeStrong((id *)&self->_featureCount, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_featureStoreKey, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end