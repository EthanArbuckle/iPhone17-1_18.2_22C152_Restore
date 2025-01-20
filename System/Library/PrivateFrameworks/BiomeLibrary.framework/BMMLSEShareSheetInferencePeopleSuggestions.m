@interface BMMLSEShareSheetInferencePeopleSuggestions
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEShareSheetInferencePeopleSuggestions)initWithIdentifier:(id)a3 sourceBundleId:(id)a4 peopleSuggestions:(id)a5;
- (BMMLSEShareSheetInferencePeopleSuggestions)initWithIdentifier:(id)a3 sourceBundleId:(id)a4 peopleSuggestions:(id)a5 responseType:(int)a6;
- (BMMLSEShareSheetInferencePeopleSuggestions)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)peopleSuggestions;
- (NSString)description;
- (NSString)identifier;
- (NSString)sourceBundleId;
- (id)_peopleSuggestionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)responseType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEShareSheetInferencePeopleSuggestions

- (BMMLSEShareSheetInferencePeopleSuggestions)initWithIdentifier:(id)a3 sourceBundleId:(id)a4 peopleSuggestions:(id)a5
{
  return [(BMMLSEShareSheetInferencePeopleSuggestions *)self initWithIdentifier:a3 sourceBundleId:a4 peopleSuggestions:a5 responseType:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_sourceBundleId, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int)responseType
{
  return self->_responseType;
}

- (NSArray)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self sourceBundleId];
    uint64_t v14 = [v5 sourceBundleId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self sourceBundleId];
      v17 = [v5 sourceBundleId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self peopleSuggestions];
    uint64_t v20 = [v5 peopleSuggestions];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self peopleSuggestions];
      v23 = [v5 peopleSuggestions];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        BOOL v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    int v25 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self responseType];
    BOOL v12 = v25 == [v5 responseType];
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self identifier];
  id v4 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self sourceBundleId];
  id v5 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self _peopleSuggestionsJSONArray];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEShareSheetInferencePeopleSuggestions responseType](self, "responseType"));
  v13[0] = @"identifier";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"sourceBundleId";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"peopleSuggestions";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"responseType";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4) {
        goto LABEL_12;
      }
LABEL_18:

      if (v3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v4) {
    goto LABEL_18;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (id)_peopleSuggestionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self peopleSuggestions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMMLSEShareSheetInferencePeopleSuggestions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    uint64_t v8 = [v5 objectForKeyedSubscript:@"sourceBundleId"];
    v51 = (void *)v8;
    if (!v8 || (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
LABEL_7:
      id v11 = [v5 objectForKeyedSubscript:@"peopleSuggestions"];
      long long v12 = [MEMORY[0x1E4F1CA98] null];
      int v13 = [v11 isEqual:v12];

      if (v13)
      {
        id v47 = v10;
        id v48 = v7;
        v49 = self;
        v50 = v6;

        id v11 = 0;
LABEL_12:
        v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v11 = v11;
        uint64_t v14 = [v11 countByEnumeratingWithState:&v56 objects:v66 count:16];
        if (!v14) {
          goto LABEL_22;
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v57;
        id v46 = v5;
LABEL_14:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(v11);
          }
          int v18 = *(void **)(*((void *)&v56 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v31 = a4;
            if (a4)
            {
              id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v33 = *MEMORY[0x1E4F502C8];
              uint64_t v62 = *MEMORY[0x1E4F28568];
              id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"peopleSuggestions"];
              id v63 = v19;
              v34 = (void *)MEMORY[0x1E4F1C9E8];
              v35 = &v63;
              v36 = &v62;
              goto LABEL_37;
            }
            goto LABEL_44;
          }
          id v19 = v18;
          uint64_t v20 = [BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion alloc];
          id v55 = 0;
          v21 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)v20 initWithJSONDictionary:v19 error:&v55];
          id v22 = v55;
          if (v22)
          {
            v37 = v22;
            if (a4) {
              *a4 = v22;
            }

            goto LABEL_41;
          }
          [v53 addObject:v21];

          if (v15 == ++v17)
          {
            uint64_t v15 = [v11 countByEnumeratingWithState:&v56 objects:v66 count:16];
            id v5 = v46;
            if (v15) {
              goto LABEL_14;
            }
LABEL_22:

            id v19 = [v5 objectForKeyedSubscript:@"responseType"];
            if (!v19)
            {
              id v23 = 0;
              id v7 = v48;
              self = v49;
              goto LABEL_53;
            }
            objc_opt_class();
            id v7 = v48;
            self = v49;
            if (objc_opt_isKindOfClass())
            {
              id v23 = 0;
              goto LABEL_53;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = v19;
              goto LABEL_53;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = [NSNumber numberWithInt:BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeFromString(v19)];
              id v7 = v48;
LABEL_53:
              id v10 = v47;
              self = -[BMMLSEShareSheetInferencePeopleSuggestions initWithIdentifier:sourceBundleId:peopleSuggestions:responseType:](self, "initWithIdentifier:sourceBundleId:peopleSuggestions:responseType:", v7, v47, v53, [v23 intValue]);
              v27 = self;
            }
            else
            {
              if (a4)
              {
                id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v42 = *MEMORY[0x1E4F502C8];
                uint64_t v60 = *MEMORY[0x1E4F28568];
                v43 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"responseType"];
                v61 = v43;
                v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
                *a4 = (id)[v45 initWithDomain:v42 code:2 userInfo:v44];
              }
              id v23 = 0;
              v27 = 0;
              id v7 = v48;
              id v10 = v47;
            }
LABEL_54:

            uint64_t v6 = v50;
LABEL_55:

            goto LABEL_57;
          }
        }
        v31 = a4;
        if (a4)
        {
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v33 = *MEMORY[0x1E4F502C8];
          uint64_t v64 = *MEMORY[0x1E4F28568];
          id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"peopleSuggestions"];
          id v65 = v19;
          v34 = (void *)MEMORY[0x1E4F1C9E8];
          v35 = &v65;
          v36 = &v64;
LABEL_37:
          v37 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:1];
          id *v31 = (id)[v32 initWithDomain:v33 code:2 userInfo:v37];
LABEL_41:

          v27 = 0;
          id v23 = v11;
          id v5 = v46;
          id v10 = v47;
          id v7 = v48;
          self = v49;
          goto LABEL_54;
        }
LABEL_44:
        v27 = 0;
        id v23 = v11;
        id v5 = v46;
        id v10 = v47;
        self = v49;
        uint64_t v6 = v50;
        id v7 = v48;
        goto LABEL_55;
      }
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v47 = v10;
        id v48 = v7;
        v49 = self;
        v50 = v6;
        goto LABEL_12;
      }
      if (a4)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v53 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"peopleSuggestions"];
        v68 = v53;
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        id v40 = (id)[v38 initWithDomain:v39 code:2 userInfo:v23];
        v27 = 0;
        *a4 = v40;
        goto LABEL_55;
      }
      v27 = 0;
LABEL_57:

      v9 = v51;
      goto LABEL_58;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      goto LABEL_7;
    }
    if (a4)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v29 = *MEMORY[0x1E4F502C8];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceBundleId"];
      id v70 = v11;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      id v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
      id v10 = 0;
      v27 = 0;
      *a4 = v30;

      goto LABEL_57;
    }
    id v10 = 0;
    v27 = 0;
LABEL_58:

    goto LABEL_59;
  }
  if (a4)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v25 = *MEMORY[0x1E4F502C8];
    uint64_t v71 = *MEMORY[0x1E4F28568];
    id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
    v72[0] = v10;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
    id v26 = (id)[v24 initWithDomain:v25 code:2 userInfo:v9];
    id v7 = 0;
    v27 = 0;
    *a4 = v26;
    goto LABEL_58;
  }
  id v7 = 0;
  v27 = 0;
LABEL_59:

  return v27;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMLSEShareSheetInferencePeopleSuggestions *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceBundleId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_peopleSuggestions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestions;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_44;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 24;
          goto LABEL_24;
        case 2u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 32;
LABEL_24:
          id v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          uint64_t v39 = 0;
          uint64_t v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_46;
          }
          id v24 = [[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion alloc] initByReadFrom:v4];
          if (!v24) {
            goto LABEL_46;
          }
          uint64_t v25 = v24;
          [v6 addObject:v24];
          PBReaderRecallMark();

          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_46:

          goto LABEL_43;
      }
      while (1)
      {
        uint64_t v29 = *v7;
        uint64_t v30 = *(void *)&v4[v29];
        unint64_t v31 = v30 + 1;
        if (v30 == -1 || v31 > *(void *)&v4[*v8]) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
        *(void *)&v4[v29] = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0) {
          goto LABEL_36;
        }
        v26 += 7;
        BOOL v18 = v27++ >= 9;
        if (v18)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      v4[*v9] = 1;
LABEL_36:
      if (v4[*v9]) {
        LODWORD(v28) = 0;
      }
LABEL_38:
      if (v28 >= 4) {
        LODWORD(v28) = 0;
      }
      v5->_responseType = v28;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v33 = [v6 copy];
  peopleSuggestions = v5->_peopleSuggestions;
  v5->_peopleSuggestions = (NSArray *)v33;

  int v35 = v4[*v9];
  if (v35) {
LABEL_43:
  }
    v36 = 0;
  else {
LABEL_44:
  }
    v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self identifier];
  id v5 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self sourceBundleId];
  uint64_t v6 = [(BMMLSEShareSheetInferencePeopleSuggestions *)self peopleSuggestions];
  uint64_t v7 = BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeAsString([(BMMLSEShareSheetInferencePeopleSuggestions *)self responseType]);
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMMLSEShareSheetInferencePeopleSuggestions with identifier: %@, sourceBundleId: %@, peopleSuggestions: %@, responseType: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMMLSEShareSheetInferencePeopleSuggestions)initWithIdentifier:(id)a3 sourceBundleId:(id)a4 peopleSuggestions:(id)a5 responseType:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestions;
  uint64_t v14 = [(BMEventBase *)&v16 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v14->_sourceBundleId, a4);
    objc_storeStrong((id *)&v14->_peopleSuggestions, a5);
    v14->_responseType = a6;
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceBundleId" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleSuggestions" number:3 type:14 subMessageClass:objc_opt_class()];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"responseType" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF73B0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceBundleId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"peopleSuggestions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_338_84327];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"responseType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __53__BMMLSEShareSheetInferencePeopleSuggestions_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _peopleSuggestionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMLSEShareSheetInferencePeopleSuggestions alloc] initByReadFrom:v7];
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