@interface BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)initWithModelType:(int)a3 trialIdentifier:(id)a4 otherModelTypeName:(id)a5;
- (BMTrialIdentifier)trialIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)otherModelTypeName;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)modelType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherModelTypeName, 0);

  objc_storeStrong((id *)&self->_trialIdentifier, 0);
}

- (NSString)otherModelTypeName
{
  return self->_otherModelTypeName;
}

- (BMTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (int)modelType
{
  return self->_modelType;
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
    int v6 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self modelType];
    if (v6 == [v5 modelType])
    {
      v7 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self trialIdentifier];
      uint64_t v8 = [v5 trialIdentifier];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self trialIdentifier];
        v11 = [v5 trialIdentifier];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self otherModelTypeName];
      v15 = [v5 otherModelTypeName];
      if (v14 == v15)
      {
        char v13 = 1;
      }
      else
      {
        v16 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self otherModelTypeName];
        v17 = [v5 otherModelTypeName];
        char v13 = [v16 isEqual:v17];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (id)jsonDictionary
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier modelType](self, "modelType"));
  id v4 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self trialIdentifier];
  id v5 = [v4 jsonDictionary];

  int v6 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self otherModelTypeName];
  v12[0] = @"modelType";
  v7 = v3;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v7;
  v12[1] = @"trialIdentifier";
  uint64_t v8 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v12[2] = @"otherModelTypeName";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (v6)
  {
    if (v5) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v5) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"modelType"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v8 = 0;
          char v13 = 0;
          goto LABEL_19;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"modelType"];
        v34[0] = v10;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v11];
        uint64_t v8 = 0;
        char v13 = 0;
        *a4 = v24;
        goto LABEL_17;
      }
      id v9 = [NSNumber numberWithInt:BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeFromString(v7)];
    }
    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v10 = [v6 objectForKeyedSubscript:@"trialIdentifier"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v10;
    id v28 = 0;
    v11 = [[BMTrialIdentifier alloc] initWithJSONDictionary:v15 error:&v28];
    id v16 = v28;
    if (v16)
    {
      v17 = v16;
      if (a4) {
        *a4 = v16;
      }

      char v13 = 0;
      v10 = v15;
      goto LABEL_17;
    }

LABEL_12:
    int v12 = [v6 objectForKeyedSubscript:@"otherModelTypeName"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = *MEMORY[0x1E4F502C8];
          uint64_t v29 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"otherModelTypeName"];
          v30 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          *a4 = (id)[v27 initWithDomain:v25 code:2 userInfo:v21];

          char v13 = 0;
          a4 = 0;
        }
        else
        {
          char v13 = 0;
        }
        goto LABEL_16;
      }
      a4 = v12;
    }
    else
    {
      a4 = 0;
    }
    self = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier initWithModelType:trialIdentifier:otherModelTypeName:](self, "initWithModelType:trialIdentifier:otherModelTypeName:", [v8 intValue], v11, a4);
    char v13 = self;
LABEL_16:

    goto LABEL_17;
  }
  if (!a4)
  {
    char v13 = 0;
    goto LABEL_18;
  }
  id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v31 = *MEMORY[0x1E4F28568];
  v11 = (BMTrialIdentifier *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trialIdentifier"];
  v32 = v11;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  *a4 = (id)[v26 initWithDomain:v18 code:2 userInfo:v19];

  char v13 = 0;
LABEL_17:

LABEL_18:
LABEL_19:

  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_trialIdentifier)
  {
    PBDataWriterPlaceMark();
    [(BMTrialIdentifier *)self->_trialIdentifier writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_otherModelTypeName) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier;
  id v5 = [(BMEventBase *)&v34 init];
  if (!v5) {
    goto LABEL_44;
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v28 = PBReaderReadString();
        otherModelTypeName = v5->_otherModelTypeName;
        v5->_otherModelTypeName = (NSString *)v28;
      }
      else if (v20 == 2)
      {
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_43;
        }
        v30 = [[BMTrialIdentifier alloc] initByReadFrom:v4];
        if (!v30) {
          goto LABEL_43;
        }
        trialIdentifier = v5->_trialIdentifier;
        v5->_trialIdentifier = v30;

        PBReaderRecallMark();
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
            goto LABEL_36;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        if (v23 >= 0x1E) {
          LODWORD(v23) = 0;
        }
        v5->_modelType = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_43:
  }
    v32 = 0;
  else {
LABEL_44:
  }
    v32 = v5;

  return v32;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeAsString([(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self modelType]);
  id v5 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self trialIdentifier];
  id v6 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self otherModelTypeName];
  v7 = (void *)[v3 initWithFormat:@"BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier with modelType: %@, trialIdentifier: %@, otherModelTypeName: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)initWithModelType:(int)a3 trialIdentifier:(id)a4 otherModelTypeName:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier;
  unsigned int v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v11->_modelType = a3;
    objc_storeStrong((id *)&v11->_trialIdentifier, a4);
    objc_storeStrong((id *)&v11->_otherModelTypeName, a5);
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelType" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"trialIdentifier", 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"otherModelTypeName" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7380;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trialIdentifier_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_139];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"otherModelTypeName" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __84__BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 trialIdentifier];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier alloc] initByReadFrom:v7];
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