@interface BMSiriUserEngagementStatisticsAccumulatedAggregationStats
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)initWithAggregationStartTimestamp:(id)a3 numberOfDaysAggregation:(id)a4 aggregationStats:(id)a5 cohortType:(id)a6 intendedRequestRatio:(id)a7 uesScore:(id)a8 mitigationAssetVersion:(id)a9 sdsdRetryCount:(id)a10;
- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAggregationStartTimestamp;
- (BOOL)hasIntendedRequestRatio;
- (BOOL)hasNumberOfDaysAggregation;
- (BOOL)hasSdsdRetryCount;
- (BOOL)hasUesScore;
- (BOOL)isEqual:(id)a3;
- (NSArray)aggregationStats;
- (NSString)cohortType;
- (NSString)description;
- (NSString)mitigationAssetVersion;
- (double)aggregationStartTimestamp;
- (double)intendedRequestRatio;
- (double)uesScore;
- (id)_aggregationStatsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)numberOfDaysAggregation;
- (int)sdsdRetryCount;
- (unsigned)dataVersion;
- (void)setHasAggregationStartTimestamp:(BOOL)a3;
- (void)setHasIntendedRequestRatio:(BOOL)a3;
- (void)setHasNumberOfDaysAggregation:(BOOL)a3;
- (void)setHasSdsdRetryCount:(BOOL)a3;
- (void)setHasUesScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriUserEngagementStatisticsAccumulatedAggregationStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigationAssetVersion, 0);
  objc_storeStrong((id *)&self->_cohortType, 0);

  objc_storeStrong((id *)&self->_aggregationStats, 0);
}

- (void)setHasSdsdRetryCount:(BOOL)a3
{
  self->_hasSdsdRetryCount = a3;
}

- (BOOL)hasSdsdRetryCount
{
  return self->_hasSdsdRetryCount;
}

- (int)sdsdRetryCount
{
  return self->_sdsdRetryCount;
}

- (NSString)mitigationAssetVersion
{
  return self->_mitigationAssetVersion;
}

- (void)setHasUesScore:(BOOL)a3
{
  self->_hasUesScore = a3;
}

- (BOOL)hasUesScore
{
  return self->_hasUesScore;
}

- (double)uesScore
{
  return self->_uesScore;
}

- (void)setHasIntendedRequestRatio:(BOOL)a3
{
  self->_hasIntendedRequestRatio = a3;
}

- (BOOL)hasIntendedRequestRatio
{
  return self->_hasIntendedRequestRatio;
}

- (double)intendedRequestRatio
{
  return self->_intendedRequestRatio;
}

- (NSString)cohortType
{
  return self->_cohortType;
}

- (NSArray)aggregationStats
{
  return self->_aggregationStats;
}

- (void)setHasNumberOfDaysAggregation:(BOOL)a3
{
  self->_hasNumberOfDaysAggregation = a3;
}

- (BOOL)hasNumberOfDaysAggregation
{
  return self->_hasNumberOfDaysAggregation;
}

- (int)numberOfDaysAggregation
{
  return self->_numberOfDaysAggregation;
}

- (void)setHasAggregationStartTimestamp:(BOOL)a3
{
  self->_hasAggregationStartTimestamp = a3;
}

- (BOOL)hasAggregationStartTimestamp
{
  return self->_hasAggregationStartTimestamp;
}

- (double)aggregationStartTimestamp
{
  return self->_aggregationStartTimestamp;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasAggregationStartTimestamp](self, "hasAggregationStartTimestamp")|| [v5 hasAggregationStartTimestamp])
    {
      if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasAggregationStartTimestamp])goto LABEL_40; {
      if (![v5 hasAggregationStartTimestamp])
      }
        goto LABEL_40;
      [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStartTimestamp];
      double v7 = v6;
      [v5 aggregationStartTimestamp];
      if (v7 != v8) {
        goto LABEL_40;
      }
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasNumberOfDaysAggregation](self, "hasNumberOfDaysAggregation")|| [v5 hasNumberOfDaysAggregation])
    {
      if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasNumberOfDaysAggregation])goto LABEL_40; {
      if (![v5 hasNumberOfDaysAggregation])
      }
        goto LABEL_40;
      int v9 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self numberOfDaysAggregation];
      if (v9 != [v5 numberOfDaysAggregation]) {
        goto LABEL_40;
      }
    }
    v10 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStats];
    uint64_t v11 = [v5 aggregationStats];
    if (v10 == (void *)v11)
    {
    }
    else
    {
      v12 = (void *)v11;
      v13 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStats];
      v14 = [v5 aggregationStats];
      int v15 = [v13 isEqual:v14];

      if (!v15) {
        goto LABEL_40;
      }
    }
    v17 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self cohortType];
    uint64_t v18 = [v5 cohortType];
    if (v17 == (void *)v18)
    {
    }
    else
    {
      v19 = (void *)v18;
      v20 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self cohortType];
      v21 = [v5 cohortType];
      int v22 = [v20 isEqual:v21];

      if (!v22) {
        goto LABEL_40;
      }
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")|| [v5 hasIntendedRequestRatio])
    {
      if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasIntendedRequestRatio])goto LABEL_40; {
      if (![v5 hasIntendedRequestRatio])
      }
        goto LABEL_40;
      [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self intendedRequestRatio];
      double v24 = v23;
      [v5 intendedRequestRatio];
      if (v24 != v25) {
        goto LABEL_40;
      }
    }
    if ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasUesScore]
      || [v5 hasUesScore])
    {
      if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasUesScore]) {
        goto LABEL_40;
      }
      if (![v5 hasUesScore]) {
        goto LABEL_40;
      }
      [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self uesScore];
      double v27 = v26;
      [v5 uesScore];
      if (v27 != v28) {
        goto LABEL_40;
      }
    }
    v29 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self mitigationAssetVersion];
    uint64_t v30 = [v5 mitigationAssetVersion];
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      v32 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self mitigationAssetVersion];
      v33 = [v5 mitigationAssetVersion];
      int v34 = [v32 isEqual:v33];

      if (!v34) {
        goto LABEL_40;
      }
    }
    if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasSdsdRetryCount]
      && ![v5 hasSdsdRetryCount])
    {
      BOOL v16 = 1;
      goto LABEL_41;
    }
    if ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasSdsdRetryCount]
      && [v5 hasSdsdRetryCount])
    {
      int v35 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self sdsdRetryCount];
      BOOL v16 = v35 == [v5 sdsdRetryCount];
LABEL_41:

      goto LABEL_42;
    }
LABEL_40:
    BOOL v16 = 0;
    goto LABEL_41;
  }
  BOOL v16 = 0;
LABEL_42:

  return v16;
}

- (id)jsonDictionary
{
  v36[8] = *MEMORY[0x1E4F143B8];
  if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasAggregationStartTimestamp]|| ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStartTimestamp], fabs(v3) == INFINITY))
  {
    uint64_t v5 = 0;
  }
  else
  {
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStartTimestamp];
    id v4 = NSNumber;
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStartTimestamp];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  if ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasNumberOfDaysAggregation])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats numberOfDaysAggregation](self, "numberOfDaysAggregation"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self _aggregationStatsJSONArray];
  uint64_t v8 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self cohortType];
  if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasIntendedRequestRatio]|| ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self intendedRequestRatio], fabs(v9) == INFINITY))
  {
    uint64_t v11 = 0;
  }
  else
  {
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self intendedRequestRatio];
    v10 = NSNumber;
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self intendedRequestRatio];
    uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasUesScore]
    || ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self uesScore], fabs(v12) == INFINITY))
  {
    v14 = 0;
  }
  else
  {
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self uesScore];
    v13 = NSNumber;
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self uesScore];
    v14 = objc_msgSend(v13, "numberWithDouble:");
  }
  int v15 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self mitigationAssetVersion];
  if ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self hasSdsdRetryCount])
  {
    BOOL v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats sdsdRetryCount](self, "sdsdRetryCount"));
  }
  else
  {
    BOOL v16 = 0;
  }
  v35[0] = @"aggregationStartTimestamp";
  uint64_t v17 = v5;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v34 = (void *)v5;
  uint64_t v30 = (void *)v17;
  v36[0] = v17;
  v35[1] = @"numberOfDaysAggregation";
  uint64_t v18 = v6;
  if (!v6)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v6;
  v29 = (void *)v18;
  v36[1] = v18;
  v35[2] = @"aggregationStats";
  uint64_t v19 = v7;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v7;
  double v28 = (void *)v19;
  v36[2] = v19;
  v35[3] = @"cohortType";
  v20 = (void *)v8;
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v8;
  v36[3] = v20;
  v35[4] = @"intendedRequestRatio";
  v21 = (void *)v11;
  if (!v11)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v22 = (void *)v11;
  v36[4] = v21;
  v35[5] = @"uesScore";
  double v23 = v14;
  if (!v14)
  {
    double v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[5] = v23;
  v35[6] = @"mitigationAssetVersion";
  double v24 = v15;
  if (!v15)
  {
    double v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[6] = v24;
  v35[7] = @"sdsdRetryCount";
  double v25 = v16;
  if (!v16)
  {
    double v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[7] = v25;
  double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:8];
  if (v16)
  {
    if (v15) {
      goto LABEL_37;
    }
LABEL_52:

    if (v14) {
      goto LABEL_38;
    }
    goto LABEL_53;
  }

  if (!v15) {
    goto LABEL_52;
  }
LABEL_37:
  if (v14) {
    goto LABEL_38;
  }
LABEL_53:

LABEL_38:
  if (!v22) {

  }
  if (!v31) {
  if (!v32)
  }

  if (!v33) {
  if (!v34)
  }

  return v26;
}

- (id)_aggregationStatsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStats];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v119[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"aggregationStartTimestamp"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v118 = *MEMORY[0x1E4F28568];
        double v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"aggregationStartTimestamp"];
        v119[0] = v25;
        double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:&v118 count:1];
        id v26 = (id)[v23 initWithDomain:v24 code:2 userInfo:v9];
        double v27 = 0;
        id v7 = 0;
        *a4 = v26;
        goto LABEL_75;
      }
      double v27 = 0;
      id v7 = 0;
      goto LABEL_76;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"numberOfDaysAggregation"];
  v90 = (void *)v8;
  if (v8 && (double v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v28 = v7;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v116 = *MEMORY[0x1E4F28568];
        id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfDaysAggregation"];
        id v117 = v10;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        v32 = v29;
        id v7 = v28;
        v93 = (void *)v31;
        id v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v30, 2);
        double v27 = 0;
        double v25 = 0;
        *a4 = v33;

        goto LABEL_74;
      }
      double v25 = 0;
      double v27 = 0;
      goto LABEL_75;
    }
    id v89 = v9;
  }
  else
  {
    id v89 = 0;
  }
  id v10 = [v5 objectForKeyedSubscript:@"aggregationStats"];
  long long v11 = [MEMORY[0x1E4F1CA98] null];
  int v12 = [v10 isEqual:v11];

  v88 = v6;
  if (v12)
  {
    v84 = self;
    id v87 = v7;

    id v10 = 0;
  }
  else
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          double v27 = 0;
          double v25 = v89;
          goto LABEL_74;
        }
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v114 = *MEMORY[0x1E4F28568];
        v92 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"aggregationStats"];
        v115 = v92;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        id v44 = (id)[v42 initWithDomain:v43 code:2 userInfo:v22];
        double v27 = 0;
        *a4 = v44;
LABEL_45:
        double v25 = v89;
        goto LABEL_72;
      }
    }
    v84 = self;
    id v87 = v7;
  }
  v92 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v10 = v10;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v95 objects:v113 count:16];
  if (!v13) {
    goto LABEL_22;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v96;
  id v83 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v96 != v15) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void **)(*((void *)&v95 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v34 = a4;
        if (a4)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v111 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"aggregationStats"];
          id v112 = v18;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v112;
          v39 = &v111;
LABEL_37:
          id v40 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
          id v41 = (id)[v35 initWithDomain:v36 code:2 userInfo:v40];
          double v27 = 0;
          *int v34 = v41;
LABEL_41:
          id v22 = v10;
          id v5 = v83;
          self = v84;
          id v7 = v87;
          uint64_t v6 = v88;
          double v25 = v89;
          goto LABEL_70;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v34 = a4;
        if (a4)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v109 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"aggregationStats"];
          id v110 = v18;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v110;
          v39 = &v109;
          goto LABEL_37;
        }
LABEL_44:
        double v27 = 0;
        id v22 = v10;
        id v5 = v83;
        self = v84;
        id v7 = v87;
        uint64_t v6 = v88;
        goto LABEL_45;
      }
      id v18 = v17;
      uint64_t v19 = [BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats alloc];
      id v94 = 0;
      v20 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)v19 initWithJSONDictionary:v18 error:&v94];
      id v21 = v94;
      if (v21)
      {
        id v40 = v21;
        if (a4) {
          *a4 = v21;
        }

        double v27 = 0;
        goto LABEL_41;
      }
      [v92 addObject:v20];
    }
    uint64_t v14 = [v10 countByEnumeratingWithState:&v95 objects:v113 count:16];
    id v5 = v83;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_22:

  id v18 = [v5 objectForKeyedSubscript:@"cohortType"];
  if (!v18)
  {
    id v22 = 0;
    self = v84;
    goto LABEL_49;
  }
  objc_opt_class();
  self = v84;
  if (objc_opt_isKindOfClass())
  {
    id v22 = 0;
    goto LABEL_49;
  }
  objc_opt_class();
  id v7 = v87;
  if (objc_opt_isKindOfClass())
  {
    id v22 = v18;
LABEL_49:
    uint64_t v45 = [v5 objectForKeyedSubscript:@"intendedRequestRatio"];
    v81 = (void *)v45;
    if (!v45)
    {
      id v40 = 0;
      goto LABEL_55;
    }
    v46 = (void *)v45;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = 0;
LABEL_55:
      uint64_t v47 = [v5 objectForKeyedSubscript:@"uesScore"];
      id v80 = v22;
      v76 = (void *)v47;
      if (!v47 || (v48 = (void *)v47, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v85 = 0;
LABEL_58:
        uint64_t v49 = [v5 objectForKeyedSubscript:@"mitigationAssetVersion"];
        v75 = (void *)v49;
        if (v49 && (v50 = (void *)v49, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v77 = v50;
            goto LABEL_61;
          }
          if (a4)
          {
            id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v68 = *MEMORY[0x1E4F502C8];
            uint64_t v101 = *MEMORY[0x1E4F28568];
            id v52 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mitigationAssetVersion"];
            id v102 = v52;
            v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
            id v69 = (id)[v79 initWithDomain:v68 code:2 userInfo:v51];
            double v27 = 0;
            id v77 = 0;
            *a4 = v69;
            double v25 = v89;
            goto LABEL_65;
          }
          id v77 = 0;
          double v27 = 0;
          double v25 = v89;
        }
        else
        {
          id v77 = 0;
LABEL_61:
          v51 = [v5 objectForKeyedSubscript:@"sdsdRetryCount"];
          if (!v51 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v52 = 0;
            double v25 = v89;
            goto LABEL_64;
          }
          objc_opt_class();
          double v25 = v89;
          if (objc_opt_isKindOfClass())
          {
            id v52 = v51;
LABEL_64:
            self = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self initWithAggregationStartTimestamp:v87 numberOfDaysAggregation:v25 aggregationStats:v92 cohortType:v80 intendedRequestRatio:v40 uesScore:v85 mitigationAssetVersion:v77 sdsdRetryCount:v52];
            double v27 = self;
          }
          else
          {
            if (a4)
            {
              id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v73 = *MEMORY[0x1E4F502C8];
              uint64_t v99 = *MEMORY[0x1E4F28568];
              v70 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sdsdRetryCount"];
              v100 = v70;
              v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
              *a4 = (id)[v74 initWithDomain:v73 code:2 userInfo:v71];
            }
            id v52 = 0;
            double v27 = 0;
          }
LABEL_65:

          id v22 = v80;
        }
        v53 = v75;
LABEL_67:

        id v7 = v87;
LABEL_68:

LABEL_69:
LABEL_70:

        goto LABEL_71;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v85 = v48;
        goto LABEL_58;
      }
      if (a4)
      {
        id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v65 = *MEMORY[0x1E4F502C8];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        id v77 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"uesScore"];
        id v104 = v77;
        v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        uint64_t v66 = v65;
        id v22 = v80;
        id v67 = (id)[v86 initWithDomain:v66 code:2 userInfo:v53];
        double v27 = 0;
        id v85 = 0;
        *a4 = v67;
        double v25 = v89;
        goto LABEL_67;
      }
      id v85 = 0;
      double v27 = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v46;
        goto LABEL_55;
      }
      if (!a4)
      {
        id v40 = 0;
        double v27 = 0;
        id v7 = v87;
        double v25 = v89;
        goto LABEL_69;
      }
      id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v60 = *MEMORY[0x1E4F502C8];
      uint64_t v105 = *MEMORY[0x1E4F28568];
      id v61 = v22;
      id v62 = [NSString alloc];
      uint64_t v72 = objc_opt_class();
      v63 = v62;
      id v22 = v61;
      id v85 = (id)[v63 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v72, @"intendedRequestRatio"];
      id v106 = v85;
      v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      id v64 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v60, 2);
      double v27 = 0;
      id v40 = 0;
      *a4 = v64;
    }
    id v7 = v87;
    double v25 = v89;
    goto LABEL_68;
  }
  if (a4)
  {
    id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v56 = *MEMORY[0x1E4F502C8];
    uint64_t v107 = *MEMORY[0x1E4F28568];
    id v40 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"cohortType"];
    id v108 = v40;
    uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    v58 = v55;
    id v7 = v87;
    v82 = (void *)v57;
    id v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v56, 2);
    double v27 = 0;
    id v22 = 0;
    *a4 = v59;
    double v25 = v89;

    goto LABEL_70;
  }
  id v22 = 0;
  double v27 = 0;
  double v25 = v89;
LABEL_71:

LABEL_72:
LABEL_74:

  double v9 = v90;
LABEL_75:

LABEL_76:
  return v27;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasAggregationStartTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasNumberOfDaysAggregation) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_aggregationStats;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_cohortType) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIntendedRequestRatio) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasUesScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_mitigationAssetVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasSdsdRetryCount) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStats;
  id v5 = [(BMEventBase *)&v57 init];
  if (!v5) {
    goto LABEL_70;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  double v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v10 = &OBJC_IVAR___BMAeroMLPhotosSearchLabeledData__hasL1Score;
    long long v11 = (int *)MEMORY[0x1E4F940B8];
    long long v12 = &OBJC_IVAR___BMAeroMLPhotosSearchLabeledData__hasL1Score;
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v8]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v11] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v21 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          *((unsigned char *)&v5->super.super.isa + v10[220]) = 1;
          while (1)
          {
            uint64_t v26 = *v7;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v8]) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)&v4[*v11] + v27);
            *(void *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0) {
              goto LABEL_52;
            }
            v23 += 7;
            BOOL v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_54;
            }
          }
          v4[*v9] = 1;
LABEL_52:
          if (v4[*v9]) {
            LODWORD(v25) = 0;
          }
LABEL_54:
          uint64_t v50 = v12[221];
          goto LABEL_59;
        case 2u:
          uint64_t v58 = 0;
          uint64_t v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_72;
          }
          uint64_t v30 = v12;
          uint64_t v31 = v10;
          id v32 = [[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats alloc] initByReadFrom:v4];
          if (!v32) {
            goto LABEL_72;
          }
          id v33 = v32;
          [v6 addObject:v32];
          PBReaderRecallMark();

          id v10 = v31;
          long long v12 = v30;
          continue;
        case 3u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 56;
          goto LABEL_43;
        case 4u:
          v5->_hasIntendedRequestRatio = 1;
          uint64_t v36 = *v7;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v8])
          {
            v38 = *(objc_class **)(*(void *)&v4[*v11] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v38 = 0;
          }
          uint64_t v51 = 64;
          goto LABEL_66;
        case 5u:
          v5->_hasAggregationStartTimestamp = 1;
          uint64_t v39 = *v7;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)&v4[*v8])
          {
            v38 = *(objc_class **)(*(void *)&v4[*v11] + v40);
            *(void *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v38 = 0;
          }
          uint64_t v51 = 40;
          goto LABEL_66;
        case 6u:
          v5->_hasUesScore = 1;
          uint64_t v41 = *v7;
          unint64_t v42 = *(void *)&v4[v41];
          if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(void *)&v4[*v8])
          {
            v38 = *(objc_class **)(*(void *)&v4[*v11] + v42);
            *(void *)&v4[v41] = v42 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v38 = 0;
          }
          uint64_t v51 = 72;
LABEL_66:
          *(Class *)((char *)&v5->super.super.isa + v51) = v38;
          continue;
        case 7u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 80;
LABEL_43:
          uint64_t v43 = *(Class *)((char *)&v5->super.super.isa + v35);
          *(Class *)((char *)&v5->super.super.isa + v35) = (Class)v34;

          continue;
        case 8u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v25 = 0;
          v5->_hasSdsdRetryCount = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_72:

          goto LABEL_69;
      }
      while (1)
      {
        uint64_t v46 = *v7;
        uint64_t v47 = *(void *)&v4[v46];
        unint64_t v48 = v47 + 1;
        if (v47 == -1 || v48 > *(void *)&v4[*v8]) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)&v4[*v11] + v47);
        *(void *)&v4[v46] = v48;
        v25 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0) {
          goto LABEL_56;
        }
        v44 += 7;
        BOOL v20 = v45++ >= 9;
        if (v20)
        {
          LODWORD(v25) = 0;
          goto LABEL_58;
        }
      }
      v4[*v9] = 1;
LABEL_56:
      if (v4[*v9]) {
        LODWORD(v25) = 0;
      }
LABEL_58:
      uint64_t v50 = 32;
LABEL_59:
      *(_DWORD *)((char *)&v5->super.super.isa + v50) = v25;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v52 = [v6 copy];
  aggregationStats = v5->_aggregationStats;
  v5->_aggregationStats = (NSArray *)v52;

  int v54 = v4[*v9];
  if (v54) {
LABEL_69:
  }
    id v55 = 0;
  else {
LABEL_70:
  }
    id v55 = v5;

  return v55;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStartTimestamp];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats numberOfDaysAggregation](self, "numberOfDaysAggregation"));
  uint64_t v7 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self aggregationStats];
  uint64_t v8 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self cohortType];
  double v9 = NSNumber;
  [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self intendedRequestRatio];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  long long v11 = NSNumber;
  [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self uesScore];
  long long v12 = objc_msgSend(v11, "numberWithDouble:");
  char v13 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self mitigationAssetVersion];
  unsigned int v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStats sdsdRetryCount](self, "sdsdRetryCount"));
  unint64_t v15 = (void *)[v3 initWithFormat:@"BMSiriUserEngagementStatisticsAccumulatedAggregationStats with aggregationStartTimestamp: %@, numberOfDaysAggregation: %@, aggregationStats: %@, cohortType: %@, intendedRequestRatio: %@, uesScore: %@, mitigationAssetVersion: %@, sdsdRetryCount: %@", v5, v6, v7, v8, v10, v12, v13, v14];

  return (NSString *)v15;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)initWithAggregationStartTimestamp:(id)a3 numberOfDaysAggregation:(id)a4 aggregationStats:(id)a5 cohortType:(id)a6 intendedRequestRatio:(id)a7 uesScore:(id)a8 mitigationAssetVersion:(id)a9 sdsdRetryCount:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v30 = a5;
  id v29 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v31.receiver = self;
  v31.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStats;
  id v22 = [(BMEventBase *)&v31 init];
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v29, v30);
    if (v16)
    {
      v22->_hasAggregationStartTimestamp = 1;
      [v16 doubleValue];
    }
    else
    {
      v22->_hasAggregationStartTimestamp = 0;
      double v23 = -1.0;
    }
    v22->_aggregationStartTimestamp = v23;
    if (v17)
    {
      v22->_hasNumberOfDaysAggregation = 1;
      int v24 = [v17 intValue];
    }
    else
    {
      v22->_hasNumberOfDaysAggregation = 0;
      int v24 = -1;
    }
    v22->_numberOfDaysAggregation = v24;
    objc_storeStrong((id *)&v22->_aggregationStats, a5);
    objc_storeStrong((id *)&v22->_cohortType, a6);
    if (v18)
    {
      v22->_hasIntendedRequestRatio = 1;
      [v18 doubleValue];
    }
    else
    {
      v22->_hasIntendedRequestRatio = 0;
      double v25 = -1.0;
    }
    v22->_intendedRequestRatio = v25;
    if (v19)
    {
      v22->_hasUesScore = 1;
      [v19 doubleValue];
    }
    else
    {
      v22->_hasUesScore = 0;
      double v26 = -1.0;
    }
    v22->_uesScore = v26;
    objc_storeStrong((id *)&v22->_mitigationAssetVersion, a9);
    if (v21)
    {
      v22->_hasSdsdRetryCount = 1;
      int v27 = [v21 intValue];
    }
    else
    {
      v22->_hasSdsdRetryCount = 0;
      int v27 = -1;
    }
    v22->_sdsdRetryCount = v27;
  }

  return v22;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aggregationStartTimestamp" number:5 type:0 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfDaysAggregation" number:1 type:2 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aggregationStats" number:2 type:14 subMessageClass:objc_opt_class()];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cohortType" number:3 type:13 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intendedRequestRatio" number:4 type:0 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uesScore" number:6 type:0 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mitigationAssetVersion" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sdsdRetryCount" number:8 type:2 subMessageClass:0];
  v12[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF71E8;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aggregationStartTimestamp" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfDaysAggregation" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"aggregationStats_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_296];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cohortType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intendedRequestRatio" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uesScore" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mitigationAssetVersion" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sdsdRetryCount" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  v12[0] = v3;
  v12[1] = v4;
  v12[2] = v5;
  v12[3] = v6;
  v12[4] = v2;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

id __68__BMSiriUserEngagementStatisticsAccumulatedAggregationStats_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _aggregationStatsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end