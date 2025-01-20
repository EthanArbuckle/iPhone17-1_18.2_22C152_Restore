@interface BMDeviceAPSDInterfaceStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceAPSDInterfaceStatus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceAPSDInterfaceStatus)initWithStarting:(id)a3 isAPSDOverWiFi:(id)a4 isAPSDOverCell:(id)a5;
- (BOOL)hasIsAPSDOverCell;
- (BOOL)hasIsAPSDOverWiFi;
- (BOOL)hasStarting;
- (BOOL)isAPSDOverCell;
- (BOOL)isAPSDOverWiFi;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsAPSDOverCell:(BOOL)a3;
- (void)setHasIsAPSDOverWiFi:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceAPSDInterfaceStatus

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAPSDOverWiFi" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAPSDOverCell" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void)setHasIsAPSDOverCell:(BOOL)a3
{
  self->_hasIsAPSDOverCell = a3;
}

- (BOOL)hasIsAPSDOverCell
{
  return self->_hasIsAPSDOverCell;
}

- (BOOL)isAPSDOverCell
{
  return self->_isAPSDOverCell;
}

- (void)setHasIsAPSDOverWiFi:(BOOL)a3
{
  self->_hasIsAPSDOverWiFi = a3;
}

- (BOOL)hasIsAPSDOverWiFi
{
  return self->_hasIsAPSDOverWiFi;
}

- (BOOL)isAPSDOverWiFi
{
  return self->_isAPSDOverWiFi;
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
    if ([(BMDeviceAPSDInterfaceStatus *)self hasStarting]
      || [v5 hasStarting])
    {
      if (![(BMDeviceAPSDInterfaceStatus *)self hasStarting]) {
        goto LABEL_18;
      }
      if (![v5 hasStarting]) {
        goto LABEL_18;
      }
      int v6 = [(BMDeviceAPSDInterfaceStatus *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_18;
      }
    }
    if ([(BMDeviceAPSDInterfaceStatus *)self hasIsAPSDOverWiFi]
      || [v5 hasIsAPSDOverWiFi])
    {
      if (![(BMDeviceAPSDInterfaceStatus *)self hasIsAPSDOverWiFi]) {
        goto LABEL_18;
      }
      if (![v5 hasIsAPSDOverWiFi]) {
        goto LABEL_18;
      }
      int v7 = [(BMDeviceAPSDInterfaceStatus *)self isAPSDOverWiFi];
      if (v7 != [v5 isAPSDOverWiFi]) {
        goto LABEL_18;
      }
    }
    if (![(BMDeviceAPSDInterfaceStatus *)self hasIsAPSDOverCell]
      && ![v5 hasIsAPSDOverCell])
    {
      LOBYTE(v9) = 1;
      goto LABEL_19;
    }
    if ([(BMDeviceAPSDInterfaceStatus *)self hasIsAPSDOverCell]
      && [v5 hasIsAPSDOverCell])
    {
      BOOL v8 = [(BMDeviceAPSDInterfaceStatus *)self isAPSDOverCell];
      int v9 = v8 ^ [v5 isAPSDOverCell] ^ 1;
    }
    else
    {
LABEL_18:
      LOBYTE(v9) = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  LOBYTE(v9) = 0;
LABEL_20:

  return v9;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceAPSDInterfaceStatus *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceAPSDInterfaceStatus starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMDeviceAPSDInterfaceStatus *)self hasIsAPSDOverWiFi])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceAPSDInterfaceStatus isAPSDOverWiFi](self, "isAPSDOverWiFi"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMDeviceAPSDInterfaceStatus *)self hasIsAPSDOverCell])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceAPSDInterfaceStatus isAPSDOverCell](self, "isAPSDOverCell"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"starting";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"isAPSDOverWiFi";
  int v7 = v4;
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"isAPSDOverCell";
  BOOL v8 = v5;
  if (!v5)
  {
    BOOL v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
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

- (BMDeviceAPSDInterfaceStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    int v9 = [v6 objectForKeyedSubscript:@"isAPSDOverWiFi"];
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
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isAPSDOverWiFi"];
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
    v11 = [v6 objectForKeyedSubscript:@"isAPSDOverCell"];
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
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isAPSDOverCell"];
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
    self = [(BMDeviceAPSDInterfaceStatus *)self initWithStarting:v8 isAPSDOverWiFi:v10 isAPSDOverCell:v12];
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
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
  v30[0] = v10;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
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
  [(BMDeviceAPSDInterfaceStatus *)self writeTo:v3];
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
  if (self->_hasIsAPSDOverWiFi)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsAPSDOverCell)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMDeviceAPSDInterfaceStatus;
  id v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_59;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    int v9 = (int *)MEMORY[0x1E4F940B8];
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
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v22 = 0;
        v5->_hasIsAPSDOverCell = 1;
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
          if ((v32 & 0x80) == 0)
          {
            uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__isAPSDOverCell;
            goto LABEL_49;
          }
          v28 += 7;
          BOOL v26 = v29++ > 8;
          if (v26)
          {
            uint64_t v22 = 0;
            uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__isAPSDOverCell;
            goto LABEL_51;
          }
        }
        uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__isAPSDOverCell;
LABEL_48:
        v4[*v8] = 1;
      }
      else if (v19 == 2)
      {
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v22 = 0;
        v5->_hasIsAPSDOverWiFi = 1;
        while (1)
        {
          uint64_t v35 = *v6;
          unint64_t v36 = *(void *)&v4[v35];
          if (v36 == -1 || v36 >= *(void *)&v4[*v7])
          {
            uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__isAPSDOverWiFi;
            goto LABEL_48;
          }
          char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
          *(void *)&v4[v35] = v36 + 1;
          v22 |= (unint64_t)(v37 & 0x7F) << v33;
          if ((v37 & 0x80) == 0) {
            break;
          }
          v33 += 7;
          BOOL v26 = v34++ > 8;
          if (v26)
          {
            uint64_t v22 = 0;
            uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__isAPSDOverWiFi;
            goto LABEL_51;
          }
        }
        uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__isAPSDOverWiFi;
      }
      else
      {
        if (v19 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_58;
          }
          continue;
        }
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        v5->_hasStarting = 1;
        while (1)
        {
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 == -1 || v24 >= *(void *)&v4[*v7])
          {
            uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__starting;
            goto LABEL_48;
          }
          char v25 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
          *(void *)&v4[v23] = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            break;
          }
          v20 += 7;
          BOOL v26 = v21++ > 8;
          if (v26)
          {
            uint64_t v22 = 0;
            uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__starting;
            goto LABEL_51;
          }
        }
        uint64_t v27 = &OBJC_IVAR___BMDeviceAPSDInterfaceStatus__starting;
      }
LABEL_49:
      if (v4[*v8]) {
        uint64_t v22 = 0;
      }
LABEL_51:
      *((unsigned char *)&v5->super.super.isa + *v27) = v22 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_58:
  }
    v38 = 0;
  else {
LABEL_59:
  }
    v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceAPSDInterfaceStatus starting](self, "starting"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceAPSDInterfaceStatus isAPSDOverWiFi](self, "isAPSDOverWiFi"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceAPSDInterfaceStatus isAPSDOverCell](self, "isAPSDOverCell"));
  int v7 = (void *)[v3 initWithFormat:@"BMDeviceAPSDInterfaceStatus with starting: %@, isAPSDOverWiFi: %@, isAPSDOverCell: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMDeviceAPSDInterfaceStatus)initWithStarting:(id)a3 isAPSDOverWiFi:(id)a4 isAPSDOverCell:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMDeviceAPSDInterfaceStatus;
  unsigned int v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasStarting = 1;
      v11->_starting = [v8 BOOLValue];
    }
    else
    {
      v11->_hasStarting = 0;
      v11->_starting = 0;
    }
    if (v9)
    {
      v11->_hasIsAPSDOverWiFi = 1;
      v11->_isAPSDOverWiFi = [v9 BOOLValue];
    }
    else
    {
      v11->_hasIsAPSDOverWiFi = 0;
      v11->_isAPSDOverWiFi = 0;
    }
    if (v10)
    {
      v11->_hasIsAPSDOverCell = 1;
      v11->_isAPSDOverCell = [v10 BOOLValue];
    }
    else
    {
      v11->_hasIsAPSDOverCell = 0;
      v11->_isAPSDOverCell = 0;
    }
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"isAPSDOverWiFi", 2, 12, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAPSDOverCell" number:3 type:12 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF49C8;
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

    id v8 = [[BMDeviceAPSDInterfaceStatus alloc] initByReadFrom:v7];
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