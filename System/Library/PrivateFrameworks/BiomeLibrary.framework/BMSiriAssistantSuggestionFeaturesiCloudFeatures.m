@interface BMSiriAssistantSuggestionFeaturesiCloudFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)initWithDaysSinceAccountCreated:(id)a3 isInFamily:(id)a4 isHeadOfFamily:(id)a5 subscriptionStatus:(id)a6;
- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasDaysSinceAccountCreated;
- (BOOL)hasIsHeadOfFamily;
- (BOOL)hasIsInFamily;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHeadOfFamily;
- (BOOL)isInFamily;
- (NSString)description;
- (NSString)subscriptionStatus;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)daysSinceAccountCreated;
- (unsigned)dataVersion;
- (void)setHasDaysSinceAccountCreated:(BOOL)a3;
- (void)setHasIsHeadOfFamily:(BOOL)a3;
- (void)setHasIsInFamily:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesiCloudFeatures

- (void).cxx_destruct
{
}

- (NSString)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setHasIsHeadOfFamily:(BOOL)a3
{
  self->_hasIsHeadOfFamily = a3;
}

- (BOOL)hasIsHeadOfFamily
{
  return self->_hasIsHeadOfFamily;
}

- (BOOL)isHeadOfFamily
{
  return self->_isHeadOfFamily;
}

- (void)setHasIsInFamily:(BOOL)a3
{
  self->_hasIsInFamily = a3;
}

- (BOOL)hasIsInFamily
{
  return self->_hasIsInFamily;
}

- (BOOL)isInFamily
{
  return self->_isInFamily;
}

- (void)setHasDaysSinceAccountCreated:(BOOL)a3
{
  self->_hasDaysSinceAccountCreated = a3;
}

- (BOOL)hasDaysSinceAccountCreated
{
  return self->_hasDaysSinceAccountCreated;
}

- (int)daysSinceAccountCreated
{
  return self->_daysSinceAccountCreated;
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
    if ((!-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasDaysSinceAccountCreated](self, "hasDaysSinceAccountCreated")&& ![v5 hasDaysSinceAccountCreated]|| -[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasDaysSinceAccountCreated](self, "hasDaysSinceAccountCreated")&& objc_msgSend(v5, "hasDaysSinceAccountCreated")&& (int v6 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures daysSinceAccountCreated](self, "daysSinceAccountCreated"), v6 == objc_msgSend(v5, "daysSinceAccountCreated")))&& (!-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsInFamily](self, "hasIsInFamily")&& !objc_msgSend(v5, "hasIsInFamily")|| -[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsInFamily](self, "hasIsInFamily")&& objc_msgSend(v5, "hasIsInFamily")&& (v7 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isInFamily](self, "isInFamily"), v7 == objc_msgSend(v5, "isInFamily")))&& (!-[BMSiriAssistantSuggestionFeaturesiCloudFeatures hasIsHeadOfFamily](self, "hasIsHeadOfFamily")&& !objc_msgSend(v5, "hasIsHeadOfFamily")
       || [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self hasIsHeadOfFamily]
       && [v5 hasIsHeadOfFamily]
       && (int v8 = [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self isHeadOfFamily],
           v8 == [v5 isHeadOfFamily])))
    {
      v11 = [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self subscriptionStatus];
      v12 = [v5 subscriptionStatus];
      if (v11 == v12)
      {
        char v9 = 1;
      }
      else
      {
        v13 = [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self subscriptionStatus];
        v14 = [v5 subscriptionStatus];
        char v9 = [v13 isEqual:v14];
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self hasDaysSinceAccountCreated])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures daysSinceAccountCreated](self, "daysSinceAccountCreated"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self hasIsInFamily])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isInFamily](self, "isInFamily"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self hasIsHeadOfFamily])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isHeadOfFamily](self, "isHeadOfFamily"));
  }
  else
  {
    id v5 = 0;
  }
  int v6 = [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self subscriptionStatus];
  v13[0] = @"daysSinceAccountCreated";
  int v7 = v3;
  if (!v3)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"isInFamily";
  int v8 = v4;
  if (!v4)
  {
    int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"isHeadOfFamily";
  char v9 = v5;
  if (!v5)
  {
    char v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"subscriptionStatus";
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

- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"daysSinceAccountCreated"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    char v9 = [v6 objectForKeyedSubscript:@"isInFamily"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isInFamily"];
        id v38 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        v15 = 0;
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
    v10 = [v6 objectForKeyedSubscript:@"isHeadOfFamily"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isHeadOfFamily"];
        id v36 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        v15 = 0;
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
    v13 = [v6 objectForKeyedSubscript:@"subscriptionStatus"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)v11 initWithDaysSinceAccountCreated:v8 isInFamily:v31 isHeadOfFamily:v12 subscriptionStatus:v14];
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      int v7 = v32;
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
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subscriptionStatus"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    v15 = 0;
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
    v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"daysSinceAccountCreated"];
  v40[0] = v18;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v15 = 0;
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
  [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasDaysSinceAccountCreated)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasIsInFamily)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsHeadOfFamily)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_subscriptionStatus)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMSiriAssistantSuggestionFeaturesiCloudFeatures;
  id v5 = [(BMEventBase *)&v47 init];
  if (!v5) {
    goto LABEL_60;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    char v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasDaysSinceAccountCreated = 1;
          while (2)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_47:
          v5->_daysSinceAccountCreated = v22;
          continue;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasIsInFamily = 1;
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
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_49;
            }
            v27 += 7;
            BOOL v17 = v28++ >= 9;
            if (v17)
            {
              uint64_t v29 = 0;
              goto LABEL_51;
            }
          }
          v4[*v8] = 1;
LABEL_49:
          if (v4[*v8]) {
            uint64_t v29 = 0;
          }
LABEL_51:
          BOOL v43 = v29 != 0;
          uint64_t v44 = 17;
          goto LABEL_56;
        case 3u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          v5->_hasIsHeadOfFamily = 1;
          break;
        case 4u:
          uint64_t v41 = PBReaderReadString();
          subscriptionStatus = v5->_subscriptionStatus;
          v5->_subscriptionStatus = (NSString *)v41;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_59;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v6;
        uint64_t v38 = *(void *)&v4[v37];
        unint64_t v39 = v38 + 1;
        if (v38 == -1 || v39 > *(void *)&v4[*v7]) {
          break;
        }
        char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
        *(void *)&v4[v37] = v39;
        v36 |= (unint64_t)(v40 & 0x7F) << v34;
        if ((v40 & 0x80) == 0) {
          goto LABEL_53;
        }
        v34 += 7;
        BOOL v17 = v35++ >= 9;
        if (v17)
        {
          uint64_t v36 = 0;
          goto LABEL_55;
        }
      }
      v4[*v8] = 1;
LABEL_53:
      if (v4[*v8]) {
        uint64_t v36 = 0;
      }
LABEL_55:
      BOOL v43 = v36 != 0;
      uint64_t v44 = 19;
LABEL_56:
      *((unsigned char *)&v5->super.super.isa + v44) = v43;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_59:
  }
    v45 = 0;
  else {
LABEL_60:
  }
    v45 = v5;

  return v45;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures daysSinceAccountCreated](self, "daysSinceAccountCreated"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isInFamily](self, "isInFamily"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesiCloudFeatures isHeadOfFamily](self, "isHeadOfFamily"));
  int v7 = [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self subscriptionStatus];
  id v8 = (void *)[v3 initWithFormat:@"BMSiriAssistantSuggestionFeaturesiCloudFeatures with daysSinceAccountCreated: %@, isInFamily: %@, isHeadOfFamily: %@, subscriptionStatus: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)initWithDaysSinceAccountCreated:(id)a3 isInFamily:(id)a4 isHeadOfFamily:(id)a5 subscriptionStatus:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriAssistantSuggestionFeaturesiCloudFeatures;
  uint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasDaysSinceAccountCreated = 1;
      int v15 = [v10 intValue];
    }
    else
    {
      v14->_hasDaysSinceAccountCreated = 0;
      int v15 = -1;
    }
    v14->_daysSinceAccountCreated = v15;
    if (v11)
    {
      v14->_hasIsInFamily = 1;
      v14->_isInFamily = [v11 BOOLValue];
    }
    else
    {
      v14->_hasIsInFamily = 0;
      v14->_isInFamily = 0;
    }
    if (v12)
    {
      v14->_hasIsHeadOfFamily = 1;
      v14->_isHeadOfFamily = [v12 BOOLValue];
    }
    else
    {
      v14->_hasIsHeadOfFamily = 0;
      v14->_isHeadOfFamily = 0;
    }
    objc_storeStrong((id *)&v14->_subscriptionStatus, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"daysSinceAccountCreated" number:1 type:2 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isInFamily" number:2 type:12 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isHeadOfFamily" number:3 type:12 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subscriptionStatus" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3C48;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"daysSinceAccountCreated" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isInFamily" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isHeadOfFamily" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subscriptionStatus" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriAssistantSuggestionFeaturesiCloudFeatures alloc] initByReadFrom:v7];
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