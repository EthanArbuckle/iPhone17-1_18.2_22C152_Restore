@interface BMSageMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSageMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSageMetadata)initWithRawSessionId:(id)a3 clientId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)clientId;
- (NSString)clientRequestId;
- (NSString)clientSessionId;
- (NSString)description;
- (NSUUID)rawSessionId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSageMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);

  objc_storeStrong((id *)&self->_raw_rawSessionId, 0);
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (NSString)clientId
{
  return self->_clientId;
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
    v6 = [(BMSageMetadata *)self rawSessionId];
    uint64_t v7 = [v5 rawSessionId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSageMetadata *)self rawSessionId];
      v10 = [v5 rawSessionId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMSageMetadata *)self clientId];
    uint64_t v14 = [v5 clientId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSageMetadata *)self clientId];
      v17 = [v5 clientId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMSageMetadata *)self clientRequestId];
    uint64_t v20 = [v5 clientRequestId];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSageMetadata *)self clientRequestId];
      v23 = [v5 clientRequestId];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMSageMetadata *)self clientSessionId];
    v26 = [v5 clientSessionId];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMSageMetadata *)self clientSessionId];
      v28 = [v5 clientSessionId];
      char v12 = [v27 isEqual:v28];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (NSUUID)rawSessionId
{
  raw_rawSessionId = self->_raw_rawSessionId;
  if (raw_rawSessionId)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_rawSessionId toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSageMetadata *)self rawSessionId];
  id v4 = [v3 UUIDString];

  id v5 = [(BMSageMetadata *)self clientId];
  v6 = [(BMSageMetadata *)self clientRequestId];
  uint64_t v7 = [(BMSageMetadata *)self clientSessionId];
  v14[0] = @"rawSessionId";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v14[1] = @"clientId";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v9;
  v14[2] = @"clientRequestId";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v14[3] = @"clientSessionId";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (v7)
  {
    if (v6) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v6)
    {
LABEL_11:
      if (v5) {
        goto LABEL_12;
      }
LABEL_18:

      if (v4) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v5) {
    goto LABEL_18;
  }
LABEL_12:
  if (v4) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (BMSageMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"rawSessionId"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"clientId"];
    v37 = v6;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          uint64_t v14 = self;
          goto LABEL_35;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientId"];
        id v44 = v11;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        v15 = 0;
        *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
        a4 = 0;
        uint64_t v14 = self;
LABEL_34:

        v6 = v37;
LABEL_35:

        goto LABEL_36;
      }
      v36 = v8;
    }
    else
    {
      v36 = 0;
    }
    v9 = [v5 objectForKeyedSubscript:@"clientRequestId"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v15 = 0;
          uint64_t v14 = self;
          a4 = v36;
          goto LABEL_34;
        }
        id v10 = v7;
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v24 = a4;
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientRequestId"];
        id v42 = v13;
        char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v26 = (id)[v23 initWithDomain:v25 code:2 userInfo:v12];
        v15 = 0;
        id v11 = 0;
        *int v24 = v26;
        uint64_t v14 = self;
        goto LABEL_32;
      }
      id v10 = v7;
      id v11 = v9;
    }
    else
    {
      id v10 = v7;
      id v11 = 0;
    }
    char v12 = [v5 objectForKeyedSubscript:@"clientSessionId"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = 0;
      uint64_t v14 = self;
LABEL_13:
      a4 = v36;
      uint64_t v14 = [(BMSageMetadata *)v14 initWithRawSessionId:v10 clientId:v36 clientRequestId:v11 clientSessionId:v13];
      v15 = v14;
LABEL_33:

      id v7 = v10;
      goto LABEL_34;
    }
    objc_opt_class();
    uint64_t v14 = self;
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      goto LABEL_13;
    }
    if (a4)
    {
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientSessionId"];
      v40 = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      *a4 = (id)[v35 initWithDomain:v34 code:2 userInfo:v28];
    }
    id v13 = 0;
    v15 = 0;
LABEL_32:
    a4 = v36;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v15 = 0;
      uint64_t v14 = self;
      goto LABEL_38;
    }
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F502C8];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    id v7 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"rawSessionId"];
    id v46 = v7;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    v15 = 0;
    *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v20];
    a4 = v20;
    uint64_t v14 = self;
    goto LABEL_36;
  }
  id v7 = v6;
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
  if (v16)
  {
    v17 = (void *)v16;

    id v7 = v17;
    goto LABEL_4;
  }
  uint64_t v14 = self;
  if (!a4)
  {
    v15 = 0;
    goto LABEL_37;
  }
  id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v31 = *MEMORY[0x1E4F502C8];
  uint64_t v47 = *MEMORY[0x1E4F28568];
  v32 = (id *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"rawSessionId"];
  v48[0] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v33];
  a4 = v32;

  v15 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSageMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_raw_rawSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_clientId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientRequestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientSessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMSageMetadata;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_32;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
          PBReaderReadData();
          uint64_t v19 = (NSData *)objc_claimAutoreleasedReturnValue();
          if ([(NSData *)v19 length] == 16)
          {
            raw_rawSessionId = v5->_raw_rawSessionId;
            v5->_raw_rawSessionId = v19;
            goto LABEL_28;
          }

          goto LABEL_31;
        case 2u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
          goto LABEL_27;
        case 3u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 40;
          goto LABEL_27;
        case 4u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 48;
LABEL_27:
          raw_rawSessionId = *(NSData **)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
LABEL_28:

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_31;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    id v23 = 0;
  else {
LABEL_32:
  }
    id v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSageMetadata *)self rawSessionId];
  id v5 = [(BMSageMetadata *)self clientId];
  v6 = [(BMSageMetadata *)self clientRequestId];
  id v7 = [(BMSageMetadata *)self clientSessionId];
  v8 = (void *)[v3 initWithFormat:@"BMSageMetadata with rawSessionId: %@, clientId: %@, clientRequestId: %@, clientSessionId: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSageMetadata)initWithRawSessionId:(id)a3 clientId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSageMetadata;
  unint64_t v14 = [(BMEventBase *)&v18 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v19[0] = 0;
      v19[1] = 0;
      [v10 getUUIDBytes:v19];
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v19 length:16];
      raw_rawSessionId = v14->_raw_rawSessionId;
      v14->_raw_rawSessionId = (NSData *)v15;
    }
    else
    {
      raw_rawSessionId = v14->_raw_rawSessionId;
      v14->_raw_rawSessionId = 0;
    }

    objc_storeStrong((id *)&v14->_clientId, a4);
    objc_storeStrong((id *)&v14->_clientRequestId, a5);
    objc_storeStrong((id *)&v14->_clientSessionId, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawSessionId" number:1 type:14 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientId" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientRequestId" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientSessionId" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4668;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawSessionId" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientRequestId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientSessionId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMSageMetadata alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end