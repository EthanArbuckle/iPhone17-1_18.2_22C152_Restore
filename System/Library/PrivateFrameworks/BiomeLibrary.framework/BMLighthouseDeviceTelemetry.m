@interface BMLighthouseDeviceTelemetry
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseDeviceTelemetry)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseDeviceTelemetry)initWithVersion:(id)a3 bucketStart:(id)a4 bucketEnd:(id)a5 tasksCount:(id)a6 tasksRun:(id)a7 tasksDeferred:(id)a8 tasksFailed:(id)a9 tasksCompleted:(id)a10;
- (BOOL)hasTasksCompleted;
- (BOOL)hasTasksCount;
- (BOOL)hasTasksDeferred;
- (BOOL)hasTasksFailed;
- (BOOL)hasTasksRun;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (NSDate)bucketEnd;
- (NSDate)bucketStart;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)tasksCompleted;
- (int)tasksCount;
- (int)tasksDeferred;
- (int)tasksFailed;
- (int)tasksRun;
- (int)version;
- (unsigned)dataVersion;
- (void)setHasTasksCompleted:(BOOL)a3;
- (void)setHasTasksCount:(BOOL)a3;
- (void)setHasTasksDeferred:(BOOL)a3;
- (void)setHasTasksFailed:(BOOL)a3;
- (void)setHasTasksRun:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseDeviceTelemetry

- (void)setHasTasksCompleted:(BOOL)a3
{
  self->_hasTasksCompleted = a3;
}

- (BOOL)hasTasksCompleted
{
  return self->_hasTasksCompleted;
}

- (int)tasksCompleted
{
  return self->_tasksCompleted;
}

- (void)setHasTasksFailed:(BOOL)a3
{
  self->_hasTasksFailed = a3;
}

- (BOOL)hasTasksFailed
{
  return self->_hasTasksFailed;
}

- (int)tasksFailed
{
  return self->_tasksFailed;
}

- (void)setHasTasksDeferred:(BOOL)a3
{
  self->_hasTasksDeferred = a3;
}

- (BOOL)hasTasksDeferred
{
  return self->_hasTasksDeferred;
}

- (int)tasksDeferred
{
  return self->_tasksDeferred;
}

- (void)setHasTasksRun:(BOOL)a3
{
  self->_hasTasksRun = a3;
}

- (BOOL)hasTasksRun
{
  return self->_hasTasksRun;
}

- (int)tasksRun
{
  return self->_tasksRun;
}

- (void)setHasTasksCount:(BOOL)a3
{
  self->_hasTasksCount = a3;
}

- (BOOL)hasTasksCount
{
  return self->_hasTasksCount;
}

- (int)tasksCount
{
  return self->_tasksCount;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (int)version
{
  return self->_version;
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
    if (-[BMLighthouseDeviceTelemetry hasVersion](self, "hasVersion") || [v5 hasVersion])
    {
      if (![(BMLighthouseDeviceTelemetry *)self hasVersion]) {
        goto LABEL_41;
      }
      if (![v5 hasVersion]) {
        goto LABEL_41;
      }
      int v6 = [(BMLighthouseDeviceTelemetry *)self version];
      if (v6 != [v5 version]) {
        goto LABEL_41;
      }
    }
    v7 = [(BMLighthouseDeviceTelemetry *)self bucketStart];
    uint64_t v8 = [v5 bucketStart];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMLighthouseDeviceTelemetry *)self bucketStart];
      v11 = [v5 bucketStart];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_41;
      }
    }
    v14 = [(BMLighthouseDeviceTelemetry *)self bucketEnd];
    uint64_t v15 = [v5 bucketEnd];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMLighthouseDeviceTelemetry *)self bucketEnd];
      v18 = [v5 bucketEnd];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_41;
      }
    }
    if (![(BMLighthouseDeviceTelemetry *)self hasTasksCount]
      && ![v5 hasTasksCount]
      || [(BMLighthouseDeviceTelemetry *)self hasTasksCount]
      && [v5 hasTasksCount]
      && (int v20 = [(BMLighthouseDeviceTelemetry *)self tasksCount],
          v20 == [v5 tasksCount]))
    {
      if (![(BMLighthouseDeviceTelemetry *)self hasTasksRun]
        && ![v5 hasTasksRun]
        || [(BMLighthouseDeviceTelemetry *)self hasTasksRun]
        && [v5 hasTasksRun]
        && (int v21 = [(BMLighthouseDeviceTelemetry *)self tasksRun],
            v21 == [v5 tasksRun]))
      {
        if (![(BMLighthouseDeviceTelemetry *)self hasTasksDeferred]
          && ![v5 hasTasksDeferred]
          || [(BMLighthouseDeviceTelemetry *)self hasTasksDeferred]
          && [v5 hasTasksDeferred]
          && (int v22 = [(BMLighthouseDeviceTelemetry *)self tasksDeferred],
              v22 == [v5 tasksDeferred]))
        {
          if (![(BMLighthouseDeviceTelemetry *)self hasTasksFailed]
            && ![v5 hasTasksFailed]
            || [(BMLighthouseDeviceTelemetry *)self hasTasksFailed]
            && [v5 hasTasksFailed]
            && (int v23 = [(BMLighthouseDeviceTelemetry *)self tasksFailed],
                v23 == [v5 tasksFailed]))
          {
            if (![(BMLighthouseDeviceTelemetry *)self hasTasksCompleted]
              && ![v5 hasTasksCompleted])
            {
              BOOL v13 = 1;
              goto LABEL_42;
            }
            if ([(BMLighthouseDeviceTelemetry *)self hasTasksCompleted]
              && [v5 hasTasksCompleted])
            {
              int v24 = [(BMLighthouseDeviceTelemetry *)self tasksCompleted];
              BOOL v13 = v24 == [v5 tasksCompleted];
LABEL_42:

              goto LABEL_43;
            }
          }
        }
      }
    }
LABEL_41:
    BOOL v13 = 0;
    goto LABEL_42;
  }
  BOOL v13 = 0;
LABEL_43:

  return v13;
}

- (NSDate)bucketEnd
{
  if (self->_hasRaw_bucketEnd)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bucketEnd];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)bucketStart
{
  if (self->_hasRaw_bucketStart)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_bucketStart];
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
  v34[8] = *MEMORY[0x1E4F143B8];
  if ([(BMLighthouseDeviceTelemetry *)self hasVersion])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry version](self, "version"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BMLighthouseDeviceTelemetry *)self bucketStart];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMLighthouseDeviceTelemetry *)self bucketStart];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v8 = [(BMLighthouseDeviceTelemetry *)self bucketEnd];
  if (v8)
  {
    v9 = NSNumber;
    v10 = [(BMLighthouseDeviceTelemetry *)self bucketEnd];
    [v10 timeIntervalSince1970];
    uint64_t v11 = objc_msgSend(v9, "numberWithDouble:");
  }
  else
  {
    uint64_t v11 = 0;
  }

  if ([(BMLighthouseDeviceTelemetry *)self hasTasksCount])
  {
    v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCount](self, "tasksCount"));
  }
  else
  {
    v32 = 0;
  }
  if ([(BMLighthouseDeviceTelemetry *)self hasTasksRun])
  {
    v31 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksRun](self, "tasksRun"));
  }
  else
  {
    v31 = 0;
  }
  if ([(BMLighthouseDeviceTelemetry *)self hasTasksDeferred])
  {
    int v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksDeferred](self, "tasksDeferred"));
  }
  else
  {
    int v12 = 0;
  }
  if ([(BMLighthouseDeviceTelemetry *)self hasTasksFailed])
  {
    BOOL v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksFailed](self, "tasksFailed"));
  }
  else
  {
    BOOL v13 = 0;
  }
  if ([(BMLighthouseDeviceTelemetry *)self hasTasksCompleted])
  {
    v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCompleted](self, "tasksCompleted"));
  }
  else
  {
    v14 = 0;
  }
  v33[0] = @"version";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v15;
  v34[0] = v15;
  v33[1] = @"bucketStart";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v16;
  v34[1] = v16;
  v33[2] = @"bucketEnd";
  uint64_t v17 = v11;
  if (!v11)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v3;
  v26 = (void *)v17;
  v34[2] = v17;
  v33[3] = @"tasksCount";
  v18 = v32;
  if (!v32)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v7;
  v34[3] = v18;
  v33[4] = @"tasksRun";
  int v19 = v31;
  if (!v31)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v20 = (void *)v11;
  v34[4] = v19;
  v33[5] = @"tasksDeferred";
  int v21 = v12;
  if (!v12)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v21;
  v33[6] = @"tasksFailed";
  int v22 = v13;
  if (!v13)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[6] = v22;
  v33[7] = @"tasksCompleted";
  int v23 = v14;
  if (!v14)
  {
    int v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v23;
  int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:8];
  if (v14)
  {
    if (v13) {
      goto LABEL_43;
    }
LABEL_55:

    if (v12) {
      goto LABEL_44;
    }
    goto LABEL_56;
  }

  if (!v13) {
    goto LABEL_55;
  }
LABEL_43:
  if (v12) {
    goto LABEL_44;
  }
LABEL_56:

LABEL_44:
  if (!v31) {

  }
  if (!v32) {
  if (v20)
  }
  {
    if (v29) {
      goto LABEL_50;
    }
LABEL_58:

    if (v30) {
      goto LABEL_51;
    }
    goto LABEL_59;
  }

  if (!v29) {
    goto LABEL_58;
  }
LABEL_50:
  if (v30) {
    goto LABEL_51;
  }
LABEL_59:

LABEL_51:

  return v24;
}

- (BMLighthouseDeviceTelemetry)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"version"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"bucketStart"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v12 = v9;
        id v13 = [v11 alloc];
        [v12 doubleValue];
        double v15 = v14;

        id v89 = (id)[v13 initWithTimeIntervalSince1970:v15];
      }
      else
      {
        v25 = a4;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v89 = [v26 dateFromString:v9];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v89 = 0;
              a4 = 0;
              goto LABEL_49;
            }
            id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
            v60 = v9;
            id v61 = v8;
            uint64_t v62 = *MEMORY[0x1E4F502C8];
            uint64_t v102 = *MEMORY[0x1E4F28568];
            id v87 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bucketStart"];
            id v103 = v87;
            uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
            uint64_t v64 = v62;
            id v8 = v61;
            v9 = v60;
            v10 = (void *)v63;
            id v89 = 0;
            a4 = 0;
            id *v25 = (id)[v59 initWithDomain:v64 code:2 userInfo:v63];
            goto LABEL_48;
          }
          id v89 = v9;
        }
      }
    }
    else
    {
      id v89 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"bucketEnd"];
    v84 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v17 = v10;
        id v18 = [v16 alloc];
        [v17 doubleValue];
        double v20 = v19;

        id v87 = (id)[v18 initWithTimeIntervalSince1970:v20];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v87 = [v27 dateFromString:v10];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v65 = v10;
            if (!a4)
            {
              id v87 = 0;
              a4 = 0;
              goto LABEL_48;
            }
            v66 = a4;
            id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v67 = v8;
            uint64_t v68 = *MEMORY[0x1E4F502C8];
            uint64_t v100 = *MEMORY[0x1E4F28568];
            v69 = v65;
            id v86 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"bucketEnd"];
            id v101 = v86;
            v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
            uint64_t v70 = v68;
            id v8 = v67;
            v9 = v84;
            id v71 = (id)[v88 initWithDomain:v70 code:2 userInfo:v28];
            id v87 = 0;
            a4 = 0;
            id *v66 = v71;
            v10 = v69;
LABEL_47:

LABEL_48:
            goto LABEL_49;
          }
          id v87 = v10;
        }
      }
    }
    else
    {
      id v87 = 0;
    }
    v28 = [v6 objectForKeyedSubscript:@"tasksCount"];
    v83 = v10;
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v86 = 0;
          goto LABEL_47;
        }
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v40 = v8;
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v98 = *MEMORY[0x1E4F28568];
        v74 = a4;
        id v85 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tasksCount"];
        id v99 = v85;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        uint64_t v42 = v41;
        id v8 = v40;
        v10 = v83;
        a4 = 0;
        id v86 = 0;
        id *v74 = (id)[v39 initWithDomain:v42 code:2 userInfo:v29];
        goto LABEL_46;
      }
      id v86 = v28;
    }
    else
    {
      id v86 = 0;
    }
    v29 = [v6 objectForKeyedSubscript:@"tasksRun"];
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v85 = 0;
          goto LABEL_46;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v44 = v8;
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v96 = *MEMORY[0x1E4F28568];
        v75 = a4;
        uint64_t v46 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tasksRun"];
        uint64_t v97 = v46;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        v47 = v43;
        v37 = (void *)v46;
        uint64_t v48 = v45;
        id v8 = v44;
        v10 = v83;
        a4 = 0;
        id v85 = 0;
        id *v75 = (id)[v47 initWithDomain:v48 code:2 userInfo:v30];
LABEL_45:

LABEL_46:
        v9 = v84;
        goto LABEL_47;
      }
      v81 = v28;
      id v85 = v29;
    }
    else
    {
      v81 = v28;
      id v85 = 0;
    }
    v30 = [v6 objectForKeyedSubscript:@"tasksDeferred"];
    id v82 = v8;
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          goto LABEL_44;
        }
        v76 = a4;
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        v50 = self;
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v94 = *MEMORY[0x1E4F28568];
        id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tasksDeferred"];
        id v95 = v34;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        uint64_t v52 = v51;
        self = v50;
        v10 = v83;
        id v53 = (id)[v49 initWithDomain:v52 code:2 userInfo:v32];
        a4 = 0;
        v37 = 0;
        id *v76 = v53;
LABEL_43:

        id v8 = v82;
LABEL_44:
        v28 = v81;
        goto LABEL_45;
      }
      v80 = v29;
      id v31 = v30;
    }
    else
    {
      v80 = v29;
      id v31 = 0;
    }
    v32 = [v6 objectForKeyedSubscript:@"tasksFailed"];
    v79 = v7;
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v34 = 0;
          v37 = v31;
          v29 = v80;
          goto LABEL_43;
        }
        v33 = self;
        id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
        v54 = a4;
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v92 = *MEMORY[0x1E4F28568];
        id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tasksFailed"];
        id v93 = v36;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        id v56 = (id)[v77 initWithDomain:v55 code:2 userInfo:v35];
        a4 = 0;
        id v34 = 0;
        id *v54 = v56;
        v37 = v31;
        v29 = v80;
        goto LABEL_42;
      }
      v33 = self;
      id v34 = v32;
    }
    else
    {
      v33 = self;
      id v34 = 0;
    }
    v35 = [v6 objectForKeyedSubscript:@"tasksCompleted"];
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v37 = v31;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = v80;
        if (a4)
        {
          id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v72 = *MEMORY[0x1E4F502C8];
          uint64_t v90 = *MEMORY[0x1E4F28568];
          v78 = a4;
          v57 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tasksCompleted"];
          v91 = v57;
          v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
          id *v78 = (id)[v73 initWithDomain:v72 code:2 userInfo:v58];

          id v36 = 0;
          a4 = 0;
        }
        else
        {
          id v36 = 0;
        }
        goto LABEL_42;
      }
      id v36 = v35;
    }
    else
    {
      id v36 = 0;
      v37 = v31;
    }
    v29 = v80;
    a4 = [(BMLighthouseDeviceTelemetry *)v33 initWithVersion:v82 bucketStart:v89 bucketEnd:v87 tasksCount:v86 tasksRun:v85 tasksDeferred:v37 tasksFailed:v34 tasksCompleted:v36];
    v33 = (BMLighthouseDeviceTelemetry *)a4;
LABEL_42:

    self = v33;
    uint64_t v7 = v79;
    v10 = v83;
    goto LABEL_43;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    goto LABEL_50;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v104 = *MEMORY[0x1E4F28568];
  int v23 = a4;
  id v89 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"version"];
  v105[0] = v89;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:&v104 count:1];
  id v24 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
  id v8 = 0;
  a4 = 0;
  *int v23 = v24;
LABEL_49:

LABEL_50:
  return (BMLighthouseDeviceTelemetry *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMLighthouseDeviceTelemetry *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasVersion)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRaw_bucketStart)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRaw_bucketEnd)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasTasksCount)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasTasksRun)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasTasksDeferred)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasTasksFailed)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasTasksCompleted)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)BMLighthouseDeviceTelemetry;
  id v5 = [(BMEventBase *)&v66 init];
  if (!v5) {
    goto LABEL_103;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasVersion = 1;
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
              goto LABEL_71;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_73;
            }
          }
          v4[*v8] = 1;
LABEL_71:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_73:
          uint64_t v62 = 60;
          goto LABEL_94;
        case 2u:
          v5->_hasRaw_bucketStart = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          uint64_t v63 = 24;
          goto LABEL_99;
        case 3u:
          v5->_hasRaw_bucketEnd = 1;
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          uint64_t v63 = 40;
LABEL_99:
          *(Class *)((char *)&v5->super.super.isa + v63) = v29;
          continue;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v22 = 0;
          v5->_hasTasksCount = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v36;
              v22 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_77:
          uint64_t v62 = 64;
          goto LABEL_94;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v22 = 0;
          v5->_hasTasksRun = 1;
          while (2)
          {
            uint64_t v40 = *v6;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
              *(void *)&v4[v40] = v42;
              v22 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v17 = v39++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_81:
          uint64_t v62 = 68;
          goto LABEL_94;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v22 = 0;
          v5->_hasTasksDeferred = 1;
          while (2)
          {
            uint64_t v46 = *v6;
            uint64_t v47 = *(void *)&v4[v46];
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v47);
              *(void *)&v4[v46] = v48;
              v22 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_85:
          uint64_t v62 = 72;
          goto LABEL_94;
        case 7u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v22 = 0;
          v5->_hasTasksFailed = 1;
          while (2)
          {
            uint64_t v52 = *v6;
            uint64_t v53 = *(void *)&v4[v52];
            unint64_t v54 = v53 + 1;
            if (v53 == -1 || v54 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)&v4[*v9] + v53);
              *(void *)&v4[v52] = v54;
              v22 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                BOOL v17 = v51++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_89:
          uint64_t v62 = 76;
          goto LABEL_94;
        case 8u:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v22 = 0;
          v5->_hasTasksCompleted = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_102;
          }
          continue;
      }
      while (1)
      {
        uint64_t v58 = *v6;
        uint64_t v59 = *(void *)&v4[v58];
        unint64_t v60 = v59 + 1;
        if (v59 == -1 || v60 > *(void *)&v4[*v7]) {
          break;
        }
        char v61 = *(unsigned char *)(*(void *)&v4[*v9] + v59);
        *(void *)&v4[v58] = v60;
        v22 |= (unint64_t)(v61 & 0x7F) << v56;
        if ((v61 & 0x80) == 0) {
          goto LABEL_91;
        }
        v56 += 7;
        BOOL v17 = v57++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_93;
        }
      }
      v4[*v8] = 1;
LABEL_91:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_93:
      uint64_t v62 = 80;
LABEL_94:
      *(_DWORD *)((char *)&v5->super.super.isa + v62) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_102:
  }
    uint64_t v64 = 0;
  else {
LABEL_103:
  }
    uint64_t v64 = v5;

  return v64;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry version](self, "version"));
  id v5 = [(BMLighthouseDeviceTelemetry *)self bucketStart];
  id v6 = [(BMLighthouseDeviceTelemetry *)self bucketEnd];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCount](self, "tasksCount"));
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksRun](self, "tasksRun"));
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksDeferred](self, "tasksDeferred"));
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksFailed](self, "tasksFailed"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseDeviceTelemetry tasksCompleted](self, "tasksCompleted"));
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMLighthouseDeviceTelemetry with version: %@, bucketStart: %@, bucketEnd: %@, tasksCount: %@, tasksRun: %@, tasksDeferred: %@, tasksFailed: %@, tasksCompleted: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMLighthouseDeviceTelemetry)initWithVersion:(id)a3 bucketStart:(id)a4 bucketEnd:(id)a5 tasksCount:(id)a6 tasksRun:(id)a7 tasksDeferred:(id)a8 tasksFailed:(id)a9 tasksCompleted:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v34.receiver = self;
  v34.super_class = (Class)BMLighthouseDeviceTelemetry;
  uint64_t v24 = [(BMEventBase *)&v34 init];
  if (v24)
  {
    v24->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v24->_hasVersion = 1;
      int v25 = [v16 intValue];
    }
    else
    {
      v24->_hasVersion = 0;
      int v25 = -1;
    }
    v24->_version = v25;
    if (v17)
    {
      v24->_hasRaw_bucketStart = 1;
      [v17 timeIntervalSince1970];
    }
    else
    {
      v24->_hasRaw_bucketStart = 0;
      double v26 = -1.0;
    }
    v24->_raw_bucketStart = v26;
    if (v18)
    {
      v24->_hasRaw_bucketEnd = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v24->_hasRaw_bucketEnd = 0;
      double v27 = -1.0;
    }
    v24->_raw_bucketEnd = v27;
    if (v19)
    {
      v24->_hasTasksCount = 1;
      int v28 = [v19 intValue];
    }
    else
    {
      v24->_hasTasksCount = 0;
      int v28 = -1;
    }
    v24->_tasksCount = v28;
    if (v20)
    {
      v24->_hasTasksRun = 1;
      int v29 = [v20 intValue];
    }
    else
    {
      v24->_hasTasksRun = 0;
      int v29 = -1;
    }
    v24->_tasksRun = v29;
    if (v21)
    {
      v24->_hasTasksDeferred = 1;
      int v30 = [v21 intValue];
    }
    else
    {
      v24->_hasTasksDeferred = 0;
      int v30 = -1;
    }
    v24->_tasksDeferred = v30;
    if (v22)
    {
      v24->_hasTasksFailed = 1;
      int v31 = [v22 intValue];
    }
    else
    {
      v24->_hasTasksFailed = 0;
      int v31 = -1;
    }
    v24->_tasksFailed = v31;
    if (v23)
    {
      v24->_hasTasksCompleted = 1;
      int v32 = [v23 intValue];
    }
    else
    {
      v24->_hasTasksCompleted = 0;
      int v32 = -1;
    }
    v24->_tasksCompleted = v32;
  }

  return v24;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"version" number:1 type:2 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bucketStart" number:2 type:0 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bucketEnd" number:3 type:0 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tasksCount" number:4 type:2 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tasksRun" number:5 type:2 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tasksDeferred" number:6 type:2 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tasksFailed" number:7 type:2 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tasksCompleted" number:8 type:2 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7368;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"version" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bucketStart" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bucketEnd" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tasksCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tasksRun" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tasksDeferred" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tasksFailed" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tasksCompleted" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
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

    id v8 = [[BMLighthouseDeviceTelemetry alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[14] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end