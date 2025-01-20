@interface BMHomeKitClientActionSet
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHomeKitBase)base;
- (BMHomeKitClientActionSet)initWithBase:(id)a3 actionSetUniqueIdentifier:(id)a4 actionSetType:(id)a5 associatedAccessoryUniqueIdentifiers:(id)a6 actionSetName:(id)a7 homeName:(id)a8;
- (BMHomeKitClientActionSet)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)associatedAccessoryUniqueIdentifiers;
- (NSString)actionSetName;
- (NSString)actionSetType;
- (NSString)actionSetUniqueIdentifier;
- (NSString)description;
- (NSString)homeName;
- (id)_associatedAccessoryUniqueIdentifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMHomeKitClientActionSet

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"base_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_45185];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionSetUniqueIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionSetType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"associatedAccessoryUniqueIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_50];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionSetName" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"homeName" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
  objc_storeStrong((id *)&self->_associatedAccessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_base, 0);
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (NSArray)associatedAccessoryUniqueIdentifiers
{
  return self->_associatedAccessoryUniqueIdentifiers;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (NSString)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (BMHomeKitBase)base
{
  return self->_base;
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
    v6 = [(BMHomeKitClientActionSet *)self base];
    uint64_t v7 = [v5 base];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMHomeKitClientActionSet *)self base];
      v10 = [v5 base];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMHomeKitClientActionSet *)self actionSetUniqueIdentifier];
    uint64_t v14 = [v5 actionSetUniqueIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMHomeKitClientActionSet *)self actionSetUniqueIdentifier];
      v17 = [v5 actionSetUniqueIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMHomeKitClientActionSet *)self actionSetType];
    uint64_t v20 = [v5 actionSetType];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMHomeKitClientActionSet *)self actionSetType];
      v23 = [v5 actionSetType];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    v25 = [(BMHomeKitClientActionSet *)self associatedAccessoryUniqueIdentifiers];
    uint64_t v26 = [v5 associatedAccessoryUniqueIdentifiers];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMHomeKitClientActionSet *)self associatedAccessoryUniqueIdentifiers];
      v29 = [v5 associatedAccessoryUniqueIdentifiers];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_21;
      }
    }
    v31 = [(BMHomeKitClientActionSet *)self actionSetName];
    uint64_t v32 = [v5 actionSetName];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMHomeKitClientActionSet *)self actionSetName];
      v35 = [v5 actionSetName];
      int v36 = [v34 isEqual:v35];

      if (!v36)
      {
LABEL_21:
        char v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v38 = [(BMHomeKitClientActionSet *)self homeName];
    v39 = [v5 homeName];
    if (v38 == v39)
    {
      char v12 = 1;
    }
    else
    {
      v40 = [(BMHomeKitClientActionSet *)self homeName];
      v41 = [v5 homeName];
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
  v23[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMHomeKitClientActionSet *)self base];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = [(BMHomeKitClientActionSet *)self actionSetUniqueIdentifier];
  v6 = [(BMHomeKitClientActionSet *)self actionSetType];
  uint64_t v7 = [(BMHomeKitClientActionSet *)self _associatedAccessoryUniqueIdentifiersJSONArray];
  v8 = [(BMHomeKitClientActionSet *)self actionSetName];
  v9 = [(BMHomeKitClientActionSet *)self homeName];
  v22[0] = @"base";
  uint64_t v10 = v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v10;
  v23[0] = v10;
  v22[1] = @"actionSetUniqueIdentifier";
  uint64_t v11 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v23[1] = v11;
  v22[2] = @"actionSetType";
  char v12 = v6;
  if (!v6)
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20);
  }
  v21 = (void *)v4;
  v23[2] = v12;
  v22[3] = @"associatedAccessoryUniqueIdentifiers";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v13;
  v22[4] = @"actionSetName";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v14;
  v22[5] = @"homeName";
  v15 = v9;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[5] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  if (v9)
  {
    if (v8) {
      goto LABEL_15;
    }
LABEL_23:

    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }

  if (!v8) {
    goto LABEL_23;
  }
LABEL_15:
  if (v7) {
    goto LABEL_16;
  }
LABEL_24:

LABEL_16:
  if (v6)
  {
    if (v5) {
      goto LABEL_18;
    }
LABEL_26:

    if (v21) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v5) {
    goto LABEL_26;
  }
LABEL_18:
  if (v21) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v16;
}

- (id)_associatedAccessoryUniqueIdentifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMHomeKitClientActionSet *)self associatedAccessoryUniqueIdentifiers];
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

- (BMHomeKitClientActionSet)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"base"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        v87[0] = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"base"];
        v8 = (BMHomeKitBase *)v87[0];
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
        uint64_t v33 = v31;
        id v10 = (id)v32;
        uint64_t v18 = 0;
        *a4 = (id)[v30 initWithDomain:v33 code:2 userInfo:v32];
        goto LABEL_63;
      }
      uint64_t v18 = 0;
      goto LABEL_64;
    }
    id v10 = v7;
    id v70 = 0;
    v8 = [[BMHomeKitBase alloc] initWithJSONDictionary:v10 error:&v70];
    id v16 = v70;
    if (v16)
    {
      v17 = v16;
      if (a4) {
        *a4 = v16;
      }

      uint64_t v18 = 0;
      goto LABEL_63;
    }
    v65 = v7;
  }
  else
  {
    v65 = v7;
    v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"actionSetUniqueIdentifier"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"actionSetUniqueIdentifier"];
        v85 = v29;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        id v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2);
        id v10 = 0;
        uint64_t v18 = 0;
        *a4 = v42;
        goto LABEL_61;
      }
      id v10 = 0;
      uint64_t v18 = 0;
      goto LABEL_62;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"actionSetType"];
  v63 = (void *)v11;
  v64 = self;
  v62 = v9;
  if (v11 && (long long v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v43 = v10;
        id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"actionSetType"];
        id v83 = v13;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        v46 = v44;
        id v10 = v43;
        id v47 = (id)[v46 initWithDomain:v45 code:2 userInfo:v19];
        v29 = 0;
        uint64_t v18 = 0;
        *a4 = v47;
        goto LABEL_59;
      }
      v29 = 0;
      uint64_t v18 = 0;
      goto LABEL_61;
    }
    id v61 = v10;
    id v60 = v12;
  }
  else
  {
    id v60 = 0;
    id v61 = v10;
  }
  id v13 = [v6 objectForKeyedSubscript:@"associatedAccessoryUniqueIdentifiers"];
  uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  int v15 = [v13 isEqual:v14];

  if (v15)
  {
    v59 = v8;

    id v13 = 0;
  }
  else
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v18 = 0;
          v29 = v60;
          id v10 = v61;
          goto LABEL_60;
        }
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        v19 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"associatedAccessoryUniqueIdentifiers"];
        v81 = v19;
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        id v50 = (id)[v48 initWithDomain:v49 code:2 userInfo:v26];
        uint64_t v18 = 0;
        *a4 = v50;
LABEL_57:
        v29 = v60;
        id v10 = v61;
        goto LABEL_58;
      }
    }
    v59 = v8;
  }
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v13 = v13;
  uint64_t v20 = [v13 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (!v20) {
    goto LABEL_29;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v67;
  while (2)
  {
    uint64_t v23 = 0;
    do
    {
      if (*(void *)v67 != v22) {
        objc_enumerationMutation(v13);
      }
      uint64_t v24 = *(void *)(*((void *)&v66 + 1) + 8 * v23);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"associatedAccessoryUniqueIdentifiers"];
          v78 = v25;
          id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          int v36 = v34;
          uint64_t v37 = v35;
LABEL_47:
          v29 = v60;
          uint64_t v18 = 0;
          *a4 = (id)[v36 initWithDomain:v37 code:2 userInfo:v28];
          id v26 = v13;
          goto LABEL_48;
        }
        goto LABEL_52;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"associatedAccessoryUniqueIdentifiers"];
          v76 = v25;
          id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          int v36 = v38;
          uint64_t v37 = v39;
          goto LABEL_47;
        }
LABEL_52:
        uint64_t v18 = 0;
        id v26 = v13;
        v8 = v59;
        goto LABEL_57;
      }
      [v19 addObject:v24];
      ++v23;
    }
    while (v21 != v23);
    uint64_t v21 = [v13 countByEnumeratingWithState:&v66 objects:v79 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_29:

  v25 = [v6 objectForKeyedSubscript:@"actionSetName"];
  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v25;
      goto LABEL_32;
    }
    if (a4)
    {
      id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v53 = *MEMORY[0x1E4F502C8];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"actionSetName"];
      id v74 = v28;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      id v54 = (id)[v52 initWithDomain:v53 code:2 userInfo:v27];
      uint64_t v18 = 0;
      id v26 = 0;
      *a4 = v54;
      v29 = v60;
      goto LABEL_36;
    }
    id v26 = 0;
    uint64_t v18 = 0;
    v8 = v59;
    v29 = v60;
  }
  else
  {
    id v26 = 0;
LABEL_32:
    v27 = [v6 objectForKeyedSubscript:@"homeName"];
    if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v28 = 0;
      v29 = v60;
      goto LABEL_35;
    }
    objc_opt_class();
    v29 = v60;
    if (objc_opt_isKindOfClass())
    {
      id v28 = v27;
LABEL_35:
      uint64_t v18 = [(BMHomeKitClientActionSet *)v64 initWithBase:v59 actionSetUniqueIdentifier:v61 actionSetType:v29 associatedAccessoryUniqueIdentifiers:v19 actionSetName:v26 homeName:v28];
      v64 = v18;
    }
    else
    {
      if (a4)
      {
        id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v57 = *MEMORY[0x1E4F502C8];
        uint64_t v71 = *MEMORY[0x1E4F28568];
        v55 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"homeName"];
        v72 = v55;
        v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        *a4 = (id)[v58 initWithDomain:v57 code:2 userInfo:v56];
      }
      id v28 = 0;
      uint64_t v18 = 0;
    }
LABEL_36:

LABEL_48:
    v8 = v59;
  }
  id v10 = v61;
LABEL_58:

LABEL_59:
LABEL_60:

  self = v64;
  v9 = v62;
LABEL_61:

LABEL_62:
  uint64_t v7 = v65;
LABEL_63:

LABEL_64:
  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMHomeKitClientActionSet *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_base)
  {
    uint64_t v14 = 0;
    PBDataWriterPlaceMark();
    [(BMHomeKitBase *)self->_base writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_actionSetUniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionSetType) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_associatedAccessoryUniqueIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_actionSetName) {
    PBDataWriterWriteStringField();
  }
  if (self->_homeName) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMHomeKitClientActionSet;
  uint64_t v5 = [(BMEventBase *)&v32 init];
  if (!v5)
  {
LABEL_35:
    id v30 = v5;
    goto LABEL_36;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_33:
    uint64_t v27 = [v6 copy];
    associatedAccessoryUniqueIdentifiers = v5->_associatedAccessoryUniqueIdentifiers;
    v5->_associatedAccessoryUniqueIdentifiers = (NSArray *)v27;

    int v29 = v4[*v9];
    if (v29) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  long long v10 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v15 = *(void *)&v4[v14];
      if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
      *(void *)&v4[v14] = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_13;
      }
      v11 += 7;
      if (v12++ >= 9)
      {
        unint64_t v13 = 0;
        int v18 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    int v18 = v4[*v9];
    if (v4[*v9]) {
      unint64_t v13 = 0;
    }
LABEL_15:
    if (v18 || (v13 & 7) == 4) {
      goto LABEL_33;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_37;
        }
        uint64_t v20 = [[BMHomeKitBase alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_37;
        }
        base = v5->_base;
        v5->_base = v20;

        PBReaderRecallMark();
        goto LABEL_32;
      case 2u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 32;
        goto LABEL_31;
      case 3u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 40;
        goto LABEL_31;
      case 4u:
        uint64_t v24 = PBReaderReadString();
        if (!v24) {
          goto LABEL_37;
        }
        v25 = (void *)v24;
        [v6 addObject:v24];

        goto LABEL_32;
      case 5u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 56;
        goto LABEL_31;
      case 6u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 64;
LABEL_31:
        id v26 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        goto LABEL_32;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_32:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_33;
          }
          continue;
        }
LABEL_37:

LABEL_34:
        id v30 = 0;
LABEL_36:

        return v30;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMHomeKitClientActionSet *)self base];
  uint64_t v5 = [(BMHomeKitClientActionSet *)self actionSetUniqueIdentifier];
  uint64_t v6 = [(BMHomeKitClientActionSet *)self actionSetType];
  uint64_t v7 = [(BMHomeKitClientActionSet *)self associatedAccessoryUniqueIdentifiers];
  uint64_t v8 = [(BMHomeKitClientActionSet *)self actionSetName];
  uint64_t v9 = [(BMHomeKitClientActionSet *)self homeName];
  long long v10 = (void *)[v3 initWithFormat:@"BMHomeKitClientActionSet with base: %@, actionSetUniqueIdentifier: %@, actionSetType: %@, associatedAccessoryUniqueIdentifiers: %@, actionSetName: %@, homeName: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMHomeKitClientActionSet)initWithBase:(id)a3 actionSetUniqueIdentifier:(id)a4 actionSetType:(id)a5 associatedAccessoryUniqueIdentifiers:(id)a6 actionSetName:(id)a7 homeName:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMHomeKitClientActionSet;
  int v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_base, a3);
    objc_storeStrong((id *)&v18->_actionSetUniqueIdentifier, a4);
    objc_storeStrong((id *)&v18->_actionSetType, a5);
    objc_storeStrong((id *)&v18->_associatedAccessoryUniqueIdentifiers, a6);
    objc_storeStrong((id *)&v18->_actionSetName, a7);
    objc_storeStrong((id *)&v18->_homeName, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"base" number:1 type:14 subMessageClass:objc_opt_class()];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionSetUniqueIdentifier" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionSetType" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associatedAccessoryUniqueIdentifiers" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionSetName" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeName" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5460;
}

id __35__BMHomeKitClientActionSet_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _associatedAccessoryUniqueIdentifiersJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __35__BMHomeKitClientActionSet_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 base];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
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

    uint64_t v8 = [[BMHomeKitClientActionSet alloc] initByReadFrom:v7];
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