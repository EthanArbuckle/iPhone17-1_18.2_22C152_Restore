@interface BMSiriPostSiriEngagementFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriPostSiriEngagementFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriPostSiriEngagementFeatures)initWithTaskSuccess:(int)a3 isUserAbandoned:(id)a4 isUserCancelled:(id)a5 isSiriCompleted:(id)a6 isPromptInteraction:(id)a7 isConfirmInteraction:(id)a8 isDisambiguateInteraction:(id)a9 isUnsupportedPromptInteraction:(id)a10;
- (BOOL)hasIsConfirmInteraction;
- (BOOL)hasIsDisambiguateInteraction;
- (BOOL)hasIsPromptInteraction;
- (BOOL)hasIsSiriCompleted;
- (BOOL)hasIsUnsupportedPromptInteraction;
- (BOOL)hasIsUserAbandoned;
- (BOOL)hasIsUserCancelled;
- (BOOL)isConfirmInteraction;
- (BOOL)isDisambiguateInteraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPromptInteraction;
- (BOOL)isSiriCompleted;
- (BOOL)isUnsupportedPromptInteraction;
- (BOOL)isUserAbandoned;
- (BOOL)isUserCancelled;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)taskSuccess;
- (unsigned)dataVersion;
- (void)setHasIsConfirmInteraction:(BOOL)a3;
- (void)setHasIsDisambiguateInteraction:(BOOL)a3;
- (void)setHasIsPromptInteraction:(BOOL)a3;
- (void)setHasIsSiriCompleted:(BOOL)a3;
- (void)setHasIsUnsupportedPromptInteraction:(BOOL)a3;
- (void)setHasIsUserAbandoned:(BOOL)a3;
- (void)setHasIsUserCancelled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriPostSiriEngagementFeatures

- (void)setHasIsUnsupportedPromptInteraction:(BOOL)a3
{
  self->_hasIsUnsupportedPromptInteraction = a3;
}

- (BOOL)hasIsUnsupportedPromptInteraction
{
  return self->_hasIsUnsupportedPromptInteraction;
}

- (BOOL)isUnsupportedPromptInteraction
{
  return self->_isUnsupportedPromptInteraction;
}

- (void)setHasIsDisambiguateInteraction:(BOOL)a3
{
  self->_hasIsDisambiguateInteraction = a3;
}

- (BOOL)hasIsDisambiguateInteraction
{
  return self->_hasIsDisambiguateInteraction;
}

- (BOOL)isDisambiguateInteraction
{
  return self->_isDisambiguateInteraction;
}

- (void)setHasIsConfirmInteraction:(BOOL)a3
{
  self->_hasIsConfirmInteraction = a3;
}

- (BOOL)hasIsConfirmInteraction
{
  return self->_hasIsConfirmInteraction;
}

- (BOOL)isConfirmInteraction
{
  return self->_isConfirmInteraction;
}

- (void)setHasIsPromptInteraction:(BOOL)a3
{
  self->_hasIsPromptInteraction = a3;
}

- (BOOL)hasIsPromptInteraction
{
  return self->_hasIsPromptInteraction;
}

- (BOOL)isPromptInteraction
{
  return self->_isPromptInteraction;
}

- (void)setHasIsSiriCompleted:(BOOL)a3
{
  self->_hasIsSiriCompleted = a3;
}

- (BOOL)hasIsSiriCompleted
{
  return self->_hasIsSiriCompleted;
}

- (BOOL)isSiriCompleted
{
  return self->_isSiriCompleted;
}

- (void)setHasIsUserCancelled:(BOOL)a3
{
  self->_hasIsUserCancelled = a3;
}

- (BOOL)hasIsUserCancelled
{
  return self->_hasIsUserCancelled;
}

- (BOOL)isUserCancelled
{
  return self->_isUserCancelled;
}

- (void)setHasIsUserAbandoned:(BOOL)a3
{
  self->_hasIsUserAbandoned = a3;
}

- (BOOL)hasIsUserAbandoned
{
  return self->_hasIsUserAbandoned;
}

- (BOOL)isUserAbandoned
{
  return self->_isUserAbandoned;
}

- (int)taskSuccess
{
  return self->_taskSuccess;
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
    int v6 = [(BMSiriPostSiriEngagementFeatures *)self taskSuccess];
    if (v6 != [v5 taskSuccess]) {
      goto LABEL_39;
    }
    if ([(BMSiriPostSiriEngagementFeatures *)self hasIsUserAbandoned]
      || [v5 hasIsUserAbandoned])
    {
      if (![(BMSiriPostSiriEngagementFeatures *)self hasIsUserAbandoned]) {
        goto LABEL_39;
      }
      if (![v5 hasIsUserAbandoned]) {
        goto LABEL_39;
      }
      int v7 = [(BMSiriPostSiriEngagementFeatures *)self isUserAbandoned];
      if (v7 != [v5 isUserAbandoned]) {
        goto LABEL_39;
      }
    }
    if ([(BMSiriPostSiriEngagementFeatures *)self hasIsUserCancelled]
      || [v5 hasIsUserCancelled])
    {
      if (![(BMSiriPostSiriEngagementFeatures *)self hasIsUserCancelled]) {
        goto LABEL_39;
      }
      if (![v5 hasIsUserCancelled]) {
        goto LABEL_39;
      }
      int v8 = [(BMSiriPostSiriEngagementFeatures *)self isUserCancelled];
      if (v8 != [v5 isUserCancelled]) {
        goto LABEL_39;
      }
    }
    if ([(BMSiriPostSiriEngagementFeatures *)self hasIsSiriCompleted]
      || [v5 hasIsSiriCompleted])
    {
      if (![(BMSiriPostSiriEngagementFeatures *)self hasIsSiriCompleted]) {
        goto LABEL_39;
      }
      if (![v5 hasIsSiriCompleted]) {
        goto LABEL_39;
      }
      int v9 = [(BMSiriPostSiriEngagementFeatures *)self isSiriCompleted];
      if (v9 != [v5 isSiriCompleted]) {
        goto LABEL_39;
      }
    }
    if ([(BMSiriPostSiriEngagementFeatures *)self hasIsPromptInteraction]
      || [v5 hasIsPromptInteraction])
    {
      if (![(BMSiriPostSiriEngagementFeatures *)self hasIsPromptInteraction]) {
        goto LABEL_39;
      }
      if (![v5 hasIsPromptInteraction]) {
        goto LABEL_39;
      }
      int v10 = [(BMSiriPostSiriEngagementFeatures *)self isPromptInteraction];
      if (v10 != [v5 isPromptInteraction]) {
        goto LABEL_39;
      }
    }
    if ([(BMSiriPostSiriEngagementFeatures *)self hasIsConfirmInteraction]
      || [v5 hasIsConfirmInteraction])
    {
      if (![(BMSiriPostSiriEngagementFeatures *)self hasIsConfirmInteraction]) {
        goto LABEL_39;
      }
      if (![v5 hasIsConfirmInteraction]) {
        goto LABEL_39;
      }
      int v11 = [(BMSiriPostSiriEngagementFeatures *)self isConfirmInteraction];
      if (v11 != [v5 isConfirmInteraction]) {
        goto LABEL_39;
      }
    }
    if ([(BMSiriPostSiriEngagementFeatures *)self hasIsDisambiguateInteraction]
      || [v5 hasIsDisambiguateInteraction])
    {
      if (![(BMSiriPostSiriEngagementFeatures *)self hasIsDisambiguateInteraction]) {
        goto LABEL_39;
      }
      if (![v5 hasIsDisambiguateInteraction]) {
        goto LABEL_39;
      }
      int v12 = [(BMSiriPostSiriEngagementFeatures *)self isDisambiguateInteraction];
      if (v12 != [v5 isDisambiguateInteraction]) {
        goto LABEL_39;
      }
    }
    if (!-[BMSiriPostSiriEngagementFeatures hasIsUnsupportedPromptInteraction](self, "hasIsUnsupportedPromptInteraction")&& ![v5 hasIsUnsupportedPromptInteraction])
    {
      LOBYTE(v14) = 1;
      goto LABEL_40;
    }
    if (-[BMSiriPostSiriEngagementFeatures hasIsUnsupportedPromptInteraction](self, "hasIsUnsupportedPromptInteraction")&& [v5 hasIsUnsupportedPromptInteraction])
    {
      BOOL v13 = [(BMSiriPostSiriEngagementFeatures *)self isUnsupportedPromptInteraction];
      int v14 = v13 ^ [v5 isUnsupportedPromptInteraction] ^ 1;
    }
    else
    {
LABEL_39:
      LOBYTE(v14) = 0;
    }
LABEL_40:

    goto LABEL_41;
  }
  LOBYTE(v14) = 0;
LABEL_41:

  return v14;
}

- (id)jsonDictionary
{
  v29[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriPostSiriEngagementFeatures taskSuccess](self, "taskSuccess"));
  if ([(BMSiriPostSiriEngagementFeatures *)self hasIsUserAbandoned])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserAbandoned](self, "isUserAbandoned"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMSiriPostSiriEngagementFeatures *)self hasIsUserCancelled])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserCancelled](self, "isUserCancelled"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(BMSiriPostSiriEngagementFeatures *)self hasIsSiriCompleted])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isSiriCompleted](self, "isSiriCompleted"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([(BMSiriPostSiriEngagementFeatures *)self hasIsPromptInteraction])
  {
    v27 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isPromptInteraction](self, "isPromptInteraction"));
  }
  else
  {
    v27 = 0;
  }
  if ([(BMSiriPostSiriEngagementFeatures *)self hasIsConfirmInteraction])
  {
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isConfirmInteraction](self, "isConfirmInteraction"));
  }
  else
  {
    int v7 = 0;
  }
  if ([(BMSiriPostSiriEngagementFeatures *)self hasIsDisambiguateInteraction])
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isDisambiguateInteraction](self, "isDisambiguateInteraction"));
  }
  else
  {
    int v8 = 0;
  }
  if ([(BMSiriPostSiriEngagementFeatures *)self hasIsUnsupportedPromptInteraction])
  {
    int v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUnsupportedPromptInteraction](self, "isUnsupportedPromptInteraction"));
  }
  else
  {
    int v9 = 0;
  }
  v28[0] = @"taskSuccess";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v10;
  v29[0] = v10;
  v28[1] = @"isUserAbandoned";
  uint64_t v11 = v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v3;
  v22 = (void *)v11;
  v29[1] = v11;
  v28[2] = @"isUserCancelled";
  uint64_t v12 = v5;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v4;
  v21 = (void *)v12;
  v29[2] = v12;
  v28[3] = @"isSiriCompleted";
  BOOL v13 = (void *)v6;
  if (!v6)
  {
    BOOL v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v5;
  v29[3] = v13;
  v28[4] = @"isPromptInteraction";
  int v14 = v27;
  if (!v27)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v15 = (void *)v6;
  v29[4] = v14;
  v28[5] = @"isConfirmInteraction";
  v16 = v7;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[5] = v16;
  v28[6] = @"isDisambiguateInteraction";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[6] = v17;
  v28[7] = @"isUnsupportedPromptInteraction";
  v18 = v9;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[7] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:8];
  if (v9)
  {
    if (v8) {
      goto LABEL_40;
    }
LABEL_53:

    if (v7) {
      goto LABEL_41;
    }
    goto LABEL_54;
  }

  if (!v8) {
    goto LABEL_53;
  }
LABEL_40:
  if (v7) {
    goto LABEL_41;
  }
LABEL_54:

LABEL_41:
  if (!v27) {

  }
  if (!v15) {
  if (!v24)
  }

  if (v25)
  {
    if (v26) {
      goto LABEL_49;
    }
  }
  else
  {

    if (v26) {
      goto LABEL_49;
    }
  }

LABEL_49:

  return v19;
}

- (BMSiriPostSiriEngagementFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"taskSuccess"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v8 = 0;
LABEL_9:
    uint64_t v10 = [v6 objectForKeyedSubscript:@"isUserAbandoned"];
    v81 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v24 = 0;
          goto LABEL_43;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v99 = *MEMORY[0x1E4F28568];
        v30 = v10;
        id v31 = [NSString alloc];
        uint64_t v70 = objc_opt_class();
        v32 = v31;
        uint64_t v10 = v30;
        v26 = (void *)[v32 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v70, @"isUserAbandoned"];
        v100 = v26;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        id v33 = (id)[v28 initWithDomain:v29 code:2 userInfo:v12];
        v24 = 0;
        id v11 = 0;
        id *v81 = v33;
        goto LABEL_42;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"isUserCancelled"];
    v86 = v7;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v26 = 0;
          v24 = 0;
          goto LABEL_42;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v80 = v11;
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v97 = *MEMORY[0x1E4F28568];
        v36 = v10;
        id v37 = [NSString alloc];
        uint64_t v71 = objc_opt_class();
        v38 = v37;
        uint64_t v10 = v36;
        id v85 = (id)[v38 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v71, @"isUserCancelled"];
        id v98 = v85;
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        v40 = v34;
        v25 = (void *)v39;
        uint64_t v41 = v35;
        id v11 = v80;
        v24 = 0;
        v26 = 0;
        id *v81 = (id)[v40 initWithDomain:v41 code:2 userInfo:v39];
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      v17 = v12;
      int v14 = self;
      BOOL v13 = v17;
      id v84 = v17;
    }
    else
    {
      BOOL v13 = v12;
      int v14 = self;
      id v84 = 0;
    }
    v15 = [v6 objectForKeyedSubscript:@"isSiriCompleted"];
    v83 = v8;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v85 = 0;
          v24 = 0;
          v26 = v84;
          v25 = v15;
          self = v14;
          uint64_t v12 = v13;
          int v7 = v86;
          goto LABEL_41;
        }
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v43 = v11;
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        v45 = v10;
        id v46 = [NSString alloc];
        uint64_t v72 = objc_opt_class();
        v47 = v46;
        uint64_t v10 = v45;
        id v82 = (id)[v47 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v72, @"isSiriCompleted"];
        id v96 = v82;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        v48 = v42;
        v25 = v15;
        uint64_t v49 = v44;
        id v11 = v43;
        v24 = 0;
        id v85 = 0;
        id *v81 = (id)[v48 initWithDomain:v49 code:2 userInfo:v16];
        self = v14;
        uint64_t v12 = v13;
        int v7 = v86;
        goto LABEL_40;
      }
      v77 = v15;
      id v85 = v15;
    }
    else
    {
      v77 = v15;
      id v85 = 0;
    }
    v16 = [v6 objectForKeyedSubscript:@"isPromptInteraction"];
    self = v14;
    id v79 = v11;
    if (v16)
    {
      objc_opt_class();
      uint64_t v12 = v13;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        int v7 = v86;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v82 = 0;
            v24 = 0;
            v25 = v77;
            goto LABEL_40;
          }
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v93 = *MEMORY[0x1E4F28568];
          v52 = v10;
          id v53 = [NSString alloc];
          uint64_t v73 = objc_opt_class();
          v54 = v53;
          uint64_t v10 = v52;
          id v78 = (id)[v54 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v73, @"isPromptInteraction"];
          id v94 = v78;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          uint64_t v55 = v51;
          id v11 = v79;
          v24 = 0;
          id v82 = 0;
          id *v81 = (id)[v50 initWithDomain:v55 code:2 userInfo:v18];
LABEL_39:
          v25 = v77;

LABEL_40:
          int v8 = v83;
          v26 = v84;
          goto LABEL_41;
        }
        id v82 = v16;
LABEL_27:
        v18 = [v6 objectForKeyedSubscript:@"isConfirmInteraction"];
        v76 = v10;
        if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v78 = 0;
              v24 = 0;
              goto LABEL_39;
            }
            v20 = self;
            id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v62 = *MEMORY[0x1E4F502C8];
            uint64_t v91 = *MEMORY[0x1E4F28568];
            id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isConfirmInteraction"];
            id v92 = v21;
            v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            v63 = v61;
            uint64_t v10 = v76;
            id v64 = (id)[v63 initWithDomain:v62 code:2 userInfo:v19];
            v24 = 0;
            id v78 = 0;
            *a4 = v64;
            goto LABEL_38;
          }
          id v78 = v18;
        }
        else
        {
          id v78 = 0;
        }
        v19 = [v6 objectForKeyedSubscript:@"isDisambiguateInteraction"];
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          v20 = self;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v21 = 0;
              v24 = 0;
              goto LABEL_38;
            }
            id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v66 = *MEMORY[0x1E4F502C8];
            uint64_t v89 = *MEMORY[0x1E4F28568];
            id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isDisambiguateInteraction"];
            id v90 = v23;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
            id v67 = (id)[v65 initWithDomain:v66 code:2 userInfo:v22];
            v24 = 0;
            id v21 = 0;
            id *v81 = v67;
            goto LABEL_37;
          }
          id v21 = v19;
        }
        else
        {
          v20 = self;
          id v21 = 0;
        }
        v22 = [v6 objectForKeyedSubscript:@"isUnsupportedPromptInteraction"];
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v81)
            {
              id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v74 = *MEMORY[0x1E4F502C8];
              uint64_t v87 = *MEMORY[0x1E4F28568];
              v68 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isUnsupportedPromptInteraction"];
              v88 = v68;
              v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
              id *v81 = (id)[v75 initWithDomain:v74 code:2 userInfo:v69];
            }
            id v23 = 0;
            v24 = 0;
            goto LABEL_37;
          }
          id v23 = v22;
        }
        else
        {
          id v23 = 0;
        }
        v24 = -[BMSiriPostSiriEngagementFeatures initWithTaskSuccess:isUserAbandoned:isUserCancelled:isSiriCompleted:isPromptInteraction:isConfirmInteraction:isDisambiguateInteraction:isUnsupportedPromptInteraction:](v20, "initWithTaskSuccess:isUserAbandoned:isUserCancelled:isSiriCompleted:isPromptInteraction:isConfirmInteraction:isDisambiguateInteraction:isUnsupportedPromptInteraction:", [v83 intValue], v79, v84, v85, v82, v78, v21, v23);
        v20 = v24;
LABEL_37:

        uint64_t v10 = v76;
LABEL_38:

        self = v20;
        int v7 = v86;
        id v11 = v79;
        goto LABEL_39;
      }
      id v82 = 0;
    }
    else
    {
      id v82 = 0;
      uint64_t v12 = v13;
    }
    int v7 = v86;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    int v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMSiriPostSiriEngagementFeaturesTaskSuccessFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    int v8 = 0;
    v24 = 0;
    goto LABEL_44;
  }
  v56 = a4;
  id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v58 = *MEMORY[0x1E4F502C8];
  uint64_t v101 = *MEMORY[0x1E4F28568];
  uint64_t v59 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"taskSuccess"];
  v102[0] = v59;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
  uint64_t v60 = v58;
  id v11 = (id)v59;
  int v8 = 0;
  v24 = 0;
  id *v56 = (id)[v57 initWithDomain:v60 code:2 userInfo:v10];
LABEL_43:

LABEL_44:
  return v24;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriPostSiriEngagementFeatures *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasIsUserAbandoned) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsUserCancelled) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v4 = v5;
  if (self->_hasIsSiriCompleted)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasIsPromptInteraction)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasIsConfirmInteraction)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasIsDisambiguateInteraction)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
  if (self->_hasIsUnsupportedPromptInteraction)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v80.receiver = self;
  v80.super_class = (Class)BMSiriPostSiriEngagementFeatures;
  id v5 = [(BMEventBase *)&v80 init];
  if (!v5) {
    goto LABEL_116;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_81:
          if (v22 >= 5) {
            LODWORD(v22) = 0;
          }
          v5->_taskSuccess = v22;
          continue;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasIsUserAbandoned = 1;
          while (1)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_85;
            }
            v27 += 7;
            BOOL v17 = v28++ >= 9;
            if (v17)
            {
              uint64_t v29 = 0;
              goto LABEL_87;
            }
          }
          v4[*v8] = 1;
LABEL_85:
          if (v4[*v8]) {
            uint64_t v29 = 0;
          }
LABEL_87:
          BOOL v76 = v29 != 0;
          uint64_t v77 = 16;
          goto LABEL_112;
        case 3u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          v5->_hasIsUserCancelled = 1;
          while (2)
          {
            uint64_t v37 = *v6;
            uint64_t v38 = *(void *)&v4[v37];
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
              *(void *)&v4[v37] = v39;
              v36 |= (unint64_t)(v40 & 0x7F) << v34;
              if (v40 < 0)
              {
                v34 += 7;
                BOOL v17 = v35++ >= 9;
                if (v17)
                {
                  uint64_t v36 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v36 = 0;
          }
LABEL_91:
          BOOL v76 = v36 != 0;
          uint64_t v77 = 18;
          goto LABEL_112;
        case 4u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          v5->_hasIsSiriCompleted = 1;
          while (2)
          {
            uint64_t v44 = *v6;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
              *(void *)&v4[v44] = v46;
              v43 |= (unint64_t)(v47 & 0x7F) << v41;
              if (v47 < 0)
              {
                v41 += 7;
                BOOL v17 = v42++ >= 9;
                if (v17)
                {
                  uint64_t v43 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v43 = 0;
          }
LABEL_95:
          BOOL v76 = v43 != 0;
          uint64_t v77 = 20;
          goto LABEL_112;
        case 5u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          v5->_hasIsPromptInteraction = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  uint64_t v50 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v50 = 0;
          }
LABEL_99:
          BOOL v76 = v50 != 0;
          uint64_t v77 = 22;
          goto LABEL_112;
        case 6u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          v5->_hasIsConfirmInteraction = 1;
          while (2)
          {
            uint64_t v58 = *v6;
            uint64_t v59 = *(void *)&v4[v58];
            unint64_t v60 = v59 + 1;
            if (v59 == -1 || v60 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)&v4[*v9] + v59);
              *(void *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                BOOL v17 = v56++ >= 9;
                if (v17)
                {
                  uint64_t v57 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v57 = 0;
          }
LABEL_103:
          BOOL v76 = v57 != 0;
          uint64_t v77 = 24;
          goto LABEL_112;
        case 7u:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          v5->_hasIsDisambiguateInteraction = 1;
          while (2)
          {
            uint64_t v65 = *v6;
            uint64_t v66 = *(void *)&v4[v65];
            unint64_t v67 = v66 + 1;
            if (v66 == -1 || v67 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v68 = *(unsigned char *)(*(void *)&v4[*v9] + v66);
              *(void *)&v4[v65] = v67;
              v64 |= (unint64_t)(v68 & 0x7F) << v62;
              if (v68 < 0)
              {
                v62 += 7;
                BOOL v17 = v63++ >= 9;
                if (v17)
                {
                  uint64_t v64 = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v64 = 0;
          }
LABEL_107:
          BOOL v76 = v64 != 0;
          uint64_t v77 = 26;
          goto LABEL_112;
        case 8u:
          char v69 = 0;
          unsigned int v70 = 0;
          uint64_t v71 = 0;
          v5->_hasIsUnsupportedPromptInteraction = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_115;
          }
          continue;
      }
      while (1)
      {
        uint64_t v72 = *v6;
        uint64_t v73 = *(void *)&v4[v72];
        unint64_t v74 = v73 + 1;
        if (v73 == -1 || v74 > *(void *)&v4[*v7]) {
          break;
        }
        char v75 = *(unsigned char *)(*(void *)&v4[*v9] + v73);
        *(void *)&v4[v72] = v74;
        v71 |= (unint64_t)(v75 & 0x7F) << v69;
        if ((v75 & 0x80) == 0) {
          goto LABEL_109;
        }
        v69 += 7;
        BOOL v17 = v70++ >= 9;
        if (v17)
        {
          uint64_t v71 = 0;
          goto LABEL_111;
        }
      }
      v4[*v8] = 1;
LABEL_109:
      if (v4[*v8]) {
        uint64_t v71 = 0;
      }
LABEL_111:
      BOOL v76 = v71 != 0;
      uint64_t v77 = 28;
LABEL_112:
      *((unsigned char *)&v5->super.super.isa + v77) = v76;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_115:
  }
    id v78 = 0;
  else {
LABEL_116:
  }
    id v78 = v5;

  return v78;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = BMSiriPostSiriEngagementFeaturesTaskSuccessAsString([(BMSiriPostSiriEngagementFeatures *)self taskSuccess]);
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserAbandoned](self, "isUserAbandoned"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUserCancelled](self, "isUserCancelled"));
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isSiriCompleted](self, "isSiriCompleted"));
  int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isPromptInteraction](self, "isPromptInteraction"));
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isConfirmInteraction](self, "isConfirmInteraction"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isDisambiguateInteraction](self, "isDisambiguateInteraction"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriPostSiriEngagementFeatures isUnsupportedPromptInteraction](self, "isUnsupportedPromptInteraction"));
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMSiriPostSiriEngagementFeatures with taskSuccess: %@, isUserAbandoned: %@, isUserCancelled: %@, isSiriCompleted: %@, isPromptInteraction: %@, isConfirmInteraction: %@, isDisambiguateInteraction: %@, isUnsupportedPromptInteraction: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSiriPostSiriEngagementFeatures)initWithTaskSuccess:(int)a3 isUserAbandoned:(id)a4 isUserCancelled:(id)a5 isSiriCompleted:(id)a6 isPromptInteraction:(id)a7 isConfirmInteraction:(id)a8 isDisambiguateInteraction:(id)a9 isUnsupportedPromptInteraction:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMSiriPostSiriEngagementFeatures;
  uint64_t v23 = [(BMEventBase *)&v25 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v23->_taskSuccess = a3;
    if (v16)
    {
      v23->_hasIsUserAbandoned = 1;
      v23->_isUserAbandoned = [v16 BOOLValue];
    }
    else
    {
      v23->_hasIsUserAbandoned = 0;
      v23->_isUserAbandoned = 0;
    }
    if (v17)
    {
      v23->_hasIsUserCancelled = 1;
      v23->_isUserCancelled = [v17 BOOLValue];
    }
    else
    {
      v23->_hasIsUserCancelled = 0;
      v23->_isUserCancelled = 0;
    }
    if (v18)
    {
      v23->_hasIsSiriCompleted = 1;
      v23->_isSiriCompleted = [v18 BOOLValue];
    }
    else
    {
      v23->_hasIsSiriCompleted = 0;
      v23->_isSiriCompleted = 0;
    }
    if (v19)
    {
      v23->_hasIsPromptInteraction = 1;
      v23->_isPromptInteraction = [v19 BOOLValue];
    }
    else
    {
      v23->_hasIsPromptInteraction = 0;
      v23->_isPromptInteraction = 0;
    }
    if (v20)
    {
      v23->_hasIsConfirmInteraction = 1;
      v23->_isConfirmInteraction = [v20 BOOLValue];
    }
    else
    {
      v23->_hasIsConfirmInteraction = 0;
      v23->_isConfirmInteraction = 0;
    }
    if (v21)
    {
      v23->_hasIsDisambiguateInteraction = 1;
      v23->_isDisambiguateInteraction = [v21 BOOLValue];
    }
    else
    {
      v23->_hasIsDisambiguateInteraction = 0;
      v23->_isDisambiguateInteraction = 0;
    }
    if (v22)
    {
      v23->_hasIsUnsupportedPromptInteraction = 1;
      v23->_isUnsupportedPromptInteraction = [v22 BOOLValue];
    }
    else
    {
      v23->_hasIsUnsupportedPromptInteraction = 0;
      v23->_isUnsupportedPromptInteraction = 0;
    }
  }

  return v23;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskSuccess" number:1 type:4 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUserAbandoned" number:2 type:12 subMessageClass:0];
  v12[1] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUserCancelled" number:3 type:12 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSiriCompleted" number:4 type:12 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPromptInteraction" number:5 type:12 subMessageClass:0];
  v12[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isConfirmInteraction" number:6 type:12 subMessageClass:0];
  v12[5] = v7;
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDisambiguateInteraction" number:7 type:12 subMessageClass:0];
  v12[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUnsupportedPromptInteraction" number:8 type:12 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6990;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskSuccess" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUserAbandoned" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUserCancelled" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSiriCompleted" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPromptInteraction" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isConfirmInteraction" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDisambiguateInteraction" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUnsupportedPromptInteraction" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    uint64_t v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    int v7 = [[BMSiriPostSiriEngagementFeatures alloc] initByReadFrom:v6];
    int v8 = v7;
    if (v7) {
      v7[8] = 1;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end