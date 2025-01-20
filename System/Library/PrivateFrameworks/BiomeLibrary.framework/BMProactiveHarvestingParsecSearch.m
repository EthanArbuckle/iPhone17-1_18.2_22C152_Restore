@interface BMProactiveHarvestingParsecSearch
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingParsecSearch)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingParsecSearch)initWithResultID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 userInput:(id)a6 completedQuery:(id)a7 entities:(id)a8 uniqueID:(id)a9 contentProtection:(id)a10 personaId:(id)a11;
- (BOOL)isEqual:(id)a3;
- (NSArray)entities;
- (NSDate)absoluteTimestamp;
- (NSString)completedQuery;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)domainID;
- (NSString)personaId;
- (NSString)resultID;
- (NSString)uniqueID;
- (NSString)userInput;
- (id)_entitiesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingParsecSearch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_domainID, 0);

  objc_storeStrong((id *)&self->_resultID, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)resultID
{
  return self->_resultID;
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
    v6 = [(BMProactiveHarvestingParsecSearch *)self resultID];
    uint64_t v7 = [v5 resultID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingParsecSearch *)self resultID];
      v10 = [v5 resultID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMProactiveHarvestingParsecSearch *)self domainID];
    uint64_t v14 = [v5 domainID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingParsecSearch *)self domainID];
      v17 = [v5 domainID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    v19 = [(BMProactiveHarvestingParsecSearch *)self absoluteTimestamp];
    uint64_t v20 = [v5 absoluteTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingParsecSearch *)self absoluteTimestamp];
      v23 = [v5 absoluteTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_33;
      }
    }
    v25 = [(BMProactiveHarvestingParsecSearch *)self userInput];
    uint64_t v26 = [v5 userInput];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingParsecSearch *)self userInput];
      v29 = [v5 userInput];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_33;
      }
    }
    v31 = [(BMProactiveHarvestingParsecSearch *)self completedQuery];
    uint64_t v32 = [v5 completedQuery];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingParsecSearch *)self completedQuery];
      v35 = [v5 completedQuery];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_33;
      }
    }
    v37 = [(BMProactiveHarvestingParsecSearch *)self entities];
    uint64_t v38 = [v5 entities];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingParsecSearch *)self entities];
      v41 = [v5 entities];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_33;
      }
    }
    v43 = [(BMProactiveHarvestingParsecSearch *)self uniqueID];
    uint64_t v44 = [v5 uniqueID];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMProactiveHarvestingParsecSearch *)self uniqueID];
      v47 = [v5 uniqueID];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_33;
      }
    }
    v49 = [(BMProactiveHarvestingParsecSearch *)self contentProtection];
    uint64_t v50 = [v5 contentProtection];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMProactiveHarvestingParsecSearch *)self contentProtection];
      v53 = [v5 contentProtection];
      int v54 = [v52 isEqual:v53];

      if (!v54)
      {
LABEL_33:
        char v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v56 = [(BMProactiveHarvestingParsecSearch *)self personaId];
    v57 = [v5 personaId];
    if (v56 == v57)
    {
      char v12 = 1;
    }
    else
    {
      v58 = [(BMProactiveHarvestingParsecSearch *)self personaId];
      v59 = [v5 personaId];
      char v12 = [v58 isEqual:v59];
    }
    goto LABEL_34;
  }
  char v12 = 0;
LABEL_35:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v34[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingParsecSearch *)self resultID];
  uint64_t v4 = [(BMProactiveHarvestingParsecSearch *)self domainID];
  id v5 = [(BMProactiveHarvestingParsecSearch *)self absoluteTimestamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMProactiveHarvestingParsecSearch *)self absoluteTimestamp];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = [(BMProactiveHarvestingParsecSearch *)self userInput];
  v10 = [(BMProactiveHarvestingParsecSearch *)self completedQuery];
  uint64_t v32 = [(BMProactiveHarvestingParsecSearch *)self _entitiesJSONArray];
  int v11 = [(BMProactiveHarvestingParsecSearch *)self uniqueID];
  char v12 = [(BMProactiveHarvestingParsecSearch *)self contentProtection];
  v13 = [(BMProactiveHarvestingParsecSearch *)self personaId];
  v33[0] = @"resultID";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v14;
  v34[0] = v14;
  v33[1] = @"domainID";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v15;
  v34[1] = v15;
  v33[2] = @"absoluteTimestamp";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v3;
  v25 = (void *)v16;
  v34[2] = v16;
  v33[3] = @"userInput";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v4;
  int v24 = (void *)v17;
  v34[3] = v17;
  v33[4] = @"completedQuery";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v8;
  v34[4] = v18;
  v33[5] = @"entities";
  v19 = v32;
  if (!v32)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v19;
  v33[6] = @"uniqueID";
  uint64_t v20 = v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[6] = v20;
  v33[7] = @"contentProtection";
  v21 = v12;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v21;
  v33[8] = @"personaId";
  v22 = v13;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[8] = v22;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  if (v13)
  {
    if (v12) {
      goto LABEL_24;
    }
LABEL_38:

    if (v11) {
      goto LABEL_25;
    }
    goto LABEL_39;
  }

  if (!v12) {
    goto LABEL_38;
  }
LABEL_24:
  if (v11) {
    goto LABEL_25;
  }
LABEL_39:

LABEL_25:
  if (!v32) {

  }
  if (!v10) {
  if (!v9)
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

- (id)_entitiesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingParsecSearch *)self entities];
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

- (BMProactiveHarvestingParsecSearch)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v146[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"resultID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v116 = a4;
    a4 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v116 = a4;
    a4 = v7;
LABEL_4:
    uint64_t v8 = [v6 objectForKeyedSubscript:@"domainID"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v114 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v114 = v8;
LABEL_7:
      uint64_t v9 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
      v115 = (void *)v9;
      if (!v9 || (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v111 = 0;
LABEL_23:
        uint64_t v35 = [v6 objectForKeyedSubscript:@"userInput"];
        v112 = (void *)v35;
        if (v35 && (int v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v116)
            {
              id v113 = 0;
              int v24 = 0;
              v21 = v114;
              v31 = (void *)v111;
              goto LABEL_91;
            }
            v51 = v8;
            id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v53 = *MEMORY[0x1E4F502C8];
            uint64_t v139 = *MEMORY[0x1E4F28568];
            int v54 = a4;
            id v55 = [NSString alloc];
            uint64_t v98 = objc_opt_class();
            v56 = v55;
            a4 = v54;
            id v110 = (id)[v56 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v98, @"userInput"];
            id v140 = v110;
            uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
            v58 = v52;
            uint64_t v8 = v51;
            uint64_t v59 = v53;
            v37 = (void *)v57;
            int v24 = 0;
            id v113 = 0;
            id *v116 = (id)[v58 initWithDomain:v59 code:2 userInfo:v57];
            goto LABEL_101;
          }
          id v113 = v36;
        }
        else
        {
          id v113 = 0;
        }
        v37 = [v6 objectForKeyedSubscript:@"completedQuery"];
        v117 = v37;
        v108 = v7;
        if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v107 = v8;
          id v110 = 0;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v107 = v8;
          id v110 = v37;
LABEL_29:
          id v38 = [v6 objectForKeyedSubscript:@"entities"];
          v39 = [MEMORY[0x1E4F1CA98] null];
          int v40 = [v38 isEqual:v39];

          v109 = self;
          if (v40)
          {
            v104 = a4;
            v106 = v6;

            id v38 = 0;
          }
          else
          {
            if (v38)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v116)
                {
                  int v24 = 0;
                  uint64_t v8 = v107;
                  v21 = v114;
                  v31 = (void *)v111;
                  goto LABEL_89;
                }
                id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v78 = *MEMORY[0x1E4F502C8];
                uint64_t v135 = *MEMORY[0x1E4F28568];
                v118 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"entities"];
                v136 = v118;
                id v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
                int v24 = 0;
                id *v116 = (id)[v77 initWithDomain:v78 code:2 userInfo:v50];
                goto LABEL_66;
              }
            }
            v104 = a4;
            v106 = v6;
          }
          v118 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v38, "count"));
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          id v38 = v38;
          uint64_t v41 = [v38 countByEnumeratingWithState:&v120 objects:v134 count:16];
          if (!v41) {
            goto LABEL_44;
          }
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v121;
LABEL_36:
          uint64_t v44 = 0;
          while (1)
          {
            if (*(void *)v121 != v43) {
              objc_enumerationMutation(v38);
            }
            v45 = *(void **)(*((void *)&v120 + 1) + 8 * v44);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v69 = v116;
              if (v116)
              {
                id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v71 = *MEMORY[0x1E4F502C8];
                uint64_t v130 = *MEMORY[0x1E4F28568];
                id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"entities"];
                id v131 = v46;
                v72 = (void *)MEMORY[0x1E4F1C9E8];
                v73 = &v131;
                v74 = &v130;
                goto LABEL_59;
              }
              goto LABEL_65;
            }
            id v46 = v45;
            v47 = [BMProactiveHarvestingParsecSearchEntity alloc];
            id v119 = 0;
            int v48 = [(BMProactiveHarvestingParsecSearchEntity *)v47 initWithJSONDictionary:v46 error:&v119];
            id v49 = v119;
            if (v49)
            {
              id v75 = v49;
              if (v116) {
                id *v116 = v49;
              }

              int v24 = 0;
              id v50 = v38;
              a4 = v104;
              id v6 = v106;
              uint64_t v8 = v107;
              v37 = v117;
              goto LABEL_85;
            }
            [v118 addObject:v48];

            ++v44;
            v37 = v117;
            if (v42 == v44)
            {
              uint64_t v42 = [v38 countByEnumeratingWithState:&v120 objects:v134 count:16];
              if (v42) {
                goto LABEL_36;
              }
LABEL_44:

              id v6 = v106;
              id v46 = [v106 objectForKeyedSubscript:@"uniqueID"];
              if (!v46)
              {
                id v50 = 0;
                a4 = v104;
                goto LABEL_74;
              }
              objc_opt_class();
              a4 = v104;
              if (objc_opt_isKindOfClass())
              {
                id v50 = 0;
LABEL_74:
                v79 = [v106 objectForKeyedSubscript:@"contentProtection"];
                if (v79 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v75 = v79;
                    goto LABEL_77;
                  }
                  if (v116)
                  {
                    id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v93 = *MEMORY[0x1E4F502C8];
                    uint64_t v126 = *MEMORY[0x1E4F28568];
                    id v81 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
                    id v127 = v81;
                    v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
                    id v94 = (id)[v105 initWithDomain:v93 code:2 userInfo:v80];
                    int v24 = 0;
                    id v75 = 0;
                    id *v116 = v94;
                    goto LABEL_81;
                  }
                  id v75 = 0;
                  int v24 = 0;
                }
                else
                {
                  id v75 = 0;
LABEL_77:
                  v80 = [v106 objectForKeyedSubscript:@"personaId"];
                  if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v81 = 0;
                    goto LABEL_80;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v81 = v80;
LABEL_80:
                    int v24 = [(BMProactiveHarvestingParsecSearch *)v109 initWithResultID:a4 domainID:v114 absoluteTimestamp:v111 userInput:v113 completedQuery:v110 entities:v118 uniqueID:v50 contentProtection:v75 personaId:v81];
                    v109 = v24;
                  }
                  else
                  {
                    if (v116)
                    {
                      id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v101 = *MEMORY[0x1E4F502C8];
                      uint64_t v124 = *MEMORY[0x1E4F28568];
                      v95 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
                      v125 = v95;
                      v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
                      id *v116 = (id)[v103 initWithDomain:v101 code:2 userInfo:v96];
                    }
                    id v81 = 0;
                    int v24 = 0;
                  }
LABEL_81:

LABEL_82:
                  v37 = v117;
                }

LABEL_84:
                uint64_t v8 = v107;
LABEL_85:
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v50 = v46;
                  goto LABEL_74;
                }
                if (v116)
                {
                  id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v91 = *MEMORY[0x1E4F502C8];
                  uint64_t v128 = *MEMORY[0x1E4F28568];
                  id v75 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
                  id v129 = v75;
                  v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
                  id v92 = (id)[v102 initWithDomain:v91 code:2 userInfo:v79];
                  int v24 = 0;
                  id v50 = 0;
                  id *v116 = v92;
                  goto LABEL_82;
                }
                id v50 = 0;
                int v24 = 0;
                uint64_t v8 = v107;
                v37 = v117;
              }

LABEL_87:
              self = v109;
LABEL_88:
              v21 = v114;
              v31 = (void *)v111;

LABEL_89:
              uint64_t v7 = v108;
LABEL_90:

LABEL_91:
              goto LABEL_92;
            }
          }
          v69 = v116;
          if (v116)
          {
            id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v71 = *MEMORY[0x1E4F502C8];
            uint64_t v132 = *MEMORY[0x1E4F28568];
            id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"entities"];
            id v133 = v46;
            v72 = (void *)MEMORY[0x1E4F1C9E8];
            v73 = &v133;
            v74 = &v132;
LABEL_59:
            id v75 = [v72 dictionaryWithObjects:v73 forKeys:v74 count:1];
            uint64_t v76 = v71;
            v37 = v117;
            int v24 = 0;
            id *v69 = (id)[v70 initWithDomain:v76 code:2 userInfo:v75];
            id v50 = v38;
            a4 = v104;
            id v6 = v106;
            goto LABEL_84;
          }
LABEL_65:
          int v24 = 0;
          id v50 = v38;
          a4 = v104;
          id v6 = v106;
LABEL_66:
          uint64_t v8 = v107;
          goto LABEL_87;
        }
        if (v116)
        {
          v60 = v8;
          id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v62 = *MEMORY[0x1E4F502C8];
          uint64_t v137 = *MEMORY[0x1E4F28568];
          v63 = a4;
          id v64 = [NSString alloc];
          uint64_t v99 = objc_opt_class();
          v65 = v64;
          a4 = v63;
          id v38 = (id)[v65 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v99, @"completedQuery"];
          id v138 = v38;
          uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
          v67 = v61;
          uint64_t v8 = v60;
          uint64_t v68 = v62;
          v37 = v117;
          v118 = (void *)v66;
          int v24 = 0;
          id v110 = 0;
          id *v116 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2);
          goto LABEL_88;
        }
        id v110 = 0;
        int v24 = 0;
LABEL_101:
        v21 = v114;
        v31 = (void *)v111;
        goto LABEL_90;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v11 = (objc_class *)MEMORY[0x1E4F1C9C8];
        long long v12 = v8;
        id v13 = v10;
        id v14 = [v11 alloc];
        [v13 doubleValue];
        double v16 = v15;

        uint64_t v8 = v12;
        id v17 = (id)[v14 initWithTimeIntervalSinceReferenceDate:v16];
LABEL_16:
        uint64_t v111 = (uint64_t)v17;
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v34 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v111 = [v34 dateFromString:v10];

        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v10;
        goto LABEL_16;
      }
      if (v116)
      {
        v83 = v8;
        id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v85 = *MEMORY[0x1E4F502C8];
        uint64_t v141 = *MEMORY[0x1E4F28568];
        v86 = a4;
        id v87 = [NSString alloc];
        uint64_t v100 = objc_opt_class();
        v88 = v87;
        a4 = v86;
        id v113 = (id)[v88 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", v100, @"absoluteTimestamp"];
        id v142 = v113;
        uint64_t v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
        v90 = v84;
        uint64_t v8 = v83;
        v112 = (void *)v89;
        v31 = 0;
        int v24 = 0;
        id *v116 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v85, 2);
        v21 = v114;
        goto LABEL_91;
      }
      v31 = 0;
      int v24 = 0;
      v21 = v114;
LABEL_92:

      goto LABEL_93;
    }
    if (v116)
    {
      v25 = v8;
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v143 = *MEMORY[0x1E4F28568];
      id v28 = a4;
      id v29 = [NSString alloc];
      uint64_t v97 = objc_opt_class();
      int v30 = v29;
      a4 = v28;
      v31 = (void *)[v30 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v97, @"domainID"];
      v144 = v31;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
      v33 = v26;
      uint64_t v8 = v25;
      v115 = (void *)v32;
      v21 = 0;
      int v24 = 0;
      id *v116 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v27, 2);
      goto LABEL_92;
    }
    v21 = 0;
    int v24 = 0;
LABEL_93:

    goto LABEL_94;
  }
  if (a4)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F502C8];
    uint64_t v145 = *MEMORY[0x1E4F28568];
    uint64_t v20 = a4;
    v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"resultID"];
    v146[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:&v145 count:1];
    v23 = v18;
    uint64_t v8 = (void *)v22;
    a4 = 0;
    int v24 = 0;
    *uint64_t v20 = (id)[v23 initWithDomain:v19 code:2 userInfo:v22];
    goto LABEL_93;
  }
  int v24 = 0;
LABEL_94:

  return v24;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingParsecSearch *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_resultID) {
    PBDataWriterWriteStringField();
  }
  if (self->_domainID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_userInput) {
    PBDataWriterWriteStringField();
  }
  if (self->_completedQuery) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_entities;
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

  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMProactiveHarvestingParsecSearch;
  uint64_t v5 = [(BMEventBase *)&v38 init];
  if (!v5)
  {
LABEL_42:
    int v36 = v5;
    goto LABEL_43;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_40:
    uint64_t v33 = [v6 copy];
    entities = v5->_entities;
    v5->_entities = (NSArray *)v33;

    int v35 = v4[*v9];
    if (v35) {
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  v10 = &OBJC_IVAR___BMSiriMusicInferenceTrainingIndependentSignals__foregroundBundleRecencyS;
  long long v11 = &OBJC_IVAR___BMSiriMusicInferenceTrainingIndependentSignals__foregroundBundleRecencyS;
  long long v12 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_40;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v7;
      uint64_t v17 = *(void *)&v4[v16];
      unint64_t v18 = v17 + 1;
      if (v17 == -1 || v18 > *(void *)&v4[*v8]) {
        break;
      }
      char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
      *(void *)&v4[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0) {
        goto LABEL_13;
      }
      v13 += 7;
      if (v14++ >= 9)
      {
        unint64_t v15 = 0;
        int v21 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    int v21 = v4[*v9];
    if (v4[*v9]) {
      unint64_t v15 = 0;
    }
LABEL_15:
    if (v21 || (v15 & 7) == 4) {
      goto LABEL_40;
    }
    switch((v15 >> 3))
    {
      case 1u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = v10[139];
        goto LABEL_35;
      case 2u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = v11[140];
        goto LABEL_35;
      case 3u:
        v5->_hasRaw_absoluteTimestamp = 1;
        uint64_t v25 = *v7;
        unint64_t v26 = *(void *)&v4[v25];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v8])
        {
          double v27 = *(double *)(*(void *)&v4[*v12] + v26);
          *(void *)&v4[v25] = v26 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v27 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v27;
        goto LABEL_36;
      case 4u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 56;
        goto LABEL_35;
      case 5u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 64;
        goto LABEL_35;
      case 6u:
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_44;
        }
        id v28 = v11;
        id v29 = v10;
        id v30 = [[BMProactiveHarvestingParsecSearchEntity alloc] initByReadFrom:v4];
        if (!v30) {
          goto LABEL_44;
        }
        v31 = v30;
        [v6 addObject:v30];
        PBReaderRecallMark();

        v10 = v29;
        long long v11 = v28;
        goto LABEL_36;
      case 7u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 80;
        goto LABEL_35;
      case 8u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 88;
        goto LABEL_35;
      case 9u:
        uint64_t v23 = PBReaderReadString();
        uint64_t v24 = 96;
LABEL_35:
        uint64_t v32 = *(Class *)((char *)&v5->super.super.isa + v24);
        *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

        goto LABEL_36;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_36:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_40;
          }
          continue;
        }
LABEL_44:

LABEL_41:
        int v36 = 0;
LABEL_43:

        return v36;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingParsecSearch *)self resultID];
  uint64_t v5 = [(BMProactiveHarvestingParsecSearch *)self domainID];
  uint64_t v6 = [(BMProactiveHarvestingParsecSearch *)self absoluteTimestamp];
  uint64_t v7 = [(BMProactiveHarvestingParsecSearch *)self userInput];
  uint64_t v8 = [(BMProactiveHarvestingParsecSearch *)self completedQuery];
  uint64_t v9 = [(BMProactiveHarvestingParsecSearch *)self entities];
  v10 = [(BMProactiveHarvestingParsecSearch *)self uniqueID];
  long long v11 = [(BMProactiveHarvestingParsecSearch *)self contentProtection];
  long long v12 = [(BMProactiveHarvestingParsecSearch *)self personaId];
  char v13 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingParsecSearch with resultID: %@, domainID: %@, absoluteTimestamp: %@, userInput: %@, completedQuery: %@, entities: %@, uniqueID: %@, contentProtection: %@, personaId: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMProactiveHarvestingParsecSearch)initWithResultID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 userInput:(id)a6 completedQuery:(id)a7 entities:(id)a8 uniqueID:(id)a9 contentProtection:(id)a10 personaId:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v18 = a5;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  char v19 = v18;
  id v24 = a10;
  id v20 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMProactiveHarvestingParsecSearch;
  int v21 = [(BMEventBase *)&v31 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v21->_resultID, a3);
    objc_storeStrong((id *)&v21->_domainID, a4);
    if (v19)
    {
      v21->_hasRaw_absoluteTimestamp = 1;
      [v19 timeIntervalSinceReferenceDate];
    }
    else
    {
      v21->_hasRaw_absoluteTimestamp = 0;
      double v22 = -1.0;
    }
    v21->_raw_absoluteTimestamp = v22;
    objc_storeStrong((id *)&v21->_userInput, a6);
    objc_storeStrong((id *)&v21->_completedQuery, a7);
    objc_storeStrong((id *)&v21->_entities, a8);
    objc_storeStrong((id *)&v21->_uniqueID, a9);
    objc_storeStrong((id *)&v21->_contentProtection, a10);
    objc_storeStrong((id *)&v21->_personaId, a11);
  }

  return v21;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"resultID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"domainID", 2, 13, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:3 type:0 subMessageClass:0];
  v13[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userInput" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"completedQuery" number:5 type:13 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entities" number:6 type:14 subMessageClass:objc_opt_class()];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:7 type:13 subMessageClass:0];
  v13[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:8 type:13 subMessageClass:0];
  v13[7] = v9;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:9 type:13 subMessageClass:0];
  v13[8] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4200;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"resultID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userInput" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"completedQuery" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"entities_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_228_21646];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
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

id __44__BMProactiveHarvestingParsecSearch_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _entitiesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingParsecSearch alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[8] = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end