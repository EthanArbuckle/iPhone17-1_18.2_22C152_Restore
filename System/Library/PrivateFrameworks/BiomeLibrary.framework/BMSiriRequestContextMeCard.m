@interface BMSiriRequestContextMeCard
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRequestContextMeCard)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 nickName:(id)a6 fullName:(id)a7 addresses:(id)a8;
- (BMSiriRequestContextMeCard)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSArray)addresses;
- (NSString)description;
- (NSString)familyName;
- (NSString)fullName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)nickName;
- (id)_addressesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRequestContextMeCard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);

  objc_storeStrong((id *)&self->_givenName, 0);
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)givenName
{
  return self->_givenName;
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
    v6 = [(BMSiriRequestContextMeCard *)self givenName];
    uint64_t v7 = [v5 givenName];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriRequestContextMeCard *)self givenName];
      v10 = [v5 givenName];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMSiriRequestContextMeCard *)self middleName];
    uint64_t v14 = [v5 middleName];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriRequestContextMeCard *)self middleName];
      v17 = [v5 middleName];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMSiriRequestContextMeCard *)self familyName];
    uint64_t v20 = [v5 familyName];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriRequestContextMeCard *)self familyName];
      v23 = [v5 familyName];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    v25 = [(BMSiriRequestContextMeCard *)self nickName];
    uint64_t v26 = [v5 nickName];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriRequestContextMeCard *)self nickName];
      v29 = [v5 nickName];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_21;
      }
    }
    v31 = [(BMSiriRequestContextMeCard *)self fullName];
    uint64_t v32 = [v5 fullName];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSiriRequestContextMeCard *)self fullName];
      v35 = [v5 fullName];
      int v36 = [v34 isEqual:v35];

      if (!v36)
      {
LABEL_21:
        char v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v38 = [(BMSiriRequestContextMeCard *)self addresses];
    v39 = [v5 addresses];
    if (v38 == v39)
    {
      char v12 = 1;
    }
    else
    {
      v40 = [(BMSiriRequestContextMeCard *)self addresses];
      v41 = [v5 addresses];
      char v12 = [v40 isEqual:v41];
    }
    goto LABEL_22;
  }
  char v12 = 0;
LABEL_23:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriRequestContextMeCard *)self givenName];
  id v4 = [(BMSiriRequestContextMeCard *)self middleName];
  id v5 = [(BMSiriRequestContextMeCard *)self familyName];
  v6 = [(BMSiriRequestContextMeCard *)self nickName];
  uint64_t v7 = [(BMSiriRequestContextMeCard *)self fullName];
  v8 = [(BMSiriRequestContextMeCard *)self _addressesJSONArray];
  v21[0] = @"givenName";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = @"middleName";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"familyName";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  uint64_t v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"nickName";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"fullName";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"addresses";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_15;
    }
LABEL_23:

    if (v6) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }

  if (!v7) {
    goto LABEL_23;
  }
LABEL_15:
  if (v6) {
    goto LABEL_16;
  }
LABEL_24:

LABEL_16:
  if (v5)
  {
    if (v4) {
      goto LABEL_18;
    }
LABEL_26:

    if (v20) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v4) {
    goto LABEL_26;
  }
LABEL_18:
  if (v20) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v15;
}

- (id)_addressesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriRequestContextMeCard *)self addresses];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriRequestContextMeCard)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v130[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"givenName"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v129 = *MEMORY[0x1E4F28568];
        v33 = self;
        id v34 = [NSString alloc];
        uint64_t v92 = objc_opt_class();
        v35 = v34;
        self = v33;
        v29 = (void *)[v35 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v92, @"givenName"];
        v130[0] = v29;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:&v129 count:1];
        v37 = v31;
        uint64_t v9 = (void *)v36;
        id v38 = (id)[v37 initWithDomain:v32 code:2 userInfo:v36];
        v39 = p_isa;
        p_isa = 0;
        id v8 = 0;
        id *v39 = v38;
        goto LABEL_69;
      }
      id v8 = 0;
      goto LABEL_70;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"middleName"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v40 = p_isa;
        v41 = v9;
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v43 = v8;
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v127 = *MEMORY[0x1E4F28568];
        v45 = v7;
        id v46 = [NSString alloc];
        uint64_t v93 = objc_opt_class();
        v47 = v46;
        uint64_t v7 = v45;
        int v30 = (void *)[v47 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v93, @"middleName"];
        v128 = v30;
        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
        v49 = v42;
        uint64_t v9 = v41;
        uint64_t v50 = v44;
        id v8 = v43;
        v108 = (void *)v48;
        p_isa = 0;
        v29 = 0;
        id *v40 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2);
        goto LABEL_68;
      }
      v29 = 0;
      goto LABEL_69;
    }
    id v106 = v9;
  }
  else
  {
    id v106 = 0;
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"familyName"];
  v108 = (void *)v10;
  if (v10 && (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v51 = p_isa;
        v52 = v9;
        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v54 = v8;
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v125 = *MEMORY[0x1E4F28568];
        v56 = v7;
        id v57 = [NSString alloc];
        uint64_t v94 = objc_opt_class();
        v58 = v57;
        uint64_t v7 = v56;
        id v107 = (id)[v58 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v94, @"familyName"];
        id v126 = v107;
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        v60 = v53;
        uint64_t v9 = v52;
        uint64_t v61 = v55;
        id v8 = v54;
        v105 = (void *)v59;
        p_isa = 0;
        int v30 = 0;
        id *v51 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        v29 = v106;
        goto LABEL_67;
      }
      int v30 = 0;
      v29 = v106;
      goto LABEL_68;
    }
    id v103 = v11;
  }
  else
  {
    id v103 = 0;
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"nickName"];
  v105 = (void *)v12;
  if (v12 && (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        id v107 = 0;
        v29 = v106;
        int v30 = v103;
        goto LABEL_67;
      }
      v62 = p_isa;
      v63 = v9;
      id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v65 = v8;
      uint64_t v66 = *MEMORY[0x1E4F502C8];
      uint64_t v123 = *MEMORY[0x1E4F28568];
      v67 = v7;
      id v68 = [NSString alloc];
      uint64_t v95 = objc_opt_class();
      v69 = v68;
      uint64_t v7 = v67;
      id v104 = (id)[v69 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v95, @"nickName"];
      id v124 = v104;
      uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      v71 = v64;
      uint64_t v9 = v63;
      uint64_t v72 = v66;
      id v8 = v65;
      v102 = (void *)v70;
      p_isa = 0;
      id v107 = 0;
      id *v62 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2);
      goto LABEL_78;
    }
    v99 = v9;
    id v107 = v13;
  }
  else
  {
    v99 = v9;
    id v107 = 0;
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"fullName"];
  v100 = v7;
  id v101 = v8;
  v102 = (void *)v14;
  if (!v14 || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v104 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (p_isa)
    {
      v73 = v7;
      id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v75 = *MEMORY[0x1E4F502C8];
      uint64_t v121 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fullName"];
      id v122 = v16;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
      v76 = v74;
      uint64_t v7 = v73;
      id v77 = (id)[v76 initWithDomain:v75 code:2 userInfo:v19];
      v78 = p_isa;
      p_isa = 0;
      id v104 = 0;
      id *v78 = v77;
LABEL_62:
      v29 = v106;
      goto LABEL_63;
    }
    id v104 = 0;
    uint64_t v9 = v99;
LABEL_78:
    v29 = v106;
    int v30 = v103;
    goto LABEL_66;
  }
  id v104 = v15;
LABEL_16:
  id v16 = [v6 objectForKeyedSubscript:@"addresses"];
  uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  int v18 = [v16 isEqual:v17];

  if (!v18)
  {
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v96 = p_isa;
      v97 = self;
      id v98 = v6;
      goto LABEL_27;
    }
    v29 = v106;
    if (!p_isa)
    {
      uint64_t v7 = v100;
      int v30 = v103;
      goto LABEL_65;
    }
    id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v89 = *MEMORY[0x1E4F502C8];
    uint64_t v119 = *MEMORY[0x1E4F28568];
    v19 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"addresses"];
    v120 = v19;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
    v91 = v90 = p_isa;
    id *v90 = (id)[v88 initWithDomain:v89 code:2 userInfo:v91];

    p_isa = 0;
    uint64_t v7 = v100;
LABEL_63:
    int v30 = v103;
    goto LABEL_64;
  }
  v96 = p_isa;
  v97 = self;
  id v98 = v6;

  id v16 = 0;
LABEL_27:
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v16 = v16;
  uint64_t v20 = [v16 countByEnumeratingWithState:&v110 objects:v118 count:16];
  if (!v20) {
    goto LABEL_37;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v111;
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v111 != v22) {
        objc_enumerationMutation(v16);
      }
      int v24 = *(void **)(*((void *)&v110 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self = v97;
        id v6 = v98;
        uint64_t v7 = v100;
        v79 = v96;
        if (v96)
        {
          id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v81 = *MEMORY[0x1E4F502C8];
          uint64_t v116 = *MEMORY[0x1E4F28568];
          id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"addresses"];
          id v117 = v25;
          v82 = (void *)MEMORY[0x1E4F1C9E8];
          v83 = &v117;
          v84 = &v116;
LABEL_56:
          v85 = [v82 dictionaryWithObjects:v83 forKeys:v84 count:1];
          v86 = v80;
          uint64_t v7 = v100;
          id *v79 = (id)[v86 initWithDomain:v81 code:2 userInfo:v85];
LABEL_60:
        }
LABEL_61:

        p_isa = 0;
        goto LABEL_62;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v97;
        id v6 = v98;
        uint64_t v7 = v100;
        v79 = v96;
        if (v96)
        {
          id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v81 = *MEMORY[0x1E4F502C8];
          uint64_t v114 = *MEMORY[0x1E4F28568];
          id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"addresses"];
          id v115 = v25;
          v82 = (void *)MEMORY[0x1E4F1C9E8];
          v83 = &v115;
          v84 = &v114;
          goto LABEL_56;
        }
        goto LABEL_61;
      }
      id v25 = v24;
      uint64_t v26 = [BMSiriRequestContextAddress alloc];
      id v109 = 0;
      v27 = [(BMSiriRequestContextAddress *)v26 initWithJSONDictionary:v25 error:&v109];
      id v28 = v109;
      if (v28)
      {
        v85 = v28;
        if (v96) {
          id *v96 = v28;
        }

        self = v97;
        id v6 = v98;
        uint64_t v7 = v100;
        goto LABEL_60;
      }
      [v19 addObject:v27];
    }
    uint64_t v21 = [v16 countByEnumeratingWithState:&v110 objects:v118 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_37:

  v29 = v106;
  int v30 = v103;
  self = [(BMSiriRequestContextMeCard *)v97 initWithGivenName:v101 middleName:v106 familyName:v103 nickName:v107 fullName:v104 addresses:v19];
  p_isa = (id *)&self->super.super.isa;
  id v6 = v98;
  uint64_t v7 = v100;
LABEL_64:

LABEL_65:
  id v8 = v101;
  uint64_t v9 = v99;
LABEL_66:

LABEL_67:
LABEL_68:

LABEL_69:
LABEL_70:

  return (BMSiriRequestContextMeCard *)p_isa;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriRequestContextMeCard *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_givenName) {
    PBDataWriterWriteStringField();
  }
  if (self->_middleName) {
    PBDataWriterWriteStringField();
  }
  if (self->_familyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_nickName) {
    PBDataWriterWriteStringField();
  }
  if (self->_fullName) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_addresses;
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMSiriRequestContextMeCard;
  uint64_t v5 = [(BMEventBase *)&v31 init];
  if (!v5)
  {
LABEL_35:
    v29 = v5;
    goto LABEL_36;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_33:
    uint64_t v26 = [v6 copy];
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v26;

    int v28 = v4[*v9];
    if (v28) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  uint64_t v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_33;
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
      if (v12++ >= 9)
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
      goto LABEL_33;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 24;
        goto LABEL_27;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 32;
        goto LABEL_27;
      case 3u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 40;
        goto LABEL_27;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 48;
        goto LABEL_27;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 56;
LABEL_27:
        v23 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_28;
      case 6u:
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_37;
        }
        id v24 = [[BMSiriRequestContextAddress alloc] initByReadFrom:v4];
        if (!v24) {
          goto LABEL_37;
        }
        id v25 = v24;
        [v6 addObject:v24];
        PBReaderRecallMark();

        goto LABEL_28;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_28:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_33;
          }
          continue;
        }
LABEL_37:

LABEL_34:
        v29 = 0;
LABEL_36:

        return v29;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriRequestContextMeCard *)self givenName];
  uint64_t v5 = [(BMSiriRequestContextMeCard *)self middleName];
  uint64_t v6 = [(BMSiriRequestContextMeCard *)self familyName];
  uint64_t v7 = [(BMSiriRequestContextMeCard *)self nickName];
  uint64_t v8 = [(BMSiriRequestContextMeCard *)self fullName];
  uint64_t v9 = [(BMSiriRequestContextMeCard *)self addresses];
  uint64_t v10 = (void *)[v3 initWithFormat:@"BMSiriRequestContextMeCard with givenName: %@, middleName: %@, familyName: %@, nickName: %@, fullName: %@, addresses: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriRequestContextMeCard)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 nickName:(id)a6 fullName:(id)a7 addresses:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMSiriRequestContextMeCard;
  int v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_givenName, a3);
    objc_storeStrong((id *)&v18->_middleName, a4);
    objc_storeStrong((id *)&v18->_familyName, a5);
    objc_storeStrong((id *)&v18->_nickName, a6);
    objc_storeStrong((id *)&v18->_fullName, a7);
    objc_storeStrong((id *)&v18->_addresses, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"givenName" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"middleName" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"familyName" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nickName" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fullName" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"addresses" number:6 type:14 subMessageClass:objc_opt_class()];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF51A8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"givenName" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"middleName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"familyName" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nickName" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fullName" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"addresses_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_275];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __37__BMSiriRequestContextMeCard_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _addressesJSONArray];
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

    uint64_t v8 = [[BMSiriRequestContextMeCard alloc] initByReadFrom:v7];
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