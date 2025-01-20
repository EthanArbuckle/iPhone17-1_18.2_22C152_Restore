@interface BMPersonalizedSensingMomentsContextMomentsContextFetchOptions
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPersonalizedSensingMomentsContextMomentsContextFetchOptions)initWithContextFormat:(id)a3 contextRetrieval:(id)a4 contextCount:(id)a5;
- (BMPersonalizedSensingMomentsContextMomentsContextFetchOptions)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasContextCount;
- (BOOL)hasContextFormat;
- (BOOL)hasContextRetrieval;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)contextCount;
- (unsigned)contextFormat;
- (unsigned)contextRetrieval;
- (unsigned)dataVersion;
- (void)setHasContextCount:(BOOL)a3;
- (void)setHasContextFormat:(BOOL)a3;
- (void)setHasContextRetrieval:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextMomentsContextFetchOptions

- (void)setHasContextCount:(BOOL)a3
{
  self->_hasContextCount = a3;
}

- (BOOL)hasContextCount
{
  return self->_hasContextCount;
}

- (unsigned)contextCount
{
  return self->_contextCount;
}

- (void)setHasContextRetrieval:(BOOL)a3
{
  self->_hasContextRetrieval = a3;
}

- (BOOL)hasContextRetrieval
{
  return self->_hasContextRetrieval;
}

- (unsigned)contextRetrieval
{
  return self->_contextRetrieval;
}

- (void)setHasContextFormat:(BOOL)a3
{
  self->_hasContextFormat = a3;
}

- (BOOL)hasContextFormat
{
  return self->_hasContextFormat;
}

- (unsigned)contextFormat
{
  return self->_contextFormat;
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
    if ([(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextFormat]
      || [v5 hasContextFormat])
    {
      if (![(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextFormat]) {
        goto LABEL_18;
      }
      if (![v5 hasContextFormat]) {
        goto LABEL_18;
      }
      unsigned int v6 = [(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self contextFormat];
      if (v6 != [v5 contextFormat]) {
        goto LABEL_18;
      }
    }
    if (-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextRetrieval](self, "hasContextRetrieval")|| [v5 hasContextRetrieval])
    {
      if (![(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextRetrieval])goto LABEL_18; {
      if (![v5 hasContextRetrieval])
      }
        goto LABEL_18;
      unsigned int v7 = [(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self contextRetrieval];
      if (v7 != [v5 contextRetrieval]) {
        goto LABEL_18;
      }
    }
    if (![(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextCount]
      && ![v5 hasContextCount])
    {
      BOOL v9 = 1;
      goto LABEL_19;
    }
    if ([(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextCount]
      && [v5 hasContextCount])
    {
      unsigned int v8 = [(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self contextCount];
      BOOL v9 = v8 == [v5 contextCount];
    }
    else
    {
LABEL_18:
      BOOL v9 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  BOOL v9 = 0;
LABEL_20:

  return v9;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextFormat])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextFormat](self, "contextFormat"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextRetrieval])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextRetrieval](self, "contextRetrieval"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self hasContextCount])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextCount](self, "contextCount"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"contextFormat";
  unsigned int v6 = v3;
  if (!v3)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"contextRetrieval";
  unsigned int v7 = v4;
  if (!v4)
  {
    unsigned int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"contextCount";
  unsigned int v8 = v5;
  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_18;
    }
LABEL_23:

    if (v3) {
      goto LABEL_19;
    }
    goto LABEL_24;
  }

  if (!v4) {
    goto LABEL_23;
  }
LABEL_18:
  if (v3) {
    goto LABEL_19;
  }
LABEL_24:

LABEL_19:

  return v9;
}

- (BMPersonalizedSensingMomentsContextMomentsContextFetchOptions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"contextFormat"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    BOOL v9 = [v6 objectForKeyedSubscript:@"contextRetrieval"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"contextRetrieval"];
        id v28 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        v13 = 0;
        id v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"contextCount"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"contextCount"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self initWithContextFormat:v8 contextRetrieval:v10 contextCount:v12];
    v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"contextFormat"];
  v30[0] = v10;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasContextFormat)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasContextRetrieval)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasContextCount)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextFetchOptions;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_59;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    BOOL v9 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v23 = 0;
        v5->_hasContextCount = 1;
        while (1)
        {
          uint64_t v32 = *v6;
          uint64_t v33 = *(void *)&v4[v32];
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)&v4[*v7]) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
          *(void *)&v4[v32] = v34;
          v23 |= (unint64_t)(v35 & 0x7F) << v30;
          if ((v35 & 0x80) == 0)
          {
            uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextCount;
            goto LABEL_49;
          }
          v30 += 7;
          BOOL v28 = v31++ > 8;
          if (v28)
          {
            LODWORD(v23) = 0;
            uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextCount;
            goto LABEL_51;
          }
        }
        uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextCount;
LABEL_48:
        v4[*v8] = 1;
      }
      else if (v20 == 2)
      {
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v23 = 0;
        v5->_hasContextRetrieval = 1;
        while (1)
        {
          uint64_t v38 = *v6;
          uint64_t v39 = *(void *)&v4[v38];
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)&v4[*v7])
          {
            uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextRetrieval;
            goto LABEL_48;
          }
          char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
          *(void *)&v4[v38] = v40;
          v23 |= (unint64_t)(v41 & 0x7F) << v36;
          if ((v41 & 0x80) == 0) {
            break;
          }
          v36 += 7;
          BOOL v28 = v37++ > 8;
          if (v28)
          {
            LODWORD(v23) = 0;
            uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextRetrieval;
            goto LABEL_51;
          }
        }
        uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextRetrieval;
      }
      else
      {
        if (v20 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_58;
          }
          continue;
        }
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasContextFormat = 1;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7])
          {
            uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextFormat;
            goto LABEL_48;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            break;
          }
          v21 += 7;
          BOOL v28 = v22++ > 8;
          if (v28)
          {
            LODWORD(v23) = 0;
            uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextFormat;
            goto LABEL_51;
          }
        }
        uint64_t v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextFormat;
      }
LABEL_49:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_51:
      *(_DWORD *)((char *)&v5->super.super.isa + *v29) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_58:
  }
    v42 = 0;
  else {
LABEL_59:
  }
    v42 = v5;

  return v42;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextFormat](self, "contextFormat"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextRetrieval](self, "contextRetrieval"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextCount](self, "contextCount"));
  unsigned int v7 = (void *)[v3 initWithFormat:@"BMPersonalizedSensingMomentsContextMomentsContextFetchOptions with contextFormat: %@, contextRetrieval: %@, contextCount: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMPersonalizedSensingMomentsContextMomentsContextFetchOptions)initWithContextFormat:(id)a3 contextRetrieval:(id)a4 contextCount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextFetchOptions;
  unsigned int v11 = [(BMEventBase *)&v16 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasContextFormat = 1;
      unsigned int v12 = [v8 unsignedIntValue];
    }
    else
    {
      unsigned int v12 = 0;
      v11->_hasContextFormat = 0;
    }
    v11->_contextFormat = v12;
    if (v9)
    {
      v11->_hasContextRetrieval = 1;
      unsigned int v13 = [v9 unsignedIntValue];
    }
    else
    {
      unsigned int v13 = 0;
      v11->_hasContextRetrieval = 0;
    }
    v11->_contextRetrieval = v13;
    if (v10)
    {
      v11->_hasContextCount = 1;
      unsigned int v14 = [v10 unsignedIntValue];
    }
    else
    {
      unsigned int v14 = 0;
      v11->_hasContextCount = 0;
    }
    v11->_contextCount = v14;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextFormat" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"contextRetrieval", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextCount" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6D08;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextFormat" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextRetrieval" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contextCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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
    unsigned int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end