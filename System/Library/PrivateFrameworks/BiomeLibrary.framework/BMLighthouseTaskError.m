@interface BMLighthouseTaskError
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseTaskError)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseTaskError)initWithVersion:(id)a3 taskName:(id)a4 errorCode:(id)a5;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)errorCode;
- (NSString)taskName;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)version;
- (unsigned)dataVersion;
- (void)setHasVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseTaskError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);

  objc_storeStrong((id *)&self->_taskName, 0);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (NSString)taskName
{
  return self->_taskName;
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
    if (-[BMLighthouseTaskError hasVersion](self, "hasVersion") || [v5 hasVersion])
    {
      if (![(BMLighthouseTaskError *)self hasVersion]) {
        goto LABEL_9;
      }
      if (![v5 hasVersion]) {
        goto LABEL_9;
      }
      int v6 = [(BMLighthouseTaskError *)self version];
      if (v6 != [v5 version]) {
        goto LABEL_9;
      }
    }
    v7 = [(BMLighthouseTaskError *)self taskName];
    uint64_t v8 = [v5 taskName];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMLighthouseTaskError *)self taskName];
      v11 = [v5 taskName];
      int v12 = [v10 isEqual:v11];

      if (!v12)
      {
LABEL_9:
        char v13 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v14 = [(BMLighthouseTaskError *)self errorCode];
    v15 = [v5 errorCode];
    if (v14 == v15)
    {
      char v13 = 1;
    }
    else
    {
      v16 = [(BMLighthouseTaskError *)self errorCode];
      v17 = [v5 errorCode];
      char v13 = [v16 isEqual:v17];
    }
    goto LABEL_16;
  }
  char v13 = 0;
LABEL_17:

  return v13;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMLighthouseTaskError *)self hasVersion])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskError version](self, "version"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMLighthouseTaskError *)self taskName];
  id v5 = [(BMLighthouseTaskError *)self errorCode];
  v11[0] = @"version";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"taskName";
  v7 = v4;
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"errorCode";
  uint64_t v8 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v9;
}

- (BMLighthouseTaskError)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"version"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"taskName"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          char v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskName"];
        id v28 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        char v13 = 0;
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
    v11 = [v6 objectForKeyedSubscript:@"errorCode"];
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
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"errorCode"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        char v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMLighthouseTaskError *)self initWithVersion:v8 taskName:v10 errorCode:v12];
    char v13 = self;
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
    char v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"version"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  char v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLighthouseTaskError *)self writeTo:v3];
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
  if (self->_taskName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMLighthouseTaskError;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_41;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 40;
      }
      else
      {
        if (v19 != 2)
        {
          if (v19 == 1)
          {
            char v20 = 0;
            unsigned int v21 = 0;
            uint64_t v22 = 0;
            v5->_hasVersion = 1;
            while (1)
            {
              uint64_t v23 = *v6;
              unint64_t v24 = *(void *)&v4[v23];
              if (v24 == -1 || v24 >= *(void *)&v4[*v7]) {
                break;
              }
              char v25 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if ((v25 & 0x80) == 0) {
                goto LABEL_35;
              }
              v20 += 7;
              BOOL v16 = v21++ >= 9;
              if (v16)
              {
                LODWORD(v22) = 0;
                goto LABEL_37;
              }
            }
            v4[*v8] = 1;
LABEL_35:
            if (v4[*v8]) {
              LODWORD(v22) = 0;
            }
LABEL_37:
            v5->_version = v22;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_40;
          }
          continue;
        }
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 32;
      }
      id v28 = *(Class *)((char *)&v5->super.super.isa + v27);
      *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_40:
  }
    uint64_t v29 = 0;
  else {
LABEL_41:
  }
    uint64_t v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskError version](self, "version"));
  id v5 = [(BMLighthouseTaskError *)self taskName];
  id v6 = [(BMLighthouseTaskError *)self errorCode];
  v7 = (void *)[v3 initWithFormat:@"BMLighthouseTaskError with version: %@, taskName: %@, errorCode: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMLighthouseTaskError)initWithVersion:(id)a3 taskName:(id)a4 errorCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMLighthouseTaskError;
  unsigned int v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasVersion = 1;
      int v12 = [v8 intValue];
    }
    else
    {
      v11->_hasVersion = 0;
      int v12 = -1;
    }
    v11->_version = v12;
    objc_storeStrong((id *)&v11->_taskName, a4);
    objc_storeStrong((id *)&v11->_errorCode, a5);
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"version" number:1 type:2 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"taskName", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"errorCode" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5298;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"version" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"errorCode" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMLighthouseTaskError alloc] initByReadFrom:v7];
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