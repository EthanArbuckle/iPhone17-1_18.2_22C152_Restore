@interface BMMLSEShareSheetFeedback
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9;
- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9 trialIdentifier:(id)a10;
- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9 trialIdentifier:(id)a10 timeouts:(id)a11;
- (BMMLSEShareSheetFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSEShareSheetFeedbackTrialIdentifier)trialIdentifier;
- (BOOL)airdropPeopleSuggestionShown;
- (BOOL)hasAirdropPeopleSuggestionShown;
- (BOOL)hasVisibleAppSuggestionCount;
- (BOOL)hasVisiblePeopleSuggestionCount;
- (BOOL)isEqual:(id)a3;
- (NSArray)timeouts;
- (NSString)description;
- (NSString)engagementIdentifier;
- (NSString)identifier;
- (id)_timeoutsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)engagementType;
- (int)inferenceSource;
- (unsigned)dataVersion;
- (unsigned)visibleAppSuggestionCount;
- (unsigned)visiblePeopleSuggestionCount;
- (void)setHasAirdropPeopleSuggestionShown:(BOOL)a3;
- (void)setHasVisibleAppSuggestionCount:(BOOL)a3;
- (void)setHasVisiblePeopleSuggestionCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEShareSheetFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeouts, 0);
  objc_storeStrong((id *)&self->_trialIdentifier, 0);
  objc_storeStrong((id *)&self->_engagementIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)timeouts
{
  return self->_timeouts;
}

- (BMMLSEShareSheetFeedbackTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (int)inferenceSource
{
  return self->_inferenceSource;
}

- (void)setHasAirdropPeopleSuggestionShown:(BOOL)a3
{
  self->_hasAirdropPeopleSuggestionShown = a3;
}

- (BOOL)hasAirdropPeopleSuggestionShown
{
  return self->_hasAirdropPeopleSuggestionShown;
}

- (BOOL)airdropPeopleSuggestionShown
{
  return self->_airdropPeopleSuggestionShown;
}

- (void)setHasVisibleAppSuggestionCount:(BOOL)a3
{
  self->_hasVisibleAppSuggestionCount = a3;
}

- (BOOL)hasVisibleAppSuggestionCount
{
  return self->_hasVisibleAppSuggestionCount;
}

- (unsigned)visibleAppSuggestionCount
{
  return self->_visibleAppSuggestionCount;
}

- (void)setHasVisiblePeopleSuggestionCount:(BOOL)a3
{
  self->_hasVisiblePeopleSuggestionCount = a3;
}

- (BOOL)hasVisiblePeopleSuggestionCount
{
  return self->_hasVisiblePeopleSuggestionCount;
}

- (unsigned)visiblePeopleSuggestionCount
{
  return self->_visiblePeopleSuggestionCount;
}

- (NSString)engagementIdentifier
{
  return self->_engagementIdentifier;
}

- (int)engagementType
{
  return self->_engagementType;
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
    v6 = [(BMMLSEShareSheetFeedback *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEShareSheetFeedback *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_30;
      }
    }
    int v13 = [(BMMLSEShareSheetFeedback *)self engagementType];
    if (v13 == [v5 engagementType])
    {
      v14 = [(BMMLSEShareSheetFeedback *)self engagementIdentifier];
      uint64_t v15 = [v5 engagementIdentifier];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMMLSEShareSheetFeedback *)self engagementIdentifier];
        v18 = [v5 engagementIdentifier];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_30;
        }
      }
      if ([(BMMLSEShareSheetFeedback *)self hasVisiblePeopleSuggestionCount]
        || [v5 hasVisiblePeopleSuggestionCount])
      {
        if (![(BMMLSEShareSheetFeedback *)self hasVisiblePeopleSuggestionCount]) {
          goto LABEL_30;
        }
        if (![v5 hasVisiblePeopleSuggestionCount]) {
          goto LABEL_30;
        }
        unsigned int v20 = [(BMMLSEShareSheetFeedback *)self visiblePeopleSuggestionCount];
        if (v20 != [v5 visiblePeopleSuggestionCount]) {
          goto LABEL_30;
        }
      }
      if ([(BMMLSEShareSheetFeedback *)self hasVisibleAppSuggestionCount]
        || [v5 hasVisibleAppSuggestionCount])
      {
        if (![(BMMLSEShareSheetFeedback *)self hasVisibleAppSuggestionCount]) {
          goto LABEL_30;
        }
        if (![v5 hasVisibleAppSuggestionCount]) {
          goto LABEL_30;
        }
        unsigned int v21 = [(BMMLSEShareSheetFeedback *)self visibleAppSuggestionCount];
        if (v21 != [v5 visibleAppSuggestionCount]) {
          goto LABEL_30;
        }
      }
      if ([(BMMLSEShareSheetFeedback *)self hasAirdropPeopleSuggestionShown]
        || [v5 hasAirdropPeopleSuggestionShown])
      {
        if (![(BMMLSEShareSheetFeedback *)self hasAirdropPeopleSuggestionShown]) {
          goto LABEL_30;
        }
        if (![v5 hasAirdropPeopleSuggestionShown]) {
          goto LABEL_30;
        }
        int v22 = [(BMMLSEShareSheetFeedback *)self airdropPeopleSuggestionShown];
        if (v22 != [v5 airdropPeopleSuggestionShown]) {
          goto LABEL_30;
        }
      }
      int v23 = [(BMMLSEShareSheetFeedback *)self inferenceSource];
      if (v23 != [v5 inferenceSource]) {
        goto LABEL_30;
      }
      v24 = [(BMMLSEShareSheetFeedback *)self trialIdentifier];
      uint64_t v25 = [v5 trialIdentifier];
      if (v24 == (void *)v25)
      {
      }
      else
      {
        v26 = (void *)v25;
        v27 = [(BMMLSEShareSheetFeedback *)self trialIdentifier];
        v28 = [v5 trialIdentifier];
        int v29 = [v27 isEqual:v28];

        if (!v29) {
          goto LABEL_30;
        }
      }
      v31 = [(BMMLSEShareSheetFeedback *)self timeouts];
      v32 = [v5 timeouts];
      if (v31 == v32)
      {
        char v12 = 1;
      }
      else
      {
        v33 = [(BMMLSEShareSheetFeedback *)self timeouts];
        v34 = [v5 timeouts];
        char v12 = [v33 isEqual:v34];
      }
      goto LABEL_31;
    }
LABEL_30:
    char v12 = 0;
LABEL_31:

    goto LABEL_32;
  }
  char v12 = 0;
LABEL_32:

  return v12;
}

- (id)jsonDictionary
{
  v33[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMLSEShareSheetFeedback *)self identifier];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEShareSheetFeedback engagementType](self, "engagementType"));
  uint64_t v5 = [(BMMLSEShareSheetFeedback *)self engagementIdentifier];
  if ([(BMMLSEShareSheetFeedback *)self hasVisiblePeopleSuggestionCount])
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visiblePeopleSuggestionCount](self, "visiblePeopleSuggestionCount"));
  }
  else
  {
    v6 = 0;
  }
  if ([(BMMLSEShareSheetFeedback *)self hasVisibleAppSuggestionCount])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visibleAppSuggestionCount](self, "visibleAppSuggestionCount"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMMLSEShareSheetFeedback *)self hasAirdropPeopleSuggestionShown])
  {
    v31 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEShareSheetFeedback airdropPeopleSuggestionShown](self, "airdropPeopleSuggestionShown"));
  }
  else
  {
    v31 = 0;
  }
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEShareSheetFeedback inferenceSource](self, "inferenceSource"));
  v9 = [(BMMLSEShareSheetFeedback *)self trialIdentifier];
  v10 = [v9 jsonDictionary];

  int v11 = [(BMMLSEShareSheetFeedback *)self _timeoutsJSONArray];
  v32[0] = @"identifier";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v12;
  v33[0] = v12;
  v32[1] = @"engagementType";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v25 = (void *)v13;
  v33[1] = v13;
  v32[2] = @"engagementIdentifier";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v3;
  v24 = (void *)v14;
  v33[2] = v14;
  v32[3] = @"visiblePeopleSuggestionCount";
  uint64_t v15 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v29 = (void *)v4;
  int v23 = (void *)v15;
  v33[3] = v15;
  v32[4] = @"visibleAppSuggestionCount";
  v16 = (void *)v7;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v5;
  v33[4] = v16;
  v32[5] = @"airdropPeopleSuggestionShown";
  v17 = v31;
  if (!v31)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[5] = v17;
  v32[6] = @"inferenceSource";
  v18 = v8;
  if (!v8)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v19 = (void *)v7;
  v33[6] = v18;
  v32[7] = @"trialIdentifier";
  unsigned int v20 = v10;
  if (!v10)
  {
    unsigned int v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[7] = v20;
  v32[8] = @"timeouts";
  unsigned int v21 = v11;
  if (!v11)
  {
    unsigned int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[8] = v21;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:9];
  if (v11)
  {
    if (v10) {
      goto LABEL_30;
    }
LABEL_44:

    if (v8) {
      goto LABEL_31;
    }
    goto LABEL_45;
  }

  if (!v10) {
    goto LABEL_44;
  }
LABEL_30:
  if (v8) {
    goto LABEL_31;
  }
LABEL_45:

LABEL_31:
  if (!v31) {

  }
  if (!v19) {
  if (!v6)
  }

  if (v28)
  {
    if (v29) {
      goto LABEL_39;
    }
LABEL_47:

    if (v30) {
      goto LABEL_40;
    }
    goto LABEL_48;
  }

  if (!v29) {
    goto LABEL_47;
  }
LABEL_39:
  if (v30) {
    goto LABEL_40;
  }
LABEL_48:

LABEL_40:

  return v27;
}

- (id)_timeoutsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMMLSEShareSheetFeedback *)self timeouts];
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

- (BMMLSEShareSheetFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v178[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  unint64_t v7 = 0x1E4F1C000uLL;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v5 objectForKeyedSubscript:@"engagementType"];
    v146 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v147 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v28 = 0;
            goto LABEL_101;
          }
          v69 = a4;
          id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
          v71 = v9;
          uint64_t v72 = *MEMORY[0x1E4F502C8];
          uint64_t v175 = *MEMORY[0x1E4F28568];
          id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"engagementType"];
          id v176 = v12;
          uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
          uint64_t v74 = v72;
          v9 = v71;
          v148 = (void *)v73;
          id v75 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v74, 2);
          v28 = 0;
          a4 = 0;
          id *v69 = v75;
          goto LABEL_100;
        }
        id v147 = [NSNumber numberWithInt:BMMLSEShareSheetFeedbackEngagementTypeFromString(v9)];
        unint64_t v7 = 0x1E4F1C000;
      }
    }
    else
    {
      id v147 = 0;
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"engagementIdentifier"];
    v148 = (void *)v10;
    if (v10 && (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v146)
        {
          id v12 = 0;
          a4 = 0;
          v28 = v147;
          goto LABEL_100;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        v33 = v9;
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v173 = *MEMORY[0x1E4F28568];
        id v35 = v8;
        id v36 = [NSString alloc];
        uint64_t v126 = objc_opt_class();
        v37 = v36;
        id v8 = v35;
        v38 = (void *)[v37 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v126, @"engagementIdentifier"];
        v174 = v38;
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
        uint64_t v40 = v34;
        v9 = v33;
        v145 = (void *)v39;
        id v41 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v40, 2);
        id v12 = 0;
        a4 = 0;
        id *v146 = v41;
        goto LABEL_107;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:@"visiblePeopleSuggestionCount"];
    v145 = (void *)v13;
    if (!v13 || (long long v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v142 = 0;
LABEL_13:
      uint64_t v15 = [v5 objectForKeyedSubscript:@"visibleAppSuggestionCount"];
      v143 = (void *)v15;
      if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v146)
          {
            id v144 = 0;
            a4 = 0;
            v28 = v147;
            v38 = v142;
            goto LABEL_98;
          }
          id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
          v52 = v9;
          uint64_t v53 = *MEMORY[0x1E4F502C8];
          uint64_t v169 = *MEMORY[0x1E4F28568];
          id v54 = v8;
          id v55 = [NSString alloc];
          uint64_t v128 = objc_opt_class();
          v56 = v55;
          id v8 = v54;
          id v141 = (id)[v56 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v128, @"visibleAppSuggestionCount"];
          id v170 = v141;
          uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
          uint64_t v58 = v53;
          v9 = v52;
          v140 = (void *)v57;
          id v59 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v58, 2);
          id v144 = 0;
          a4 = 0;
          id *v146 = v59;
          goto LABEL_112;
        }
        id v144 = v16;
      }
      else
      {
        id v144 = 0;
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:@"airdropPeopleSuggestionShown"];
      v140 = (void *)v17;
      if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v141 = 0;
LABEL_19:
        uint64_t v19 = [v5 objectForKeyedSubscript:@"inferenceSource"];
        v138 = (void *)v19;
        if (v19 && (unsigned int v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = v12;
            id v139 = v20;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v146)
              {
                id v139 = 0;
                a4 = 0;
                v28 = v147;
                goto LABEL_96;
              }
              id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
              v120 = v9;
              uint64_t v121 = *MEMORY[0x1E4F502C8];
              uint64_t v165 = *MEMORY[0x1E4F28568];
              id v92 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"inferenceSource"];
              id v166 = v92;
              v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
              uint64_t v122 = v121;
              v9 = v120;
              id v123 = (id)[v119 initWithDomain:v122 code:2 userInfo:v91];
              id v139 = 0;
              a4 = 0;
              id *v146 = v123;
              goto LABEL_93;
            }
            id v139 = [NSNumber numberWithInt:BMMLSEShareSheetFeedbackInferenceSourceFromString(v20)];
            id v21 = v12;
          }
          unint64_t v7 = 0x1E4F1C000uLL;
        }
        else
        {
          id v21 = v12;
          id v139 = 0;
        }
        v76 = [v5 objectForKeyedSubscript:@"trialIdentifier"];
        v137 = v9;
        if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v134 = 0;
          v135 = v76;
LABEL_56:
          id v136 = v5;
          id v77 = [v5 objectForKeyedSubscript:@"timeouts"];
          v78 = [*(id *)(v7 + 2712) null];
          int v79 = [v77 isEqual:v78];

          id v12 = v21;
          if (v79)
          {
            v132 = v6;

            id v77 = 0;
LABEL_61:
            v80 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v77, "count"));
            long long v151 = 0u;
            long long v152 = 0u;
            long long v153 = 0u;
            long long v154 = 0u;
            id v77 = v77;
            uint64_t v81 = [v77 countByEnumeratingWithState:&v151 objects:v160 count:16];
            if (!v81) {
              goto LABEL_71;
            }
            uint64_t v82 = v81;
            uint64_t v83 = *(void *)v152;
            id v133 = v8;
            id v131 = v12;
LABEL_63:
            uint64_t v84 = 0;
            while (1)
            {
              if (*(void *)v152 != v83) {
                objc_enumerationMutation(v77);
              }
              v85 = *(void **)(*((void *)&v151 + 1) + 8 * v84);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                break;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v8 = v133;
                v9 = v137;
                v105 = v146;
                id v12 = v131;
                if (!v146) {
                  goto LABEL_89;
                }
                id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v107 = *MEMORY[0x1E4F502C8];
                uint64_t v156 = *MEMORY[0x1E4F28568];
                id v86 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"timeouts"];
                id v157 = v86;
                v108 = (void *)MEMORY[0x1E4F1C9E8];
                v109 = &v157;
                v110 = &v156;
                goto LABEL_84;
              }
              id v86 = v85;
              v87 = [BMMLSEShareSheetFeedbackTimeout alloc];
              id v150 = 0;
              v88 = [(BMMLSEShareSheetFeedbackTimeout *)v87 initWithJSONDictionary:v86 error:&v150];
              id v89 = v150;
              if (v89)
              {
                v111 = v89;
                if (v146) {
                  id *v146 = v89;
                }

                id v8 = v133;
                v9 = v137;
                id v12 = v131;
LABEL_88:

LABEL_89:
                a4 = 0;
                uint64_t v6 = v132;
                goto LABEL_90;
              }
              [v80 addObject:v88];

              if (v82 == ++v84)
              {
                uint64_t v82 = [v77 countByEnumeratingWithState:&v151 objects:v160 count:16];
                id v8 = v133;
                id v12 = v131;
                if (v82) {
                  goto LABEL_63;
                }
LABEL_71:

                uint64_t v90 = [v147 intValue];
                v91 = v134;
                LODWORD(v124) = [v139 intValue];
                a4 = [(BMMLSEShareSheetFeedback *)self initWithIdentifier:v8 engagementType:v90 engagementIdentifier:v12 visiblePeopleSuggestionCount:v142 visibleAppSuggestionCount:v144 airdropPeopleSuggestionShown:v141 inferenceSource:v124 trialIdentifier:v134 timeouts:v80];
                self = (BMMLSEShareSheetFeedback *)a4;
                uint64_t v6 = v132;
                v9 = v137;
LABEL_91:

                id v92 = v135;
                goto LABEL_92;
              }
            }
            id v8 = v133;
            v9 = v137;
            v105 = v146;
            id v12 = v131;
            if (!v146) {
              goto LABEL_89;
            }
            id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v107 = *MEMORY[0x1E4F502C8];
            uint64_t v158 = *MEMORY[0x1E4F28568];
            id v86 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"timeouts"];
            id v159 = v86;
            v108 = (void *)MEMORY[0x1E4F1C9E8];
            v109 = &v159;
            v110 = &v158;
LABEL_84:
            v111 = [v108 dictionaryWithObjects:v109 forKeys:v110 count:1];
            v112 = v106;
            id v8 = v133;
            id *v105 = (id)[v112 initWithDomain:v107 code:2 userInfo:v111];
            goto LABEL_88;
          }
          if (!v77 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v132 = v6;
            goto LABEL_61;
          }
          if (v146)
          {
            id v114 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v115 = v8;
            uint64_t v116 = *MEMORY[0x1E4F502C8];
            uint64_t v161 = *MEMORY[0x1E4F28568];
            v80 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"timeouts"];
            v162 = v80;
            v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
            uint64_t v118 = v116;
            id v8 = v115;
            id *v146 = (id)[v114 initWithDomain:v118 code:2 userInfo:v117];

            a4 = 0;
LABEL_90:
            v91 = v134;
            goto LABEL_91;
          }
          a4 = 0;
          v91 = v134;
          id v92 = v135;
LABEL_92:

          id v5 = v136;
          goto LABEL_93;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v92 = v76;
          id v155 = 0;
          v91 = [[BMMLSEShareSheetFeedbackTrialIdentifier alloc] initWithJSONDictionary:v92 error:&v155];
          id v93 = v155;
          if (!v93)
          {
            v134 = v91;
            v135 = v76;

            unint64_t v7 = 0x1E4F1C000;
            goto LABEL_56;
          }
          v94 = v93;
          if (v146) {
            id *v146 = v93;
          }

          a4 = 0;
          id v12 = v21;
        }
        else
        {
          v95 = v76;
          a4 = v146;
          if (!v146)
          {
            id v92 = v76;
            id v12 = v21;
            goto LABEL_94;
          }
          id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v97 = v8;
          uint64_t v98 = *MEMORY[0x1E4F502C8];
          uint64_t v163 = *MEMORY[0x1E4F28568];
          id v99 = v5;
          id v100 = [NSString alloc];
          uint64_t v130 = objc_opt_class();
          v101 = v100;
          id v5 = v99;
          id v12 = v21;
          uint64_t v102 = [v101 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v130, @"trialIdentifier"];
          uint64_t v164 = v102;
          v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
          uint64_t v104 = v98;
          id v8 = v97;
          id *v146 = (id)[v96 initWithDomain:v104 code:2 userInfo:v103];

          a4 = 0;
          id v92 = v95;
          v91 = (BMMLSEShareSheetFeedbackTrialIdentifier *)v102;
          v9 = v137;
        }
LABEL_93:

LABEL_94:
        goto LABEL_95;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v141 = v18;
        goto LABEL_19;
      }
      if (v146)
      {
        id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
        v61 = v9;
        uint64_t v62 = *MEMORY[0x1E4F502C8];
        uint64_t v167 = *MEMORY[0x1E4F28568];
        id v63 = v8;
        id v64 = [NSString alloc];
        uint64_t v129 = objc_opt_class();
        v65 = v64;
        id v8 = v63;
        id v139 = (id)[v65 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v129, @"airdropPeopleSuggestionShown"];
        id v168 = v139;
        uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
        uint64_t v67 = v62;
        v9 = v61;
        v138 = (void *)v66;
        id v68 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v67, 2);
        id v141 = 0;
        a4 = 0;
        id *v146 = v68;
LABEL_95:
        v28 = v147;
LABEL_96:
        v38 = v142;

LABEL_97:
        goto LABEL_98;
      }
      id v141 = 0;
      a4 = 0;
LABEL_112:
      v28 = v147;
      v38 = v142;
      goto LABEL_97;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v142 = v14;
      goto LABEL_13;
    }
    if (v146)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      v43 = v9;
      uint64_t v44 = *MEMORY[0x1E4F502C8];
      uint64_t v171 = *MEMORY[0x1E4F28568];
      id v45 = v8;
      id v46 = [NSString alloc];
      uint64_t v127 = objc_opt_class();
      v47 = v46;
      id v8 = v45;
      id v144 = (id)[v47 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v127, @"visiblePeopleSuggestionCount"];
      id v172 = v144;
      uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
      uint64_t v49 = v44;
      v9 = v43;
      v143 = (void *)v48;
      id v50 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v49, 2);
      v38 = 0;
      a4 = 0;
      id *v146 = v50;
      v28 = v147;
LABEL_98:

LABEL_99:
LABEL_100:

      goto LABEL_101;
    }
    v38 = 0;
    a4 = 0;
LABEL_107:
    v28 = v147;
    goto LABEL_99;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    int v22 = a4;
    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v24 = *MEMORY[0x1E4F502C8];
    uint64_t v177 = *MEMORY[0x1E4F28568];
    uint64_t v25 = v6;
    id v26 = [NSString alloc];
    uint64_t v125 = objc_opt_class();
    id v27 = v26;
    uint64_t v6 = v25;
    v28 = (void *)[v27 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v125, @"identifier"];
    v178[0] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v178 forKeys:&v177 count:1];
    uint64_t v30 = v24;
    v9 = (void *)v29;
    id v31 = (id)[v23 initWithDomain:v30 code:2 userInfo:v29];
    a4 = 0;
    *int v22 = v31;
    id v8 = 0;
LABEL_101:

    goto LABEL_102;
  }
  id v8 = 0;
LABEL_102:

  return (BMMLSEShareSheetFeedback *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMLSEShareSheetFeedback *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_engagementIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasVisiblePeopleSuggestionCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasVisibleAppSuggestionCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasAirdropPeopleSuggestionShown) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_trialIdentifier)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMMLSEShareSheetFeedbackTrialIdentifier *)self->_trialIdentifier writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_timeouts;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        uint64_t v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (void)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)BMMLSEShareSheetFeedback;
  id v5 = [(BMEventBase *)&v66 init];
  if (!v5) {
    goto LABEL_95;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v10 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    long long v11 = (int *)MEMORY[0x1E4F940B8];
    long long v12 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
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
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v17);
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
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = v10[372];
          goto LABEL_31;
        case 2u:
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
              char v29 = *(unsigned char *)(*(void *)&v4[*v11] + v28);
              *(void *)&v4[v27] = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v19 = v25++ >= 9;
                if (v19)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v26) = 0;
          }
LABEL_69:
          if (v26 >= 8) {
            LODWORD(v26) = 0;
          }
          uint64_t v59 = v12[373];
          goto LABEL_91;
        case 3u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 48;
LABEL_31:
          uint64_t v30 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasVisiblePeopleSuggestionCount = 1;
          while (2)
          {
            uint64_t v34 = *v7;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v11] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v19 = v32++ >= 9;
                if (v19)
                {
                  LODWORD(v33) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v33) = 0;
          }
LABEL_75:
          uint64_t v60 = 28;
          goto LABEL_80;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v33 = 0;
          v5->_hasVisibleAppSuggestionCount = 1;
          while (2)
          {
            uint64_t v39 = *v7;
            unint64_t v40 = *(void *)&v4[v39];
            if (v40 == -1 || v40 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v11] + v40);
              *(void *)&v4[v39] = v40 + 1;
              v33 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                BOOL v19 = v38++ >= 9;
                if (v19)
                {
                  LODWORD(v33) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v33) = 0;
          }
LABEL_79:
          uint64_t v60 = 32;
LABEL_80:
          *(_DWORD *)((char *)&v5->super.super.isa + v60) = v33;
          continue;
        case 6u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          v5->_hasAirdropPeopleSuggestionShown = 1;
          while (2)
          {
            uint64_t v45 = *v7;
            unint64_t v46 = *(void *)&v4[v45];
            if (v46 == -1 || v46 >= *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v11] + v46);
              *(void *)&v4[v45] = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v19 = v43++ >= 9;
                if (v19)
                {
                  uint64_t v44 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v44 = 0;
          }
LABEL_84:
          v5->_airdropPeopleSuggestionShown = v44 != 0;
          continue;
        case 7u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v26 = 0;
          break;
        case 8u:
          uint64_t v67 = 0;
          uint64_t v68 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_97;
          }
          uint64_t v53 = [[BMMLSEShareSheetFeedbackTrialIdentifier alloc] initByReadFrom:v4];
          if (!v53) {
            goto LABEL_97;
          }
          trialIdentifier = v5->_trialIdentifier;
          v5->_trialIdentifier = v53;

          PBReaderRecallMark();
          continue;
        case 9u:
          uint64_t v67 = 0;
          uint64_t v68 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_97;
          }
          id v55 = v12;
          v56 = v10;
          id v57 = [[BMMLSEShareSheetFeedbackTimeout alloc] initByReadFrom:v4];
          if (!v57) {
            goto LABEL_97;
          }
          uint64_t v58 = v57;
          [v6 addObject:v57];
          PBReaderRecallMark();

          uint64_t v10 = v56;
          long long v12 = v55;
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_97:

          goto LABEL_94;
      }
      while (1)
      {
        uint64_t v50 = *v7;
        unint64_t v51 = *(void *)&v4[v50];
        if (v51 == -1 || v51 >= *(void *)&v4[*v8]) {
          break;
        }
        char v52 = *(unsigned char *)(*(void *)&v4[*v11] + v51);
        *(void *)&v4[v50] = v51 + 1;
        v26 |= (unint64_t)(v52 & 0x7F) << v48;
        if ((v52 & 0x80) == 0) {
          goto LABEL_86;
        }
        v48 += 7;
        BOOL v19 = v49++ >= 9;
        if (v19)
        {
          LODWORD(v26) = 0;
          goto LABEL_88;
        }
      }
      v4[*v9] = 1;
LABEL_86:
      if (v4[*v9]) {
        LODWORD(v26) = 0;
      }
LABEL_88:
      if (v26 >= 3) {
        LODWORD(v26) = 0;
      }
      uint64_t v59 = 36;
LABEL_91:
      *(_DWORD *)((char *)&v5->super.super.isa + v59) = v26;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v61 = [v6 copy];
  timeouts = v5->_timeouts;
  v5->_timeouts = (NSArray *)v61;

  int v63 = v4[*v9];
  if (v63) {
LABEL_94:
  }
    id v64 = 0;
  else {
LABEL_95:
  }
    id v64 = v5;

  return v64;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEShareSheetFeedback *)self identifier];
  id v5 = BMMLSEShareSheetFeedbackEngagementTypeAsString([(BMMLSEShareSheetFeedback *)self engagementType]);
  uint64_t v6 = [(BMMLSEShareSheetFeedback *)self engagementIdentifier];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visiblePeopleSuggestionCount](self, "visiblePeopleSuggestionCount"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetFeedback visibleAppSuggestionCount](self, "visibleAppSuggestionCount"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEShareSheetFeedback airdropPeopleSuggestionShown](self, "airdropPeopleSuggestionShown"));
  uint64_t v10 = BMMLSEShareSheetFeedbackInferenceSourceAsString([(BMMLSEShareSheetFeedback *)self inferenceSource]);
  long long v11 = [(BMMLSEShareSheetFeedback *)self trialIdentifier];
  long long v12 = [(BMMLSEShareSheetFeedback *)self timeouts];
  char v13 = (void *)[v3 initWithFormat:@"BMMLSEShareSheetFeedback with identifier: %@, engagementType: %@, engagementIdentifier: %@, visiblePeopleSuggestionCount: %@, visibleAppSuggestionCount: %@, airdropPeopleSuggestionShown: %@, inferenceSource: %@, trialIdentifier: %@, timeouts: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9 trialIdentifier:(id)a10 timeouts:(id)a11
{
  id v28 = a3;
  id v27 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v26 = a10;
  id v21 = a11;
  v29.receiver = self;
  v29.super_class = (Class)BMMLSEShareSheetFeedback;
  uint64_t v22 = [(BMEventBase *)&v29 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v22->_identifier, a3);
    v22->_engagementType = a4;
    objc_storeStrong((id *)&v22->_engagementIdentifier, a5);
    if (v18)
    {
      v22->_hasVisiblePeopleSuggestionCount = 1;
      unsigned int v23 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v23 = 0;
      v22->_hasVisiblePeopleSuggestionCount = 0;
    }
    v22->_visiblePeopleSuggestionCount = v23;
    if (v19)
    {
      v22->_hasVisibleAppSuggestionCount = 1;
      unsigned int v24 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v24 = 0;
      v22->_hasVisibleAppSuggestionCount = 0;
    }
    v22->_visibleAppSuggestionCount = v24;
    if (v20)
    {
      v22->_hasAirdropPeopleSuggestionShown = 1;
      v22->_airdropPeopleSuggestionShown = [v20 BOOLValue];
    }
    else
    {
      v22->_hasAirdropPeopleSuggestionShown = 0;
      v22->_airdropPeopleSuggestionShown = 0;
    }
    v22->_inferenceSource = a9;
    objc_storeStrong((id *)&v22->_trialIdentifier, a10);
    objc_storeStrong((id *)&v22->_timeouts, a11);
  }

  return v22;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"engagementType", 2, 4, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"engagementIdentifier" number:3 type:13 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visiblePeopleSuggestionCount" number:4 type:4 subMessageClass:0];
  v13[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visibleAppSuggestionCount" number:5 type:4 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"airdropPeopleSuggestionShown" number:6 type:12 subMessageClass:0];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"inferenceSource" number:7 type:4 subMessageClass:0];
  v13[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trialIdentifier" number:8 type:14 subMessageClass:objc_opt_class()];
  v13[7] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeouts" number:9 type:14 subMessageClass:objc_opt_class()];
  v13[8] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3A80;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"engagementType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"engagementIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visiblePeopleSuggestionCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visibleAppSuggestionCount" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"airdropPeopleSuggestionShown" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inferenceSource" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"trialIdentifier_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_235];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"timeouts_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_237];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

id __35__BMMLSEShareSheetFeedback_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _timeoutsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __35__BMMLSEShareSheetFeedback_columns__block_invoke(uint64_t a1, void *a2)
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMLSEShareSheetFeedback alloc] initByReadFrom:v7];
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

- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9
{
  LODWORD(v10) = a9;
  return [(BMMLSEShareSheetFeedback *)self initWithIdentifier:a3 engagementType:*(void *)&a4 engagementIdentifier:a5 visiblePeopleSuggestionCount:a6 visibleAppSuggestionCount:a7 airdropPeopleSuggestionShown:a8 inferenceSource:v10 trialIdentifier:0];
}

- (BMMLSEShareSheetFeedback)initWithIdentifier:(id)a3 engagementType:(int)a4 engagementIdentifier:(id)a5 visiblePeopleSuggestionCount:(id)a6 visibleAppSuggestionCount:(id)a7 airdropPeopleSuggestionShown:(id)a8 inferenceSource:(int)a9 trialIdentifier:(id)a10
{
  LODWORD(v11) = a9;
  return [(BMMLSEShareSheetFeedback *)self initWithIdentifier:a3 engagementType:*(void *)&a4 engagementIdentifier:a5 visiblePeopleSuggestionCount:a6 visibleAppSuggestionCount:a7 airdropPeopleSuggestionShown:a8 inferenceSource:v11 trialIdentifier:a10 timeouts:MEMORY[0x1E4F1CBF0]];
}

@end