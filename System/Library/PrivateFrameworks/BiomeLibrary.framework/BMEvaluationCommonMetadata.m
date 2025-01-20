@interface BMEvaluationCommonMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMCustomAttributes)auxiliaryAttributes;
- (BMEvaluationCommonMetadata)initWithFeatureDomain:(id)a3 bundleId:(id)a4 evaluationUuid:(id)a5 isHighPriority:(id)a6 diagnostics:(id)a7 prefilledQuestions:(id)a8 auxiliaryAttributes:(id)a9 systemBuild:(id)a10 modelVersion:(id)a11;
- (BMEvaluationCommonMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsHighPriority;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (NSArray)prefilledQuestions;
- (NSString)bundleId;
- (NSString)description;
- (NSString)diagnostics;
- (NSString)featureDomain;
- (NSString)modelVersion;
- (NSString)systemBuild;
- (NSUUID)evaluationUuid;
- (id)_prefilledQuestionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsHighPriority:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMEvaluationCommonMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_auxiliaryAttributes, 0);
  objc_storeStrong((id *)&self->_prefilledQuestions, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_featureDomain, 0);

  objc_storeStrong((id *)&self->_raw_evaluationUuid, 0);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (BMCustomAttributes)auxiliaryAttributes
{
  return self->_auxiliaryAttributes;
}

- (NSArray)prefilledQuestions
{
  return self->_prefilledQuestions;
}

- (NSString)diagnostics
{
  return self->_diagnostics;
}

- (void)setHasIsHighPriority:(BOOL)a3
{
  self->_hasIsHighPriority = a3;
}

- (BOOL)hasIsHighPriority
{
  return self->_hasIsHighPriority;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)featureDomain
{
  return self->_featureDomain;
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
    v6 = [(BMEvaluationCommonMetadata *)self featureDomain];
    uint64_t v7 = [v5 featureDomain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMEvaluationCommonMetadata *)self featureDomain];
      v10 = [v5 featureDomain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_34;
      }
    }
    v13 = [(BMEvaluationCommonMetadata *)self bundleId];
    uint64_t v14 = [v5 bundleId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMEvaluationCommonMetadata *)self bundleId];
      v17 = [v5 bundleId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_34;
      }
    }
    v19 = [(BMEvaluationCommonMetadata *)self evaluationUuid];
    uint64_t v20 = [v5 evaluationUuid];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMEvaluationCommonMetadata *)self evaluationUuid];
      v23 = [v5 evaluationUuid];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_34;
      }
    }
    if ([(BMEvaluationCommonMetadata *)self hasIsHighPriority]
      || [v5 hasIsHighPriority])
    {
      if (![(BMEvaluationCommonMetadata *)self hasIsHighPriority]) {
        goto LABEL_34;
      }
      if (![v5 hasIsHighPriority]) {
        goto LABEL_34;
      }
      int v25 = [(BMEvaluationCommonMetadata *)self isHighPriority];
      if (v25 != [v5 isHighPriority]) {
        goto LABEL_34;
      }
    }
    v26 = [(BMEvaluationCommonMetadata *)self diagnostics];
    uint64_t v27 = [v5 diagnostics];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMEvaluationCommonMetadata *)self diagnostics];
      v30 = [v5 diagnostics];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_34;
      }
    }
    v32 = [(BMEvaluationCommonMetadata *)self prefilledQuestions];
    uint64_t v33 = [v5 prefilledQuestions];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMEvaluationCommonMetadata *)self prefilledQuestions];
      v36 = [v5 prefilledQuestions];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_34;
      }
    }
    v38 = [(BMEvaluationCommonMetadata *)self auxiliaryAttributes];
    uint64_t v39 = [v5 auxiliaryAttributes];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(BMEvaluationCommonMetadata *)self auxiliaryAttributes];
      v42 = [v5 auxiliaryAttributes];
      int v43 = [v41 isEqual:v42];

      if (!v43) {
        goto LABEL_34;
      }
    }
    v44 = [(BMEvaluationCommonMetadata *)self systemBuild];
    uint64_t v45 = [v5 systemBuild];
    if (v44 == (void *)v45)
    {
    }
    else
    {
      v46 = (void *)v45;
      v47 = [(BMEvaluationCommonMetadata *)self systemBuild];
      v48 = [v5 systemBuild];
      int v49 = [v47 isEqual:v48];

      if (!v49)
      {
LABEL_34:
        char v12 = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    v51 = [(BMEvaluationCommonMetadata *)self modelVersion];
    v52 = [v5 modelVersion];
    if (v51 == v52)
    {
      char v12 = 1;
    }
    else
    {
      v53 = [(BMEvaluationCommonMetadata *)self modelVersion];
      v54 = [v5 modelVersion];
      char v12 = [v53 isEqual:v54];
    }
    goto LABEL_35;
  }
  char v12 = 0;
LABEL_36:

  return v12;
}

- (NSUUID)evaluationUuid
{
  raw_evaluationUuid = self->_raw_evaluationUuid;
  if (raw_evaluationUuid)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_evaluationUuid toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v34[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMEvaluationCommonMetadata *)self featureDomain];
  uint64_t v4 = [(BMEvaluationCommonMetadata *)self bundleId];
  id v5 = [(BMEvaluationCommonMetadata *)self evaluationUuid];
  uint64_t v6 = [v5 UUIDString];

  if ([(BMEvaluationCommonMetadata *)self hasIsHighPriority])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMEvaluationCommonMetadata isHighPriority](self, "isHighPriority"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [(BMEvaluationCommonMetadata *)self diagnostics];
  v32 = [(BMEvaluationCommonMetadata *)self _prefilledQuestionsJSONArray];
  v9 = [(BMEvaluationCommonMetadata *)self auxiliaryAttributes];
  v10 = [v9 jsonDictionary];

  int v11 = [(BMEvaluationCommonMetadata *)self systemBuild];
  char v12 = [(BMEvaluationCommonMetadata *)self modelVersion];
  v33[0] = @"featureDomain";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = @"bundleId";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = @"evaluationUuid";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v3;
  int v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = @"isHighPriority";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v4;
  int v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = @"diagnostics";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v6;
  v34[4] = v17;
  v33[5] = @"prefilledQuestions";
  int v18 = v32;
  if (!v32)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v34[5] = v18;
  v33[6] = @"auxiliaryAttributes";
  uint64_t v20 = v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[6] = v20;
  v33[7] = @"systemBuild";
  v21 = v11;
  if (!v11)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v21;
  v33[8] = @"modelVersion";
  v22 = v12;
  if (!v12)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[8] = v22;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  if (v12)
  {
    if (v11) {
      goto LABEL_24;
    }
LABEL_38:

    if (v10) {
      goto LABEL_25;
    }
    goto LABEL_39;
  }

  if (!v11) {
    goto LABEL_38;
  }
LABEL_24:
  if (v10) {
    goto LABEL_25;
  }
LABEL_39:

LABEL_25:
  if (!v32) {

  }
  if (!v8) {
  if (!v19)
  }

  if (v29)
  {
    if (v30) {
      goto LABEL_33;
    }
LABEL_41:

    if (v31) {
      goto LABEL_34;
    }
    goto LABEL_42;
  }

  if (!v30) {
    goto LABEL_41;
  }
LABEL_33:
  if (v31) {
    goto LABEL_34;
  }
LABEL_42:

LABEL_34:

  return v28;
}

- (id)_prefilledQuestionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMEvaluationCommonMetadata *)self prefilledQuestions];
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

- (BMEvaluationCommonMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v167[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"featureDomain"];
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
    v8 = [v5 objectForKeyedSubscript:@"bundleId"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v132 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v132 = v8;
LABEL_7:
      uint64_t v9 = [v5 objectForKeyedSubscript:@"evaluationUuid"];
      v133 = (void *)v9;
      if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v131 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v39 = 0;
          v35 = v132;
LABEL_107:

          goto LABEL_108;
        }
        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        v47 = v8;
        uint64_t v48 = *MEMORY[0x1E4F502C8];
        uint64_t v160 = *MEMORY[0x1E4F28568];
        id v49 = v7;
        id v50 = [NSString alloc];
        uint64_t v113 = objc_opt_class();
        v51 = v50;
        id v7 = v49;
        uint64_t v52 = [v51 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v113, @"evaluationUuid"];
        uint64_t v161 = v52;
        v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
        uint64_t v54 = v48;
        v8 = v47;
        int v43 = (void *)v52;
        *a4 = (id)[v46 initWithDomain:v54 code:2 userInfo:v53];

        uint64_t v39 = 0;
        v35 = v132;
LABEL_106:

        goto LABEL_107;
      }
      v126 = self;
      id v18 = v10;
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v18];
      if (v19)
      {
        uint64_t v20 = v19;

        v131 = (void *)v20;
        self = v126;
LABEL_10:
        uint64_t v11 = [v5 objectForKeyedSubscript:@"isHighPriority"];
        v130 = (void *)v11;
        if (!v11 || (long long v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v124 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v124 = v12;
LABEL_13:
          uint64_t v13 = [v5 objectForKeyedSubscript:@"diagnostics"];
          v128 = (void *)v13;
          if (v13 && (long long v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
                id v66 = v7;
                uint64_t v67 = *MEMORY[0x1E4F502C8];
                uint64_t v156 = *MEMORY[0x1E4F28568];
                v68 = v8;
                id v69 = [NSString alloc];
                uint64_t v115 = objc_opt_class();
                v70 = v69;
                v8 = v68;
                uint64_t v15 = (BMCustomAttributes *)[v70 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v115, @"diagnostics"];
                v157 = v15;
                uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
                uint64_t v72 = v67;
                id v7 = v66;
                v136 = (void *)v71;
                id v73 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v72, 2);
                uint64_t v39 = 0;
                id v129 = 0;
                *a4 = v73;
                int v43 = v131;
                v35 = v132;

                goto LABEL_102;
              }
              id v129 = 0;
              uint64_t v39 = 0;
              int v43 = v131;
              v35 = v132;
              goto LABEL_103;
            }
            v122 = v8;
            id v129 = v14;
          }
          else
          {
            v122 = v8;
            id v129 = 0;
          }
          uint64_t v15 = [v5 objectForKeyedSubscript:@"prefilledQuestions"];
          uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
          BOOL v17 = [(BMCustomAttributes *)v15 isEqual:v16];

          if (v17)
          {
            v118 = v6;
            v120 = v5;
            v125 = self;

            uint64_t v15 = 0;
          }
          else
          {
            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
                  id v83 = v7;
                  uint64_t v84 = *MEMORY[0x1E4F502C8];
                  uint64_t v154 = *MEMORY[0x1E4F28568];
                  v135 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"prefilledQuestions"];
                  v155 = v135;
                  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
                  uint64_t v85 = v84;
                  id v7 = v83;
                  id v86 = (id)[v82 initWithDomain:v85 code:2 userInfo:v26];
                  uint64_t v39 = 0;
                  *a4 = v86;
                  goto LABEL_68;
                }
                uint64_t v39 = 0;
                v8 = v122;
                int v43 = v131;
                v35 = v132;
                goto LABEL_102;
              }
            }
            v118 = v6;
            v120 = v5;
            v125 = self;
          }
          v135 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[BMCustomAttributes count](v15, "count"));
          long long v139 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          uint64_t v15 = v15;
          uint64_t v21 = [(BMCustomAttributes *)v15 countByEnumeratingWithState:&v139 objects:v153 count:16];
          id v121 = v7;
          if (!v21) {
            goto LABEL_38;
          }
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v140;
LABEL_30:
          uint64_t v24 = 0;
          while (1)
          {
            if (*(void *)v140 != v23) {
              objc_enumerationMutation(v15);
            }
            int v25 = *(void **)(*((void *)&v139 + 1) + 8 * v24);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v74 = a4;
              if (a4)
              {
                id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v76 = *MEMORY[0x1E4F502C8];
                uint64_t v149 = *MEMORY[0x1E4F28568];
                v26 = (BMCustomAttributes *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"prefilledQuestions"];
                v150 = v26;
                v77 = (void *)MEMORY[0x1E4F1C9E8];
                v78 = &v150;
                v79 = &v149;
                goto LABEL_59;
              }
              goto LABEL_67;
            }
            v26 = v25;
            uint64_t v27 = [BMEvaluationCommonMetadataQuestionAnswer alloc];
            id v138 = 0;
            id v28 = [(BMEvaluationCommonMetadataQuestionAnswer *)v27 initWithJSONDictionary:v26 error:&v138];
            v29 = (BMCustomAttributes *)v138;
            if (v29)
            {
              v80 = v29;
              v8 = v122;
              int v43 = v131;
              v35 = v132;
              if (a4) {
                *a4 = v29;
              }

              uint64_t v39 = 0;
              v117 = v15;
              uint64_t v6 = v118;
              id v5 = v120;
              self = v125;
LABEL_99:

              id v7 = v121;
              v26 = v117;
              goto LABEL_100;
            }
            [v135 addObject:v28];

            if (v22 == ++v24)
            {
              uint64_t v22 = [(BMCustomAttributes *)v15 countByEnumeratingWithState:&v139 objects:v153 count:16];
              id v7 = v121;
              if (v22) {
                goto LABEL_30;
              }
LABEL_38:

              id v5 = v120;
              v26 = [v120 objectForKeyedSubscript:@"auxiliaryAttributes"];
              if (!v26)
              {
                v117 = 0;
                self = v125;
                uint64_t v6 = v118;
                goto LABEL_71;
              }
              objc_opt_class();
              self = v125;
              uint64_t v6 = v118;
              if (objc_opt_isKindOfClass())
              {
                v117 = v26;
                v26 = 0;
                goto LABEL_71;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v80 = v26;
                v95 = [BMCustomAttributes alloc];
                id v137 = 0;
                v96 = v26;
                v26 = [(BMCustomAttributes *)v95 initWithJSONDictionary:v80 error:&v137];
                id v97 = v137;
                v8 = v122;
                if (v97)
                {
                  v98 = v97;
                  int v43 = v131;
                  v35 = v132;
                  if (a4) {
                    *a4 = v97;
                  }

                  uint64_t v39 = 0;
                  v117 = v80;
                  goto LABEL_99;
                }
                v117 = v96;

LABEL_71:
                uint64_t v87 = [v120 objectForKeyedSubscript:@"systemBuild"];
                v127 = (void *)v87;
                if (!v87)
                {
                  v80 = 0;
                  v8 = v122;
                  goto LABEL_88;
                }
                v88 = (void *)v87;
                objc_opt_class();
                v8 = v122;
                if (objc_opt_isKindOfClass())
                {
                  v80 = 0;
                  goto LABEL_88;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v80 = v88;
LABEL_88:
                  v99 = [v120 objectForKeyedSubscript:@"modelVersion"];
                  if (!v99)
                  {
                    v101 = v8;
                    v102 = v6;
                    id v103 = 0;
                    v100 = 0;
                    goto LABEL_95;
                  }
                  objc_opt_class();
                  v100 = v99;
                  v101 = v8;
                  if (objc_opt_isKindOfClass())
                  {
                    v102 = v6;
                    id v103 = 0;
                    goto LABEL_95;
                  }
                  objc_opt_class();
                  v102 = v6;
                  if (objc_opt_isKindOfClass())
                  {
                    id v103 = v99;
LABEL_95:
                    self = [(BMEvaluationCommonMetadata *)self initWithFeatureDomain:v121 bundleId:v132 evaluationUuid:v131 isHighPriority:v124 diagnostics:v129 prefilledQuestions:v135 auxiliaryAttributes:v26 systemBuild:v80 modelVersion:v103];
                    uint64_t v39 = self;
                  }
                  else
                  {
                    if (a4)
                    {
                      id v123 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v119 = *MEMORY[0x1E4F502C8];
                      uint64_t v143 = *MEMORY[0x1E4F28568];
                      v110 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"modelVersion"];
                      v144 = v110;
                      v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                      *a4 = (id)[v123 initWithDomain:v119 code:2 userInfo:v111];
                    }
                    id v103 = 0;
                    uint64_t v39 = 0;
                  }
LABEL_96:

                  uint64_t v6 = v102;
                  v8 = v101;
                }
                else
                {
                  if (a4)
                  {
                    v101 = v122;
                    v102 = v6;
                    id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v108 = *MEMORY[0x1E4F502C8];
                    uint64_t v145 = *MEMORY[0x1E4F28568];
                    id v103 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemBuild"];
                    id v146 = v103;
                    v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
                    id v109 = (id)[v107 initWithDomain:v108 code:2 userInfo:v100];
                    uint64_t v39 = 0;
                    v80 = 0;
                    *a4 = v109;
                    goto LABEL_96;
                  }
                  uint64_t v39 = 0;
                  v80 = 0;
                }

LABEL_98:
                int v43 = v131;
                v35 = v132;
                goto LABEL_99;
              }
              if (a4)
              {
                id v116 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v105 = *MEMORY[0x1E4F502C8];
                uint64_t v147 = *MEMORY[0x1E4F28568];
                v117 = v26;
                v26 = (BMCustomAttributes *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"auxiliaryAttributes"];
                v148 = v26;
                v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
                uint64_t v106 = v105;
                uint64_t v6 = v118;
                uint64_t v39 = 0;
                *a4 = (id)[v116 initWithDomain:v106 code:2 userInfo:v80];
LABEL_60:
                v8 = v122;
                goto LABEL_98;
              }
              uint64_t v39 = 0;
LABEL_68:
              v8 = v122;
              int v43 = v131;
              v35 = v132;
LABEL_100:

LABEL_102:
LABEL_103:
              v64 = v124;
LABEL_104:

              goto LABEL_105;
            }
          }
          v74 = a4;
          if (a4)
          {
            id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v76 = *MEMORY[0x1E4F502C8];
            uint64_t v151 = *MEMORY[0x1E4F28568];
            v26 = (BMCustomAttributes *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"prefilledQuestions"];
            v152 = v26;
            v77 = (void *)MEMORY[0x1E4F1C9E8];
            v78 = &v152;
            v79 = &v151;
LABEL_59:
            v80 = [v77 dictionaryWithObjects:v78 forKeys:v79 count:1];
            id v81 = (id)[v75 initWithDomain:v76 code:2 userInfo:v80];
            uint64_t v39 = 0;
            id *v74 = v81;
            v117 = v15;
            uint64_t v6 = v118;
            id v5 = v120;
            self = v125;
            goto LABEL_60;
          }
LABEL_67:
          uint64_t v39 = 0;
          v26 = v15;
          uint64_t v6 = v118;
          id v5 = v120;
          self = v125;
          id v7 = v121;
          goto LABEL_68;
        }
        if (a4)
        {
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          v56 = v8;
          uint64_t v57 = *MEMORY[0x1E4F502C8];
          uint64_t v158 = *MEMORY[0x1E4F28568];
          id v58 = v7;
          id v59 = [NSString alloc];
          uint64_t v114 = objc_opt_class();
          v60 = v59;
          id v7 = v58;
          id v129 = (id)[v60 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v114, @"isHighPriority"];
          id v159 = v129;
          uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
          uint64_t v62 = v57;
          v8 = v56;
          v128 = (void *)v61;
          id v63 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v62, 2);
          uint64_t v39 = 0;
          v64 = 0;
          *a4 = v63;
          int v43 = v131;
          v35 = v132;
          goto LABEL_104;
        }
        uint64_t v39 = 0;
        v64 = 0;
        int v43 = v131;
        v35 = v132;
LABEL_105:

        goto LABEL_106;
      }
      if (a4)
      {
        id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
        v90 = v8;
        uint64_t v91 = *MEMORY[0x1E4F502C8];
        uint64_t v162 = *MEMORY[0x1E4F28568];
        v92 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"evaluationUuid"];
        v163 = v92;
        v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
        uint64_t v94 = v91;
        v8 = v90;
        *a4 = (id)[v89 initWithDomain:v94 code:2 userInfo:v93];
      }
      uint64_t v39 = 0;
      int v43 = v18;
      v133 = v18;
      v35 = v132;
LABEL_77:
      self = v126;
      goto LABEL_106;
    }
    if (a4)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      v41 = v8;
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v164 = *MEMORY[0x1E4F28568];
      v126 = self;
      v133 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleId"];
      v165 = v133;
      int v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
      uint64_t v44 = v42;
      v8 = v41;
      id v45 = (id)[v40 initWithDomain:v44 code:2 userInfo:v43];
      uint64_t v39 = 0;
      v35 = 0;
      *a4 = v45;
      goto LABEL_77;
    }
    v35 = 0;
    uint64_t v39 = 0;
LABEL_108:

    goto LABEL_109;
  }
  if (a4)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = *MEMORY[0x1E4F502C8];
    uint64_t v166 = *MEMORY[0x1E4F28568];
    v32 = self;
    id v33 = [NSString alloc];
    uint64_t v112 = objc_opt_class();
    v34 = v33;
    self = v32;
    v35 = (void *)[v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v112, @"featureDomain"];
    v167[0] = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v167 forKeys:&v166 count:1];
    uint64_t v37 = v31;
    v8 = (void *)v36;
    id v38 = (id)[v30 initWithDomain:v37 code:2 userInfo:v36];
    uint64_t v39 = 0;
    id v7 = 0;
    *a4 = v38;
    goto LABEL_108;
  }
  uint64_t v39 = 0;
  id v7 = 0;
LABEL_109:

  return v39;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMEvaluationCommonMetadata *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_featureDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_raw_evaluationUuid) {
    PBDataWriterWriteDataField();
  }
  if (self->_hasIsHighPriority) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_diagnostics) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_prefilledQuestions;
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

  if (self->_auxiliaryAttributes)
  {
    PBDataWriterPlaceMark();
    [(BMCustomAttributes *)self->_auxiliaryAttributes writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_systemBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelVersion) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMEvaluationCommonMetadata;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5)
  {
LABEL_52:
    uint64_t v39 = v5;
    goto LABEL_53;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_50:
    uint64_t v36 = [v6 copy];
    prefilledQuestions = v5->_prefilledQuestions;
    v5->_prefilledQuestions = (NSArray *)v36;

    int v38 = v4[*v9];
    if (v38) {
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_50;
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
      goto LABEL_50;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 32;
        goto LABEL_40;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 40;
        goto LABEL_40;
      case 3u:
        PBReaderReadData();
        uint64_t v23 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v23 length] == 16)
        {
          raw_evaluationUuid = v5->_raw_evaluationUuid;
          v5->_raw_evaluationUuid = v23;
LABEL_41:

LABEL_42:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_50;
          }
          continue;
        }

LABEL_55:
LABEL_51:
        uint64_t v39 = 0;
LABEL_53:

        return v39;
      case 4u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        v5->_hasIsHighPriority = 1;
        while (2)
        {
          uint64_t v28 = *v7;
          uint64_t v29 = *(void *)&v4[v28];
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)&v4[*v10] + v29);
            *(void *)&v4[v28] = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if (v31 < 0)
            {
              v25 += 7;
              BOOL v18 = v26++ >= 9;
              if (v18)
              {
                uint64_t v27 = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v27 = 0;
        }
LABEL_49:
        v5->_isHighPriority = v27 != 0;
        goto LABEL_42;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 48;
        goto LABEL_40;
      case 6u:
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_55;
        }
        id v32 = [[BMEvaluationCommonMetadataQuestionAnswer alloc] initByReadFrom:v4];
        if (!v32) {
          goto LABEL_55;
        }
        id v33 = v32;
        [v6 addObject:v32];
        PBReaderRecallMark();

        goto LABEL_42;
      case 7u:
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_55;
        }
        v34 = [[BMCustomAttributes alloc] initByReadFrom:v4];
        if (!v34) {
          goto LABEL_55;
        }
        auxiliaryAttributes = v5->_auxiliaryAttributes;
        v5->_auxiliaryAttributes = v34;

        PBReaderRecallMark();
        goto LABEL_42;
      case 8u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 72;
        goto LABEL_40;
      case 9u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 80;
LABEL_40:
        raw_evaluationUuid = *(NSData **)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
        goto LABEL_41;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_42;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMEvaluationCommonMetadata *)self featureDomain];
  id v5 = [(BMEvaluationCommonMetadata *)self bundleId];
  uint64_t v6 = [(BMEvaluationCommonMetadata *)self evaluationUuid];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMEvaluationCommonMetadata isHighPriority](self, "isHighPriority"));
  uint64_t v8 = [(BMEvaluationCommonMetadata *)self diagnostics];
  uint64_t v9 = [(BMEvaluationCommonMetadata *)self prefilledQuestions];
  v10 = [(BMEvaluationCommonMetadata *)self auxiliaryAttributes];
  char v11 = [(BMEvaluationCommonMetadata *)self systemBuild];
  unsigned int v12 = [(BMEvaluationCommonMetadata *)self modelVersion];
  unint64_t v13 = (void *)[v3 initWithFormat:@"BMEvaluationCommonMetadata with featureDomain: %@, bundleId: %@, evaluationUuid: %@, isHighPriority: %@, diagnostics: %@, prefilledQuestions: %@, auxiliaryAttributes: %@, systemBuild: %@, modelVersion: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMEvaluationCommonMetadata)initWithFeatureDomain:(id)a3 bundleId:(id)a4 evaluationUuid:(id)a5 isHighPriority:(id)a6 diagnostics:(id)a7 prefilledQuestions:(id)a8 auxiliaryAttributes:(id)a9 systemBuild:(id)a10 modelVersion:(id)a11
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v29 = a4;
  id v18 = a5;
  id v19 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMEvaluationCommonMetadata;
  uint64_t v20 = [(BMEventBase *)&v31 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_featureDomain, a3);
    objc_storeStrong((id *)&v20->_bundleId, a4);
    if (v18)
    {
      v32[0] = 0;
      v32[1] = 0;
      [v18 getUUIDBytes:v32];
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v32 length:16];
      raw_evaluationUuid = v20->_raw_evaluationUuid;
      v20->_raw_evaluationUuid = (NSData *)v21;
    }
    else
    {
      raw_evaluationUuid = v20->_raw_evaluationUuid;
      v20->_raw_evaluationUuid = 0;
    }

    if (v19)
    {
      v20->_hasIsHighPriority = 1;
      v20->_isHighPriority = [v19 BOOLValue];
    }
    else
    {
      v20->_hasIsHighPriority = 0;
      v20->_isHighPriority = 0;
    }
    objc_storeStrong((id *)&v20->_diagnostics, a7);
    objc_storeStrong((id *)&v20->_prefilledQuestions, a8);
    objc_storeStrong((id *)&v20->_auxiliaryAttributes, a9);
    objc_storeStrong((id *)&v20->_systemBuild, a10);
    objc_storeStrong((id *)&v20->_modelVersion, a11);
  }

  return v20;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureDomain" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"bundleId", 2, 13, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"evaluationUuid" number:3 type:14 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isHighPriority" number:4 type:12 subMessageClass:0];
  v13[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"diagnostics" number:5 type:13 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prefilledQuestions" number:6 type:14 subMessageClass:objc_opt_class()];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"auxiliaryAttributes" number:7 type:14 subMessageClass:objc_opt_class()];
  v13[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemBuild" number:8 type:13 subMessageClass:0];
  v13[7] = v9;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelVersion" number:9 type:13 subMessageClass:0];
  v13[8] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF44E8;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureDomain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"evaluationUuid" dataType:6 requestOnly:0 fieldNumber:3 protoDataType:14 convertedType:3];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isHighPriority" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"diagnostics" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"prefilledQuestions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_372];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"auxiliaryAttributes_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_374];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemBuild" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelVersion" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

id __37__BMEvaluationCommonMetadata_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 auxiliaryAttributes];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __37__BMEvaluationCommonMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _prefilledQuestionsJSONArray];
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

    uint64_t v8 = [[BMEvaluationCommonMetadata alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end