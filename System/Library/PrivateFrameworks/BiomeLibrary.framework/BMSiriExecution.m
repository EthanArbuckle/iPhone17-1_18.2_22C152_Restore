@interface BMSiriExecution
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriExecution)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriExecution)initWithTaskId:(id)a3 taskStep:(int)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleID:(id)a8 interactionID:(id)a9 absoluteTimestamp:(id)a10;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)appBundleID;
- (NSString)description;
- (NSString)intentName;
- (NSString)interactionID;
- (NSString)slotValue;
- (NSString)statusReason;
- (NSString)taskId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)taskStep;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriExecution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_slotValue, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);

  objc_storeStrong((id *)&self->_taskId, 0);
}

- (NSString)interactionID
{
  return self->_interactionID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)intentName
{
  return self->_intentName;
}

- (NSString)slotValue
{
  return self->_slotValue;
}

- (NSString)statusReason
{
  return self->_statusReason;
}

- (int)taskStep
{
  return self->_taskStep;
}

- (NSString)taskId
{
  return self->_taskId;
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
    v6 = [(BMSiriExecution *)self taskId];
    uint64_t v7 = [v5 taskId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriExecution *)self taskId];
      v10 = [v5 taskId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_26;
      }
    }
    int v13 = [(BMSiriExecution *)self taskStep];
    if (v13 == [v5 taskStep])
    {
      v14 = [(BMSiriExecution *)self statusReason];
      uint64_t v15 = [v5 statusReason];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMSiriExecution *)self statusReason];
        v18 = [v5 statusReason];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_26;
        }
      }
      v20 = [(BMSiriExecution *)self slotValue];
      uint64_t v21 = [v5 slotValue];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMSiriExecution *)self slotValue];
        v24 = [v5 slotValue];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_26;
        }
      }
      v26 = [(BMSiriExecution *)self intentName];
      uint64_t v27 = [v5 intentName];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMSiriExecution *)self intentName];
        v30 = [v5 intentName];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_26;
        }
      }
      v32 = [(BMSiriExecution *)self appBundleID];
      uint64_t v33 = [v5 appBundleID];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMSiriExecution *)self appBundleID];
        v36 = [v5 appBundleID];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_26;
        }
      }
      v38 = [(BMSiriExecution *)self interactionID];
      uint64_t v39 = [v5 interactionID];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(BMSiriExecution *)self interactionID];
        v42 = [v5 interactionID];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_26;
        }
      }
      v45 = [(BMSiriExecution *)self absoluteTimestamp];
      v46 = [v5 absoluteTimestamp];
      if (v45 == v46)
      {
        char v12 = 1;
      }
      else
      {
        v47 = [(BMSiriExecution *)self absoluteTimestamp];
        v48 = [v5 absoluteTimestamp];
        char v12 = [v47 isEqual:v48];
      }
      goto LABEL_27;
    }
LABEL_26:
    char v12 = 0;
LABEL_27:

    goto LABEL_28;
  }
  char v12 = 0;
LABEL_28:

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
  v29[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriExecution *)self taskId];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriExecution taskStep](self, "taskStep"));
  id v5 = [(BMSiriExecution *)self statusReason];
  uint64_t v27 = [(BMSiriExecution *)self slotValue];
  v26 = [(BMSiriExecution *)self intentName];
  int v25 = [(BMSiriExecution *)self appBundleID];
  v6 = [(BMSiriExecution *)self interactionID];
  uint64_t v7 = [(BMSiriExecution *)self absoluteTimestamp];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMSiriExecution *)self absoluteTimestamp];
    [v9 timeIntervalSinceReferenceDate];
    v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v10 = 0;
  }

  v28[0] = @"taskId";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v11;
  v29[0] = v11;
  v28[1] = @"taskStep";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v12;
  v29[1] = v12;
  v28[2] = @"statusReason";
  uint64_t v13 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = (void *)v13;
  v29[2] = v13;
  v28[3] = @"slotValue";
  v14 = v27;
  if (!v27)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v3;
  v29[3] = v14;
  v28[4] = @"intentName";
  uint64_t v15 = v26;
  if (!v26)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[4] = v15;
  v28[5] = @"appBundleID";
  v16 = v25;
  if (!v25)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[5] = v16;
  v28[6] = @"interactionID";
  v17 = v6;
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[6] = v17;
  v28[7] = @"absoluteTimestamp";
  v18 = v10;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[7] = v18;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:8];
  if (v10)
  {
    if (v6) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v6) {
      goto LABEL_22;
    }
  }

LABEL_22:
  if (!v25) {

  }
  if (!v26) {
  if (v27)
  }
  {
    if (v5) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v5)
    {
LABEL_28:
      if (v4) {
        goto LABEL_29;
      }
LABEL_37:

      if (v24) {
        goto LABEL_30;
      }
      goto LABEL_38;
    }
  }

  if (!v4) {
    goto LABEL_37;
  }
LABEL_29:
  if (v24) {
    goto LABEL_30;
  }
LABEL_38:

LABEL_30:

  return v19;
}

- (BMSiriExecution)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"taskId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"taskStep"];
    v70 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            a4 = 0;
            goto LABEL_76;
          }
          id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v52 = *MEMORY[0x1E4F502C8];
          uint64_t v85 = *MEMORY[0x1E4F28568];
          uint64_t v33 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"taskStep"];
          v86 = v33;
          v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          id v53 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2);
          v10 = 0;
          a4 = 0;
          id *v70 = v53;
          goto LABEL_75;
        }
        id v11 = [NSNumber numberWithInt:BMSiriExecutionTaskStepFromString(v9)];
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    uint64_t v18 = [v6 objectForKeyedSubscript:@"statusReason"];
    v67 = v9;
    v71 = (void *)v18;
    if (v18 && (int v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        a4 = v70;
        if (!v70)
        {
          uint64_t v33 = 0;
LABEL_75:

          goto LABEL_76;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = v10;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        id v72 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"statusReason"];
        id v84 = v72;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        uint64_t v31 = v30;
        v10 = v29;
        id v32 = (id)[v28 initWithDomain:v31 code:2 userInfo:v20];
        uint64_t v33 = 0;
        a4 = 0;
        id *v70 = v32;
        goto LABEL_74;
      }
      id v69 = v19;
    }
    else
    {
      id v69 = 0;
    }
    v20 = [v6 objectForKeyedSubscript:@"slotValue"];
    if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v72 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v72 = v20;
LABEL_22:
      uint64_t v21 = [v6 objectForKeyedSubscript:@"intentName"];
      v63 = v7;
      v66 = v10;
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v68 = 0;
        goto LABEL_25;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v68 = v21;
LABEL_25:
        v22 = [v6 objectForKeyedSubscript:@"appBundleID"];
        id v64 = v8;
        if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v65 = 0;
LABEL_28:
          v23 = [v6 objectForKeyedSubscript:@"interactionID"];
          if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            v24 = self;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v70)
              {
                id v25 = 0;
                a4 = 0;
                goto LABEL_71;
              }
              id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v54 = *MEMORY[0x1E4F502C8];
              uint64_t v75 = *MEMORY[0x1E4F28568];
              uint64_t v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"interactionID"];
              v76 = v27;
              v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
              id v55 = (id)[v61 initWithDomain:v54 code:2 userInfo:v26];
              id v25 = 0;
              a4 = 0;
              id *v70 = v55;
              goto LABEL_70;
            }
            id v25 = v23;
          }
          else
          {
            v24 = self;
            id v25 = 0;
          }
          v26 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
          if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v27 = 0;
LABEL_69:
            a4 = -[BMSiriExecution initWithTaskId:taskStep:statusReason:slotValue:intentName:appBundleID:interactionID:absoluteTimestamp:](v24, "initWithTaskId:taskStep:statusReason:slotValue:intentName:appBundleID:interactionID:absoluteTimestamp:", v64, [v66 intValue], v69, v72, v68, v65, v25, v27);
            v24 = (BMSiriExecution *)a4;
LABEL_70:

            goto LABEL_71;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v34 = (objc_class *)MEMORY[0x1E4F1C9C8];
            id v35 = v26;
            id v36 = [v34 alloc];
            [v35 doubleValue];
            double v38 = v37;

            id v39 = (id)[v36 initWithTimeIntervalSinceReferenceDate:v38];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v56 = objc_alloc_init(MEMORY[0x1E4F28D48]);
              uint64_t v27 = [v56 dateFromString:v26];

              goto LABEL_69;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v70)
              {
                id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v60 = *MEMORY[0x1E4F502C8];
                uint64_t v73 = *MEMORY[0x1E4F28568];
                v58 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
                v74 = v58;
                v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
                id *v70 = (id)[v62 initWithDomain:v60 code:2 userInfo:v59];
              }
              uint64_t v27 = 0;
              a4 = 0;
              goto LABEL_70;
            }
            id v39 = v26;
          }
          uint64_t v27 = v39;
          goto LABEL_69;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v65 = v22;
          goto LABEL_28;
        }
        a4 = v70;
        if (v70)
        {
          v24 = self;
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v49 = *MEMORY[0x1E4F502C8];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appBundleID"];
          id v78 = v25;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          id v50 = (id)[v48 initWithDomain:v49 code:2 userInfo:v23];
          id v65 = 0;
          a4 = 0;
          id *v70 = v50;
LABEL_71:

          self = v24;
          id v8 = v64;
          goto LABEL_72;
        }
        id v65 = 0;
LABEL_72:
        uint64_t v33 = v69;

        uint64_t v7 = v63;
        v10 = v66;
        goto LABEL_73;
      }
      a4 = v70;
      if (v70)
      {
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        id v65 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"intentName"];
        id v80 = v65;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        id v47 = (id)[v45 initWithDomain:v46 code:2 userInfo:v22];
        id v68 = 0;
        a4 = 0;
        id *v70 = v47;
        goto LABEL_72;
      }
      id v68 = 0;
LABEL_64:
      uint64_t v33 = v69;
LABEL_73:

      goto LABEL_74;
    }
    a4 = v70;
    if (v70)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      v41 = v10;
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v81 = *MEMORY[0x1E4F28568];
      id v68 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"slotValue"];
      id v82 = v68;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      uint64_t v43 = v42;
      v10 = v41;
      id v44 = (id)[v40 initWithDomain:v43 code:2 userInfo:v21];
      id v72 = 0;
      a4 = 0;
      id *v70 = v44;
      goto LABEL_64;
    }
    id v72 = 0;
    uint64_t v33 = v69;
LABEL_74:

    v9 = v67;
    goto LABEL_75;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    uint64_t v12 = a4;
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F502C8];
    uint64_t v87 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskId"];
    v88[0] = v15;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:&v87 count:1];
    uint64_t v16 = v14;
    v10 = (void *)v15;
    id v17 = (id)[v13 initWithDomain:v16 code:2 userInfo:v9];
    id v8 = 0;
    a4 = 0;
    *uint64_t v12 = v17;
LABEL_76:

    goto LABEL_77;
  }
  id v8 = 0;
LABEL_77:

  return (BMSiriExecution *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriExecution *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_taskId) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_statusReason) {
    PBDataWriterWriteStringField();
  }
  if (self->_slotValue) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_intentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_appBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_interactionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMSiriExecution;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_51;
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_35;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          break;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_35;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_35;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_35;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_35;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
LABEL_35:
          v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 8u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v7])
          {
            double v32 = *(double *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v32 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v32;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_50;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v6;
        uint64_t v26 = *(void *)&v4[v25];
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
        *(void *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_42;
        }
        v22 += 7;
        BOOL v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_44;
        }
      }
      v4[*v8] = 1;
LABEL_42:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_44:
      if (v24 >= 0x5F) {
        LODWORD(v24) = 0;
      }
      v5->_taskStep = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_50:
  }
    uint64_t v33 = 0;
  else {
LABEL_51:
  }
    uint64_t v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriExecution *)self taskId];
  id v5 = BMSiriExecutionTaskStepAsString([(BMSiriExecution *)self taskStep]);
  id v6 = [(BMSiriExecution *)self statusReason];
  uint64_t v7 = [(BMSiriExecution *)self slotValue];
  id v8 = [(BMSiriExecution *)self intentName];
  v9 = [(BMSiriExecution *)self appBundleID];
  char v10 = [(BMSiriExecution *)self interactionID];
  unsigned int v11 = [(BMSiriExecution *)self absoluteTimestamp];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMSiriExecution with taskId: %@, taskStep: %@, statusReason: %@, slotValue: %@, intentName: %@, appBundleID: %@, interactionID: %@, absoluteTimestamp: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSiriExecution)initWithTaskId:(id)a3 taskStep:(int)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleID:(id)a8 interactionID:(id)a9 absoluteTimestamp:(id)a10
{
  id v26 = a3;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v17 = a9;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMSiriExecution;
  int v19 = [(BMEventBase *)&v27 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_taskId, a3);
    v19->_taskStep = a4;
    objc_storeStrong((id *)&v19->_statusReason, a5);
    objc_storeStrong((id *)&v19->_slotValue, a6);
    objc_storeStrong((id *)&v19->_intentName, a7);
    objc_storeStrong((id *)&v19->_appBundleID, a8);
    objc_storeStrong((id *)&v19->_interactionID, a9);
    if (v18)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      [v18 timeIntervalSinceReferenceDate];
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      double v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
  }

  return v19;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskId" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskStep" number:2 type:4 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"statusReason" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"slotValue" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intentName" number:5 type:13 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appBundleID" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionID" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:8 type:0 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF35D0;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskStep" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"statusReason" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"slotValue" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intentName" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appBundleID" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionID" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:8 protoDataType:0 convertedType:1];
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
  id v5 = a3;
  if (a4 == 2)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMSiriExecution_v2;
  }
  else
  {
    if (a4 != 3)
    {
      v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMSiriExecution;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 32) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 3;
}

@end