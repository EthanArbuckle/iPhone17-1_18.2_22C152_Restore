@interface BMProactiveHarvestingPhotosKnowledgeGraphEnrichment
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichment)initWithAbsoluteTimestamp:(id)a3 topics:(id)a4 entities:(id)a5 locations:(id)a6 uniqueID:(id)a7 contentProtection:(id)a8 personaId:(id)a9;
- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichment)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)entities;
- (NSArray)locations;
- (NSArray)topics;
- (NSDate)absoluteTimestamp;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)personaId;
- (NSString)uniqueID;
- (id)_entitiesJSONArray;
- (id)_locationsJSONArray;
- (id)_topicsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingPhotosKnowledgeGraphEnrichment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);

  objc_storeStrong((id *)&self->_topics, 0);
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

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)entities
{
  return self->_entities;
}

- (NSArray)topics
{
  return self->_topics;
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
    v6 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
    }
    v13 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self topics];
    uint64_t v14 = [v5 topics];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self topics];
      v17 = [v5 topics];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_25;
      }
    }
    v19 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self entities];
    uint64_t v20 = [v5 entities];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self entities];
      v23 = [v5 entities];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_25;
      }
    }
    v25 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self locations];
    uint64_t v26 = [v5 locations];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self locations];
      v29 = [v5 locations];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_25;
      }
    }
    v31 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self uniqueID];
    uint64_t v32 = [v5 uniqueID];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self uniqueID];
      v35 = [v5 uniqueID];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_25;
      }
    }
    v37 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self contentProtection];
    uint64_t v38 = [v5 contentProtection];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self contentProtection];
      v41 = [v5 contentProtection];
      int v42 = [v40 isEqual:v41];

      if (!v42)
      {
LABEL_25:
        char v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v44 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self personaId];
    v45 = [v5 personaId];
    if (v44 == v45)
    {
      char v12 = 1;
    }
    else
    {
      v46 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self personaId];
      v47 = [v5 personaId];
      char v12 = [v46 isEqual:v47];
    }
    goto LABEL_26;
  }
  char v12 = 0;
LABEL_27:

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
  v28[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self _topicsJSONArray];
  v8 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self _entitiesJSONArray];
  v9 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self _locationsJSONArray];
  v10 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self uniqueID];
  int v11 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self contentProtection];
  char v12 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self personaId];
  v27[0] = @"absoluteTimestamp";
  uint64_t v13 = v6;
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v13;
  v28[0] = v13;
  v27[1] = @"topics";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v14;
  v28[1] = v14;
  v27[2] = @"entities";
  uint64_t v15 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v6;
  v22 = (void *)v15;
  v28[2] = v15;
  v27[3] = @"locations";
  v16 = v9;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v7;
  v28[3] = v16;
  v27[4] = @"uniqueID";
  v17 = v10;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v17;
  v27[5] = @"contentProtection";
  int v18 = v11;
  if (!v11)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v18;
  v27[6] = @"personaId";
  v19 = v12;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
  if (v12)
  {
    if (v11) {
      goto LABEL_20;
    }
LABEL_30:

    if (v10) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }

  if (!v11) {
    goto LABEL_30;
  }
LABEL_20:
  if (v10) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v9) {

  }
  if (v8)
  {
    if (v25) {
      goto LABEL_25;
    }
LABEL_33:

    if (v26) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }

  if (!v25) {
    goto LABEL_33;
  }
LABEL_25:
  if (v26) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:

  return v20;
}

- (id)_locationsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self locations];
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

- (id)_entitiesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self entities];
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

- (id)_topicsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self topics];
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

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichment)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v151[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  v102 = (void *)v6;
  if (!v6 || (uint64_t v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v101 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v7;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSinceReferenceDate:v12];
LABEL_6:
    uint64_t v101 = (uint64_t)v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    uint64_t v101 = [v14 dateFromString:v7];

LABEL_9:
    uint64_t v15 = [v5 objectForKeyedSubscript:@"topics"];
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
    int v17 = [v15 isEqual:v16];

    if (v17)
    {
      v98 = self;

      uint64_t v15 = 0;
    }
    else
    {
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v33 = 0;
            int v36 = (void *)v101;
            goto LABEL_124;
          }
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v49 = *MEMORY[0x1E4F502C8];
          uint64_t v148 = *MEMORY[0x1E4F28568];
          v106 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"topics"];
          v149 = v106;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
          v33 = 0;
          *a4 = (id)[v48 initWithDomain:v49 code:2 userInfo:v27];
          goto LABEL_52;
        }
      }
      v98 = self;
    }
    v106 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id obj = v15;
    uint64_t v18 = [obj countByEnumeratingWithState:&v119 objects:v147 count:16];
    if (!v18) {
      goto LABEL_24;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v120;
    id v99 = v5;
LABEL_16:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v120 != v20) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v119 + 1) + 8 * v21);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v143 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"topics"];
          id v144 = v23;
          id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
          v33 = 0;
          *a4 = (id)[v34 initWithDomain:v35 code:2 userInfo:v32];
          goto LABEL_30;
        }
        goto LABEL_51;
      }
      id v23 = v22;
      int v24 = [BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic alloc];
      id v118 = 0;
      v25 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic *)v24 initWithJSONDictionary:v23 error:&v118];
      id v26 = v118;
      if (v26)
      {
        id v32 = v26;
        self = v98;
        id v5 = v99;
        if (a4) {
          *a4 = v26;
        }

        v33 = 0;
        uint64_t v15 = obj;
        id v104 = obj;
        goto LABEL_34;
      }
      [v106 addObject:v25];

      if (v19 == ++v21)
      {
        uint64_t v19 = [obj countByEnumeratingWithState:&v119 objects:v147 count:16];
        id v5 = v99;
        if (!v19)
        {
LABEL_24:

          v27 = [v5 objectForKeyedSubscript:@"entities"];
          v28 = [MEMORY[0x1E4F1CA98] null];
          int v29 = [v27 isEqual:v28];

          if (v29)
          {

            v27 = 0;
          }
          else if (v27)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              self = v98;
              if (!a4)
              {
                v33 = 0;
                int v36 = (void *)v101;
                uint64_t v15 = obj;
                goto LABEL_122;
              }
              id v104 = v27;
              id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v68 = *MEMORY[0x1E4F502C8];
              uint64_t v141 = *MEMORY[0x1E4F28568];
              id v23 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"entities"];
              id v142 = v23;
              id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
              v33 = 0;
              *a4 = (id)[v67 initWithDomain:v68 code:2 userInfo:v32];
              goto LABEL_85;
            }
          }
          id v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          id v104 = v27;
          uint64_t v37 = [v104 countByEnumeratingWithState:&v114 objects:v140 count:16];
          if (!v37) {
            goto LABEL_47;
          }
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v115;
          id v100 = v5;
LABEL_39:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v115 != v39) {
              objc_enumerationMutation(v104);
            }
            v41 = *(void **)(*((void *)&v114 + 1) + 8 * v40);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v50 = a4;
              if (a4)
              {
                id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v52 = *MEMORY[0x1E4F502C8];
                uint64_t v136 = *MEMORY[0x1E4F28568];
                id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"entities"];
                id v137 = v42;
                v53 = (void *)MEMORY[0x1E4F1C9E8];
                v54 = &v137;
                v55 = &v136;
                goto LABEL_60;
              }
              goto LABEL_83;
            }
            id v42 = v41;
            v43 = [BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity alloc];
            id v113 = 0;
            v44 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)v43 initWithJSONDictionary:v42 error:&v113];
            id v45 = v113;
            if (v45)
            {
              id v56 = v45;
              uint64_t v15 = obj;
              if (a4) {
                *a4 = v45;
              }

              v33 = 0;
              id v32 = v104;
              id v5 = v100;
              goto LABEL_119;
            }
            [v23 addObject:v44];

            if (v38 == ++v40)
            {
              uint64_t v38 = [v104 countByEnumeratingWithState:&v114 objects:v140 count:16];
              id v5 = v100;
              if (!v38)
              {
LABEL_47:

                id v32 = [v5 objectForKeyedSubscript:@"locations"];
                v46 = [MEMORY[0x1E4F1CA98] null];
                int v47 = [v32 isEqual:v46];

                if (v47)
                {

                  id v32 = 0;
LABEL_68:
                  id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
                  long long v109 = 0u;
                  long long v110 = 0u;
                  long long v111 = 0u;
                  long long v112 = 0u;
                  id v32 = v32;
                  uint64_t v57 = [v32 countByEnumeratingWithState:&v109 objects:v133 count:16];
                  if (!v57) {
                    goto LABEL_78;
                  }
                  uint64_t v58 = v57;
                  uint64_t v59 = *(void *)v110;
                  id v100 = v5;
LABEL_70:
                  uint64_t v60 = 0;
                  while (1)
                  {
                    if (*(void *)v110 != v59) {
                      objc_enumerationMutation(v32);
                    }
                    v61 = *(void **)(*((void *)&v109 + 1) + 8 * v60);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      break;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v72 = a4;
                      if (a4)
                      {
                        id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v74 = *MEMORY[0x1E4F502C8];
                        uint64_t v129 = *MEMORY[0x1E4F28568];
                        id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"locations"];
                        id v130 = v62;
                        v75 = (void *)MEMORY[0x1E4F1C9E8];
                        v76 = &v130;
                        v77 = &v129;
                        goto LABEL_93;
                      }
                      goto LABEL_101;
                    }
                    id v62 = v61;
                    v63 = [BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation alloc];
                    id v108 = 0;
                    v64 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)v63 initWithJSONDictionary:v62 error:&v108];
                    id v65 = v108;
                    if (v65)
                    {
                      id v78 = v65;
                      if (a4) {
                        *a4 = v65;
                      }

                      v33 = 0;
                      goto LABEL_97;
                    }
                    [v42 addObject:v64];

                    if (v58 == ++v60)
                    {
                      uint64_t v58 = [v32 countByEnumeratingWithState:&v109 objects:v133 count:16];
                      id v5 = v100;
                      if (v58) {
                        goto LABEL_70;
                      }
LABEL_78:

                      id v62 = [v5 objectForKeyedSubscript:@"uniqueID"];
                      if (!v62)
                      {
                        id v56 = 0;
                        v66 = a4;
                        goto LABEL_105;
                      }
                      objc_opt_class();
                      v66 = a4;
                      if (objc_opt_isKindOfClass())
                      {
                        id v56 = 0;
                        goto LABEL_105;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (a4)
                        {
                          id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v87 = *MEMORY[0x1E4F502C8];
                          uint64_t v127 = *MEMORY[0x1E4F28568];
                          id v78 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
                          id v128 = v78;
                          v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
                          id v88 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2);
                          v33 = 0;
                          id v56 = 0;
                          *a4 = v88;
                          goto LABEL_138;
                        }
                        id v56 = 0;
                        v33 = 0;
                        uint64_t v15 = obj;
                        goto LABEL_118;
                      }
                      id v56 = v62;
LABEL_105:
                      id v78 = [v5 objectForKeyedSubscript:@"contentProtection"];
                      v97 = v78;
                      if (v78)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v78 = 0;
                          goto LABEL_110;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v78 = v78;
                          goto LABEL_110;
                        }
                        if (v66)
                        {
                          id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v91 = *MEMORY[0x1E4F502C8];
                          uint64_t v125 = *MEMORY[0x1E4F28568];
                          v95 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
                          v126 = v95;
                          uint64_t v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
                          v33 = 0;
                          id v78 = 0;
                          id *v66 = (id)[v93 initWithDomain:v91 code:2 userInfo:v89];
                          v84 = (void *)v89;
                          uint64_t v15 = obj;
                          goto LABEL_115;
                        }
                        id v78 = 0;
                        v33 = 0;
LABEL_138:
                        uint64_t v15 = obj;
LABEL_116:

LABEL_117:
LABEL_118:

LABEL_119:
                        int v36 = (void *)v101;
LABEL_120:

                        self = v98;
LABEL_121:

                        v27 = v104;
LABEL_122:

LABEL_124:
                        uint64_t v7 = v102;
                        goto LABEL_125;
                      }
LABEL_110:
                      id v83 = [v5 objectForKeyedSubscript:@"personaId"];
                      v84 = v83;
                      if (v83)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v83 = 0;
                          goto LABEL_113;
                        }
                        objc_opt_class();
                        uint64_t v15 = obj;
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (a4)
                          {
                            id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v94 = *MEMORY[0x1E4F502C8];
                            uint64_t v123 = *MEMORY[0x1E4F28568];
                            v92 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
                            v124 = v92;
                            v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
                            *a4 = (id)[v96 initWithDomain:v94 code:2 userInfo:v90];
                          }
                          v95 = 0;
                          v33 = 0;
LABEL_115:

                          goto LABEL_116;
                        }
                        id v83 = v84;
                      }
                      else
                      {
LABEL_113:
                        uint64_t v15 = obj;
                      }
                      v95 = v83;
                      v33 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)v98 initWithAbsoluteTimestamp:v101 topics:v106 entities:v23 locations:v42 uniqueID:v56 contentProtection:v78 personaId:v83];
                      v98 = v33;
                      goto LABEL_115;
                    }
                  }
                  v72 = a4;
                  if (a4)
                  {
                    id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v74 = *MEMORY[0x1E4F502C8];
                    uint64_t v131 = *MEMORY[0x1E4F28568];
                    id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"locations"];
                    id v132 = v62;
                    v75 = (void *)MEMORY[0x1E4F1C9E8];
                    v76 = &v132;
                    v77 = &v131;
LABEL_93:
                    id v78 = [v75 dictionaryWithObjects:v76 forKeys:v77 count:1];
                    id v79 = (id)[v73 initWithDomain:v74 code:2 userInfo:v78];
                    v33 = 0;
                    id *v72 = v79;
LABEL_97:
                    id v56 = v32;
                    id v5 = v100;
                    uint64_t v15 = obj;
                    goto LABEL_117;
                  }
LABEL_101:
                  v33 = 0;
                  id v56 = v32;
LABEL_61:
                  id v5 = v100;
LABEL_62:
                  int v36 = (void *)v101;
                  uint64_t v15 = obj;
                  goto LABEL_120;
                }
                if (!v32) {
                  goto LABEL_68;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  goto LABEL_68;
                }
                if (a4)
                {
                  id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v81 = *MEMORY[0x1E4F502C8];
                  uint64_t v134 = *MEMORY[0x1E4F28568];
                  id v42 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"locations"];
                  id v135 = v42;
                  id v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
                  id v82 = (id)[v80 initWithDomain:v81 code:2 userInfo:v56];
                  v33 = 0;
                  *a4 = v82;
                  goto LABEL_62;
                }
                v33 = 0;
LABEL_84:
                self = v98;
LABEL_85:
                int v36 = (void *)v101;
                uint64_t v15 = obj;
                goto LABEL_121;
              }
              goto LABEL_39;
            }
          }
          v50 = a4;
          if (a4)
          {
            id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v52 = *MEMORY[0x1E4F502C8];
            uint64_t v138 = *MEMORY[0x1E4F28568];
            id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"entities"];
            id v139 = v42;
            v53 = (void *)MEMORY[0x1E4F1C9E8];
            v54 = &v139;
            v55 = &v138;
LABEL_60:
            id v56 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:1];
            v33 = 0;
            id *v50 = (id)[v51 initWithDomain:v52 code:2 userInfo:v56];
            id v32 = v104;
            goto LABEL_61;
          }
LABEL_83:
          v33 = 0;
          id v32 = v104;
          id v5 = v100;
          goto LABEL_84;
        }
        goto LABEL_16;
      }
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v31 = *MEMORY[0x1E4F502C8];
      uint64_t v145 = *MEMORY[0x1E4F28568];
      id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"topics"];
      id v146 = v23;
      id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      v33 = 0;
      *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v32];
LABEL_30:
      uint64_t v15 = obj;
      id v104 = obj;
      self = v98;
      id v5 = v99;
LABEL_34:
      int v36 = (void *)v101;
      goto LABEL_121;
    }
LABEL_51:
    v33 = 0;
    uint64_t v15 = obj;
    v27 = obj;
    self = v98;
    id v5 = v99;
LABEL_52:
    int v36 = (void *)v101;
    goto LABEL_122;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v7;
    goto LABEL_6;
  }
  if (a4)
  {
    id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v70 = *MEMORY[0x1E4F502C8];
    uint64_t v150 = *MEMORY[0x1E4F28568];
    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
    v151[0] = v15;
    v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:&v150 count:1];
    id v71 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
    int v36 = 0;
    v33 = 0;
    *a4 = v71;

    goto LABEL_124;
  }
  int v36 = 0;
  v33 = 0;
LABEL_125:

  return v33;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = self->_topics;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        uint64_t v31 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v11 = self->_entities;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
        uint64_t v31 = 0;
        PBDataWriterPlaceMark();
        [v16 writeTo:v4];
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v17 = self->_locations;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v23 + 1) + 8 * v21);
        uint64_t v31 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v22, "writeTo:", v4, (void)v23);
        PBDataWriterRecallMark();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v19);
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
  v43.receiver = self;
  v43.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichment;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5)
  {
LABEL_44:
    v41 = v5;
    goto LABEL_45;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  id v10 = (int *)MEMORY[0x1E4F940E0];
  double v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_42:
    uint64_t v34 = [v6 copy];
    topics = v5->_topics;
    v5->_topics = (NSArray *)v34;

    uint64_t v36 = [v7 copy];
    entities = v5->_entities;
    v5->_entities = (NSArray *)v36;

    uint64_t v38 = [v8 copy];
    locations = v5->_locations;
    v5->_locations = (NSArray *)v38;

    int v40 = v4[*v11];
    if (v40) {
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v11]) {
      goto LABEL_42;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v9;
      uint64_t v17 = *(void *)&v4[v16];
      unint64_t v18 = v17 + 1;
      if (v17 == -1 || v18 > *(void *)&v4[*v10]) {
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
        int v21 = v4[*v11];
        goto LABEL_15;
      }
    }
    v4[*v11] = 1;
LABEL_13:
    int v21 = v4[*v11];
    if (v4[*v11]) {
      unint64_t v15 = 0;
    }
LABEL_15:
    if (v21 || (v15 & 7) == 4) {
      goto LABEL_42;
    }
    switch((v15 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
        uint64_t v23 = *v9;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v10])
        {
          double v25 = *(double *)(*(void *)&v4[*v12] + v24);
          *(void *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v11] = 1;
          double v25 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v25;
        goto LABEL_41;
      case 2u:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_46;
        }
        id v26 = [[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentTopic alloc] initByReadFrom:v4];
        if (!v26) {
          goto LABEL_46;
        }
        long long v27 = v26;
        long long v28 = v6;
        goto LABEL_34;
      case 3u:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_46;
        }
        id v29 = [[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity alloc] initByReadFrom:v4];
        if (!v29) {
          goto LABEL_46;
        }
        long long v27 = v29;
        long long v28 = v7;
        goto LABEL_34;
      case 4u:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_46;
        }
        id v30 = [[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation alloc] initByReadFrom:v4];
        if (!v30) {
          goto LABEL_46;
        }
        long long v27 = v30;
        long long v28 = v8;
LABEL_34:
        [v28 addObject:v27];
        PBReaderRecallMark();

        goto LABEL_41;
      case 5u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 64;
        goto LABEL_38;
      case 6u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 72;
        goto LABEL_38;
      case 7u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 80;
LABEL_38:
        long long v33 = *(Class *)((char *)&v5->super.super.isa + v32);
        *(Class *)((char *)&v5->super.super.isa + v32) = (Class)v31;

        goto LABEL_41;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_41:
          if (*(void *)&v4[*v9] >= *(void *)&v4[*v10]) {
            goto LABEL_42;
          }
          continue;
        }
LABEL_46:

LABEL_43:
        v41 = 0;
LABEL_45:

        return v41;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self absoluteTimestamp];
  id v5 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self topics];
  uint64_t v6 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self entities];
  uint64_t v7 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self locations];
  uint64_t v8 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self uniqueID];
  uint64_t v9 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self contentProtection];
  id v10 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichment *)self personaId];
  double v11 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingPhotosKnowledgeGraphEnrichment with absoluteTimestamp: %@, topics: %@, entities: %@, locations: %@, uniqueID: %@, contentProtection: %@, personaId: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichment)initWithAbsoluteTimestamp:(id)a3 topics:(id)a4 entities:(id)a5 locations:(id)a6 uniqueID:(id)a7 contentProtection:(id)a8 personaId:(id)a9
{
  id v15 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichment;
  unint64_t v18 = [(BMEventBase *)&v25 init];
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22, v23, v24);
    if (v15)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      [v15 timeIntervalSinceReferenceDate];
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      double v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_topics, a4);
    objc_storeStrong((id *)&v18->_entities, a5);
    objc_storeStrong((id *)&v18->_locations, a6);
    objc_storeStrong((id *)&v18->_uniqueID, a7);
    objc_storeStrong((id *)&v18->_contentProtection, a8);
    objc_storeStrong((id *)&v18->_personaId, a9);
  }

  return v18;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"topics", 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entities" number:3 type:14 subMessageClass:objc_opt_class()];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locations" number:4 type:14 subMessageClass:objc_opt_class()];
  v11[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:5 type:13 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:6 type:13 subMessageClass:0];
  v11[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:7 type:13 subMessageClass:0];
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6360;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"topics_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_63647];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"entities_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_266];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"locations_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_268_63648];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

id __62__BMProactiveHarvestingPhotosKnowledgeGraphEnrichment_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _locationsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __62__BMProactiveHarvestingPhotosKnowledgeGraphEnrichment_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _entitiesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __62__BMProactiveHarvestingPhotosKnowledgeGraphEnrichment_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _topicsJSONArray];
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

    uint64_t v7 = [[BMProactiveHarvestingPhotosKnowledgeGraphEnrichment alloc] initByReadFrom:v6];
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