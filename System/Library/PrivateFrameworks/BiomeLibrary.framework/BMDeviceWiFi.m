@interface BMDeviceWiFi
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceWiFi)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceWiFi)initWithSSID:(id)a3 starting:(id)a4;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)SSID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceWiFi

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"SSID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void).cxx_destruct
{
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

- (NSString)SSID
{
  return self->_SSID;
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
    v6 = [(BMDeviceWiFi *)self SSID];
    uint64_t v7 = [v5 SSID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDeviceWiFi *)self SSID];
      v10 = [v5 SSID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (!-[BMDeviceWiFi hasStarting](self, "hasStarting") && ![v5 hasStarting])
    {
      LOBYTE(v12) = 1;
      goto LABEL_13;
    }
    if (-[BMDeviceWiFi hasStarting](self, "hasStarting") && [v5 hasStarting])
    {
      BOOL v13 = [(BMDeviceWiFi *)self starting];
      int v12 = v13 ^ [v5 starting] ^ 1;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  LOBYTE(v12) = 0;
LABEL_14:

  return v12;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMDeviceWiFi *)self SSID];
  if ([(BMDeviceWiFi *)self hasStarting])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceWiFi starting](self, "starting"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"SSID";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"starting";
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v7;
}

- (BMDeviceWiFi)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"SSID"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        int v11 = 0;
        id v8 = 0;
        goto LABEL_9;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F502C8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"SSID"];
      v23[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
      int v11 = 0;
      id v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"starting"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
        v21 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];
      }
      id v10 = 0;
      int v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  self = [(BMDeviceWiFi *)self initWithSSID:v8 starting:v10];
  int v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceWiFi *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_SSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMDeviceWiFi;
  id v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_38;
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
      if ((v12 >> 3) == 2)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasStarting = 1;
        while (1)
        {
          uint64_t v24 = *v6;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 == -1 || v25 >= *(void *)&v4[*v7]) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_32;
          }
          v21 += 7;
          BOOL v16 = v22++ >= 9;
          if (v16)
          {
            uint64_t v23 = 0;
            goto LABEL_34;
          }
        }
        v4[*v8] = 1;
LABEL_32:
        if (v4[*v8]) {
          uint64_t v23 = 0;
        }
LABEL_34:
        v5->_starting = v23 != 0;
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v19 = PBReaderReadString();
        SSID = v5->_SSID;
        v5->_SSID = (NSString *)v19;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_37;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_37:
  }
    v27 = 0;
  else {
LABEL_38:
  }
    v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMDeviceWiFi *)self SSID];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceWiFi starting](self, "starting"));
  id v6 = (void *)[v3 initWithFormat:@"BMDeviceWiFi with SSID: %@, starting: %@", v4, v5];

  return (NSString *)v6;
}

- (BMDeviceWiFi)initWithSSID:(id)a3 starting:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMDeviceWiFi;
  v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_SSID, a3);
    if (v8)
    {
      v9->_hasStarting = 1;
      v9->_starting = [v8 BOOLValue];
    }
    else
    {
      v9->_hasStarting = 0;
      v9->_starting = 0;
    }
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"SSID" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:2 type:12 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4E00;
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

    id v8 = [[BMDeviceWiFi alloc] initByReadFrom:v7];
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