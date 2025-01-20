@interface BMAppIntentInvocationActionOutputConfirmationActionName
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntentInvocationActionOutputConfirmationActionName)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppIntentInvocationActionOutputConfirmationActionName)initWithType:(int)a3 destructive:(id)a4 acceptLabel:(id)a5 acceptAlternatives:(id)a6 denyLabel:(id)a7 denyAlternatives:(id)a8;
- (BMAppIntentInvocationStaticDeferredLocalizedString)acceptLabel;
- (BMAppIntentInvocationStaticDeferredLocalizedString)denyLabel;
- (BOOL)destructive;
- (BOOL)hasDestructive;
- (BOOL)isEqual:(id)a3;
- (NSArray)acceptAlternatives;
- (NSArray)denyAlternatives;
- (NSString)description;
- (id)_acceptAlternativesJSONArray;
- (id)_denyAlternativesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasDestructive:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntentInvocationActionOutputConfirmationActionName

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyAlternatives, 0);
  objc_storeStrong((id *)&self->_denyLabel, 0);
  objc_storeStrong((id *)&self->_acceptAlternatives, 0);

  objc_storeStrong((id *)&self->_acceptLabel, 0);
}

- (NSArray)denyAlternatives
{
  return self->_denyAlternatives;
}

- (BMAppIntentInvocationStaticDeferredLocalizedString)denyLabel
{
  return self->_denyLabel;
}

- (NSArray)acceptAlternatives
{
  return self->_acceptAlternatives;
}

- (BMAppIntentInvocationStaticDeferredLocalizedString)acceptLabel
{
  return self->_acceptLabel;
}

- (void)setHasDestructive:(BOOL)a3
{
  self->_hasDestructive = a3;
}

- (BOOL)hasDestructive
{
  return self->_hasDestructive;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (int)type
{
  return self->_type;
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
    int v6 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self type];
    if (v6 != [v5 type]) {
      goto LABEL_19;
    }
    if ([(BMAppIntentInvocationActionOutputConfirmationActionName *)self hasDestructive]
      || [v5 hasDestructive])
    {
      if (![(BMAppIntentInvocationActionOutputConfirmationActionName *)self hasDestructive]) {
        goto LABEL_19;
      }
      if (![v5 hasDestructive]) {
        goto LABEL_19;
      }
      int v7 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self destructive];
      if (v7 != [v5 destructive]) {
        goto LABEL_19;
      }
    }
    v8 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptLabel];
    uint64_t v9 = [v5 acceptLabel];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      v11 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptLabel];
      v12 = [v5 acceptLabel];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_19;
      }
    }
    v15 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptAlternatives];
    uint64_t v16 = [v5 acceptAlternatives];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      v17 = (void *)v16;
      v18 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptAlternatives];
      v19 = [v5 acceptAlternatives];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_19;
      }
    }
    v21 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyLabel];
    uint64_t v22 = [v5 denyLabel];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyLabel];
      v25 = [v5 denyLabel];
      int v26 = [v24 isEqual:v25];

      if (!v26)
      {
LABEL_19:
        char v14 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    v28 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyAlternatives];
    v29 = [v5 denyAlternatives];
    if (v28 == v29)
    {
      char v14 = 1;
    }
    else
    {
      v30 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyAlternatives];
      v31 = [v5 denyAlternatives];
      char v14 = [v30 isEqual:v31];
    }
    goto LABEL_20;
  }
  char v14 = 0;
LABEL_21:

  return v14;
}

- (id)jsonDictionary
{
  v24[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntentInvocationActionOutputConfirmationActionName type](self, "type"));
  if ([(BMAppIntentInvocationActionOutputConfirmationActionName *)self hasDestructive])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppIntentInvocationActionOutputConfirmationActionName destructive](self, "destructive"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptLabel];
  int v6 = [v5 jsonDictionary];

  int v7 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self _acceptAlternativesJSONArray];
  v8 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyLabel];
  uint64_t v9 = [v8 jsonDictionary];

  v10 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self _denyAlternativesJSONArray];
  v23[0] = @"type";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v11;
  v24[0] = v11;
  v23[1] = @"destructive";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v12;
  v24[1] = v12;
  v23[2] = @"acceptLabel";
  int v13 = v6;
  if (!v6)
  {
    int v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12, v21);
  }
  uint64_t v22 = (void *)v3;
  v24[2] = v13;
  v23[3] = @"acceptAlternatives";
  char v14 = v7;
  if (!v7)
  {
    char v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v14;
  v23[4] = @"denyLabel";
  v15 = v9;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v15;
  v23[5] = @"denyAlternatives";
  uint64_t v16 = v10;
  if (!v10)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  if (v10)
  {
    if (v9) {
      goto LABEL_18;
    }
LABEL_26:

    if (v7) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v9) {
    goto LABEL_26;
  }
LABEL_18:
  if (v7) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:
  if (v6)
  {
    if (v4) {
      goto LABEL_21;
    }
LABEL_29:

    if (v22) {
      goto LABEL_22;
    }
    goto LABEL_30;
  }

  if (!v4) {
    goto LABEL_29;
  }
LABEL_21:
  if (v22) {
    goto LABEL_22;
  }
LABEL_30:

LABEL_22:

  return v17;
}

- (id)_denyAlternativesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyAlternatives];
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

- (id)_acceptAlternativesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptAlternatives];
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

- (BMAppIntentInvocationActionOutputConfirmationActionName)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v139[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"type"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v57 = *MEMORY[0x1E4F502C8];
          uint64_t v138 = *MEMORY[0x1E4F28568];
          v31 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          v139[0] = v31;
          uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:&v138 count:1];
          v59 = v56;
          uint64_t v9 = (void *)v58;
          uint64_t v7 = 0;
          v30 = 0;
          *a4 = (id)[v59 initWithDomain:v57 code:2 userInfo:v58];
          goto LABEL_106;
        }
        uint64_t v7 = 0;
        v30 = 0;
        goto LABEL_107;
      }
      id v8 = [NSNumber numberWithInt:BMAppIntentInvocationActionOutputConfirmationActionNameTypeFromString(v6)];
    }
    uint64_t v7 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:@"destructive"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v31 = a4;
      if (a4)
      {
        v32 = v9;
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v136 = *MEMORY[0x1E4F28568];
        v35 = v7;
        id v36 = [NSString alloc];
        uint64_t v90 = objc_opt_class();
        v37 = v36;
        uint64_t v7 = v35;
        id v27 = (id)[v37 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v90, @"destructive"];
        id v137 = v27;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
        v39 = v33;
        uint64_t v9 = v32;
        v102 = (void *)v38;
        v30 = 0;
        v31 = 0;
        *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v34, 2);

        goto LABEL_105;
      }
      v30 = 0;
      goto LABEL_106;
    }
    v100 = v9;
  }
  else
  {
    v100 = 0;
  }
  v10 = [v5 objectForKeyedSubscript:@"acceptLabel"];
  v99 = v9;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v134 = *MEMORY[0x1E4F28568];
        v42 = v7;
        id v43 = [NSString alloc];
        uint64_t v91 = objc_opt_class();
        v44 = v43;
        uint64_t v7 = v42;
        v103 = (void *)[v44 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v91, @"acceptLabel"];
        v135 = v103;
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
        v46 = v40;
        uint64_t v9 = v99;
        *a4 = (id)[v46 initWithDomain:v41 code:2 userInfo:v45];

        v30 = 0;
        id v27 = v10;
        v31 = v100;
      }
      else
      {
        v30 = 0;
        v31 = v100;
        id v27 = v10;
      }
      goto LABEL_105;
    }
    id v27 = v10;
    id v117 = 0;
    v101 = [[BMAppIntentInvocationStaticDeferredLocalizedString alloc] initWithJSONDictionary:v27 error:&v117];
    id v28 = v117;
    if (v28)
    {
      v29 = v28;
      if (a4) {
        *a4 = v28;
      }

      v30 = 0;
      uint64_t v9 = v99;
      v31 = v100;
      goto LABEL_104;
    }
    v95 = v6;
    v98 = self;
  }
  else
  {
    v95 = v6;
    v98 = self;
    v101 = 0;
  }
  id v11 = [v5 objectForKeyedSubscript:@"acceptAlternatives"];
  long long v12 = [MEMORY[0x1E4F1CA98] null];
  int v13 = [v11 isEqual:v12];

  v96 = v7;
  id v97 = v5;
  v94 = v10;
  if (v13)
  {

    id v11 = 0;
  }
  else if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v132 = *MEMORY[0x1E4F28568];
        v105 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"acceptAlternatives"];
        v133 = v105;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
        v30 = 0;
        *a4 = (id)[v54 initWithDomain:v55 code:2 userInfo:v23];
        goto LABEL_60;
      }
      v30 = 0;
      uint64_t v9 = v99;
      v31 = v100;
      goto LABEL_103;
    }
  }
  v105 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v11 = v11;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v113 objects:v131 count:16];
  if (!v14)
  {
LABEL_29:

    v23 = [v5 objectForKeyedSubscript:@"denyLabel"];
    if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v19 = 0;
LABEL_32:
      id v24 = [v5 objectForKeyedSubscript:@"denyAlternatives"];
      v25 = [MEMORY[0x1E4F1CA98] null];
      int v26 = [v24 isEqual:v25];

      v92 = v23;
      if (v26)
      {

        id v24 = 0;
LABEL_65:
        uint64_t v7 = v96;
        goto LABEL_66;
      }
      if (!v24) {
        goto LABEL_65;
      }
      objc_opt_class();
      uint64_t v7 = v96;
      if (objc_opt_isKindOfClass())
      {
LABEL_66:
        v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v24 = v24;
        uint64_t v66 = [v24 countByEnumeratingWithState:&v107 objects:v122 count:16];
        if (!v66) {
          goto LABEL_76;
        }
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v108;
        v93 = v65;
LABEL_68:
        uint64_t v69 = 0;
        while (1)
        {
          if (*(void *)v108 != v68) {
            objc_enumerationMutation(v24);
          }
          v70 = *(void **)(*((void *)&v107 + 1) + 8 * v69);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v5 = v97;
            uint64_t v9 = v99;
            v31 = v100;
            v80 = a4;
            if (!a4) {
              goto LABEL_98;
            }
            v81 = v99;
            id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v83 = *MEMORY[0x1E4F502C8];
            uint64_t v118 = *MEMORY[0x1E4F28568];
            id v71 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"denyAlternatives"];
            id v119 = v71;
            v84 = (void *)MEMORY[0x1E4F1C9E8];
            v85 = &v119;
            v86 = &v118;
            goto LABEL_93;
          }
          id v71 = v70;
          v72 = [BMAppIntentInvocationStaticDeferredLocalizedString alloc];
          id v106 = 0;
          v73 = [(BMAppIntentInvocationStaticDeferredLocalizedString *)v72 initWithJSONDictionary:v71 error:&v106];
          id v74 = v106;
          if (v74)
          {
            v87 = v74;
            if (a4) {
              *a4 = v74;
            }

            id v5 = v97;
            uint64_t v9 = v99;
            v31 = v100;
LABEL_97:

LABEL_98:
            v30 = 0;
            uint64_t v7 = v96;
            v65 = v93;
            goto LABEL_99;
          }
          [v93 addObject:v73];

          if (v67 == ++v69)
          {
            uint64_t v67 = [v24 countByEnumeratingWithState:&v107 objects:v122 count:16];
            uint64_t v7 = v96;
            v65 = v93;
            if (v67) {
              goto LABEL_68;
            }
LABEL_76:

            v31 = v100;
            v30 = -[BMAppIntentInvocationActionOutputConfirmationActionName initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:](v98, "initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:", [v7 intValue], v100, v101, v105, v19, v65);
            v98 = v30;
            id v5 = v97;
            uint64_t v9 = v99;
LABEL_99:

            goto LABEL_100;
          }
        }
        id v5 = v97;
        uint64_t v9 = v99;
        v31 = v100;
        v80 = a4;
        if (!a4) {
          goto LABEL_98;
        }
        v81 = v99;
        id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v83 = *MEMORY[0x1E4F502C8];
        uint64_t v120 = *MEMORY[0x1E4F28568];
        id v71 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"denyAlternatives"];
        id v121 = v71;
        v84 = (void *)MEMORY[0x1E4F1C9E8];
        v85 = &v121;
        v86 = &v120;
LABEL_93:
        v87 = [v84 dictionaryWithObjects:v85 forKeys:v86 count:1];
        v88 = v82;
        uint64_t v9 = v81;
        v31 = v100;
        id *v80 = (id)[v88 initWithDomain:v83 code:2 userInfo:v87];
        goto LABEL_97;
      }
      if (a4)
      {
        id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v123 = *MEMORY[0x1E4F28568];
        uint64_t v62 = [[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"denyAlternatives"];
        uint64_t v124 = v62;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
        uint64_t v64 = v61;
        uint64_t v7 = v96;
        *a4 = (id)[v60 initWithDomain:v64 code:2 userInfo:v63];
        v65 = (void *)v62;

        v30 = 0;
        uint64_t v9 = v99;
        v31 = v100;
        goto LABEL_99;
      }
      v30 = 0;
      uint64_t v9 = v99;
      v31 = v100;
LABEL_100:
      v23 = v92;
LABEL_101:

      goto LABEL_102;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v23;
      v75 = [BMAppIntentInvocationStaticDeferredLocalizedString alloc];
      id v111 = 0;
      uint64_t v19 = [(BMAppIntentInvocationStaticDeferredLocalizedString *)v75 initWithJSONDictionary:v24 error:&v111];
      id v76 = v111;
      if (!v76)
      {

        goto LABEL_32;
      }
      v77 = v76;
      if (a4) {
        *a4 = v76;
      }

      v30 = 0;
      v23 = v24;
    }
    else
    {
      if (!a4)
      {
        v30 = 0;
        uint64_t v9 = v99;
        v31 = v100;
        goto LABEL_102;
      }
      id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v79 = *MEMORY[0x1E4F502C8];
      uint64_t v125 = *MEMORY[0x1E4F28568];
      uint64_t v19 = (BMAppIntentInvocationStaticDeferredLocalizedString *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"denyLabel"];
      v126 = v19;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
      v30 = 0;
      *a4 = (id)[v78 initWithDomain:v79 code:2 userInfo:v24];
    }
LABEL_54:
    uint64_t v7 = v96;
    uint64_t v9 = v99;
    v31 = v100;
    goto LABEL_101;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v114;
LABEL_21:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v114 != v16) {
      objc_enumerationMutation(v11);
    }
    v18 = *(void **)(*((void *)&v113 + 1) + 8 * v17);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v48 = a4;
      if (!a4) {
        goto LABEL_59;
      }
      id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v53 = *MEMORY[0x1E4F502C8];
      uint64_t v127 = *MEMORY[0x1E4F28568];
      uint64_t v19 = (BMAppIntentInvocationStaticDeferredLocalizedString *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"acceptAlternatives"];
      v128 = v19;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
      v50 = v52;
      uint64_t v51 = v53;
LABEL_49:
      v30 = 0;
      id *v48 = (id)[v50 initWithDomain:v51 code:2 userInfo:v24];
LABEL_53:
      v23 = v11;
      goto LABEL_54;
    }
    uint64_t v19 = v18;
    int v20 = [BMAppIntentInvocationStaticDeferredLocalizedString alloc];
    id v112 = 0;
    v21 = [(BMAppIntentInvocationStaticDeferredLocalizedString *)v20 initWithJSONDictionary:v19 error:&v112];
    id v22 = v112;
    if (v22)
    {
      id v24 = v22;
      if (a4) {
        *a4 = v22;
      }

      v30 = 0;
      goto LABEL_53;
    }
    [v105 addObject:v21];

    if (v15 == ++v17)
    {
      uint64_t v15 = [v11 countByEnumeratingWithState:&v113 objects:v131 count:16];
      if (!v15) {
        goto LABEL_29;
      }
      goto LABEL_21;
    }
  }
  if (a4)
  {
    id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
    v48 = a4;
    uint64_t v49 = *MEMORY[0x1E4F502C8];
    uint64_t v129 = *MEMORY[0x1E4F28568];
    uint64_t v19 = (BMAppIntentInvocationStaticDeferredLocalizedString *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"acceptAlternatives"];
    v130 = v19;
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
    v50 = v47;
    uint64_t v51 = v49;
    goto LABEL_49;
  }
LABEL_59:
  v30 = 0;
  v23 = v11;
LABEL_60:
  uint64_t v9 = v99;
  v31 = v100;
LABEL_102:

LABEL_103:
  id v27 = v94;
  uint64_t v6 = v95;
  self = v98;
LABEL_104:

LABEL_105:
LABEL_106:

LABEL_107:
  return v30;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppIntentInvocationActionOutputConfirmationActionName *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasDestructive) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_acceptLabel)
  {
    uint64_t v25 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationStaticDeferredLocalizedString *)self->_acceptLabel writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_acceptAlternatives;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        uint64_t v25 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  if (self->_denyLabel)
  {
    uint64_t v25 = 0;
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationStaticDeferredLocalizedString *)self->_denyLabel writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_denyAlternatives;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        uint64_t v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (void)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v13);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMAppIntentInvocationActionOutputConfirmationActionName;
  id v5 = [(BMEventBase *)&v51 init];
  if (!v5) {
    goto LABEL_62;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v11 = (int *)MEMORY[0x1E4F940B8];
    unint64_t v12 = 0x1E6026000uLL;
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v8;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v9]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v11] + v17);
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
          int v21 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v21 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (1)
          {
            uint64_t v26 = *v8;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v9]) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)&v4[*v11] + v27);
            *(void *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0) {
              goto LABEL_51;
            }
            v23 += 7;
            BOOL v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_53;
            }
          }
          v4[*v10] = 1;
LABEL_51:
          if (v4[*v10]) {
            LODWORD(v25) = 0;
          }
LABEL_53:
          if (v25 >= 0x23) {
            LODWORD(v25) = 0;
          }
          v5->_type = v25;
          continue;
        case 2u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasDestructive = 1;
          break;
        case 3u:
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v37 = [objc_alloc(*(Class *)(v12 + 624)) initByReadFrom:v4];
          if (!v37) {
            goto LABEL_63;
          }
          uint64_t v38 = 32;
          goto LABEL_45;
        case 4u:
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v39 = [objc_alloc(*(Class *)(v12 + 624)) initByReadFrom:v4];
          if (!v39) {
            goto LABEL_63;
          }
          id v40 = (void *)v39;
          uint64_t v41 = v6;
          goto LABEL_49;
        case 5u:
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v37 = [objc_alloc(*(Class *)(v12 + 624)) initByReadFrom:v4];
          if (!v37) {
            goto LABEL_63;
          }
          uint64_t v38 = 48;
LABEL_45:
          v42 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = (Class)v37;

          PBReaderRecallMark();
          continue;
        case 6u:
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v43 = [objc_alloc(*(Class *)(v12 + 624)) initByReadFrom:v4];
          if (!v43) {
            goto LABEL_63;
          }
          id v40 = (void *)v43;
          uint64_t v41 = v7;
LABEL_49:
          [v41 addObject:v40];
          PBReaderRecallMark();

          unint64_t v12 = 0x1E6026000;
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_63:

          goto LABEL_64;
      }
      while (1)
      {
        uint64_t v33 = *v8;
        uint64_t v34 = *(void *)&v4[v33];
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)&v4[*v9]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v4[*v11] + v34);
        *(void *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0) {
          goto LABEL_57;
        }
        v30 += 7;
        BOOL v20 = v31++ >= 9;
        if (v20)
        {
          uint64_t v32 = 0;
          goto LABEL_59;
        }
      }
      v4[*v10] = 1;
LABEL_57:
      if (v4[*v10]) {
        uint64_t v32 = 0;
      }
LABEL_59:
      v5->_destructive = v32 != 0;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v44 = [v6 copy];
  acceptAlternatives = v5->_acceptAlternatives;
  v5->_acceptAlternatives = (NSArray *)v44;

  uint64_t v46 = [v7 copy];
  denyAlternatives = v5->_denyAlternatives;
  v5->_denyAlternatives = (NSArray *)v46;

  int v48 = v4[*v10];
  if (v48) {
LABEL_64:
  }
    uint64_t v49 = 0;
  else {
LABEL_62:
  }
    uint64_t v49 = v5;

  return v49;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMAppIntentInvocationActionOutputConfirmationActionNameTypeAsString([(BMAppIntentInvocationActionOutputConfirmationActionName *)self type]);
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppIntentInvocationActionOutputConfirmationActionName destructive](self, "destructive"));
  uint64_t v6 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptLabel];
  uint64_t v7 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self acceptAlternatives];
  uint64_t v8 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyLabel];
  uint64_t v9 = [(BMAppIntentInvocationActionOutputConfirmationActionName *)self denyAlternatives];
  v10 = (void *)[v3 initWithFormat:@"BMAppIntentInvocationActionOutputConfirmationActionName with type: %@, destructive: %@, acceptLabel: %@, acceptAlternatives: %@, denyLabel: %@, denyAlternatives: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMAppIntentInvocationActionOutputConfirmationActionName)initWithType:(int)a3 destructive:(id)a4 acceptLabel:(id)a5 acceptAlternatives:(id)a6 denyLabel:(id)a7 denyAlternatives:(id)a8
{
  id v14 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMAppIntentInvocationActionOutputConfirmationActionName;
  unint64_t v18 = [(BMEventBase *)&v21 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v18->_type = a3;
    if (v14)
    {
      v18->_hasDestructive = 1;
      v18->_destructive = [v14 BOOLValue];
    }
    else
    {
      v18->_hasDestructive = 0;
      v18->_destructive = 0;
    }
    objc_storeStrong((id *)&v18->_acceptLabel, a5);
    objc_storeStrong((id *)&v18->_acceptAlternatives, a6);
    objc_storeStrong((id *)&v18->_denyLabel, a7);
    objc_storeStrong((id *)&v18->_denyAlternatives, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"destructive" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"acceptLabel" number:3 type:14 subMessageClass:objc_opt_class()];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"acceptAlternatives" number:4 type:14 subMessageClass:objc_opt_class()];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"denyLabel" number:5 type:14 subMessageClass:objc_opt_class()];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"denyAlternatives" number:6 type:14 subMessageClass:objc_opt_class()];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5088;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"destructive" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"acceptLabel_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_838];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"acceptAlternatives_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_840];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"denyLabel_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_842];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"denyAlternatives_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_844];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _denyAlternativesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 denyLabel];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _acceptAlternativesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __66__BMAppIntentInvocationActionOutputConfirmationActionName_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 acceptLabel];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMAppIntentInvocationActionOutputConfirmationActionName alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end