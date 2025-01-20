@interface BMOasisAnalyticsDeviceInfo
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsDeviceInfo)initWithIsInternal:(id)a3 systemBuild:(id)a4 deviceType:(id)a5 deviceId:(id)a6;
- (BMOasisAnalyticsDeviceInfo)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsInternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (NSString)description;
- (NSString)deviceId;
- (NSString)deviceType;
- (NSString)systemBuild;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsInternal:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);

  objc_storeStrong((id *)&self->_systemBuild, 0);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setHasIsInternal:(BOOL)a3
{
  self->_hasIsInternal = a3;
}

- (BOOL)hasIsInternal
{
  return self->_hasIsInternal;
}

- (BOOL)isInternal
{
  return self->_isInternal;
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
    if ([(BMOasisAnalyticsDeviceInfo *)self hasIsInternal]
      || [v5 hasIsInternal])
    {
      if (![(BMOasisAnalyticsDeviceInfo *)self hasIsInternal]) {
        goto LABEL_14;
      }
      if (![v5 hasIsInternal]) {
        goto LABEL_14;
      }
      int v6 = [(BMOasisAnalyticsDeviceInfo *)self isInternal];
      if (v6 != [v5 isInternal]) {
        goto LABEL_14;
      }
    }
    v7 = [(BMOasisAnalyticsDeviceInfo *)self systemBuild];
    uint64_t v8 = [v5 systemBuild];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMOasisAnalyticsDeviceInfo *)self systemBuild];
      v11 = [v5 systemBuild];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_14;
      }
    }
    v14 = [(BMOasisAnalyticsDeviceInfo *)self deviceType];
    uint64_t v15 = [v5 deviceType];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMOasisAnalyticsDeviceInfo *)self deviceType];
      v18 = [v5 deviceType];
      int v19 = [v17 isEqual:v18];

      if (!v19)
      {
LABEL_14:
        char v13 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v21 = [(BMOasisAnalyticsDeviceInfo *)self deviceId];
    v22 = [v5 deviceId];
    if (v21 == v22)
    {
      char v13 = 1;
    }
    else
    {
      v23 = [(BMOasisAnalyticsDeviceInfo *)self deviceId];
      v24 = [v5 deviceId];
      char v13 = [v23 isEqual:v24];
    }
    goto LABEL_15;
  }
  char v13 = 0;
LABEL_16:

  return v13;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if ([(BMOasisAnalyticsDeviceInfo *)self hasIsInternal])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMOasisAnalyticsDeviceInfo isInternal](self, "isInternal"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMOasisAnalyticsDeviceInfo *)self systemBuild];
  id v5 = [(BMOasisAnalyticsDeviceInfo *)self deviceType];
  int v6 = [(BMOasisAnalyticsDeviceInfo *)self deviceId];
  v13[0] = @"isInternal";
  v7 = v3;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"systemBuild";
  uint64_t v8 = v4;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"deviceType";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"deviceId";
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
      goto LABEL_14;
    }
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4) {
        goto LABEL_15;
      }
LABEL_21:

      if (v3) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v11;
}

- (BMOasisAnalyticsDeviceInfo)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"isInternal"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"systemBuild"];
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v15 = 0;
          goto LABEL_16;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemBuild"];
        id v37 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        uint64_t v15 = 0;
        *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"deviceType"];
    v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          uint64_t v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceType"];
        id v35 = v14;
        char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v13];
        uint64_t v15 = 0;
        id v12 = 0;
        a4 = v30;
        id *v28 = v24;
        goto LABEL_14;
      }
      id v12 = v10;
    }
    else
    {
      id v12 = 0;
    }
    char v13 = [v6 objectForKeyedSubscript:@"deviceId"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceId"];
          v33 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = (id)[v29 initWithDomain:v27 code:2 userInfo:v26];
        }
        id v14 = 0;
        uint64_t v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    a4 = v30;
    uint64_t v15 = [(BMOasisAnalyticsDeviceInfo *)v11 initWithIsInternal:v8 systemBuild:v30 deviceType:v12 deviceId:v14];
    v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    v7 = v31;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v15 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  int v19 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isInternal"];
  v39[0] = v19;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v15 = 0;
  id v8 = 0;
  *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
  a4 = v19;
LABEL_16:

LABEL_17:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsDeviceInfo *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasIsInternal)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_systemBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMOasisAnalyticsDeviceInfo;
  id v5 = [(BMEventBase *)&v30 init];
  if (!v5) {
    goto LABEL_40;
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
          v5->_hasIsInternal = 1;
          break;
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
          uint64_t v27 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_39;
          }
          continue;
      }
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
          goto LABEL_34;
        }
        v19 += 7;
        BOOL v16 = v20++ >= 9;
        if (v16)
        {
          uint64_t v21 = 0;
          goto LABEL_36;
        }
      }
      v4[*v8] = 1;
LABEL_34:
      if (v4[*v8]) {
        uint64_t v21 = 0;
      }
LABEL_36:
      v5->_isInternal = v21 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_39:
  }
    v28 = 0;
  else {
LABEL_40:
  }
    v28 = v5;

  return v28;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMOasisAnalyticsDeviceInfo isInternal](self, "isInternal"));
  id v5 = [(BMOasisAnalyticsDeviceInfo *)self systemBuild];
  id v6 = [(BMOasisAnalyticsDeviceInfo *)self deviceType];
  v7 = [(BMOasisAnalyticsDeviceInfo *)self deviceId];
  id v8 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsDeviceInfo with isInternal: %@, systemBuild: %@, deviceType: %@, deviceId: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMOasisAnalyticsDeviceInfo)initWithIsInternal:(id)a3 systemBuild:(id)a4 deviceType:(id)a5 deviceId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMOasisAnalyticsDeviceInfo;
  unint64_t v14 = [(BMEventBase *)&v16 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasIsInternal = 1;
      v14->_isInternal = [v10 BOOLValue];
    }
    else
    {
      v14->_hasIsInternal = 0;
      v14->_isInternal = 0;
    }
    objc_storeStrong((id *)&v14->_systemBuild, a4);
    objc_storeStrong((id *)&v14->_deviceType, a5);
    objc_storeStrong((id *)&v14->_deviceId, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isInternal" number:1 type:12 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemBuild" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceId" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF79E0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isInternal" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemBuild" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
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

    id v8 = [[BMOasisAnalyticsDeviceInfo alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end