@interface BMAutonamingMessageIds
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAutonamingMessageIds)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAutonamingMessageIds)initWithProtoVersion:(id)a3 bundleId:(id)a4 domainId:(id)a5 spotlightId:(id)a6 messageId:(id)a7 conversationId:(id)a8 isDeletion:(id)a9 containsImageAttachment:(id)a10;
- (BMAutonamingMessageIds)initWithProtoVersion:(id)a3 bundleId:(id)a4 domainId:(id)a5 spotlightId:(id)a6 messageId:(id)a7 conversationId:(id)a8 isDeletion:(id)a9 containsImageAttachment:(id)a10 messageTimestamp:(id)a11;
- (BOOL)containsImageAttachment;
- (BOOL)hasContainsImageAttachment;
- (BOOL)hasIsDeletion;
- (BOOL)hasProtoVersion;
- (BOOL)isDeletion;
- (BOOL)isEqual:(id)a3;
- (NSDate)messageTimestamp;
- (NSString)bundleId;
- (NSString)conversationId;
- (NSString)description;
- (NSString)domainId;
- (NSString)messageId;
- (NSString)spotlightId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)protoVersion;
- (unsigned)dataVersion;
- (void)setHasContainsImageAttachment:(BOOL)a3;
- (void)setHasIsDeletion:(BOOL)a3;
- (void)setHasProtoVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAutonamingMessageIds

- (BMAutonamingMessageIds)initWithProtoVersion:(id)a3 bundleId:(id)a4 domainId:(id)a5 spotlightId:(id)a6 messageId:(id)a7 conversationId:(id)a8 isDeletion:(id)a9 containsImageAttachment:(id)a10
{
  return [(BMAutonamingMessageIds *)self initWithProtoVersion:a3 bundleId:a4 domainId:a5 spotlightId:a6 messageId:a7 conversationId:a8 isDeletion:a9 containsImageAttachment:a10 messageTimestamp:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_spotlightId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setHasContainsImageAttachment:(BOOL)a3
{
  self->_hasContainsImageAttachment = a3;
}

- (BOOL)hasContainsImageAttachment
{
  return self->_hasContainsImageAttachment;
}

- (BOOL)containsImageAttachment
{
  return self->_containsImageAttachment;
}

- (void)setHasIsDeletion:(BOOL)a3
{
  self->_hasIsDeletion = a3;
}

- (BOOL)hasIsDeletion
{
  return self->_hasIsDeletion;
}

- (BOOL)isDeletion
{
  return self->_isDeletion;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)spotlightId
{
  return self->_spotlightId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setHasProtoVersion:(BOOL)a3
{
  self->_hasProtoVersion = a3;
}

- (BOOL)hasProtoVersion
{
  return self->_hasProtoVersion;
}

- (int)protoVersion
{
  return self->_protoVersion;
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
    if ([(BMAutonamingMessageIds *)self hasProtoVersion]
      || [v5 hasProtoVersion])
    {
      if (![(BMAutonamingMessageIds *)self hasProtoVersion]) {
        goto LABEL_38;
      }
      if (![v5 hasProtoVersion]) {
        goto LABEL_38;
      }
      int v6 = [(BMAutonamingMessageIds *)self protoVersion];
      if (v6 != [v5 protoVersion]) {
        goto LABEL_38;
      }
    }
    v7 = [(BMAutonamingMessageIds *)self bundleId];
    uint64_t v8 = [v5 bundleId];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMAutonamingMessageIds *)self bundleId];
      v11 = [v5 bundleId];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_38;
      }
    }
    v14 = [(BMAutonamingMessageIds *)self domainId];
    uint64_t v15 = [v5 domainId];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMAutonamingMessageIds *)self domainId];
      v18 = [v5 domainId];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_38;
      }
    }
    v20 = [(BMAutonamingMessageIds *)self spotlightId];
    uint64_t v21 = [v5 spotlightId];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMAutonamingMessageIds *)self spotlightId];
      v24 = [v5 spotlightId];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_38;
      }
    }
    v26 = [(BMAutonamingMessageIds *)self messageId];
    uint64_t v27 = [v5 messageId];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMAutonamingMessageIds *)self messageId];
      v30 = [v5 messageId];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_38;
      }
    }
    v32 = [(BMAutonamingMessageIds *)self conversationId];
    uint64_t v33 = [v5 conversationId];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMAutonamingMessageIds *)self conversationId];
      v36 = [v5 conversationId];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_38;
      }
    }
    if (![(BMAutonamingMessageIds *)self hasIsDeletion]
      && ![v5 hasIsDeletion]
      || [(BMAutonamingMessageIds *)self hasIsDeletion]
      && [v5 hasIsDeletion]
      && (int v38 = [(BMAutonamingMessageIds *)self isDeletion],
          v38 == [v5 isDeletion]))
    {
      if (![(BMAutonamingMessageIds *)self hasContainsImageAttachment]
        && ![v5 hasContainsImageAttachment]
        || [(BMAutonamingMessageIds *)self hasContainsImageAttachment]
        && [v5 hasContainsImageAttachment]
        && (int v39 = [(BMAutonamingMessageIds *)self containsImageAttachment],
            v39 == [v5 containsImageAttachment]))
      {
        v41 = [(BMAutonamingMessageIds *)self messageTimestamp];
        v42 = [v5 messageTimestamp];
        if (v41 == v42)
        {
          char v13 = 1;
        }
        else
        {
          v43 = [(BMAutonamingMessageIds *)self messageTimestamp];
          v44 = [v5 messageTimestamp];
          char v13 = [v43 isEqual:v44];
        }
        goto LABEL_39;
      }
    }
LABEL_38:
    char v13 = 0;
LABEL_39:

    goto LABEL_40;
  }
  char v13 = 0;
LABEL_40:

  return v13;
}

- (NSDate)messageTimestamp
{
  if (self->_hasRaw_messageTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_messageTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
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
  if ([(BMAutonamingMessageIds *)self hasProtoVersion])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAutonamingMessageIds protoVersion](self, "protoVersion"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(BMAutonamingMessageIds *)self bundleId];
  id v5 = [(BMAutonamingMessageIds *)self domainId];
  uint64_t v6 = [(BMAutonamingMessageIds *)self spotlightId];
  v32 = [(BMAutonamingMessageIds *)self messageId];
  int v31 = [(BMAutonamingMessageIds *)self conversationId];
  if ([(BMAutonamingMessageIds *)self hasIsDeletion])
  {
    v30 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAutonamingMessageIds isDeletion](self, "isDeletion"));
  }
  else
  {
    v30 = 0;
  }
  if ([(BMAutonamingMessageIds *)self hasContainsImageAttachment])
  {
    v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAutonamingMessageIds containsImageAttachment](self, "containsImageAttachment"));
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = [(BMAutonamingMessageIds *)self messageTimestamp];
  if (v8)
  {
    v9 = NSNumber;
    v10 = [(BMAutonamingMessageIds *)self messageTimestamp];
    [v10 timeIntervalSince1970];
    v11 = objc_msgSend(v9, "numberWithDouble:");
  }
  else
  {
    v11 = 0;
  }

  v33[0] = @"protoVersion";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = (void *)v12;
  v34[0] = v12;
  v33[1] = @"bundleId";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v13;
  v34[1] = v13;
  v33[2] = @"domainId";
  uint64_t v14 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v14;
  v34[2] = v14;
  v33[3] = @"spotlightId";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v3;
  v24 = (void *)v15;
  v34[3] = v15;
  v33[4] = @"messageId";
  v16 = v32;
  if (!v32)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v4;
  v34[4] = v16;
  v33[5] = @"conversationId";
  v17 = v31;
  if (!v31)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v17;
  v33[6] = @"isDeletion";
  v18 = v30;
  if (!v30)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v19 = (void *)v6;
  v34[6] = v18;
  v33[7] = @"containsImageAttachment";
  v20 = v7;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v20;
  v33[8] = @"messageTimestamp";
  uint64_t v21 = v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[8] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  if (v11)
  {
    if (v7) {
      goto LABEL_33;
    }
  }
  else
  {

    if (v7) {
      goto LABEL_33;
    }
  }

LABEL_33:
  if (!v30) {

  }
  if (!v31) {
  if (!v32)
  }

  if (v19)
  {
    if (v5) {
      goto LABEL_41;
    }
  }
  else
  {

    if (v5)
    {
LABEL_41:
      if (v28) {
        goto LABEL_42;
      }
LABEL_50:

      if (v29) {
        goto LABEL_43;
      }
      goto LABEL_51;
    }
  }

  if (!v28) {
    goto LABEL_50;
  }
LABEL_42:
  if (v29) {
    goto LABEL_43;
  }
LABEL_51:

LABEL_43:

  return v22;
}

- (BMAutonamingMessageIds)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"protoVersion"];
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
    v9 = [v6 objectForKeyedSubscript:@"bundleId"];
    v88 = self;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v80 = a4;
      a4 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v80 = a4;
      a4 = v9;
LABEL_7:
      v10 = [v6 objectForKeyedSubscript:@"domainId"];
      v87 = v10;
      v85 = a4;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v83 = 0;
LABEL_10:
        v11 = [v6 objectForKeyedSubscript:@"spotlightId"];
        if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v80)
            {
              id v86 = 0;
              v24 = 0;
              v29 = v83;
              goto LABEL_76;
            }
            id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v41 = v8;
            uint64_t v42 = *MEMORY[0x1E4F502C8];
            uint64_t v99 = *MEMORY[0x1E4F28568];
            v79 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"spotlightId"];
            v100 = v79;
            uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
            v44 = v40;
            a4 = v85;
            uint64_t v45 = v42;
            id v8 = v41;
            v81 = (void *)v43;
            id v86 = 0;
            v24 = 0;
            id *v80 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
            goto LABEL_82;
          }
          id v86 = v11;
        }
        else
        {
          id v86 = 0;
        }
        id v12 = [v6 objectForKeyedSubscript:@"messageId"];
        v81 = v12;
        if (!v12)
        {
          v74 = v7;
          uint64_t v13 = v9;
          goto LABEL_27;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v74 = v7;
          uint64_t v13 = v9;
          id v12 = 0;
LABEL_27:
          uint64_t v14 = [v6 objectForKeyedSubscript:@"conversationId"];
          v79 = v12;
          v76 = (void *)v14;
          if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v80)
              {
                id v82 = 0;
                v24 = 0;
                self = v88;
                v9 = v13;
                v7 = v74;
                v55 = v76;
                goto LABEL_74;
              }
              id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v59 = *MEMORY[0x1E4F502C8];
              uint64_t v95 = *MEMORY[0x1E4F28568];
              id v78 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationId"];
              id v96 = v78;
              v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
              v60 = v58;
              a4 = v85;
              id v82 = 0;
              v24 = 0;
              id *v80 = (id)[v60 initWithDomain:v59 code:2 userInfo:v16];
              self = v88;
              v9 = v13;
              v7 = v74;
              goto LABEL_73;
            }
            id v82 = v15;
          }
          else
          {
            id v82 = 0;
          }
          v16 = [v6 objectForKeyedSubscript:@"isDeletion"];
          v9 = v13;
          id v77 = v8;
          v73 = v11;
          if (v16)
          {
            objc_opt_class();
            v7 = v74;
            if (objc_opt_isKindOfClass())
            {
              id v78 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v80)
                {
                  id v78 = 0;
                  v24 = 0;
                  self = v88;
                  goto LABEL_73;
                }
                id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v62 = *MEMORY[0x1E4F502C8];
                uint64_t v93 = *MEMORY[0x1E4F28568];
                id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isDeletion"];
                id v94 = v34;
                uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
                v63 = v61;
                id v8 = v77;
                id v64 = (id)[v63 initWithDomain:v62 code:2 userInfo:v33];
                id v78 = 0;
                v24 = 0;
                id *v80 = v64;
LABEL_72:

                v10 = v87;
                self = v88;
                a4 = v85;
                v11 = v73;
LABEL_73:

                v55 = v76;
                goto LABEL_74;
              }
              id v78 = v16;
            }
          }
          else
          {
            id v78 = 0;
            v7 = v74;
          }
          uint64_t v33 = [v6 objectForKeyedSubscript:@"containsImageAttachment"];
          if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v80)
              {
                id v34 = 0;
                v24 = 0;
                goto LABEL_72;
              }
              id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v66 = *MEMORY[0x1E4F502C8];
              uint64_t v91 = *MEMORY[0x1E4F28568];
              v36 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"containsImageAttachment"];
              v92 = v36;
              v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
              id v67 = (id)[v65 initWithDomain:v66 code:2 userInfo:v35];
              id v34 = 0;
              v24 = 0;
              id *v80 = v67;
              goto LABEL_71;
            }
            id v34 = v33;
          }
          else
          {
            id v34 = 0;
          }
          v35 = [v6 objectForKeyedSubscript:@"messageTimestamp"];
          if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = (objc_class *)MEMORY[0x1E4F1C9C8];
              id v47 = v35;
              id v48 = [v46 alloc];
              [v47 doubleValue];
              double v50 = v49;

              id v51 = (id)[v48 initWithTimeIntervalSince1970:v50];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v68 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                v36 = [v68 dateFromString:v35];

                goto LABEL_70;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v80)
                {
                  id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v72 = *MEMORY[0x1E4F502C8];
                  uint64_t v89 = *MEMORY[0x1E4F28568];
                  v70 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"messageTimestamp"];
                  v90 = v70;
                  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
                  id *v80 = (id)[v75 initWithDomain:v72 code:2 userInfo:v71];
                }
                v36 = 0;
                v24 = 0;
                goto LABEL_71;
              }
              id v51 = v35;
            }
            v36 = v51;
          }
          else
          {
            v36 = 0;
          }
LABEL_70:
          v24 = [(BMAutonamingMessageIds *)v88 initWithProtoVersion:v77 bundleId:v85 domainId:v83 spotlightId:v86 messageId:v12 conversationId:v82 isDeletion:v78 containsImageAttachment:v34 messageTimestamp:v36];
          v88 = v24;
LABEL_71:

          id v8 = v77;
          goto LABEL_72;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v74 = v7;
          uint64_t v13 = v9;
          id v12 = v12;
          goto LABEL_27;
        }
        if (v80)
        {
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v53 = v8;
          uint64_t v54 = *MEMORY[0x1E4F502C8];
          uint64_t v97 = *MEMORY[0x1E4F28568];
          id v82 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"messageId"];
          id v98 = v82;
          v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          v56 = v52;
          a4 = v85;
          uint64_t v57 = v54;
          id v8 = v53;
          v79 = 0;
          v24 = 0;
          id *v80 = (id)[v56 initWithDomain:v57 code:2 userInfo:v55];
          self = v88;
LABEL_74:

          v29 = v83;
LABEL_75:

          goto LABEL_76;
        }
        v79 = 0;
        v24 = 0;
LABEL_82:
        v29 = v83;
        self = v88;
        goto LABEL_75;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v83 = v10;
        goto LABEL_10;
      }
      if (v80)
      {
        id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v37 = v8;
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v101 = *MEMORY[0x1E4F28568];
        id v86 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainId"];
        id v102 = v86;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
        uint64_t v39 = v38;
        id v8 = v37;
        v29 = 0;
        v24 = 0;
        id *v80 = (id)[v84 initWithDomain:v39 code:2 userInfo:v11];
LABEL_76:

        goto LABEL_77;
      }
      v29 = 0;
      v24 = 0;
LABEL_77:

      goto LABEL_78;
    }
    if (a4)
    {
      int v25 = a4;
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v27 = v8;
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v103 = *MEMORY[0x1E4F28568];
      v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleId"];
      v104 = v29;
      uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
      uint64_t v31 = v28;
      id v8 = v27;
      v10 = (void *)v30;
      id v32 = (id)[v26 initWithDomain:v31 code:2 userInfo:v30];
      a4 = 0;
      v24 = 0;
      *int v25 = v32;
      goto LABEL_77;
    }
    v24 = 0;
LABEL_78:

    goto LABEL_79;
  }
  if (a4)
  {
    v17 = self;
    v18 = a4;
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F502C8];
    uint64_t v105 = *MEMORY[0x1E4F28568];
    uint64_t v21 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"protoVersion"];
    v106[0] = v21;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
    v22 = v19;
    a4 = v21;
    id v23 = (id)[v22 initWithDomain:v20 code:2 userInfo:v9];
    id v8 = 0;
    v24 = 0;
    id *v18 = v23;
    self = v17;
    goto LABEL_78;
  }
  id v8 = 0;
  v24 = 0;
LABEL_79:

  return v24;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAutonamingMessageIds *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasProtoVersion)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_domainId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_spotlightId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_messageId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_conversationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsDeletion)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasContainsImageAttachment)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasRaw_messageTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMAutonamingMessageIds;
  id v5 = [(BMEventBase *)&v51 init];
  if (!v5) {
    goto LABEL_70;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasProtoVersion = 1;
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
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_55:
          v5->_protoVersion = v22;
          continue;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 48;
          goto LABEL_34;
        case 3u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 56;
          goto LABEL_34;
        case 4u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 64;
          goto LABEL_34;
        case 6u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 72;
          goto LABEL_34;
        case 7u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 80;
LABEL_34:
          v29 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 8u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasIsDeletion = 1;
          while (2)
          {
            uint64_t v33 = *v6;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  uint64_t v32 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v32 = 0;
          }
LABEL_59:
          BOOL v47 = v32 != 0;
          uint64_t v48 = 33;
          goto LABEL_64;
        case 9u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasContainsImageAttachment = 1;
          break;
        case 0xAu:
          v5->_hasRaw_messageTimestamp = 1;
          uint64_t v44 = *v6;
          unint64_t v45 = *(void *)&v4[v44];
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)&v4[*v7])
          {
            double v46 = *(double *)(*(void *)&v4[*v9] + v45);
            *(void *)&v4[v44] = v45 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v46 = 0.0;
          }
          v5->_raw_messageTimestamp = v46;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_69;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v6;
        uint64_t v41 = *(void *)&v4[v40];
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)&v4[*v7]) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
        *(void *)&v4[v40] = v42;
        v39 |= (unint64_t)(v43 & 0x7F) << v37;
        if ((v43 & 0x80) == 0) {
          goto LABEL_61;
        }
        v37 += 7;
        BOOL v17 = v38++ >= 9;
        if (v17)
        {
          uint64_t v39 = 0;
          goto LABEL_63;
        }
      }
      v4[*v8] = 1;
LABEL_61:
      if (v4[*v8]) {
        uint64_t v39 = 0;
      }
LABEL_63:
      BOOL v47 = v39 != 0;
      uint64_t v48 = 35;
LABEL_64:
      *((unsigned char *)&v5->super.super.isa + v48) = v47;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_69:
  }
    double v49 = 0;
  else {
LABEL_70:
  }
    double v49 = v5;

  return v49;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAutonamingMessageIds protoVersion](self, "protoVersion"));
  id v5 = [(BMAutonamingMessageIds *)self bundleId];
  id v6 = [(BMAutonamingMessageIds *)self domainId];
  v7 = [(BMAutonamingMessageIds *)self spotlightId];
  id v8 = [(BMAutonamingMessageIds *)self messageId];
  v9 = [(BMAutonamingMessageIds *)self conversationId];
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAutonamingMessageIds isDeletion](self, "isDeletion"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAutonamingMessageIds containsImageAttachment](self, "containsImageAttachment"));
  unint64_t v12 = [(BMAutonamingMessageIds *)self messageTimestamp];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMAutonamingMessageIds with protoVersion: %@, bundleId: %@, domainId: %@, spotlightId: %@, messageId: %@, conversationId: %@, isDeletion: %@, containsImageAttachment: %@, messageTimestamp: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMAutonamingMessageIds)initWithProtoVersion:(id)a3 bundleId:(id)a4 domainId:(id)a5 spotlightId:(id)a6 messageId:(id)a7 conversationId:(id)a8 isDeletion:(id)a9 containsImageAttachment:(id)a10 messageTimestamp:(id)a11
{
  id v17 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  v30.receiver = self;
  v30.super_class = (Class)BMAutonamingMessageIds;
  unsigned int v21 = [(BMEventBase *)&v30 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v17)
    {
      v21->_hasProtoVersion = 1;
      int v22 = [v17 intValue];
    }
    else
    {
      v21->_hasProtoVersion = 0;
      int v22 = -1;
    }
    v21->_protoVersion = v22;
    objc_storeStrong((id *)&v21->_bundleId, a4);
    objc_storeStrong((id *)&v21->_domainId, a5);
    objc_storeStrong((id *)&v21->_spotlightId, a6);
    objc_storeStrong((id *)&v21->_messageId, a7);
    objc_storeStrong((id *)&v21->_conversationId, a8);
    if (v18)
    {
      v21->_hasIsDeletion = 1;
      v21->_isDeletion = [v18 BOOLValue];
    }
    else
    {
      v21->_hasIsDeletion = 0;
      v21->_isDeletion = 0;
    }
    if (v19)
    {
      v21->_hasContainsImageAttachment = 1;
      v21->_containsImageAttachment = [v19 BOOLValue];
    }
    else
    {
      v21->_hasContainsImageAttachment = 0;
      v21->_containsImageAttachment = 0;
    }
    if (v20)
    {
      v21->_hasRaw_messageTimestamp = 1;
      [v20 timeIntervalSince1970];
    }
    else
    {
      v21->_hasRaw_messageTimestamp = 0;
      double v23 = -1.0;
    }
    v21->_raw_messageTimestamp = v23;
  }

  return v21;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"protoVersion" number:1 type:2 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"bundleId", 2, 13, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domainId" number:3 type:13 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"spotlightId" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageId" number:6 type:13 subMessageClass:0];
  v13[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationId" number:7 type:13 subMessageClass:0];
  v13[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDeletion" number:8 type:12 subMessageClass:0];
  v13[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsImageAttachment" number:9 type:12 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageTimestamp" number:10 type:0 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6B88;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"protoVersion" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"spotlightId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageId" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationId" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDeletion" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsImageAttachment" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageTimestamp" dataType:3 requestOnly:0 fieldNumber:10 protoDataType:0 convertedType:2];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMAutonamingMessageIds alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end