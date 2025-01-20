@interface BMDeviceMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceMetadata)initWithName:(id)a3 build:(id)a4 platform:(int)a5 supplementalBuild:(id)a6 rapidSecurityResponsePreReboot:(id)a7;
- (BOOL)hasRapidSecurityResponsePreReboot;
- (BOOL)isEqual:(id)a3;
- (BOOL)rapidSecurityResponsePreReboot;
- (NSString)build;
- (NSString)description;
- (NSString)name;
- (NSString)supplementalBuild;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)platform;
- (unsigned)dataVersion;
- (void)setHasRapidSecurityResponsePreReboot:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceMetadata

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"build" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"platform" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"supplementalBuild" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rapidSecurityResponsePreReboot" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_build, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setHasRapidSecurityResponsePreReboot:(BOOL)a3
{
  self->_hasRapidSecurityResponsePreReboot = a3;
}

- (BOOL)hasRapidSecurityResponsePreReboot
{
  return self->_hasRapidSecurityResponsePreReboot;
}

- (BOOL)rapidSecurityResponsePreReboot
{
  return self->_rapidSecurityResponsePreReboot;
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (int)platform
{
  return self->_platform;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)name
{
  return self->_name;
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
    v6 = [(BMDeviceMetadata *)self name];
    uint64_t v7 = [v5 name];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDeviceMetadata *)self name];
      v10 = [v5 name];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMDeviceMetadata *)self build];
    uint64_t v14 = [v5 build];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMDeviceMetadata *)self build];
      v17 = [v5 build];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    int v19 = [(BMDeviceMetadata *)self platform];
    if (v19 == [v5 platform])
    {
      v20 = [(BMDeviceMetadata *)self supplementalBuild];
      uint64_t v21 = [v5 supplementalBuild];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMDeviceMetadata *)self supplementalBuild];
        v24 = [v5 supplementalBuild];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_21;
        }
      }
      if (![(BMDeviceMetadata *)self hasRapidSecurityResponsePreReboot]
        && ![v5 hasRapidSecurityResponsePreReboot])
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if ([(BMDeviceMetadata *)self hasRapidSecurityResponsePreReboot]
        && [v5 hasRapidSecurityResponsePreReboot])
      {
        BOOL v26 = [(BMDeviceMetadata *)self rapidSecurityResponsePreReboot];
        int v12 = v26 ^ [v5 rapidSecurityResponsePreReboot] ^ 1;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMDeviceMetadata *)self name];
  id v4 = [(BMDeviceMetadata *)self build];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceMetadata platform](self, "platform"));
  v6 = [(BMDeviceMetadata *)self supplementalBuild];
  if ([(BMDeviceMetadata *)self hasRapidSecurityResponsePreReboot])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceMetadata rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v17 = @"name";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  int v18 = @"build";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  int v19 = @"platform";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"supplementalBuild";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  uint64_t v21 = @"rapidSecurityResponsePreReboot";
  int v12 = v7;
  if (!v7)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
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

- (BMDeviceMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"build"];
    v37 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v15 = 0;
          goto LABEL_20;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v23 = a4;
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v47 = *MEMORY[0x1E4F28568];
        id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"build"];
        id v48 = v39;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        id v25 = (id)[v22 initWithDomain:v24 code:2 userInfo:v10];
        a4 = 0;
        uint64_t v15 = 0;
        id *v23 = v25;
LABEL_19:

LABEL_20:
        uint64_t v7 = v37;
        goto LABEL_21;
      }
      v36 = v9;
    }
    else
    {
      v36 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"platform"];
    id v38 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v39 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v39 = 0;
            uint64_t v15 = 0;
            a4 = v36;
            goto LABEL_19;
          }
          id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"platform"];
          id v46 = v12;
          int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          id v32 = (id)[v40 initWithDomain:v31 code:2 userInfo:v11];
          id v39 = 0;
          uint64_t v15 = 0;
          *a4 = v32;
          goto LABEL_49;
        }
        id v39 = [NSNumber numberWithInt:BMDeviceMetadataDevicePlatformFromString(v10)];
      }
    }
    else
    {
      id v39 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"supplementalBuild"];
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
LABEL_13:
      v13 = [v6 objectForKeyedSubscript:@"rapidSecurityResponsePreReboot"];
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v33 = *MEMORY[0x1E4F502C8];
            uint64_t v41 = *MEMORY[0x1E4F28568];
            v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rapidSecurityResponsePreReboot"];
            v42 = v29;
            v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
            *a4 = (id)[v35 initWithDomain:v33 code:2 userInfo:v30];
          }
          id v14 = 0;
          uint64_t v15 = 0;
          a4 = v36;
          goto LABEL_17;
        }
        id v14 = v13;
      }
      else
      {
        id v14 = 0;
      }
      a4 = v36;
      uint64_t v15 = -[BMDeviceMetadata initWithName:build:platform:supplementalBuild:rapidSecurityResponsePreReboot:](self, "initWithName:build:platform:supplementalBuild:rapidSecurityResponsePreReboot:", v38, v36, [v39 intValue], v12, v14);
      self = v15;
LABEL_17:

LABEL_18:
      id v8 = v38;
      goto LABEL_19;
    }
    if (a4)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      v34 = a4;
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"supplementalBuild"];
      id v44 = v14;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      id v28 = (id)[v26 initWithDomain:v27 code:2 userInfo:v13];
      uint64_t v15 = 0;
      id v12 = 0;
      a4 = v36;
      id *v34 = v28;
      goto LABEL_17;
    }
    id v12 = 0;
    uint64_t v15 = 0;
LABEL_49:
    a4 = v36;
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
    id v8 = 0;
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v18 = a4;
  uint64_t v19 = *MEMORY[0x1E4F502C8];
  uint64_t v49 = *MEMORY[0x1E4F28568];
  v20 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
  v50[0] = v20;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  uint64_t v21 = v19;
  a4 = v20;
  id v8 = 0;
  uint64_t v15 = 0;
  *int v18 = (id)[v17 initWithDomain:v21 code:2 userInfo:v9];
LABEL_21:

LABEL_22:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDeviceMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_build) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_supplementalBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRapidSecurityResponsePreReboot) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMDeviceMetadata;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_53;
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
          goto LABEL_32;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_32;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_43;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_43:
          if (v23 >= 9) {
            LODWORD(v23) = 0;
          }
          v5->_platform = v23;
          continue;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
LABEL_32:
          uint64_t v27 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasRapidSecurityResponsePreReboot = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_52;
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
          goto LABEL_47;
        }
        v28 += 7;
        BOOL v16 = v29++ >= 9;
        if (v16)
        {
          uint64_t v30 = 0;
          goto LABEL_49;
        }
      }
      v4[*v8] = 1;
LABEL_47:
      if (v4[*v8]) {
        uint64_t v30 = 0;
      }
LABEL_49:
      v5->_rapidSecurityResponsePreReboot = v30 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_52:
  }
    v34 = 0;
  else {
LABEL_53:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMDeviceMetadata *)self name];
  id v5 = [(BMDeviceMetadata *)self build];
  id v6 = BMDeviceMetadataDevicePlatformAsString([(BMDeviceMetadata *)self platform]);
  uint64_t v7 = [(BMDeviceMetadata *)self supplementalBuild];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceMetadata rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot"));
  v9 = (void *)[v3 initWithFormat:@"BMDeviceMetadata with name: %@, build: %@, platform: %@, supplementalBuild: %@, rapidSecurityResponsePreReboot: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMDeviceMetadata)initWithName:(id)a3 build:(id)a4 platform:(int)a5 supplementalBuild:(id)a6 rapidSecurityResponsePreReboot:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMDeviceMetadata;
  int v17 = [(BMEventBase *)&v19 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v17->_build, a4);
    v17->_platform = a5;
    objc_storeStrong((id *)&v17->_supplementalBuild, a6);
    if (v16)
    {
      v17->_hasRapidSecurityResponsePreReboot = 1;
      v17->_rapidSecurityResponsePreReboot = [v16 BOOLValue];
    }
    else
    {
      v17->_hasRapidSecurityResponsePreReboot = 0;
      v17->_rapidSecurityResponsePreReboot = 0;
    }
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"build", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"platform" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"supplementalBuild" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rapidSecurityResponsePreReboot" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF41B8;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMDeviceMetadata;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMDeviceMetadata_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 20) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end