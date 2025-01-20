@interface BMSafariBrowsingAssistantDimensionContext
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantDimensionContext)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistantDimensionContext)initWithWebpageViewIdentifier:(id)a3 systemLocale:(id)a4 currentCountry:(id)a5 build:(id)a6 osType:(id)a7 productType:(id)a8 buildType:(int)a9 duEnabled:(id)a10 searchBarPosition:(int)a11 prefixStoreVersion:(id)a12 trialExperiment:(id)a13;
- (BOOL)duEnabled;
- (BOOL)hasDuEnabled;
- (BOOL)isEqual:(id)a3;
- (NSArray)trialExperiment;
- (NSData)webpageViewIdentifier;
- (NSString)build;
- (NSString)currentCountry;
- (NSString)description;
- (NSString)osType;
- (NSString)prefixStoreVersion;
- (NSString)productType;
- (NSString)systemLocale;
- (id)_trialExperimentJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)buildType;
- (int)searchBarPosition;
- (unsigned)dataVersion;
- (void)setHasDuEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantDimensionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialExperiment, 0);
  objc_storeStrong((id *)&self->_prefixStoreVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_osType, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_currentCountry, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);

  objc_storeStrong((id *)&self->_webpageViewIdentifier, 0);
}

- (NSArray)trialExperiment
{
  return self->_trialExperiment;
}

- (NSString)prefixStoreVersion
{
  return self->_prefixStoreVersion;
}

- (int)searchBarPosition
{
  return self->_searchBarPosition;
}

- (void)setHasDuEnabled:(BOOL)a3
{
  self->_hasDuEnabled = a3;
}

- (BOOL)hasDuEnabled
{
  return self->_hasDuEnabled;
}

- (BOOL)duEnabled
{
  return self->_duEnabled;
}

- (int)buildType
{
  return self->_buildType;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)osType
{
  return self->_osType;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)currentCountry
{
  return self->_currentCountry;
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (NSData)webpageViewIdentifier
{
  return self->_webpageViewIdentifier;
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
    v6 = [(BMSafariBrowsingAssistantDimensionContext *)self webpageViewIdentifier];
    uint64_t v7 = [v5 webpageViewIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistantDimensionContext *)self webpageViewIdentifier];
      v10 = [v5 webpageViewIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_36;
      }
    }
    v13 = [(BMSafariBrowsingAssistantDimensionContext *)self systemLocale];
    uint64_t v14 = [v5 systemLocale];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariBrowsingAssistantDimensionContext *)self systemLocale];
      v17 = [v5 systemLocale];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_36;
      }
    }
    v19 = [(BMSafariBrowsingAssistantDimensionContext *)self currentCountry];
    uint64_t v20 = [v5 currentCountry];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSafariBrowsingAssistantDimensionContext *)self currentCountry];
      v23 = [v5 currentCountry];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_36;
      }
    }
    v25 = [(BMSafariBrowsingAssistantDimensionContext *)self build];
    uint64_t v26 = [v5 build];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSafariBrowsingAssistantDimensionContext *)self build];
      v29 = [v5 build];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_36;
      }
    }
    v31 = [(BMSafariBrowsingAssistantDimensionContext *)self osType];
    uint64_t v32 = [v5 osType];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSafariBrowsingAssistantDimensionContext *)self osType];
      v35 = [v5 osType];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_36;
      }
    }
    v37 = [(BMSafariBrowsingAssistantDimensionContext *)self productType];
    uint64_t v38 = [v5 productType];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMSafariBrowsingAssistantDimensionContext *)self productType];
      v41 = [v5 productType];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_36;
      }
    }
    int v43 = [(BMSafariBrowsingAssistantDimensionContext *)self buildType];
    if (v43 != [v5 buildType]) {
      goto LABEL_36;
    }
    if ([(BMSafariBrowsingAssistantDimensionContext *)self hasDuEnabled]
      || [v5 hasDuEnabled])
    {
      if (![(BMSafariBrowsingAssistantDimensionContext *)self hasDuEnabled]) {
        goto LABEL_36;
      }
      if (![v5 hasDuEnabled]) {
        goto LABEL_36;
      }
      int v44 = [(BMSafariBrowsingAssistantDimensionContext *)self duEnabled];
      if (v44 != [v5 duEnabled]) {
        goto LABEL_36;
      }
    }
    int v45 = [(BMSafariBrowsingAssistantDimensionContext *)self searchBarPosition];
    if (v45 != [v5 searchBarPosition]) {
      goto LABEL_36;
    }
    v46 = [(BMSafariBrowsingAssistantDimensionContext *)self prefixStoreVersion];
    uint64_t v47 = [v5 prefixStoreVersion];
    if (v46 == (void *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(BMSafariBrowsingAssistantDimensionContext *)self prefixStoreVersion];
      v50 = [v5 prefixStoreVersion];
      int v51 = [v49 isEqual:v50];

      if (!v51)
      {
LABEL_36:
        char v12 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    v53 = [(BMSafariBrowsingAssistantDimensionContext *)self trialExperiment];
    v54 = [v5 trialExperiment];
    if (v53 == v54)
    {
      char v12 = 1;
    }
    else
    {
      v55 = [(BMSafariBrowsingAssistantDimensionContext *)self trialExperiment];
      v56 = [v5 trialExperiment];
      char v12 = [v55 isEqual:v56];
    }
    goto LABEL_37;
  }
  char v12 = 0;
LABEL_38:

  return v12;
}

- (id)jsonDictionary
{
  v38[11] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariBrowsingAssistantDimensionContext *)self webpageViewIdentifier];
  uint64_t v4 = [v3 base64EncodedStringWithOptions:0];

  uint64_t v5 = [(BMSafariBrowsingAssistantDimensionContext *)self systemLocale];
  uint64_t v6 = [(BMSafariBrowsingAssistantDimensionContext *)self currentCountry];
  uint64_t v7 = [(BMSafariBrowsingAssistantDimensionContext *)self build];
  v8 = [(BMSafariBrowsingAssistantDimensionContext *)self osType];
  int v36 = [(BMSafariBrowsingAssistantDimensionContext *)self productType];
  v35 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantDimensionContext buildType](self, "buildType"));
  v9 = 0;
  if ([(BMSafariBrowsingAssistantDimensionContext *)self hasDuEnabled])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariBrowsingAssistantDimensionContext duEnabled](self, "duEnabled"));
  }
  v34 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantDimensionContext searchBarPosition](self, "searchBarPosition"));
  v10 = [(BMSafariBrowsingAssistantDimensionContext *)self prefixStoreVersion];
  int v11 = [(BMSafariBrowsingAssistantDimensionContext *)self _trialExperimentJSONArray];
  v37[0] = @"webpageViewIdentifier";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v12;
  v38[0] = v12;
  v37[1] = @"systemLocale";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v13;
  v38[1] = v13;
  v37[2] = @"currentCountry";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v14;
  v38[2] = v14;
  v37[3] = @"build";
  uint64_t v15 = v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v4;
  v25 = (void *)v15;
  v38[3] = v15;
  v37[4] = @"osType";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v5;
  int v24 = (void *)v16;
  v38[4] = v16;
  v37[5] = @"productType";
  v17 = v36;
  if (!v36)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v6;
  v38[5] = v17;
  v37[6] = @"buildType";
  int v18 = v35;
  if (!v35)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v7;
  v38[6] = v18;
  v37[7] = @"duEnabled";
  v19 = v9;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[7] = v19;
  v37[8] = @"searchBarPosition";
  uint64_t v20 = v34;
  if (!v34)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[8] = v20;
  v37[9] = @"prefixStoreVersion";
  v21 = v10;
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[9] = v21;
  v37[10] = @"trialExperiment";
  v22 = v11;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[10] = v22;
  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:11];
  if (v11)
  {
    if (v10) {
      goto LABEL_27;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_27;
    }
  }

LABEL_27:
  if (v34)
  {
    if (v9) {
      goto LABEL_29;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_29;
    }
  }

LABEL_29:
  if (!v35) {

  }
  if (!v36) {
  if (!v8)
  }

  if (v30)
  {
    if (v31) {
      goto LABEL_37;
    }
  }
  else
  {

    if (v31)
    {
LABEL_37:
      if (v32) {
        goto LABEL_38;
      }
LABEL_48:

      if (v33) {
        goto LABEL_39;
      }
      goto LABEL_49;
    }
  }

  if (!v32) {
    goto LABEL_48;
  }
LABEL_38:
  if (v33) {
    goto LABEL_39;
  }
LABEL_49:

LABEL_39:

  return v29;
}

- (id)_trialExperimentJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMSafariBrowsingAssistantDimensionContext *)self trialExperiment];
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

- (BMSafariBrowsingAssistantDimensionContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v211[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"webpageViewIdentifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v210 = *MEMORY[0x1E4F28568];
        int v30 = v6;
        id v31 = [NSString alloc];
        uint64_t v146 = objc_opt_class();
        uint64_t v32 = v31;
        uint64_t v6 = v30;
        uint64_t v33 = [v32 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", v146, @"webpageViewIdentifier"];
        v211[0] = v33;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v211 forKeys:&v210 count:1];
        v35 = v28;
        v8 = (void *)v34;
        uint64_t v36 = v29;
        id v9 = (id)v33;
        id v7 = 0;
        v37 = 0;
        *a4 = (id)[v35 initWithDomain:v36 code:2 userInfo:v34];
        goto LABEL_111;
      }
      id v7 = 0;
      v37 = 0;
      goto LABEL_112;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"systemLocale"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        uint64_t v38 = v8;
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v208 = *MEMORY[0x1E4F28568];
        id v177 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemLocale"];
        id v209 = v177;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
        int v42 = v39;
        v8 = v38;
        id v43 = (id)[v42 initWithDomain:v40 code:2 userInfo:v41];
        id v9 = 0;
        v37 = 0;
        *a4 = v43;
        goto LABEL_110;
      }
      id v9 = 0;
      v37 = 0;
      goto LABEL_111;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  v10 = [v5 objectForKeyedSubscript:@"currentCountry"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v165 = v6;
      int v44 = a4;
      int v45 = v10;
      if (v44)
      {
        v46 = v8;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v48 = v9;
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v206 = *MEMORY[0x1E4F28568];
        id v50 = v7;
        id v51 = [NSString alloc];
        uint64_t v147 = objc_opt_class();
        v41 = v45;
        v52 = v51;
        id v7 = v50;
        a4 = (id *)[v52 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v147, @"currentCountry"];
        v207 = a4;
        long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
        v53 = v47;
        v8 = v46;
        uint64_t v54 = v49;
        id v9 = v48;
        id v177 = 0;
        v37 = 0;
        *int v44 = (id)[v53 initWithDomain:v54 code:2 userInfo:v11];
        uint64_t v6 = v165;
        goto LABEL_109;
      }
      id v177 = 0;
      v37 = 0;
      v41 = v10;
      uint64_t v6 = v165;
      goto LABEL_110;
    }
    v175 = v10;
    id v177 = v10;
  }
  else
  {
    v175 = v10;
    id v177 = 0;
  }
  long long v11 = [v5 objectForKeyedSubscript:@"build"];
  v176 = v11;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v66 = v8;
        id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v68 = v9;
        uint64_t v69 = *MEMORY[0x1E4F502C8];
        uint64_t v204 = *MEMORY[0x1E4F28568];
        v166 = v6;
        v70 = a4;
        id v71 = v7;
        id v72 = [NSString alloc];
        uint64_t v148 = objc_opt_class();
        v73 = v72;
        id v7 = v71;
        id v174 = (id)[v73 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v148, @"build"];
        id v205 = v174;
        uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
        v75 = v67;
        v8 = v66;
        long long v12 = (void *)v74;
        uint64_t v76 = v69;
        id v9 = v68;
        a4 = 0;
        v37 = 0;
        id *v70 = (id)[v75 initWithDomain:v76 code:2 userInfo:v74];
        uint64_t v6 = v166;
        v41 = v175;
        goto LABEL_108;
      }
      v37 = 0;
      v41 = v175;
      goto LABEL_109;
    }
    v172 = v11;
  }
  else
  {
    v172 = 0;
  }
  long long v12 = [v5 objectForKeyedSubscript:@"osType"];
  v178 = v12;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v174 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        goto LABEL_108;
      }
      v77 = v8;
      id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v79 = v9;
      uint64_t v80 = *MEMORY[0x1E4F502C8];
      uint64_t v202 = *MEMORY[0x1E4F28568];
      id v81 = v7;
      id v82 = [NSString alloc];
      uint64_t v149 = objc_opt_class();
      v83 = v82;
      id v7 = v81;
      id v173 = (id)[v83 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v149, @"osType"];
      id v203 = v173;
      uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
      v85 = v78;
      v8 = v77;
      long long v12 = v178;
      uint64_t v86 = v80;
      id v9 = v79;
      v171 = (void *)v84;
      id v174 = 0;
      v37 = 0;
      *a4 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, 2);
      goto LABEL_120;
    }
    id v174 = v12;
  }
  else
  {
    id v174 = 0;
  }
  uint64_t v13 = [v5 objectForKeyedSubscript:@"productType"];
  v171 = (void *)v13;
  if (v13)
  {
    long long v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v173 = v14;
        goto LABEL_19;
      }
      if (a4)
      {
        v87 = v8;
        id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v89 = v9;
        uint64_t v90 = *MEMORY[0x1E4F502C8];
        uint64_t v200 = *MEMORY[0x1E4F28568];
        id v91 = v7;
        id v92 = [NSString alloc];
        uint64_t v150 = objc_opt_class();
        v93 = v92;
        id v7 = v91;
        id v170 = (id)[v93 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v150, @"productType"];
        id v201 = v170;
        uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
        v95 = v88;
        v8 = v87;
        long long v12 = v178;
        uint64_t v96 = v90;
        id v9 = v89;
        v169 = (void *)v94;
        id v173 = 0;
        v37 = 0;
        *a4 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2);
        v41 = v175;
        long long v11 = v176;
        a4 = v172;
        goto LABEL_106;
      }
      id v173 = 0;
      v37 = 0;
LABEL_120:
      v41 = v175;
      long long v11 = v176;
      a4 = v172;
      goto LABEL_107;
    }
  }
  id v173 = 0;
LABEL_19:
  uint64_t v15 = [v5 objectForKeyedSubscript:@"buildType"];
  v169 = (void *)v15;
  if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v170 = v16;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v159 = v8;
          id v127 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v128 = v9;
          uint64_t v129 = *MEMORY[0x1E4F502C8];
          uint64_t v198 = *MEMORY[0x1E4F28568];
          id v130 = v7;
          id v131 = [NSString alloc];
          uint64_t v152 = objc_opt_class();
          v132 = v131;
          id v7 = v130;
          id v168 = (id)[v132 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v152, @"buildType"];
          id v199 = v168;
          uint64_t v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];
          v134 = v127;
          v8 = v159;
          uint64_t v135 = v129;
          id v9 = v128;
          v167 = (void *)v133;
          id v170 = 0;
          v37 = 0;
          *a4 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v135, 2);
          v41 = v175;
          long long v11 = v176;
          a4 = v172;
          goto LABEL_105;
        }
        id v170 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        goto LABEL_106;
      }
      id v170 = [NSNumber numberWithInt:BMSafariBrowsingAssistantBuildTypeFromString(v16)];
    }
  }
  else
  {
    id v170 = 0;
  }
  uint64_t v17 = [v5 objectForKeyedSubscript:@"duEnabled"];
  v167 = (void *)v17;
  if (v17 && (int v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v97 = v8;
        id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v99 = v9;
        uint64_t v100 = *MEMORY[0x1E4F502C8];
        uint64_t v196 = *MEMORY[0x1E4F28568];
        id v101 = v7;
        id v102 = [NSString alloc];
        uint64_t v151 = objc_opt_class();
        v103 = v102;
        id v7 = v101;
        long long v11 = v176;
        id v163 = (id)[v103 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v151, @"duEnabled"];
        id v197 = v163;
        uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
        v105 = v98;
        v8 = v97;
        long long v12 = v178;
        uint64_t v106 = v100;
        id v9 = v99;
        v162 = (void *)v104;
        id v168 = 0;
        v37 = 0;
        *a4 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v106, 2);
        v41 = v175;
        a4 = v172;
        goto LABEL_104;
      }
      id v168 = 0;
      v37 = 0;
      v41 = v175;
      a4 = v172;
      goto LABEL_105;
    }
    id v168 = v18;
  }
  else
  {
    id v168 = 0;
  }
  uint64_t v19 = [v5 objectForKeyedSubscript:@"searchBarPosition"];
  v162 = (void *)v19;
  v158 = v8;
  id v160 = v7;
  if (v19 && (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = a4;
      id v163 = v20;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v137 = v9;
          uint64_t v138 = *MEMORY[0x1E4F502C8];
          uint64_t v194 = *MEMORY[0x1E4F28568];
          id v139 = v7;
          id v140 = [NSString alloc];
          uint64_t v153 = objc_opt_class();
          v141 = v140;
          id v7 = v139;
          id v161 = (id)[v141 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v153, @"searchBarPosition"];
          id v195 = v161;
          uint64_t v142 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
          v143 = v136;
          v8 = v158;
          uint64_t v144 = v138;
          id v9 = v137;
          v156 = (void *)v142;
          id v163 = 0;
          v37 = 0;
          *a4 = (id)objc_msgSend(v143, "initWithDomain:code:userInfo:", v144, 2);
          v41 = v175;
          long long v11 = v176;
          a4 = v172;
          goto LABEL_103;
        }
        id v163 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        goto LABEL_104;
      }
      v21 = a4;
      id v163 = [NSNumber numberWithInt:BMSafariBrowsingAssistantSearchBarPositionFromString(v20)];
    }
  }
  else
  {
    v21 = a4;
    id v163 = 0;
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:@"prefixStoreVersion"];
  v156 = (void *)v22;
  id v157 = v9;
  if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v21)
      {
        id v161 = 0;
        v37 = 0;
        v41 = v175;
        a4 = v172;
        id v7 = v160;
        goto LABEL_103;
      }
      v107 = v21;
      id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v109 = *MEMORY[0x1E4F502C8];
      uint64_t v192 = *MEMORY[0x1E4F28568];
      id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"prefixStoreVersion"];
      id v193 = v24;
      v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
      v110 = v108;
      id v7 = v160;
      uint64_t v111 = v109;
      long long v12 = v178;
      v37 = 0;
      id v161 = 0;
      id *v107 = (id)[v110 initWithDomain:v111 code:2 userInfo:v55];
      goto LABEL_100;
    }
    id v161 = v23;
  }
  else
  {
    id v161 = 0;
  }
  id v24 = [v5 objectForKeyedSubscript:@"trialExperiment"];
  v25 = [MEMORY[0x1E4F1CA98] null];
  int v26 = [v24 isEqual:v25];

  v27 = v21;
  if (!v26)
  {
    id v7 = v160;
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v155 = v27;
      v164 = v6;
      goto LABEL_56;
    }
    if (!v27)
    {
      v37 = 0;
      v41 = v175;
      a4 = v172;
      goto LABEL_102;
    }
    id v123 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v124 = *MEMORY[0x1E4F502C8];
    uint64_t v190 = *MEMORY[0x1E4F28568];
    v55 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"trialExperiment"];
    v191 = v55;
    v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
    uint64_t v126 = v124;
    id v7 = v160;
    id *v27 = (id)[v123 initWithDomain:v126 code:2 userInfo:v125];

    long long v12 = v178;
    v37 = 0;
LABEL_100:
    a4 = v172;
    goto LABEL_101;
  }
  v155 = v21;
  v164 = v6;

  id v24 = 0;
LABEL_56:
  v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v24 = v24;
  uint64_t v56 = [v24 countByEnumeratingWithState:&v181 objects:v189 count:16];
  if (!v56) {
    goto LABEL_66;
  }
  uint64_t v57 = v56;
  uint64_t v58 = *(void *)v182;
  while (2)
  {
    for (uint64_t i = 0; i != v57; ++i)
    {
      if (*(void *)v182 != v58) {
        objc_enumerationMutation(v24);
      }
      v60 = *(void **)(*((void *)&v181 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v112 = v164;
        id v7 = v160;
        long long v11 = v176;
        v113 = v155;
        if (v155)
        {
          v114 = v160;
          id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v116 = *MEMORY[0x1E4F502C8];
          uint64_t v187 = *MEMORY[0x1E4F28568];
          id v61 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"trialExperiment"];
          id v188 = v61;
          v117 = (void *)MEMORY[0x1E4F1C9E8];
          v118 = &v188;
          v119 = &v187;
LABEL_94:
          v120 = [v117 dictionaryWithObjects:v118 forKeys:v119 count:1];
          v121 = v115;
          id v7 = v114;
          long long v11 = v176;
          id *v113 = (id)[v121 initWithDomain:v116 code:2 userInfo:v120];
LABEL_98:

          long long v12 = v178;
        }
LABEL_99:

        v37 = 0;
        uint64_t v6 = v112;
        goto LABEL_100;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v112 = v164;
        id v7 = v160;
        long long v11 = v176;
        v113 = v155;
        if (v155)
        {
          v114 = v160;
          id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v116 = *MEMORY[0x1E4F502C8];
          uint64_t v185 = *MEMORY[0x1E4F28568];
          id v61 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"trialExperiment"];
          id v186 = v61;
          v117 = (void *)MEMORY[0x1E4F1C9E8];
          v118 = &v186;
          v119 = &v185;
          goto LABEL_94;
        }
        goto LABEL_99;
      }
      id v61 = v60;
      v62 = [BMSafariBrowsingAssistantTrialExperiment alloc];
      id v180 = 0;
      v63 = [(BMSafariBrowsingAssistantTrialExperiment *)v62 initWithJSONDictionary:v61 error:&v180];
      id v64 = v180;
      if (v64)
      {
        v120 = v64;
        if (v155) {
          id *v155 = v64;
        }

        v112 = v164;
        id v7 = v160;
        long long v11 = v176;
        goto LABEL_98;
      }
      [v55 addObject:v63];

      long long v12 = v178;
    }
    uint64_t v57 = [v24 countByEnumeratingWithState:&v181 objects:v189 count:16];
    if (v57) {
      continue;
    }
    break;
  }
LABEL_66:

  int v65 = [v170 intValue];
  id v7 = v160;
  LODWORD(v154) = [v163 intValue];
  LODWORD(v145) = v65;
  a4 = v172;
  v37 = [(BMSafariBrowsingAssistantDimensionContext *)self initWithWebpageViewIdentifier:v160 systemLocale:v157 currentCountry:v177 build:v172 osType:v174 productType:v173 buildType:v145 duEnabled:v168 searchBarPosition:v154 prefixStoreVersion:v161 trialExperiment:v55];
  self = v37;
  uint64_t v6 = v164;
  long long v11 = v176;
LABEL_101:

  v41 = v175;
LABEL_102:

  id v9 = v157;
  v8 = v158;
LABEL_103:

LABEL_104:
LABEL_105:

LABEL_106:
LABEL_107:

LABEL_108:
LABEL_109:

LABEL_110:
LABEL_111:

LABEL_112:
  return v37;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantDimensionContext *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_webpageViewIdentifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_systemLocale) {
    PBDataWriterWriteStringField();
  }
  if (self->_currentCountry) {
    PBDataWriterWriteStringField();
  }
  if (self->_build) {
    PBDataWriterWriteStringField();
  }
  if (self->_osType) {
    PBDataWriterWriteStringField();
  }
  if (self->_productType) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasDuEnabled) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_prefixStoreVersion) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_trialExperiment;
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
  v52.receiver = self;
  v52.super_class = (Class)BMSafariBrowsingAssistantDimensionContext;
  id v5 = [(BMEventBase *)&v52 init];
  if (!v5) {
    goto LABEL_74;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = &OBJC_IVAR___BMAppInFocus__hasDuration;
    long long v11 = &OBJC_IVAR___BMAppInFocus__hasDuration;
    long long v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        unint64_t v17 = *(void *)&v4[v16];
        if (v17 == -1 || v17 >= *(void *)&v4[*v8]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v19 = v14++ >= 9;
        if (v19)
        {
          unint64_t v15 = 0;
          int v20 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v20 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v20 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v22 = PBReaderReadData();
          uint64_t v23 = v10[460];
          goto LABEL_50;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = v11[461];
          goto LABEL_50;
        case 3u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 48;
          goto LABEL_50;
        case 4u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 56;
          goto LABEL_50;
        case 5u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 64;
          goto LABEL_50;
        case 6u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 72;
          goto LABEL_50;
        case 7u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          while (2)
          {
            uint64_t v27 = *v7;
            unint64_t v28 = *(void *)&v4[v27];
            if (v28 == -1 || v28 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v12] + v28);
              *(void *)&v4[v27] = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v19 = v25++ >= 9;
                if (v19)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v26) = 0;
          }
LABEL_57:
          if (v26 >= 5) {
            LODWORD(v26) = 0;
          }
          uint64_t v46 = 24;
          goto LABEL_70;
        case 8u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasDuEnabled = 1;
          while (2)
          {
            uint64_t v33 = *v7;
            unint64_t v34 = *(void *)&v4[v33];
            if (v34 == -1 || v34 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v12] + v34);
              *(void *)&v4[v33] = v34 + 1;
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v19 = v31++ >= 9;
                if (v19)
                {
                  uint64_t v32 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v32 = 0;
          }
LABEL_63:
          v5->_duEnabled = v32 != 0;
          continue;
        case 9u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v26 = 0;
          break;
        case 0xAu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 80;
LABEL_50:
          v41 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 0xBu:
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_76;
          }
          int v42 = v11;
          id v43 = v10;
          id v44 = [[BMSafariBrowsingAssistantTrialExperiment alloc] initByReadFrom:v4];
          if (!v44) {
            goto LABEL_76;
          }
          int v45 = v44;
          [v6 addObject:v44];
          PBReaderRecallMark();

          v10 = v43;
          long long v11 = v42;
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_76:

          goto LABEL_73;
      }
      while (1)
      {
        uint64_t v38 = *v7;
        unint64_t v39 = *(void *)&v4[v38];
        if (v39 == -1 || v39 >= *(void *)&v4[*v8]) {
          break;
        }
        char v40 = *(unsigned char *)(*(void *)&v4[*v12] + v39);
        *(void *)&v4[v38] = v39 + 1;
        v26 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0) {
          goto LABEL_65;
        }
        v36 += 7;
        BOOL v19 = v37++ >= 9;
        if (v19)
        {
          LODWORD(v26) = 0;
          goto LABEL_67;
        }
      }
      v4[*v9] = 1;
LABEL_65:
      if (v4[*v9]) {
        LODWORD(v26) = 0;
      }
LABEL_67:
      if (v26 >= 3) {
        LODWORD(v26) = 0;
      }
      uint64_t v46 = 28;
LABEL_70:
      *(_DWORD *)((char *)&v5->super.super.isa + v46) = v26;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v47 = [v6 copy];
  trialExperiment = v5->_trialExperiment;
  v5->_trialExperiment = (NSArray *)v47;

  int v49 = v4[*v9];
  if (v49) {
LABEL_73:
  }
    id v50 = 0;
  else {
LABEL_74:
  }
    id v50 = v5;

  return v50;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v16 = [(BMSafariBrowsingAssistantDimensionContext *)self webpageViewIdentifier];
  v3 = [(BMSafariBrowsingAssistantDimensionContext *)self systemLocale];
  id v4 = [(BMSafariBrowsingAssistantDimensionContext *)self currentCountry];
  id v5 = [(BMSafariBrowsingAssistantDimensionContext *)self build];
  uint64_t v6 = [(BMSafariBrowsingAssistantDimensionContext *)self osType];
  uint64_t v7 = [(BMSafariBrowsingAssistantDimensionContext *)self productType];
  uint64_t v8 = BMSafariBrowsingAssistantBuildTypeAsString([(BMSafariBrowsingAssistantDimensionContext *)self buildType]);
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariBrowsingAssistantDimensionContext duEnabled](self, "duEnabled"));
  v10 = BMSafariBrowsingAssistantSearchBarPositionAsString([(BMSafariBrowsingAssistantDimensionContext *)self searchBarPosition]);
  long long v11 = [(BMSafariBrowsingAssistantDimensionContext *)self prefixStoreVersion];
  long long v12 = [(BMSafariBrowsingAssistantDimensionContext *)self trialExperiment];
  id v15 = (id)[v14 initWithFormat:@"BMSafariBrowsingAssistantDimensionContext with webpageViewIdentifier: %@, systemLocale: %@, currentCountry: %@, build: %@, osType: %@, productType: %@, buildType: %@, duEnabled: %@, searchBarPosition: %@, prefixStoreVersion: %@, trialExperiment: %@", v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v15;
}

- (BMSafariBrowsingAssistantDimensionContext)initWithWebpageViewIdentifier:(id)a3 systemLocale:(id)a4 currentCountry:(id)a5 build:(id)a6 osType:(id)a7 productType:(id)a8 buildType:(int)a9 duEnabled:(id)a10 searchBarPosition:(int)a11 prefixStoreVersion:(id)a12 trialExperiment:(id)a13
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id obj = a8;
  id v26 = a8;
  id v20 = a10;
  id v21 = a12;
  id v22 = a13;
  v32.receiver = self;
  v32.super_class = (Class)BMSafariBrowsingAssistantDimensionContext;
  uint64_t v23 = [(BMEventBase *)&v32 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v23->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v23->_systemLocale, a4);
    objc_storeStrong((id *)&v23->_currentCountry, a5);
    objc_storeStrong((id *)&v23->_build, a6);
    objc_storeStrong((id *)&v23->_osType, a7);
    objc_storeStrong((id *)&v23->_productType, obj);
    v23->_buildType = a9;
    if (v20)
    {
      v23->_hasDuEnabled = 1;
      v23->_duEnabled = [v20 BOOLValue];
    }
    else
    {
      v23->_hasDuEnabled = 0;
      v23->_duEnabled = 0;
    }
    v23->_searchBarPosition = a11;
    objc_storeStrong((id *)&v23->_prefixStoreVersion, a12);
    objc_storeStrong((id *)&v23->_trialExperiment, a13);
  }

  return v23;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webpageViewIdentifier" number:1 type:14 subMessageClass:0];
  v15[0] = v14;
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemLocale" number:2 type:13 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"currentCountry" number:3 type:13 subMessageClass:0];
  v15[2] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"build" number:4 type:13 subMessageClass:0];
  v15[3] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"osType" number:5 type:13 subMessageClass:0];
  v15[4] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"productType" number:6 type:13 subMessageClass:0];
  v15[5] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"buildType" number:7 type:4 subMessageClass:0];
  v15[6] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"duEnabled" number:8 type:12 subMessageClass:0];
  v15[7] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"searchBarPosition" number:9 type:4 subMessageClass:0];
  v15[8] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prefixStoreVersion" number:10 type:13 subMessageClass:0];
  v15[9] = v9;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialExperiment" number:11 type:14 subMessageClass:objc_opt_class()];
  v15[10] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5568;
}

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"webpageViewIdentifier" dataType:4 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemLocale" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currentCountry" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"build" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"osType" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"productType" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"buildType" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"duEnabled" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"searchBarPosition" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prefixStoreVersion" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trialExperiment_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_275_46688];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v12;
  v15[6] = v7;
  v15[7] = v14;
  v15[8] = v13;
  v15[9] = v8;
  v15[10] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

id __52__BMSafariBrowsingAssistantDimensionContext_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _trialExperimentJSONArray];
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

    uint64_t v8 = [[BMSafariBrowsingAssistantDimensionContext alloc] initByReadFrom:v7];
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