@interface BMOasisAnalyticsRelocalizationSucceededType
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsRelocalizationSucceededType)initWithDescriptorType:(int)a3 localizedSubmapId:(id)a4 timeToLocalizationInSecond:(id)a5;
- (BMOasisAnalyticsRelocalizationSucceededType)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasLocalizedSubmapId;
- (BOOL)hasTimeToLocalizationInSecond;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (float)timeToLocalizationInSecond;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)descriptorType;
- (unint64_t)localizedSubmapId;
- (unsigned)dataVersion;
- (void)setHasLocalizedSubmapId:(BOOL)a3;
- (void)setHasTimeToLocalizationInSecond:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsRelocalizationSucceededType

- (void)setHasTimeToLocalizationInSecond:(BOOL)a3
{
  self->_hasTimeToLocalizationInSecond = a3;
}

- (BOOL)hasTimeToLocalizationInSecond
{
  return self->_hasTimeToLocalizationInSecond;
}

- (float)timeToLocalizationInSecond
{
  return self->_timeToLocalizationInSecond;
}

- (void)setHasLocalizedSubmapId:(BOOL)a3
{
  self->_hasLocalizedSubmapId = a3;
}

- (BOOL)hasLocalizedSubmapId
{
  return self->_hasLocalizedSubmapId;
}

- (unint64_t)localizedSubmapId
{
  return self->_localizedSubmapId;
}

- (int)descriptorType
{
  return self->_descriptorType;
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
    int v6 = [(BMOasisAnalyticsRelocalizationSucceededType *)self descriptorType];
    if (v6 != [v5 descriptorType]) {
      goto LABEL_14;
    }
    if ([(BMOasisAnalyticsRelocalizationSucceededType *)self hasLocalizedSubmapId]
      || [v5 hasLocalizedSubmapId])
    {
      if (![(BMOasisAnalyticsRelocalizationSucceededType *)self hasLocalizedSubmapId]) {
        goto LABEL_14;
      }
      if (![v5 hasLocalizedSubmapId]) {
        goto LABEL_14;
      }
      unint64_t v7 = [(BMOasisAnalyticsRelocalizationSucceededType *)self localizedSubmapId];
      if (v7 != [v5 localizedSubmapId]) {
        goto LABEL_14;
      }
    }
    if (!-[BMOasisAnalyticsRelocalizationSucceededType hasTimeToLocalizationInSecond](self, "hasTimeToLocalizationInSecond")&& ![v5 hasTimeToLocalizationInSecond])
    {
      BOOL v11 = 1;
      goto LABEL_15;
    }
    if (-[BMOasisAnalyticsRelocalizationSucceededType hasTimeToLocalizationInSecond](self, "hasTimeToLocalizationInSecond")&& [v5 hasTimeToLocalizationInSecond])
    {
      [(BMOasisAnalyticsRelocalizationSucceededType *)self timeToLocalizationInSecond];
      float v9 = v8;
      [v5 timeToLocalizationInSecond];
      BOOL v11 = v9 == v10;
    }
    else
    {
LABEL_14:
      BOOL v11 = 0;
    }
LABEL_15:

    goto LABEL_16;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (id)jsonDictionary
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMOasisAnalyticsRelocalizationSucceededType descriptorType](self, "descriptorType"));
  if ([(BMOasisAnalyticsRelocalizationSucceededType *)self hasLocalizedSubmapId])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsRelocalizationSucceededType localizedSubmapId](self, "localizedSubmapId"));
  }
  else
  {
    id v4 = 0;
  }
  if (![(BMOasisAnalyticsRelocalizationSucceededType *)self hasTimeToLocalizationInSecond]|| ([(BMOasisAnalyticsRelocalizationSucceededType *)self timeToLocalizationInSecond], fabsf(v5) == INFINITY))
  {
    unint64_t v7 = 0;
  }
  else
  {
    [(BMOasisAnalyticsRelocalizationSucceededType *)self timeToLocalizationInSecond];
    int v6 = NSNumber;
    [(BMOasisAnalyticsRelocalizationSucceededType *)self timeToLocalizationInSecond];
    unint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
  }
  v13[0] = @"descriptorType";
  float v8 = v3;
  if (!v3)
  {
    float v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v8;
  v13[1] = @"localizedSubmapId";
  float v9 = v4;
  if (!v4)
  {
    float v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v13[2] = @"timeToLocalizationInSecond";
  float v10 = v7;
  if (!v7)
  {
    float v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (v7)
  {
    if (v4) {
      goto LABEL_16;
    }
LABEL_21:

    if (v3) {
      goto LABEL_17;
    }
    goto LABEL_22;
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_16:
  if (v3) {
    goto LABEL_17;
  }
LABEL_22:

LABEL_17:

  return v11;
}

- (BMOasisAnalyticsRelocalizationSucceededType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"descriptorType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    float v8 = 0;
LABEL_9:
    float v10 = [v6 objectForKeyedSubscript:@"localizedSubmapId"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v14 = 0;
          goto LABEL_17;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"localizedSubmapId"];
        id v28 = v13;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v17 = (id)[v23 initWithDomain:v16 code:2 userInfo:v12];
        v14 = 0;
        id v11 = 0;
        *a4 = v17;
        goto LABEL_16;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    v12 = [v6 objectForKeyedSubscript:@"timeToLocalizationInSecond"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeToLocalizationInSecond"];
          v26 = v18;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v19];
        }
        id v13 = 0;
        v14 = 0;
        goto LABEL_16;
      }
      id v13 = v12;
    }
    else
    {
      id v13 = 0;
    }
    self = -[BMOasisAnalyticsRelocalizationSucceededType initWithDescriptorType:localizedSubmapId:timeToLocalizationInSecond:](self, "initWithDescriptorType:localizedSubmapId:timeToLocalizationInSecond:", [v8 intValue], v11, v13);
    v14 = self;
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    float v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    float v8 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"descriptorType"];
  v30[0] = v11;
  float v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  float v8 = 0;
  v14 = 0;
  *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
LABEL_17:

LABEL_18:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsRelocalizationSucceededType *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasLocalizedSubmapId) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_hasTimeToLocalizationInSecond) {
    PBDataWriterWriteFloatField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMOasisAnalyticsRelocalizationSucceededType;
  float v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_56;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  float v8 = (int *)MEMORY[0x1E4F940C8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasTimeToLocalizationInSecond = 1;
        uint64_t v28 = *v6;
        unint64_t v29 = *(void *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)&v4[*v7])
        {
          float v30 = *(float *)(*(void *)&v4[*v9] + v29);
          *(void *)&v4[v28] = v29 + 4;
        }
        else
        {
          v4[*v8] = 1;
          float v30 = 0.0;
        }
        v5->_timeToLocalizationInSecond = v30;
      }
      else if (v20 == 2)
      {
        char v31 = 0;
        unsigned int v32 = 0;
        unint64_t v33 = 0;
        v5->_hasLocalizedSubmapId = 1;
        while (1)
        {
          uint64_t v34 = *v6;
          uint64_t v35 = *(void *)&v4[v34];
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)&v4[*v7]) {
            break;
          }
          char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
          *(void *)&v4[v34] = v36;
          v33 |= (unint64_t)(v37 & 0x7F) << v31;
          if ((v37 & 0x80) == 0) {
            goto LABEL_48;
          }
          v31 += 7;
          BOOL v17 = v32++ >= 9;
          if (v17)
          {
            unint64_t v33 = 0;
            goto LABEL_50;
          }
        }
        v4[*v8] = 1;
LABEL_48:
        if (v4[*v8]) {
          unint64_t v33 = 0;
        }
LABEL_50:
        v5->_localizedSubmapId = v33;
      }
      else if (v20 == 1)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_42;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_44;
          }
        }
        v4[*v8] = 1;
LABEL_42:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_44:
        if (v23 >= 4) {
          LODWORD(v23) = 0;
        }
        v5->_descriptorType = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_55;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_55:
  }
    v38 = 0;
  else {
LABEL_56:
  }
    v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMOasisAnalyticsRelocalizationSucceededDescriptorTypeAsString([(BMOasisAnalyticsRelocalizationSucceededType *)self descriptorType]);
  float v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsRelocalizationSucceededType localizedSubmapId](self, "localizedSubmapId"));
  id v6 = NSNumber;
  [(BMOasisAnalyticsRelocalizationSucceededType *)self timeToLocalizationInSecond];
  unint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
  float v8 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsRelocalizationSucceededType with descriptorType: %@, localizedSubmapId: %@, timeToLocalizationInSecond: %@", v4, v5, v7];

  return (NSString *)v8;
}

- (BMOasisAnalyticsRelocalizationSucceededType)initWithDescriptorType:(int)a3 localizedSubmapId:(id)a4 timeToLocalizationInSecond:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMOasisAnalyticsRelocalizationSucceededType;
  char v10 = [(BMEventBase *)&v14 init];
  if (v10)
  {
    v10->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v10->_descriptorType = a3;
    if (v8)
    {
      v10->_hasLocalizedSubmapId = 1;
      uint64_t v11 = [v8 unsignedLongLongValue];
    }
    else
    {
      uint64_t v11 = 0;
      v10->_hasLocalizedSubmapId = 0;
    }
    v10->_localizedSubmapId = v11;
    if (v9)
    {
      v10->_hasTimeToLocalizationInSecond = 1;
      [v9 floatValue];
    }
    else
    {
      v10->_hasTimeToLocalizationInSecond = 0;
      float v12 = -1.0;
    }
    v10->_timeToLocalizationInSecond = v12;
  }

  return v10;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"descriptorType" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"localizedSubmapId", 2, 5, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeToLocalizationInSecond" number:3 type:1 subMessageClass:0];
  v7[2] = v4;
  float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7980;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"descriptorType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"localizedSubmapId" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:5 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeToLocalizationInSecond" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:1 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    float v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    unint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMOasisAnalyticsRelocalizationSucceededType alloc] initByReadFrom:v7];
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