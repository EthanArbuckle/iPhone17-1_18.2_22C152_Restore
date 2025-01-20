@interface BMSiriAssistantSuggestionFeaturesTemporalFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)initWithTimeOfDay:(id)a3 dayOfWeek:(id)a4 timePeriod:(int)a5;
- (BOOL)hasDayOfWeek;
- (BOOL)hasTimeOfDay;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)dayOfWeek;
- (int)timeOfDay;
- (int)timePeriod;
- (unsigned)dataVersion;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasTimeOfDay:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesTemporalFeatures

- (int)timePeriod
{
  return self->_timePeriod;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  self->_hasDayOfWeek = a3;
}

- (BOOL)hasDayOfWeek
{
  return self->_hasDayOfWeek;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  self->_hasTimeOfDay = a3;
}

- (BOOL)hasTimeOfDay
{
  return self->_hasTimeOfDay;
}

- (int)timeOfDay
{
  return self->_timeOfDay;
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
    if ((![(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self hasTimeOfDay]
       && ![v5 hasTimeOfDay]
       || [(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self hasTimeOfDay]
       && [v5 hasTimeOfDay]
       && (int v6 = [(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self timeOfDay],
           v6 == [v5 timeOfDay]))
      && (![(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self hasDayOfWeek]
       && ![v5 hasDayOfWeek]
       || [(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self hasDayOfWeek]
       && [v5 hasDayOfWeek]
       && (int v7 = [(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self dayOfWeek],
           v7 == [v5 dayOfWeek])))
    {
      int v8 = [(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self timePeriod];
      BOOL v9 = v8 == [v5 timePeriod];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self hasTimeOfDay])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timeOfDay](self, "timeOfDay"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self hasDayOfWeek])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures dayOfWeek](self, "dayOfWeek"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timePeriod](self, "timePeriod"));
  v11[0] = @"timeOfDay";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"dayOfWeek";
  int v7 = v4;
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"timePeriod";
  int v8 = v5;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_15;
    }
LABEL_20:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }

  if (!v4) {
    goto LABEL_20;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_21:

LABEL_16:

  return v9;
}

- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"timeOfDay"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    BOOL v9 = [v6 objectForKeyedSubscript:@"dayOfWeek"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"dayOfWeek"];
        v28 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v18 = (id)[v23 initWithDomain:v17 code:2 userInfo:v11];
        id v10 = 0;
        v16 = 0;
        *a4 = v18;
        goto LABEL_24;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"timePeriod"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v22 = *MEMORY[0x1E4F502C8];
            uint64_t v25 = *MEMORY[0x1E4F28568];
            v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"timePeriod"];
            v26 = v20;
            v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
            *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
          }
          v12 = 0;
          v16 = 0;
          goto LABEL_24;
        }
        id v13 = [NSNumber numberWithInt:BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodFromString(v11)];
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures initWithTimeOfDay:dayOfWeek:timePeriod:](self, "initWithTimeOfDay:dayOfWeek:timePeriod:", v8, v10, [v12 intValue]);
    v16 = self;
LABEL_24:

    goto LABEL_25;
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
    v16 = 0;
    goto LABEL_26;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v15 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeOfDay"];
  v30[0] = v10;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v8 = 0;
  v16 = 0;
  *a4 = (id)[v14 initWithDomain:v15 code:2 userInfo:v9];
LABEL_25:

LABEL_26:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasTimeOfDay) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasDayOfWeek) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriAssistantSuggestionFeaturesTemporalFeatures;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5) {
    goto LABEL_63;
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
      if ((v12 >> 3) == 1)
      {
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v23 = 0;
        v5->_hasTimeOfDay = 1;
        while (1)
        {
          uint64_t v30 = *v6;
          uint64_t v31 = *(void *)&v4[v30];
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
            break;
          }
          char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
          *(void *)&v4[v30] = v32;
          v23 |= (unint64_t)(v33 & 0x7F) << v28;
          if ((v33 & 0x80) == 0) {
            goto LABEL_52;
          }
          v28 += 7;
          BOOL v17 = v29++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_54;
          }
        }
        v4[*v8] = 1;
LABEL_52:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_54:
        v40 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesTemporalFeatures__timeOfDay;
      }
      else if (v20 == 2)
      {
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v23 = 0;
        v5->_hasDayOfWeek = 1;
        while (1)
        {
          uint64_t v36 = *v6;
          uint64_t v37 = *(void *)&v4[v36];
          unint64_t v38 = v37 + 1;
          if (v37 == -1 || v38 > *(void *)&v4[*v7]) {
            break;
          }
          char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
          *(void *)&v4[v36] = v38;
          v23 |= (unint64_t)(v39 & 0x7F) << v34;
          if ((v39 & 0x80) == 0) {
            goto LABEL_56;
          }
          v34 += 7;
          BOOL v17 = v35++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_58;
          }
        }
        v4[*v8] = 1;
LABEL_56:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_58:
        v40 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesTemporalFeatures__dayOfWeek;
      }
      else
      {
        if (v20 != 3)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_62;
          }
          continue;
        }
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
            goto LABEL_46;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_48:
        if (v23 >= 5) {
          LODWORD(v23) = 0;
        }
        v40 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesTemporalFeatures__timePeriod;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + *v40) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_62:
  }
    v41 = 0;
  else {
LABEL_63:
  }
    v41 = v5;

  return v41;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timeOfDay](self, "timeOfDay"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures dayOfWeek](self, "dayOfWeek"));
  id v6 = BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodAsString([(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self timePeriod]);
  int v7 = (void *)[v3 initWithFormat:@"BMSiriAssistantSuggestionFeaturesTemporalFeatures with timeOfDay: %@, dayOfWeek: %@, timePeriod: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)initWithTimeOfDay:(id)a3 dayOfWeek:(id)a4 timePeriod:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriAssistantSuggestionFeaturesTemporalFeatures;
  char v10 = [(BMEventBase *)&v14 init];
  if (v10)
  {
    v10->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v10->_hasTimeOfDay = 1;
      int v11 = [v8 intValue];
    }
    else
    {
      v10->_hasTimeOfDay = 0;
      int v11 = -1;
    }
    v10->_timeOfDay = v11;
    if (v9)
    {
      v10->_hasDayOfWeek = 1;
      int v12 = [v9 intValue];
    }
    else
    {
      v10->_hasDayOfWeek = 0;
      int v12 = -1;
    }
    v10->_dayOfWeek = v12;
    v10->_timePeriod = a5;
  }

  return v10;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeOfDay" number:1 type:2 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"dayOfWeek", 2, 2, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timePeriod" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3C60;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeOfDay" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dayOfWeek" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timePeriod" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriAssistantSuggestionFeaturesTemporalFeatures alloc] initByReadFrom:v7];
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