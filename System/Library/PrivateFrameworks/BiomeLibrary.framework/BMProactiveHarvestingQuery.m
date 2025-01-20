@interface BMProactiveHarvestingQuery
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingQuery)initWithAbsoluteTimestamp:(id)a3 query:(id)a4 results:(id)a5 uniqueID:(id)a6 contentProtection:(id)a7 personaId:(id)a8;
- (BMProactiveHarvestingQuery)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)results;
- (NSDate)absoluteTimestamp;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)personaId;
- (NSString)query;
- (NSString)uniqueID;
- (id)_resultsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)results
{
  return self->_results;
}

- (NSString)query
{
  return self->_query;
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
    v6 = [(BMProactiveHarvestingQuery *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingQuery *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMProactiveHarvestingQuery *)self query];
    uint64_t v14 = [v5 query];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingQuery *)self query];
      v17 = [v5 query];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMProactiveHarvestingQuery *)self results];
    uint64_t v20 = [v5 results];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingQuery *)self results];
      v23 = [v5 results];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    v25 = [(BMProactiveHarvestingQuery *)self uniqueID];
    uint64_t v26 = [v5 uniqueID];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingQuery *)self uniqueID];
      v29 = [v5 uniqueID];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_21;
      }
    }
    v31 = [(BMProactiveHarvestingQuery *)self contentProtection];
    uint64_t v32 = [v5 contentProtection];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingQuery *)self contentProtection];
      v35 = [v5 contentProtection];
      int v36 = [v34 isEqual:v35];

      if (!v36)
      {
LABEL_21:
        char v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v38 = [(BMProactiveHarvestingQuery *)self personaId];
    v39 = [v5 personaId];
    if (v38 == v39)
    {
      char v12 = 1;
    }
    else
    {
      v40 = [(BMProactiveHarvestingQuery *)self personaId];
      v41 = [v5 personaId];
      char v12 = [v40 isEqual:v41];
    }
    goto LABEL_22;
  }
  char v12 = 0;
LABEL_23:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMProactiveHarvestingQuery *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMProactiveHarvestingQuery *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMProactiveHarvestingQuery *)self query];
  v8 = [(BMProactiveHarvestingQuery *)self _resultsJSONArray];
  v9 = [(BMProactiveHarvestingQuery *)self uniqueID];
  v10 = [(BMProactiveHarvestingQuery *)self contentProtection];
  int v11 = [(BMProactiveHarvestingQuery *)self personaId];
  v24[0] = @"absoluteTimestamp";
  uint64_t v12 = v6;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v12;
  v25[0] = v12;
  v24[1] = @"query";
  uint64_t v13 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = v13;
  v25[1] = v13;
  v24[2] = @"results";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v13, v22);
  }
  v23 = (void *)v6;
  v25[2] = v14;
  v24[3] = @"uniqueID";
  v15 = v9;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v15;
  v24[4] = @"contentProtection";
  v16 = v10;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v16;
  v24[5] = @"personaId";
  v17 = v11;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v17;
  int v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  if (v11)
  {
    if (v10) {
      goto LABEL_18;
    }
LABEL_26:

    if (v9) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v10) {
    goto LABEL_26;
  }
LABEL_18:
  if (v9) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:
  if (v8)
  {
    if (v7) {
      goto LABEL_21;
    }
LABEL_29:

    if (v23) {
      goto LABEL_22;
    }
    goto LABEL_30;
  }

  if (!v7) {
    goto LABEL_29;
  }
LABEL_21:
  if (v23) {
    goto LABEL_22;
  }
LABEL_30:

LABEL_22:

  return v18;
}

- (id)_resultsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingQuery *)self results];
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

- (BMProactiveHarvestingQuery)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v6;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSinceReferenceDate:v12];
LABEL_6:
    uint64_t v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v53 = *MEMORY[0x1E4F502C8];
        uint64_t v96 = *MEMORY[0x1E4F28568];
        v54 = self;
        id v55 = [NSString alloc];
        uint64_t v62 = objc_opt_class();
        v56 = v55;
        self = v54;
        id v17 = (id)[v56 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", v62, @"absoluteTimestamp"];
        v97[0] = v17;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:&v96 count:1];
        id v57 = (id)[v52 initWithDomain:v53 code:2 userInfo:v16];
        uint64_t v7 = 0;
        int v36 = 0;
        *a4 = v57;
        goto LABEL_64;
      }
      uint64_t v7 = 0;
      int v36 = 0;
      goto LABEL_65;
    }
    id v13 = v6;
    goto LABEL_6;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v7 = [v14 dateFromString:v6];

LABEL_9:
  uint64_t v15 = [v5 objectForKeyedSubscript:@"query"];
  v71 = (void *)v15;
  v72 = v6;
  if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v31 = v7;
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v94 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"query"];
        id v95 = v18;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        v35 = v32;
        uint64_t v7 = v31;
        v75 = (void *)v34;
        int v36 = 0;
        id v17 = 0;
        *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v33, 2);

        goto LABEL_63;
      }
      id v17 = 0;
      int v36 = 0;
      goto LABEL_64;
    }
    v70 = v7;
    id v17 = v16;
  }
  else
  {
    v70 = v7;
    id v17 = 0;
  }
  id v18 = [v5 objectForKeyedSubscript:@"results"];
  v19 = [MEMORY[0x1E4F1CA98] null];
  int v20 = [v18 isEqual:v19];

  id v69 = v17;
  if (v20)
  {
    v67 = self;

    id v18 = 0;
  }
  else
  {
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          int v36 = 0;
          uint64_t v7 = v70;
          goto LABEL_63;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v92 = *MEMORY[0x1E4F28568];
        v74 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"results"];
        v93 = v74;
        id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        int v36 = 0;
        *a4 = (id)[v45 initWithDomain:v46 code:2 userInfo:v30];
LABEL_46:
        uint64_t v7 = v70;
        goto LABEL_61;
      }
    }
    v67 = self;
  }
  v74 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v18 = v18;
  uint64_t v21 = [v18 countByEnumeratingWithState:&v77 objects:v91 count:16];
  if (!v21) {
    goto LABEL_27;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v78;
  id v66 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v78 != v23) {
        objc_enumerationMutation(v18);
      }
      v25 = *(void **)(*((void *)&v77 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = a4;
        if (a4)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v89 = *MEMORY[0x1E4F28568];
          id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"results"];
          id v90 = v26;
          id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          v41 = v38;
          uint64_t v42 = v39;
LABEL_38:
          int v36 = 0;
          id *v37 = (id)[v41 initWithDomain:v42 code:2 userInfo:v40];
LABEL_42:
          id v30 = v18;
          id v5 = v66;
          self = v67;
          goto LABEL_59;
        }
        goto LABEL_45;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v37 = a4;
        if (a4)
        {
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v87 = *MEMORY[0x1E4F28568];
          id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"results"];
          id v88 = v26;
          id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          v41 = v43;
          uint64_t v42 = v44;
          goto LABEL_38;
        }
LABEL_45:
        int v36 = 0;
        id v30 = v18;
        id v5 = v66;
        self = v67;
        goto LABEL_46;
      }
      id v26 = v25;
      v27 = [BMProactiveHarvestingQueryResult alloc];
      id v76 = 0;
      v28 = [(BMProactiveHarvestingQueryResult *)v27 initWithJSONDictionary:v26 error:&v76];
      id v29 = v76;
      if (v29)
      {
        id v40 = v29;
        if (a4) {
          *a4 = v29;
        }

        int v36 = 0;
        goto LABEL_42;
      }
      [v74 addObject:v28];
    }
    uint64_t v22 = [v18 countByEnumeratingWithState:&v77 objects:v91 count:16];
    id v5 = v66;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_27:

  id v26 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (!v26)
  {
    id v30 = 0;
    self = v67;
    goto LABEL_50;
  }
  objc_opt_class();
  self = v67;
  if (objc_opt_isKindOfClass())
  {
    id v30 = 0;
LABEL_50:
    v47 = [v5 objectForKeyedSubscript:@"contentProtection"];
    if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v47;
        goto LABEL_53;
      }
      if (a4)
      {
        id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        id v49 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
        id v84 = v49;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id v59 = (id)[v68 initWithDomain:v58 code:2 userInfo:v48];
        int v36 = 0;
        id v40 = 0;
        *a4 = v59;
        goto LABEL_57;
      }
      id v40 = 0;
      int v36 = 0;
    }
    else
    {
      id v40 = 0;
LABEL_53:
      v48 = [v5 objectForKeyedSubscript:@"personaId"];
      if (!v48 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v49 = 0;
        goto LABEL_56;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v49 = v48;
LABEL_56:
        self = [(BMProactiveHarvestingQuery *)self initWithAbsoluteTimestamp:v70 query:v69 results:v74 uniqueID:v30 contentProtection:v40 personaId:v49];
        int v36 = self;
      }
      else
      {
        if (a4)
        {
          id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v63 = *MEMORY[0x1E4F502C8];
          uint64_t v81 = *MEMORY[0x1E4F28568];
          v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
          v82 = v60;
          v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
          *a4 = (id)[v65 initWithDomain:v63 code:2 userInfo:v61];
        }
        id v49 = 0;
        int v36 = 0;
      }
LABEL_57:
    }
LABEL_58:

LABEL_59:
    uint64_t v7 = v70;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = v26;
      goto LABEL_50;
    }
    if (a4)
    {
      id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v51 = *MEMORY[0x1E4F502C8];
      uint64_t v85 = *MEMORY[0x1E4F28568];
      id v40 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
      id v86 = v40;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      int v36 = 0;
      id v30 = 0;
      *a4 = (id)[v64 initWithDomain:v51 code:2 userInfo:v47];
      goto LABEL_58;
    }
    id v30 = 0;
    int v36 = 0;
    uint64_t v7 = v70;
  }

LABEL_61:
  id v17 = v69;

LABEL_63:
  uint64_t v16 = v71;
  uint64_t v6 = v72;
LABEL_64:

LABEL_65:
  return v36;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMProactiveHarvestingQuery *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_query) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_results;
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

  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMProactiveHarvestingQuery;
  id v5 = [(BMEventBase *)&v34 init];
  if (!v5)
  {
LABEL_38:
    id v32 = v5;
    goto LABEL_39;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_36:
    uint64_t v29 = [v6 copy];
    results = v5->_results;
    v5->_results = (NSArray *)v29;

    int v31 = v4[*v9];
    if (v31) {
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  id v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_36;
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
      goto LABEL_36;
    }
    switch((v13 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
        uint64_t v21 = *v7;
        unint64_t v22 = *(void *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
        {
          double v23 = *(double *)(*(void *)&v4[*v10] + v22);
          *(void *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v23 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v23;
        goto LABEL_35;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 40;
        goto LABEL_32;
      case 3u:
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_40;
        }
        id v26 = [[BMProactiveHarvestingQueryResult alloc] initByReadFrom:v4];
        if (!v26) {
          goto LABEL_40;
        }
        v27 = v26;
        [v6 addObject:v26];
        PBReaderRecallMark();

        goto LABEL_35;
      case 4u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 56;
        goto LABEL_32;
      case 5u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 64;
        goto LABEL_32;
      case 6u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 72;
LABEL_32:
        v28 = *(Class *)((char *)&v5->super.super.isa + v25);
        *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

        goto LABEL_35;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_35:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_36;
          }
          continue;
        }
LABEL_40:

LABEL_37:
        id v32 = 0;
LABEL_39:

        return v32;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingQuery *)self absoluteTimestamp];
  id v5 = [(BMProactiveHarvestingQuery *)self query];
  uint64_t v6 = [(BMProactiveHarvestingQuery *)self results];
  uint64_t v7 = [(BMProactiveHarvestingQuery *)self uniqueID];
  uint64_t v8 = [(BMProactiveHarvestingQuery *)self contentProtection];
  id v9 = [(BMProactiveHarvestingQuery *)self personaId];
  id v10 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingQuery with absoluteTimestamp: %@, query: %@, results: %@, uniqueID: %@, contentProtection: %@, personaId: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMProactiveHarvestingQuery)initWithAbsoluteTimestamp:(id)a3 query:(id)a4 results:(id)a5 uniqueID:(id)a6 contentProtection:(id)a7 personaId:(id)a8
{
  id v14 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMProactiveHarvestingQuery;
  id v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22);
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      [v14 timeIntervalSinceReferenceDate];
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      double v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_query, a4);
    objc_storeStrong((id *)&v18->_results, a5);
    objc_storeStrong((id *)&v18->_uniqueID, a6);
    objc_storeStrong((id *)&v18->_contentProtection, a7);
    objc_storeStrong((id *)&v18->_personaId, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"query" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"results" number:3 type:14 subMessageClass:objc_opt_class()];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4638;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"query" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"results_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_27223];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __37__BMProactiveHarvestingQuery_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _resultsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingQuery alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[8] = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end