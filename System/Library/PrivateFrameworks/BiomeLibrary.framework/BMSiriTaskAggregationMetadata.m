@interface BMSiriTaskAggregationMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriTaskAggregationMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriTaskAggregationMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 aggregationWindowEndTimestamp:(id)a5;
- (BMSiriTaskAggregationMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 aggregationWindowEndTimestamp:(id)a5 odmId:(id)a6;
- (BOOL)hasAggregationWindowEndTimestamp;
- (BOOL)hasAggregationWindowStartTimestamp;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)odmId;
- (double)aggregationWindowEndTimestamp;
- (double)aggregationWindowStartTimestamp;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)schedule;
- (unsigned)dataVersion;
- (void)setHasAggregationWindowEndTimestamp:(BOOL)a3;
- (void)setHasAggregationWindowStartTimestamp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriTaskAggregationMetadata

- (BMSiriTaskAggregationMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 aggregationWindowEndTimestamp:(id)a5
{
  return [(BMSiriTaskAggregationMetadata *)self initWithSchedule:*(void *)&a3 aggregationWindowStartTimestamp:a4 aggregationWindowEndTimestamp:a5 odmId:0];
}

- (void).cxx_destruct
{
}

- (NSString)odmId
{
  return self->_odmId;
}

- (void)setHasAggregationWindowEndTimestamp:(BOOL)a3
{
  self->_hasAggregationWindowEndTimestamp = a3;
}

- (BOOL)hasAggregationWindowEndTimestamp
{
  return self->_hasAggregationWindowEndTimestamp;
}

- (double)aggregationWindowEndTimestamp
{
  return self->_aggregationWindowEndTimestamp;
}

- (void)setHasAggregationWindowStartTimestamp:(BOOL)a3
{
  self->_hasAggregationWindowStartTimestamp = a3;
}

- (BOOL)hasAggregationWindowStartTimestamp
{
  return self->_hasAggregationWindowStartTimestamp;
}

- (double)aggregationWindowStartTimestamp
{
  return self->_aggregationWindowStartTimestamp;
}

- (int)schedule
{
  return self->_schedule;
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
    int v6 = [(BMSiriTaskAggregationMetadata *)self schedule];
    if (v6 == [v5 schedule]
      && (!-[BMSiriTaskAggregationMetadata hasAggregationWindowStartTimestamp](self, "hasAggregationWindowStartTimestamp")&& ![v5 hasAggregationWindowStartTimestamp]|| -[BMSiriTaskAggregationMetadata hasAggregationWindowStartTimestamp](self, "hasAggregationWindowStartTimestamp")&& objc_msgSend(v5, "hasAggregationWindowStartTimestamp")&& (-[BMSiriTaskAggregationMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp"), double v8 = v7, objc_msgSend(v5, "aggregationWindowStartTimestamp"), v8 == v9))&& (!-[BMSiriTaskAggregationMetadata hasAggregationWindowEndTimestamp](self, "hasAggregationWindowEndTimestamp")&& !objc_msgSend(v5, "hasAggregationWindowEndTimestamp")|| -[BMSiriTaskAggregationMetadata hasAggregationWindowEndTimestamp](self, "hasAggregationWindowEndTimestamp")&& objc_msgSend(v5, "hasAggregationWindowEndTimestamp")&& (-[BMSiriTaskAggregationMetadata aggregationWindowEndTimestamp](self, "aggregationWindowEndTimestamp"), v11 = v10, objc_msgSend(v5, "aggregationWindowEndTimestamp"), v11 == v12)))
    {
      v13 = [(BMSiriTaskAggregationMetadata *)self odmId];
      v14 = [v5 odmId];
      if (v13 == v14)
      {
        char v17 = 1;
      }
      else
      {
        v15 = [(BMSiriTaskAggregationMetadata *)self odmId];
        v16 = [v5 odmId];
        char v17 = [v15 isEqual:v16];
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)jsonDictionary
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriTaskAggregationMetadata schedule](self, "schedule"));
  if (![(BMSiriTaskAggregationMetadata *)self hasAggregationWindowStartTimestamp]
    || ([(BMSiriTaskAggregationMetadata *)self aggregationWindowStartTimestamp],
        fabs(v4) == INFINITY))
  {
    int v6 = 0;
  }
  else
  {
    [(BMSiriTaskAggregationMetadata *)self aggregationWindowStartTimestamp];
    id v5 = NSNumber;
    [(BMSiriTaskAggregationMetadata *)self aggregationWindowStartTimestamp];
    int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  if (![(BMSiriTaskAggregationMetadata *)self hasAggregationWindowEndTimestamp]
    || ([(BMSiriTaskAggregationMetadata *)self aggregationWindowEndTimestamp],
        fabs(v7) == INFINITY))
  {
    double v9 = 0;
  }
  else
  {
    [(BMSiriTaskAggregationMetadata *)self aggregationWindowEndTimestamp];
    double v8 = NSNumber;
    [(BMSiriTaskAggregationMetadata *)self aggregationWindowEndTimestamp];
    double v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  double v10 = [(BMSiriTaskAggregationMetadata *)self odmId];
  v17[0] = @"schedule";
  double v11 = v3;
  if (!v3)
  {
    double v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v11;
  v17[1] = @"aggregationWindowStartTimestamp";
  double v12 = v6;
  if (!v6)
  {
    double v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v12;
  v17[2] = @"aggregationWindowEndTimestamp";
  v13 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v13;
  v17[3] = @"odmId";
  v14 = v10;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v9)
    {
LABEL_19:
      if (v6) {
        goto LABEL_20;
      }
LABEL_26:

      if (v3) {
        goto LABEL_21;
      }
      goto LABEL_27;
    }
  }

  if (!v6) {
    goto LABEL_26;
  }
LABEL_20:
  if (v3) {
    goto LABEL_21;
  }
LABEL_27:

LABEL_21:

  return v15;
}

- (BMSiriTaskAggregationMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"schedule"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v36 = 0;
LABEL_9:
    double v9 = [v6 objectForKeyedSubscript:@"aggregationWindowStartTimestamp"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v20 = 0;
          goto LABEL_35;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"aggregationWindowStartTimestamp"];
        id v42 = v15;
        double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v23 = (id)[v21 initWithDomain:v22 code:2 userInfo:v11];
        v20 = 0;
        id v10 = 0;
        *a4 = v23;
        goto LABEL_34;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    double v11 = [v6 objectForKeyedSubscript:@"aggregationWindowEndTimestamp"];
    v35 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v15 = 0;
          v20 = 0;
          goto LABEL_34;
        }
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"aggregationWindowEndTimestamp"];
        id v40 = v17;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v12 = v10;
        v13 = self;
        v16 = v25 = a4;
        id v26 = (id)[v33 initWithDomain:v24 code:2 userInfo:v16];
        v20 = 0;
        id v15 = 0;
        id *v25 = v26;
        goto LABEL_32;
      }
      id v12 = v10;
      v13 = self;
      v14 = a4;
      id v15 = v11;
    }
    else
    {
      id v12 = v10;
      v13 = self;
      v14 = a4;
      id v15 = 0;
    }
    v16 = [v6 objectForKeyedSubscript:@"odmId"];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v17 = 0;
LABEL_18:
      uint64_t v18 = [v36 intValue];
      v19 = v13;
      id v10 = v12;
      self = [(BMSiriTaskAggregationMetadata *)v19 initWithSchedule:v18 aggregationWindowStartTimestamp:v12 aggregationWindowEndTimestamp:v15 odmId:v17];
      v20 = self;
LABEL_33:

      double v7 = v35;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
      goto LABEL_18;
    }
    if (v14)
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v32 = *MEMORY[0x1E4F502C8];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"odmId"];
      v38 = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id *v14 = (id)[v34 initWithDomain:v32 code:2 userInfo:v28];
    }
    id v17 = 0;
    v20 = 0;
LABEL_32:
    self = v13;
    id v10 = v12;
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_8:
    v36 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMSiriTaskAggregationMetadataScheduleFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v36 = 0;
    v20 = 0;
    goto LABEL_36;
  }
  id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v31 = *MEMORY[0x1E4F502C8];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"schedule"];
  v44[0] = v10;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  v36 = 0;
  v20 = 0;
  *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v9];
LABEL_35:

LABEL_36:
  return v20;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriTaskAggregationMetadata *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasAggregationWindowStartTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasAggregationWindowEndTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  double v4 = v5;
  if (self->_odmId)
  {
    PBDataWriterWriteStringField();
    double v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  double v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMSiriTaskAggregationMetadata;
  id v5 = [(BMEventBase *)&v37 init];
  if (!v5) {
    goto LABEL_50;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v9 = (int *)MEMORY[0x1E4F940B8];
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
          break;
        case 2u:
          v5->_hasAggregationWindowStartTimestamp = 1;
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
          uint64_t v34 = 32;
          goto LABEL_46;
        case 3u:
          v5->_hasAggregationWindowEndTimestamp = 1;
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
          uint64_t v34 = 40;
LABEL_46:
          *(Class *)((char *)&v5->super.super.isa + v34) = v29;
          continue;
        case 4u:
          uint64_t v32 = PBReaderReadString();
          odmId = v5->_odmId;
          v5->_odmId = (NSString *)v32;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_49;
          }
          continue;
      }
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
          goto LABEL_37;
        }
        v20 += 7;
        BOOL v17 = v21++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_39:
      if (v22 >= 4) {
        LODWORD(v22) = 0;
      }
      v5->_schedule = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_49:
  }
    v35 = 0;
  else {
LABEL_50:
  }
    v35 = v5;

  return v35;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  double v4 = BMSiriTaskAggregationMetadataScheduleAsString([(BMSiriTaskAggregationMetadata *)self schedule]);
  id v5 = NSNumber;
  [(BMSiriTaskAggregationMetadata *)self aggregationWindowStartTimestamp];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = NSNumber;
  [(BMSiriTaskAggregationMetadata *)self aggregationWindowEndTimestamp];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  double v9 = [(BMSiriTaskAggregationMetadata *)self odmId];
  char v10 = (void *)[v3 initWithFormat:@"BMSiriTaskAggregationMetadata with schedule: %@, aggregationWindowStartTimestamp: %@, aggregationWindowEndTimestamp: %@, odmId: %@", v4, v6, v8, v9];

  return (NSString *)v10;
}

- (BMSiriTaskAggregationMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 aggregationWindowEndTimestamp:(id)a5 odmId:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriTaskAggregationMetadata;
  uint64_t v13 = [(BMEventBase *)&v17 init];
  if (v13)
  {
    v13->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v13->_schedule = a3;
    if (v10)
    {
      v13->_hasAggregationWindowStartTimestamp = 1;
      [v10 doubleValue];
    }
    else
    {
      v13->_hasAggregationWindowStartTimestamp = 0;
      double v14 = -1.0;
    }
    v13->_aggregationWindowStartTimestamp = v14;
    if (v11)
    {
      v13->_hasAggregationWindowEndTimestamp = 1;
      [v11 doubleValue];
    }
    else
    {
      v13->_hasAggregationWindowEndTimestamp = 0;
      double v15 = -1.0;
    }
    v13->_aggregationWindowEndTimestamp = v15;
    objc_storeStrong((id *)&v13->_odmId, a6);
  }

  return v13;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"schedule" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aggregationWindowStartTimestamp" number:2 type:0 subMessageClass:0];
  v8[1] = v3;
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aggregationWindowEndTimestamp" number:3 type:0 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"odmId" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6A80;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"schedule" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aggregationWindowStartTimestamp" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aggregationWindowEndTimestamp" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"odmId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    double v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriTaskAggregationMetadata alloc] initByReadFrom:v7];
    double v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end