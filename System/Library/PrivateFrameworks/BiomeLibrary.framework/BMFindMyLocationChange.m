@interface BMFindMyLocationChange
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFindMyLocationChange)initWithIdsHandle:(id)a3 stateChange:(int)a4 activityState:(int)a5 latitude:(id)a6 longitude:(id)a7 name:(id)a8;
- (BMFindMyLocationChange)initWithIdsHandle:(id)a3 stateChange:(int)a4 activityState:(int)a5 name:(id)a6;
- (BMFindMyLocationChange)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)idsHandle;
- (NSString)name;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)activityState;
- (int)stateChange;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMFindMyLocationChange

- (BMFindMyLocationChange)initWithIdsHandle:(id)a3 stateChange:(int)a4 activityState:(int)a5 latitude:(id)a6 longitude:(id)a7 name:(id)a8
{
  return -[BMFindMyLocationChange initWithIdsHandle:stateChange:activityState:name:](self, "initWithIdsHandle:stateChange:activityState:name:", a3, *(void *)&a4, *(void *)&a5, a8, a7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_idsHandle, 0);
}

- (NSString)name
{
  return self->_name;
}

- (int)activityState
{
  return self->_activityState;
}

- (int)stateChange
{
  return self->_stateChange;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
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
    v6 = [(BMFindMyLocationChange *)self idsHandle];
    uint64_t v7 = [v5 idsHandle];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFindMyLocationChange *)self idsHandle];
      v10 = [v5 idsHandle];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_11;
      }
    }
    int v13 = [(BMFindMyLocationChange *)self stateChange];
    if (v13 == [v5 stateChange])
    {
      int v14 = [(BMFindMyLocationChange *)self activityState];
      if (v14 == [v5 activityState])
      {
        v15 = [(BMFindMyLocationChange *)self name];
        v16 = [v5 name];
        if (v15 == v16)
        {
          char v12 = 1;
        }
        else
        {
          v17 = [(BMFindMyLocationChange *)self name];
          v18 = [v5 name];
          char v12 = [v17 isEqual:v18];
        }
        goto LABEL_12;
      }
    }
LABEL_11:
    char v12 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v12 = 0;
LABEL_13:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMFindMyLocationChange *)self idsHandle];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFindMyLocationChange stateChange](self, "stateChange"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFindMyLocationChange activityState](self, "activityState"));
  v6 = [(BMFindMyLocationChange *)self name];
  v13[0] = @"idsHandle";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"stateChange";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"activityState";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"name";
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

  return v11;
}

- (BMFindMyLocationChange)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"idsHandle"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v32 = 0;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"stateChange"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v9 = 0;
            int v13 = 0;
            goto LABEL_30;
          }
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v24 = *MEMORY[0x1E4F502C8];
          uint64_t v37 = *MEMORY[0x1E4F28568];
          v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"stateChange"];
          v38 = v16;
          int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          id v25 = (id)[v23 initWithDomain:v24 code:2 userInfo:v14];
          v9 = 0;
          int v13 = 0;
          *a4 = v25;
          goto LABEL_29;
        }
        id v10 = [NSNumber numberWithInt:BMFindMyLocationChangeStateChangeFromString(v8)];
      }
      v9 = v10;
    }
    else
    {
      v9 = 0;
    }
    int v14 = [v6 objectForKeyedSubscript:@"activityState"];
    v31 = self;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = a4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            int v13 = 0;
            self = v31;
            goto LABEL_29;
          }
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v26 = *MEMORY[0x1E4F502C8];
          uint64_t v35 = *MEMORY[0x1E4F28568];
          id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"activityState"];
          id v36 = v19;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          id v27 = (id)[v30 initWithDomain:v26 code:2 userInfo:v18];
          v16 = 0;
          int v13 = 0;
          id *v15 = v27;
          goto LABEL_41;
        }
        id v17 = [NSNumber numberWithInt:BMFindMyLocationChangeActivityStateFromString(v14)];
      }
      v16 = v17;
    }
    else
    {
      v15 = a4;
      v16 = 0;
    }
    v18 = [v6 objectForKeyedSubscript:@"name"];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v19 = 0;
LABEL_27:
      self = -[BMFindMyLocationChange initWithIdsHandle:stateChange:activityState:name:](v31, "initWithIdsHandle:stateChange:activityState:name:", v32, [v9 intValue], objc_msgSend(v16, "intValue"), v19);
      int v13 = self;
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v18;
      goto LABEL_27;
    }
    if (v15)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
      v34 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id *v15 = (id)[v29 initWithDomain:v28 code:2 userInfo:v22];
    }
    id v19 = 0;
    int v13 = 0;
LABEL_41:
    self = v31;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v32 = 0;
    int v13 = 0;
    goto LABEL_31;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"idsHandle"];
  v40[0] = v9;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  id v32 = 0;
  int v13 = 0;
  *a4 = (id)[v11 initWithDomain:v12 code:2 userInfo:v8];
LABEL_30:

LABEL_31:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMFindMyLocationChange *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_idsHandle) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMFindMyLocationChange;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_55;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
          goto LABEL_38;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_42:
          if (v23 >= 4) {
            LODWORD(v23) = 0;
          }
          uint64_t v33 = 20;
          goto LABEL_51;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          break;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
LABEL_38:
          id v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_54;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v6;
        unint64_t v30 = *(void *)&v4[v29];
        if (v30 == -1 || v30 >= *(void *)&v4[*v7]) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
        *(void *)&v4[v29] = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_46;
        }
        v27 += 7;
        BOOL v16 = v28++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_48;
        }
      }
      v4[*v8] = 1;
LABEL_46:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_48:
      if (v23 >= 6) {
        LODWORD(v23) = 0;
      }
      uint64_t v33 = 24;
LABEL_51:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_54:
  }
    v34 = 0;
  else {
LABEL_55:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMFindMyLocationChange *)self idsHandle];
  id v5 = BMFindMyLocationChangeStateChangeAsString([(BMFindMyLocationChange *)self stateChange]);
  id v6 = BMFindMyLocationChangeActivityStateAsString([(BMFindMyLocationChange *)self activityState]);
  uint64_t v7 = [(BMFindMyLocationChange *)self name];
  v8 = (void *)[v3 initWithFormat:@"BMFindMyLocationChange with idsHandle: %@, stateChange: %@, activityState: %@, name: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMFindMyLocationChange)initWithIdsHandle:(id)a3 stateChange:(int)a4 activityState:(int)a5 name:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BMFindMyLocationChange;
  uint64_t v13 = [(BMEventBase *)&v15 init];
  if (v13)
  {
    v13->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v13->_idsHandle, a3);
    v13->_stateChange = a4;
    v13->_activityState = a5;
    objc_storeStrong((id *)&v13->_name, a6);
  }

  return v13;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"idsHandle" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateChange" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityState" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:6 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5F28;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"idsHandle" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stateChange" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityState" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMFindMyLocationChange;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMFindMyLocationChange_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 16) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end