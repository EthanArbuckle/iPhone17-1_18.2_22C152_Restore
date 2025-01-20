@interface BMDiscoverabilitySignals
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDiscoverabilitySignals)initWithContentIdentifier:(id)a3 context:(id)a4 osBuild:(id)a5 userInfo:(id)a6;
- (BMDiscoverabilitySignals)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)userInfo;
- (NSString)contentIdentifier;
- (NSString)context;
- (NSString)description;
- (NSString)osBuild;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMDiscoverabilitySignals

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDiscoverabilitySignals *)self writeTo:v3];
  v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contentIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_context)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_osBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"context" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"osBuild" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userInfo" dataType:4 requestOnly:0 fieldNumber:4 protoDataType:14 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

- (BMDiscoverabilitySignals)initWithContentIdentifier:(id)a3 context:(id)a4 osBuild:(id)a5 userInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMDiscoverabilitySignals;
  v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_contentIdentifier, a3);
    objc_storeStrong((id *)&v15->_context, a4);
    objc_storeStrong((id *)&v15->_osBuild, a5);
    objc_storeStrong((id *)&v15->_userInfo, a6);
  }

  return v15;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMDiscoverabilitySignals *)self contentIdentifier];
    uint64_t v7 = [v5 contentIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDiscoverabilitySignals *)self contentIdentifier];
      v10 = [v5 contentIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    id v13 = [(BMDiscoverabilitySignals *)self context];
    uint64_t v14 = [v5 context];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMDiscoverabilitySignals *)self context];
      objc_super v17 = [v5 context];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMDiscoverabilitySignals *)self osBuild];
    uint64_t v20 = [v5 osBuild];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMDiscoverabilitySignals *)self osBuild];
      v23 = [v5 osBuild];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMDiscoverabilitySignals *)self userInfo];
    v26 = [v5 userInfo];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMDiscoverabilitySignals *)self userInfo];
      v28 = [v5 userInfo];
      char v12 = [v27 isEqual:v28];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMDiscoverabilitySignals *)self contentIdentifier];
  id v4 = [(BMDiscoverabilitySignals *)self context];
  id v5 = [(BMDiscoverabilitySignals *)self osBuild];
  v6 = [(BMDiscoverabilitySignals *)self userInfo];
  uint64_t v7 = [v6 base64EncodedStringWithOptions:0];

  v14[0] = @"contentIdentifier";
  v8 = v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v14[1] = @"context";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v9;
  v14[2] = @"osBuild";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v14[3] = @"userInfo";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (v7)
  {
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4) {
        goto LABEL_12;
      }
LABEL_18:

      if (v3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v4) {
    goto LABEL_18;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (BMDiscoverabilitySignals)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"contentIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"context"];
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_16;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"context"];
        id v37 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v15 = 0;
        *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"osBuild"];
    int v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"osBuild"];
        id v35 = v14;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v13];
        v15 = 0;
        id v12 = 0;
        a4 = v30;
        id *v28 = v24;
        goto LABEL_14;
      }
      id v12 = v10;
    }
    else
    {
      id v12 = 0;
    }
    id v13 = [v6 objectForKeyedSubscript:@"userInfo"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"userInfo"];
          v33 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = (id)[v29 initWithDomain:v27 code:2 userInfo:v26];
        }
        id v14 = 0;
        v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    a4 = v30;
    v15 = [(BMDiscoverabilitySignals *)v11 initWithContentIdentifier:v8 context:v30 osBuild:v12 userInfo:v14];
    int v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    uint64_t v7 = v31;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v19 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentIdentifier"];
  v39[0] = v19;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v15 = 0;
  id v8 = 0;
  *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
  a4 = v19;
LABEL_16:

LABEL_17:
  return v15;
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMDiscoverabilitySignals;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_30;
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
        if (v11++ >= 9)
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
          uint64_t v20 = 24;
          goto LABEL_26;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_26;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_26;
        case 4u:
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 48;
LABEL_26:
          uint64_t v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_29;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_29:
  }
    id v22 = 0;
  else {
LABEL_30:
  }
    id v22 = v5;

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMDiscoverabilitySignals *)self contentIdentifier];
  id v5 = [(BMDiscoverabilitySignals *)self context];
  id v6 = [(BMDiscoverabilitySignals *)self osBuild];
  uint64_t v7 = [(BMDiscoverabilitySignals *)self userInfo];
  id v8 = (void *)[v3 initWithFormat:@"BMDiscoverabilitySignals with contentIdentifier: %@, context: %@, osBuild: %@, userInfo: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentIdentifier" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"context" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"osBuild" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userInfo" number:4 type:14 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF66A8;
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

    id v8 = [[BMDiscoverabilitySignals alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

@end