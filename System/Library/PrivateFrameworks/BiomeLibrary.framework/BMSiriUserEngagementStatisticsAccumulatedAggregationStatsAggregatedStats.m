@interface BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats)initWithTriggeredMechanism:(int)a3 requestCount:(id)a4 intendedRequestCount:(id)a5 unintendedRequestCount:(id)a6 intendedRequestRatio:(id)a7 triggeredMechanismRequestRatio:(id)a8 modelVersion:(id)a9;
- (BOOL)hasIntendedRequestCount;
- (BOOL)hasIntendedRequestRatio;
- (BOOL)hasRequestCount;
- (BOOL)hasTriggeredMechanismRequestRatio;
- (BOOL)hasUnintendedRequestCount;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)modelVersion;
- (double)intendedRequestRatio;
- (double)triggeredMechanismRequestRatio;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)intendedRequestCount;
- (int)requestCount;
- (int)triggeredMechanism;
- (int)unintendedRequestCount;
- (unsigned)dataVersion;
- (void)setHasIntendedRequestCount:(BOOL)a3;
- (void)setHasIntendedRequestRatio:(BOOL)a3;
- (void)setHasRequestCount:(BOOL)a3;
- (void)setHasTriggeredMechanismRequestRatio:(BOOL)a3;
- (void)setHasUnintendedRequestCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats

- (void).cxx_destruct
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setHasTriggeredMechanismRequestRatio:(BOOL)a3
{
  self->_hasTriggeredMechanismRequestRatio = a3;
}

- (BOOL)hasTriggeredMechanismRequestRatio
{
  return self->_hasTriggeredMechanismRequestRatio;
}

- (double)triggeredMechanismRequestRatio
{
  return self->_triggeredMechanismRequestRatio;
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

- (void)setHasUnintendedRequestCount:(BOOL)a3
{
  self->_hasUnintendedRequestCount = a3;
}

- (BOOL)hasUnintendedRequestCount
{
  return self->_hasUnintendedRequestCount;
}

- (int)unintendedRequestCount
{
  return self->_unintendedRequestCount;
}

- (void)setHasIntendedRequestCount:(BOOL)a3
{
  self->_hasIntendedRequestCount = a3;
}

- (BOOL)hasIntendedRequestCount
{
  return self->_hasIntendedRequestCount;
}

- (int)intendedRequestCount
{
  return self->_intendedRequestCount;
}

- (void)setHasRequestCount:(BOOL)a3
{
  self->_hasRequestCount = a3;
}

- (BOOL)hasRequestCount
{
  return self->_hasRequestCount;
}

- (int)requestCount
{
  return self->_requestCount;
}

- (int)triggeredMechanism
{
  return self->_triggeredMechanism;
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
    int v6 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self triggeredMechanism];
    if (v6 != [v5 triggeredMechanism]) {
      goto LABEL_31;
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasRequestCount](self, "hasRequestCount")|| [v5 hasRequestCount])
    {
      if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self hasRequestCount])goto LABEL_31; {
      if (![v5 hasRequestCount])
      }
        goto LABEL_31;
      int v7 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self requestCount];
      if (v7 != [v5 requestCount]) {
        goto LABEL_31;
      }
    }
    if (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestCount](self, "hasIntendedRequestCount")|| [v5 hasIntendedRequestCount])
    {
      if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self hasIntendedRequestCount])goto LABEL_31; {
      if (![v5 hasIntendedRequestCount])
      }
        goto LABEL_31;
      int v8 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self intendedRequestCount];
      if (v8 != [v5 intendedRequestCount]) {
        goto LABEL_31;
      }
    }
    if ((!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasUnintendedRequestCount](self, "hasUnintendedRequestCount")&& ![v5 hasUnintendedRequestCount]|| -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasUnintendedRequestCount](self, "hasUnintendedRequestCount")&& objc_msgSend(v5, "hasUnintendedRequestCount")&& (int v9 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"), v9 == objc_msgSend(v5, "unintendedRequestCount")))&& (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")&& !objc_msgSend(v5, "hasIntendedRequestRatio")|| -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasIntendedRequestRatio](self, "hasIntendedRequestRatio")&& objc_msgSend(v5, "hasIntendedRequestRatio")
       && (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestRatio](self, "intendedRequestRatio"), double v11 = v10, [v5 intendedRequestRatio], v11 == v12))&& (!-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasTriggeredMechanismRequestRatio](self, "hasTriggeredMechanismRequestRatio")&& !objc_msgSend(v5, "hasTriggeredMechanismRequestRatio")|| -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats hasTriggeredMechanismRequestRatio](self, "hasTriggeredMechanismRequestRatio")&& objc_msgSend(v5, "hasTriggeredMechanismRequestRatio")&& (-[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanismRequestRatio](self, "triggeredMechanismRequestRatio"), v14 = v13, objc_msgSend(v5, "triggeredMechanismRequestRatio"), v14 == v15)))
    {
      v16 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self modelVersion];
      v17 = [v5 modelVersion];
      if (v16 == v17)
      {
        char v20 = 1;
      }
      else
      {
        v18 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self modelVersion];
        v19 = [v5 modelVersion];
        char v20 = [v18 isEqual:v19];
      }
    }
    else
    {
LABEL_31:
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (id)jsonDictionary
{
  v28[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats triggeredMechanism](self, "triggeredMechanism"));
  if ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self hasRequestCount])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats requestCount](self, "requestCount"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self hasIntendedRequestCount])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestCount](self, "intendedRequestCount"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self hasUnintendedRequestCount])
  {
    v26 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"));
  }
  else
  {
    v26 = 0;
  }
  if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self hasIntendedRequestRatio]|| ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self intendedRequestRatio], fabs(v6) == INFINITY))
  {
    int v8 = 0;
  }
  else
  {
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self intendedRequestRatio];
    int v7 = NSNumber;
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self intendedRequestRatio];
    int v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  if (![(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self hasTriggeredMechanismRequestRatio]|| ([(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self triggeredMechanismRequestRatio], fabs(v9) == INFINITY))
  {
    double v11 = 0;
  }
  else
  {
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self triggeredMechanismRequestRatio];
    double v10 = NSNumber;
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self triggeredMechanismRequestRatio];
    double v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  double v12 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self modelVersion];
  v27[0] = @"triggeredMechanism";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v13;
  v28[0] = v13;
  v27[1] = @"requestCount";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v3;
  v22 = (void *)v14;
  v28[1] = v14;
  v27[2] = @"intendedRequestCount";
  double v15 = v5;
  if (!v5)
  {
    double v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v4;
  v28[2] = v15;
  v27[3] = @"unintendedRequestCount";
  v16 = v26;
  if (!v26)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[3] = v16;
  v27[4] = @"intendedRequestRatio";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v17;
  v27[5] = @"triggeredMechanismRequestRatio";
  v18 = v11;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v18;
  v27[6] = @"modelVersion";
  v19 = v12;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v19;
  char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
  if (v12)
  {
    if (v11) {
      goto LABEL_34;
    }
LABEL_45:

    if (v8) {
      goto LABEL_35;
    }
    goto LABEL_46;
  }

  if (!v11) {
    goto LABEL_45;
  }
LABEL_34:
  if (v8) {
    goto LABEL_35;
  }
LABEL_46:

LABEL_35:
  if (!v26) {

  }
  if (!v5) {
  if (v24)
  }
  {
    if (v25) {
      goto LABEL_41;
    }
  }
  else
  {

    if (v25) {
      goto LABEL_41;
    }
  }

LABEL_41:

  return v20;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"triggeredMechanism"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v8 = 0;
LABEL_9:
    double v10 = [v6 objectForKeyedSubscript:@"requestCount"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v21 = 0;
          goto LABEL_34;
        }
        v24 = a4;
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v71 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"requestCount"];
        id v83 = v71;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        id v28 = (id)[v25 initWithDomain:v26 code:2 userInfo:v27];
        v21 = 0;
        id v11 = 0;
        id *v24 = v28;
        double v12 = (void *)v27;
        goto LABEL_33;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    double v12 = [v6 objectForKeyedSubscript:@"intendedRequestCount"];
    v68 = v10;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v71 = 0;
          v21 = 0;
          goto LABEL_33;
        }
        v70 = a4;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        id v31 = v11;
        id v32 = [NSString alloc];
        uint64_t v58 = objc_opt_class();
        v33 = v32;
        id v11 = v31;
        v22 = (void *)[v33 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v58, @"intendedRequestCount"];
        v81 = v22;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        id v34 = (id)[v29 initWithDomain:v30 code:2 userInfo:v13];
        v21 = 0;
        id v71 = 0;
        id *v70 = v34;
LABEL_32:

        double v10 = v68;
LABEL_33:

        goto LABEL_34;
      }
      id v71 = v12;
    }
    else
    {
      id v71 = 0;
    }
    uint64_t v13 = [v6 objectForKeyedSubscript:@"unintendedRequestCount"];
    v64 = v12;
    v65 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          v21 = 0;
          goto LABEL_32;
        }
        v35 = a4;
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v78 = *MEMORY[0x1E4F28568];
        id v38 = v11;
        id v39 = [NSString alloc];
        uint64_t v59 = objc_opt_class();
        v40 = v39;
        id v11 = v38;
        id v69 = (id)[v40 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v59, @"unintendedRequestCount"];
        id v79 = v69;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        id v41 = (id)[v36 initWithDomain:v37 code:2 userInfo:v14];
        v21 = 0;
        v22 = 0;
        id *v35 = v41;
        double v12 = v64;
        goto LABEL_31;
      }
      id v67 = v13;
    }
    else
    {
      id v67 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"intendedRequestRatio"];
    v66 = v8;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v69 = 0;
          v21 = 0;
          goto LABEL_30;
        }
        v17 = self;
        v42 = a4;
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        id v45 = v11;
        id v46 = [NSString alloc];
        uint64_t v60 = objc_opt_class();
        v47 = v46;
        id v11 = v45;
        id v18 = (id)[v47 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v60, @"intendedRequestRatio"];
        id v77 = v18;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        id v48 = (id)[v43 initWithDomain:v44 code:2 userInfo:v16];
        v21 = 0;
        id v69 = 0;
        id *v42 = v48;
        goto LABEL_69;
      }
      double v15 = a4;
      id v69 = v14;
    }
    else
    {
      double v15 = a4;
      id v69 = 0;
    }
    v16 = [v6 objectForKeyedSubscript:@"triggeredMechanismRequestRatio"];
    id v63 = v11;
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v17 = self;
      id v18 = 0;
      goto LABEL_24;
    }
    objc_opt_class();
    v17 = self;
    if (objc_opt_isKindOfClass())
    {
      id v18 = v16;
LABEL_24:
      v19 = [v6 objectForKeyedSubscript:@"modelVersion"];
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v15)
          {
            id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v61 = *MEMORY[0x1E4F502C8];
            uint64_t v72 = *MEMORY[0x1E4F28568];
            v56 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"modelVersion"];
            v73 = v56;
            v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
            *double v15 = (id)[v62 initWithDomain:v61 code:2 userInfo:v57];
          }
          id v20 = 0;
          v21 = 0;
          goto LABEL_28;
        }
        id v20 = v19;
      }
      else
      {
        id v20 = 0;
      }
      v21 = -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats initWithTriggeredMechanism:requestCount:intendedRequestCount:unintendedRequestCount:intendedRequestRatio:triggeredMechanismRequestRatio:modelVersion:](v17, "initWithTriggeredMechanism:requestCount:intendedRequestCount:unintendedRequestCount:intendedRequestRatio:triggeredMechanismRequestRatio:modelVersion:", [v66 intValue], v63, v71, v67, v69, v18, v20);
      v17 = v21;
LABEL_28:
      double v12 = v64;

      id v11 = v63;
LABEL_29:

      self = v17;
      int v8 = v66;
LABEL_30:
      v22 = v67;
LABEL_31:

      int v7 = v65;
      goto LABEL_32;
    }
    if (v15)
    {
      id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v54 = *MEMORY[0x1E4F502C8];
      uint64_t v74 = *MEMORY[0x1E4F28568];
      id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"triggeredMechanismRequestRatio"];
      id v75 = v20;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      id v55 = (id)[v53 initWithDomain:v54 code:2 userInfo:v19];
      v21 = 0;
      id v18 = 0;
      *double v15 = v55;
      goto LABEL_28;
    }
    id v18 = 0;
    v21 = 0;
LABEL_69:
    double v12 = v64;
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    int v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    int v8 = 0;
    v21 = 0;
    goto LABEL_35;
  }
  v49 = a4;
  id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v51 = *MEMORY[0x1E4F502C8];
  uint64_t v84 = *MEMORY[0x1E4F28568];
  id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"triggeredMechanism"];
  v85[0] = v11;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
  id v52 = (id)[v50 initWithDomain:v51 code:2 userInfo:v10];
  int v8 = 0;
  v21 = 0;
  id *v49 = v52;
LABEL_34:

LABEL_35:
  return v21;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasRequestCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIntendedRequestCount) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v4 = v5;
  if (self->_hasUnintendedRequestCount)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasIntendedRequestRatio)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_hasTriggeredMechanismRequestRatio)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
  if (self->_modelVersion)
  {
    PBDataWriterWriteStringField();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats;
  id v5 = [(BMEventBase *)&v57 init];
  if (!v5) {
    goto LABEL_84;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasRequestCount = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_58;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_60;
            }
          }
          v4[*v8] = 1;
LABEL_58:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_60:
          uint64_t v53 = 32;
          goto LABEL_69;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          v5->_hasIntendedRequestCount = 1;
          while (2)
          {
            uint64_t v29 = *v6;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_64:
          uint64_t v53 = 36;
          goto LABEL_69;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v22 = 0;
          v5->_hasUnintendedRequestCount = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_68:
          uint64_t v53 = 40;
LABEL_69:
          *(_DWORD *)((char *)&v5->super.super.isa + v53) = v22;
          continue;
        case 4u:
          v5->_hasIntendedRequestRatio = 1;
          uint64_t v39 = *v6;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)&v4[*v7])
          {
            id v41 = *(objc_class **)(*(void *)&v4[*v9] + v40);
            *(void *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v41 = 0;
          }
          uint64_t v54 = 48;
          goto LABEL_80;
        case 5u:
          v5->_hasTriggeredMechanismRequestRatio = 1;
          uint64_t v42 = *v6;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)&v4[*v7])
          {
            id v41 = *(objc_class **)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v43 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v41 = 0;
          }
          uint64_t v54 = 56;
LABEL_80:
          *(Class *)((char *)&v5->super.super.isa + v54) = v41;
          continue;
        case 6u:
          uint64_t v44 = PBReaderReadString();
          modelVersion = v5->_modelVersion;
          v5->_modelVersion = (NSString *)v44;

          continue;
        case 7u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_83;
          }
          continue;
      }
      while (1)
      {
        uint64_t v49 = *v6;
        uint64_t v50 = *(void *)&v4[v49];
        unint64_t v51 = v50 + 1;
        if (v50 == -1 || v51 > *(void *)&v4[*v7]) {
          break;
        }
        char v52 = *(unsigned char *)(*(void *)&v4[*v9] + v50);
        *(void *)&v4[v49] = v51;
        v48 |= (unint64_t)(v52 & 0x7F) << v46;
        if ((v52 & 0x80) == 0) {
          goto LABEL_71;
        }
        v46 += 7;
        BOOL v17 = v47++ >= 9;
        if (v17)
        {
          LODWORD(v48) = 0;
          goto LABEL_73;
        }
      }
      v4[*v8] = 1;
LABEL_71:
      if (v4[*v8]) {
        LODWORD(v48) = 0;
      }
LABEL_73:
      if (v48 >= 4) {
        LODWORD(v48) = 0;
      }
      v5->_triggeredMechanism = v48;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_83:
  }
    id v55 = 0;
  else {
LABEL_84:
  }
    id v55 = v5;

  return v55;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismAsString([(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self triggeredMechanism]);
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats requestCount](self, "requestCount"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats intendedRequestCount](self, "intendedRequestCount"));
  int v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats unintendedRequestCount](self, "unintendedRequestCount"));
  int v8 = NSNumber;
  [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self intendedRequestRatio];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = NSNumber;
  [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self triggeredMechanismRequestRatio];
  unsigned int v11 = objc_msgSend(v10, "numberWithDouble:");
  unint64_t v12 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats *)self modelVersion];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats with triggeredMechanism: %@, requestCount: %@, intendedRequestCount: %@, unintendedRequestCount: %@, intendedRequestRatio: %@, triggeredMechanismRequestRatio: %@, modelVersion: %@", v4, v5, v6, v7, v9, v11, v12];

  return (NSString *)v13;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats)initWithTriggeredMechanism:(int)a3 requestCount:(id)a4 intendedRequestCount:(id)a5 unintendedRequestCount:(id)a6 intendedRequestRatio:(id)a7 triggeredMechanismRequestRatio:(id)a8 modelVersion:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats;
  unsigned int v21 = [(BMEventBase *)&v28 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v21->_triggeredMechanism = a3;
    if (v15)
    {
      v21->_hasRequestCount = 1;
      int v22 = [v15 intValue];
    }
    else
    {
      v21->_hasRequestCount = 0;
      int v22 = -1;
    }
    v21->_requestCount = v22;
    if (v16)
    {
      v21->_hasIntendedRequestCount = 1;
      int v23 = [v16 intValue];
    }
    else
    {
      v21->_hasIntendedRequestCount = 0;
      int v23 = -1;
    }
    v21->_intendedRequestCount = v23;
    if (v17)
    {
      v21->_hasUnintendedRequestCount = 1;
      int v24 = [v17 intValue];
    }
    else
    {
      v21->_hasUnintendedRequestCount = 0;
      int v24 = -1;
    }
    v21->_unintendedRequestCount = v24;
    if (v18)
    {
      v21->_hasIntendedRequestRatio = 1;
      [v18 doubleValue];
    }
    else
    {
      v21->_hasIntendedRequestRatio = 0;
      double v25 = -1.0;
    }
    v21->_intendedRequestRatio = v25;
    if (v19)
    {
      v21->_hasTriggeredMechanismRequestRatio = 1;
      [v19 doubleValue];
    }
    else
    {
      v21->_hasTriggeredMechanismRequestRatio = 0;
      double v26 = -1.0;
    }
    v21->_triggeredMechanismRequestRatio = v26;
    objc_storeStrong((id *)&v21->_modelVersion, a9);
  }

  return v21;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"triggeredMechanism" number:7 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"requestCount", 1, 2, 0, v2);
  v11[1] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intendedRequestCount" number:2 type:2 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"unintendedRequestCount" number:3 type:2 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intendedRequestRatio" number:4 type:0 subMessageClass:0];
  v11[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"triggeredMechanismRequestRatio" number:5 type:0 subMessageClass:0];
  v11[5] = v7;
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelVersion" number:6 type:13 subMessageClass:0];
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF71D0;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"triggeredMechanism" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestCount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intendedRequestCount" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"unintendedRequestCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intendedRequestRatio" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"triggeredMechanismRequestRatio" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelVersion" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  v11[3] = v6;
  v11[4] = v7;
  v11[5] = v8;
  v11[6] = v2;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    int v8 = [[BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStats alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
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