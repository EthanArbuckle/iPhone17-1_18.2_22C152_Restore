@interface BMDeviceBatteryTemperature
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceBatteryTemperature)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceBatteryTemperature)initWithTemperature:(id)a3 pluggedIn:(id)a4;
- (BOOL)hasPluggedIn;
- (BOOL)hasTemperature;
- (BOOL)isEqual:(id)a3;
- (BOOL)pluggedIn;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)temperature;
- (unsigned)dataVersion;
- (void)setHasPluggedIn:(BOOL)a3;
- (void)setHasTemperature:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceBatteryTemperature

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"temperature" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pluggedIn" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)setHasPluggedIn:(BOOL)a3
{
  self->_hasPluggedIn = a3;
}

- (BOOL)hasPluggedIn
{
  return self->_hasPluggedIn;
}

- (BOOL)pluggedIn
{
  return self->_pluggedIn;
}

- (void)setHasTemperature:(BOOL)a3
{
  self->_hasTemperature = a3;
}

- (BOOL)hasTemperature
{
  return self->_hasTemperature;
}

- (int)temperature
{
  return self->_temperature;
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
    if ([(BMDeviceBatteryTemperature *)self hasTemperature]
      || [v5 hasTemperature])
    {
      if (![(BMDeviceBatteryTemperature *)self hasTemperature]) {
        goto LABEL_13;
      }
      if (![v5 hasTemperature]) {
        goto LABEL_13;
      }
      int v6 = [(BMDeviceBatteryTemperature *)self temperature];
      if (v6 != [v5 temperature]) {
        goto LABEL_13;
      }
    }
    if (![(BMDeviceBatteryTemperature *)self hasPluggedIn]
      && ![v5 hasPluggedIn])
    {
      LOBYTE(v8) = 1;
      goto LABEL_14;
    }
    if ([(BMDeviceBatteryTemperature *)self hasPluggedIn]
      && [v5 hasPluggedIn])
    {
      BOOL v7 = [(BMDeviceBatteryTemperature *)self pluggedIn];
      int v8 = v7 ^ [v5 pluggedIn] ^ 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v8) = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v8) = 0;
LABEL_15:

  return v8;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceBatteryTemperature *)self hasTemperature])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryTemperature temperature](self, "temperature"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMDeviceBatteryTemperature *)self hasPluggedIn])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBatteryTemperature pluggedIn](self, "pluggedIn"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"temperature";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"pluggedIn";
  v10[0] = v5;
  int v6 = v4;
  if (!v4)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_13;
    }
  }

LABEL_13:

  return v7;
}

- (BMDeviceBatteryTemperature)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [v6 objectForKeyedSubscript:@"temperature"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        id v8 = 0;
        goto LABEL_9;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F502C8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"temperature"];
      v23[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
      v11 = 0;
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
  v9 = [v6 objectForKeyedSubscript:@"pluggedIn"];
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
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pluggedIn"];
        v21 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];
      }
      id v10 = 0;
      v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  self = [(BMDeviceBatteryTemperature *)self initWithTemperature:v8 pluggedIn:v10];
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceBatteryTemperature *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasTemperature)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasPluggedIn)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMDeviceBatteryTemperature;
  id v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_48;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  BOOL v7 = (int *)MEMORY[0x1E4F940E0];
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
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        v5->_hasPluggedIn = 1;
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
            goto LABEL_42;
          }
          v25 += 7;
          BOOL v16 = v26++ >= 9;
          if (v16)
          {
            uint64_t v27 = 0;
            goto LABEL_44;
          }
        }
        v4[*v8] = 1;
LABEL_42:
        if (v4[*v8]) {
          uint64_t v27 = 0;
        }
LABEL_44:
        v5->_pluggedIn = v27 != 0;
      }
      else if ((v12 >> 3) == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        v5->_hasTemperature = 1;
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
            goto LABEL_38;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8]) {
          LODWORD(v21) = 0;
        }
LABEL_40:
        v5->_temperature = v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_47;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    v31 = 0;
  else {
LABEL_48:
  }
    v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceBatteryTemperature temperature](self, "temperature"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBatteryTemperature pluggedIn](self, "pluggedIn"));
  id v6 = (void *)[v3 initWithFormat:@"BMDeviceBatteryTemperature with temperature: %@, pluggedIn: %@", v4, v5];

  return (NSString *)v6;
}

- (BMDeviceBatteryTemperature)initWithTemperature:(id)a3 pluggedIn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMDeviceBatteryTemperature;
  id v8 = [(BMEventBase *)&v11 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasTemperature = 1;
      int v9 = [v6 intValue];
    }
    else
    {
      v8->_hasTemperature = 0;
      int v9 = -1;
    }
    v8->_temperature = v9;
    if (v7)
    {
      v8->_hasPluggedIn = 1;
      v8->_pluggedIn = [v7 BOOLValue];
    }
    else
    {
      v8->_hasPluggedIn = 0;
      v8->_pluggedIn = 0;
    }
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"temperature" number:1 type:2 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pluggedIn" number:2 type:12 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4578;
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

    id v8 = [[BMDeviceBatteryTemperature alloc] initByReadFrom:v7];
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