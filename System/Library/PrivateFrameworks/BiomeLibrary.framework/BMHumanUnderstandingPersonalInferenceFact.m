@interface BMHumanUnderstandingPersonalInferenceFact
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHumanUnderstandingPersonalInferenceFact)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMHumanUnderstandingPersonalInferenceFact)initWithSubjectID:(id)a3 subjectAlias:(id)a4 subjectIsa:(id)a5 predicateID:(id)a6 objectID:(id)a7 objectAlias:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSArray)subjectIsa;
- (NSString)description;
- (NSString)objectAlias;
- (NSString)objectID;
- (NSString)predicateID;
- (NSString)subjectAlias;
- (NSString)subjectID;
- (id)_subjectIsaJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMHumanUnderstandingPersonalInferenceFact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectAlias, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_predicateID, 0);
  objc_storeStrong((id *)&self->_subjectIsa, 0);
  objc_storeStrong((id *)&self->_subjectAlias, 0);

  objc_storeStrong((id *)&self->_subjectID, 0);
}

- (NSString)objectAlias
{
  return self->_objectAlias;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (NSString)predicateID
{
  return self->_predicateID;
}

- (NSArray)subjectIsa
{
  return self->_subjectIsa;
}

- (NSString)subjectAlias
{
  return self->_subjectAlias;
}

- (NSString)subjectID
{
  return self->_subjectID;
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
    v6 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectID];
    uint64_t v7 = [v5 subjectID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectID];
      v10 = [v5 subjectID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectAlias];
    uint64_t v14 = [v5 subjectAlias];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectAlias];
      v17 = [v5 subjectAlias];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectIsa];
    uint64_t v20 = [v5 subjectIsa];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectIsa];
      v23 = [v5 subjectIsa];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    v25 = [(BMHumanUnderstandingPersonalInferenceFact *)self predicateID];
    uint64_t v26 = [v5 predicateID];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMHumanUnderstandingPersonalInferenceFact *)self predicateID];
      v29 = [v5 predicateID];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_21;
      }
    }
    v31 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectID];
    uint64_t v32 = [v5 objectID];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectID];
      v35 = [v5 objectID];
      int v36 = [v34 isEqual:v35];

      if (!v36)
      {
LABEL_21:
        char v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v38 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectAlias];
    v39 = [v5 objectAlias];
    if (v38 == v39)
    {
      char v12 = 1;
    }
    else
    {
      v40 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectAlias];
      v41 = [v5 objectAlias];
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
  uint64_t v3 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectID];
  id v4 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectAlias];
  id v5 = [(BMHumanUnderstandingPersonalInferenceFact *)self _subjectIsaJSONArray];
  v6 = [(BMHumanUnderstandingPersonalInferenceFact *)self predicateID];
  uint64_t v7 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectID];
  v8 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectAlias];
  v21[0] = @"subjectID";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = @"subjectAlias";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"subjectIsa";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  uint64_t v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"predicateID";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"objectID";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"objectAlias";
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

- (id)_subjectIsaJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectIsa];
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

- (BMHumanUnderstandingPersonalInferenceFact)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"subjectID"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v35 = a4;
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v85 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subjectID"];
        v86[0] = v11;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
        id v39 = (id)[v36 initWithDomain:v37 code:2 userInfo:v38];
        id v8 = 0;
        v29 = 0;
        id *v35 = v39;
        long long v10 = (void *)v38;
        goto LABEL_71;
      }
      id v8 = 0;
      v29 = 0;
      goto LABEL_72;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"subjectAlias"];
  v63 = v7;
  v64 = (void *)v9;
  id v65 = v8;
  if (v9 && (long long v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subjectAlias"];
        id v84 = v12;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id v11 = 0;
        v29 = 0;
        *a4 = (id)[v40 initWithDomain:v41 code:2 userInfo:v15];
        goto LABEL_69;
      }
      id v11 = 0;
      v29 = 0;
      goto LABEL_71;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  id v12 = [v6 objectForKeyedSubscript:@"subjectIsa"];
  long long v13 = [MEMORY[0x1E4F1CA98] null];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v62 = self;

    id v12 = 0;
  }
  else
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
          v43 = self;
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v81 = *MEMORY[0x1E4F28568];
          uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"subjectIsa"];
          v82 = v15;
          id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
          uint64_t v45 = v44;
          self = v43;
          v29 = 0;
          *a4 = (id)[v42 initWithDomain:v45 code:2 userInfo:v23];
          goto LABEL_68;
        }
        v29 = 0;
        goto LABEL_70;
      }
    }
    v62 = self;
  }
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v12 = v12;
  uint64_t v16 = [v12 countByEnumeratingWithState:&v66 objects:v80 count:16];
  id v61 = v11;
  if (!v16) {
    goto LABEL_21;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v67;
  while (2)
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v67 != v18) {
        objc_enumerationMutation(v12);
      }
      uint64_t v20 = *(void *)(*((void *)&v66 + 1) + 8 * v19);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v78 = *MEMORY[0x1E4F28568];
          uint64_t v60 = [[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"subjectIsa"];
          uint64_t v79 = v60;
          uint64_t v32 = (void *)MEMORY[0x1E4F1C9E8];
          v33 = &v79;
          v34 = &v78;
LABEL_39:
          id v26 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:1];
          id v11 = v61;
          v29 = 0;
          *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v26];
          id v23 = v12;
          goto LABEL_66;
        }
LABEL_42:
        v29 = 0;
        id v23 = v12;
        id v11 = v61;
        self = v62;
        goto LABEL_68;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v76 = *MEMORY[0x1E4F28568];
          uint64_t v60 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subjectIsa"];
          uint64_t v77 = v60;
          uint64_t v32 = (void *)MEMORY[0x1E4F1C9E8];
          v33 = &v77;
          v34 = &v76;
          goto LABEL_39;
        }
        goto LABEL_42;
      }
      [v15 addObject:v20];
      ++v19;
    }
    while (v17 != v19);
    uint64_t v17 = [v12 countByEnumeratingWithState:&v66 objects:v80 count:16];
    id v11 = v61;
    if (v17) {
      continue;
    }
    break;
  }
LABEL_21:

  uint64_t v21 = [v6 objectForKeyedSubscript:@"predicateID"];
  uint64_t v60 = v21;
  if (v21)
  {
    v22 = (void *)v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
        id v11 = v61;
        goto LABEL_24;
      }
      if (!a4)
      {
        id v23 = 0;
        v29 = 0;
        id v11 = v61;
        self = v62;
        goto LABEL_67;
      }
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v47 = *MEMORY[0x1E4F502C8];
      uint64_t v74 = *MEMORY[0x1E4F28568];
      id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"predicateID"];
      id v75 = v26;
      uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      uint64_t v49 = v47;
      v25 = (void *)v48;
      id v50 = (id)[v46 initWithDomain:v49 code:2 userInfo:v48];
      v29 = 0;
      id v23 = 0;
      *a4 = v50;
      goto LABEL_75;
    }
  }
  id v23 = 0;
LABEL_24:
  uint64_t v24 = [v6 objectForKeyedSubscript:@"objectID"];
  v59 = (void *)v24;
  if (v24)
  {
    v25 = (void *)v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v25;
        id v11 = v61;
        goto LABEL_27;
      }
      if (a4)
      {
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v72 = *MEMORY[0x1E4F28568];
        id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"objectID"];
        id v73 = v28;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        id v52 = (id)[v57 initWithDomain:v51 code:2 userInfo:v27];
        v29 = 0;
        id v26 = 0;
        *a4 = v52;
LABEL_63:
        id v11 = v61;
        goto LABEL_64;
      }
      id v26 = 0;
      v29 = 0;
LABEL_75:
      id v11 = v61;
      goto LABEL_65;
    }
  }
  id v26 = 0;
LABEL_27:
  v27 = [v6 objectForKeyedSubscript:@"objectAlias"];
  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v28 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v56 = *MEMORY[0x1E4F502C8];
      uint64_t v70 = *MEMORY[0x1E4F28568];
      v53 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"objectAlias"];
      v71 = v53;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      *a4 = (id)[v58 initWithDomain:v56 code:2 userInfo:v54];
    }
    id v28 = 0;
    v29 = 0;
    goto LABEL_63;
  }
  id v28 = v27;
  id v11 = v61;
LABEL_30:
  v29 = [(BMHumanUnderstandingPersonalInferenceFact *)v62 initWithSubjectID:v65 subjectAlias:v11 subjectIsa:v15 predicateID:v23 objectID:v26 objectAlias:v28];
  v62 = v29;
LABEL_64:

  v25 = v59;
LABEL_65:

LABEL_66:
  self = v62;

  v22 = (void *)v60;
LABEL_67:

LABEL_68:
LABEL_69:

  uint64_t v7 = v63;
LABEL_70:
  id v8 = v65;

  long long v10 = v64;
LABEL_71:

LABEL_72:
  return v29;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMHumanUnderstandingPersonalInferenceFact *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_subjectID) {
    PBDataWriterWriteStringField();
  }
  if (self->_subjectAlias) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_subjectIsa;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_predicateID) {
    PBDataWriterWriteStringField();
  }
  if (self->_objectID) {
    PBDataWriterWriteStringField();
  }
  if (self->_objectAlias) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMHumanUnderstandingPersonalInferenceFact;
  uint64_t v5 = [(BMEventBase *)&v30 init];
  if (!v5)
  {
LABEL_34:
    id v28 = v5;
    goto LABEL_35;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_32:
    uint64_t v25 = [v6 copy];
    subjectIsa = v5->_subjectIsa;
    v5->_subjectIsa = (NSArray *)v25;

    int v27 = v4[*v9];
    if (v27) {
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  long long v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_32;
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
      goto LABEL_32;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 24;
        goto LABEL_29;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 32;
        goto LABEL_29;
      case 3u:
        uint64_t v23 = PBReaderReadString();
        if (!v23) {
          goto LABEL_36;
        }
        uint64_t v24 = (void *)v23;
        [v6 addObject:v23];
        goto LABEL_30;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 48;
        goto LABEL_29;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 56;
        goto LABEL_29;
      case 6u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 64;
LABEL_29:
        uint64_t v24 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
LABEL_30:

        goto LABEL_31;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_31:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_32;
          }
          continue;
        }
LABEL_36:

LABEL_33:
        id v28 = 0;
LABEL_35:

        return v28;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectID];
  uint64_t v5 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectAlias];
  uint64_t v6 = [(BMHumanUnderstandingPersonalInferenceFact *)self subjectIsa];
  uint64_t v7 = [(BMHumanUnderstandingPersonalInferenceFact *)self predicateID];
  uint64_t v8 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectID];
  uint64_t v9 = [(BMHumanUnderstandingPersonalInferenceFact *)self objectAlias];
  long long v10 = (void *)[v3 initWithFormat:@"BMHumanUnderstandingPersonalInferenceFact with subjectID: %@, subjectAlias: %@, subjectIsa: %@, predicateID: %@, objectID: %@, objectAlias: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMHumanUnderstandingPersonalInferenceFact)initWithSubjectID:(id)a3 subjectAlias:(id)a4 subjectIsa:(id)a5 predicateID:(id)a6 objectID:(id)a7 objectAlias:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMHumanUnderstandingPersonalInferenceFact;
  uint64_t v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_subjectID, a3);
    objc_storeStrong((id *)&v18->_subjectAlias, a4);
    objc_storeStrong((id *)&v18->_subjectIsa, a5);
    objc_storeStrong((id *)&v18->_predicateID, a6);
    objc_storeStrong((id *)&v18->_objectID, a7);
    objc_storeStrong((id *)&v18->_objectAlias, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subjectID" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subjectAlias" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subjectIsa" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predicateID" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"objectID" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"objectAlias" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7230;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subjectID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subjectAlias" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"subjectIsa_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_82756];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predicateID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"objectID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"objectAlias" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __52__BMHumanUnderstandingPersonalInferenceFact_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _subjectIsaJSONArray];
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

    uint64_t v7 = [[BMHumanUnderstandingPersonalInferenceFact alloc] initByReadFrom:v6];
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