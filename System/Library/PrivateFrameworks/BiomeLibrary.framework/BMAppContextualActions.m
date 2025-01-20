@interface BMAppContextualActions
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppContextualActions)initWithIdentifier:(id)a3 appName:(id)a4 actionName:(id)a5 content:(id)a6 parameter:(id)a7;
- (BMAppContextualActions)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)content;
- (NSArray)parameter;
- (NSString)actionName;
- (NSString)appName;
- (NSString)description;
- (NSString)identifier;
- (id)_contentJSONArray;
- (id)_parameterJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAppContextualActions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)parameter
{
  return self->_parameter;
}

- (NSArray)content
{
  return self->_content;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSString)appName
{
  return self->_appName;
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
    v6 = [(BMAppContextualActions *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppContextualActions *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMAppContextualActions *)self appName];
    uint64_t v14 = [v5 appName];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAppContextualActions *)self appName];
      v17 = [v5 appName];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMAppContextualActions *)self actionName];
    uint64_t v20 = [v5 actionName];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMAppContextualActions *)self actionName];
      v23 = [v5 actionName];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMAppContextualActions *)self content];
    uint64_t v26 = [v5 content];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMAppContextualActions *)self content];
      v29 = [v5 content];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMAppContextualActions *)self parameter];
    v32 = [v5 parameter];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMAppContextualActions *)self parameter];
      v34 = [v5 parameter];
      char v12 = [v33 isEqual:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAppContextualActions *)self identifier];
  id v4 = [(BMAppContextualActions *)self appName];
  id v5 = [(BMAppContextualActions *)self actionName];
  v6 = [(BMAppContextualActions *)self _contentJSONArray];
  uint64_t v7 = [(BMAppContextualActions *)self _parameterJSONArray];
  v17 = @"identifier";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  int v18 = @"appName";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"actionName";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  uint64_t v20 = @"content";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"parameter";
  char v12 = v7;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4) {
      goto LABEL_15;
    }
LABEL_22:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v4) {
    goto LABEL_22;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (id)_parameterJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMAppContextualActions *)self parameter];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) base64EncodedStringWithOptions:0];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_contentJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMAppContextualActions *)self content];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) base64EncodedStringWithOptions:0];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMAppContextualActions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v106 = *MEMORY[0x1E4F28568];
        v33 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        v107[0] = v33;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:&v106 count:1];
        v35 = v31;
        v9 = (void *)v34;
        id v36 = (id)[v35 initWithDomain:v32 code:2 userInfo:v34];
        id v8 = 0;
        v37 = 0;
        *a4 = v36;
        goto LABEL_72;
      }
      id v8 = 0;
      v37 = 0;
      goto LABEL_73;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"appName"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v41 = v9;
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v104 = *MEMORY[0x1E4F28568];
        uint64_t v44 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appName"];
        uint64_t v105 = v44;
        uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
        v46 = v42;
        v9 = v41;
        v40 = (void *)v44;
        v79 = (void *)v45;
        id v47 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v43, 2);
        v33 = 0;
        v37 = 0;
        *a4 = v47;
        goto LABEL_71;
      }
      v33 = 0;
      v37 = 0;
      goto LABEL_72;
    }
    id v78 = v9;
  }
  else
  {
    id v78 = 0;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"actionName"];
  v77 = v7;
  v75 = v9;
  v79 = (void *)v10;
  if (v10 && (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v102 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"actionName"];
        id v103 = v12;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        id v50 = (id)[v48 initWithDomain:v49 code:2 userInfo:v16];
        v40 = 0;
        v37 = 0;
        *a4 = v50;
        v33 = v78;
        goto LABEL_69;
      }
      v40 = 0;
      v37 = 0;
      v33 = v78;
      goto LABEL_71;
    }
    id v74 = v11;
  }
  else
  {
    id v74 = 0;
  }
  id v12 = [v6 objectForKeyedSubscript:@"content"];
  long long v13 = [MEMORY[0x1E4F1CA98] null];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v76 = a4;
    v73 = self;
    uint64_t v15 = v6;

    id v12 = 0;
  }
  else
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v33 = v78;
          v40 = v74;
          goto LABEL_70;
        }
        id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
        v57 = a4;
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v100 = *MEMORY[0x1E4F28568];
        uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"content"];
        v101 = v16;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        id v59 = (id)[v56 initWithDomain:v58 code:2 userInfo:v22];
        v37 = 0;
        id *v57 = v59;
        goto LABEL_59;
      }
    }
    v76 = a4;
    v73 = self;
    uint64_t v15 = v6;
  }
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v12 = v12;
  uint64_t v17 = [v12 countByEnumeratingWithState:&v84 objects:v99 count:16];
  id v72 = v8;
  if (!v17) {
    goto LABEL_26;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v85;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v85 != v19) {
        objc_enumerationMutation(v12);
      }
      uint64_t v21 = *(void *)(*((void *)&v84 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v76)
        {
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v26 = *MEMORY[0x1E4F502C8];
          uint64_t v97 = *MEMORY[0x1E4F28568];
          v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"content"];
          v98 = v27;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          v29 = v25;
          uint64_t v30 = v26;
LABEL_38:
          id v6 = v15;
          id v8 = v72;
          v33 = v78;
          v40 = v74;
          id *v76 = (id)[v29 initWithDomain:v30 code:2 userInfo:v28];

          v37 = 0;
          id v22 = v12;
          goto LABEL_67;
        }
LABEL_41:
        v37 = 0;
        id v22 = v12;
        id v6 = v15;
        id v8 = v72;
        self = v73;
LABEL_59:
        v33 = v78;
        v40 = v74;
        goto LABEL_68;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v76)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v95 = *MEMORY[0x1E4F28568];
          v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"content"];
          v96 = v27;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          v29 = v38;
          uint64_t v30 = v39;
          goto LABEL_38;
        }
        goto LABEL_41;
      }
      [v16 addObject:v21];
    }
    uint64_t v18 = [v12 countByEnumeratingWithState:&v84 objects:v99 count:16];
    id v8 = v72;
  }
  while (v18);
LABEL_26:

  id v6 = v15;
  id v22 = [v15 objectForKeyedSubscript:@"parameter"];
  v23 = [MEMORY[0x1E4F1CA98] null];
  int v24 = [v22 isEqual:v23];

  if (v24)
  {
    v71 = v15;

    id v22 = 0;
    goto LABEL_47;
  }
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v76)
      {
        id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v67 = *MEMORY[0x1E4F502C8];
        uint64_t v93 = *MEMORY[0x1E4F28568];
        v27 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"parameter"];
        v94 = v27;
        v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        id *v76 = (id)[v66 initWithDomain:v67 code:2 userInfo:v68];

        v37 = 0;
        v33 = v78;
        v40 = v74;
        goto LABEL_67;
      }
      v37 = 0;
      self = v73;
      goto LABEL_59;
    }
  }
  v71 = v15;
LABEL_47:
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v22 = v22;
  uint64_t v51 = [v22 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (!v51) {
    goto LABEL_56;
  }
  uint64_t v52 = v51;
  uint64_t v53 = *(void *)v81;
  while (2)
  {
    uint64_t v54 = 0;
    while (2)
    {
      if (*(void *)v81 != v53) {
        objc_enumerationMutation(v22);
      }
      uint64_t v55 = *(void *)(*((void *)&v80 + 1) + 8 * v54);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v71;
        id v8 = v72;
        v33 = v78;
        v40 = v74;
        if (v76)
        {
          id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v90 = *MEMORY[0x1E4F28568];
          v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"parameter"];
          v91 = v60;
          v61 = (void *)MEMORY[0x1E4F1C9E8];
          v62 = &v91;
          v63 = &v90;
LABEL_65:
          v64 = [v61 dictionaryWithObjects:v62 forKeys:v63 count:1];
          id *v76 = (id)[v70 initWithDomain:v69 code:2 userInfo:v64];
        }
LABEL_66:

        v37 = 0;
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = v71;
        id v8 = v72;
        v33 = v78;
        v40 = v74;
        if (v76)
        {
          id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v88 = *MEMORY[0x1E4F28568];
          v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"parameter"];
          v89 = v60;
          v61 = (void *)MEMORY[0x1E4F1C9E8];
          v62 = &v89;
          v63 = &v88;
          goto LABEL_65;
        }
        goto LABEL_66;
      }
      [v27 addObject:v55];
      if (v52 != ++v54) {
        continue;
      }
      break;
    }
    uint64_t v52 = [v22 countByEnumeratingWithState:&v80 objects:v92 count:16];
    if (v52) {
      continue;
    }
    break;
  }
LABEL_56:

  id v8 = v72;
  v33 = v78;
  v40 = v74;
  v37 = [(BMAppContextualActions *)v73 initWithIdentifier:v72 appName:v78 actionName:v74 content:v16 parameter:v27];
  v73 = v37;
  id v6 = v71;
LABEL_67:

  self = v73;
LABEL_68:

LABEL_69:
  v9 = v75;
LABEL_70:

  uint64_t v7 = v77;
LABEL_71:

LABEL_72:
LABEL_73:

  return v37;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppContextualActions *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_appName) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionName) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_content;
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
        PBDataWriterWriteDataField();
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
  uint64_t v10 = self->_parameter;
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
        PBDataWriterWriteDataField();
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
  v34.receiver = self;
  v34.super_class = (Class)BMAppContextualActions;
  uint64_t v5 = [(BMEventBase *)&v34 init];
  if (!v5)
  {
LABEL_35:
    uint64_t v32 = v5;
    goto LABEL_36;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_33:
    uint64_t v27 = [v6 copy];
    content = v5->_content;
    v5->_content = (NSArray *)v27;

    uint64_t v29 = [v7 copy];
    parameter = v5->_parameter;
    v5->_parameter = (NSArray *)v29;

    int v31 = v4[*v10];
    if (v31) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v10]) {
      goto LABEL_33;
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
      if (v13++ >= 9)
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
      goto LABEL_33;
    }
    switch((v14 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 24;
        goto LABEL_25;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 32;
        goto LABEL_25;
      case 3u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 40;
LABEL_25:
        v23 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
        goto LABEL_31;
      case 4u:
        uint64_t v24 = PBReaderReadData();
        if (!v24) {
          goto LABEL_37;
        }
        v23 = (void *)v24;
        uint64_t v25 = v6;
        goto LABEL_30;
      case 5u:
        uint64_t v26 = PBReaderReadData();
        if (!v26) {
          goto LABEL_37;
        }
        v23 = (void *)v26;
        uint64_t v25 = v7;
LABEL_30:
        [v25 addObject:v23];
LABEL_31:

        goto LABEL_32;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_32:
          if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
            goto LABEL_33;
          }
          continue;
        }
LABEL_37:

LABEL_34:
        uint64_t v32 = 0;
LABEL_36:

        return v32;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppContextualActions *)self identifier];
  uint64_t v5 = [(BMAppContextualActions *)self appName];
  uint64_t v6 = [(BMAppContextualActions *)self actionName];
  uint64_t v7 = [(BMAppContextualActions *)self content];
  uint64_t v8 = [(BMAppContextualActions *)self parameter];
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMAppContextualActions with identifier: %@, appName: %@, actionName: %@, content: %@, parameter: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMAppContextualActions)initWithIdentifier:(id)a3 appName:(id)a4 actionName:(id)a5 content:(id)a6 parameter:(id)a7
{
  id v19 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMAppContextualActions;
  char v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v17->_appName, a4);
    objc_storeStrong((id *)&v17->_actionName, a5);
    objc_storeStrong((id *)&v17->_content, a6);
    objc_storeStrong((id *)&v17->_parameter, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"appName", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionName" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"content" number:4 type:14 subMessageClass:0];
  v9[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parameter" number:5 type:14 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5D00;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionName" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"content_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_55916];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"parameter_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_47_55917];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __33__BMAppContextualActions_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _parameterJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __33__BMAppContextualActions_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _contentJSONArray];
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

    uint64_t v7 = [[BMAppContextualActions alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[4] = 1;
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