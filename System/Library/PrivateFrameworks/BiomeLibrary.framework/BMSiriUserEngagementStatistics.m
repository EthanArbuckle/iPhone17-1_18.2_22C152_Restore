@interface BMSiriUserEngagementStatistics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriUserEngagementStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriUserEngagementStatistics)initWithUserEngagementStatsMetadata:(id)a3 dailyAggregatedStats:(id)a4 accumulatedAggregationStats:(id)a5;
- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)dailyAggregatedStats;
- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)userEngagementStatsMetadata;
- (BOOL)isEqual:(id)a3;
- (NSArray)accumulatedAggregationStats;
- (NSString)description;
- (id)_accumulatedAggregationStatsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriUserEngagementStatistics

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"userEngagementStatsMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_381];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"dailyAggregatedStats_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_383];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"accumulatedAggregationStats_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_385];
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v2;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedAggregationStats, 0);
  objc_storeStrong((id *)&self->_dailyAggregatedStats, 0);

  objc_storeStrong((id *)&self->_userEngagementStatsMetadata, 0);
}

- (NSArray)accumulatedAggregationStats
{
  return self->_accumulatedAggregationStats;
}

- (BMSiriUserEngagementStatisticsAccumulatedAggregationStats)dailyAggregatedStats
{
  return self->_dailyAggregatedStats;
}

- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)userEngagementStatsMetadata
{
  return self->_userEngagementStatsMetadata;
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
    v6 = [(BMSiriUserEngagementStatistics *)self userEngagementStatsMetadata];
    uint64_t v7 = [v5 userEngagementStatsMetadata];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriUserEngagementStatistics *)self userEngagementStatsMetadata];
      v10 = [v5 userEngagementStatsMetadata];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMSiriUserEngagementStatistics *)self dailyAggregatedStats];
    uint64_t v14 = [v5 dailyAggregatedStats];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriUserEngagementStatistics *)self dailyAggregatedStats];
      v17 = [v5 dailyAggregatedStats];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMSiriUserEngagementStatistics *)self accumulatedAggregationStats];
    v20 = [v5 accumulatedAggregationStats];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMSiriUserEngagementStatistics *)self accumulatedAggregationStats];
      v22 = [v5 accumulatedAggregationStats];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriUserEngagementStatistics *)self userEngagementStatsMetadata];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMSiriUserEngagementStatistics *)self dailyAggregatedStats];
  v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMSiriUserEngagementStatistics *)self _accumulatedAggregationStatsJSONArray];
  v13[0] = @"userEngagementStatsMetadata";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v8;
  v13[1] = @"dailyAggregatedStats";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v13[2] = @"accumulatedAggregationStats";
  v10 = v7;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (v7)
  {
    if (v6) {
      goto LABEL_9;
    }
LABEL_14:

    if (v4) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v6) {
    goto LABEL_14;
  }
LABEL_9:
  if (v4) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v11;
}

- (id)_accumulatedAggregationStatsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriUserEngagementStatistics *)self accumulatedAggregationStats];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriUserEngagementStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"userEngagementStatsMetadata"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        v30 = a4;
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v71 = *MEMORY[0x1E4F28568];
        v8 = (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"userEngagementStatsMetadata"];
        v72[0] = v8;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
        v26 = 0;
        id *v30 = (id)[v29 initWithDomain:v31 code:2 userInfo:v9];
        goto LABEL_50;
      }
      v26 = 0;
      goto LABEL_51;
    }
    id v9 = v7;
    id v61 = 0;
    v8 = [[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata alloc] initWithJSONDictionary:v9 error:&v61];
    id v14 = v61;
    if (v14)
    {
      v15 = v14;
      if (a4) {
        *a4 = v14;
      }

LABEL_37:
      v26 = 0;
      goto LABEL_50;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"dailyAggregatedStats"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      v49 = a4;
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      uint64_t v70 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"dailyAggregatedStats"];
      v10 = (BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)v70;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v26 = 0;
      id *v49 = (id)[v32 initWithDomain:v33 code:2 userInfo:v11];
      goto LABEL_49;
    }
    goto LABEL_37;
  }
  id v11 = v9;
  id v60 = 0;
  v10 = [[BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc] initWithJSONDictionary:v11 error:&v60];
  id v27 = v60;
  if (v27)
  {
    v28 = v27;
    if (a4) {
      *a4 = v27;
    }

    goto LABEL_54;
  }

LABEL_7:
  id v11 = [v6 objectForKeyedSubscript:@"accumulatedAggregationStats"];
  long long v12 = [MEMORY[0x1E4F1CA98] null];
  int v13 = [v11 isEqual:v12];

  v54 = v7;
  if (!v13)
  {
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v50 = v8;
      v51 = v10;
      v48 = a4;
      id v52 = v6;
      goto LABEL_17;
    }
    if (a4)
    {
      id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v67 = *MEMORY[0x1E4F28568];
      uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"accumulatedAggregationStats"];
      v68 = v16;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v43 = v10;
      v45 = v44 = a4;
      id *v44 = (id)[v53 initWithDomain:v42 code:2 userInfo:v45];
      v10 = v43;

      v26 = 0;
      goto LABEL_48;
    }
LABEL_54:
    v26 = 0;
    goto LABEL_49;
  }
  v50 = v8;
  v51 = v10;
  v48 = a4;
  id v52 = v6;

  id v11 = 0;
LABEL_17:
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = v11;
  uint64_t v17 = [v11 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (!v17) {
    goto LABEL_27;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v57;
  v46 = self;
  id v47 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v57 != v19) {
        objc_enumerationMutation(v11);
      }
      v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self = v46;
        v34 = v48;
        v8 = v50;
        if (v48)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v64 = *MEMORY[0x1E4F28568];
          id v22 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"accumulatedAggregationStats"];
          id v65 = v22;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v65;
          v39 = &v64;
LABEL_42:
          v40 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
          id *v34 = (id)[v35 initWithDomain:v36 code:2 userInfo:v40];
LABEL_46:
        }
LABEL_47:

        v26 = 0;
        v10 = v51;
        id v6 = v52;
        id v9 = v47;
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v46;
        v34 = v48;
        v8 = v50;
        if (v48)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v62 = *MEMORY[0x1E4F28568];
          id v22 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"accumulatedAggregationStats"];
          id v63 = v22;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v63;
          v39 = &v62;
          goto LABEL_42;
        }
        goto LABEL_47;
      }
      id v22 = v21;
      v23 = [BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc];
      id v55 = 0;
      v24 = [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)v23 initWithJSONDictionary:v22 error:&v55];
      id v25 = v55;
      if (v25)
      {
        v40 = v25;
        if (v48) {
          id *v48 = v25;
        }

        self = v46;
        v8 = v50;
        goto LABEL_46;
      }
      [v16 addObject:v24];
    }
    uint64_t v18 = [v11 countByEnumeratingWithState:&v56 objects:v66 count:16];
    self = v46;
    id v9 = v47;
    if (v18) {
      continue;
    }
    break;
  }
LABEL_27:

  v8 = v50;
  v10 = v51;
  self = [(BMSiriUserEngagementStatistics *)self initWithUserEngagementStatsMetadata:v50 dailyAggregatedStats:v51 accumulatedAggregationStats:v16];
  v26 = self;
  id v6 = v52;
LABEL_48:

  uint64_t v7 = v54;
LABEL_49:

LABEL_50:
LABEL_51:

  return v26;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriUserEngagementStatistics *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_userEngagementStatsMetadata)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self->_userEngagementStatsMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_dailyAggregatedStats)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriUserEngagementStatisticsAccumulatedAggregationStats *)self->_dailyAggregatedStats writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_accumulatedAggregationStats;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        uint64_t v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (void)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriUserEngagementStatistics;
  uint64_t v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_35;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v9]) {
        goto LABEL_34;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        if (v12++ >= 9)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        goto LABEL_34;
      }
      unint64_t v21 = v13 >> 3;
      if ((v13 >> 3) == 1) {
        break;
      }
      if (v21 == 2)
      {
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_36;
        }
        id v25 = [[BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc] initByReadFrom:v4];
        if (!v25) {
          goto LABEL_36;
        }
        v26 = v25;
        [v6 addObject:v25];
        PBReaderRecallMark();
      }
      else
      {
        if (v21 == 3)
        {
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_36;
          }
          id v22 = [[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata alloc] initByReadFrom:v4];
          if (!v22) {
            goto LABEL_36;
          }
          uint64_t v23 = 24;
LABEL_28:
          v24 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = v22;

          PBReaderRecallMark();
          goto LABEL_33;
        }
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_36;
        }
      }
LABEL_33:
      if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
        goto LABEL_34;
      }
    }
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    if ((PBReaderPlaceMark() & 1) == 0
      || (id v22 = [[BMSiriUserEngagementStatisticsAccumulatedAggregationStats alloc] initByReadFrom:v4]) == 0)
    {
LABEL_36:

      goto LABEL_37;
    }
    uint64_t v23 = 32;
    goto LABEL_28;
  }
LABEL_34:
  uint64_t v27 = [v6 copy];
  accumulatedAggregationStats = v5->_accumulatedAggregationStats;
  v5->_accumulatedAggregationStats = (NSArray *)v27;

  int v29 = v4[*v9];
  if (v29) {
LABEL_37:
  }
    v30 = 0;
  else {
LABEL_35:
  }
    v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriUserEngagementStatistics *)self userEngagementStatsMetadata];
  uint64_t v5 = [(BMSiriUserEngagementStatistics *)self dailyAggregatedStats];
  uint64_t v6 = [(BMSiriUserEngagementStatistics *)self accumulatedAggregationStats];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSiriUserEngagementStatistics with userEngagementStatsMetadata: %@, dailyAggregatedStats: %@, accumulatedAggregationStats: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriUserEngagementStatistics)initWithUserEngagementStatsMetadata:(id)a3 dailyAggregatedStats:(id)a4 accumulatedAggregationStats:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriUserEngagementStatistics;
  unsigned int v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_userEngagementStatsMetadata, a3);
    objc_storeStrong((id *)&v12->_dailyAggregatedStats, a4);
    objc_storeStrong((id *)&v12->_accumulatedAggregationStats, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userEngagementStatsMetadata" number:3 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"dailyAggregatedStats", 1, 14, objc_opt_class(), v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accumulatedAggregationStats" number:2 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7200;
}

id __41__BMSiriUserEngagementStatistics_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _accumulatedAggregationStatsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __41__BMSiriUserEngagementStatistics_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 dailyAggregatedStats];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __41__BMSiriUserEngagementStatistics_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 userEngagementStatsMetadata];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSiriUserEngagementStatistics alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end