@interface BMSiriSELFProcessedEventComponentIdentifier
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriSELFProcessedEventComponentIdentifier)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriSELFProcessedEventComponentIdentifier)initWithUuid:(id)a3 componentName:(id)a4;
- (BOOL)hasComponentName;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)uuid;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)componentName;
- (unsigned)dataVersion;
- (void)setHasComponentName:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriSELFProcessedEventComponentIdentifier

- (void).cxx_destruct
{
}

- (void)setHasComponentName:(BOOL)a3
{
  self->_hasComponentName = a3;
}

- (BOOL)hasComponentName
{
  return self->_hasComponentName;
}

- (int)componentName
{
  return self->_componentName;
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
    v6 = [(BMSiriSELFProcessedEventComponentIdentifier *)self uuid];
    uint64_t v7 = [v5 uuid];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriSELFProcessedEventComponentIdentifier *)self uuid];
      v10 = [v5 uuid];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMSiriSELFProcessedEventComponentIdentifier *)self hasComponentName]
      && ![v5 hasComponentName])
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
    if ([(BMSiriSELFProcessedEventComponentIdentifier *)self hasComponentName]
      && [v5 hasComponentName])
    {
      int v13 = [(BMSiriSELFProcessedEventComponentIdentifier *)self componentName];
      BOOL v12 = v13 == [v5 componentName];
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (NSUUID)uuid
{
  raw_uuid = self->_raw_uuid;
  if (raw_uuid)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_uuid toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriSELFProcessedEventComponentIdentifier *)self uuid];
  id v4 = [v3 UUIDString];

  if ([(BMSiriSELFProcessedEventComponentIdentifier *)self hasComponentName])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriSELFProcessedEventComponentIdentifier componentName](self, "componentName"));
  }
  else
  {
    id v5 = 0;
  }
  v10[0] = @"uuid";
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"componentName";
  v11[0] = v6;
  uint64_t v7 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (v5)
  {
    if (v4) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v8;
}

- (BMSiriSELFProcessedEventComponentIdentifier)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"uuid"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"componentName"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v19 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"componentName"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v21];
        }
        int v11 = 0;
        id v10 = 0;
        goto LABEL_8;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    self = [(BMSiriSELFProcessedEventComponentIdentifier *)self initWithUuid:v8 componentName:v10];
    int v11 = self;
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      int v11 = 0;
      goto LABEL_11;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v16 = *MEMORY[0x1E4F502C8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uuid"];
    id v28 = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
    int v11 = 0;
    *a4 = v17;
    goto LABEL_9;
  }
  id v8 = v7;
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  if (v13)
  {
    v14 = (void *)v13;

    id v8 = v14;
    goto LABEL_4;
  }
  if (!a4)
  {
    int v11 = 0;
    goto LABEL_10;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v23 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"uuid"];
  v30[0] = v10;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  *a4 = (id)[v22 initWithDomain:v23 code:2 userInfo:v24];

  int v11 = 0;
LABEL_9:

LABEL_10:
LABEL_11:

  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriSELFProcessedEventComponentIdentifier *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_raw_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_hasComponentName)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriSELFProcessedEventComponentIdentifier;
  id v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_39;
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
      if ((v12 >> 3) == 2)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasComponentName = 1;
        while (1)
        {
          uint64_t v24 = *v6;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 == -1 || v25 >= *(void *)&v4[*v7]) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_33;
          }
          v21 += 7;
          BOOL v16 = v22++ >= 9;
          if (v16)
          {
            LODWORD(v23) = 0;
            goto LABEL_35;
          }
        }
        v4[*v8] = 1;
LABEL_33:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_35:
        v5->_componentName = v23;
      }
      else if ((v12 >> 3) == 1)
      {
        PBReaderReadData();
        uint64_t v19 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v19 length] != 16)
        {

          goto LABEL_38;
        }
        raw_uuid = v5->_raw_uuid;
        v5->_raw_uuid = v19;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_38;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_38:
  }
    uint64_t v27 = 0;
  else {
LABEL_39:
  }
    uint64_t v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriSELFProcessedEventComponentIdentifier *)self uuid];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriSELFProcessedEventComponentIdentifier componentName](self, "componentName"));
  id v6 = (void *)[v3 initWithFormat:@"BMSiriSELFProcessedEventComponentIdentifier with uuid: %@, componentName: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSiriSELFProcessedEventComponentIdentifier)initWithUuid:(id)a3 componentName:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSiriSELFProcessedEventComponentIdentifier;
  id v8 = [(BMEventBase *)&v13 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v14[0] = 0;
      v14[1] = 0;
      [v6 getUUIDBytes:v14];
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v14 length:16];
      raw_uuid = v8->_raw_uuid;
      v8->_raw_uuid = (NSData *)v9;
    }
    else
    {
      raw_uuid = v8->_raw_uuid;
      v8->_raw_uuid = 0;
    }

    if (v7)
    {
      v8->_hasComponentName = 1;
      int v11 = [v7 intValue];
    }
    else
    {
      v8->_hasComponentName = 0;
      int v11 = -1;
    }
    v8->_componentName = v11;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uuid" number:1 type:14 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"componentName" number:2 type:2 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4398;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uuid" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"componentName" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriSELFProcessedEventComponentIdentifier alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end