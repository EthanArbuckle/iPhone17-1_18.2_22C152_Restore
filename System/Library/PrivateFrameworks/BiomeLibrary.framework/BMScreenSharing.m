@interface BMScreenSharing
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMScreenSharing)initWithIsStart:(id)a3 type:(int)a4;
- (BMScreenSharing)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasIsStart:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMScreenSharing

- (int)type
{
  return self->_type;
}

- (void)setHasIsStart:(BOOL)a3
{
  self->_hasIsStart = a3;
}

- (BOOL)hasIsStart
{
  return self->_hasIsStart;
}

- (BOOL)isStart
{
  return self->_isStart;
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
    if (!-[BMScreenSharing hasIsStart](self, "hasIsStart") && ![v5 hasIsStart]
      || [(BMScreenSharing *)self hasIsStart]
      && [v5 hasIsStart]
      && (int v6 = -[BMScreenSharing isStart](self, "isStart"), v6 == [v5 isStart]))
    {
      int v8 = [(BMScreenSharing *)self type];
      BOOL v7 = v8 == [v5 type];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(BMScreenSharing *)self hasIsStart])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenSharing isStart](self, "isStart"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMScreenSharing type](self, "type"));
  v9[0] = @"isStart";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"type";
  v10[0] = v5;
  int v6 = v4;
  if (!v4)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v7;
}

- (BMScreenSharing)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [v6 objectForKeyedSubscript:@"isStart"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v8 = 0;
        v15 = 0;
        goto LABEL_18;
      }
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = *MEMORY[0x1E4F502C8];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isStart"];
      v24[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v14 = (id)[v12 initWithDomain:v13 code:2 userInfo:v9];
      id v8 = 0;
      v15 = 0;
      *a4 = v14;
      goto LABEL_17;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"type"];
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
        if (a4)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v18 = *MEMORY[0x1E4F502C8];
          uint64_t v21 = *MEMORY[0x1E4F28568];
          v19 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          v22 = v19;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v20];
        }
        v10 = 0;
        v15 = 0;
        goto LABEL_17;
      }
      id v11 = [NSNumber numberWithInt:BMScreenSharingTypeFromString(v9)];
    }
    v10 = v11;
  }
  else
  {
    v10 = 0;
  }
  self = -[BMScreenSharing initWithIsStart:type:](self, "initWithIsStart:type:", v8, [v10 intValue]);
  v15 = self;
LABEL_17:

LABEL_18:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMScreenSharing *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasIsStart) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMScreenSharing;
  id v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_50;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  BOOL v7 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v12 >> 3) == 1)
      {
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        v5->_hasIsStart = 1;
        while (1)
        {
          uint64_t v28 = *v6;
          unint64_t v29 = *(void *)&v4[v28];
          if (v29 == -1 || v29 >= *(void *)&v4[*v7]) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
          *(void *)&v4[v28] = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0) {
            goto LABEL_44;
          }
          v25 += 7;
          BOOL v16 = v26++ >= 9;
          if (v16)
          {
            uint64_t v27 = 0;
            goto LABEL_46;
          }
        }
        v4[*v8] = 1;
LABEL_44:
        if (v4[*v8]) {
          uint64_t v27 = 0;
        }
LABEL_46:
        v5->_isStart = v27 != 0;
      }
      else if ((v12 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_38;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8]) {
          LODWORD(v21) = 0;
        }
LABEL_40:
        if (v21 >= 3) {
          LODWORD(v21) = 0;
        }
        v5->_type = v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_49;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_49:
  }
    v31 = 0;
  else {
LABEL_50:
  }
    v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMScreenSharing isStart](self, "isStart"));
  id v5 = BMScreenSharingTypeAsString([(BMScreenSharing *)self type]);
  id v6 = (void *)[v3 initWithFormat:@"BMScreenSharing with isStart: %@, type: %@", v4, v5];

  return (NSString *)v6;
}

- (BMScreenSharing)initWithIsStart:(id)a3 type:(int)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMScreenSharing;
  BOOL v7 = [(BMEventBase *)&v9 init];
  if (v7)
  {
    v7->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v7->_hasIsStart = 1;
      v7->_isStart = [v6 BOOLValue];
    }
    else
    {
      v7->_hasIsStart = 0;
      v7->_isStart = 0;
    }
    v7->_type = a4;
  }

  return v7;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isStart" number:1 type:12 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6C90;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isStart" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    BOOL v7 = BMScreenSharing_v1;
  }
  else
  {
    if (a4 != 2)
    {
      objc_super v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    BOOL v7 = BMScreenSharing;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  objc_super v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 20) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end