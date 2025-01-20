@interface BMSiriInferredHelpfulness
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriInferredHelpfulness)initWithAbsoluteTimestamp:(id)a3 inferredHelpfulnessScore:(id)a4 restatementScore:(id)a5 turnID:(id)a6 modelID:(id)a7;
- (BMSiriInferredHelpfulness)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasInferredHelpfulnessScore;
- (BOOL)hasRestatementScore;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSString)modelID;
- (NSString)turnID;
- (double)inferredHelpfulnessScore;
- (double)restatementScore;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasInferredHelpfulnessScore:(BOOL)a3;
- (void)setHasRestatementScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriInferredHelpfulness

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);

  objc_storeStrong((id *)&self->_turnID, 0);
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)turnID
{
  return self->_turnID;
}

- (void)setHasRestatementScore:(BOOL)a3
{
  self->_hasRestatementScore = a3;
}

- (BOOL)hasRestatementScore
{
  return self->_hasRestatementScore;
}

- (double)restatementScore
{
  return self->_restatementScore;
}

- (void)setHasInferredHelpfulnessScore:(BOOL)a3
{
  self->_hasInferredHelpfulnessScore = a3;
}

- (BOOL)hasInferredHelpfulnessScore
{
  return self->_hasInferredHelpfulnessScore;
}

- (double)inferredHelpfulnessScore
{
  return self->_inferredHelpfulnessScore;
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
    v6 = [(BMSiriInferredHelpfulness *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriInferredHelpfulness *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_19;
      }
    }
    if ([(BMSiriInferredHelpfulness *)self hasInferredHelpfulnessScore]
      || [v5 hasInferredHelpfulnessScore])
    {
      if (![(BMSiriInferredHelpfulness *)self hasInferredHelpfulnessScore]) {
        goto LABEL_19;
      }
      if (![v5 hasInferredHelpfulnessScore]) {
        goto LABEL_19;
      }
      [(BMSiriInferredHelpfulness *)self inferredHelpfulnessScore];
      double v14 = v13;
      [v5 inferredHelpfulnessScore];
      if (v14 != v15) {
        goto LABEL_19;
      }
    }
    if ([(BMSiriInferredHelpfulness *)self hasRestatementScore]
      || [v5 hasRestatementScore])
    {
      if (![(BMSiriInferredHelpfulness *)self hasRestatementScore]) {
        goto LABEL_19;
      }
      if (![v5 hasRestatementScore]) {
        goto LABEL_19;
      }
      [(BMSiriInferredHelpfulness *)self restatementScore];
      double v17 = v16;
      [v5 restatementScore];
      if (v17 != v18) {
        goto LABEL_19;
      }
    }
    v19 = [(BMSiriInferredHelpfulness *)self turnID];
    uint64_t v20 = [v5 turnID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriInferredHelpfulness *)self turnID];
      v23 = [v5 turnID];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_19:
        char v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    v26 = [(BMSiriInferredHelpfulness *)self modelID];
    v27 = [v5 modelID];
    if (v26 == v27)
    {
      char v12 = 1;
    }
    else
    {
      v28 = [(BMSiriInferredHelpfulness *)self modelID];
      v29 = [v5 modelID];
      char v12 = [v28 isEqual:v29];
    }
    goto LABEL_20;
  }
  char v12 = 0;
LABEL_21:

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
  v25[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriInferredHelpfulness *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMSiriInferredHelpfulness *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (![(BMSiriInferredHelpfulness *)self hasInferredHelpfulnessScore]
    || ([(BMSiriInferredHelpfulness *)self inferredHelpfulnessScore], fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    [(BMSiriInferredHelpfulness *)self inferredHelpfulnessScore];
    v8 = NSNumber;
    [(BMSiriInferredHelpfulness *)self inferredHelpfulnessScore];
    v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  if (![(BMSiriInferredHelpfulness *)self hasRestatementScore]
    || ([(BMSiriInferredHelpfulness *)self restatementScore], fabs(v10) == INFINITY))
  {
    char v12 = 0;
  }
  else
  {
    [(BMSiriInferredHelpfulness *)self restatementScore];
    int v11 = NSNumber;
    [(BMSiriInferredHelpfulness *)self restatementScore];
    char v12 = objc_msgSend(v11, "numberWithDouble:");
  }
  double v13 = [(BMSiriInferredHelpfulness *)self turnID];
  double v14 = [(BMSiriInferredHelpfulness *)self modelID];
  uint64_t v22 = v6;
  v24[0] = @"absoluteTimestamp";
  double v15 = (void *)v6;
  if (!v6)
  {
    double v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[0] = v15;
  v24[1] = @"inferredHelpfulnessScore";
  double v16 = v9;
  if (!v9)
  {
    double v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[1] = v16;
  v24[2] = @"restatementScore";
  double v17 = v12;
  if (!v12)
  {
    double v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v17;
  v24[3] = @"turnID";
  double v18 = v13;
  if (!v13)
  {
    double v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v18;
  v24[4] = @"modelID";
  v19 = v14;
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v19;
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 5, v22);
  if (v14)
  {
    if (v13) {
      goto LABEL_24;
    }
  }
  else
  {

    if (v13)
    {
LABEL_24:
      if (v12) {
        goto LABEL_25;
      }
LABEL_33:

      if (v9) {
        goto LABEL_26;
      }
      goto LABEL_34;
    }
  }

  if (!v12) {
    goto LABEL_33;
  }
LABEL_25:
  if (v9) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:
  if (!v23) {

  }
  return v20;
}

- (BMSiriInferredHelpfulness)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v46 = 0;
LABEL_9:
    double v15 = [v6 objectForKeyedSubscript:@"inferredHelpfulnessScore"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v22 = 0;
          goto LABEL_43;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v24 = a4;
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v53 = *MEMORY[0x1E4F28568];
        id v45 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"inferredHelpfulnessScore"];
        id v54 = v45;
        double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        id v26 = (id)[v23 initWithDomain:v25 code:2 userInfo:v16];
        uint64_t v22 = 0;
        a4 = 0;
        *int v24 = v26;
        goto LABEL_42;
      }
      v44 = v15;
    }
    else
    {
      v44 = 0;
    }
    double v16 = [v6 objectForKeyedSubscript:@"restatementScore"];
    v43 = v7;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v45 = 0;
          uint64_t v22 = 0;
          a4 = v44;
          goto LABEL_42;
        }
        double v17 = self;
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"restatementScore"];
        id v52 = v19;
        double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        uint64_t v22 = 0;
        id v45 = 0;
        *a4 = (id)[v27 initWithDomain:v28 code:2 userInfo:v18];
        goto LABEL_50;
      }
      double v17 = self;
      id v45 = v16;
    }
    else
    {
      double v17 = self;
      id v45 = 0;
    }
    double v18 = [v6 objectForKeyedSubscript:@"turnID"];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v19 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v18;
LABEL_18:
      uint64_t v20 = [v6 objectForKeyedSubscript:@"modelID"];
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v21 = 0;
LABEL_21:
        a4 = v44;
        uint64_t v22 = [(BMSiriInferredHelpfulness *)v17 initWithAbsoluteTimestamp:v46 inferredHelpfulnessScore:v44 restatementScore:v45 turnID:v19 modelID:v21];
        double v17 = v22;
LABEL_40:

LABEL_41:
        self = v17;
        double v7 = v43;
LABEL_42:

        goto LABEL_43;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        goto LABEL_21;
      }
      if (a4)
      {
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v47 = *MEMORY[0x1E4F28568];
        v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"modelID"];
        v48 = v32;
        v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        *a4 = (id)[v42 initWithDomain:v40 code:2 userInfo:v33];
      }
      id v21 = 0;
      uint64_t v22 = 0;
LABEL_39:
      a4 = v44;
      goto LABEL_40;
    }
    if (a4)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      v41 = a4;
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"turnID"];
      id v50 = v21;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v20];
      uint64_t v22 = 0;
      id v19 = 0;
      id *v41 = v31;
      goto LABEL_39;
    }
    id v19 = 0;
    uint64_t v22 = 0;
LABEL_50:
    a4 = v44;
    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v7;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSinceReferenceDate:v12];
LABEL_6:
    v46 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    v46 = [v14 dateFromString:v7];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v7;
    goto LABEL_6;
  }
  if (!a4)
  {
    v46 = 0;
    uint64_t v22 = 0;
    goto LABEL_44;
  }
  id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
  v36 = a4;
  uint64_t v37 = *MEMORY[0x1E4F502C8];
  uint64_t v55 = *MEMORY[0x1E4F28568];
  v38 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
  v56[0] = v38;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
  uint64_t v39 = v37;
  a4 = v38;
  v46 = 0;
  uint64_t v22 = 0;
  id *v36 = (id)[v35 initWithDomain:v39 code:2 userInfo:v15];
LABEL_43:

LABEL_44:
  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriInferredHelpfulness *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasInferredHelpfulnessScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRestatementScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_turnID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_modelID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMSiriInferredHelpfulness;
  id v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_44;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        if (v11++ >= 9)
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
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v30 = 24;
          goto LABEL_40;
        case 2u:
          v5->_hasInferredHelpfulnessScore = 1;
          uint64_t v28 = *v6;
          unint64_t v29 = *(void *)&v4[v28];
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v29);
            *(void *)&v4[v28] = v29 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v30 = 40;
          goto LABEL_40;
        case 3u:
          v5->_hasRestatementScore = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v22 = *(objc_class **)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v22 = 0;
          }
          uint64_t v30 = 48;
LABEL_40:
          *(Class *)((char *)&v5->super.super.isa + v30) = v22;
          break;
        case 4u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 56;
          goto LABEL_28;
        case 5u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 64;
LABEL_28:
          id v27 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_43;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_43:
  }
    id v31 = 0;
  else {
LABEL_44:
  }
    id v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriInferredHelpfulness *)self absoluteTimestamp];
  id v5 = NSNumber;
  [(BMSiriInferredHelpfulness *)self inferredHelpfulnessScore];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = NSNumber;
  [(BMSiriInferredHelpfulness *)self restatementScore];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  id v9 = [(BMSiriInferredHelpfulness *)self turnID];
  char v10 = [(BMSiriInferredHelpfulness *)self modelID];
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMSiriInferredHelpfulness with absoluteTimestamp: %@, inferredHelpfulnessScore: %@, restatementScore: %@, turnID: %@, modelID: %@", v4, v6, v8, v9, v10];

  return (NSString *)v11;
}

- (BMSiriInferredHelpfulness)initWithAbsoluteTimestamp:(id)a3 inferredHelpfulnessScore:(id)a4 restatementScore:(id)a5 turnID:(id)a6 modelID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BMSiriInferredHelpfulness;
  double v17 = [(BMEventBase *)&v22 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v17->_hasRaw_absoluteTimestamp = 1;
      [v12 timeIntervalSinceReferenceDate];
    }
    else
    {
      v17->_hasRaw_absoluteTimestamp = 0;
      double v18 = -1.0;
    }
    v17->_raw_absoluteTimestamp = v18;
    if (v13)
    {
      v17->_hasInferredHelpfulnessScore = 1;
      [v13 doubleValue];
    }
    else
    {
      v17->_hasInferredHelpfulnessScore = 0;
      double v19 = -1.0;
    }
    v17->_inferredHelpfulnessScore = v19;
    if (v14)
    {
      v17->_hasRestatementScore = 1;
      [v14 doubleValue];
    }
    else
    {
      v17->_hasRestatementScore = 0;
      double v20 = -1.0;
    }
    v17->_restatementScore = v20;
    objc_storeStrong((id *)&v17->_turnID, a6);
    objc_storeStrong((id *)&v17->_modelID, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"inferredHelpfulnessScore", 2, 0, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"restatementScore" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"turnID" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelID" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3B40;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inferredHelpfulnessScore" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"restatementScore" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"turnID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    double v7 = [[BMSiriInferredHelpfulness alloc] initByReadFrom:v6];
    v8 = v7;
    if (v7) {
      v7[9] = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end