@interface BMPeopleSuggesterSuggestLessFeedback
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPeopleSuggesterSuggestLessFeedback)initWithIdentifier:(id)a3 bundleId:(id)a4 derivedIdentifier:(id)a5 conversationIdentifier:(id)a6 handle:(id)a7 contactIdentifier:(id)a8 itemIdentifier:(id)a9 groupIdentifier:(id)a10 deviceIdentifier:(id)a11 userIdentifier:(id)a12;
- (BMPeopleSuggesterSuggestLessFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleId;
- (NSString)contactIdentifier;
- (NSString)conversationIdentifier;
- (NSString)derivedIdentifier;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)groupIdentifier;
- (NSString)handle;
- (NSString)identifier;
- (NSString)itemIdentifier;
- (NSString)userIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPeopleSuggesterSuggestLessFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)derivedIdentifier
{
  return self->_derivedIdentifier;
}

- (NSString)bundleId
{
  return self->_bundleId;
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
    v6 = [(BMPeopleSuggesterSuggestLessFeedback *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPeopleSuggesterSuggestLessFeedback *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_37;
      }
    }
    v13 = [(BMPeopleSuggesterSuggestLessFeedback *)self bundleId];
    uint64_t v14 = [v5 bundleId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPeopleSuggesterSuggestLessFeedback *)self bundleId];
      v17 = [v5 bundleId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_37;
      }
    }
    v19 = [(BMPeopleSuggesterSuggestLessFeedback *)self derivedIdentifier];
    uint64_t v20 = [v5 derivedIdentifier];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMPeopleSuggesterSuggestLessFeedback *)self derivedIdentifier];
      v23 = [v5 derivedIdentifier];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_37;
      }
    }
    v25 = [(BMPeopleSuggesterSuggestLessFeedback *)self conversationIdentifier];
    uint64_t v26 = [v5 conversationIdentifier];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMPeopleSuggesterSuggestLessFeedback *)self conversationIdentifier];
      v29 = [v5 conversationIdentifier];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_37;
      }
    }
    v31 = [(BMPeopleSuggesterSuggestLessFeedback *)self handle];
    uint64_t v32 = [v5 handle];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMPeopleSuggesterSuggestLessFeedback *)self handle];
      v35 = [v5 handle];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_37;
      }
    }
    v37 = [(BMPeopleSuggesterSuggestLessFeedback *)self contactIdentifier];
    uint64_t v38 = [v5 contactIdentifier];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMPeopleSuggesterSuggestLessFeedback *)self contactIdentifier];
      v41 = [v5 contactIdentifier];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_37;
      }
    }
    v43 = [(BMPeopleSuggesterSuggestLessFeedback *)self itemIdentifier];
    uint64_t v44 = [v5 itemIdentifier];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMPeopleSuggesterSuggestLessFeedback *)self itemIdentifier];
      v47 = [v5 itemIdentifier];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_37;
      }
    }
    v49 = [(BMPeopleSuggesterSuggestLessFeedback *)self groupIdentifier];
    uint64_t v50 = [v5 groupIdentifier];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMPeopleSuggesterSuggestLessFeedback *)self groupIdentifier];
      v53 = [v5 groupIdentifier];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_37;
      }
    }
    v55 = [(BMPeopleSuggesterSuggestLessFeedback *)self deviceIdentifier];
    uint64_t v56 = [v5 deviceIdentifier];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMPeopleSuggesterSuggestLessFeedback *)self deviceIdentifier];
      v59 = [v5 deviceIdentifier];
      int v60 = [v58 isEqual:v59];

      if (!v60)
      {
LABEL_37:
        char v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    v62 = [(BMPeopleSuggesterSuggestLessFeedback *)self userIdentifier];
    v63 = [v5 userIdentifier];
    if (v62 == v63)
    {
      char v12 = 1;
    }
    else
    {
      v64 = [(BMPeopleSuggesterSuggestLessFeedback *)self userIdentifier];
      v65 = [v5 userIdentifier];
      char v12 = [v64 isEqual:v65];
    }
    goto LABEL_38;
  }
  char v12 = 0;
LABEL_39:

  return v12;
}

- (id)jsonDictionary
{
  v37[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMPeopleSuggesterSuggestLessFeedback *)self identifier];
  uint64_t v4 = [(BMPeopleSuggesterSuggestLessFeedback *)self bundleId];
  uint64_t v5 = [(BMPeopleSuggesterSuggestLessFeedback *)self derivedIdentifier];
  uint64_t v6 = [(BMPeopleSuggesterSuggestLessFeedback *)self conversationIdentifier];
  uint64_t v7 = [(BMPeopleSuggesterSuggestLessFeedback *)self handle];
  uint64_t v8 = [(BMPeopleSuggesterSuggestLessFeedback *)self contactIdentifier];
  v9 = [(BMPeopleSuggesterSuggestLessFeedback *)self itemIdentifier];
  v35 = [(BMPeopleSuggesterSuggestLessFeedback *)self groupIdentifier];
  v10 = [(BMPeopleSuggesterSuggestLessFeedback *)self deviceIdentifier];
  int v11 = [(BMPeopleSuggesterSuggestLessFeedback *)self userIdentifier];
  v36[0] = @"identifier";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v12;
  v37[0] = v12;
  v36[1] = @"bundleId";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v13;
  v37[1] = v13;
  v36[2] = @"derivedIdentifier";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v3;
  v27 = (void *)v14;
  v37[2] = v14;
  v36[3] = @"conversationIdentifier";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v4;
  uint64_t v26 = (void *)v15;
  v37[3] = v15;
  v36[4] = @"handle";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v5;
  v25 = (void *)v16;
  v37[4] = v16;
  v36[5] = @"contactIdentifier";
  v17 = (void *)v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v6;
  v37[5] = v17;
  v36[6] = @"itemIdentifier";
  int v18 = v9;
  if (!v9)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v37[6] = v18;
  v36[7] = @"groupIdentifier";
  uint64_t v20 = v35;
  if (!v35)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v8;
  v37[7] = v20;
  v36[8] = @"deviceIdentifier";
  v22 = v10;
  if (!v10)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[8] = v22;
  v36[9] = @"userIdentifier";
  v23 = v11;
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[9] = v23;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:10];
  if (v11)
  {
    if (v10) {
      goto LABEL_23;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_23;
    }
  }

LABEL_23:
  if (!v35) {

  }
  if (!v9) {
  if (!v21)
  }

  if (!v19) {
  if (!v31)
  }

  if (v32)
  {
    if (v33) {
      goto LABEL_35;
    }
LABEL_42:

    if (v34) {
      goto LABEL_36;
    }
    goto LABEL_43;
  }

  if (!v33) {
    goto LABEL_42;
  }
LABEL_35:
  if (v34) {
    goto LABEL_36;
  }
LABEL_43:

LABEL_36:

  return v30;
}

- (BMPeopleSuggesterSuggestLessFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v111[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    v91 = [v5 objectForKeyedSubscript:@"bundleId"];
    if (v91 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v8 = 0;
          v25 = 0;
          goto LABEL_61;
        }
        uint64_t v26 = a4;
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v108 = *MEMORY[0x1E4F28568];
        v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleId"];
        v109 = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
        v31 = v27;
        v9 = (void *)v30;
        id v32 = (id)[v31 initWithDomain:v28 code:2 userInfo:v30];
        v25 = 0;
        id v8 = 0;
        *uint64_t v26 = v32;
        goto LABEL_60;
      }
      v86 = a4;
      id v8 = v91;
    }
    else
    {
      v86 = a4;
      id v8 = 0;
    }
    v9 = [v5 objectForKeyedSubscript:@"derivedIdentifier"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          v29 = 0;
          v25 = 0;
          goto LABEL_60;
        }
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v41 = v8;
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v106 = *MEMORY[0x1E4F28568];
        id v88 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"derivedIdentifier"];
        id v107 = v88;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        uint64_t v44 = v42;
        id v8 = v41;
        v25 = 0;
        v29 = 0;
        id *v86 = (id)[v40 initWithDomain:v44 code:2 userInfo:v43];
        v10 = (void *)v43;
LABEL_59:

LABEL_60:
        goto LABEL_61;
      }
      id v87 = v9;
    }
    else
    {
      id v87 = 0;
    }
    v10 = [v5 objectForKeyedSubscript:@"conversationIdentifier"];
    v83 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          id v88 = 0;
          v25 = 0;
          v29 = v87;
          goto LABEL_59;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v46 = v8;
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v104 = *MEMORY[0x1E4F28568];
        id v84 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationIdentifier"];
        id v105 = v84;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
        int v48 = v45;
        v9 = v83;
        uint64_t v49 = v47;
        id v8 = v46;
        v25 = 0;
        id v88 = 0;
        id *v86 = (id)[v48 initWithDomain:v49 code:2 userInfo:v11];
        v29 = v87;
        goto LABEL_58;
      }
      id v88 = v10;
    }
    else
    {
      id v88 = 0;
    }
    int v11 = [v5 objectForKeyedSubscript:@"handle"];
    v81 = v10;
    v82 = v6;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          id v84 = 0;
          v25 = 0;
          v29 = v87;
          goto LABEL_58;
        }
        id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v50 = v8;
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v102 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"handle"];
        id v103 = v15;
        uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        uint64_t v53 = v51;
        id v8 = v50;
        v80 = (void *)v52;
        id v54 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v53, 2);
        v25 = 0;
        id v84 = 0;
        id *v86 = v54;
        v29 = v87;
        goto LABEL_92;
      }
      id v12 = v7;
      id v84 = v11;
    }
    else
    {
      id v12 = v7;
      id v84 = 0;
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:@"contactIdentifier"];
    v77 = v11;
    v80 = (void *)v13;
    if (!v13 || (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v15 = 0;
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
LABEL_19:
      uint64_t v16 = [v5 objectForKeyedSubscript:@"itemIdentifier"];
      id v7 = v12;
      v76 = (void *)v16;
      if (v16)
      {
        v17 = (void *)v16;
        objc_opt_class();
        id v71 = v15;
        int v18 = v17;
        uint64_t v6 = v82;
        if (objc_opt_isKindOfClass())
        {
          id v79 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v86)
            {
              id v79 = 0;
              v25 = 0;
              id v15 = v71;
              goto LABEL_56;
            }
            id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v61 = v8;
            uint64_t v62 = *MEMORY[0x1E4F502C8];
            uint64_t v98 = *MEMORY[0x1E4F28568];
            id v78 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemIdentifier"];
            id v99 = v78;
            v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
            uint64_t v63 = v62;
            id v8 = v61;
            v25 = 0;
            id v79 = 0;
            id *v86 = (id)[v60 initWithDomain:v63 code:2 userInfo:v33];
            id v15 = v71;
            goto LABEL_55;
          }
          id v79 = v18;
        }
        id v15 = v71;
      }
      else
      {
        id v79 = 0;
        uint64_t v6 = v82;
      }
      v33 = [v5 objectForKeyedSubscript:@"groupIdentifier"];
      id v75 = v8;
      if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v86)
          {
            id v78 = 0;
            v25 = 0;
            goto LABEL_55;
          }
          id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v65 = *MEMORY[0x1E4F502C8];
          uint64_t v96 = *MEMORY[0x1E4F28568];
          id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"groupIdentifier"];
          id v97 = v36;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
          id v66 = (id)[v64 initWithDomain:v65 code:2 userInfo:v34];
          v25 = 0;
          id v78 = 0;
          id *v86 = v66;
          goto LABEL_53;
        }
        id v78 = v33;
      }
      else
      {
        id v78 = 0;
      }
      v34 = [v5 objectForKeyedSubscript:@"deviceIdentifier"];
      id v74 = v7;
      if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v86)
          {
            id v36 = 0;
            v25 = 0;
            goto LABEL_54;
          }
          v35 = self;
          id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v67 = *MEMORY[0x1E4F502C8];
          uint64_t v94 = *MEMORY[0x1E4F28568];
          id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceIdentifier"];
          id v95 = v38;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          id v68 = (id)[v72 initWithDomain:v67 code:2 userInfo:v37];
          v25 = 0;
          id v36 = 0;
          id *v86 = v68;
          goto LABEL_52;
        }
        v35 = self;
        id v36 = v34;
      }
      else
      {
        v35 = self;
        id v36 = 0;
      }
      v37 = [v5 objectForKeyedSubscript:@"userIdentifier"];
      if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v86)
          {
            id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v73 = *MEMORY[0x1E4F502C8];
            uint64_t v92 = *MEMORY[0x1E4F28568];
            v69 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userIdentifier"];
            v93 = v69;
            v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
            id *v86 = (id)[v90 initWithDomain:v73 code:2 userInfo:v70];
          }
          id v38 = 0;
          v25 = 0;
          goto LABEL_52;
        }
        id v38 = v37;
      }
      else
      {
        id v38 = 0;
      }
      v25 = [(BMPeopleSuggesterSuggestLessFeedback *)v35 initWithIdentifier:v74 bundleId:v75 derivedIdentifier:v87 conversationIdentifier:v88 handle:v84 contactIdentifier:v15 itemIdentifier:v79 groupIdentifier:v78 deviceIdentifier:v36 userIdentifier:v38];
      v35 = v25;
LABEL_52:
      self = v35;

      id v7 = v74;
LABEL_53:
      v10 = v81;
LABEL_54:

      id v8 = v75;
LABEL_55:

      v9 = v83;
      int v11 = v77;
LABEL_56:

      v29 = v87;
LABEL_57:

LABEL_58:
      goto LABEL_59;
    }
    if (v86)
    {
      id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v56 = *MEMORY[0x1E4F502C8];
      uint64_t v100 = *MEMORY[0x1E4F28568];
      id v79 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactIdentifier"];
      id v101 = v79;
      uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
      v58 = v55;
      v9 = v83;
      v76 = (void *)v57;
      id v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v56, 2);
      v25 = 0;
      id v15 = 0;
      id *v86 = v59;
      id v7 = v12;
      uint64_t v6 = v82;
      goto LABEL_56;
    }
    id v15 = 0;
    v25 = 0;
    v29 = v87;
    id v7 = v12;
LABEL_92:
    uint64_t v6 = v82;
    goto LABEL_57;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v25 = 0;
    id v7 = 0;
    goto LABEL_62;
  }
  v19 = a4;
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v110 = *MEMORY[0x1E4F28568];
  uint64_t v22 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
  v111[0] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:&v110 count:1];
  uint64_t v24 = v21;
  id v8 = (id)v22;
  v91 = (void *)v23;
  v25 = 0;
  id v7 = 0;
  id *v19 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v24, 2);
LABEL_61:

LABEL_62:
  return v25;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMPeopleSuggesterSuggestLessFeedback *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_derivedIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_conversationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contactIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_groupIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMPeopleSuggesterSuggestLessFeedback;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_36;
  }
  uint64_t v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
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
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 24;
          goto LABEL_32;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_32;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_32;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_32;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_32;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_32;
        case 7u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 72;
          goto LABEL_32;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 80;
          goto LABEL_32;
        case 9u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 88;
          goto LABEL_32;
        case 0xAu:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 96;
LABEL_32:
          uint64_t v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_35;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_35:
  }
    uint64_t v22 = 0;
  else {
LABEL_36:
  }
    uint64_t v22 = v5;

  return v22;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  unint64_t v14 = [(BMPeopleSuggesterSuggestLessFeedback *)self identifier];
  uint64_t v3 = [(BMPeopleSuggesterSuggestLessFeedback *)self bundleId];
  id v4 = [(BMPeopleSuggesterSuggestLessFeedback *)self derivedIdentifier];
  id v5 = [(BMPeopleSuggesterSuggestLessFeedback *)self conversationIdentifier];
  uint64_t v6 = [(BMPeopleSuggesterSuggestLessFeedback *)self handle];
  id v7 = [(BMPeopleSuggesterSuggestLessFeedback *)self contactIdentifier];
  id v8 = [(BMPeopleSuggesterSuggestLessFeedback *)self itemIdentifier];
  v9 = [(BMPeopleSuggesterSuggestLessFeedback *)self groupIdentifier];
  char v10 = [(BMPeopleSuggesterSuggestLessFeedback *)self deviceIdentifier];
  unsigned int v11 = [(BMPeopleSuggesterSuggestLessFeedback *)self userIdentifier];
  unint64_t v12 = (void *)[v15 initWithFormat:@"BMPeopleSuggesterSuggestLessFeedback with identifier: %@, bundleId: %@, derivedIdentifier: %@, conversationIdentifier: %@, handle: %@, contactIdentifier: %@, itemIdentifier: %@, groupIdentifier: %@, deviceIdentifier: %@, userIdentifier: %@", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMPeopleSuggesterSuggestLessFeedback)initWithIdentifier:(id)a3 bundleId:(id)a4 derivedIdentifier:(id)a5 conversationIdentifier:(id)a6 handle:(id)a7 contactIdentifier:(id)a8 itemIdentifier:(id)a9 groupIdentifier:(id)a10 deviceIdentifier:(id)a11 userIdentifier:(id)a12
{
  id v33 = a3;
  id v32 = a4;
  id v25 = a5;
  id v31 = a5;
  id v26 = a6;
  id v30 = a6;
  id v29 = a7;
  id v27 = a8;
  id v28 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v34.receiver = self;
  v34.super_class = (Class)BMPeopleSuggesterSuggestLessFeedback;
  uint64_t v22 = [(BMEventBase *)&v34 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v22->_bundleId, a4);
    objc_storeStrong((id *)&v22->_derivedIdentifier, v25);
    objc_storeStrong((id *)&v22->_conversationIdentifier, v26);
    objc_storeStrong((id *)&v22->_handle, a7);
    objc_storeStrong((id *)&v22->_contactIdentifier, v27);
    objc_storeStrong((id *)&v22->_itemIdentifier, a9);
    objc_storeStrong((id *)&v22->_groupIdentifier, a10);
    objc_storeStrong((id *)&v22->_deviceIdentifier, a11);
    objc_storeStrong((id *)&v22->_userIdentifier, a12);
  }

  return v22;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleId" number:2 type:13 subMessageClass:0];
  v14[1] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"derivedIdentifier" number:3 type:13 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationIdentifier" number:4 type:13 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"handle" number:5 type:13 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactIdentifier" number:6 type:13 subMessageClass:0];
  v14[5] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemIdentifier" number:7 type:13 subMessageClass:0];
  v14[6] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"groupIdentifier" number:8 type:13 subMessageClass:0];
  v14[7] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceIdentifier" number:9 type:13 subMessageClass:0];
  v14[8] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userIdentifier" number:10 type:13 subMessageClass:0];
  v14[9] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF74D0;
}

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"derivedIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"handle" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contactIdentifier" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemIdentifier" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"groupIdentifier" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceIdentifier" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userIdentifier" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMPeopleSuggesterSuggestLessFeedback alloc] initByReadFrom:v7];
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