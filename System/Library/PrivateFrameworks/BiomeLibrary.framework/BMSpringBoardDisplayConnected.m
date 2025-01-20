@interface BMSpringBoardDisplayConnected
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSpringBoardDisplayConnected)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSpringBoardDisplayConnected)initWithStarting:(id)a3 deviceName:(id)a4 uniqueId:(id)a5 productName:(id)a6 mirroringMode:(id)a7;
- (BOOL)hasMirroringMode;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)mirroringMode;
- (BOOL)starting;
- (NSString)description;
- (NSString)deviceName;
- (NSString)productName;
- (NSString)uniqueId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasMirroringMode:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSpringBoardDisplayConnected

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (void)setHasMirroringMode:(BOOL)a3
{
  self->_hasMirroringMode = a3;
}

- (BOOL)hasMirroringMode
{
  return self->_hasMirroringMode;
}

- (BOOL)mirroringMode
{
  return self->_mirroringMode;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)deviceName
{
  return self->_deviceName;
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
    if ([(BMSpringBoardDisplayConnected *)self hasStarting]
      || [v5 hasStarting])
    {
      if (![(BMSpringBoardDisplayConnected *)self hasStarting]) {
        goto LABEL_25;
      }
      if (![v5 hasStarting]) {
        goto LABEL_25;
      }
      int v6 = [(BMSpringBoardDisplayConnected *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_25;
      }
    }
    v7 = [(BMSpringBoardDisplayConnected *)self deviceName];
    uint64_t v8 = [v5 deviceName];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMSpringBoardDisplayConnected *)self deviceName];
      v11 = [v5 deviceName];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v14 = [(BMSpringBoardDisplayConnected *)self uniqueId];
    uint64_t v15 = [v5 uniqueId];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMSpringBoardDisplayConnected *)self uniqueId];
      v18 = [v5 uniqueId];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_25;
      }
    }
    v20 = [(BMSpringBoardDisplayConnected *)self productName];
    uint64_t v21 = [v5 productName];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMSpringBoardDisplayConnected *)self productName];
      v24 = [v5 productName];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_25;
      }
    }
    if (![(BMSpringBoardDisplayConnected *)self hasMirroringMode]
      && ![v5 hasMirroringMode])
    {
      LOBYTE(v13) = 1;
      goto LABEL_26;
    }
    if ([(BMSpringBoardDisplayConnected *)self hasMirroringMode]
      && [v5 hasMirroringMode])
    {
      BOOL v26 = [(BMSpringBoardDisplayConnected *)self mirroringMode];
      int v13 = v26 ^ [v5 mirroringMode] ^ 1;
LABEL_26:

      goto LABEL_27;
    }
LABEL_25:
    LOBYTE(v13) = 0;
    goto LABEL_26;
  }
  LOBYTE(v13) = 0;
LABEL_27:

  return v13;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if ([(BMSpringBoardDisplayConnected *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardDisplayConnected starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMSpringBoardDisplayConnected *)self deviceName];
  id v5 = [(BMSpringBoardDisplayConnected *)self uniqueId];
  int v6 = [(BMSpringBoardDisplayConnected *)self productName];
  if ([(BMSpringBoardDisplayConnected *)self hasMirroringMode])
  {
    v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardDisplayConnected mirroringMode](self, "mirroringMode"));
  }
  else
  {
    v7 = 0;
  }
  v17 = @"starting";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  v18 = @"deviceName";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  int v19 = @"uniqueId";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"productName";
  v11 = v6;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  uint64_t v21 = @"mirroringMode";
  int v12 = v7;
  if (!v7)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  int v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v6)
    {
LABEL_19:
      if (v5) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v5)
  {
LABEL_20:
    if (v4) {
      goto LABEL_21;
    }
LABEL_28:

    if (v3) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:

  if (!v4) {
    goto LABEL_28;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_29:

LABEL_22:

  return v13;
}

- (BMSpringBoardDisplayConnected)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"deviceName"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v37 = 0;
          v16 = 0;
          goto LABEL_20;
        }
        v31 = a4;
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceName"];
        id v45 = v35;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        v16 = 0;
        id v37 = 0;
        id *v31 = (id)[v21 initWithDomain:v22 code:2 userInfo:v10];
        goto LABEL_19;
      }
      id v37 = v9;
    }
    else
    {
      id v37 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"uniqueId"];
    id v34 = v8;
    v36 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v35 = 0;
          v16 = 0;
          goto LABEL_19;
        }
        v23 = a4;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueId"];
        id v43 = v13;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        v16 = 0;
        id v35 = 0;
        id *v23 = (id)[v24 initWithDomain:v25 code:2 userInfo:v11];
LABEL_18:

        self = v36;
        id v8 = v34;
LABEL_19:

        goto LABEL_20;
      }
      id v35 = v10;
    }
    else
    {
      id v35 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"productName"];
    int v12 = a4;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v13 = 0;
          v16 = 0;
          goto LABEL_18;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"productName"];
        id v41 = v15;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v27 = (id)[v32 initWithDomain:v26 code:2 userInfo:v14];
        v16 = 0;
        id v13 = 0;
        *int v12 = v27;
        goto LABEL_17;
      }
      id v13 = v11;
    }
    else
    {
      id v13 = 0;
    }
    v14 = [v6 objectForKeyedSubscript:@"mirroringMode"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v12)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mirroringMode"];
          v39 = v28;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          *int v12 = (id)[v33 initWithDomain:v30 code:2 userInfo:v29];
        }
        id v15 = 0;
        v16 = 0;
        goto LABEL_17;
      }
      id v15 = v14;
    }
    else
    {
      id v15 = 0;
    }
    v16 = [(BMSpringBoardDisplayConnected *)v36 initWithStarting:v34 deviceName:v37 uniqueId:v35 productName:v13 mirroringMode:v15];
    v36 = v16;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    id v8 = 0;
    goto LABEL_21;
  }
  v18 = a4;
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v46 = *MEMORY[0x1E4F28568];
  id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
  v47[0] = v37;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
  v16 = 0;
  id v8 = 0;
  id *v18 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
LABEL_20:

LABEL_21:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSpringBoardDisplayConnected *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_productName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasMirroringMode)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMSpringBoardDisplayConnected;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_52;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
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
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasStarting = 1;
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
              goto LABEL_41;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              uint64_t v21 = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_43:
          BOOL v34 = v21 != 0;
          uint64_t v35 = 16;
          goto LABEL_48;
        case 2u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 24;
          goto LABEL_32;
        case 3u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 32;
          goto LABEL_32;
        case 4u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 40;
LABEL_32:
          id v27 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasMirroringMode = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_51;
          }
          continue;
      }
      while (1)
      {
        uint64_t v31 = *v6;
        unint64_t v32 = *(void *)&v4[v31];
        if (v32 == -1 || v32 >= *(void *)&v4[*v7]) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
        *(void *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0) {
          goto LABEL_45;
        }
        v28 += 7;
        BOOL v16 = v29++ >= 9;
        if (v16)
        {
          uint64_t v30 = 0;
          goto LABEL_47;
        }
      }
      v4[*v8] = 1;
LABEL_45:
      if (v4[*v8]) {
        uint64_t v30 = 0;
      }
LABEL_47:
      BOOL v34 = v30 != 0;
      uint64_t v35 = 18;
LABEL_48:
      *((unsigned char *)&v5->super.super.isa + v35) = v34;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    v36 = 0;
  else {
LABEL_52:
  }
    v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardDisplayConnected starting](self, "starting"));
  id v5 = [(BMSpringBoardDisplayConnected *)self deviceName];
  id v6 = [(BMSpringBoardDisplayConnected *)self uniqueId];
  v7 = [(BMSpringBoardDisplayConnected *)self productName];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardDisplayConnected mirroringMode](self, "mirroringMode"));
  v9 = (void *)[v3 initWithFormat:@"BMSpringBoardDisplayConnected with starting: %@, deviceName: %@, uniqueId: %@, productName: %@, mirroringMode: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSpringBoardDisplayConnected)initWithStarting:(id)a3 deviceName:(id)a4 uniqueId:(id)a5 productName:(id)a6 mirroringMode:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSpringBoardDisplayConnected;
  int v17 = [(BMEventBase *)&v19 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v17->_hasStarting = 1;
      v17->_starting = [v12 BOOLValue];
    }
    else
    {
      v17->_hasStarting = 0;
      v17->_starting = 0;
    }
    objc_storeStrong((id *)&v17->_deviceName, a4);
    objc_storeStrong((id *)&v17->_uniqueId, a5);
    objc_storeStrong((id *)&v17->_productName, a6);
    if (v16)
    {
      v17->_hasMirroringMode = 1;
      v17->_mirroringMode = [v16 BOOLValue];
    }
    else
    {
      v17->_hasMirroringMode = 0;
      v17->_mirroringMode = 0;
    }
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"deviceName", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueId" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"productName" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mirroringMode" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF36A8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"productName" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mirroringMode" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSpringBoardDisplayConnected alloc] initByReadFrom:v7];
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