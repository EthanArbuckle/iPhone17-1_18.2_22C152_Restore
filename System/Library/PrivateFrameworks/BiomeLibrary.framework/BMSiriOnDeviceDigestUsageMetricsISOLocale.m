@interface BMSiriOnDeviceDigestUsageMetricsISOLocale
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestUsageMetricsISOLocale)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestUsageMetricsISOLocale)initWithLanguageCode:(id)a3 countryCode:(id)a4;
- (BOOL)hasCountryCode;
- (BOOL)hasLanguageCode;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)countryCode;
- (int)languageCode;
- (unsigned)dataVersion;
- (void)setHasCountryCode:(BOOL)a3;
- (void)setHasLanguageCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestUsageMetricsISOLocale

- (void)setHasCountryCode:(BOOL)a3
{
  self->_hasCountryCode = a3;
}

- (BOOL)hasCountryCode
{
  return self->_hasCountryCode;
}

- (int)countryCode
{
  return self->_countryCode;
}

- (void)setHasLanguageCode:(BOOL)a3
{
  self->_hasLanguageCode = a3;
}

- (BOOL)hasLanguageCode
{
  return self->_hasLanguageCode;
}

- (int)languageCode
{
  return self->_languageCode;
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
    if ([(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self hasLanguageCode]
      || [v5 hasLanguageCode])
    {
      if (![(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self hasLanguageCode]) {
        goto LABEL_13;
      }
      if (![v5 hasLanguageCode]) {
        goto LABEL_13;
      }
      int v6 = [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self languageCode];
      if (v6 != [v5 languageCode]) {
        goto LABEL_13;
      }
    }
    if (![(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self hasCountryCode]
      && ![v5 hasCountryCode])
    {
      BOOL v8 = 1;
      goto LABEL_14;
    }
    if ([(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self hasCountryCode]
      && [v5 hasCountryCode])
    {
      int v7 = [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self countryCode];
      BOOL v8 = v7 == [v5 countryCode];
    }
    else
    {
LABEL_13:
      BOOL v8 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self hasLanguageCode])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetricsISOLocale languageCode](self, "languageCode"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self hasCountryCode])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetricsISOLocale countryCode](self, "countryCode"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"languageCode";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"countryCode";
  v10[0] = v5;
  int v6 = v4;
  if (!v4)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
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

- (BMSiriOnDeviceDigestUsageMetricsISOLocale)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"languageCode"];
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
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"languageCode"];
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
  v9 = [v6 objectForKeyedSubscript:@"countryCode"];
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
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"countryCode"];
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
  self = [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self initWithLanguageCode:v8 countryCode:v10];
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasLanguageCode)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCountryCode)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMSiriOnDeviceDigestUsageMetricsISOLocale;
  id v5 = [(BMEventBase *)&v34 init];
  if (!v5) {
    goto LABEL_48;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
        if (v11++ >= 9)
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
      if ((v12 >> 3) == 13)
      {
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v21 = 0;
        v5->_hasCountryCode = 1;
        while (1)
        {
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 == -1 || v30 >= *(void *)&v4[*v7]) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
          *(void *)&v4[v29] = v30 + 1;
          v21 |= (unint64_t)(v31 & 0x7F) << v27;
          if ((v31 & 0x80) == 0)
          {
            v26 = &OBJC_IVAR___BMSiriOnDeviceDigestUsageMetricsISOLocale__countryCode;
            goto LABEL_42;
          }
          v27 += 7;
          BOOL v25 = v28++ > 8;
          if (v25)
          {
            LODWORD(v21) = 0;
            v26 = &OBJC_IVAR___BMSiriOnDeviceDigestUsageMetricsISOLocale__countryCode;
            goto LABEL_44;
          }
        }
        v26 = &OBJC_IVAR___BMSiriOnDeviceDigestUsageMetricsISOLocale__countryCode;
LABEL_39:
        v4[*v8] = 1;
      }
      else
      {
        if ((v12 >> 3) != 12)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_47;
          }
          continue;
        }
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        v5->_hasLanguageCode = 1;
        while (1)
        {
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 == -1 || v23 >= *(void *)&v4[*v7])
          {
            v26 = &OBJC_IVAR___BMSiriOnDeviceDigestUsageMetricsISOLocale__languageCode;
            goto LABEL_39;
          }
          char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            break;
          }
          v19 += 7;
          BOOL v25 = v20++ > 8;
          if (v25)
          {
            LODWORD(v21) = 0;
            v26 = &OBJC_IVAR___BMSiriOnDeviceDigestUsageMetricsISOLocale__languageCode;
            goto LABEL_44;
          }
        }
        v26 = &OBJC_IVAR___BMSiriOnDeviceDigestUsageMetricsISOLocale__languageCode;
      }
LABEL_42:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_44:
      *(_DWORD *)((char *)&v5->super.super.isa + *v26) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    v32 = 0;
  else {
LABEL_48:
  }
    v32 = v5;

  return v32;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetricsISOLocale languageCode](self, "languageCode"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetricsISOLocale countryCode](self, "countryCode"));
  id v6 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestUsageMetricsISOLocale with languageCode: %@, countryCode: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSiriOnDeviceDigestUsageMetricsISOLocale)initWithLanguageCode:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSiriOnDeviceDigestUsageMetricsISOLocale;
  id v8 = [(BMEventBase *)&v12 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasLanguageCode = 1;
      int v9 = [v6 intValue];
    }
    else
    {
      v8->_hasLanguageCode = 0;
      int v9 = -1;
    }
    v8->_languageCode = v9;
    if (v7)
    {
      v8->_hasCountryCode = 1;
      int v10 = [v7 intValue];
    }
    else
    {
      v8->_hasCountryCode = 0;
      int v10 = -1;
    }
    v8->_countryCode = v10;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"languageCode" number:12 type:2 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:13 type:2 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF54C0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"languageCode" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:2 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
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

    id v8 = [[BMSiriOnDeviceDigestUsageMetricsISOLocale alloc] initByReadFrom:v7];
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