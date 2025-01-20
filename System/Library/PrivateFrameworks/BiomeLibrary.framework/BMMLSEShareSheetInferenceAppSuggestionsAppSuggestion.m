@interface BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(id)a5;
- (BOOL)hasRank;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)model;
- (NSString)transportBundleId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)rank;
- (void)setHasRank:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_transportBundleId, 0);
}

- (void)setHasRank:(BOOL)a3
{
  self->_hasRank = a3;
}

- (BOOL)hasRank
{
  return self->_hasRank;
}

- (unsigned)rank
{
  return self->_rank;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)transportBundleId
{
  return self->_transportBundleId;
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
    v6 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self transportBundleId];
    uint64_t v7 = [v5 transportBundleId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self transportBundleId];
      v10 = [v5 transportBundleId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_16;
      }
    }
    v13 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self model];
    uint64_t v14 = [v5 model];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self model];
      v17 = [v5 model];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_16;
      }
    }
    if (![(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self hasRank]
      && ![v5 hasRank])
    {
      BOOL v12 = 1;
      goto LABEL_17;
    }
    if ([(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self hasRank]
      && [v5 hasRank])
    {
      unsigned int v19 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self rank];
      BOOL v12 = v19 == [v5 rank];
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self transportBundleId];
  id v4 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self model];
  if ([(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self hasRank])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion rank](self, "rank"));
  }
  else
  {
    id v5 = 0;
  }
  v11[0] = @"transportBundleId";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"model";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"rank";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v9;
}

- (BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"transportBundleId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"model"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"model"];
        id v28 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        v13 = 0;
        id v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"rank"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rank"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self initWithTransportBundleId:v8 model:v10 rank:v12];
    v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"transportBundleId"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transportBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRank)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_41;
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        v5->_hasRank = 1;
        while (1)
        {
          uint64_t v25 = *v6;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 == -1 || v26 >= *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
          *(void *)&v4[v25] = v26 + 1;
          v24 |= (unint64_t)(v27 & 0x7F) << v22;
          if ((v27 & 0x80) == 0) {
            goto LABEL_35;
          }
          v22 += 7;
          BOOL v16 = v23++ >= 9;
          if (v16)
          {
            LODWORD(v24) = 0;
            goto LABEL_37;
          }
        }
        v4[*v8] = 1;
LABEL_35:
        if (v4[*v8]) {
          LODWORD(v24) = 0;
        }
LABEL_37:
        v5->_rank = v24;
      }
      else
      {
        if (v19 == 2)
        {
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
        }
        else
        {
          if (v19 != 1)
          {
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_40;
            }
            continue;
          }
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
        }
        id v28 = *(Class *)((char *)&v5->super.super.isa + v21);
        *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_40:
  }
    uint64_t v29 = 0;
  else {
LABEL_41:
  }
    uint64_t v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self transportBundleId];
  id v5 = [(BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion *)self model];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion rank](self, "rank"));
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion with transportBundleId: %@, model: %@, rank: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion;
  unint64_t v12 = [(BMEventBase *)&v15 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_transportBundleId, a3);
    objc_storeStrong((id *)&v12->_model, a4);
    if (v11)
    {
      v12->_hasRank = 1;
      unsigned int v13 = [v11 unsignedIntValue];
    }
    else
    {
      unsigned int v13 = 0;
      v12->_hasRank = 0;
    }
    v12->_rank = v13;
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transportBundleId" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"model", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rank" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5358;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transportBundleId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"model" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rank" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMLSEShareSheetInferenceAppSuggestionsAppSuggestion alloc] initByReadFrom:v7];
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