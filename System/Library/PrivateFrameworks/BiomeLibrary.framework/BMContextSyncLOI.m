@interface BMContextSyncLOI
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextSyncLOI)initWithID:(id)a3 deviceUUID:(id)a4 starting:(id)a5 userSpecificPlaceType:(int)a6 placeType:(int)a7;
- (BMContextSyncLOI)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)ID;
- (NSString)description;
- (NSString)deviceUUID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)placeType;
- (int)userSpecificPlaceType;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMContextSyncLOI

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

- (int)placeType
{
  return self->_placeType;
}

- (int)userSpecificPlaceType
{
  return self->_userSpecificPlaceType;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (BOOL)starting
{
  return self->_starting;
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
    v6 = [(BMContextSyncLOI *)self ID];
    uint64_t v7 = [v5 ID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextSyncLOI *)self ID];
      v10 = [v5 ID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_18;
      }
    }
    v13 = [(BMContextSyncLOI *)self deviceUUID];
    uint64_t v14 = [v5 deviceUUID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMContextSyncLOI *)self deviceUUID];
      v17 = [v5 deviceUUID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_18;
      }
    }
    if (!-[BMContextSyncLOI hasStarting](self, "hasStarting") && ![v5 hasStarting]
      || [(BMContextSyncLOI *)self hasStarting]
      && [v5 hasStarting]
      && (int v19 = -[BMContextSyncLOI starting](self, "starting"), v19 == [v5 starting]))
    {
      int v20 = [(BMContextSyncLOI *)self userSpecificPlaceType];
      if (v20 == [v5 userSpecificPlaceType])
      {
        int v21 = [(BMContextSyncLOI *)self placeType];
        BOOL v12 = v21 == [v5 placeType];
LABEL_19:

        goto LABEL_20;
      }
    }
LABEL_18:
    BOOL v12 = 0;
    goto LABEL_19;
  }
  BOOL v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMContextSyncLOI *)self ID];
  id v4 = [(BMContextSyncLOI *)self deviceUUID];
  if ([(BMContextSyncLOI *)self hasStarting])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMContextSyncLOI starting](self, "starting"));
  }
  else
  {
    id v5 = 0;
  }
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextSyncLOI userSpecificPlaceType](self, "userSpecificPlaceType"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextSyncLOI placeType](self, "placeType"));
  v17 = @"ID";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  int v18 = @"deviceUUID";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  int v19 = @"starting";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  int v20 = @"userSpecificPlaceType";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  int v21 = @"placeType";
  BOOL v12 = v7;
  if (!v7)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v6)
    {
LABEL_16:
      if (v5) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }

  if (v5)
  {
LABEL_17:
    if (v4) {
      goto LABEL_18;
    }
LABEL_25:

    if (v3) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
LABEL_24:

  if (!v4) {
    goto LABEL_25;
  }
LABEL_18:
  if (v3) {
    goto LABEL_19;
  }
LABEL_26:

LABEL_19:

  return v13;
}

- (BMContextSyncLOI)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"ID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"deviceUUID"];
    v32 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v35 = 0;
          v17 = 0;
          goto LABEL_42;
        }
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceUUID"];
        id v43 = v34;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v35 = 0;
        v17 = 0;
        id *v32 = (id)[v18 initWithDomain:v19 code:2 userInfo:v10];
        goto LABEL_41;
      }
      id v35 = v9;
    }
    else
    {
      id v35 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"starting"];
    id v33 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v34 = 0;
          v17 = 0;
          goto LABEL_41;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        BOOL v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
        v41 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v34 = 0;
        v17 = 0;
        id *v32 = (id)[v20 initWithDomain:v21 code:2 userInfo:v11];
LABEL_40:

        id v8 = v33;
LABEL_41:

        goto LABEL_42;
      }
      id v34 = v10;
    }
    else
    {
      id v34 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"userSpecificPlaceType"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            BOOL v12 = 0;
            v17 = 0;
            goto LABEL_40;
          }
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userSpecificPlaceType"];
          v39 = v23;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          BOOL v12 = 0;
          v17 = 0;
          id *v32 = (id)[v30 initWithDomain:v28 code:2 userInfo:v22];
          goto LABEL_39;
        }
        id v13 = [NSNumber numberWithInt:BMContextSyncLOIUserSpecificPlaceTypeFromString(v11)];
      }
      BOOL v12 = v13;
    }
    else
    {
      BOOL v12 = 0;
    }
    v22 = [v6 objectForKeyedSubscript:@"placeType"];
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v32)
          {
            id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v29 = *MEMORY[0x1E4F502C8];
            uint64_t v36 = *MEMORY[0x1E4F28568];
            v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeType"];
            v37 = v26;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            id *v32 = (id)[v31 initWithDomain:v29 code:2 userInfo:v27];
          }
          v23 = 0;
          v17 = 0;
          goto LABEL_39;
        }
        id v24 = [NSNumber numberWithInt:BMContextSyncLOIPlaceTypeFromString(v22)];
      }
      v23 = v24;
    }
    else
    {
      v23 = 0;
    }
    v17 = -[BMContextSyncLOI initWithID:deviceUUID:starting:userSpecificPlaceType:placeType:](self, "initWithID:deviceUUID:starting:userSpecificPlaceType:placeType:", v33, v35, v34, [v12 intValue], objc_msgSend(v23, "intValue"));
    self = v17;
LABEL_39:

    goto LABEL_40;
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
    v17 = 0;
    goto LABEL_43;
  }
  uint64_t v14 = a4;
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v44 = *MEMORY[0x1E4F28568];
  id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ID"];
  v45[0] = v35;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
  id v8 = 0;
  v17 = 0;
  *uint64_t v14 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
LABEL_42:

LABEL_43:
  return v17;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMContextSyncLOI *)self writeTo:v3];
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
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMContextSyncLOI;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_66;
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_24;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
LABEL_24:
          uint64_t v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v16 = v23++ >= 9;
                if (v16)
                {
                  uint64_t v24 = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v24 = 0;
          }
LABEL_49:
          v5->_starting = v24 != 0;
          continue;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          while (2)
          {
            uint64_t v31 = *v6;
            unint64_t v32 = *(void *)&v4[v31];
            if (v32 == -1 || v32 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v30) = 0;
          }
LABEL_53:
          if (v30 >= 5) {
            LODWORD(v30) = 0;
          }
          uint64_t v39 = 24;
          goto LABEL_62;
        case 5u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v30 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_65;
          }
          continue;
      }
      while (1)
      {
        uint64_t v36 = *v6;
        unint64_t v37 = *(void *)&v4[v36];
        if (v37 == -1 || v37 >= *(void *)&v4[*v7]) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
        *(void *)&v4[v36] = v37 + 1;
        v30 |= (unint64_t)(v38 & 0x7F) << v34;
        if ((v38 & 0x80) == 0) {
          goto LABEL_57;
        }
        v34 += 7;
        BOOL v16 = v35++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_59;
        }
      }
      v4[*v8] = 1;
LABEL_57:
      if (v4[*v8]) {
        LODWORD(v30) = 0;
      }
LABEL_59:
      if (v30 >= 4) {
        LODWORD(v30) = 0;
      }
      uint64_t v39 = 28;
LABEL_62:
      *(_DWORD *)((char *)&v5->super.super.isa + v39) = v30;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_65:
  }
    uint64_t v40 = 0;
  else {
LABEL_66:
  }
    uint64_t v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextSyncLOI *)self ID];
  id v5 = [(BMContextSyncLOI *)self deviceUUID];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMContextSyncLOI starting](self, "starting"));
  uint64_t v7 = BMContextSyncLOIUserSpecificPlaceTypeAsString([(BMContextSyncLOI *)self userSpecificPlaceType]);
  id v8 = BMContextSyncLOIPlaceTypeAsString([(BMContextSyncLOI *)self placeType]);
  v9 = (void *)[v3 initWithFormat:@"BMContextSyncLOI with ID: %@, deviceUUID: %@, starting: %@, userSpecificPlaceType: %@, placeType: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMContextSyncLOI)initWithID:(id)a3 deviceUUID:(id)a4 starting:(id)a5 userSpecificPlaceType:(int)a6 placeType:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BMContextSyncLOI;
  BOOL v16 = [(BMEventBase *)&v18 init];
  if (v16)
  {
    v16->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v16->_ID, a3);
    objc_storeStrong((id *)&v16->_deviceUUID, a4);
    if (v15)
    {
      v16->_hasStarting = 1;
      v16->_starting = [v15 BOOLValue];
    }
    else
    {
      v16->_hasStarting = 0;
      v16->_starting = 0;
    }
    v16->_userSpecificPlaceType = a6;
    v16->_placeType = a7;
  }

  return v16;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"deviceUUID", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:3 type:12 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSpecificPlaceType" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeType" number:5 type:4 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3480;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceUUID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userSpecificPlaceType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeType" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
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

    id v8 = [[BMContextSyncLOI alloc] initByReadFrom:v7];
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