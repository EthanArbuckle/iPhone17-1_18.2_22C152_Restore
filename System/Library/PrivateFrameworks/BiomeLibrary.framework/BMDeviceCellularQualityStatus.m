@interface BMDeviceCellularQualityStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceCellularQualityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceCellularQualityStatus)initWithStarting:(id)a3 rat:(int)a4 deviceRegistrationState:(int)a5 quality:(id)a6 rrcStatus:(int)a7;
- (BOOL)hasQuality;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)deviceRegistrationState;
- (int)quality;
- (int)rat;
- (int)rrcStatus;
- (unsigned)dataVersion;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceCellularQualityStatus

- (int)rrcStatus
{
  return self->_rrcStatus;
}

- (void)setHasQuality:(BOOL)a3
{
  self->_hasQuality = a3;
}

- (BOOL)hasQuality
{
  return self->_hasQuality;
}

- (int)quality
{
  return self->_quality;
}

- (int)deviceRegistrationState
{
  return self->_deviceRegistrationState;
}

- (int)rat
{
  return self->_rat;
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
    if ((![(BMDeviceCellularQualityStatus *)self hasStarting]
       && ![v5 hasStarting]
       || [(BMDeviceCellularQualityStatus *)self hasStarting]
       && [v5 hasStarting]
       && (int v6 = [(BMDeviceCellularQualityStatus *)self starting],
           v6 == [v5 starting]))
      && (int v7 = -[BMDeviceCellularQualityStatus rat](self, "rat"), v7 == [v5 rat])
      && (int v8 = [(BMDeviceCellularQualityStatus *)self deviceRegistrationState],
          v8 == [v5 deviceRegistrationState])
      && (![(BMDeviceCellularQualityStatus *)self hasQuality]
       && ![v5 hasQuality]
       || [(BMDeviceCellularQualityStatus *)self hasQuality]
       && [v5 hasQuality]
       && (int v9 = [(BMDeviceCellularQualityStatus *)self quality],
           v9 == [v5 quality])))
    {
      int v10 = [(BMDeviceCellularQualityStatus *)self rrcStatus];
      BOOL v11 = v10 == [v5 rrcStatus];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceCellularQualityStatus *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceCellularQualityStatus starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularQualityStatus rat](self, "rat"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularQualityStatus deviceRegistrationState](self, "deviceRegistrationState"));
  if ([(BMDeviceCellularQualityStatus *)self hasQuality])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularQualityStatus quality](self, "quality"));
  }
  else
  {
    int v6 = 0;
  }
  int v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularQualityStatus rrcStatus](self, "rrcStatus"));
  v17 = @"starting";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  v18 = @"rat";
  int v9 = v4;
  if (!v4)
  {
    int v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"deviceRegistrationState";
  int v10 = v5;
  if (!v5)
  {
    int v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"quality";
  BOOL v11 = v6;
  if (!v6)
  {
    BOOL v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"rrcStatus";
  v12 = v7;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
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

- (BMDeviceCellularQualityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"starting"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v37 = 0;
        v13 = 0;
        v21 = self;
        goto LABEL_43;
      }
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v12 = *MEMORY[0x1E4F502C8];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
      v47[0] = v36;
      int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      id v37 = 0;
      v13 = 0;
      *a4 = (id)[v11 initWithDomain:v12 code:2 userInfo:v7];
      goto LABEL_56;
    }
    id v37 = v6;
  }
  else
  {
    id v37 = 0;
  }
  int v7 = [v5 objectForKeyedSubscript:@"rat"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = v7;
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = [NSNumber numberWithInt:BMDeviceCellularQualityStatusRATFromString(v7)];
        goto LABEL_7;
      }
      if (a4)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        int v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"rat"];
        v45 = v9;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        id v36 = 0;
        v13 = 0;
        *a4 = (id)[v23 initWithDomain:v24 code:2 userInfo:v8];
        goto LABEL_58;
      }
      id v36 = 0;
      v13 = 0;
LABEL_56:
      v21 = self;
      goto LABEL_42;
    }
  }
  id v36 = 0;
LABEL_7:
  uint64_t v8 = [v5 objectForKeyedSubscript:@"deviceRegistrationState"];
  v34 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
LABEL_22:
        int v9 = v10;
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [NSNumber numberWithInt:BMDeviceCellularQualityStatusStateFromString(v8)];
        goto LABEL_22;
      }
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        v26 = a4;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"deviceRegistrationState"];
        id v43 = v15;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        int v9 = 0;
        v13 = 0;
        id *v26 = (id)[v25 initWithDomain:v27 code:2 userInfo:v14];
        goto LABEL_54;
      }
      int v9 = 0;
      v13 = 0;
LABEL_58:
      v21 = self;
      goto LABEL_41;
    }
  }
  int v9 = 0;
LABEL_23:
  v14 = [v5 objectForKeyedSubscript:@"quality"];
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        goto LABEL_26;
      }
      if (a4)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        v19 = a4;
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"quality"];
        v41 = a4;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v20 = (id)[v32 initWithDomain:v18 code:2 userInfo:v16];
        id v15 = 0;
        v13 = 0;
        id *v19 = v20;
        goto LABEL_52;
      }
      id v15 = 0;
      v13 = 0;
LABEL_54:
      v21 = self;
      goto LABEL_40;
    }
  }
  id v15 = 0;
LABEL_26:
  v16 = [v5 objectForKeyedSubscript:@"rrcStatus"];
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = v16;
LABEL_37:
        a4 = v17;
        goto LABEL_38;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [NSNumber numberWithInt:BMDeviceCellularQualityStatusRRCFromString(v16)];
        goto LABEL_37;
      }
      if (a4)
      {
        v28 = a4;
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v38 = *MEMORY[0x1E4F28568];
        v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"rrcStatus"];
        v39 = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        id *v28 = (id)[v33 initWithDomain:v31 code:2 userInfo:v30];

        a4 = 0;
      }
      v13 = 0;
LABEL_52:
      v21 = self;
      goto LABEL_39;
    }
  }
  a4 = 0;
LABEL_38:
  v21 = -[BMDeviceCellularQualityStatus initWithStarting:rat:deviceRegistrationState:quality:rrcStatus:](self, "initWithStarting:rat:deviceRegistrationState:quality:rrcStatus:", v37, [v36 intValue], objc_msgSend(v9, "intValue"), v15, objc_msgSend(a4, "intValue"));
  v13 = v21;
LABEL_39:

LABEL_40:
  int v6 = v34;
LABEL_41:

LABEL_42:
LABEL_43:

  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceCellularQualityStatus *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasQuality) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMDeviceCellularQualityStatus;
  id v5 = [(BMEventBase *)&v50 init];
  if (!v5) {
    goto LABEL_87;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          while (2)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
              *(void *)&v4[v22] = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                BOOL v16 = v20++ >= 9;
                if (v16)
                {
                  uint64_t v21 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_60:
          v5->_starting = v21 != 0;
          continue;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
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
              goto LABEL_62;
            }
            v25 += 7;
            BOOL v16 = v26++ >= 9;
            if (v16)
            {
              LODWORD(v27) = 0;
              goto LABEL_64;
            }
          }
          v4[*v8] = 1;
LABEL_62:
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_64:
          if (v27 >= 7) {
            LODWORD(v27) = 0;
          }
          uint64_t v47 = 24;
          goto LABEL_83;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v33 = *v6;
            unint64_t v34 = *(void *)&v4[v33];
            if (v34 == -1 || v34 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v34 + 1;
              v27 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v16 = v32++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_70:
          if (v27 >= 5) {
            LODWORD(v27) = 0;
          }
          uint64_t v47 = 28;
          goto LABEL_83;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          v5->_hasQuality = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            unint64_t v40 = *(void *)&v4[v39];
            if (v40 == -1 || v40 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v40 + 1;
              v38 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v16 = v37++ >= 9;
                if (v16)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v38) = 0;
          }
LABEL_76:
          v5->_quality = v38;
          continue;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v27 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_86;
          }
          continue;
      }
      while (1)
      {
        uint64_t v44 = *v6;
        unint64_t v45 = *(void *)&v4[v44];
        if (v45 == -1 || v45 >= *(void *)&v4[*v7]) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
        *(void *)&v4[v44] = v45 + 1;
        v27 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0) {
          goto LABEL_78;
        }
        v42 += 7;
        BOOL v16 = v43++ >= 9;
        if (v16)
        {
          LODWORD(v27) = 0;
          goto LABEL_80;
        }
      }
      v4[*v8] = 1;
LABEL_78:
      if (v4[*v8]) {
        LODWORD(v27) = 0;
      }
LABEL_80:
      if (v27 >= 3) {
        LODWORD(v27) = 0;
      }
      uint64_t v47 = 36;
LABEL_83:
      *(_DWORD *)((char *)&v5->super.super.isa + v47) = v27;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_86:
  }
    v48 = 0;
  else {
LABEL_87:
  }
    v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceCellularQualityStatus starting](self, "starting"));
  id v5 = BMDeviceCellularQualityStatusRATAsString([(BMDeviceCellularQualityStatus *)self rat]);
  int v6 = BMDeviceCellularQualityStatusStateAsString([(BMDeviceCellularQualityStatus *)self deviceRegistrationState]);
  int v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceCellularQualityStatus quality](self, "quality"));
  uint64_t v8 = BMDeviceCellularQualityStatusRRCAsString([(BMDeviceCellularQualityStatus *)self rrcStatus]);
  int v9 = (void *)[v3 initWithFormat:@"BMDeviceCellularQualityStatus with starting: %@, rat: %@, deviceRegistrationState: %@, quality: %@, rrcStatus: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMDeviceCellularQualityStatus)initWithStarting:(id)a3 rat:(int)a4 deviceRegistrationState:(int)a5 quality:(id)a6 rrcStatus:(int)a7
{
  id v12 = a3;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMDeviceCellularQualityStatus;
  unint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v14->_hasStarting = 1;
      v14->_starting = [v12 BOOLValue];
    }
    else
    {
      v14->_hasStarting = 0;
      v14->_starting = 0;
    }
    v14->_rat = a4;
    v14->_deviceRegistrationState = a5;
    if (v13)
    {
      v14->_hasQuality = 1;
      int v15 = [v13 intValue];
    }
    else
    {
      v14->_hasQuality = 0;
      int v15 = -1;
    }
    v14->_quality = v15;
    v14->_rrcStatus = a7;
  }

  return v14;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"rat", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceRegistrationState" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"quality" number:4 type:2 subMessageClass:0];
  v9[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rrcStatus" number:5 type:4 subMessageClass:0];
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6A20;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rat" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceRegistrationState" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"quality" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rrcStatus" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMDeviceCellularQualityStatus alloc] initByReadFrom:v7];
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