@interface BMLocationMicroLocationVisit
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLocationMicroLocationVisit)initWithDomain:(id)a3 maxProbabilityMicroLocationIdentifier:(id)a4 maxProbability:(id)a5 probabilityVector:(id)a6 isStable:(id)a7 numDevicesVector:(id)a8;
- (BMLocationMicroLocationVisit)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsStable;
- (BOOL)hasMaxProbability;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStable;
- (NSArray)numDevicesVector;
- (NSArray)probabilityVector;
- (NSString)description;
- (NSString)domain;
- (NSString)maxProbabilityMicroLocationIdentifier;
- (double)maxProbability;
- (id)_numDevicesVectorJSONArray;
- (id)_probabilityVectorJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsStable:(BOOL)a3;
- (void)setHasMaxProbability:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLocationMicroLocationVisit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDevicesVector, 0);
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_maxProbabilityMicroLocationIdentifier, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (NSArray)numDevicesVector
{
  return self->_numDevicesVector;
}

- (void)setHasIsStable:(BOOL)a3
{
  self->_hasIsStable = a3;
}

- (BOOL)hasIsStable
{
  return self->_hasIsStable;
}

- (BOOL)isStable
{
  return self->_isStable;
}

- (NSArray)probabilityVector
{
  return self->_probabilityVector;
}

- (void)setHasMaxProbability:(BOOL)a3
{
  self->_hasMaxProbability = a3;
}

- (BOOL)hasMaxProbability
{
  return self->_hasMaxProbability;
}

- (double)maxProbability
{
  return self->_maxProbability;
}

- (NSString)maxProbabilityMicroLocationIdentifier
{
  return self->_maxProbabilityMicroLocationIdentifier;
}

- (NSString)domain
{
  return self->_domain;
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
    v6 = [(BMLocationMicroLocationVisit *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLocationMicroLocationVisit *)self domain];
      v10 = [v5 domain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
    }
    v13 = [(BMLocationMicroLocationVisit *)self maxProbabilityMicroLocationIdentifier];
    uint64_t v14 = [v5 maxProbabilityMicroLocationIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMLocationMicroLocationVisit *)self maxProbabilityMicroLocationIdentifier];
      v17 = [v5 maxProbabilityMicroLocationIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_25;
      }
    }
    if ([(BMLocationMicroLocationVisit *)self hasMaxProbability]
      || [v5 hasMaxProbability])
    {
      if (![(BMLocationMicroLocationVisit *)self hasMaxProbability]) {
        goto LABEL_25;
      }
      if (![v5 hasMaxProbability]) {
        goto LABEL_25;
      }
      [(BMLocationMicroLocationVisit *)self maxProbability];
      double v20 = v19;
      [v5 maxProbability];
      if (v20 != v21) {
        goto LABEL_25;
      }
    }
    v22 = [(BMLocationMicroLocationVisit *)self probabilityVector];
    uint64_t v23 = [v5 probabilityVector];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(BMLocationMicroLocationVisit *)self probabilityVector];
      v26 = [v5 probabilityVector];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_25;
      }
    }
    if (![(BMLocationMicroLocationVisit *)self hasIsStable]
      && ![v5 hasIsStable]
      || [(BMLocationMicroLocationVisit *)self hasIsStable]
      && [v5 hasIsStable]
      && (int v28 = [(BMLocationMicroLocationVisit *)self isStable],
          v28 == [v5 isStable]))
    {
      v30 = [(BMLocationMicroLocationVisit *)self numDevicesVector];
      v31 = [v5 numDevicesVector];
      if (v30 == v31)
      {
        char v12 = 1;
      }
      else
      {
        v32 = [(BMLocationMicroLocationVisit *)self numDevicesVector];
        v33 = [v5 numDevicesVector];
        char v12 = [v32 isEqual:v33];
      }
      goto LABEL_26;
    }
LABEL_25:
    char v12 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v12 = 0;
LABEL_27:

  return v12;
}

- (id)jsonDictionary
{
  v24[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMLocationMicroLocationVisit *)self domain];
  uint64_t v4 = [(BMLocationMicroLocationVisit *)self maxProbabilityMicroLocationIdentifier];
  if (![(BMLocationMicroLocationVisit *)self hasMaxProbability]
    || ([(BMLocationMicroLocationVisit *)self maxProbability], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMLocationMicroLocationVisit *)self maxProbability];
    v6 = NSNumber;
    [(BMLocationMicroLocationVisit *)self maxProbability];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  v8 = [(BMLocationMicroLocationVisit *)self _probabilityVectorJSONArray];
  if ([(BMLocationMicroLocationVisit *)self hasIsStable])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLocationMicroLocationVisit isStable](self, "isStable"));
  }
  else
  {
    v9 = 0;
  }
  v10 = [(BMLocationMicroLocationVisit *)self _numDevicesVectorJSONArray];
  v23[0] = @"domain";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v11;
  double v21 = (void *)v4;
  v24[0] = v11;
  v23[1] = @"maxProbabilityMicroLocationIdentifier";
  char v12 = (void *)v4;
  if (!v4)
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11);
  }
  v24[1] = v12;
  v23[2] = @"maxProbability";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v3;
  v24[2] = v13;
  v23[3] = @"probabilityVector";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v14;
  v23[4] = @"isStable";
  v15 = v9;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v15;
  v23[5] = @"numDevicesVector";
  v16 = v10;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  if (v10)
  {
    if (v9) {
      goto LABEL_22;
    }
LABEL_31:

    if (v8) {
      goto LABEL_23;
    }
    goto LABEL_32;
  }

  if (!v9) {
    goto LABEL_31;
  }
LABEL_22:
  if (v8) {
    goto LABEL_23;
  }
LABEL_32:

LABEL_23:
  if (!v7) {

  }
  if (v21)
  {
    if (v22) {
      goto LABEL_27;
    }
  }
  else
  {

    if (v22) {
      goto LABEL_27;
    }
  }

LABEL_27:

  return v17;
}

- (id)_numDevicesVectorJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMLocationMicroLocationVisit *)self numDevicesVector];
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

- (id)_probabilityVectorJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMLocationMicroLocationVisit *)self probabilityVector];
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

- (BMLocationMicroLocationVisit)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v123[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"domain"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v122 = *MEMORY[0x1E4F28568];
        v29 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
        v123[0] = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:&v122 count:1];
        uint64_t v31 = v28;
        v8 = (void *)v30;
        v32 = 0;
        id v7 = 0;
        *a4 = (id)[v27 initWithDomain:v31 code:2 userInfo:v30];
        goto LABEL_98;
      }
      v32 = 0;
      id v7 = 0;
      goto LABEL_99;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"maxProbabilityMicroLocationIdentifier"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = a4;
      if (a4)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        v34 = v8;
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v120 = *MEMORY[0x1E4F28568];
        uint64_t v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"maxProbabilityMicroLocationIdentifier"];
        v121 = v23;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        uint64_t v37 = v35;
        v8 = v34;
        v88 = (void *)v36;
        v32 = 0;
        v29 = 0;
        *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2);
        goto LABEL_97;
      }
      v32 = 0;
      goto LABEL_98;
    }
    v87 = v8;
  }
  else
  {
    v87 = 0;
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:@"maxProbability"];
  v85 = v6;
  id v86 = v7;
  v88 = (void *)v9;
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        v39 = v8;
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v118 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"maxProbability"];
        id v119 = v11;
        uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        uint64_t v42 = v40;
        v8 = v39;
        v91 = (void *)v41;
        v32 = 0;
        uint64_t v23 = 0;
        *a4 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v42, 2);
        v29 = v87;

        goto LABEL_96;
      }
      uint64_t v23 = 0;
      v32 = 0;
      v29 = v87;
      goto LABEL_97;
    }
    id v84 = v10;
  }
  else
  {
    id v84 = 0;
  }
  id v11 = [v5 objectForKeyedSubscript:@"probabilityVector"];
  long long v12 = [MEMORY[0x1E4F1CA98] null];
  int v13 = [v11 isEqual:v12];

  v82 = v8;
  v83 = v5;
  if (v13)
  {
    v78 = self;

    id v11 = 0;
  }
  else
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v29 = v87;
          uint64_t v23 = v84;
          goto LABEL_96;
        }
        id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v116 = *MEMORY[0x1E4F28568];
        v90 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"probabilityVector"];
        v117 = v90;
        v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        v32 = 0;
        *a4 = (id)[v50 initWithDomain:v51 code:2 userInfo:v49];
        goto LABEL_71;
      }
    }
    v78 = self;
  }
  v90 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v11 = v11;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v98 objects:v115 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v99 != v16) {
          objc_enumerationMutation(v11);
        }
        int v18 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (a4)
          {
            v43 = a4;
            id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v45 = *MEMORY[0x1E4F502C8];
            uint64_t v113 = *MEMORY[0x1E4F28568];
            id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"probabilityVector"];
            id v114 = v19;
            v46 = (void *)MEMORY[0x1E4F1C9E8];
            v47 = &v114;
            v48 = &v113;
            goto LABEL_46;
          }
LABEL_70:
          v32 = 0;
          v49 = v11;
          id v5 = v83;
          self = v78;
LABEL_71:
          v29 = v87;
          uint64_t v23 = v84;
          goto LABEL_94;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v43 = a4;
          if (!a4) {
            goto LABEL_70;
          }
          id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v45 = *MEMORY[0x1E4F502C8];
          uint64_t v111 = *MEMORY[0x1E4F28568];
          id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"probabilityVector"];
          id v112 = v19;
          v46 = (void *)MEMORY[0x1E4F1C9E8];
          v47 = &v112;
          v48 = &v111;
LABEL_46:
          id v24 = [v46 dictionaryWithObjects:v47 forKeys:v48 count:1];
          v32 = 0;
          id *v43 = (id)[v44 initWithDomain:v45 code:2 userInfo:v24];
LABEL_50:
          v49 = v11;
          id v5 = v83;
          uint64_t v23 = v84;
          self = v78;
LABEL_51:
          v29 = v87;
          goto LABEL_92;
        }
        id v19 = v18;
        double v20 = [BMLocationMicroLocationVisitProbabilityPerLocation alloc];
        id v97 = 0;
        double v21 = [(BMLocationMicroLocationVisitProbabilityPerLocation *)v20 initWithJSONDictionary:v19 error:&v97];
        id v22 = v97;
        if (v22)
        {
          id v24 = v22;
          if (a4) {
            *a4 = v22;
          }

          v32 = 0;
          goto LABEL_50;
        }
        [v90 addObject:v21];
      }
      uint64_t v15 = [v11 countByEnumeratingWithState:&v98 objects:v115 count:16];
    }
    while (v15);
  }

  id v5 = v83;
  id v19 = [v83 objectForKeyedSubscript:@"isStable"];
  uint64_t v23 = v84;
  if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v49 = 0;
        v32 = 0;
        self = v78;
        v29 = v87;
        goto LABEL_93;
      }
      id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v65 = *MEMORY[0x1E4F502C8];
      uint64_t v109 = *MEMORY[0x1E4F28568];
      id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isStable"];
      id v110 = v24;
      v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      id v66 = (id)[v81 initWithDomain:v65 code:2 userInfo:v53];
      v32 = 0;
      v49 = 0;
      *a4 = v66;
      self = v78;
      goto LABEL_80;
    }
    id v77 = v19;
  }
  else
  {
    id v77 = 0;
  }
  id v24 = [v83 objectForKeyedSubscript:@"numDevicesVector"];
  v25 = [MEMORY[0x1E4F1CA98] null];
  int v26 = [v24 isEqual:v25];

  if (v26)
  {

    id v24 = 0;
LABEL_58:
    v49 = v77;
    goto LABEL_59;
  }
  if (!v24) {
    goto LABEL_58;
  }
  objc_opt_class();
  v49 = v77;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    self = v78;
    if (!a4)
    {
      v32 = 0;
      goto LABEL_51;
    }
    id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v52 = *MEMORY[0x1E4F502C8];
    uint64_t v107 = *MEMORY[0x1E4F28568];
    v53 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"numDevicesVector"];
    v108 = v53;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    uint64_t v55 = v52;
    v49 = v77;
    *a4 = (id)[v79 initWithDomain:v55 code:2 userInfo:v54];

    v32 = 0;
LABEL_80:
    v29 = v87;
    goto LABEL_91;
  }
LABEL_59:
  v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v24 = v24;
  uint64_t v56 = [v24 countByEnumeratingWithState:&v93 objects:v106 count:16];
  if (!v56) {
    goto LABEL_69;
  }
  uint64_t v57 = v56;
  uint64_t v58 = *(void *)v94;
  v80 = v53;
  while (2)
  {
    for (uint64_t j = 0; j != v57; ++j)
    {
      if (*(void *)v94 != v58) {
        objc_enumerationMutation(v24);
      }
      v60 = *(void **)(*((void *)&v93 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v83;
        self = v78;
        v29 = v87;
        v67 = a4;
        if (a4)
        {
          id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
          v69 = v78;
          uint64_t v70 = *MEMORY[0x1E4F502C8];
          uint64_t v104 = *MEMORY[0x1E4F28568];
          id v61 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"numDevicesVector"];
          id v105 = v61;
          v71 = (void *)MEMORY[0x1E4F1C9E8];
          v72 = &v105;
          v73 = &v104;
LABEL_85:
          v74 = [v71 dictionaryWithObjects:v72 forKeys:v73 count:1];
          uint64_t v75 = v70;
          self = v69;
          v29 = v87;
          id *v67 = (id)[v68 initWithDomain:v75 code:2 userInfo:v74];
LABEL_89:
        }
LABEL_90:

        v32 = 0;
        uint64_t v23 = v84;
        v49 = v77;
        v53 = v80;
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = v83;
        self = v78;
        v29 = v87;
        v67 = a4;
        if (a4)
        {
          id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
          v69 = v78;
          uint64_t v70 = *MEMORY[0x1E4F502C8];
          uint64_t v102 = *MEMORY[0x1E4F28568];
          id v61 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"numDevicesVector"];
          id v103 = v61;
          v71 = (void *)MEMORY[0x1E4F1C9E8];
          v72 = &v103;
          v73 = &v102;
          goto LABEL_85;
        }
        goto LABEL_90;
      }
      id v61 = v60;
      v62 = [BMLocationMicroLocationVisitNumDevicesPerTechnology alloc];
      id v92 = 0;
      v63 = [(BMLocationMicroLocationVisitNumDevicesPerTechnology *)v62 initWithJSONDictionary:v61 error:&v92];
      id v64 = v92;
      if (v64)
      {
        v74 = v64;
        if (a4) {
          *a4 = v64;
        }

        id v5 = v83;
        self = v78;
        v29 = v87;
        goto LABEL_89;
      }
      [v80 addObject:v63];
    }
    uint64_t v57 = [v24 countByEnumeratingWithState:&v93 objects:v106 count:16];
    uint64_t v23 = v84;
    v49 = v77;
    v53 = v80;
    if (v57) {
      continue;
    }
    break;
  }
LABEL_69:

  v29 = v87;
  self = [(BMLocationMicroLocationVisit *)v78 initWithDomain:v86 maxProbabilityMicroLocationIdentifier:v87 maxProbability:v23 probabilityVector:v90 isStable:v49 numDevicesVector:v53];
  v32 = self;
  id v5 = v83;
LABEL_91:

LABEL_92:
LABEL_93:

LABEL_94:
  v8 = v82;

LABEL_96:
  uint64_t v6 = v85;
  id v7 = v86;
LABEL_97:

LABEL_98:
LABEL_99:

  return v32;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMLocationMicroLocationVisit *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_maxProbabilityMicroLocationIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasMaxProbability) {
    PBDataWriterWriteDoubleField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = self->_probabilityVector;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v21 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  if (self->_hasIsStable) {
    PBDataWriterWriteBOOLField();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_numDevicesVector;
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
        uint64_t v21 = 0;
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
  v46.receiver = self;
  v46.super_class = (Class)BMLocationMicroLocationVisit;
  id v5 = [(BMEventBase *)&v46 init];
  if (!v5) {
    goto LABEL_51;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
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
        BOOL v19 = v13++ >= 9;
        if (v19)
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
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 24;
          goto LABEL_24;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 32;
LABEL_24:
          long long v24 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 3u:
          v5->_hasMaxProbability = 1;
          uint64_t v25 = *v8;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v9])
          {
            double v27 = *(double *)(*(void *)&v4[*v11] + v26);
            *(void *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v27 = 0.0;
          }
          v5->_maxProbability = v27;
          continue;
        case 4u:
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_53;
          }
          id v28 = [[BMLocationMicroLocationVisitProbabilityPerLocation alloc] initByReadFrom:v4];
          if (!v28) {
            goto LABEL_53;
          }
          v29 = v28;
          uint64_t v30 = v6;
          goto LABEL_41;
        case 5u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasIsStable = 1;
          break;
        case 6u:
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_53;
          }
          id v38 = [[BMLocationMicroLocationVisitNumDevicesPerTechnology alloc] initByReadFrom:v4];
          if (!v38) {
            goto LABEL_53;
          }
          v29 = v38;
          uint64_t v30 = v7;
LABEL_41:
          [v30 addObject:v29];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_53:

          goto LABEL_50;
      }
      while (1)
      {
        uint64_t v34 = *v8;
        uint64_t v35 = *(void *)&v4[v34];
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)&v4[*v9]) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)&v4[*v11] + v35);
        *(void *)&v4[v34] = v36;
        v33 |= (unint64_t)(v37 & 0x7F) << v31;
        if ((v37 & 0x80) == 0) {
          goto LABEL_43;
        }
        v31 += 7;
        BOOL v19 = v32++ >= 9;
        if (v19)
        {
          uint64_t v33 = 0;
          goto LABEL_45;
        }
      }
      v4[*v10] = 1;
LABEL_43:
      if (v4[*v10]) {
        uint64_t v33 = 0;
      }
LABEL_45:
      v5->_isStable = v33 != 0;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v39 = [v6 copy];
  probabilityVector = v5->_probabilityVector;
  v5->_probabilityVector = (NSArray *)v39;

  uint64_t v41 = [v7 copy];
  numDevicesVector = v5->_numDevicesVector;
  v5->_numDevicesVector = (NSArray *)v41;

  int v43 = v4[*v10];
  if (v43) {
LABEL_50:
  }
    id v44 = 0;
  else {
LABEL_51:
  }
    id v44 = v5;

  return v44;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLocationMicroLocationVisit *)self domain];
  id v5 = [(BMLocationMicroLocationVisit *)self maxProbabilityMicroLocationIdentifier];
  uint64_t v6 = NSNumber;
  [(BMLocationMicroLocationVisit *)self maxProbability];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [(BMLocationMicroLocationVisit *)self probabilityVector];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLocationMicroLocationVisit isStable](self, "isStable"));
  v10 = [(BMLocationMicroLocationVisit *)self numDevicesVector];
  id v11 = (void *)[v3 initWithFormat:@"BMLocationMicroLocationVisit with domain: %@, maxProbabilityMicroLocationIdentifier: %@, maxProbability: %@, probabilityVector: %@, isStable: %@, numDevicesVector: %@", v4, v5, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMLocationMicroLocationVisit)initWithDomain:(id)a3 maxProbabilityMicroLocationIdentifier:(id)a4 maxProbability:(id)a5 probabilityVector:(id)a6 isStable:(id)a7 numDevicesVector:(id)a8
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMLocationMicroLocationVisit;
  int v20 = [(BMEventBase *)&v24 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_domain, a3);
    objc_storeStrong((id *)&v20->_maxProbabilityMicroLocationIdentifier, a4);
    if (v16)
    {
      v20->_hasMaxProbability = 1;
      [v16 doubleValue];
    }
    else
    {
      v20->_hasMaxProbability = 0;
      double v21 = -1.0;
    }
    v20->_maxProbability = v21;
    objc_storeStrong((id *)&v20->_probabilityVector, a6);
    if (v18)
    {
      v20->_hasIsStable = 1;
      v20->_isStable = [v18 BOOLValue];
    }
    else
    {
      v20->_hasIsStable = 0;
      v20->_isStable = 0;
    }
    objc_storeStrong((id *)&v20->_numDevicesVector, a8);
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"maxProbabilityMicroLocationIdentifier" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"maxProbability" number:3 type:0 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"probabilityVector" number:4 type:14 subMessageClass:objc_opt_class()];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isStable" number:5 type:12 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numDevicesVector" number:6 type:14 subMessageClass:objc_opt_class()];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5130;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"maxProbabilityMicroLocationIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"maxProbability" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"probabilityVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_41295];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isStable" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"numDevicesVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_193];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __39__BMLocationMicroLocationVisit_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _numDevicesVectorJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __39__BMLocationMicroLocationVisit_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _probabilityVectorJSONArray];
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

    uint64_t v8 = [[BMLocationMicroLocationVisit alloc] initByReadFrom:v7];
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