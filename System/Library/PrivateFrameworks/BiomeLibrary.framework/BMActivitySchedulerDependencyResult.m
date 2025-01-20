@interface BMActivitySchedulerDependencyResult
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMActivitySchedulerDependencyResult)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMActivitySchedulerDependencyResult)initWithResultIdentifier:(id)a3 activityIdentifier:(id)a4 resultCount:(id)a5 type:(int)a6;
- (BOOL)hasResultCount;
- (BOOL)isEqual:(id)a3;
- (NSString)activityIdentifier;
- (NSString)description;
- (NSString)resultIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (unsigned)resultCount;
- (void)setHasResultCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMActivitySchedulerDependencyResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);

  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

- (int)type
{
  return self->_type;
}

- (void)setHasResultCount:(BOOL)a3
{
  self->_hasResultCount = a3;
}

- (BOOL)hasResultCount
{
  return self->_hasResultCount;
}

- (unsigned)resultCount
{
  return self->_resultCount;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
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
    v6 = [(BMActivitySchedulerDependencyResult *)self resultIdentifier];
    uint64_t v7 = [v5 resultIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMActivitySchedulerDependencyResult *)self resultIdentifier];
      v10 = [v5 resultIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMActivitySchedulerDependencyResult *)self activityIdentifier];
    uint64_t v14 = [v5 activityIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMActivitySchedulerDependencyResult *)self activityIdentifier];
      v17 = [v5 activityIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    if (![(BMActivitySchedulerDependencyResult *)self hasResultCount]
      && ![v5 hasResultCount]
      || [(BMActivitySchedulerDependencyResult *)self hasResultCount]
      && [v5 hasResultCount]
      && (unsigned int v19 = [(BMActivitySchedulerDependencyResult *)self resultCount],
          v19 == [v5 resultCount]))
    {
      int v20 = [(BMActivitySchedulerDependencyResult *)self type];
      BOOL v12 = v20 == [v5 type];
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMActivitySchedulerDependencyResult *)self resultIdentifier];
  id v4 = [(BMActivitySchedulerDependencyResult *)self activityIdentifier];
  if ([(BMActivitySchedulerDependencyResult *)self hasResultCount])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMActivitySchedulerDependencyResult resultCount](self, "resultCount"));
  }
  else
  {
    id v5 = 0;
  }
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerDependencyResult type](self, "type"));
  v13[0] = @"resultIdentifier";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"activityIdentifier";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"resultCount";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"type";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4) {
        goto LABEL_15;
      }
LABEL_21:

      if (v3) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v11;
}

- (BMActivitySchedulerDependencyResult)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"resultIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"activityIdentifier"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v33 = 0;
          int v11 = 0;
          goto LABEL_33;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = a4;
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v38 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activityIdentifier"];
        id v39 = v13;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        id v33 = 0;
        int v11 = 0;
        id *v29 = (id)[v19 initWithDomain:v20 code:2 userInfo:v10];
        goto LABEL_32;
      }
      id v33 = v9;
    }
    else
    {
      id v33 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"resultCount"];
    id v32 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v13 = 0;
          int v11 = 0;
          goto LABEL_32;
        }
        v30 = a4;
        BOOL v12 = self;
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"resultCount"];
        v37 = v15;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        id v23 = (id)[v21 initWithDomain:v22 code:2 userInfo:v14];
        id v13 = 0;
        int v11 = 0;
        id *v30 = v23;
        goto LABEL_31;
      }
      int v11 = (BMActivitySchedulerDependencyResult *)a4;
      BOOL v12 = self;
      id v13 = v10;
    }
    else
    {
      int v11 = (BMActivitySchedulerDependencyResult *)a4;
      BOOL v12 = self;
      id v13 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"type"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v11)
          {
            id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v28 = *MEMORY[0x1E4F502C8];
            uint64_t v34 = *MEMORY[0x1E4F28568];
            v25 = v11;
            v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
            v35 = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            v25->super.super.isa = (Class)(id)[v31 initWithDomain:v28 code:2 userInfo:v27];

            v15 = 0;
            int v11 = 0;
          }
          else
          {
            v15 = 0;
          }
          goto LABEL_31;
        }
        id v16 = [NSNumber numberWithInt:BMActivitySchedulerDependencyResultEventTypeFromString(v14)];
      }
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
    int v11 = -[BMActivitySchedulerDependencyResult initWithResultIdentifier:activityIdentifier:resultCount:type:](v12, "initWithResultIdentifier:activityIdentifier:resultCount:type:", v8, v33, v13, [v15 intValue]);
    BOOL v12 = v11;
LABEL_31:

    id v8 = v32;
    self = v12;
LABEL_32:

    goto LABEL_33;
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
    int v11 = 0;
    goto LABEL_34;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v40 = *MEMORY[0x1E4F28568];
  id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"resultIdentifier"];
  v41[0] = v33;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  id v8 = 0;
  int v11 = 0;
  *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
LABEL_33:

LABEL_34:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMActivitySchedulerDependencyResult *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_resultIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_activityIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasResultCount) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMActivitySchedulerDependencyResult;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_52;
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_24;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
LABEL_24:
          id v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasResultCount = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v16 = v23++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_42:
          v5->_resultCount = v24;
          continue;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_51;
          }
          continue;
      }
      while (1)
      {
        uint64_t v31 = *v6;
        unint64_t v32 = *(void *)&v4[v31];
        if (v32 == -1 || v32 >= *(void *)&v4[*v7]) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
        *(void *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0) {
          goto LABEL_44;
        }
        v28 += 7;
        BOOL v16 = v29++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_46;
        }
      }
      v4[*v8] = 1;
LABEL_44:
      if (v4[*v8]) {
        LODWORD(v30) = 0;
      }
LABEL_46:
      if (v30 >= 3) {
        LODWORD(v30) = 0;
      }
      v5->_type = v30;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    uint64_t v34 = 0;
  else {
LABEL_52:
  }
    uint64_t v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMActivitySchedulerDependencyResult *)self resultIdentifier];
  id v5 = [(BMActivitySchedulerDependencyResult *)self activityIdentifier];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMActivitySchedulerDependencyResult resultCount](self, "resultCount"));
  uint64_t v7 = BMActivitySchedulerDependencyResultEventTypeAsString([(BMActivitySchedulerDependencyResult *)self type]);
  id v8 = (void *)[v3 initWithFormat:@"BMActivitySchedulerDependencyResult with resultIdentifier: %@, activityIdentifier: %@, resultCount: %@, type: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMActivitySchedulerDependencyResult)initWithResultIdentifier:(id)a3 activityIdentifier:(id)a4 resultCount:(id)a5 type:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMActivitySchedulerDependencyResult;
  unint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v14->_resultIdentifier, a3);
    objc_storeStrong((id *)&v14->_activityIdentifier, a4);
    if (v13)
    {
      v14->_hasResultCount = 1;
      unsigned int v15 = [v13 unsignedIntValue];
    }
    else
    {
      unsigned int v15 = 0;
      v14->_hasResultCount = 0;
    }
    v14->_resultCount = v15;
    v14->_type = a6;
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resultIdentifier" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityIdentifier" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resultCount" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF49B0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resultIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resultCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
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
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMActivitySchedulerDependencyResult alloc] initByReadFrom:v7];
    id v4 = v8;
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