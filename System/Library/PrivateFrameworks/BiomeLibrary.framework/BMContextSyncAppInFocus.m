@interface BMContextSyncAppInFocus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppInFocus)AppInFocus;
- (BMContextSyncAppInFocus)initWithID:(id)a3 deviceUUID:(id)a4 AppInFocus:(id)a5;
- (BMContextSyncAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSString)ID;
- (NSString)description;
- (NSString)deviceUUID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMContextSyncAppInFocus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AppInFocus, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

- (BMAppInFocus)AppInFocus
{
  return self->_AppInFocus;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (NSString)ID
{
  return self->_ID;
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
    v6 = [(BMContextSyncAppInFocus *)self ID];
    uint64_t v7 = [v5 ID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextSyncAppInFocus *)self ID];
      v10 = [v5 ID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMContextSyncAppInFocus *)self deviceUUID];
    uint64_t v14 = [v5 deviceUUID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMContextSyncAppInFocus *)self deviceUUID];
      v17 = [v5 deviceUUID];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMContextSyncAppInFocus *)self AppInFocus];
    v20 = [v5 AppInFocus];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMContextSyncAppInFocus *)self AppInFocus];
      v22 = [v5 AppInFocus];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMContextSyncAppInFocus *)self ID];
  id v4 = [(BMContextSyncAppInFocus *)self deviceUUID];
  id v5 = [(BMContextSyncAppInFocus *)self AppInFocus];
  v6 = [v5 jsonDictionary];

  v12[0] = @"ID";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v7;
  v12[1] = @"deviceUUID";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v12[2] = @"AppInFocus";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (v6)
  {
    if (v4) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v4) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (BMContextSyncAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"ID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"deviceUUID"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!p_isa)
        {
          id v10 = 0;
          goto LABEL_29;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = p_isa;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v32 = *MEMORY[0x1E4F28568];
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceUUID"];
        v33 = v11;
        char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        id v22 = (id)[v20 initWithDomain:v21 code:2 userInfo:v12];
        p_isa = 0;
        id v10 = 0;
        id *v28 = v22;
        goto LABEL_27;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"AppInFocus"];
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v12 = 0;
LABEL_10:
      self = [(BMContextSyncAppInFocus *)self initWithID:v8 deviceUUID:v10 AppInFocus:v12];
      p_isa = (id *)&self->super.super.isa;
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    v27 = p_isa;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v11;
      id v29 = 0;
      char v12 = [[BMAppInFocus alloc] initWithJSONDictionary:v13 error:&v29];
      id v14 = v29;
      if (!v14)
      {

        goto LABEL_10;
      }
      v15 = v14;
      int v11 = v13;
      if (v27) {
        id *v27 = v14;
      }
    }
    else
    {
      if (!p_isa)
      {
        p_isa = 0;
        goto LABEL_28;
      }
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v25 = *MEMORY[0x1E4F502C8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      char v12 = (BMAppInFocus *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"AppInFocus"];
      v31 = v12;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *p_isa = (id)[v26 initWithDomain:v25 code:2 userInfo:v23];
    }
    p_isa = 0;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!p_isa)
  {
    id v8 = 0;
    goto LABEL_30;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v34 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ID"];
  v35[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  id v18 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  v19 = p_isa;
  p_isa = 0;
  id v8 = 0;
  id *v19 = v18;
LABEL_29:

LABEL_30:
  return (BMContextSyncAppInFocus *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMContextSyncAppInFocus *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_ID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_AppInFocus)
  {
    PBDataWriterPlaceMark();
    [(BMAppInFocus *)self->_AppInFocus writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMContextSyncAppInFocus;
  id v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_32;
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_31;
        }
        id v22 = [[BMAppInFocus alloc] initByReadFrom:v4];
        if (!v22) {
          goto LABEL_31;
        }
        AppInFocus = v5->_AppInFocus;
        v5->_AppInFocus = v22;

        PBReaderRecallMark();
      }
      else
      {
        if (v19 == 2)
        {
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
        }
        else
        {
          if (v19 != 1)
          {
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_31;
            }
            continue;
          }
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 24;
        }
        v24 = *(Class *)((char *)&v5->super.super.isa + v21);
        *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    uint64_t v25 = 0;
  else {
LABEL_32:
  }
    uint64_t v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextSyncAppInFocus *)self ID];
  id v5 = [(BMContextSyncAppInFocus *)self deviceUUID];
  id v6 = [(BMContextSyncAppInFocus *)self AppInFocus];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMContextSyncAppInFocus with ID: %@, deviceUUID: %@, AppInFocus: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMContextSyncAppInFocus)initWithID:(id)a3 deviceUUID:(id)a4 AppInFocus:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMContextSyncAppInFocus;
  unint64_t v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_ID, a3);
    objc_storeStrong((id *)&v12->_deviceUUID, a4);
    objc_storeStrong((id *)&v12->_AppInFocus, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"deviceUUID", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"AppInFocus" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3A98;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceUUID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"AppInFocus_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_10718];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __34__BMContextSyncAppInFocus_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 AppInFocus];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMContextSyncAppInFocus alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end