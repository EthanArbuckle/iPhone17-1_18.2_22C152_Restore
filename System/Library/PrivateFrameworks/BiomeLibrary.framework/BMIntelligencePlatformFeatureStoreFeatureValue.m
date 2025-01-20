@interface BMIntelligencePlatformFeatureStoreFeatureValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformFeatureStoreFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligencePlatformFeatureStoreFeatureValue)initWithValue_sequence:(id)a3 value_sequence_shape:(id)a4 value_dictionary:(id)a5 value:(id)a6;
- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)value;
- (BOOL)isEqual:(id)a3;
- (NSArray)value_dictionary;
- (NSArray)value_sequence;
- (NSArray)value_sequence_shape;
- (NSString)description;
- (id)_value_dictionaryJSONArray;
- (id)_value_sequenceJSONArray;
- (id)_value_sequence_shapeJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformFeatureStoreFeatureValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_value_dictionary, 0);
  objc_storeStrong((id *)&self->_value_sequence_shape, 0);

  objc_storeStrong((id *)&self->_value_sequence, 0);
}

- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)value
{
  return self->_value;
}

- (NSArray)value_dictionary
{
  return self->_value_dictionary;
}

- (NSArray)value_sequence_shape
{
  return self->_value_sequence_shape;
}

- (NSArray)value_sequence
{
  return self->_value_sequence;
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
    v6 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence];
    uint64_t v7 = objc_msgSend(v5, "value_sequence");
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence];
      v10 = objc_msgSend(v5, "value_sequence");
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence_shape];
    uint64_t v14 = objc_msgSend(v5, "value_sequence_shape");
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence_shape];
      v17 = objc_msgSend(v5, "value_sequence_shape");
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_dictionary];
    uint64_t v20 = objc_msgSend(v5, "value_dictionary");
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_dictionary];
      v23 = objc_msgSend(v5, "value_dictionary");
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value];
    v26 = [v5 value];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value];
      v28 = [v5 value];
      char v12 = [v27 isEqual:v28];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self _value_sequenceJSONArray];
  id v4 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self _value_sequence_shapeJSONArray];
  id v5 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self _value_dictionaryJSONArray];
  v6 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value];
  uint64_t v7 = [v6 jsonDictionary];

  v14[0] = @"value_sequence";
  v8 = v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v14[1] = @"value_sequence_shape";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v9;
  v14[2] = @"value_dictionary";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v14[3] = @"value";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (v7)
  {
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4) {
        goto LABEL_12;
      }
LABEL_18:

      if (v3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v4) {
    goto LABEL_18;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (id)_value_dictionaryJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_dictionary];
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

- (id)_value_sequence_shapeJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence_shape];
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

- (id)_value_sequenceJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence];
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

- (BMIntelligencePlatformFeatureStoreFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"value_sequence"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v75 = self;

    id v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v37 = *MEMORY[0x1E4F502C8];
          uint64_t v115 = *MEMORY[0x1E4F28568];
          v78 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"value_sequence"];
          v116[0] = v78;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:&v115 count:1];
          v28 = 0;
          *a4 = (id)[v36 initWithDomain:v37 code:2 userInfo:v18];
          goto LABEL_83;
        }
        v28 = 0;
        goto LABEL_84;
      }
    }
    v75 = self;
  }
  v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v6 = v6;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v90 objects:v114 count:16];
  v77 = v5;
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v91;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v91 != v11) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v90 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = a4;
        if (a4)
        {
          id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v23 = *MEMORY[0x1E4F502C8];
          uint64_t v112 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"value_sequence"];
          id v113 = v14;
          int v24 = (void *)MEMORY[0x1E4F1C9E8];
          v25 = &v113;
          v26 = &v112;
          goto LABEL_22;
        }
LABEL_42:
        v28 = 0;
        id v18 = v6;
        id v5 = v77;
        self = v75;
        goto LABEL_83;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = a4;
        if (!a4) {
          goto LABEL_42;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v110 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"value_sequence"];
        id v111 = v14;
        int v24 = (void *)MEMORY[0x1E4F1C9E8];
        v25 = &v111;
        v26 = &v110;
LABEL_22:
        id v27 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
        v28 = 0;
        id *v21 = (id)[v22 initWithDomain:v23 code:2 userInfo:v27];
LABEL_26:
        id v18 = v6;
        goto LABEL_80;
      }
      id v14 = v13;
      uint64_t v15 = [BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc];
      id v89 = 0;
      uint64_t v16 = [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)v15 initWithJSONDictionary:v14 error:&v89];
      id v17 = v89;
      if (v17)
      {
        id v27 = v17;
        if (a4) {
          *a4 = v17;
        }

        v28 = 0;
        goto LABEL_26;
      }
      [v78 addObject:v16];
    }
    uint64_t v10 = [v6 countByEnumeratingWithState:&v90 objects:v114 count:16];
    id v5 = v77;
  }
  while (v10);
LABEL_16:

  id v18 = [v5 objectForKeyedSubscript:@"value_sequence_shape"];
  v19 = [MEMORY[0x1E4F1CA98] null];
  int v20 = [v18 isEqual:v19];

  if (v20)
  {

    id v18 = 0;
    goto LABEL_29;
  }
  if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_29:
    id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v18 = v18;
    uint64_t v29 = [v18 countByEnumeratingWithState:&v85 objects:v107 count:16];
    if (!v29)
    {
LABEL_38:

      id v27 = [v77 objectForKeyedSubscript:@"value_dictionary"];
      v34 = [MEMORY[0x1E4F1CA98] null];
      int v35 = [v27 isEqual:v34];

      if (v35)
      {

        id v27 = 0;
      }
      else if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v66 = *MEMORY[0x1E4F502C8];
            uint64_t v101 = *MEMORY[0x1E4F28568];
            v74 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"value_dictionary"];
            v102 = v74;
            v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
            v28 = 0;
            *a4 = (id)[v65 initWithDomain:v66 code:2 userInfo:v44];
            goto LABEL_79;
          }
          v28 = 0;
          goto LABEL_80;
        }
      }
      v74 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v27 = v27;
      uint64_t v45 = [v27 countByEnumeratingWithState:&v81 objects:v100 count:16];
      if (!v45) {
        goto LABEL_62;
      }
      uint64_t v46 = v45;
      uint64_t v72 = *(void *)v82;
LABEL_54:
      uint64_t v47 = 0;
      while (1)
      {
        if (*(void *)v82 != v72) {
          objc_enumerationMutation(v27);
        }
        v48 = *(void **)(*((void *)&v81 + 1) + 8 * v47);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v56 = a4;
          if (a4)
          {
            id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v58 = *MEMORY[0x1E4F502C8];
            uint64_t v96 = *MEMORY[0x1E4F28568];
            v49 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"value_dictionary"];
            v97 = v49;
            v59 = (void *)MEMORY[0x1E4F1C9E8];
            v60 = &v97;
            v61 = &v96;
            goto LABEL_73;
          }
          goto LABEL_87;
        }
        v49 = v48;
        v50 = [BMIntelligencePlatformFeatureStoreFeatureValueNamedValue alloc];
        id v80 = 0;
        v51 = [(BMIntelligencePlatformFeatureStoreFeatureValueNamedValue *)v50 initWithJSONDictionary:v49 error:&v80];
        id v52 = v80;
        if (v52)
        {
          v63 = v52;
          if (a4) {
            *a4 = v52;
          }

          goto LABEL_77;
        }
        [v74 addObject:v51];

        if (v46 == ++v47)
        {
          uint64_t v46 = [v27 countByEnumeratingWithState:&v81 objects:v100 count:16];
          if (v46) {
            goto LABEL_54;
          }
LABEL_62:

          v44 = [v77 objectForKeyedSubscript:@"value"];
          if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v49 = 0;
            goto LABEL_65;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v67 = v44;
            id v79 = 0;
            v49 = [[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc] initWithJSONDictionary:v67 error:&v79];
            id v68 = v79;
            if (v68)
            {
              v69 = v68;
              if (a4) {
                *a4 = v68;
              }

              v28 = 0;
              v44 = v67;
            }
            else
            {

LABEL_65:
              v28 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)v75 initWithValue_sequence:v78 value_sequence_shape:v14 value_dictionary:v74 value:v49];
              v75 = v28;
            }
LABEL_78:
          }
          else
          {
            if (a4)
            {
              id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v70 = *MEMORY[0x1E4F502C8];
              uint64_t v94 = *MEMORY[0x1E4F28568];
              v49 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"value"];
              v95 = v49;
              v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
              *a4 = (id)[v73 initWithDomain:v70 code:2 userInfo:v71];

              v28 = 0;
              goto LABEL_78;
            }
            v28 = 0;
          }
LABEL_79:

LABEL_80:
          self = v75;
LABEL_81:

          goto LABEL_82;
        }
      }
      v56 = a4;
      if (a4)
      {
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v98 = *MEMORY[0x1E4F28568];
        v49 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"value_dictionary"];
        v99 = v49;
        v59 = (void *)MEMORY[0x1E4F1C9E8];
        v60 = &v99;
        v61 = &v98;
LABEL_73:
        v62 = [v59 dictionaryWithObjects:v60 forKeys:v61 count:1];
        id *v56 = (id)[v57 initWithDomain:v58 code:2 userInfo:v62];

LABEL_77:
        v28 = 0;
        v44 = v27;
        goto LABEL_78;
      }
LABEL_87:
      v28 = 0;
      v44 = v27;
      goto LABEL_79;
    }
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v86;
LABEL_31:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v86 != v31) {
        objc_enumerationMutation(v18);
      }
      uint64_t v33 = *(void *)(*((void *)&v85 + 1) + 8 * v32);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v38 = a4;
        if (a4)
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v103 = *MEMORY[0x1E4F28568];
          v74 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"value_sequence_shape"];
          v104 = v74;
          v41 = (void *)MEMORY[0x1E4F1C9E8];
          v42 = &v104;
          v43 = &v103;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      [v14 addObject:v33];
      if (v30 == ++v32)
      {
        uint64_t v30 = [v18 countByEnumeratingWithState:&v85 objects:v107 count:16];
        if (!v30) {
          goto LABEL_38;
        }
        goto LABEL_31;
      }
    }
    v38 = a4;
    if (a4)
    {
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v105 = *MEMORY[0x1E4F28568];
      v74 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"value_sequence_shape"];
      v106 = v74;
      v41 = (void *)MEMORY[0x1E4F1C9E8];
      v42 = &v106;
      v43 = &v105;
LABEL_47:
      v44 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:1];
      v28 = 0;
      id *v38 = (id)[v39 initWithDomain:v40 code:2 userInfo:v44];
      id v27 = v18;
      goto LABEL_79;
    }
LABEL_48:
    v28 = 0;
    id v27 = v18;
    goto LABEL_80;
  }
  self = v75;
  if (a4)
  {
    id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v54 = *MEMORY[0x1E4F502C8];
    uint64_t v108 = *MEMORY[0x1E4F28568];
    id v14 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"value_sequence_shape"];
    id v109 = v14;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
    id v55 = (id)[v53 initWithDomain:v54 code:2 userInfo:v27];
    v28 = 0;
    *a4 = v55;
    goto LABEL_81;
  }
  v28 = 0;
LABEL_82:
  id v5 = v77;
LABEL_83:

LABEL_84:
  return v28;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligencePlatformFeatureStoreFeatureValue *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = self->_value_sequence;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        uint64_t v30 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = self->_value_sequence_shape;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v15) intValue];
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v13);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = self->_value_dictionary;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v22 + 1) + 8 * v20);
        uint64_t v30 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v21, "writeTo:", v4, (void)v22);
        PBDataWriterRecallMark();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v35 count:16];
    }
    while (v18);
  }

  if (self->_value)
  {
    uint64_t v30 = 0;
    PBDataWriterPlaceMark();
    [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self->_value writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValue;
  id v5 = [(BMEventBase *)&v48 init];
  if (!v5) {
    goto LABEL_48;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v10 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v11]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v9;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v10]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      int v21 = v4[*v11];
      if (v4[*v11]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v49 = 0;
          uint64_t v50 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v23 = [[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_49;
          }
          long long v24 = v23;
          long long v25 = v6;
          goto LABEL_35;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          long long v29 = NSNumber;
          break;
        case 3u:
          uint64_t v49 = 0;
          uint64_t v50 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v35 = [[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue alloc] initByReadFrom:v4];
          if (!v35) {
            goto LABEL_49;
          }
          long long v24 = v35;
          long long v25 = v8;
LABEL_35:
          [v25 addObject:v24];
          PBReaderRecallMark();
          goto LABEL_45;
        case 4u:
          uint64_t v49 = 0;
          uint64_t v50 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v36 = [[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc] initByReadFrom:v4];
          if (!v36) {
            goto LABEL_49;
          }
          value = v5->_value;
          v5->_value = v36;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_49;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v9;
        uint64_t v31 = *(void *)&v4[v30];
        unint64_t v32 = v31 + 1;
        if (v31 == -1 || v32 > *(void *)&v4[*v10]) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)&v4[*v12] + v31);
        *(void *)&v4[v30] = v32;
        v28 |= (unint64_t)(v33 & 0x7F) << v26;
        if ((v33 & 0x80) == 0) {
          goto LABEL_40;
        }
        v26 += 7;
        BOOL v20 = v27++ >= 9;
        if (v20)
        {
          uint64_t v34 = 0;
          goto LABEL_43;
        }
      }
      v4[*v11] = 1;
LABEL_40:
      if (v4[*v11]) {
        uint64_t v34 = 0;
      }
      else {
        uint64_t v34 = v28;
      }
LABEL_43:
      uint64_t v38 = [v29 numberWithInt:v34];
      if (!v38)
      {
LABEL_49:

        goto LABEL_50;
      }
      long long v24 = (void *)v38;
      [v7 addObject:v38];
LABEL_45:
    }
    while (*(void *)&v4[*v9] < *(void *)&v4[*v10]);
  }
  uint64_t v39 = [v6 copy];
  value_sequence = v5->_value_sequence;
  v5->_value_sequence = (NSArray *)v39;

  uint64_t v41 = [v7 copy];
  value_sequence_shape = v5->_value_sequence_shape;
  v5->_value_sequence_shape = (NSArray *)v41;

  uint64_t v43 = [v8 copy];
  value_dictionary = v5->_value_dictionary;
  v5->_value_dictionary = (NSArray *)v43;

  int v45 = v4[*v11];
  if (v45) {
LABEL_50:
  }
    uint64_t v46 = 0;
  else {
LABEL_48:
  }
    uint64_t v46 = v5;

  return v46;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence];
  id v5 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_sequence_shape];
  uint64_t v6 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value_dictionary];
  uint64_t v7 = [(BMIntelligencePlatformFeatureStoreFeatureValue *)self value];
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformFeatureStoreFeatureValue with value_sequence: %@, value_sequence_shape: %@, value_dictionary: %@, value: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMIntelligencePlatformFeatureStoreFeatureValue)initWithValue_sequence:(id)a3 value_sequence_shape:(id)a4 value_dictionary:(id)a5 value:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValue;
  unint64_t v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_value_sequence, a3);
    objc_storeStrong((id *)&v15->_value_sequence_shape, a4);
    objc_storeStrong((id *)&v15->_value_dictionary, a5);
    objc_storeStrong((id *)&v15->_value, a6);
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value_sequence" number:1 type:14 subMessageClass:objc_opt_class()];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value_sequence_shape" number:2 type:2 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value_dictionary" number:3 type:14 subMessageClass:objc_opt_class()];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value" number:4 type:14 subMessageClass:objc_opt_class()];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3978;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"value_sequence_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_226];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"value_sequence_shape_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_228];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"value_dictionary_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_230];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"value_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_232];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 value];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = objc_msgSend(v2, "_value_dictionaryJSONArray");
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = objc_msgSend(v2, "_value_sequence_shapeJSONArray");
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = objc_msgSend(v2, "_value_sequenceJSONArray");
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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMIntelligencePlatformFeatureStoreFeatureValue alloc] initByReadFrom:v7];
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