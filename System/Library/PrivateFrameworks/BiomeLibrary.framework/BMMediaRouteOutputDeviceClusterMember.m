@interface BMMediaRouteOutputDeviceClusterMember
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMediaRouteOutputDeviceClusterMember)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMediaRouteOutputDeviceClusterMember)initWithOutputDeviceID:(id)a3 type:(int)a4 subType:(int)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)outputDeviceID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)subType;
- (int)type;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMediaRouteOutputDeviceClusterMember

- (void).cxx_destruct
{
}

- (int)subType
{
  return self->_subType;
}

- (int)type
{
  return self->_type;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
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
    v6 = [(BMMediaRouteOutputDeviceClusterMember *)self outputDeviceID];
    uint64_t v7 = [v5 outputDeviceID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMediaRouteOutputDeviceClusterMember *)self outputDeviceID];
      v10 = [v5 outputDeviceID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    int v13 = [(BMMediaRouteOutputDeviceClusterMember *)self type];
    if (v13 == [v5 type])
    {
      int v14 = [(BMMediaRouteOutputDeviceClusterMember *)self subType];
      BOOL v12 = v14 == [v5 subType];
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMediaRouteOutputDeviceClusterMember *)self outputDeviceID];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaRouteOutputDeviceClusterMember type](self, "type"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaRouteOutputDeviceClusterMember subType](self, "subType"));
  v11[0] = @"outputDeviceID";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"type";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"subType";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
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

  return v9;
}

- (BMMediaRouteOutputDeviceClusterMember)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"outputDeviceID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
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
          if (!a4)
          {
            v10 = 0;
            int v14 = 0;
            goto LABEL_26;
          }
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v19 = *MEMORY[0x1E4F502C8];
          uint64_t v28 = *MEMORY[0x1E4F28568];
          v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          v29 = v16;
          v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          id v20 = (id)[v24 initWithDomain:v19 code:2 userInfo:v15];
          v10 = 0;
          int v14 = 0;
          *a4 = v20;
          goto LABEL_25;
        }
        id v11 = [NSNumber numberWithInt:BMMediaRouteOutputDeviceTypeFromString(v9)];
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    v15 = [v6 objectForKeyedSubscript:@"subType"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v23 = *MEMORY[0x1E4F502C8];
            uint64_t v26 = *MEMORY[0x1E4F28568];
            v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"subType"];
            v27 = v21;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
            *a4 = (id)[v25 initWithDomain:v23 code:2 userInfo:v22];
          }
          v16 = 0;
          int v14 = 0;
          goto LABEL_25;
        }
        id v17 = [NSNumber numberWithInt:BMMediaRouteOutputDeviceSubTypeFromString(v15)];
      }
      v16 = v17;
    }
    else
    {
      v16 = 0;
    }
    self = -[BMMediaRouteOutputDeviceClusterMember initWithOutputDeviceID:type:subType:](self, "initWithOutputDeviceID:type:subType:", v8, [v10 intValue], objc_msgSend(v16, "intValue"));
    int v14 = self;
LABEL_25:

    goto LABEL_26;
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
    int v14 = 0;
    goto LABEL_27;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v13 = *MEMORY[0x1E4F502C8];
  uint64_t v30 = *MEMORY[0x1E4F28568];
  v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"outputDeviceID"];
  v31[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  id v8 = 0;
  int v14 = 0;
  *a4 = (id)[v12 initWithDomain:v13 code:2 userInfo:v9];
LABEL_26:

LABEL_27:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMediaRouteOutputDeviceClusterMember *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_outputDeviceID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMMediaRouteOutputDeviceClusterMember;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_55;
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        uint64_t v26 = PBReaderReadString();
        outputDeviceID = v5->_outputDeviceID;
        v5->_outputDeviceID = (NSString *)v26;
      }
      else
      {
        if (v19 == 2)
        {
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v22 = 0;
          while (1)
          {
            uint64_t v30 = *v6;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v7]) {
              break;
            }
            char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 1;
            v22 |= (unint64_t)(v32 & 0x7F) << v28;
            if ((v32 & 0x80) == 0) {
              goto LABEL_46;
            }
            v28 += 7;
            BOOL v16 = v29++ >= 9;
            if (v16)
            {
              LODWORD(v22) = 0;
              goto LABEL_48;
            }
          }
          v4[*v8] = 1;
LABEL_46:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_48:
          if (v22 >= 6) {
            LODWORD(v22) = 0;
          }
          uint64_t v33 = 20;
        }
        else
        {
          if (v19 != 3)
          {
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_54;
            }
            continue;
          }
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
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
              goto LABEL_40;
            }
            v20 += 7;
            BOOL v16 = v21++ >= 9;
            if (v16)
            {
              LODWORD(v22) = 0;
              goto LABEL_42;
            }
          }
          v4[*v8] = 1;
LABEL_40:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_42:
          if (v22 >= 0x16) {
            LODWORD(v22) = 0;
          }
          uint64_t v33 = 24;
        }
        *(_DWORD *)((char *)&v5->super.super.isa + v33) = v22;
      }
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
  id v4 = [(BMMediaRouteOutputDeviceClusterMember *)self outputDeviceID];
  id v5 = BMMediaRouteOutputDeviceTypeAsString([(BMMediaRouteOutputDeviceClusterMember *)self type]);
  id v6 = BMMediaRouteOutputDeviceSubTypeAsString([(BMMediaRouteOutputDeviceClusterMember *)self subType]);
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMMediaRouteOutputDeviceClusterMember with outputDeviceID: %@, type: %@, subType: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMediaRouteOutputDeviceClusterMember)initWithOutputDeviceID:(id)a3 type:(int)a4 subType:(int)a5
{
  id v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMMediaRouteOutputDeviceClusterMember;
  char v10 = [(BMEventBase *)&v12 init];
  if (v10)
  {
    v10->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v10->_outputDeviceID, a3);
    v10->_type = a4;
    v10->_subType = a5;
  }

  return v10;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"outputDeviceID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"type", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subType" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4A70;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"outputDeviceID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMediaRouteOutputDeviceClusterMember alloc] initByReadFrom:v7];
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