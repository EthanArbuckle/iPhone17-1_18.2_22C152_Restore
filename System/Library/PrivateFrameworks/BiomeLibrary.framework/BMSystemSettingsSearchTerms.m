@interface BMSystemSettingsSearchTerms
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSystemSettingsSearchTerms)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMSystemSettingsSearchTerms)initWithSearchTerm:(id)a3 searchResultsClickedOn:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)searchResultsClickedOn;
- (NSString)description;
- (NSString)searchTerm;
- (id)_searchResultsClickedOnJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSystemSettingsSearchTerms

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"searchTerm" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"searchResultsClickedOn_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_28940];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsClickedOn, 0);

  objc_storeStrong((id *)&self->_searchTerm, 0);
}

- (NSArray)searchResultsClickedOn
{
  return self->_searchResultsClickedOn;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
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
    v6 = [(BMSystemSettingsSearchTerms *)self searchTerm];
    uint64_t v7 = [v5 searchTerm];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSystemSettingsSearchTerms *)self searchTerm];
      v10 = [v5 searchTerm];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMSystemSettingsSearchTerms *)self searchResultsClickedOn];
    v14 = [v5 searchResultsClickedOn];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMSystemSettingsSearchTerms *)self searchResultsClickedOn];
      v16 = [v5 searchResultsClickedOn];
      char v12 = [v15 isEqual:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSystemSettingsSearchTerms *)self searchTerm];
  id v4 = [(BMSystemSettingsSearchTerms *)self _searchResultsClickedOnJSONArray];
  v9[0] = @"searchTerm";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"searchResultsClickedOn";
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
      goto LABEL_7;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)_searchResultsClickedOnJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSystemSettingsSearchTerms *)self searchResultsClickedOn];
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

- (BMSystemSettingsSearchTerms)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"searchTerm"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v23 = p_isa;
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"searchTerm"];
        v57[0] = v9;
        long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
        id v25 = (id)[v22 initWithDomain:v24 code:2 userInfo:v12];
        p_isa = 0;
        id v8 = 0;
        id *v23 = v25;
        goto LABEL_34;
      }
      id v8 = 0;
      goto LABEL_36;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"searchResultsClickedOn"];
  v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  v43 = v7;
  if (v11)
  {
    v39 = p_isa;
    id v40 = v6;
    v41 = self;
    id v42 = v8;

    id v9 = 0;
LABEL_9:
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v9 = v9;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v46 != v15) {
        objc_enumerationMutation(v9);
      }
      v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = v40;
        self = v41;
        uint64_t v7 = v43;
        v26 = v39;
        if (!v39) {
          goto LABEL_33;
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v49 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"searchResultsClickedOn"];
        id v50 = v18;
        v29 = (void *)MEMORY[0x1E4F1C9E8];
        v30 = &v50;
        v31 = &v49;
        goto LABEL_28;
      }
      id v18 = v17;
      v19 = [BMSystemSettingsSearchTermsSearchResultClickedOn alloc];
      id v44 = 0;
      v20 = [(BMSystemSettingsSearchTermsSearchResultClickedOn *)v19 initWithJSONDictionary:v18 error:&v44];
      id v21 = v44;
      if (v21)
      {
        v32 = v21;
        if (v39) {
          id *v39 = v21;
        }

        id v6 = v40;
        self = v41;
        uint64_t v7 = v43;
LABEL_32:

LABEL_33:
        p_isa = 0;
        id v8 = v42;
        goto LABEL_34;
      }
      [v12 addObject:v20];

      if (v14 == ++v16)
      {
        uint64_t v14 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v14) {
          goto LABEL_11;
        }
LABEL_19:

        id v8 = v42;
        self = [(BMSystemSettingsSearchTerms *)v41 initWithSearchTerm:v42 searchResultsClickedOn:v12];
        p_isa = (id *)&self->super.super.isa;
        id v6 = v40;
        uint64_t v7 = v43;
LABEL_34:

        goto LABEL_35;
      }
    }
    id v6 = v40;
    self = v41;
    uint64_t v7 = v43;
    v26 = v39;
    if (!v39) {
      goto LABEL_33;
    }
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v28 = *MEMORY[0x1E4F502C8];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"searchResultsClickedOn"];
    id v52 = v18;
    v29 = (void *)MEMORY[0x1E4F1C9E8];
    v30 = &v52;
    v31 = &v51;
LABEL_28:
    v32 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];
    uint64_t v33 = v28;
    uint64_t v7 = v43;
    id *v26 = (id)[v27 initWithDomain:v33 code:2 userInfo:v32];
    goto LABEL_32;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = p_isa;
    id v40 = v6;
    v41 = self;
    id v42 = v8;
    goto LABEL_9;
  }
  if (p_isa)
  {
    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    v36 = p_isa;
    uint64_t v37 = *MEMORY[0x1E4F502C8];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    long long v12 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"searchResultsClickedOn"];
    v55 = v12;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    id *v36 = (id)[v35 initWithDomain:v37 code:2 userInfo:v38];

    p_isa = 0;
    goto LABEL_34;
  }
LABEL_35:

LABEL_36:
  return (BMSystemSettingsSearchTerms *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSystemSettingsSearchTerms *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_searchTerm) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_searchResultsClickedOn;
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
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMSystemSettingsSearchTerms;
  uint64_t v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v15 = *(void *)&v4[v14];
        if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        if (v12++ >= 9)
        {
          unint64_t v13 = 0;
          int v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v18 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v18 || (v13 & 7) == 4) {
        break;
      }
      if ((v13 >> 3) == 2)
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v22 = [[BMSystemSettingsSearchTermsSearchResultClickedOn alloc] initByReadFrom:v4]) == 0)
        {
LABEL_31:

          goto LABEL_28;
        }
        v23 = v22;
        [v6 addObject:v22];
        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        searchTerm = v5->_searchTerm;
        v5->_searchTerm = (NSString *)v20;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v24 = [v6 copy];
  searchResultsClickedOn = v5->_searchResultsClickedOn;
  v5->_searchResultsClickedOn = (NSArray *)v24;

  int v26 = v4[*v9];
  if (v26) {
LABEL_28:
  }
    id v27 = 0;
  else {
LABEL_29:
  }
    id v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSystemSettingsSearchTerms *)self searchTerm];
  uint64_t v5 = [(BMSystemSettingsSearchTerms *)self searchResultsClickedOn];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMSystemSettingsSearchTerms with searchTerm: %@, searchResultsClickedOn: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSystemSettingsSearchTerms)initWithSearchTerm:(id)a3 searchResultsClickedOn:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSystemSettingsSearchTerms;
  id v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_searchTerm, a3);
    objc_storeStrong((id *)&v9->_searchResultsClickedOn, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"searchTerm" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"searchResultsClickedOn" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4758;
}

id __38__BMSystemSettingsSearchTerms_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _searchResultsClickedOnJSONArray];
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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSystemSettingsSearchTerms alloc] initByReadFrom:v7];
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