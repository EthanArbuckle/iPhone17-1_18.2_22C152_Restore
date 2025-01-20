@interface BMMediaNowPlayingOutputDevice
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMediaNowPlayingOutputDevice)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMediaNowPlayingOutputDevice)initWithType:(int)a3 subType:(int)a4 outputDeviceID:(id)a5;
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

@implementation BMMediaNowPlayingOutputDevice

- (void).cxx_destruct
{
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (int)subType
{
  return self->_subType;
}

- (int)type
{
  return self->_type;
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
    int v6 = [(BMMediaNowPlayingOutputDevice *)self type];
    if (v6 == [v5 type]
      && (int v7 = -[BMMediaNowPlayingOutputDevice subType](self, "subType"), v7 == [v5 subType]))
    {
      v8 = [(BMMediaNowPlayingOutputDevice *)self outputDeviceID];
      v9 = [v5 outputDeviceID];
      if (v8 == v9)
      {
        char v12 = 1;
      }
      else
      {
        v10 = [(BMMediaNowPlayingOutputDevice *)self outputDeviceID];
        v11 = [v5 outputDeviceID];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaNowPlayingOutputDevice type](self, "type"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaNowPlayingOutputDevice subType](self, "subType"));
  id v5 = [(BMMediaNowPlayingOutputDevice *)self outputDeviceID];
  v11[0] = @"type";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"subType";
  int v7 = v4;
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"outputDeviceID";
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

- (BMMediaNowPlayingOutputDevice)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"type"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"subType"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v11 = 0;
            v15 = 0;
            goto LABEL_22;
          }
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v21 = *MEMORY[0x1E4F502C8];
          uint64_t v28 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"subType"];
          id v29 = v14;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          id v22 = (id)[v25 initWithDomain:v21 code:2 userInfo:v13];
          v11 = 0;
          v15 = 0;
          *a4 = v22;
          goto LABEL_21;
        }
        id v12 = [NSNumber numberWithInt:BMMediaNowPlayingOutputDeviceSubTypeFromString(v10)];
      }
      v11 = v12;
    }
    else
    {
      v11 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"outputDeviceID"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v23 = *MEMORY[0x1E4F502C8];
          uint64_t v26 = *MEMORY[0x1E4F28568];
          v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"outputDeviceID"];
          v27 = v17;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          *a4 = (id)[v24 initWithDomain:v23 code:2 userInfo:v18];
        }
        id v14 = 0;
        v15 = 0;
        goto LABEL_21;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    self = -[BMMediaNowPlayingOutputDevice initWithType:subType:outputDeviceID:](self, "initWithType:subType:outputDeviceID:", [v8 intValue], objc_msgSend(v11, "intValue"), v14);
    v15 = self;
LABEL_21:

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMMediaNowPlayingOutputDeviceTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v15 = 0;
    goto LABEL_23;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v30 = *MEMORY[0x1E4F28568];
  v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
  v31[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v8 = 0;
  v15 = 0;
  *a4 = (id)[v19 initWithDomain:v20 code:2 userInfo:v10];
LABEL_22:

LABEL_23:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMediaNowPlayingOutputDevice *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_outputDeviceID) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMMediaNowPlayingOutputDevice;
  id v5 = [(BMEventBase *)&v39 init];
  if (!v5) {
    goto LABEL_55;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v8]) {
        goto LABEL_53;
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
        goto LABEL_53;
      }
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 1) {
        break;
      }
      if (v20 != 3)
      {
        if (v20 != 2)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_54;
          }
          goto LABEL_52;
        }
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
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
            goto LABEL_40;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_42:
        if (v23 >= 0x15) {
          LODWORD(v23) = 0;
        }
        uint64_t v36 = 24;
        goto LABEL_51;
      }
      uint64_t v34 = PBReaderReadString();
      outputDeviceID = v5->_outputDeviceID;
      v5->_outputDeviceID = (NSString *)v34;

LABEL_52:
      if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
        goto LABEL_53;
      }
    }
    char v28 = 0;
    unsigned int v29 = 0;
    uint64_t v23 = 0;
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
        goto LABEL_46;
      }
      v28 += 7;
      BOOL v17 = v29++ >= 9;
      if (v17)
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
    uint64_t v36 = 20;
LABEL_51:
    *(_DWORD *)((char *)&v5->super.super.isa + v36) = v23;
    goto LABEL_52;
  }
LABEL_53:
  if (v4[*v8]) {
LABEL_54:
  }
    v37 = 0;
  else {
LABEL_55:
  }
    v37 = v5;

  return v37;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMediaNowPlayingOutputDeviceTypeAsString([(BMMediaNowPlayingOutputDevice *)self type]);
  id v5 = BMMediaNowPlayingOutputDeviceSubTypeAsString([(BMMediaNowPlayingOutputDevice *)self subType]);
  id v6 = [(BMMediaNowPlayingOutputDevice *)self outputDeviceID];
  int v7 = (void *)[v3 initWithFormat:@"BMMediaNowPlayingOutputDevice with type: %@, subType: %@, outputDeviceID: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMediaNowPlayingOutputDevice)initWithType:(int)a3 subType:(int)a4 outputDeviceID:(id)a5
{
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BMMediaNowPlayingOutputDevice;
  char v10 = [(BMEventBase *)&v12 init];
  if (v10)
  {
    v10->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v10->_type = a3;
    v10->_subType = a4;
    objc_storeStrong((id *)&v10->_outputDeviceID, a5);
  }

  return v10;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"subType", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"outputDeviceID" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF38B8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"outputDeviceID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    int v7 = [[BMMediaNowPlayingOutputDevice alloc] initByReadFrom:v6];
    v8 = v7;
    if (v7) {
      void v7[4] = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end