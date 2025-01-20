@interface BMOasisAnalyticsSubmapCreatedType
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsSubmapCreatedType)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsSubmapCreatedType)initWithSubmapId:(id)a3 isLocationAttached:(id)a4 bytesWrittenToDisk:(id)a5;
- (BOOL)hasBytesWrittenToDisk;
- (BOOL)hasIsLocationAttached;
- (BOOL)hasSubmapId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocationAttached;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)bytesWrittenToDisk;
- (unint64_t)submapId;
- (unsigned)dataVersion;
- (void)setHasBytesWrittenToDisk:(BOOL)a3;
- (void)setHasIsLocationAttached:(BOOL)a3;
- (void)setHasSubmapId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsSubmapCreatedType

- (void)setHasBytesWrittenToDisk:(BOOL)a3
{
  self->_hasBytesWrittenToDisk = a3;
}

- (BOOL)hasBytesWrittenToDisk
{
  return self->_hasBytesWrittenToDisk;
}

- (unint64_t)bytesWrittenToDisk
{
  return self->_bytesWrittenToDisk;
}

- (void)setHasIsLocationAttached:(BOOL)a3
{
  self->_hasIsLocationAttached = a3;
}

- (BOOL)hasIsLocationAttached
{
  return self->_hasIsLocationAttached;
}

- (BOOL)isLocationAttached
{
  return self->_isLocationAttached;
}

- (void)setHasSubmapId:(BOOL)a3
{
  self->_hasSubmapId = a3;
}

- (BOOL)hasSubmapId
{
  return self->_hasSubmapId;
}

- (unint64_t)submapId
{
  return self->_submapId;
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
    if ([(BMOasisAnalyticsSubmapCreatedType *)self hasSubmapId]
      || [v5 hasSubmapId])
    {
      if (![(BMOasisAnalyticsSubmapCreatedType *)self hasSubmapId]) {
        goto LABEL_18;
      }
      if (![v5 hasSubmapId]) {
        goto LABEL_18;
      }
      unint64_t v6 = [(BMOasisAnalyticsSubmapCreatedType *)self submapId];
      if (v6 != [v5 submapId]) {
        goto LABEL_18;
      }
    }
    if ([(BMOasisAnalyticsSubmapCreatedType *)self hasIsLocationAttached]
      || [v5 hasIsLocationAttached])
    {
      if (![(BMOasisAnalyticsSubmapCreatedType *)self hasIsLocationAttached]) {
        goto LABEL_18;
      }
      if (![v5 hasIsLocationAttached]) {
        goto LABEL_18;
      }
      int v7 = [(BMOasisAnalyticsSubmapCreatedType *)self isLocationAttached];
      if (v7 != [v5 isLocationAttached]) {
        goto LABEL_18;
      }
    }
    if (![(BMOasisAnalyticsSubmapCreatedType *)self hasBytesWrittenToDisk]
      && ![v5 hasBytesWrittenToDisk])
    {
      BOOL v9 = 1;
      goto LABEL_19;
    }
    if ([(BMOasisAnalyticsSubmapCreatedType *)self hasBytesWrittenToDisk]
      && [v5 hasBytesWrittenToDisk])
    {
      unint64_t v8 = [(BMOasisAnalyticsSubmapCreatedType *)self bytesWrittenToDisk];
      BOOL v9 = v8 == [v5 bytesWrittenToDisk];
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
  if ([(BMOasisAnalyticsSubmapCreatedType *)self hasSubmapId])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapCreatedType submapId](self, "submapId"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMOasisAnalyticsSubmapCreatedType *)self hasIsLocationAttached])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMOasisAnalyticsSubmapCreatedType isLocationAttached](self, "isLocationAttached"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMOasisAnalyticsSubmapCreatedType *)self hasBytesWrittenToDisk])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapCreatedType bytesWrittenToDisk](self, "bytesWrittenToDisk"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"submapId";
  unint64_t v6 = v3;
  if (!v3)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"isLocationAttached";
  int v7 = v4;
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"bytesWrittenToDisk";
  unint64_t v8 = v5;
  if (!v5)
  {
    unint64_t v8 = [MEMORY[0x1E4F1CA98] null];
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

- (BMOasisAnalyticsSubmapCreatedType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"submapId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    BOOL v9 = [v6 objectForKeyedSubscript:@"isLocationAttached"];
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
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isLocationAttached"];
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
    v11 = [v6 objectForKeyedSubscript:@"bytesWrittenToDisk"];
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
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bytesWrittenToDisk"];
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
    self = [(BMOasisAnalyticsSubmapCreatedType *)self initWithSubmapId:v8 isLocationAttached:v10 bytesWrittenToDisk:v12];
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
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"submapId"];
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
  [(BMOasisAnalyticsSubmapCreatedType *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasSubmapId)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_hasIsLocationAttached)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasBytesWrittenToDisk)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMOasisAnalyticsSubmapCreatedType;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_61;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v28 = 0;
        unsigned int v29 = 0;
        unint64_t v23 = 0;
        v5->_hasBytesWrittenToDisk = 1;
        while (1)
        {
          uint64_t v30 = *v6;
          uint64_t v31 = *(void *)&v4[v30];
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
            break;
          }
          char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
          *(void *)&v4[v30] = v32;
          v23 |= (unint64_t)(v33 & 0x7F) << v28;
          if ((v33 & 0x80) == 0) {
            goto LABEL_50;
          }
          v28 += 7;
          BOOL v17 = v29++ >= 9;
          if (v17)
          {
            unint64_t v23 = 0;
            goto LABEL_52;
          }
        }
        v4[*v8] = 1;
LABEL_50:
        if (v4[*v8]) {
          unint64_t v23 = 0;
        }
LABEL_52:
        uint64_t v41 = 32;
      }
      else
      {
        if (v20 == 2)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          v5->_hasIsLocationAttached = 1;
          while (1)
          {
            uint64_t v37 = *v6;
            uint64_t v38 = *(void *)&v4[v37];
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)&v4[*v7]) {
              break;
            }
            char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
            *(void *)&v4[v37] = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if ((v40 & 0x80) == 0) {
              goto LABEL_55;
            }
            v34 += 7;
            BOOL v17 = v35++ >= 9;
            if (v17)
            {
              uint64_t v36 = 0;
              goto LABEL_57;
            }
          }
          v4[*v8] = 1;
LABEL_55:
          if (v4[*v8]) {
            uint64_t v36 = 0;
          }
LABEL_57:
          v5->_isLocationAttached = v36 != 0;
          continue;
        }
        if (v20 != 1)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_60;
          }
          continue;
        }
        char v21 = 0;
        unsigned int v22 = 0;
        unint64_t v23 = 0;
        v5->_hasSubmapId = 1;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_46;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            unint64_t v23 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8]) {
          unint64_t v23 = 0;
        }
LABEL_48:
        uint64_t v41 = 24;
      }
      *(Class *)((char *)&v5->super.super.isa + v41) = (Class)v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_60:
  }
    v42 = 0;
  else {
LABEL_61:
  }
    v42 = v5;

  return v42;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapCreatedType submapId](self, "submapId"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMOasisAnalyticsSubmapCreatedType isLocationAttached](self, "isLocationAttached"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapCreatedType bytesWrittenToDisk](self, "bytesWrittenToDisk"));
  int v7 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsSubmapCreatedType with submapId: %@, isLocationAttached: %@, bytesWrittenToDisk: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMOasisAnalyticsSubmapCreatedType)initWithSubmapId:(id)a3 isLocationAttached:(id)a4 bytesWrittenToDisk:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMOasisAnalyticsSubmapCreatedType;
  unsigned int v11 = [(BMEventBase *)&v15 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasSubmapId = 1;
      uint64_t v12 = [v8 unsignedLongLongValue];
    }
    else
    {
      uint64_t v12 = 0;
      v11->_hasSubmapId = 0;
    }
    v11->_submapId = v12;
    if (v9)
    {
      v11->_hasIsLocationAttached = 1;
      v11->_isLocationAttached = [v9 BOOLValue];
    }
    else
    {
      v11->_hasIsLocationAttached = 0;
      v11->_isLocationAttached = 0;
    }
    if (v10)
    {
      v11->_hasBytesWrittenToDisk = 1;
      uint64_t v13 = [v10 unsignedLongLongValue];
    }
    else
    {
      uint64_t v13 = 0;
      v11->_hasBytesWrittenToDisk = 0;
    }
    v11->_bytesWrittenToDisk = v13;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"submapId" number:1 type:5 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"isLocationAttached", 2, 12, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bytesWrittenToDisk" number:3 type:5 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7920;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"submapId" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:5 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isLocationAttached" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bytesWrittenToDisk" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:5 convertedType:0];
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMOasisAnalyticsSubmapCreatedType alloc] initByReadFrom:v7];
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