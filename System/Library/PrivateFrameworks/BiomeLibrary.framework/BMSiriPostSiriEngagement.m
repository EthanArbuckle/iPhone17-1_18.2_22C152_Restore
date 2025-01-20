@interface BMSiriPostSiriEngagement
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriPostSiriEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10;
- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10 clientSessionId:(id)a11;
- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10 clientSessionId:(id)a11 lastRequestId:(id)a12 executionUUID:(id)a13;
- (BMSiriPostSiriEngagementFeatures)engagementUnderstandingFeatures;
- (BOOL)isEqual:(id)a3;
- (NSArray)pseEvents;
- (NSArray)requestIds;
- (NSString)UISessionID;
- (NSString)appPattern;
- (NSString)clientSessionId;
- (NSString)conversationPath;
- (NSString)description;
- (NSString)executionUUID;
- (NSString)lastRequestId;
- (NSString)taskID;
- (NSString)taskType;
- (id)_pseEventsJSONArray;
- (id)_requestIdsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriPostSiriEngagement

- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10 clientSessionId:(id)a11
{
  return [(BMSiriPostSiriEngagement *)self initWithUISessionID:a3 taskID:a4 taskType:a5 conversationPath:a6 appPattern:a7 requestIds:a8 engagementUnderstandingFeatures:a9 pseEvents:a10 clientSessionId:0 lastRequestId:0 executionUUID:0];
}

- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10
{
  return [(BMSiriPostSiriEngagement *)self initWithUISessionID:a3 taskID:a4 taskType:a5 conversationPath:a6 appPattern:a7 requestIds:a8 engagementUnderstandingFeatures:a9 pseEvents:a10 clientSessionId:0 lastRequestId:0 executionUUID:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_lastRequestId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_pseEvents, 0);
  objc_storeStrong((id *)&self->_engagementUnderstandingFeatures, 0);
  objc_storeStrong((id *)&self->_requestIds, 0);
  objc_storeStrong((id *)&self->_appPattern, 0);
  objc_storeStrong((id *)&self->_conversationPath, 0);
  objc_storeStrong((id *)&self->_taskType, 0);
  objc_storeStrong((id *)&self->_taskID, 0);

  objc_storeStrong((id *)&self->_UISessionID, 0);
}

- (NSString)executionUUID
{
  return self->_executionUUID;
}

- (NSString)lastRequestId
{
  return self->_lastRequestId;
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (NSArray)pseEvents
{
  return self->_pseEvents;
}

- (BMSiriPostSiriEngagementFeatures)engagementUnderstandingFeatures
{
  return self->_engagementUnderstandingFeatures;
}

- (NSArray)requestIds
{
  return self->_requestIds;
}

- (NSString)appPattern
{
  return self->_appPattern;
}

- (NSString)conversationPath
{
  return self->_conversationPath;
}

- (NSString)taskType
{
  return self->_taskType;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (NSString)UISessionID
{
  return self->_UISessionID;
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
    v6 = [(BMSiriPostSiriEngagement *)self UISessionID];
    uint64_t v7 = [v5 UISessionID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriPostSiriEngagement *)self UISessionID];
      v10 = [v5 UISessionID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_41;
      }
    }
    v13 = [(BMSiriPostSiriEngagement *)self taskID];
    uint64_t v14 = [v5 taskID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriPostSiriEngagement *)self taskID];
      v17 = [v5 taskID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_41;
      }
    }
    v19 = [(BMSiriPostSiriEngagement *)self taskType];
    uint64_t v20 = [v5 taskType];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriPostSiriEngagement *)self taskType];
      v23 = [v5 taskType];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_41;
      }
    }
    v25 = [(BMSiriPostSiriEngagement *)self conversationPath];
    uint64_t v26 = [v5 conversationPath];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriPostSiriEngagement *)self conversationPath];
      v29 = [v5 conversationPath];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_41;
      }
    }
    v31 = [(BMSiriPostSiriEngagement *)self appPattern];
    uint64_t v32 = [v5 appPattern];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSiriPostSiriEngagement *)self appPattern];
      v35 = [v5 appPattern];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_41;
      }
    }
    v37 = [(BMSiriPostSiriEngagement *)self requestIds];
    uint64_t v38 = [v5 requestIds];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMSiriPostSiriEngagement *)self requestIds];
      v41 = [v5 requestIds];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_41;
      }
    }
    v43 = [(BMSiriPostSiriEngagement *)self engagementUnderstandingFeatures];
    uint64_t v44 = [v5 engagementUnderstandingFeatures];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMSiriPostSiriEngagement *)self engagementUnderstandingFeatures];
      v47 = [v5 engagementUnderstandingFeatures];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_41;
      }
    }
    v49 = [(BMSiriPostSiriEngagement *)self pseEvents];
    uint64_t v50 = [v5 pseEvents];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMSiriPostSiriEngagement *)self pseEvents];
      v53 = [v5 pseEvents];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_41;
      }
    }
    v55 = [(BMSiriPostSiriEngagement *)self clientSessionId];
    uint64_t v56 = [v5 clientSessionId];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMSiriPostSiriEngagement *)self clientSessionId];
      v59 = [v5 clientSessionId];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_41;
      }
    }
    v61 = [(BMSiriPostSiriEngagement *)self lastRequestId];
    uint64_t v62 = [v5 lastRequestId];
    if (v61 == (void *)v62)
    {
    }
    else
    {
      v63 = (void *)v62;
      v64 = [(BMSiriPostSiriEngagement *)self lastRequestId];
      v65 = [v5 lastRequestId];
      int v66 = [v64 isEqual:v65];

      if (!v66)
      {
LABEL_41:
        char v12 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    v68 = [(BMSiriPostSiriEngagement *)self executionUUID];
    v69 = [v5 executionUUID];
    if (v68 == v69)
    {
      char v12 = 1;
    }
    else
    {
      v70 = [(BMSiriPostSiriEngagement *)self executionUUID];
      v71 = [v5 executionUUID];
      char v12 = [v70 isEqual:v71];
    }
    goto LABEL_42;
  }
  char v12 = 0;
LABEL_43:

  return v12;
}

- (id)jsonDictionary
{
  v38[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriPostSiriEngagement *)self UISessionID];
  uint64_t v4 = [(BMSiriPostSiriEngagement *)self taskID];
  uint64_t v5 = [(BMSiriPostSiriEngagement *)self taskType];
  uint64_t v6 = [(BMSiriPostSiriEngagement *)self conversationPath];
  uint64_t v7 = [(BMSiriPostSiriEngagement *)self appPattern];
  int v36 = [(BMSiriPostSiriEngagement *)self _requestIdsJSONArray];
  v8 = [(BMSiriPostSiriEngagement *)self engagementUnderstandingFeatures];
  v35 = [v8 jsonDictionary];

  v34 = [(BMSiriPostSiriEngagement *)self _pseEventsJSONArray];
  v9 = [(BMSiriPostSiriEngagement *)self clientSessionId];
  v10 = [(BMSiriPostSiriEngagement *)self lastRequestId];
  int v11 = [(BMSiriPostSiriEngagement *)self executionUUID];
  v37[0] = @"UISessionID";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v12;
  v38[0] = v12;
  v37[1] = @"taskID";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v13;
  v38[1] = v13;
  v37[2] = @"taskType";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v14;
  v38[2] = v14;
  v37[3] = @"conversationPath";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v3;
  v25 = (void *)v15;
  v38[3] = v15;
  v37[4] = @"appPattern";
  uint64_t v16 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v4;
  int v24 = (void *)v16;
  v38[4] = v16;
  v37[5] = @"requestIds";
  v17 = v36;
  if (!v36)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v5;
  v38[5] = v17;
  v37[6] = @"engagementUnderstandingFeatures";
  int v18 = v35;
  if (!v35)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v6;
  v38[6] = v18;
  v37[7] = @"pseEvents";
  v19 = v34;
  if (!v34)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[7] = v19;
  v37[8] = @"clientSessionId";
  uint64_t v20 = v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[8] = v20;
  v37[9] = @"lastRequestId";
  v21 = v10;
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[9] = v21;
  v37[10] = @"executionUUID";
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
      goto LABEL_25;
    }
LABEL_42:

    if (v9) {
      goto LABEL_26;
    }
    goto LABEL_43;
  }

  if (!v10) {
    goto LABEL_42;
  }
LABEL_25:
  if (v9) {
    goto LABEL_26;
  }
LABEL_43:

LABEL_26:
  if (!v34) {

  }
  if (!v35) {
  if (!v36)
  }

  if (!v7) {
  if (v30)
  }
  {
    if (v31) {
      goto LABEL_36;
    }
  }
  else
  {

    if (v31)
    {
LABEL_36:
      if (v32) {
        goto LABEL_37;
      }
LABEL_46:

      if (v33) {
        goto LABEL_38;
      }
      goto LABEL_47;
    }
  }

  if (!v32) {
    goto LABEL_46;
  }
LABEL_37:
  if (v33) {
    goto LABEL_38;
  }
LABEL_47:

LABEL_38:

  return v29;
}

- (id)_pseEventsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMSiriPostSiriEngagement *)self pseEvents];
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

- (id)_requestIdsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMSiriPostSiriEngagement *)self requestIds];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriPostSiriEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v213[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"UISessionID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"taskID"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v165 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v165 = v9;
LABEL_7:
      uint64_t v10 = [v6 objectForKeyedSubscript:@"taskType"];
      v166 = (void *)v10;
      if (!v10 || (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v163 = 0;
LABEL_10:
        uint64_t v12 = [v6 objectForKeyedSubscript:@"conversationPath"];
        v164 = (void *)v12;
        if (v12 && (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              id v67 = v8;
              id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
              v170 = a4;
              v69 = v9;
              uint64_t v70 = *MEMORY[0x1E4F502C8];
              uint64_t v206 = *MEMORY[0x1E4F28568];
              v71 = v7;
              id v72 = [NSString alloc];
              uint64_t v140 = objc_opt_class();
              v73 = v72;
              uint64_t v7 = v71;
              v74 = (void *)[v73 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v140, @"conversationPath"];
              v207 = v74;
              uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
              v76 = v68;
              id v8 = v67;
              uint64_t v77 = v70;
              v9 = v69;
              v162 = (void *)v75;
              v63 = 0;
              int v36 = 0;
              id *v170 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v77, 2);
              uint64_t v32 = v165;
              goto LABEL_126;
            }
            v63 = 0;
            int v36 = 0;
            uint64_t v32 = v165;
            goto LABEL_127;
          }
          id v161 = v13;
        }
        else
        {
          id v161 = 0;
        }
        uint64_t v14 = [v6 objectForKeyedSubscript:@"appPattern"];
        v162 = (void *)v14;
        id v159 = v8;
        v160 = v9;
        if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v171 = a4;
              v78 = v9;
              id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
              v80 = v7;
              uint64_t v81 = *MEMORY[0x1E4F502C8];
              uint64_t v204 = *MEMORY[0x1E4F28568];
              id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appPattern"];
              id v205 = v16;
              v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
              v82 = v79;
              v9 = v78;
              uint64_t v83 = v81;
              uint64_t v7 = v80;
              id v158 = 0;
              int v36 = 0;
              id *v171 = (id)[v82 initWithDomain:v83 code:2 userInfo:v19];
              uint64_t v32 = v165;
              v63 = v161;
              goto LABEL_124;
            }
            v74 = 0;
            int v36 = 0;
            uint64_t v32 = v165;
            v63 = v161;
            goto LABEL_126;
          }
          v154 = v7;
          id v158 = v15;
        }
        else
        {
          v154 = v7;
          id v158 = 0;
        }
        id v16 = [v6 objectForKeyedSubscript:@"requestIds"];
        v17 = [MEMORY[0x1E4F1CA98] null];
        int v18 = [v16 isEqual:v17];

        if (v18)
        {
          v153 = self;

          id v16 = 0;
        }
        else
        {
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                int v36 = 0;
                uint64_t v7 = v154;
                v63 = v161;
                uint64_t v32 = v165;
                goto LABEL_125;
              }
              id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
              v85 = self;
              uint64_t v86 = *MEMORY[0x1E4F502C8];
              uint64_t v202 = *MEMORY[0x1E4F28568];
              v19 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"requestIds"];
              v203 = v19;
              uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
              uint64_t v88 = v86;
              self = v85;
              int v36 = 0;
              *a4 = (id)[v84 initWithDomain:v88 code:2 userInfo:v87];
              int v66 = (void *)v87;
              goto LABEL_64;
            }
          }
          v153 = self;
        }
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
        long long v178 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        id v16 = v16;
        uint64_t v20 = [v16 countByEnumeratingWithState:&v178 objects:v201 count:16];
        v167 = a4;
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v179;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v179 != v22) {
                objc_enumerationMutation(v16);
              }
              uint64_t v24 = *(void *)(*((void *)&v178 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v48 = v167;
                if (v167)
                {
                  id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v50 = *MEMORY[0x1E4F502C8];
                  uint64_t v199 = *MEMORY[0x1E4F28568];
                  v151 = (BMSiriPostSiriEngagementFeatures *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"requestIds"];
                  v200 = v151;
                  id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v200 forKeys:&v199 count:1];
                  v51 = objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2);
                  uint64_t v32 = v165;
                  goto LABEL_55;
                }
LABEL_59:
                int v36 = 0;
                int v66 = v16;
                self = v153;
LABEL_64:
                uint64_t v7 = v154;
                v63 = v161;
                uint64_t v32 = v165;
                goto LABEL_123;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v167) {
                  goto LABEL_59;
                }
                id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v65 = *MEMORY[0x1E4F502C8];
                uint64_t v197 = *MEMORY[0x1E4F28568];
                v151 = (BMSiriPostSiriEngagementFeatures *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requestIds"];
                v198 = v151;
                id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1];
                v51 = objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
                uint64_t v32 = v165;
                int v48 = v167;
LABEL_55:
                int v36 = 0;
                *int v48 = v51;
                int v66 = v16;
                self = v153;
                uint64_t v7 = v154;
LABEL_56:
                v63 = v161;
                goto LABEL_122;
              }
              [v19 addObject:v24];
            }
            uint64_t v21 = [v16 countByEnumeratingWithState:&v178 objects:v201 count:16];
            a4 = v167;
          }
          while (v21);
        }

        uint64_t v25 = [v6 objectForKeyedSubscript:@"engagementUnderstandingFeatures"];
        v150 = (void *)v25;
        if (!v25 || (uint64_t v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v151 = 0;
          goto LABEL_39;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v99 = v26;
          id v177 = 0;
          v151 = [[BMSiriPostSiriEngagementFeatures alloc] initWithJSONDictionary:v99 error:&v177];
          id v100 = v177;
          if (!v100)
          {

LABEL_39:
            v27 = [v6 objectForKeyedSubscript:@"pseEvents"];
            v28 = [MEMORY[0x1E4F1CA98] null];
            int v29 = [v27 isEqual:v28];

            if (v29)
            {

              v27 = 0;
            }
            else
            {
              uint64_t v7 = v154;
              if (v27)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  id obj = v27;
                  if (!a4)
                  {
                    int v36 = 0;
                    self = v153;
                    uint64_t v32 = v165;
                    v63 = v161;
                    int v66 = v150;
                    goto LABEL_122;
                  }
                  id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v114 = *MEMORY[0x1E4F502C8];
                  uint64_t v193 = *MEMORY[0x1E4F28568];
                  v152 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"pseEvents"];
                  v194 = v152;
                  uint64_t v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
                  v116 = v113;
                  uint64_t v7 = v154;
                  uint64_t v117 = v114;
                  v118 = (void *)v115;
                  int v36 = 0;
                  *a4 = (id)[v116 initWithDomain:v117 code:2 userInfo:v115];
                  goto LABEL_106;
                }
              }
            }
            v152 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
            long long v173 = 0u;
            long long v174 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            id v89 = v27;
            uint64_t v90 = [v89 countByEnumeratingWithState:&v173 objects:v192 count:16];
            id obj = v89;
            if (!v90) {
              goto LABEL_78;
            }
            uint64_t v91 = v90;
            uint64_t v92 = *(void *)v174;
LABEL_70:
            uint64_t v93 = 0;
            while (1)
            {
              if (*(void *)v174 != v92) {
                objc_enumerationMutation(obj);
              }
              v94 = *(void **)(*((void *)&v173 + 1) + 8 * v93);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                break;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v108 = *MEMORY[0x1E4F502C8];
                  uint64_t v188 = *MEMORY[0x1E4F28568];
                  v110 = a4;
                  id v95 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"pseEvents"];
                  id v189 = v95;
                  uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
                  goto LABEL_98;
                }
                goto LABEL_105;
              }
              id v95 = v94;
              v96 = [BMSiriPostSiriEngagementSignal alloc];
              id v172 = 0;
              v97 = [(BMSiriPostSiriEngagementSignal *)v96 initWithJSONDictionary:v95 error:&v172];
              id v98 = v172;
              if (v98)
              {
                id v111 = v98;
                if (v167) {
                  id *v167 = v98;
                }

                int v36 = 0;
                goto LABEL_102;
              }
              [v152 addObject:v97];

              ++v93;
              a4 = v167;
              if (v91 == v93)
              {
                id v89 = obj;
                uint64_t v91 = [obj countByEnumeratingWithState:&v173 objects:v192 count:16];
                if (v91) {
                  goto LABEL_70;
                }
LABEL_78:

                id v95 = [v6 objectForKeyedSubscript:@"clientSessionId"];
                if (v95)
                {
                  objc_opt_class();
                  uint64_t v7 = v154;
                  if (objc_opt_isKindOfClass())
                  {
                    id v148 = 0;
                    goto LABEL_108;
                  }
                  objc_opt_class();
                  v9 = v160;
                  if (objc_opt_isKindOfClass())
                  {
                    id v148 = v95;
                    goto LABEL_109;
                  }
                  if (v167)
                  {
                    id v149 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v124 = *MEMORY[0x1E4F502C8];
                    uint64_t v186 = *MEMORY[0x1E4F28568];
                    id v125 = [NSString alloc];
                    uint64_t v142 = objc_opt_class();
                    v126 = v125;
                    uint64_t v7 = v154;
                    id v111 = (id)[v126 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v142, @"clientSessionId"];
                    id v187 = v111;
                    v147 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
                    id v127 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v124, 2);
                    int v36 = 0;
                    id v148 = 0;
                    id *v167 = v127;
                    goto LABEL_150;
                  }
                  id v148 = 0;
                  int v36 = 0;
                  uint64_t v32 = v165;
LABEL_120:

                  v63 = v161;
                  v118 = v148;
                  int v66 = v150;
LABEL_121:

                  self = v153;
LABEL_122:

LABEL_123:
LABEL_124:

LABEL_125:
                  v74 = v158;
                  id v8 = v159;
LABEL_126:

LABEL_127:
                  uint64_t v44 = v163;
LABEL_128:

                  goto LABEL_129;
                }
                id v148 = 0;
                uint64_t v7 = v154;
LABEL_108:
                v9 = v160;
LABEL_109:
                uint64_t v119 = [v6 objectForKeyedSubscript:@"lastRequestId"];
                v147 = (void *)v119;
                if (!v119 || (v120 = (void *)v119, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v111 = 0;
                  goto LABEL_112;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v111 = v120;
LABEL_112:
                  id v121 = [v6 objectForKeyedSubscript:@"executionUUID"];
                  v155 = v121;
                  if (!v121)
                  {
LABEL_115:
                    uint64_t v32 = v165;
                    goto LABEL_116;
                  }
                  v122 = v121;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v121 = 0;
                    goto LABEL_115;
                  }
                  objc_opt_class();
                  uint64_t v32 = v165;
                  if (objc_opt_isKindOfClass())
                  {
                    id v121 = v122;
LABEL_116:
                    v145 = v121;
                    int v36 = [(BMSiriPostSiriEngagement *)v153 initWithUISessionID:v159 taskID:v32 taskType:v163 conversationPath:v161 appPattern:v158 requestIds:v19 engagementUnderstandingFeatures:v151 pseEvents:v152 clientSessionId:v148 lastRequestId:v111 executionUUID:v121];
                    v153 = v36;
                  }
                  else
                  {
                    if (v167)
                    {
                      id v146 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v144 = *MEMORY[0x1E4F502C8];
                      uint64_t v182 = *MEMORY[0x1E4F28568];
                      v135 = v7;
                      v136 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"executionUUID"];
                      v183 = v136;
                      v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
                      id *v167 = (id)[v146 initWithDomain:v144 code:2 userInfo:v137];

                      uint64_t v7 = v135;
                    }
                    v145 = 0;
                    int v36 = 0;
                  }
LABEL_117:
                }
                else
                {
                  if (v167)
                  {
                    id v156 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v128 = *MEMORY[0x1E4F502C8];
                    uint64_t v184 = *MEMORY[0x1E4F28568];
                    v129 = v7;
                    id v130 = [NSString alloc];
                    uint64_t v143 = objc_opt_class();
                    v131 = v130;
                    uint64_t v7 = v129;
                    v145 = (void *)[v131 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v143, @"lastRequestId"];
                    v185 = v145;
                    uint64_t v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
                    v133 = v156;
                    v155 = (void *)v132;
                    id v134 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v128, 2);
                    int v36 = 0;
                    id v111 = 0;
                    id *v167 = v134;
                    uint64_t v32 = v165;
                    goto LABEL_117;
                  }
                  id v111 = 0;
                  int v36 = 0;
LABEL_150:
                  uint64_t v32 = v165;
                }

LABEL_119:
                goto LABEL_120;
              }
            }
            if (a4)
            {
              id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v108 = *MEMORY[0x1E4F502C8];
              uint64_t v190 = *MEMORY[0x1E4F28568];
              id v95 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"pseEvents"];
              id v191 = v95;
              uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
              v110 = a4;
LABEL_98:
              id v111 = (id)v109;
              id v112 = (id)[v107 initWithDomain:v108 code:2 userInfo:v109];
              int v36 = 0;
              id *v110 = v112;
LABEL_102:
              uint64_t v7 = v154;
              id v148 = obj;
              v9 = v160;
              uint64_t v32 = v165;
              goto LABEL_119;
            }
LABEL_105:
            int v36 = 0;
            uint64_t v7 = v154;
            v118 = obj;
            v9 = v160;
LABEL_106:
            uint64_t v32 = v165;
            v63 = v161;
            int v66 = v150;
            goto LABEL_121;
          }
          v101 = v100;
          self = v153;
          if (a4) {
            *a4 = v100;
          }

          int v36 = 0;
          id obj = v99;
          int v66 = v99;
          uint64_t v7 = v154;
        }
        else
        {
          if (!a4)
          {
            int v36 = 0;
            self = v153;
            uint64_t v7 = v154;
            v63 = v161;
            uint64_t v32 = v165;
            int v66 = v150;
            goto LABEL_123;
          }
          id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v103 = *MEMORY[0x1E4F502C8];
          uint64_t v195 = *MEMORY[0x1E4F28568];
          v104 = a4;
          id v105 = [NSString alloc];
          uint64_t v141 = objc_opt_class();
          v106 = v105;
          int v66 = v150;
          v151 = (BMSiriPostSiriEngagementFeatures *)[v106 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v141, @"engagementUnderstandingFeatures"];
          v196 = v151;
          id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v196 forKeys:&v195 count:1];
          int v36 = 0;
          id *v104 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v103, 2);
          self = v153;
          uint64_t v7 = v154;
        }
        uint64_t v32 = v165;
        goto LABEL_56;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v163 = v11;
        goto LABEL_10;
      }
      if (a4)
      {
        id v52 = v8;
        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        v169 = a4;
        int v54 = v9;
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v208 = *MEMORY[0x1E4F28568];
        uint64_t v56 = v7;
        id v57 = [NSString alloc];
        uint64_t v139 = objc_opt_class();
        v58 = v57;
        uint64_t v7 = v56;
        uint64_t v59 = [v58 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v139, @"taskType"];
        uint64_t v209 = v59;
        uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
        v61 = v53;
        id v8 = v52;
        uint64_t v62 = v55;
        v9 = v54;
        v63 = (void *)v59;
        v164 = (void *)v60;
        uint64_t v44 = 0;
        int v36 = 0;
        id *v169 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v62, 2);
        uint64_t v32 = v165;
        goto LABEL_128;
      }
      uint64_t v44 = 0;
      int v36 = 0;
      uint64_t v32 = v165;
LABEL_129:

      goto LABEL_130;
    }
    if (a4)
    {
      id v37 = v8;
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      v168 = a4;
      v39 = v9;
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v210 = *MEMORY[0x1E4F28568];
      v41 = v7;
      id v42 = [NSString alloc];
      uint64_t v138 = objc_opt_class();
      v43 = v42;
      uint64_t v7 = v41;
      uint64_t v44 = (void *)[v43 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v138, @"taskID"];
      v211 = v44;
      uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
      v46 = v38;
      id v8 = v37;
      uint64_t v47 = v40;
      v9 = v39;
      v166 = (void *)v45;
      uint64_t v32 = 0;
      int v36 = 0;
      id *v168 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);
      goto LABEL_129;
    }
    uint64_t v32 = 0;
    int v36 = 0;
LABEL_130:

    goto LABEL_131;
  }
  if (a4)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = *MEMORY[0x1E4F502C8];
    uint64_t v212 = *MEMORY[0x1E4F28568];
    uint64_t v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"UISessionID"];
    v213[0] = v32;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v213 forKeys:&v212 count:1];
    uint64_t v34 = v31;
    v9 = (void *)v33;
    id v35 = (id)[v30 initWithDomain:v34 code:2 userInfo:v33];
    id v8 = 0;
    int v36 = 0;
    *a4 = v35;
    goto LABEL_130;
  }
  id v8 = 0;
  int v36 = 0;
LABEL_131:

  return v36;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriPostSiriEngagement *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_UISessionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_taskID) {
    PBDataWriterWriteStringField();
  }
  if (self->_taskType) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationPath) {
    PBDataWriterWriteStringField();
  }
  if (self->_appPattern) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_requestIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  if (self->_engagementUnderstandingFeatures)
  {
    uint64_t v20 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriPostSiriEngagementFeatures *)self->_engagementUnderstandingFeatures writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_pseEvents;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        uint64_t v20 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4, (void)v16);
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v12);
  }

  if (self->_clientSessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastRequestId) {
    PBDataWriterWriteStringField();
  }
  if (self->_executionUUID) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMSiriPostSiriEngagement;
  uint64_t v5 = [(BMEventBase *)&v37 init];
  if (!v5)
  {
LABEL_43:
    id v35 = v5;
    goto LABEL_44;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_41:
    uint64_t v30 = [v6 copy];
    requestIds = v5->_requestIds;
    v5->_requestIds = (NSArray *)v30;

    uint64_t v32 = [v7 copy];
    pseEvents = v5->_pseEvents;
    v5->_pseEvents = (NSArray *)v32;

    int v34 = v4[*v10];
    if (v34) {
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v10]) {
      goto LABEL_41;
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
      goto LABEL_41;
    }
    switch((v14 >> 3))
    {
      case 1u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 24;
        goto LABEL_39;
      case 2u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 32;
        goto LABEL_39;
      case 3u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 40;
        goto LABEL_39;
      case 4u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 48;
        goto LABEL_39;
      case 5u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 56;
        goto LABEL_39;
      case 6u:
        uint64_t v24 = PBReaderReadString();
        if (!v24) {
          goto LABEL_45;
        }
        uint64_t v25 = (void *)v24;
        [v6 addObject:v24];
        goto LABEL_35;
      case 7u:
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_45;
        }
        uint64_t v26 = [[BMSiriPostSiriEngagementFeatures alloc] initByReadFrom:v4];
        if (!v26) {
          goto LABEL_45;
        }
        engagementUnderstandingFeatures = v5->_engagementUnderstandingFeatures;
        v5->_engagementUnderstandingFeatures = v26;

        PBReaderRecallMark();
        goto LABEL_40;
      case 8u:
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_45;
        }
        id v28 = [[BMSiriPostSiriEngagementSignal alloc] initByReadFrom:v4];
        if (!v28) {
          goto LABEL_45;
        }
        uint64_t v25 = v28;
        [v7 addObject:v28];
        PBReaderRecallMark();
LABEL_35:

        goto LABEL_40;
      case 9u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 88;
        goto LABEL_39;
      case 0xAu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 96;
        goto LABEL_39;
      case 0xBu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 104;
LABEL_39:
        int v29 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        goto LABEL_40;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_40:
          if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
            goto LABEL_41;
          }
          continue;
        }
LABEL_45:

LABEL_42:
        id v35 = 0;
LABEL_44:

        return v35;
    }
  }
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v16 = [(BMSiriPostSiriEngagement *)self UISessionID];
  uint64_t v3 = [(BMSiriPostSiriEngagement *)self taskID];
  id v4 = [(BMSiriPostSiriEngagement *)self taskType];
  uint64_t v5 = [(BMSiriPostSiriEngagement *)self conversationPath];
  uint64_t v6 = [(BMSiriPostSiriEngagement *)self appPattern];
  uint64_t v7 = [(BMSiriPostSiriEngagement *)self requestIds];
  uint64_t v8 = [(BMSiriPostSiriEngagement *)self engagementUnderstandingFeatures];
  uint64_t v9 = [(BMSiriPostSiriEngagement *)self pseEvents];
  uint64_t v10 = [(BMSiriPostSiriEngagement *)self clientSessionId];
  uint64_t v11 = [(BMSiriPostSiriEngagement *)self lastRequestId];
  char v12 = [(BMSiriPostSiriEngagement *)self executionUUID];
  id v15 = (id)[v14 initWithFormat:@"BMSiriPostSiriEngagement with UISessionID: %@, taskID: %@, taskType: %@, conversationPath: %@, appPattern: %@, requestIds: %@, engagementUnderstandingFeatures: %@, pseEvents: %@, clientSessionId: %@, lastRequestId: %@, executionUUID: %@", v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v15;
}

- (BMSiriPostSiriEngagement)initWithUISessionID:(id)a3 taskID:(id)a4 taskType:(id)a5 conversationPath:(id)a6 appPattern:(id)a7 requestIds:(id)a8 engagementUnderstandingFeatures:(id)a9 pseEvents:(id)a10 clientSessionId:(id)a11 lastRequestId:(id)a12 executionUUID:(id)a13
{
  id v33 = a3;
  id v25 = a4;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a8;
  id v27 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  v34.receiver = self;
  v34.super_class = (Class)BMSiriPostSiriEngagement;
  uint64_t v22 = [(BMEventBase *)&v34 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v22->_UISessionID, a3);
    objc_storeStrong((id *)&v22->_taskID, v25);
    objc_storeStrong((id *)&v22->_taskType, a5);
    objc_storeStrong((id *)&v22->_conversationPath, a6);
    objc_storeStrong((id *)&v22->_appPattern, a7);
    objc_storeStrong((id *)&v22->_requestIds, a8);
    objc_storeStrong((id *)&v22->_engagementUnderstandingFeatures, a9);
    objc_storeStrong((id *)&v22->_pseEvents, a10);
    objc_storeStrong((id *)&v22->_clientSessionId, a11);
    objc_storeStrong((id *)&v22->_lastRequestId, a12);
    objc_storeStrong((id *)&v22->_executionUUID, a13);
  }

  return v22;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"UISessionID" number:1 type:13 subMessageClass:0];
  v15[0] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskID" number:2 type:13 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskType" number:3 type:13 subMessageClass:0];
  v15[2] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationPath" number:4 type:13 subMessageClass:0];
  v15[3] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appPattern" number:5 type:13 subMessageClass:0];
  v15[4] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestIds" number:6 type:13 subMessageClass:0];
  v15[5] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"engagementUnderstandingFeatures" number:7 type:14 subMessageClass:objc_opt_class()];
  v15[6] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pseEvents" number:8 type:14 subMessageClass:objc_opt_class()];
  v15[7] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientSessionId" number:9 type:13 subMessageClass:0];
  v15[8] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastRequestId" number:10 type:13 subMessageClass:0];
  v15[9] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"executionUUID" number:11 type:13 subMessageClass:0];
  v15[10] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF69F0;
}

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"UISessionID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationPath" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appPattern" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"requestIds_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_431];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"engagementUnderstandingFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_433];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"pseEvents_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_435];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientSessionId" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastRequestId" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"executionUUID" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v12;
}

id __35__BMSiriPostSiriEngagement_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _pseEventsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __35__BMSiriPostSiriEngagement_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 engagementUnderstandingFeatures];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __35__BMSiriPostSiriEngagement_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _requestIdsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMSiriPostSiriEngagement;
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMSiriPostSiriEngagement_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  uint64_t v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 16) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end