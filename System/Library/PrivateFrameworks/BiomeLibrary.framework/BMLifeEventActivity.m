@interface BMLifeEventActivity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLifeEventActivity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLifeEventActivity)initWithStartDate:(id)a3 endDate:(id)a4 identifier:(id)a5 activityType:(int)a6 activitySource:(id)a7 confidence:(id)a8 members:(id)a9 metadata:(id)a10;
- (BMLifeEventActivityActivitySource)activitySource;
- (BMLifeEventActivityMetadata)metadata;
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (NSArray)members;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (NSString)identifier;
- (double)confidence;
- (id)_membersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)activityType;
- (unsigned)dataVersion;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLifeEventActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_activitySource, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BMLifeEventActivityMetadata)metadata
{
  return self->_metadata;
}

- (NSArray)members
{
  return self->_members;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (BMLifeEventActivityActivitySource)activitySource
{
  return self->_activitySource;
}

- (int)activityType
{
  return self->_activityType;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMLifeEventActivity *)self startDate];
    uint64_t v7 = [v5 startDate];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLifeEventActivity *)self startDate];
      v10 = [v5 startDate];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_27;
      }
    }
    v13 = [(BMLifeEventActivity *)self endDate];
    uint64_t v14 = [v5 endDate];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMLifeEventActivity *)self endDate];
      v17 = [v5 endDate];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_27;
      }
    }
    v19 = [(BMLifeEventActivity *)self identifier];
    uint64_t v20 = [v5 identifier];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMLifeEventActivity *)self identifier];
      v23 = [v5 identifier];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_27;
      }
    }
    int v25 = [(BMLifeEventActivity *)self activityType];
    if (v25 == [v5 activityType])
    {
      v26 = [(BMLifeEventActivity *)self activitySource];
      uint64_t v27 = [v5 activitySource];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMLifeEventActivity *)self activitySource];
        v30 = [v5 activitySource];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_27;
        }
      }
      if ([(BMLifeEventActivity *)self hasConfidence]
        || [v5 hasConfidence])
      {
        if (![(BMLifeEventActivity *)self hasConfidence]) {
          goto LABEL_27;
        }
        if (![v5 hasConfidence]) {
          goto LABEL_27;
        }
        [(BMLifeEventActivity *)self confidence];
        double v33 = v32;
        [v5 confidence];
        if (v33 != v34) {
          goto LABEL_27;
        }
      }
      v35 = [(BMLifeEventActivity *)self members];
      uint64_t v36 = [v5 members];
      if (v35 == (void *)v36)
      {
      }
      else
      {
        v37 = (void *)v36;
        v38 = [(BMLifeEventActivity *)self members];
        v39 = [v5 members];
        int v40 = [v38 isEqual:v39];

        if (!v40) {
          goto LABEL_27;
        }
      }
      v42 = [(BMLifeEventActivity *)self metadata];
      v43 = [v5 metadata];
      if (v42 == v43)
      {
        char v12 = 1;
      }
      else
      {
        v44 = [(BMLifeEventActivity *)self metadata];
        v45 = [v5 metadata];
        char v12 = [v44 isEqual:v45];
      }
      goto LABEL_28;
    }
LABEL_27:
    char v12 = 0;
LABEL_28:

    goto LABEL_29;
  }
  char v12 = 0;
LABEL_29:

  return v12;
}

- (NSDate)endDate
{
  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_endDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)startDate
{
  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v38[8] = *MEMORY[0x1E4F143B8];
  v3 = [(BMLifeEventActivity *)self startDate];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMLifeEventActivity *)self startDate];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMLifeEventActivity *)self endDate];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMLifeEventActivity *)self endDate];
    [v9 timeIntervalSince1970];
    uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    uint64_t v10 = 0;
  }

  uint64_t v11 = [(BMLifeEventActivity *)self identifier];
  uint64_t v36 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLifeEventActivity activityType](self, "activityType"));
  char v12 = [(BMLifeEventActivity *)self activitySource];
  v35 = [v12 jsonDictionary];

  if (![(BMLifeEventActivity *)self hasConfidence]
    || ([(BMLifeEventActivity *)self confidence], fabs(v13) == INFINITY))
  {
    v15 = 0;
  }
  else
  {
    [(BMLifeEventActivity *)self confidence];
    uint64_t v14 = NSNumber;
    [(BMLifeEventActivity *)self confidence];
    v15 = objc_msgSend(v14, "numberWithDouble:");
  }
  v16 = [(BMLifeEventActivity *)self _membersJSONArray];
  v17 = [(BMLifeEventActivity *)self metadata];
  int v18 = [v17 jsonDictionary];

  v37[0] = @"startDate";
  uint64_t v19 = v6;
  if (!v6)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  double v32 = (void *)v19;
  v38[0] = v19;
  v37[1] = @"endDate";
  uint64_t v20 = v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v20;
  v38[1] = v20;
  v37[2] = @"identifier";
  uint64_t v21 = v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  double v34 = (void *)v6;
  v30 = (void *)v21;
  v38[2] = v21;
  v37[3] = @"activityType";
  v22 = v36;
  if (!v36)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  double v33 = (void *)v10;
  v38[3] = v22;
  v37[4] = @"activitySource";
  v23 = v35;
  if (!v35)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v11;
  v38[4] = v23;
  v37[5] = @"confidence";
  int v25 = v15;
  if (!v15)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[5] = v25;
  v37[6] = @"members";
  v26 = v16;
  if (!v16)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[6] = v26;
  v37[7] = @"metadata";
  uint64_t v27 = v18;
  if (!v18)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[7] = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:8];
  if (v18)
  {
    if (v16) {
      goto LABEL_29;
    }
LABEL_41:

    if (v15) {
      goto LABEL_30;
    }
    goto LABEL_42;
  }

  if (!v16) {
    goto LABEL_41;
  }
LABEL_29:
  if (v15) {
    goto LABEL_30;
  }
LABEL_42:

LABEL_30:
  if (!v35) {

  }
  if (!v36) {
  if (v24)
  }
  {
    if (v33) {
      goto LABEL_36;
    }
LABEL_44:

    if (v34) {
      goto LABEL_37;
    }
    goto LABEL_45;
  }

  if (!v33) {
    goto LABEL_44;
  }
LABEL_36:
  if (v34) {
    goto LABEL_37;
  }
LABEL_45:

LABEL_37:

  return v28;
}

- (id)_membersJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMLifeEventActivity *)self members];
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

- (BMLifeEventActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v148[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"startDate"];
  v119 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v9 = v6;
      id v10 = [v8 alloc];
      [v9 doubleValue];
      double v12 = v11;

      id v13 = (id)[v10 initWithTimeIntervalSince1970:v12];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v7 = [v14 dateFromString:v6];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
          v88 = a4;
          uint64_t v89 = *MEMORY[0x1E4F502C8];
          uint64_t v147 = *MEMORY[0x1E4F28568];
          uint64_t v90 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startDate"];
          v148[0] = v90;
          v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v148 forKeys:&v147 count:1];
          v91 = v87;
          uint64_t v16 = (void *)v90;
          uint64_t v7 = 0;
          int v31 = 0;
          id *v88 = (id)[v91 initWithDomain:v89 code:2 userInfo:v15];
          goto LABEL_100;
        }
        uint64_t v7 = 0;
        int v31 = 0;
        goto LABEL_101;
      }
      id v13 = v6;
    }
    uint64_t v7 = v13;
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_9:
  v15 = [v5 objectForKeyedSubscript:@"endDate"];
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v18 = v15;
      id v19 = [v17 alloc];
      [v18 doubleValue];
      double v21 = v20;

      id v22 = (id)[v19 initWithTimeIntervalSince1970:v21];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v16 = [v23 dateFromString:v15];

        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v93 = *MEMORY[0x1E4F502C8];
          uint64_t v145 = *MEMORY[0x1E4F28568];
          v94 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"endDate"];
          v146 = v94;
          int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
          uint64_t v95 = v93;
          a4 = v94;
          id v96 = (id)[v92 initWithDomain:v95 code:2 userInfo:v24];
          uint64_t v16 = 0;
          int v31 = 0;
          id *v119 = v96;
          goto LABEL_99;
        }
        uint64_t v16 = 0;
        int v31 = 0;
        goto LABEL_100;
      }
      id v22 = v15;
    }
    uint64_t v16 = v22;
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_17:
  int v24 = [v5 objectForKeyedSubscript:@"identifier"];
  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v112 = v16;
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v143 = *MEMORY[0x1E4F28568];
        v118 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        v144 = v118;
        int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
        v29 = v27;
        uint64_t v16 = v112;
        id v30 = (id)[v29 initWithDomain:v28 code:2 userInfo:v25];
        int v31 = 0;
        *a4 = v30;
        a4 = 0;
        goto LABEL_98;
      }
      int v31 = 0;
      goto LABEL_99;
    }
    a4 = v24;
  }
  else
  {
    a4 = 0;
  }
  int v25 = [v5 objectForKeyedSubscript:@"activityType"];
  v116 = v7;
  v117 = a4;
  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v25;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v119)
        {
          v115 = v16;
          id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v79 = *MEMORY[0x1E4F502C8];
          uint64_t v141 = *MEMORY[0x1E4F28568];
          id v52 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"activityType"];
          id v142 = v52;
          uint64_t v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
          v81 = v78;
          uint64_t v16 = v115;
          uint64_t v82 = v79;
          double v33 = (BMLifeEventActivityActivitySource *)v80;
          v118 = 0;
          int v31 = 0;
          id *v119 = (id)[v81 initWithDomain:v82 code:2 userInfo:v80];
          goto LABEL_96;
        }
        v118 = 0;
        int v31 = 0;
        goto LABEL_98;
      }
      id v26 = [NSNumber numberWithInt:BMLifeEventActivityActivityTypeFromString(v25)];
    }
    v118 = v26;
  }
  else
  {
    v118 = 0;
  }
  double v32 = [v5 objectForKeyedSubscript:@"activitySource"];
  if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v104 = v32;
    double v33 = 0;
    goto LABEL_35;
  }
  v110 = v25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v55 = v32;
    if (!v119)
    {
      int v31 = 0;
      id v52 = v55;
      goto LABEL_97;
    }
    v114 = v16;
    id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v108 = *MEMORY[0x1E4F502C8];
    uint64_t v139 = *MEMORY[0x1E4F28568];
    v57 = v15;
    id v58 = [NSString alloc];
    v59 = v55;
    uint64_t v99 = objc_opt_class();
    v60 = v58;
    v15 = v57;
    double v33 = (BMLifeEventActivityActivitySource *)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v99, @"activitySource"];
    v140 = v33;
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
    v62 = v56;
    uint64_t v16 = v114;
    id *v119 = (id)[v62 initWithDomain:v108 code:2 userInfo:v61];

    int v31 = 0;
    id v52 = v59;
LABEL_66:
    int v25 = v110;
    uint64_t v7 = v116;
    goto LABEL_96;
  }
  v51 = v16;
  id v52 = v32;
  id v127 = 0;
  double v33 = [[BMLifeEventActivityActivitySource alloc] initWithJSONDictionary:v52 error:&v127];
  id v53 = v127;
  if (v53)
  {
    v54 = v53;
    if (v119) {
      id *v119 = v53;
    }

    int v31 = 0;
    uint64_t v16 = v51;
    goto LABEL_66;
  }
  v104 = v32;

  int v25 = v110;
LABEL_35:
  uint64_t v34 = [v5 objectForKeyedSubscript:@"confidence"];
  v106 = (void *)v34;
  v111 = v15;
  v113 = v16;
  if (v34 && (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v119)
      {
        id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v64 = *MEMORY[0x1E4F502C8];
        uint64_t v137 = *MEMORY[0x1E4F28568];
        id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
        id v138 = v36;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
        v65 = v63;
        uint64_t v16 = v113;
        id v66 = (id)[v65 initWithDomain:v64 code:2 userInfo:v39];
        int v31 = 0;
        id v107 = 0;
        id *v119 = v66;
        goto LABEL_93;
      }
      int v31 = 0;
      id v107 = 0;
      goto LABEL_95;
    }
    id v107 = v35;
  }
  else
  {
    id v107 = 0;
  }
  id v36 = [v5 objectForKeyedSubscript:@"members"];
  v37 = [MEMORY[0x1E4F1CA98] null];
  int v38 = [v36 isEqual:v37];

  v103 = v6;
  if (v38)
  {
    v102 = v33;
    v109 = v25;
    v105 = v24;

    id v36 = 0;
  }
  else
  {
    if (v36)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v119)
        {
          id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v76 = *MEMORY[0x1E4F502C8];
          uint64_t v135 = *MEMORY[0x1E4F28568];
          v39 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"members"];
          v136 = v39;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
          id v77 = (id)[v75 initWithDomain:v76 code:2 userInfo:v49];
          int v31 = 0;
          id *v119 = v77;
          goto LABEL_92;
        }
        int v31 = 0;
        uint64_t v16 = v113;
        goto LABEL_94;
      }
    }
    v102 = v33;
    v109 = v25;
    v105 = v24;
  }
  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v36, "count"));
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v36 = v36;
  uint64_t v40 = [v36 countByEnumeratingWithState:&v123 objects:v134 count:16];
  if (!v40) {
    goto LABEL_53;
  }
  uint64_t v41 = v40;
  uint64_t v42 = *(void *)v124;
  id v101 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v41; ++i)
    {
      if (*(void *)v124 != v42) {
        objc_enumerationMutation(v36);
      }
      v44 = *(void **)(*((void *)&v123 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v67 = v119;
        if (v119)
        {
          id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v132 = *MEMORY[0x1E4F28568];
          v45 = (BMLifeEventActivityMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"members"];
          v133 = v45;
          v70 = (void *)MEMORY[0x1E4F1C9E8];
          v71 = &v133;
          v72 = &v132;
LABEL_73:
          v73 = [v70 dictionaryWithObjects:v71 forKeys:v72 count:1];
          id *v67 = (id)[v68 initWithDomain:v69 code:2 userInfo:v73];

LABEL_79:
          int v31 = 0;
          v49 = v36;
          id v5 = v101;
          double v33 = v102;
          uint64_t v7 = v116;
          goto LABEL_80;
        }
LABEL_87:
        int v31 = 0;
        v49 = v36;
        id v5 = v101;
        double v33 = v102;
LABEL_88:
        int v24 = v105;
        int v25 = v109;
        goto LABEL_92;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v67 = v119;
        if (v119)
        {
          id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v130 = *MEMORY[0x1E4F28568];
          v45 = (BMLifeEventActivityMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"members"];
          v131 = v45;
          v70 = (void *)MEMORY[0x1E4F1C9E8];
          v71 = &v131;
          v72 = &v130;
          goto LABEL_73;
        }
        goto LABEL_87;
      }
      v45 = v44;
      v46 = [BMLifeEventActivityPerson alloc];
      id v122 = 0;
      v47 = [(BMLifeEventActivityPerson *)v46 initWithJSONDictionary:v45 error:&v122];
      id v48 = v122;
      if (v48)
      {
        v74 = v48;
        if (v119) {
          id *v119 = v48;
        }

        goto LABEL_79;
      }
      [v39 addObject:v47];
    }
    uint64_t v41 = [v36 countByEnumeratingWithState:&v123 objects:v134 count:16];
    id v5 = v101;
    if (v41) {
      continue;
    }
    break;
  }
LABEL_53:

  v49 = [v5 objectForKeyedSubscript:@"metadata"];
  if (!v49)
  {
    v45 = 0;
    v50 = v117;
    int v24 = v105;
    int v25 = v109;
    double v33 = v102;
    goto LABEL_90;
  }
  objc_opt_class();
  double v33 = v102;
  if (objc_opt_isKindOfClass())
  {
    v45 = 0;
    int v24 = v105;
    int v25 = v109;
    goto LABEL_56;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v84 = v49;
    id v121 = 0;
    v45 = [[BMLifeEventActivityMetadata alloc] initWithJSONDictionary:v84 error:&v121];
    id v85 = v121;
    if (v85)
    {
      v86 = v85;
      int v24 = v105;
      if (v119) {
        id *v119 = v85;
      }

      v49 = v84;
      int v31 = 0;
      int v25 = v109;
      uint64_t v7 = v116;
      goto LABEL_91;
    }

    int v24 = v105;
    int v25 = v109;
LABEL_56:
    v50 = v117;
LABEL_90:
    int v31 = -[BMLifeEventActivity initWithStartDate:endDate:identifier:activityType:activitySource:confidence:members:metadata:](self, "initWithStartDate:endDate:identifier:activityType:activitySource:confidence:members:metadata:", v7, v113, v50, [v118 intValue], v33, v107, v39, v45);
    self = v31;
    goto LABEL_91;
  }
  if (!v119)
  {
    int v31 = 0;
    goto LABEL_88;
  }
  id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v97 = *MEMORY[0x1E4F502C8];
  uint64_t v128 = *MEMORY[0x1E4F28568];
  v45 = (BMLifeEventActivityMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadata"];
  v129 = v45;
  v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  id *v119 = (id)[v100 initWithDomain:v97 code:2 userInfo:v98];

  uint64_t v7 = v116;
  int v31 = 0;
LABEL_80:
  int v24 = v105;
  int v25 = v109;
LABEL_91:

LABEL_92:
  uint64_t v6 = v103;
  uint64_t v16 = v113;
LABEL_93:

LABEL_94:
  v15 = v111;
LABEL_95:
  id v52 = v104;

LABEL_96:
LABEL_97:

  a4 = v117;
LABEL_98:

LABEL_99:
LABEL_100:

LABEL_101:
  return v31;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLifeEventActivity *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_startDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_endDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_activitySource)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMLifeEventActivityActivitySource *)self->_activitySource writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasConfidence) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_members;
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
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
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

  if (self->_metadata)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMLifeEventActivityMetadata *)self->_metadata writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)BMLifeEventActivity;
  id v5 = [(BMEventBase *)&v52 init];
  if (!v5) {
    goto LABEL_65;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v10 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    long long v11 = (int *)MEMORY[0x1E4F940B8];
    long long v12 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
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
          *((unsigned char *)&v5->super.super.isa + v10[662]) = 1;
          uint64_t v23 = *v7;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v8])
          {
            int v25 = *(objc_class **)(*(void *)&v4[*v11] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v9] = 1;
            int v25 = 0;
          }
          uint64_t v46 = v12[663];
          goto LABEL_61;
        case 2u:
          v5->_hasRaw_endDate = 1;
          uint64_t v26 = *v7;
          unint64_t v27 = *(void *)&v4[v26];
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)&v4[*v8])
          {
            int v25 = *(objc_class **)(*(void *)&v4[*v11] + v27);
            *(void *)&v4[v26] = v27 + 8;
          }
          else
          {
            v4[*v9] = 1;
            int v25 = 0;
          }
          uint64_t v46 = 40;
          goto LABEL_61;
        case 3u:
          uint64_t v28 = PBReaderReadString();
          identifier = v5->_identifier;
          v5->_identifier = (NSString *)v28;

          continue;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          break;
        case 5u:
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_67;
          }
          v37 = [[BMLifeEventActivityActivitySource alloc] initByReadFrom:v4];
          if (!v37) {
            goto LABEL_67;
          }
          uint64_t v38 = 72;
          goto LABEL_48;
        case 6u:
          v5->_hasConfidence = 1;
          uint64_t v39 = *v7;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)&v4[*v8])
          {
            int v25 = *(objc_class **)(*(void *)&v4[*v11] + v40);
            *(void *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v9] = 1;
            int v25 = 0;
          }
          uint64_t v46 = 80;
LABEL_61:
          *(Class *)((char *)&v5->super.super.isa + v46) = v25;
          continue;
        case 7u:
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_67;
          }
          uint64_t v41 = v12;
          uint64_t v42 = v10;
          id v43 = [[BMLifeEventActivityPerson alloc] initByReadFrom:v4];
          if (!v43) {
            goto LABEL_67;
          }
          v44 = v43;
          [v6 addObject:v43];
          PBReaderRecallMark();

          id v10 = v42;
          long long v12 = v41;
          continue;
        case 8u:
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_67;
          }
          v37 = [[BMLifeEventActivityMetadata alloc] initByReadFrom:v4];
          if (!v37) {
            goto LABEL_67;
          }
          uint64_t v38 = 96;
LABEL_48:
          v45 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = v37;

          PBReaderRecallMark();
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_67:

          goto LABEL_64;
      }
      while (1)
      {
        uint64_t v33 = *v7;
        uint64_t v34 = *(void *)&v4[v33];
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)&v4[*v8]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v4[*v11] + v34);
        *(void *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0) {
          goto LABEL_50;
        }
        v30 += 7;
        BOOL v20 = v31++ >= 9;
        if (v20)
        {
          LODWORD(v32) = 0;
          goto LABEL_52;
        }
      }
      v4[*v9] = 1;
LABEL_50:
      if (v4[*v9]) {
        LODWORD(v32) = 0;
      }
LABEL_52:
      if (v32 >= 0x12) {
        LODWORD(v32) = 0;
      }
      v5->_activityType = v32;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v47 = [v6 copy];
  members = v5->_members;
  v5->_members = (NSArray *)v47;

  int v49 = v4[*v9];
  if (v49) {
LABEL_64:
  }
    v50 = 0;
  else {
LABEL_65:
  }
    v50 = v5;

  return v50;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLifeEventActivity *)self startDate];
  id v5 = [(BMLifeEventActivity *)self endDate];
  uint64_t v6 = [(BMLifeEventActivity *)self identifier];
  uint64_t v7 = BMLifeEventActivityActivityTypeAsString([(BMLifeEventActivity *)self activityType]);
  uint64_t v8 = [(BMLifeEventActivity *)self activitySource];
  uint64_t v9 = NSNumber;
  [(BMLifeEventActivity *)self confidence];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  long long v11 = [(BMLifeEventActivity *)self members];
  long long v12 = [(BMLifeEventActivity *)self metadata];
  char v13 = (void *)[v3 initWithFormat:@"BMLifeEventActivity with startDate: %@, endDate: %@, identifier: %@, activityType: %@, activitySource: %@, confidence: %@, members: %@, metadata: %@", v4, v5, v6, v7, v8, v10, v11, v12];

  return (NSString *)v13;
}

- (BMLifeEventActivity)initWithStartDate:(id)a3 endDate:(id)a4 identifier:(id)a5 activityType:(int)a6 activitySource:(id)a7 confidence:(id)a8 members:(id)a9 metadata:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v27 = a5;
  id v26 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMLifeEventActivity;
  BOOL v20 = [(BMEventBase *)&v28 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v15)
    {
      v20->_hasRaw_startDate = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_startDate = 0;
      double v21 = -1.0;
    }
    v20->_raw_startDate = v21;
    if (v16)
    {
      v20->_hasRaw_endDate = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_endDate = 0;
      double v22 = -1.0;
    }
    v20->_raw_endDate = v22;
    objc_storeStrong((id *)&v20->_identifier, a5);
    v20->_activityType = a6;
    objc_storeStrong((id *)&v20->_activitySource, a7);
    if (v17)
    {
      v20->_hasConfidence = 1;
      [v17 doubleValue];
    }
    else
    {
      v20->_hasConfidence = 0;
      double v23 = -1.0;
    }
    v20->_confidence = v23;
    objc_storeStrong((id *)&v20->_members, a9);
    objc_storeStrong((id *)&v20->_metadata, a10);
  }

  return v20;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startDate" number:1 type:0 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endDate" number:2 type:0 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityType" number:4 type:4 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activitySource" number:5 type:14 subMessageClass:objc_opt_class()];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:6 type:0 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"members" number:7 type:14 subMessageClass:objc_opt_class()];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadata" number:8 type:14 subMessageClass:objc_opt_class()];
  v12[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3E58;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startDate" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endDate" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"activitySource_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_336];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"members_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_338];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_340_14843];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

id __30__BMLifeEventActivity_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 metadata];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __30__BMLifeEventActivity_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _membersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __30__BMLifeEventActivity_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 activitySource];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMLifeEventActivity alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[13] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end