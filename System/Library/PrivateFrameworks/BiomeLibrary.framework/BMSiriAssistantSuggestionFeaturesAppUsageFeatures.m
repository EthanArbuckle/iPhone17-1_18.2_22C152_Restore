@interface BMSiriAssistantSuggestionFeaturesAppUsageFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)initWithAppUsage:(id)a3 appCategoryUsage:(id)a4;
- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)appCategoryUsage;
- (NSArray)appUsage;
- (NSString)description;
- (id)_appCategoryUsageJSONArray;
- (id)_appUsageJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesAppUsageFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appCategoryUsage, 0);

  objc_storeStrong((id *)&self->_appUsage, 0);
}

- (NSArray)appCategoryUsage
{
  return self->_appCategoryUsage;
}

- (NSArray)appUsage
{
  return self->_appUsage;
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
    v6 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appUsage];
    uint64_t v7 = [v5 appUsage];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appUsage];
      v10 = [v5 appUsage];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appCategoryUsage];
    v14 = [v5 appCategoryUsage];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appCategoryUsage];
      v16 = [v5 appCategoryUsage];
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
  v3 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self _appUsageJSONArray];
  id v4 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self _appCategoryUsageJSONArray];
  v9[0] = @"appUsage";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"appCategoryUsage";
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

- (id)_appCategoryUsageJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appCategoryUsage];
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

- (id)_appUsageJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appUsage];
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

- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"appUsage"];
  v8 = [MEMORY[0x1E4F1CA98] null];
  int v9 = [v7 isEqual:v8];

  id v55 = v6;
  if (v9)
  {
    v53 = a4;
    v54 = self;

    id v7 = 0;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v79 = *MEMORY[0x1E4F28568];
          v56 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"appUsage"];
          v80[0] = v56;
          id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];
          v30 = 0;
          *a4 = (id)[v40 initWithDomain:v41 code:2 userInfo:v19];
          goto LABEL_56;
        }
        v30 = 0;
        goto LABEL_57;
      }
    }
    v53 = a4;
    v54 = self;
  }
  v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v7 = v7;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v64;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v64 != v12) {
        objc_enumerationMutation(v7);
      }
      long long v14 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = v53;
        if (v53)
        {
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v24 = *MEMORY[0x1E4F502C8];
          uint64_t v76 = *MEMORY[0x1E4F28568];
          id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"appUsage"];
          id v77 = v15;
          v25 = (void *)MEMORY[0x1E4F1C9E8];
          v26 = &v77;
          v27 = &v76;
          goto LABEL_22;
        }
LABEL_42:
        v30 = 0;
        id v19 = v7;
        self = v54;
        goto LABEL_56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = v53;
        if (!v53) {
          goto LABEL_42;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"appUsage"];
        id v75 = v15;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = &v75;
        v27 = &v74;
LABEL_22:
        v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
        id *v22 = (id)[v23 initWithDomain:v24 code:2 userInfo:v28];

LABEL_26:
        v30 = 0;
        id v19 = v7;
        self = v54;
        goto LABEL_55;
      }
      id v15 = v14;
      uint64_t v16 = [BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc];
      id v62 = 0;
      v17 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket *)v16 initWithJSONDictionary:v15 error:&v62];
      id v18 = v62;
      if (v18)
      {
        v29 = v18;
        if (v53) {
          id *v53 = v18;
        }

        goto LABEL_26;
      }
      [v56 addObject:v17];
    }
    uint64_t v11 = [v7 countByEnumeratingWithState:&v63 objects:v78 count:16];
    id v6 = v55;
  }
  while (v11);
LABEL_16:

  id v19 = [v6 objectForKeyedSubscript:@"appCategoryUsage"];
  v20 = [MEMORY[0x1E4F1CA98] null];
  int v21 = [v19 isEqual:v20];

  if (v21)
  {

    id v19 = 0;
LABEL_29:
    id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v19 = v19;
    uint64_t v31 = [v19 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (!v31) {
      goto LABEL_39;
    }
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v59;
LABEL_31:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v59 != v33) {
        objc_enumerationMutation(v19);
      }
      v35 = *(void **)(*((void *)&v58 + 1) + 8 * v34);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = v53;
        self = v54;
        if (!v53) {
          goto LABEL_53;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"appCategoryUsage"];
        id v68 = v36;
        v45 = (void *)MEMORY[0x1E4F1C9E8];
        v46 = &v68;
        v47 = &v67;
        goto LABEL_48;
      }
      id v36 = v35;
      v37 = [BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc];
      id v57 = 0;
      v38 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket *)v37 initWithJSONDictionary:v36 error:&v57];
      id v39 = v57;
      if (v39)
      {
        v48 = v39;
        if (v53) {
          id *v53 = v39;
        }

        self = v54;
LABEL_52:

LABEL_53:
        goto LABEL_54;
      }
      [v15 addObject:v38];

      if (v32 == ++v34)
      {
        uint64_t v32 = [v19 countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (v32) {
          goto LABEL_31;
        }
LABEL_39:

        self = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)v54 initWithAppUsage:v56 appCategoryUsage:v15];
        v30 = self;
LABEL_55:

        goto LABEL_56;
      }
    }
    v42 = v53;
    self = v54;
    if (!v53) {
      goto LABEL_53;
    }
    id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v44 = *MEMORY[0x1E4F502C8];
    uint64_t v69 = *MEMORY[0x1E4F28568];
    id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"appCategoryUsage"];
    id v70 = v36;
    v45 = (void *)MEMORY[0x1E4F1C9E8];
    v46 = &v70;
    v47 = &v69;
LABEL_48:
    v48 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:1];
    id *v42 = (id)[v43 initWithDomain:v44 code:2 userInfo:v48];
    goto LABEL_52;
  }
  if (!v19) {
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_29;
  }
  self = v54;
  if (v53)
  {
    id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v51 = *MEMORY[0x1E4F502C8];
    uint64_t v72 = *MEMORY[0x1E4F28568];
    id v15 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"appCategoryUsage"];
    id v73 = v15;
    v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id *v53 = (id)[v50 initWithDomain:v51 code:2 userInfo:v52];

LABEL_54:
    v30 = 0;
    goto LABEL_55;
  }
  v30 = 0;
LABEL_56:

  id v6 = v55;
LABEL_57:

  return v30;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_appUsage;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v21 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_appCategoryUsage;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        uint64_t v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (void)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v13);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMSiriAssistantSuggestionFeaturesAppUsageFeatures;
  uint64_t v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_31;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v10]) {
        goto LABEL_30;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        if (v13++ >= 9)
        {
          unint64_t v14 = 0;
          int v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v20 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v20 || (v14 & 7) == 4) {
        goto LABEL_30;
      }
      if ((v14 >> 3) == 2) {
        break;
      }
      if ((v14 >> 3) == 1)
      {
        uint64_t v34 = 0;
        uint64_t v35 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_32;
        }
        id v22 = [[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc] initByReadFrom:v4];
        if (!v22) {
          goto LABEL_32;
        }
        long long v23 = v22;
        long long v24 = v6;
LABEL_27:
        [v24 addObject:v23];
        PBReaderRecallMark();

        goto LABEL_29;
      }
      if (!PBReaderSkipValueWithTag()) {
        goto LABEL_32;
      }
LABEL_29:
      if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
        goto LABEL_30;
      }
    }
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    if ((PBReaderPlaceMark() & 1) == 0
      || (id v25 = [[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc] initByReadFrom:v4]) == 0)
    {
LABEL_32:

      goto LABEL_33;
    }
    long long v23 = v25;
    long long v24 = v7;
    goto LABEL_27;
  }
LABEL_30:
  uint64_t v26 = [v6 copy];
  appUsage = v5->_appUsage;
  v5->_appUsage = (NSArray *)v26;

  uint64_t v28 = [v7 copy];
  appCategoryUsage = v5->_appCategoryUsage;
  v5->_appCategoryUsage = (NSArray *)v28;

  int v30 = v4[*v10];
  if (v30) {
LABEL_33:
  }
    uint64_t v31 = 0;
  else {
LABEL_31:
  }
    uint64_t v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appUsage];
  uint64_t v5 = [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self appCategoryUsage];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMSiriAssistantSuggestionFeaturesAppUsageFeatures with appUsage: %@, appCategoryUsage: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)initWithAppUsage:(id)a3 appCategoryUsage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSiriAssistantSuggestionFeaturesAppUsageFeatures;
  uint64_t v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_appUsage, a3);
    objc_storeStrong((id *)&v9->_appCategoryUsage, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appUsage" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appCategoryUsage" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3BD0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"appUsage_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_465];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"appCategoryUsage_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_467];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __60__BMSiriAssistantSuggestionFeaturesAppUsageFeatures_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _appCategoryUsageJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __60__BMSiriAssistantSuggestionFeaturesAppUsageFeatures_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _appUsageJSONArray];
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

    id v8 = [[BMSiriAssistantSuggestionFeaturesAppUsageFeatures alloc] initByReadFrom:v7];
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