@interface BMMapsRecentConversationsIntentContactInformation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMapsRecentConversationsIntentContactInformation)initWithIdentifier:(id)a3 fullDisplayName:(id)a4 friendlyName:(id)a5 emailAddress:(id)a6 phoneNumber:(id)a7;
- (BMMapsRecentConversationsIntentContactInformation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)emailAddress;
- (NSArray)phoneNumber;
- (NSString)description;
- (NSString)friendlyName;
- (NSString)fullDisplayName;
- (NSString)identifier;
- (id)_emailAddressJSONArray;
- (id)_phoneNumberJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMapsRecentConversationsIntentContactInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_fullDisplayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)phoneNumber
{
  return self->_phoneNumber;
}

- (NSArray)emailAddress
{
  return self->_emailAddress;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (NSString)fullDisplayName
{
  return self->_fullDisplayName;
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
    v6 = [(BMMapsRecentConversationsIntentContactInformation *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMapsRecentConversationsIntentContactInformation *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMMapsRecentConversationsIntentContactInformation *)self fullDisplayName];
    uint64_t v14 = [v5 fullDisplayName];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMapsRecentConversationsIntentContactInformation *)self fullDisplayName];
      v17 = [v5 fullDisplayName];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMMapsRecentConversationsIntentContactInformation *)self friendlyName];
    uint64_t v20 = [v5 friendlyName];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMapsRecentConversationsIntentContactInformation *)self friendlyName];
      v23 = [v5 friendlyName];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMMapsRecentConversationsIntentContactInformation *)self emailAddress];
    uint64_t v26 = [v5 emailAddress];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMMapsRecentConversationsIntentContactInformation *)self emailAddress];
      v29 = [v5 emailAddress];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMMapsRecentConversationsIntentContactInformation *)self phoneNumber];
    v32 = [v5 phoneNumber];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMMapsRecentConversationsIntentContactInformation *)self phoneNumber];
      v34 = [v5 phoneNumber];
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
  v3 = [(BMMapsRecentConversationsIntentContactInformation *)self identifier];
  id v4 = [(BMMapsRecentConversationsIntentContactInformation *)self fullDisplayName];
  id v5 = [(BMMapsRecentConversationsIntentContactInformation *)self friendlyName];
  v6 = [(BMMapsRecentConversationsIntentContactInformation *)self _emailAddressJSONArray];
  uint64_t v7 = [(BMMapsRecentConversationsIntentContactInformation *)self _phoneNumberJSONArray];
  v17 = @"identifier";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  int v18 = @"fullDisplayName";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"friendlyName";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  uint64_t v20 = @"emailAddress";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"phoneNumber";
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

- (id)_phoneNumberJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMapsRecentConversationsIntentContactInformation *)self phoneNumber];
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

- (id)_emailAddressJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMapsRecentConversationsIntentContactInformation *)self emailAddress];
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

- (BMMapsRecentConversationsIntentContactInformation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v104 = *MEMORY[0x1E4F28568];
        v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        v105[0] = v32;
        uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:&v104 count:1];
        v34 = v30;
        v9 = (void *)v33;
        id v35 = (id)[v34 initWithDomain:v31 code:2 userInfo:v33];
        id v8 = 0;
        v36 = 0;
        *a4 = v35;
        goto LABEL_72;
      }
      id v8 = 0;
      v36 = 0;
      goto LABEL_73;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"fullDisplayName"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v39 = v9;
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v102 = *MEMORY[0x1E4F28568];
        v42 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fullDisplayName"];
        v103 = v42;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        v44 = v40;
        v9 = v39;
        v77 = (void *)v43;
        id v45 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v41, 2);
        v32 = 0;
        v36 = 0;
        *a4 = v45;
        goto LABEL_71;
      }
      v32 = 0;
      v36 = 0;
      goto LABEL_72;
    }
    id v76 = v9;
  }
  else
  {
    id v76 = 0;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"friendlyName"];
  v73 = v9;
  v74 = v7;
  v77 = (void *)v10;
  if (v10 && (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v100 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"friendlyName"];
        id v101 = v12;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        id v48 = (id)[v46 initWithDomain:v47 code:2 userInfo:v15];
        id v75 = 0;
        v36 = 0;
        *a4 = v48;
        v32 = v76;
        goto LABEL_69;
      }
      v42 = 0;
      v36 = 0;
      v32 = v76;
      goto LABEL_71;
    }
    id v75 = v11;
  }
  else
  {
    id v75 = 0;
  }
  id v12 = [v6 objectForKeyedSubscript:@"emailAddress"];
  long long v13 = [MEMORY[0x1E4F1CA98] null];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v71 = v6;
    v72 = a4;
    v70 = self;

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
          v36 = 0;
          v32 = v76;
          goto LABEL_70;
        }
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        v55 = a4;
        uint64_t v56 = *MEMORY[0x1E4F502C8];
        uint64_t v98 = *MEMORY[0x1E4F28568];
        uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"emailAddress"];
        v99 = v15;
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        id v57 = (id)[v54 initWithDomain:v56 code:2 userInfo:v21];
        v36 = 0;
        id *v55 = v57;
        goto LABEL_58;
      }
    }
    v71 = v6;
    v72 = a4;
    v70 = self;
  }
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v12 = v12;
  uint64_t v16 = [v12 countByEnumeratingWithState:&v82 objects:v97 count:16];
  id v69 = v8;
  if (!v16) {
    goto LABEL_26;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v83;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v83 != v18) {
        objc_enumerationMutation(v12);
      }
      uint64_t v20 = *(void *)(*((void *)&v82 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v72)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = *MEMORY[0x1E4F502C8];
          uint64_t v95 = *MEMORY[0x1E4F28568];
          uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"emailAddress"];
          v96 = v26;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          v28 = v24;
          uint64_t v29 = v25;
LABEL_38:
          id v8 = v69;
          v32 = v76;
          id *v72 = (id)[v28 initWithDomain:v29 code:2 userInfo:v27];

          v36 = 0;
          id v21 = v12;
          goto LABEL_66;
        }
LABEL_41:
        v36 = 0;
        id v21 = v12;
        self = v70;
        id v6 = v71;
        id v8 = v69;
LABEL_58:
        v32 = v76;
        goto LABEL_68;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v72)
        {
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v93 = *MEMORY[0x1E4F28568];
          uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"emailAddress"];
          v94 = v26;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          v28 = v37;
          uint64_t v29 = v38;
          goto LABEL_38;
        }
        goto LABEL_41;
      }
      [v15 addObject:v20];
    }
    uint64_t v17 = [v12 countByEnumeratingWithState:&v82 objects:v97 count:16];
    id v8 = v69;
  }
  while (v17);
LABEL_26:

  id v6 = v71;
  id v21 = [v71 objectForKeyedSubscript:@"phoneNumber"];
  v22 = [MEMORY[0x1E4F1CA98] null];
  int v23 = [v21 isEqual:v22];

  if (v23)
  {

    id v21 = 0;
    goto LABEL_46;
  }
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v72)
      {
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v66 = *MEMORY[0x1E4F502C8];
        uint64_t v91 = *MEMORY[0x1E4F28568];
        uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"phoneNumber"];
        v92 = v26;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        id *v72 = (id)[v65 initWithDomain:v66 code:2 userInfo:v67];

        v36 = 0;
        v32 = v76;
        goto LABEL_67;
      }
      v36 = 0;
      self = v70;
      goto LABEL_58;
    }
  }
LABEL_46:
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v21 = v21;
  uint64_t v49 = [v21 countByEnumeratingWithState:&v78 objects:v90 count:16];
  if (!v49) {
    goto LABEL_55;
  }
  uint64_t v50 = v49;
  uint64_t v51 = *(void *)v79;
  while (2)
  {
    uint64_t v52 = 0;
    while (2)
    {
      if (*(void *)v79 != v51) {
        objc_enumerationMutation(v21);
      }
      uint64_t v53 = *(void *)(*((void *)&v78 + 1) + 8 * v52);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v69;
        v32 = v76;
        if (v72)
        {
          id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v88 = *MEMORY[0x1E4F28568];
          v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"phoneNumber"];
          v89 = v59;
          v60 = (void *)MEMORY[0x1E4F1C9E8];
          v61 = &v89;
          v62 = &v88;
LABEL_64:
          v63 = [v60 dictionaryWithObjects:v61 forKeys:v62 count:1];
          id *v72 = (id)[v58 initWithDomain:v68 code:2 userInfo:v63];
        }
LABEL_65:

        v36 = 0;
        goto LABEL_66;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = v69;
        v32 = v76;
        if (v72)
        {
          id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v86 = *MEMORY[0x1E4F28568];
          v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"phoneNumber"];
          v87 = v59;
          v60 = (void *)MEMORY[0x1E4F1C9E8];
          v61 = &v87;
          v62 = &v86;
          goto LABEL_64;
        }
        goto LABEL_65;
      }
      [v26 addObject:v53];
      if (v50 != ++v52) {
        continue;
      }
      break;
    }
    uint64_t v50 = [v21 countByEnumeratingWithState:&v78 objects:v90 count:16];
    if (v50) {
      continue;
    }
    break;
  }
LABEL_55:

  id v8 = v69;
  v32 = v76;
  v36 = [(BMMapsRecentConversationsIntentContactInformation *)v70 initWithIdentifier:v69 fullDisplayName:v76 friendlyName:v75 emailAddress:v15 phoneNumber:v26];
  v70 = v36;
LABEL_66:
  id v6 = v71;
LABEL_67:

  self = v70;
LABEL_68:

LABEL_69:
  v9 = v73;
LABEL_70:

  uint64_t v7 = v74;
  v42 = v75;
LABEL_71:

LABEL_72:
LABEL_73:

  return v36;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMapsRecentConversationsIntentContactInformation *)self writeTo:v3];
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
  if (self->_fullDisplayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_friendlyName) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_emailAddress;
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
  uint64_t v10 = self->_phoneNumber;
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
  v35.receiver = self;
  v35.super_class = (Class)BMMapsRecentConversationsIntentContactInformation;
  uint64_t v5 = [(BMEventBase *)&v35 init];
  if (!v5)
  {
LABEL_35:
    uint64_t v33 = v5;
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
    uint64_t v28 = [v6 copy];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSArray *)v28;

    uint64_t v30 = [v7 copy];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSArray *)v30;

    int v32 = v4[*v10];
    if (v32) {
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
      goto LABEL_33;
    }
    switch((v14 >> 3))
    {
      case 1u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 24;
        goto LABEL_25;
      case 2u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 32;
        goto LABEL_25;
      case 3u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 40;
LABEL_25:
        id v24 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;
        goto LABEL_31;
      case 4u:
        uint64_t v25 = PBReaderReadString();
        if (!v25) {
          goto LABEL_37;
        }
        id v24 = (void *)v25;
        uint64_t v26 = v6;
        goto LABEL_30;
      case 5u:
        uint64_t v27 = PBReaderReadString();
        if (!v27) {
          goto LABEL_37;
        }
        id v24 = (void *)v27;
        uint64_t v26 = v7;
LABEL_30:
        [v26 addObject:v24];
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
        uint64_t v33 = 0;
LABEL_36:

        return v33;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMapsRecentConversationsIntentContactInformation *)self identifier];
  uint64_t v5 = [(BMMapsRecentConversationsIntentContactInformation *)self fullDisplayName];
  uint64_t v6 = [(BMMapsRecentConversationsIntentContactInformation *)self friendlyName];
  uint64_t v7 = [(BMMapsRecentConversationsIntentContactInformation *)self emailAddress];
  uint64_t v8 = [(BMMapsRecentConversationsIntentContactInformation *)self phoneNumber];
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMMapsRecentConversationsIntentContactInformation with identifier: %@, fullDisplayName: %@, friendlyName: %@, emailAddress: %@, phoneNumber: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMMapsRecentConversationsIntentContactInformation)initWithIdentifier:(id)a3 fullDisplayName:(id)a4 friendlyName:(id)a5 emailAddress:(id)a6 phoneNumber:(id)a7
{
  id v19 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMMapsRecentConversationsIntentContactInformation;
  unint64_t v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v17->_fullDisplayName, a4);
    objc_storeStrong((id *)&v17->_friendlyName, a5);
    objc_storeStrong((id *)&v17->_emailAddress, a6);
    objc_storeStrong((id *)&v17->_phoneNumber, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"fullDisplayName", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"friendlyName" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"emailAddress" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"phoneNumber" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7188;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fullDisplayName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"friendlyName" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"emailAddress_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_104];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"phoneNumber_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_106_81575];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __60__BMMapsRecentConversationsIntentContactInformation_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _phoneNumberJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __60__BMMapsRecentConversationsIntentContactInformation_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _emailAddressJSONArray];
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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMapsRecentConversationsIntentContactInformation alloc] initByReadFrom:v7];
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