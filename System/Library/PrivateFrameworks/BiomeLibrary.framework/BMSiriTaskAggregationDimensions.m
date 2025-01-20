@interface BMSiriTaskAggregationDimensions
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriTaskAggregationDimensions)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriTaskAggregationDimensions)initWithProductArea:(int)a3 siriInputLocale:(id)a4 systemLocale:(id)a5 countryCode:(id)a6 deviceType:(id)a7 systemBuild:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)countryCode;
- (NSString)description;
- (NSString)deviceType;
- (NSString)siriInputLocale;
- (NSString)systemBuild;
- (NSString)systemLocale;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)productArea;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriTaskAggregationDimensions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);

  objc_storeStrong((id *)&self->_siriInputLocale, 0);
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (NSString)siriInputLocale
{
  return self->_siriInputLocale;
}

- (int)productArea
{
  return self->_productArea;
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
    int v6 = [(BMSiriTaskAggregationDimensions *)self productArea];
    if (v6 == [v5 productArea])
    {
      v7 = [(BMSiriTaskAggregationDimensions *)self siriInputLocale];
      uint64_t v8 = [v5 siriInputLocale];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMSiriTaskAggregationDimensions *)self siriInputLocale];
        v11 = [v5 siriInputLocale];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_18;
        }
      }
      v14 = [(BMSiriTaskAggregationDimensions *)self systemLocale];
      uint64_t v15 = [v5 systemLocale];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMSiriTaskAggregationDimensions *)self systemLocale];
        v18 = [v5 systemLocale];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_18;
        }
      }
      v20 = [(BMSiriTaskAggregationDimensions *)self countryCode];
      uint64_t v21 = [v5 countryCode];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMSiriTaskAggregationDimensions *)self countryCode];
        v24 = [v5 countryCode];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_18;
        }
      }
      v26 = [(BMSiriTaskAggregationDimensions *)self deviceType];
      uint64_t v27 = [v5 deviceType];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMSiriTaskAggregationDimensions *)self deviceType];
        v30 = [v5 deviceType];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_18;
        }
      }
      v33 = [(BMSiriTaskAggregationDimensions *)self systemBuild];
      v34 = [v5 systemBuild];
      if (v33 == v34)
      {
        char v13 = 1;
      }
      else
      {
        v35 = [(BMSiriTaskAggregationDimensions *)self systemBuild];
        v36 = [v5 systemBuild];
        char v13 = [v35 isEqual:v36];
      }
      goto LABEL_19;
    }
LABEL_18:
    char v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v13 = 0;
LABEL_20:

  return v13;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriTaskAggregationDimensions productArea](self, "productArea"));
  id v4 = [(BMSiriTaskAggregationDimensions *)self siriInputLocale];
  id v5 = [(BMSiriTaskAggregationDimensions *)self systemLocale];
  int v6 = [(BMSiriTaskAggregationDimensions *)self countryCode];
  v7 = [(BMSiriTaskAggregationDimensions *)self deviceType];
  uint64_t v8 = [(BMSiriTaskAggregationDimensions *)self systemBuild];
  v21[0] = @"productArea";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  int v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = @"siriInputLocale";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"systemLocale";
  v11 = v5;
  if (!v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"countryCode";
  int v12 = v6;
  if (!v6)
  {
    int v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"deviceType";
  char v13 = v7;
  if (!v7)
  {
    char v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"systemBuild";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_15;
    }
LABEL_23:

    if (v6) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }

  if (!v7) {
    goto LABEL_23;
  }
LABEL_15:
  if (v6) {
    goto LABEL_16;
  }
LABEL_24:

LABEL_16:
  if (v5)
  {
    if (v4) {
      goto LABEL_18;
    }
LABEL_26:

    if (v20) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v4) {
    goto LABEL_26;
  }
LABEL_18:
  if (v20) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v15;
}

- (BMSiriTaskAggregationDimensions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"productArea"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    uint64_t v10 = [v6 objectForKeyedSubscript:@"siriInputLocale"];
    v53 = (void *)v10;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v22 = 0;
          goto LABEL_53;
        }
        v23 = v8;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v25 = a4;
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"siriInputLocale"];
        id v64 = v14;
        char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        uint64_t v27 = v24;
        uint64_t v8 = v23;
        v22 = 0;
        *int v25 = (id)[v27 initWithDomain:v26 code:2 userInfo:v13];
        id v12 = 0;
        goto LABEL_52;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    char v13 = [v6 objectForKeyedSubscript:@"systemLocale"];
    id v50 = v12;
    v51 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v14 = 0;
          v22 = 0;
          goto LABEL_52;
        }
        v28 = v8;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        v30 = a4;
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        id v54 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemLocale"];
        id v62 = v54;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v32 = v29;
        uint64_t v8 = v28;
        v22 = 0;
        id v14 = 0;
        id *v30 = (id)[v32 initWithDomain:v31 code:2 userInfo:v15];
        goto LABEL_58;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:@"countryCode"];
    v52 = v8;
    v16 = a4;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v54 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v54 = v15;
LABEL_18:
      uint64_t v17 = [v6 objectForKeyedSubscript:@"deviceType"];
      id v49 = v14;
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v18 = self;
        id v19 = 0;
        goto LABEL_21;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = self;
        id v19 = v17;
LABEL_21:
        v20 = [v6 objectForKeyedSubscript:@"systemBuild"];
        if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v21 = 0;
LABEL_24:
          id v12 = v50;
          v22 = -[BMSiriTaskAggregationDimensions initWithProductArea:siriInputLocale:systemLocale:countryCode:deviceType:systemBuild:](v18, "initWithProductArea:siriInputLocale:systemLocale:countryCode:deviceType:systemBuild:", [v52 intValue], v50, v49, v54, v19, v21);
          v18 = v22;
LABEL_49:

          self = v18;
          id v14 = v49;
LABEL_50:

          uint64_t v8 = v52;
LABEL_51:

          v7 = v51;
LABEL_52:

          v11 = v53;
          goto LABEL_53;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v20;
          goto LABEL_24;
        }
        if (v16)
        {
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v46 = *MEMORY[0x1E4F502C8];
          uint64_t v55 = *MEMORY[0x1E4F28568];
          v43 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemBuild"];
          v56 = v43;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id *v16 = (id)[v48 initWithDomain:v46 code:2 userInfo:v44];
        }
        id v21 = 0;
        v22 = 0;
LABEL_48:
        id v12 = v50;
        goto LABEL_49;
      }
      if (v16)
      {
        v18 = self;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceType"];
        id v58 = v21;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        id v38 = (id)[v47 initWithDomain:v37 code:2 userInfo:v20];
        v22 = 0;
        id v19 = 0;
        id *v16 = v38;
        goto LABEL_48;
      }
      id v19 = 0;
      v22 = 0;
LABEL_60:
      id v12 = v50;
      goto LABEL_50;
    }
    if (a4)
    {
      id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v34 = v14;
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"countryCode"];
      id v60 = v19;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      uint64_t v36 = v35;
      id v14 = v34;
      v22 = 0;
      id v54 = 0;
      id *v16 = (id)[v33 initWithDomain:v36 code:2 userInfo:v17];
      goto LABEL_60;
    }
    id v54 = 0;
    v22 = 0;
LABEL_58:
    id v12 = v50;
    goto LABEL_51;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMSiriTaskAggregationDimensionsSiriProductAreaFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    v22 = 0;
    goto LABEL_54;
  }
  id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
  v40 = a4;
  uint64_t v41 = *MEMORY[0x1E4F502C8];
  uint64_t v65 = *MEMORY[0x1E4F28568];
  id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"productArea"];
  v66[0] = v12;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  id v42 = (id)[v39 initWithDomain:v41 code:2 userInfo:v11];
  uint64_t v8 = 0;
  v22 = 0;
  id *v40 = v42;
LABEL_53:

LABEL_54:
  return v22;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriTaskAggregationDimensions *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_siriInputLocale) {
    PBDataWriterWriteStringField();
  }
  if (self->_systemLocale) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_systemBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriTaskAggregationDimensions;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_45;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          break;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 24;
          goto LABEL_34;
        case 3u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 32;
          goto LABEL_34;
        case 4u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 40;
          goto LABEL_34;
        case 5u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 48;
          goto LABEL_34;
        case 6u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 56;
LABEL_34:
          id v29 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_44;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v6;
        uint64_t v24 = *(void *)&v4[v23];
        unint64_t v25 = v24 + 1;
        if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
        *(void *)&v4[v23] = v25;
        v22 |= (unint64_t)(v26 & 0x7F) << v20;
        if ((v26 & 0x80) == 0) {
          goto LABEL_38;
        }
        v20 += 7;
        BOOL v17 = v21++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_40:
      if (v22 >= 4) {
        LODWORD(v22) = 0;
      }
      v5->_productArea = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_44:
  }
    v30 = 0;
  else {
LABEL_45:
  }
    v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSiriTaskAggregationDimensionsSiriProductAreaAsString([(BMSiriTaskAggregationDimensions *)self productArea]);
  id v5 = [(BMSiriTaskAggregationDimensions *)self siriInputLocale];
  id v6 = [(BMSiriTaskAggregationDimensions *)self systemLocale];
  v7 = [(BMSiriTaskAggregationDimensions *)self countryCode];
  uint64_t v8 = [(BMSiriTaskAggregationDimensions *)self deviceType];
  id v9 = [(BMSiriTaskAggregationDimensions *)self systemBuild];
  char v10 = (void *)[v3 initWithFormat:@"BMSiriTaskAggregationDimensions with productArea: %@, siriInputLocale: %@, systemLocale: %@, countryCode: %@, deviceType: %@, systemBuild: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriTaskAggregationDimensions)initWithProductArea:(int)a3 siriInputLocale:(id)a4 systemLocale:(id)a5 countryCode:(id)a6 deviceType:(id)a7 systemBuild:(id)a8
{
  id v21 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMSiriTaskAggregationDimensions;
  int v18 = [(BMEventBase *)&v22 init];
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v20, v21);
    v18->_productArea = a3;
    objc_storeStrong((id *)&v18->_siriInputLocale, a4);
    objc_storeStrong((id *)&v18->_systemLocale, a5);
    objc_storeStrong((id *)&v18->_countryCode, a6);
    objc_storeStrong((id *)&v18->_deviceType, a7);
    objc_storeStrong((id *)&v18->_systemBuild, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"productArea" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriInputLocale" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemLocale" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemBuild" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6AB0;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"productArea" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriInputLocale" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemLocale" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemBuild" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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

    uint64_t v8 = [[BMSiriTaskAggregationDimensions alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end