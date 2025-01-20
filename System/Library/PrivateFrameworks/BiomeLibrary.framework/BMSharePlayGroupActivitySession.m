@interface BMSharePlayGroupActivitySession
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSharePlayGroupActivitySession)initWithIsActive:(id)a3 sourceBundleID:(id)a4 activitySessionID:(id)a5 activityID:(id)a6 messagesChatGUID:(id)a7 experienceType:(id)a8 participantHandles:(id)a9 memberHandles:(id)a10;
- (BMSharePlayGroupActivitySession)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsActive;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (NSArray)memberHandles;
- (NSArray)participantHandles;
- (NSString)activityID;
- (NSString)activitySessionID;
- (NSString)description;
- (NSString)experienceType;
- (NSString)messagesChatGUID;
- (NSString)sourceBundleID;
- (id)_memberHandlesJSONArray;
- (id)_participantHandlesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsActive:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSharePlayGroupActivitySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberHandles, 0);
  objc_storeStrong((id *)&self->_participantHandles, 0);
  objc_storeStrong((id *)&self->_experienceType, 0);
  objc_storeStrong((id *)&self->_messagesChatGUID, 0);
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_activitySessionID, 0);

  objc_storeStrong((id *)&self->_sourceBundleID, 0);
}

- (NSArray)memberHandles
{
  return self->_memberHandles;
}

- (NSArray)participantHandles
{
  return self->_participantHandles;
}

- (NSString)experienceType
{
  return self->_experienceType;
}

- (NSString)messagesChatGUID
{
  return self->_messagesChatGUID;
}

- (NSString)activityID
{
  return self->_activityID;
}

- (NSString)activitySessionID
{
  return self->_activitySessionID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (void)setHasIsActive:(BOOL)a3
{
  self->_hasIsActive = a3;
}

- (BOOL)hasIsActive
{
  return self->_hasIsActive;
}

- (BOOL)isActive
{
  return self->_isActive;
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
    if ([(BMSharePlayGroupActivitySession *)self hasIsActive]
      || [v5 hasIsActive])
    {
      if (![(BMSharePlayGroupActivitySession *)self hasIsActive]) {
        goto LABEL_30;
      }
      if (![v5 hasIsActive]) {
        goto LABEL_30;
      }
      int v6 = [(BMSharePlayGroupActivitySession *)self isActive];
      if (v6 != [v5 isActive]) {
        goto LABEL_30;
      }
    }
    v7 = [(BMSharePlayGroupActivitySession *)self sourceBundleID];
    uint64_t v8 = [v5 sourceBundleID];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMSharePlayGroupActivitySession *)self sourceBundleID];
      v11 = [v5 sourceBundleID];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_30;
      }
    }
    v14 = [(BMSharePlayGroupActivitySession *)self activitySessionID];
    uint64_t v15 = [v5 activitySessionID];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMSharePlayGroupActivitySession *)self activitySessionID];
      v18 = [v5 activitySessionID];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_30;
      }
    }
    v20 = [(BMSharePlayGroupActivitySession *)self activityID];
    uint64_t v21 = [v5 activityID];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMSharePlayGroupActivitySession *)self activityID];
      v24 = [v5 activityID];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_30;
      }
    }
    v26 = [(BMSharePlayGroupActivitySession *)self messagesChatGUID];
    uint64_t v27 = [v5 messagesChatGUID];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMSharePlayGroupActivitySession *)self messagesChatGUID];
      v30 = [v5 messagesChatGUID];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_30;
      }
    }
    v32 = [(BMSharePlayGroupActivitySession *)self experienceType];
    uint64_t v33 = [v5 experienceType];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMSharePlayGroupActivitySession *)self experienceType];
      v36 = [v5 experienceType];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_30;
      }
    }
    v38 = [(BMSharePlayGroupActivitySession *)self participantHandles];
    uint64_t v39 = [v5 participantHandles];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(BMSharePlayGroupActivitySession *)self participantHandles];
      v42 = [v5 participantHandles];
      int v43 = [v41 isEqual:v42];

      if (!v43)
      {
LABEL_30:
        char v13 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    v45 = [(BMSharePlayGroupActivitySession *)self memberHandles];
    v46 = [v5 memberHandles];
    if (v45 == v46)
    {
      char v13 = 1;
    }
    else
    {
      v47 = [(BMSharePlayGroupActivitySession *)self memberHandles];
      v48 = [v5 memberHandles];
      char v13 = [v47 isEqual:v48];
    }
    goto LABEL_31;
  }
  char v13 = 0;
LABEL_32:

  return v13;
}

- (id)jsonDictionary
{
  v28[8] = *MEMORY[0x1E4F143B8];
  if ([(BMSharePlayGroupActivitySession *)self hasIsActive])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSharePlayGroupActivitySession isActive](self, "isActive"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(BMSharePlayGroupActivitySession *)self sourceBundleID];
  uint64_t v5 = [(BMSharePlayGroupActivitySession *)self activitySessionID];
  int v6 = [(BMSharePlayGroupActivitySession *)self activityID];
  v7 = [(BMSharePlayGroupActivitySession *)self messagesChatGUID];
  uint64_t v8 = [(BMSharePlayGroupActivitySession *)self experienceType];
  v9 = [(BMSharePlayGroupActivitySession *)self _participantHandlesJSONArray];
  v10 = [(BMSharePlayGroupActivitySession *)self _memberHandlesJSONArray];
  v27[0] = @"isActive";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v11;
  v28[0] = v11;
  v27[1] = @"sourceBundleID";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = (void *)v12;
  v28[1] = v12;
  v27[2] = @"activitySessionID";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v3;
  v20 = (void *)v13;
  v28[2] = v13;
  v27[3] = @"activityID";
  v14 = v6;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v4;
  v28[3] = v14;
  v27[4] = @"messagesChatGUID";
  uint64_t v15 = v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v5;
  v28[4] = v15;
  v27[5] = @"experienceType";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v16;
  v27[6] = @"participantHandles";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v17;
  v27[7] = @"memberHandles";
  v18 = v10;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (v10)
  {
    if (v9) {
      goto LABEL_22;
    }
LABEL_34:

    if (v8) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }

  if (!v9) {
    goto LABEL_34;
  }
LABEL_22:
  if (v8) {
    goto LABEL_23;
  }
LABEL_35:

LABEL_23:
  if (!v7) {

  }
  if (!v6) {
  if (v24)
  }
  {
    if (v25) {
      goto LABEL_29;
    }
LABEL_37:

    if (v26) {
      goto LABEL_30;
    }
    goto LABEL_38;
  }

  if (!v25) {
    goto LABEL_37;
  }
LABEL_29:
  if (v26) {
    goto LABEL_30;
  }
LABEL_38:

LABEL_30:

  return v23;
}

- (id)_memberHandlesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMSharePlayGroupActivitySession *)self memberHandles];
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

- (id)_participantHandlesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMSharePlayGroupActivitySession *)self participantHandles];
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

- (BMSharePlayGroupActivitySession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v155[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"isActive"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = a4;
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v154 = *MEMORY[0x1E4F28568];
        v30 = self;
        id v31 = [NSString alloc];
        uint64_t v97 = objc_opt_class();
        v32 = v31;
        self = v30;
        uint64_t v33 = (void *)[v32 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v97, @"isActive"];
        v155[0] = v33;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:&v154 count:1];
        id v8 = 0;
        v34 = 0;
        id *v28 = (id)[v27 initWithDomain:v29 code:2 userInfo:v9];
        goto LABEL_99;
      }
      id v8 = 0;
      v34 = 0;
      goto LABEL_100;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"sourceBundleID"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        v118 = a4;
        uint64_t v36 = *MEMORY[0x1E4F502C8];
        uint64_t v152 = *MEMORY[0x1E4F28568];
        int v37 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceBundleID"];
        v153 = v37;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        uint64_t v39 = v35;
        long long v10 = (void *)v38;
        uint64_t v33 = 0;
        v34 = 0;
        id *v118 = (id)[v39 initWithDomain:v36 code:2 userInfo:v38];
        goto LABEL_98;
      }
      uint64_t v33 = 0;
      v34 = 0;
      goto LABEL_99;
    }
    id v116 = v9;
  }
  else
  {
    id v116 = 0;
  }
  long long v10 = [v6 objectForKeyedSubscript:@"activitySessionID"];
  id v115 = v8;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v40 = v10;
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        v119 = a4;
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v150 = *MEMORY[0x1E4F28568];
        int v43 = v9;
        id v44 = [NSString alloc];
        uint64_t v98 = objc_opt_class();
        v45 = v44;
        v9 = v43;
        id v11 = (id)[v45 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v98, @"activitySessionID"];
        id v151 = v11;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
        v47 = v41;
        long long v10 = v40;
        v113 = (void *)v46;
        int v37 = 0;
        v34 = 0;
        uint64_t v33 = v116;
        id *v119 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v42, 2);
        goto LABEL_97;
      }
      int v37 = 0;
      v34 = 0;
      uint64_t v33 = v116;
      goto LABEL_98;
    }
    id v111 = v10;
  }
  else
  {
    id v111 = 0;
  }
  id v11 = [v6 objectForKeyedSubscript:@"activityID"];
  v112 = self;
  v113 = v11;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v34 = 0;
          uint64_t v33 = v116;
          int v37 = v111;
          goto LABEL_97;
        }
        v53 = v10;
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        v120 = a4;
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v148 = *MEMORY[0x1E4F28568];
        v56 = v9;
        id v57 = [NSString alloc];
        uint64_t v99 = objc_opt_class();
        v58 = v57;
        v9 = v56;
        id v12 = (id)[v58 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v99, @"activityID"];
        id v149 = v12;
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
        v60 = v54;
        long long v10 = v53;
        v110 = (void *)v59;
        id v11 = 0;
        v34 = 0;
        id *v120 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v55, 2);
        goto LABEL_102;
      }
      id v11 = v11;
    }
  }
  id v12 = [v6 objectForKeyedSubscript:@"messagesChatGUID"];
  v110 = v12;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = 0;
      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v12;
      goto LABEL_26;
    }
    if (a4)
    {
      v62 = v10;
      id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
      v121 = a4;
      uint64_t v64 = *MEMORY[0x1E4F502C8];
      uint64_t v146 = *MEMORY[0x1E4F28568];
      v65 = v9;
      id v66 = [NSString alloc];
      uint64_t v100 = objc_opt_class();
      v67 = v66;
      v9 = v65;
      v68 = (id *)[v67 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v100, @"messagesChatGUID"];
      v147 = v68;
      uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
      v70 = v63;
      long long v10 = v62;
      uint64_t v71 = v64;
      a4 = v68;
      v109 = (void *)v69;
      id v12 = 0;
      v34 = 0;
      id *v121 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2);
      goto LABEL_104;
    }
    id v12 = 0;
    v34 = 0;
LABEL_102:
    uint64_t v33 = v116;
    int v37 = v111;
    goto LABEL_96;
  }
LABEL_26:
  uint64_t v13 = [v6 objectForKeyedSubscript:@"experienceType"];
  v106 = v10;
  v107 = v9;
  v109 = (void *)v13;
  if (v13)
  {
    v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v117 = a4;
        v108 = v14;
        goto LABEL_29;
      }
      if (a4)
      {
        id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v73 = v12;
        v74 = v7;
        uint64_t v75 = *MEMORY[0x1E4F502C8];
        uint64_t v144 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"experienceType"];
        id v145 = v15;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
        v18 = v76 = a4;
        uint64_t v77 = v75;
        uint64_t v7 = v74;
        id v12 = v73;
        v108 = 0;
        v34 = 0;
        id *v76 = (id)[v72 initWithDomain:v77 code:2 userInfo:v18];
        uint64_t v33 = v116;
        int v37 = v111;
        goto LABEL_93;
      }
      v34 = 0;
LABEL_104:
      uint64_t v33 = v116;
      int v37 = v111;
      goto LABEL_95;
    }
  }
  v117 = a4;
  v108 = 0;
LABEL_29:
  id v15 = [v6 objectForKeyedSubscript:@"participantHandles"];
  v16 = [MEMORY[0x1E4F1CA98] null];
  int v17 = [v15 isEqual:v16];

  v105 = v7;
  if (v17)
  {
    id v103 = v11;
    id v104 = v12;

    id v15 = 0;
  }
  else
  {
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v117)
        {
          id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v84 = v11;
          uint64_t v85 = *MEMORY[0x1E4F502C8];
          uint64_t v142 = *MEMORY[0x1E4F28568];
          v18 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"participantHandles"];
          v143 = v18;
          id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
          v86 = v83;
          uint64_t v7 = v105;
          uint64_t v87 = v85;
          id v11 = v84;
          v34 = 0;
          id *v117 = (id)[v86 initWithDomain:v87 code:2 userInfo:v24];
          uint64_t v33 = v116;
          int v37 = v111;
          goto LABEL_92;
        }
        v34 = 0;
        v9 = v107;
        uint64_t v33 = v116;
        int v37 = v111;
        goto LABEL_94;
      }
    }
    id v103 = v11;
    id v104 = v12;
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v15 = v15;
  uint64_t v19 = [v15 countByEnumeratingWithState:&v126 objects:v141 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v127 != v21) {
          objc_enumerationMutation(v15);
        }
        uint64_t v23 = *(void *)(*((void *)&v126 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v117)
          {
            id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v49 = *MEMORY[0x1E4F502C8];
            uint64_t v139 = *MEMORY[0x1E4F28568];
            v114 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"participantHandles"];
            v140 = v114;
            v50 = (void *)MEMORY[0x1E4F1C9E8];
            v51 = &v140;
            v52 = &v139;
            goto LABEL_59;
          }
LABEL_63:
          v34 = 0;
          id v24 = v15;
          id v12 = v104;
          uint64_t v7 = v105;
LABEL_64:
          uint64_t v33 = v116;
          int v37 = v111;
          id v11 = v103;
          goto LABEL_92;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v117) {
            goto LABEL_63;
          }
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v49 = *MEMORY[0x1E4F502C8];
          uint64_t v137 = *MEMORY[0x1E4F28568];
          v114 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"participantHandles"];
          v138 = v114;
          v50 = (void *)MEMORY[0x1E4F1C9E8];
          v51 = &v138;
          v52 = &v137;
LABEL_59:
          v61 = [v50 dictionaryWithObjects:v51 forKeys:v52 count:1];
          id v12 = v104;
          uint64_t v7 = v105;
          uint64_t v33 = v116;
          int v37 = v111;
          id *v117 = (id)[v48 initWithDomain:v49 code:2 userInfo:v61];

          v34 = 0;
          id v24 = v15;
          goto LABEL_60;
        }
        [v18 addObject:v23];
      }
      uint64_t v20 = [v15 countByEnumeratingWithState:&v126 objects:v141 count:16];
    }
    while (v20);
  }

  id v24 = [v6 objectForKeyedSubscript:@"memberHandles"];
  int v25 = [MEMORY[0x1E4F1CA98] null];
  int v26 = [v24 isEqual:v25];

  if (v26)
  {

    id v24 = 0;
  }
  else if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = v104;
      uint64_t v7 = v105;
      if (!v117)
      {
        v34 = 0;
        goto LABEL_64;
      }
      id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v95 = *MEMORY[0x1E4F502C8];
      uint64_t v135 = *MEMORY[0x1E4F28568];
      v114 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"memberHandles"];
      v136 = v114;
      v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      id *v117 = (id)[v94 initWithDomain:v95 code:2 userInfo:v96];

      v34 = 0;
      uint64_t v33 = v116;
      int v37 = v111;
LABEL_60:
      id v11 = v103;
      goto LABEL_91;
    }
  }
  v114 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v24 = v24;
  uint64_t v78 = [v24 countByEnumeratingWithState:&v122 objects:v134 count:16];
  if (!v78) {
    goto LABEL_79;
  }
  uint64_t v79 = v78;
  uint64_t v80 = *(void *)v123;
  while (2)
  {
    for (uint64_t j = 0; j != v79; ++j)
    {
      if (*(void *)v123 != v80) {
        objc_enumerationMutation(v24);
      }
      uint64_t v82 = *(void *)(*((void *)&v122 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v105;
        uint64_t v33 = v116;
        int v37 = v111;
        if (v117)
        {
          id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v101 = *MEMORY[0x1E4F502C8];
          uint64_t v132 = *MEMORY[0x1E4F28568];
          v88 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"memberHandles"];
          v133 = v88;
          v89 = (void *)MEMORY[0x1E4F1C9E8];
          v90 = &v133;
          v91 = &v132;
LABEL_89:
          v92 = [v89 dictionaryWithObjects:v90 forKeys:v91 count:1];
          id *v117 = (id)[v102 initWithDomain:v101 code:2 userInfo:v92];
        }
LABEL_90:

        v34 = 0;
        id v11 = v103;
        id v12 = v104;
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v7 = v105;
        uint64_t v33 = v116;
        int v37 = v111;
        if (v117)
        {
          id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v101 = *MEMORY[0x1E4F502C8];
          uint64_t v130 = *MEMORY[0x1E4F28568];
          v88 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"memberHandles"];
          v131 = v88;
          v89 = (void *)MEMORY[0x1E4F1C9E8];
          v90 = &v131;
          v91 = &v130;
          goto LABEL_89;
        }
        goto LABEL_90;
      }
      [v114 addObject:v82];
    }
    uint64_t v79 = [v24 countByEnumeratingWithState:&v122 objects:v134 count:16];
    if (v79) {
      continue;
    }
    break;
  }
LABEL_79:

  int v37 = v111;
  uint64_t v33 = v116;
  id v11 = v103;
  id v12 = v104;
  v34 = [(BMSharePlayGroupActivitySession *)v112 initWithIsActive:v115 sourceBundleID:v116 activitySessionID:v111 activityID:v103 messagesChatGUID:v104 experienceType:v108 participantHandles:v18 memberHandles:v114];
  v112 = v34;
  uint64_t v7 = v105;
LABEL_91:

LABEL_92:
LABEL_93:

  v9 = v107;
LABEL_94:

  long long v10 = v106;
  a4 = v108;
LABEL_95:

LABEL_96:
  self = v112;
LABEL_97:

  id v8 = v115;
LABEL_98:

LABEL_99:
LABEL_100:

  return v34;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSharePlayGroupActivitySession *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasIsActive) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_sourceBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_activitySessionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_activityID) {
    PBDataWriterWriteStringField();
  }
  if (self->_messagesChatGUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_experienceType) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_participantHandles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = self->_memberHandles;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMSharePlayGroupActivitySession;
  uint64_t v5 = [(BMEventBase *)&v41 init];
  if (!v5)
  {
LABEL_47:
    uint64_t v39 = v5;
    goto LABEL_48;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  long long v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_45:
    uint64_t v34 = [v6 copy];
    participantHandles = v5->_participantHandles;
    v5->_participantHandles = (NSArray *)v34;

    uint64_t v36 = [v7 copy];
    memberHandles = v5->_memberHandles;
    v5->_memberHandles = (NSArray *)v36;

    int v38 = v4[*v10];
    if (v38) {
      goto LABEL_46;
    }
    goto LABEL_47;
  }
  uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v10]) {
      goto LABEL_45;
    }
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *v8;
      unint64_t v16 = *(void *)&v4[v15];
      if (v16 == -1 || v16 >= *(void *)&v4[*v9]) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
      *(void *)&v4[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0) {
        goto LABEL_13;
      }
      v12 += 7;
      BOOL v18 = v13++ >= 9;
      if (v18)
      {
        unint64_t v14 = 0;
        int v19 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    int v19 = v4[*v10];
    if (v4[*v10]) {
      unint64_t v14 = 0;
    }
LABEL_15:
    if (v19 || (v14 & 7) == 4) {
      goto LABEL_45;
    }
    switch((v14 >> 3))
    {
      case 1u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasIsActive = 1;
        while (1)
        {
          uint64_t v24 = *v8;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 == -1 || v25 >= *(void *)&v4[*v9]) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v11] + v25);
          *(void *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_41;
          }
          v21 += 7;
          BOOL v18 = v22++ >= 9;
          if (v18)
          {
            uint64_t v23 = 0;
            goto LABEL_43;
          }
        }
        v4[*v10] = 1;
LABEL_41:
        if (v4[*v10]) {
          uint64_t v23 = 0;
        }
LABEL_43:
        v5->_isActive = v23 != 0;
        goto LABEL_44;
      case 2u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 24;
        goto LABEL_34;
      case 3u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 32;
        goto LABEL_34;
      case 4u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 40;
        goto LABEL_34;
      case 5u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 48;
        goto LABEL_34;
      case 6u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 56;
LABEL_34:
        uint64_t v29 = *(Class *)((char *)&v5->super.super.isa + v28);
        *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

        goto LABEL_44;
      case 7u:
        uint64_t v30 = PBReaderReadString();
        if (!v30) {
          goto LABEL_49;
        }
        id v31 = (void *)v30;
        v32 = v6;
        goto LABEL_39;
      case 8u:
        uint64_t v33 = PBReaderReadString();
        if (!v33) {
          goto LABEL_49;
        }
        id v31 = (void *)v33;
        v32 = v7;
LABEL_39:
        [v32 addObject:v31];

        goto LABEL_44;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_44:
          if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
            goto LABEL_45;
          }
          continue;
        }
LABEL_49:

LABEL_46:
        uint64_t v39 = 0;
LABEL_48:

        return v39;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSharePlayGroupActivitySession isActive](self, "isActive"));
  uint64_t v5 = [(BMSharePlayGroupActivitySession *)self sourceBundleID];
  uint64_t v6 = [(BMSharePlayGroupActivitySession *)self activitySessionID];
  uint64_t v7 = [(BMSharePlayGroupActivitySession *)self activityID];
  uint64_t v8 = [(BMSharePlayGroupActivitySession *)self messagesChatGUID];
  uint64_t v9 = [(BMSharePlayGroupActivitySession *)self experienceType];
  long long v10 = [(BMSharePlayGroupActivitySession *)self participantHandles];
  uint64_t v11 = [(BMSharePlayGroupActivitySession *)self memberHandles];
  char v12 = (void *)[v3 initWithFormat:@"BMSharePlayGroupActivitySession with isActive: %@, sourceBundleID: %@, activitySessionID: %@, activityID: %@, messagesChatGUID: %@, experienceType: %@, participantHandles: %@, memberHandles: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSharePlayGroupActivitySession)initWithIsActive:(id)a3 sourceBundleID:(id)a4 activitySessionID:(id)a5 activityID:(id)a6 messagesChatGUID:(id)a7 experienceType:(id)a8 participantHandles:(id)a9 memberHandles:(id)a10
{
  id v16 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v21 = a8;
  id v20 = a9;
  id v17 = a10;
  v26.receiver = self;
  v26.super_class = (Class)BMSharePlayGroupActivitySession;
  BOOL v18 = [(BMEventBase *)&v26 init];
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v20, v21, v22, v23, v24, v25);
    if (v16)
    {
      v18->_hasIsActive = 1;
      v18->_isActive = [v16 BOOLValue];
    }
    else
    {
      v18->_hasIsActive = 0;
      v18->_isActive = 0;
    }
    objc_storeStrong((id *)&v18->_sourceBundleID, a4);
    objc_storeStrong((id *)&v18->_activitySessionID, a5);
    objc_storeStrong((id *)&v18->_activityID, a6);
    objc_storeStrong((id *)&v18->_messagesChatGUID, a7);
    objc_storeStrong((id *)&v18->_experienceType, a8);
    objc_storeStrong((id *)&v18->_participantHandles, a9);
    objc_storeStrong((id *)&v18->_memberHandles, a10);
  }

  return v18;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActive" number:1 type:12 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceBundleID" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activitySessionID" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityID" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messagesChatGUID" number:5 type:13 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experienceType" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"participantHandles" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"memberHandles" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3FA8;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActive" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceBundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activitySessionID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messagesChatGUID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experienceType" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"participantHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_17432];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"memberHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_56];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

id __42__BMSharePlayGroupActivitySession_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _memberHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __42__BMSharePlayGroupActivitySession_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _participantHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMSharePlayGroupActivitySession alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[5] = 1;
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
  return 1;
}

@end