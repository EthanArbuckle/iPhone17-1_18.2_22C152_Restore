@interface BMDeviceBluetoothNearbyDevice
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceBluetoothNearbyDevice)initWithInitiator:(id)a3 localIdentifier:(id)a4 starting:(id)a5 useCase:(id)a6;
- (BMDeviceBluetoothNearbyDevice)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasInitiator;
- (BOOL)hasStarting;
- (BOOL)hasUseCase;
- (BOOL)initiator;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)description;
- (NSString)localIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)useCase;
- (unsigned)dataVersion;
- (void)setHasInitiator:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setHasUseCase:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceBluetoothNearbyDevice

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"initiator" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"localIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"useCase" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:5 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)setHasUseCase:(BOOL)a3
{
  self->_hasUseCase = a3;
}

- (BOOL)hasUseCase
{
  return self->_hasUseCase;
}

- (unint64_t)useCase
{
  return self->_useCase;
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

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setHasInitiator:(BOOL)a3
{
  self->_hasInitiator = a3;
}

- (BOOL)hasInitiator
{
  return self->_hasInitiator;
}

- (BOOL)initiator
{
  return self->_initiator;
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
    if ([(BMDeviceBluetoothNearbyDevice *)self hasInitiator]
      || [v5 hasInitiator])
    {
      if (![(BMDeviceBluetoothNearbyDevice *)self hasInitiator]) {
        goto LABEL_22;
      }
      if (![v5 hasInitiator]) {
        goto LABEL_22;
      }
      int v6 = [(BMDeviceBluetoothNearbyDevice *)self initiator];
      if (v6 != [v5 initiator]) {
        goto LABEL_22;
      }
    }
    v7 = [(BMDeviceBluetoothNearbyDevice *)self localIdentifier];
    uint64_t v8 = [v5 localIdentifier];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMDeviceBluetoothNearbyDevice *)self localIdentifier];
      v11 = [v5 localIdentifier];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_22;
      }
    }
    if (![(BMDeviceBluetoothNearbyDevice *)self hasStarting]
      && ![v5 hasStarting]
      || [(BMDeviceBluetoothNearbyDevice *)self hasStarting]
      && [v5 hasStarting]
      && (int v14 = [(BMDeviceBluetoothNearbyDevice *)self starting],
          v14 == [v5 starting]))
    {
      if (![(BMDeviceBluetoothNearbyDevice *)self hasUseCase]
        && ![v5 hasUseCase])
      {
        BOOL v13 = 1;
        goto LABEL_23;
      }
      if ([(BMDeviceBluetoothNearbyDevice *)self hasUseCase]
        && [v5 hasUseCase])
      {
        unint64_t v15 = [(BMDeviceBluetoothNearbyDevice *)self useCase];
        BOOL v13 = v15 == [v5 useCase];
LABEL_23:

        goto LABEL_24;
      }
    }
LABEL_22:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  BOOL v13 = 0;
LABEL_24:

  return v13;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceBluetoothNearbyDevice *)self hasInitiator])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothNearbyDevice initiator](self, "initiator"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMDeviceBluetoothNearbyDevice *)self localIdentifier];
  if ([(BMDeviceBluetoothNearbyDevice *)self hasStarting])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothNearbyDevice starting](self, "starting"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMDeviceBluetoothNearbyDevice *)self hasUseCase])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMDeviceBluetoothNearbyDevice useCase](self, "useCase"));
  }
  else
  {
    int v6 = 0;
  }
  v13[0] = @"initiator";
  v7 = v3;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"localIdentifier";
  uint64_t v8 = v4;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"starting";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"useCase";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v5)
    {
LABEL_20:
      if (v4) {
        goto LABEL_21;
      }
LABEL_27:

      if (v3) {
        goto LABEL_22;
      }
      goto LABEL_28;
    }
  }

  if (!v4) {
    goto LABEL_27;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_28:

LABEL_22:

  return v11;
}

- (BMDeviceBluetoothNearbyDevice)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"initiator"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"localIdentifier"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          unint64_t v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"localIdentifier"];
        id v38 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        unint64_t v15 = 0;
        a4 = 0;
        id *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"starting"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          unint64_t v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
        id v36 = v14;
        BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        unint64_t v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      id v12 = v10;
    }
    else
    {
      v11 = self;
      id v12 = 0;
    }
    BOOL v13 = [v6 objectForKeyedSubscript:@"useCase"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      unint64_t v15 = [(BMDeviceBluetoothNearbyDevice *)v11 initWithInitiator:v8 localIdentifier:v31 starting:v12 useCase:v14];
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"useCase"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    unint64_t v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    unint64_t v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"initiator"];
  v40[0] = v18;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  unint64_t v15 = 0;
  id v8 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceBluetoothNearbyDevice *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasInitiator)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_localIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasUseCase)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMDeviceBluetoothNearbyDevice;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5) {
    goto LABEL_60;
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
          v5->_hasInitiator = 1;
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
              goto LABEL_45;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              uint64_t v21 = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_47:
          BOOL v39 = v21 != 0;
          uint64_t v40 = 16;
          goto LABEL_52;
        case 2u:
          uint64_t v25 = PBReaderReadString();
          localIdentifier = v5->_localIdentifier;
          v5->_localIdentifier = (NSString *)v25;

          continue;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            uint64_t v30 = *v6;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
              *(void *)&v4[v30] = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  uint64_t v29 = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v29 = 0;
          }
LABEL_51:
          BOOL v39 = v29 != 0;
          uint64_t v40 = 18;
LABEL_52:
          *((unsigned char *)&v5->super.super.isa + v40) = v39;
          continue;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          unint64_t v35 = 0;
          v5->_hasUseCase = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_59;
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
        v35 |= (unint64_t)(v38 & 0x7F) << v33;
        if ((v38 & 0x80) == 0) {
          goto LABEL_54;
        }
        v33 += 7;
        BOOL v16 = v34++ >= 9;
        if (v16)
        {
          unint64_t v35 = 0;
          goto LABEL_56;
        }
      }
      v4[*v8] = 1;
LABEL_54:
      if (v4[*v8]) {
        unint64_t v35 = 0;
      }
LABEL_56:
      v5->_useCase = v35;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_59:
  }
    v41 = 0;
  else {
LABEL_60:
  }
    v41 = v5;

  return v41;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothNearbyDevice initiator](self, "initiator"));
  id v5 = [(BMDeviceBluetoothNearbyDevice *)self localIdentifier];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceBluetoothNearbyDevice starting](self, "starting"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMDeviceBluetoothNearbyDevice useCase](self, "useCase"));
  id v8 = (void *)[v3 initWithFormat:@"BMDeviceBluetoothNearbyDevice with initiator: %@, localIdentifier: %@, starting: %@, useCase: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMDeviceBluetoothNearbyDevice)initWithInitiator:(id)a3 localIdentifier:(id)a4 starting:(id)a5 useCase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMDeviceBluetoothNearbyDevice;
  unint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasInitiator = 1;
      v14->_initiator = [v10 BOOLValue];
    }
    else
    {
      v14->_hasInitiator = 0;
      v14->_initiator = 0;
    }
    objc_storeStrong((id *)&v14->_localIdentifier, a4);
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
    if (v13)
    {
      v14->_hasUseCase = 1;
      uint64_t v15 = [v13 unsignedLongLongValue];
    }
    else
    {
      uint64_t v15 = 0;
      v14->_hasUseCase = 0;
    }
    v14->_useCase = v15;
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"initiator" number:1 type:12 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"localIdentifier" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:3 type:12 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"useCase" number:4 type:5 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6450;
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

    id v8 = [[BMDeviceBluetoothNearbyDevice alloc] initByReadFrom:v7];
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