@interface BMDeviceWiFiAvailabilityStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceWiFiAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceWiFiAvailabilityStatus)initWithStarting:(id)a3 isWiFiSwitchOn:(id)a4 quality:(id)a5;
- (BOOL)hasIsWiFiSwitchOn;
- (BOOL)hasQuality;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWiFiSwitchOn;
- (BOOL)starting;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)quality;
- (void)setHasIsWiFiSwitchOn:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceWiFiAvailabilityStatus

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isWiFiSwitchOn" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"quality" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
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
  if (self->_hasIsWiFiSwitchOn)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasQuality)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceWiFiAvailabilityStatus *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (BMDeviceWiFiAvailabilityStatus)initWithStarting:(id)a3 isWiFiSwitchOn:(id)a4 quality:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMDeviceWiFiAvailabilityStatus;
  v11 = [(BMEventBase *)&v14 init];
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
      v11->_hasIsWiFiSwitchOn = 1;
      v11->_isWiFiSwitchOn = [v9 BOOLValue];
    }
    else
    {
      v11->_hasIsWiFiSwitchOn = 0;
      v11->_isWiFiSwitchOn = 0;
    }
    if (v10)
    {
      v11->_hasQuality = 1;
      unsigned int v12 = [v10 unsignedIntValue];
    }
    else
    {
      unsigned int v12 = 0;
      v11->_hasQuality = 0;
    }
    v11->_quality = v12;
  }

  return v11;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (void)setHasQuality:(BOOL)a3
{
  self->_hasQuality = a3;
}

- (BOOL)hasQuality
{
  return self->_hasQuality;
}

- (unsigned)quality
{
  return self->_quality;
}

- (void)setHasIsWiFiSwitchOn:(BOOL)a3
{
  self->_hasIsWiFiSwitchOn = a3;
}

- (BOOL)hasIsWiFiSwitchOn
{
  return self->_hasIsWiFiSwitchOn;
}

- (BOOL)isWiFiSwitchOn
{
  return self->_isWiFiSwitchOn;
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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMDeviceWiFiAvailabilityStatus *)self hasStarting]
      || [v5 hasStarting])
    {
      if (![(BMDeviceWiFiAvailabilityStatus *)self hasStarting]) {
        goto LABEL_18;
      }
      if (![v5 hasStarting]) {
        goto LABEL_18;
      }
      int v6 = [(BMDeviceWiFiAvailabilityStatus *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_18;
      }
    }
    if ([(BMDeviceWiFiAvailabilityStatus *)self hasIsWiFiSwitchOn]
      || [v5 hasIsWiFiSwitchOn])
    {
      if (![(BMDeviceWiFiAvailabilityStatus *)self hasIsWiFiSwitchOn]) {
        goto LABEL_18;
      }
      if (![v5 hasIsWiFiSwitchOn]) {
        goto LABEL_18;
      }
      int v7 = [(BMDeviceWiFiAvailabilityStatus *)self isWiFiSwitchOn];
      if (v7 != [v5 isWiFiSwitchOn]) {
        goto LABEL_18;
      }
    }
    if (![(BMDeviceWiFiAvailabilityStatus *)self hasQuality]
      && ![v5 hasQuality])
    {
      BOOL v9 = 1;
      goto LABEL_19;
    }
    if ([(BMDeviceWiFiAvailabilityStatus *)self hasQuality]
      && [v5 hasQuality])
    {
      unsigned int v8 = [(BMDeviceWiFiAvailabilityStatus *)self quality];
      BOOL v9 = v8 == [v5 quality];
    }
    else
    {
LABEL_18:
      BOOL v9 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  BOOL v9 = 0;
LABEL_20:

  return v9;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceWiFiAvailabilityStatus *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceWiFiAvailabilityStatus starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMDeviceWiFiAvailabilityStatus *)self hasIsWiFiSwitchOn])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceWiFiAvailabilityStatus isWiFiSwitchOn](self, "isWiFiSwitchOn"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMDeviceWiFiAvailabilityStatus *)self hasQuality])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceWiFiAvailabilityStatus quality](self, "quality"));
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
  v11[1] = @"isWiFiSwitchOn";
  int v7 = v4;
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"quality";
  unsigned int v8 = v5;
  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
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

- (BMDeviceWiFiAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    BOOL v9 = [v6 objectForKeyedSubscript:@"isWiFiSwitchOn"];
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
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isWiFiSwitchOn"];
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
    v11 = [v6 objectForKeyedSubscript:@"quality"];
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
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"quality"];
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
    self = [(BMDeviceWiFiAvailabilityStatus *)self initWithStarting:v8 isWiFiSwitchOn:v10 quality:v12];
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
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMDeviceWiFiAvailabilityStatus;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_61;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    BOOL v9 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v12 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        v5->_hasQuality = 1;
        while (1)
        {
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 == -1 || v30 >= *(void *)&v4[*v7]) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
          *(void *)&v4[v29] = v30 + 1;
          v28 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0) {
            goto LABEL_50;
          }
          v26 += 7;
          BOOL v16 = v27++ >= 9;
          if (v16)
          {
            LODWORD(v28) = 0;
            goto LABEL_52;
          }
        }
        v4[*v8] = 1;
LABEL_50:
        if (v4[*v8]) {
          LODWORD(v28) = 0;
        }
LABEL_52:
        v5->_quality = v28;
      }
      else
      {
        if (v19 == 2)
        {
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasIsWiFiSwitchOn = 1;
          while (1)
          {
            uint64_t v35 = *v6;
            unint64_t v36 = *(void *)&v4[v35];
            if (v36 == -1 || v36 >= *(void *)&v4[*v7]) {
              break;
            }
            char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
            *(void *)&v4[v35] = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if ((v37 & 0x80) == 0) {
              goto LABEL_54;
            }
            v32 += 7;
            BOOL v16 = v33++ >= 9;
            if (v16)
            {
              uint64_t v34 = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8]) {
            uint64_t v34 = 0;
          }
LABEL_56:
          BOOL v38 = v34 != 0;
          uint64_t v39 = 18;
        }
        else
        {
          if (v19 != 1)
          {
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_60;
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
            if (v24 == -1 || v24 >= *(void *)&v4[*v7]) {
              break;
            }
            char v25 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0) {
              goto LABEL_46;
            }
            v20 += 7;
            BOOL v16 = v21++ >= 9;
            if (v16)
            {
              uint64_t v22 = 0;
              goto LABEL_48;
            }
          }
          v4[*v8] = 1;
LABEL_46:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_48:
          BOOL v38 = v22 != 0;
          uint64_t v39 = 16;
        }
        *((unsigned char *)&v5->super.super.isa + v39) = v38;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_60:
  }
    v40 = 0;
  else {
LABEL_61:
  }
    v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceWiFiAvailabilityStatus starting](self, "starting"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceWiFiAvailabilityStatus isWiFiSwitchOn](self, "isWiFiSwitchOn"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceWiFiAvailabilityStatus quality](self, "quality"));
  int v7 = (void *)[v3 initWithFormat:@"BMDeviceWiFiAvailabilityStatus with starting: %@, isWiFiSwitchOn: %@, quality: %@", v4, v5, v6];

  return (NSString *)v7;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"isWiFiSwitchOn", 2, 12, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"quality" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3F18;
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

    id v8 = [[BMDeviceWiFiAvailabilityStatus alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

@end