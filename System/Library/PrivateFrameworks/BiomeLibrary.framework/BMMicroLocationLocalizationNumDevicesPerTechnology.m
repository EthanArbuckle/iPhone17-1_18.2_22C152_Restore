@interface BMMicroLocationLocalizationNumDevicesPerTechnology
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMicroLocationLocalizationNumDevicesPerTechnology)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMicroLocationLocalizationNumDevicesPerTechnology)initWithTechnologyString:(id)a3 number:(id)a4;
- (BOOL)hasNumber;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)technologyString;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)number;
- (unsigned)dataVersion;
- (void)setHasNumber:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMicroLocationLocalizationNumDevicesPerTechnology

- (void).cxx_destruct
{
}

- (void)setHasNumber:(BOOL)a3
{
  self->_hasNumber = a3;
}

- (BOOL)hasNumber
{
  return self->_hasNumber;
}

- (int)number
{
  return self->_number;
}

- (NSString)technologyString
{
  return self->_technologyString;
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
    v6 = [(BMMicroLocationLocalizationNumDevicesPerTechnology *)self technologyString];
    uint64_t v7 = [v5 technologyString];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMicroLocationLocalizationNumDevicesPerTechnology *)self technologyString];
      v10 = [v5 technologyString];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMMicroLocationLocalizationNumDevicesPerTechnology *)self hasNumber]
      && ![v5 hasNumber])
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
    if ([(BMMicroLocationLocalizationNumDevicesPerTechnology *)self hasNumber]
      && [v5 hasNumber])
    {
      int v13 = [(BMMicroLocationLocalizationNumDevicesPerTechnology *)self number];
      BOOL v12 = v13 == [v5 number];
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMicroLocationLocalizationNumDevicesPerTechnology *)self technologyString];
  if ([(BMMicroLocationLocalizationNumDevicesPerTechnology *)self hasNumber])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMicroLocationLocalizationNumDevicesPerTechnology number](self, "number"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"technologyString";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"number";
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

- (BMMicroLocationLocalizationNumDevicesPerTechnology)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"technologyString"];
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
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"technologyString"];
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
  v9 = [v6 objectForKeyedSubscript:@"number"];
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
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"number"];
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
  self = [(BMMicroLocationLocalizationNumDevicesPerTechnology *)self initWithTechnologyString:v8 number:v10];
  int v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMicroLocationLocalizationNumDevicesPerTechnology *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_technologyString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasNumber)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMMicroLocationLocalizationNumDevicesPerTechnology;
  id v5 = [(BMEventBase *)&v31 init];
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
      if ((v12 >> 3) == 2)
      {
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        v5->_hasNumber = 1;
        while (1)
        {
          uint64_t v25 = *v6;
          uint64_t v26 = *(void *)&v4[v25];
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
          *(void *)&v4[v25] = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0) {
            goto LABEL_32;
          }
          v22 += 7;
          BOOL v17 = v23++ >= 9;
          if (v17)
          {
            LODWORD(v24) = 0;
            goto LABEL_34;
          }
        }
        v4[*v8] = 1;
LABEL_32:
        if (v4[*v8]) {
          LODWORD(v24) = 0;
        }
LABEL_34:
        v5->_number = v24;
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        technologyString = v5->_technologyString;
        v5->_technologyString = (NSString *)v20;
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
    v29 = 0;
  else {
LABEL_38:
  }
    v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMicroLocationLocalizationNumDevicesPerTechnology *)self technologyString];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMicroLocationLocalizationNumDevicesPerTechnology number](self, "number"));
  id v6 = (void *)[v3 initWithFormat:@"BMMicroLocationLocalizationNumDevicesPerTechnology with technologyString: %@, number: %@", v4, v5];

  return (NSString *)v6;
}

- (BMMicroLocationLocalizationNumDevicesPerTechnology)initWithTechnologyString:(id)a3 number:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMMicroLocationLocalizationNumDevicesPerTechnology;
  v9 = [(BMEventBase *)&v12 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_technologyString, a3);
    if (v8)
    {
      v9->_hasNumber = 1;
      int v10 = [v8 intValue];
    }
    else
    {
      v9->_hasNumber = 0;
      int v10 = -1;
    }
    v9->_number = v10;
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"technologyString" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"number" number:2 type:2 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4E90;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"technologyString" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"number" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    id v7 = [[BMMicroLocationLocalizationNumDevicesPerTechnology alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[5] = 1;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end