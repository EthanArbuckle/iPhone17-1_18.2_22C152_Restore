@interface BMMicroLocationLocalization
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMicroLocationLocalization)initWithAbsoluteTimeStamp:(id)a3 clientBundleID:(id)a4 maxProbabilityLabel:(id)a5 maxProbability:(id)a6 probabilityVector:(id)a7 numDevicesVector:(id)a8;
- (BMMicroLocationLocalization)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasMaxProbability;
- (BOOL)isEqual:(id)a3;
- (NSArray)numDevicesVector;
- (NSArray)probabilityVector;
- (NSDate)absoluteTimeStamp;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)maxProbabilityLabel;
- (double)maxProbability;
- (id)_numDevicesVectorJSONArray;
- (id)_probabilityVectorJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasMaxProbability:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMicroLocationLocalization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDevicesVector, 0);
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_maxProbabilityLabel, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

- (NSArray)numDevicesVector
{
  return self->_numDevicesVector;
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

- (NSString)maxProbabilityLabel
{
  return self->_maxProbabilityLabel;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
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
    v6 = [(BMMicroLocationLocalization *)self absoluteTimeStamp];
    uint64_t v7 = [v5 absoluteTimeStamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMicroLocationLocalization *)self absoluteTimeStamp];
      v10 = [v5 absoluteTimeStamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_22;
      }
    }
    v13 = [(BMMicroLocationLocalization *)self clientBundleID];
    uint64_t v14 = [v5 clientBundleID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMicroLocationLocalization *)self clientBundleID];
      v17 = [v5 clientBundleID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_22;
      }
    }
    v19 = [(BMMicroLocationLocalization *)self maxProbabilityLabel];
    uint64_t v20 = [v5 maxProbabilityLabel];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMicroLocationLocalization *)self maxProbabilityLabel];
      v23 = [v5 maxProbabilityLabel];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_22;
      }
    }
    if ([(BMMicroLocationLocalization *)self hasMaxProbability]
      || [v5 hasMaxProbability])
    {
      if (![(BMMicroLocationLocalization *)self hasMaxProbability]) {
        goto LABEL_22;
      }
      if (![v5 hasMaxProbability]) {
        goto LABEL_22;
      }
      [(BMMicroLocationLocalization *)self maxProbability];
      double v26 = v25;
      [v5 maxProbability];
      if (v26 != v27) {
        goto LABEL_22;
      }
    }
    v28 = [(BMMicroLocationLocalization *)self probabilityVector];
    uint64_t v29 = [v5 probabilityVector];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      v30 = (void *)v29;
      v31 = [(BMMicroLocationLocalization *)self probabilityVector];
      v32 = [v5 probabilityVector];
      int v33 = [v31 isEqual:v32];

      if (!v33)
      {
LABEL_22:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v35 = [(BMMicroLocationLocalization *)self numDevicesVector];
    v36 = [v5 numDevicesVector];
    if (v35 == v36)
    {
      char v12 = 1;
    }
    else
    {
      v37 = [(BMMicroLocationLocalization *)self numDevicesVector];
      v38 = [v5 numDevicesVector];
      char v12 = [v37 isEqual:v38];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (NSDate)absoluteTimeStamp
{
  if (self->_hasRaw_absoluteTimeStamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimeStamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v27[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMicroLocationLocalization *)self absoluteTimeStamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMMicroLocationLocalization *)self absoluteTimeStamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMMicroLocationLocalization *)self clientBundleID];
  v8 = [(BMMicroLocationLocalization *)self maxProbabilityLabel];
  if (![(BMMicroLocationLocalization *)self hasMaxProbability]
    || ([(BMMicroLocationLocalization *)self maxProbability], fabs(v9) == INFINITY))
  {
    int v11 = 0;
  }
  else
  {
    [(BMMicroLocationLocalization *)self maxProbability];
    v10 = NSNumber;
    [(BMMicroLocationLocalization *)self maxProbability];
    int v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  char v12 = [(BMMicroLocationLocalization *)self _probabilityVectorJSONArray];
  v13 = [(BMMicroLocationLocalization *)self _numDevicesVectorJSONArray];
  v26[0] = @"absoluteTimeStamp";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v14;
  v27[0] = v14;
  v26[1] = @"clientBundleID";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = v15;
  v27[1] = v15;
  v26[2] = @"maxProbabilityLabel";
  v16 = v8;
  if (!v8)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v15, v24);
  }
  double v25 = (void *)v6;
  v27[2] = v16;
  v26[3] = @"maxProbability";
  v17 = v11;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[3] = v17;
  v26[4] = @"probabilityVector";
  int v18 = v12;
  if (!v12)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[4] = v18;
  v26[5] = @"numDevicesVector";
  v19 = v13;
  if (!v13)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v19;
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 6, v22);
  if (v13)
  {
    if (v12) {
      goto LABEL_22;
    }
LABEL_30:

    if (v11) {
      goto LABEL_23;
    }
    goto LABEL_31;
  }

  if (!v12) {
    goto LABEL_30;
  }
LABEL_22:
  if (v11) {
    goto LABEL_23;
  }
LABEL_31:

LABEL_23:
  if (v8)
  {
    if (v7) {
      goto LABEL_25;
    }
LABEL_33:

    if (v25) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }

  if (!v7) {
    goto LABEL_33;
  }
LABEL_25:
  if (v25) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:

  return v20;
}

- (id)_numDevicesVectorJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMicroLocationLocalization *)self numDevicesVector];
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
        double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
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
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMicroLocationLocalization *)self probabilityVector];
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
        double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMMicroLocationLocalization)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v145[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"absoluteTimeStamp"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v6;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSinceReferenceDate:v12];
LABEL_6:
    uint64_t v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
        v83 = v6;
        uint64_t v84 = *MEMORY[0x1E4F502C8];
        uint64_t v144 = *MEMORY[0x1E4F28568];
        v35 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimeStamp"];
        v145[0] = v35;
        uint64_t v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:&v144 count:1];
        uint64_t v86 = v84;
        uint64_t v6 = v83;
        v112 = (void *)v85;
        id v87 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v86, 2);
        uint64_t v7 = 0;
        v45 = 0;
        *a4 = v87;
        goto LABEL_99;
      }
      uint64_t v7 = 0;
      v45 = 0;
      goto LABEL_100;
    }
    id v13 = v6;
    goto LABEL_6;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v7 = [v14 dateFromString:v6];

LABEL_9:
  uint64_t v15 = [v5 objectForKeyedSubscript:@"clientBundleID"];
  v112 = (void *)v15;
  if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = a4;
      if (a4)
      {
        v36 = v7;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        v38 = v6;
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v142 = *MEMORY[0x1E4F28568];
        v40 = self;
        id v41 = [NSString alloc];
        uint64_t v100 = objc_opt_class();
        v42 = v41;
        self = v40;
        id v110 = (id)[v42 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v100, @"clientBundleID"];
        id v143 = v110;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
        v43 = v37;
        uint64_t v7 = v36;
        uint64_t v44 = v39;
        uint64_t v6 = v38;
        v45 = 0;
        v35 = 0;
        *a4 = (id)[v43 initWithDomain:v44 code:2 userInfo:v17];
        goto LABEL_98;
      }
      v45 = 0;
      goto LABEL_99;
    }
    v109 = v16;
  }
  else
  {
    v109 = 0;
  }
  v17 = [v5 objectForKeyedSubscript:@"maxProbabilityLabel"];
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v46 = v7;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        v48 = v6;
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v140 = *MEMORY[0x1E4F28568];
        v50 = self;
        id v51 = [NSString alloc];
        uint64_t v101 = objc_opt_class();
        v52 = v51;
        self = v50;
        id v108 = (id)[v52 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v101, @"maxProbabilityLabel"];
        id v141 = v108;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
        v53 = v47;
        uint64_t v7 = v46;
        uint64_t v54 = v49;
        uint64_t v6 = v48;
        v45 = 0;
        id v110 = 0;
        *a4 = (id)[v53 initWithDomain:v54 code:2 userInfo:v19];
        v35 = v109;
        goto LABEL_97;
      }
      id v110 = 0;
      v45 = 0;
      v35 = v109;
      goto LABEL_98;
    }
    id v110 = v17;
  }
  else
  {
    id v110 = 0;
  }
  int v18 = [v5 objectForKeyedSubscript:@"maxProbability"];
  v105 = v6;
  v106 = self;
  v107 = v18;
  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v55 = v7;
        id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v57 = *MEMORY[0x1E4F502C8];
        uint64_t v138 = *MEMORY[0x1E4F28568];
        id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"maxProbability"];
        id v139 = v20;
        uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
        v59 = v56;
        uint64_t v7 = v55;
        v113 = (void *)v58;
        id v60 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v57, 2);
        v45 = 0;
        id v108 = 0;
        *a4 = v60;
        v35 = v109;
        goto LABEL_95;
      }
      id v108 = 0;
      v45 = 0;
      v35 = v109;
      v19 = v18;
      goto LABEL_97;
    }
    v103 = v7;
    id v108 = v18;
  }
  else
  {
    v103 = v7;
    id v108 = 0;
  }
  v19 = v18;
  id v20 = [v5 objectForKeyedSubscript:@"probabilityVector"];
  v21 = [MEMORY[0x1E4F1CA98] null];
  int v22 = [v20 isEqual:v21];

  v104 = v5;
  if (v22)
  {
    v102 = v17;

    id v20 = 0;
  }
  else
  {
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v80 = *MEMORY[0x1E4F502C8];
          uint64_t v136 = *MEMORY[0x1E4F28568];
          v113 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"probabilityVector"];
          v137 = v113;
          id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
          id v81 = (id)[v79 initWithDomain:v80 code:2 userInfo:v32];
          v45 = 0;
          *a4 = v81;
          self = v106;
          uint64_t v7 = v103;
          v35 = v109;
          goto LABEL_94;
        }
        v45 = 0;
        self = v106;
        uint64_t v7 = v103;
        v35 = v109;
        goto LABEL_96;
      }
    }
    v102 = v17;
  }
  v113 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v20 = v20;
  uint64_t v23 = [v20 countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v121 != v25) {
          objc_enumerationMutation(v20);
        }
        double v27 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v61 = a4;
          if (a4)
          {
            id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v63 = *MEMORY[0x1E4F502C8];
            uint64_t v133 = *MEMORY[0x1E4F28568];
            id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"probabilityVector"];
            id v134 = v28;
            v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
            v65 = v62;
            uint64_t v66 = v63;
            goto LABEL_51;
          }
LABEL_74:
          v45 = 0;
          id v32 = v20;
          id v5 = v104;
          self = v106;
LABEL_75:
          uint64_t v7 = v103;
          v35 = v109;
          goto LABEL_93;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v61 = a4;
          if (!a4) {
            goto LABEL_74;
          }
          id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v131 = *MEMORY[0x1E4F28568];
          id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"probabilityVector"];
          id v132 = v28;
          v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
          v65 = v67;
          uint64_t v66 = v68;
LABEL_51:
          id *v61 = (id)[v65 initWithDomain:v66 code:2 userInfo:v64];

LABEL_55:
          v45 = 0;
          id v32 = v20;
          id v5 = v104;
          self = v106;
LABEL_56:
          uint64_t v7 = v103;
          v35 = v109;
          goto LABEL_92;
        }
        id v28 = v27;
        uint64_t v29 = [BMMicroLocationLocalizationProbabilityPerLabel alloc];
        id v119 = 0;
        v30 = [(BMMicroLocationLocalizationProbabilityPerLabel *)v29 initWithJSONDictionary:v28 error:&v119];
        id v31 = v119;
        if (v31)
        {
          v69 = v31;
          if (a4) {
            *a4 = v31;
          }

          goto LABEL_55;
        }
        [v113 addObject:v30];
      }
      uint64_t v24 = [v20 countByEnumeratingWithState:&v120 objects:v135 count:16];
    }
    while (v24);
  }

  id v5 = v104;
  id v32 = [v104 objectForKeyedSubscript:@"numDevicesVector"];
  int v33 = [MEMORY[0x1E4F1CA98] null];
  int v34 = [v32 isEqual:v33];

  if (v34)
  {

    id v32 = 0;
    self = v106;
  }
  else
  {
    self = v106;
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v45 = 0;
          goto LABEL_75;
        }
        id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v98 = *MEMORY[0x1E4F502C8];
        uint64_t v129 = *MEMORY[0x1E4F28568];
        id v28 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"numDevicesVector"];
        id v130 = v28;
        v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
        *a4 = (id)[v97 initWithDomain:v98 code:2 userInfo:v99];

        v45 = 0;
        goto LABEL_56;
      }
    }
  }
  id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v32 = v32;
  uint64_t v70 = [v32 countByEnumeratingWithState:&v115 objects:v128 count:16];
  if (!v70) {
    goto LABEL_69;
  }
  uint64_t v71 = v70;
  uint64_t v72 = *(void *)v116;
  while (2)
  {
    for (uint64_t j = 0; j != v71; ++j)
    {
      if (*(void *)v116 != v72) {
        objc_enumerationMutation(v32);
      }
      v74 = *(void **)(*((void *)&v115 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v104;
        self = v106;
        v35 = v109;
        v88 = a4;
        if (a4)
        {
          id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v90 = *MEMORY[0x1E4F502C8];
          uint64_t v126 = *MEMORY[0x1E4F28568];
          id v75 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"numDevicesVector"];
          id v127 = v75;
          v91 = (void *)MEMORY[0x1E4F1C9E8];
          v92 = &v127;
          v93 = &v126;
LABEL_86:
          v94 = [v91 dictionaryWithObjects:v92 forKeys:v93 count:1];
          uint64_t v95 = v90;
          id v5 = v104;
          id *v88 = (id)[v89 initWithDomain:v95 code:2 userInfo:v94];
LABEL_90:
        }
LABEL_91:

        v45 = 0;
        uint64_t v7 = v103;
        goto LABEL_92;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = v104;
        self = v106;
        v35 = v109;
        v88 = a4;
        if (a4)
        {
          id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v90 = *MEMORY[0x1E4F502C8];
          uint64_t v124 = *MEMORY[0x1E4F28568];
          id v75 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"numDevicesVector"];
          id v125 = v75;
          v91 = (void *)MEMORY[0x1E4F1C9E8];
          v92 = &v125;
          v93 = &v124;
          goto LABEL_86;
        }
        goto LABEL_91;
      }
      id v75 = v74;
      v76 = [BMMicroLocationLocalizationNumDevicesPerTechnology alloc];
      id v114 = 0;
      v77 = [(BMMicroLocationLocalizationNumDevicesPerTechnology *)v76 initWithJSONDictionary:v75 error:&v114];
      id v78 = v114;
      if (v78)
      {
        v94 = v78;
        if (a4) {
          *a4 = v78;
        }

        id v5 = v104;
        self = v106;
        v35 = v109;
        goto LABEL_90;
      }
      [v28 addObject:v77];
    }
    uint64_t v71 = [v32 countByEnumeratingWithState:&v115 objects:v128 count:16];
    self = v106;
    if (v71) {
      continue;
    }
    break;
  }
LABEL_69:

  uint64_t v7 = v103;
  v35 = v109;
  self = [(BMMicroLocationLocalization *)self initWithAbsoluteTimeStamp:v103 clientBundleID:v109 maxProbabilityLabel:v110 maxProbability:v108 probabilityVector:v113 numDevicesVector:v28];
  v45 = self;
  id v5 = v104;
LABEL_92:

LABEL_93:
  v17 = v102;
LABEL_94:

LABEL_95:
  v19 = v107;
LABEL_96:

  uint64_t v6 = v105;
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
  return v45;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMicroLocationLocalization *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimeStamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_clientBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_maxProbabilityLabel) {
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
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
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

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v11 = self->_numDevicesVector;
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
  v42.receiver = self;
  v42.super_class = (Class)BMMicroLocationLocalization;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5)
  {
LABEL_46:
    v40 = v5;
    goto LABEL_47;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  id v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_44:
    uint64_t v35 = [v6 copy];
    probabilityVector = v5->_probabilityVector;
    v5->_probabilityVector = (NSArray *)v35;

    uint64_t v37 = [v7 copy];
    numDevicesVector = v5->_numDevicesVector;
    v5->_numDevicesVector = (NSArray *)v37;

    int v39 = v4[*v10];
    if (v39) {
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  double v11 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v10]) {
      goto LABEL_44;
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
      goto LABEL_44;
    }
    switch((v14 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimeStamp = 1;
        uint64_t v22 = *v8;
        unint64_t v23 = *(void *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v9])
        {
          long long v24 = *(objc_class **)(*(void *)&v4[*v11] + v23);
          *(void *)&v4[v22] = v23 + 8;
        }
        else
        {
          v4[*v10] = 1;
          long long v24 = 0;
        }
        uint64_t v34 = 24;
        goto LABEL_42;
      case 2u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 40;
        goto LABEL_27;
      case 3u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 48;
LABEL_27:
        double v27 = *(Class *)((char *)&v5->super.super.isa + v26);
        *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

        goto LABEL_43;
      case 4u:
        v5->_hasMaxProbability = 1;
        uint64_t v28 = *v8;
        unint64_t v29 = *(void *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v9])
        {
          long long v24 = *(objc_class **)(*(void *)&v4[*v11] + v29);
          *(void *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v10] = 1;
          long long v24 = 0;
        }
        uint64_t v34 = 56;
LABEL_42:
        *(Class *)((char *)&v5->super.super.isa + v34) = v24;
        goto LABEL_43;
      case 5u:
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_48;
        }
        id v30 = [[BMMicroLocationLocalizationProbabilityPerLabel alloc] initByReadFrom:v4];
        if (!v30) {
          goto LABEL_48;
        }
        id v31 = v30;
        id v32 = v6;
        goto LABEL_37;
      case 6u:
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_48;
        }
        id v33 = [[BMMicroLocationLocalizationNumDevicesPerTechnology alloc] initByReadFrom:v4];
        if (!v33) {
          goto LABEL_48;
        }
        id v31 = v33;
        id v32 = v7;
LABEL_37:
        [v32 addObject:v31];
        PBReaderRecallMark();

        goto LABEL_43;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_43:
          if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
            goto LABEL_44;
          }
          continue;
        }
LABEL_48:

LABEL_45:
        v40 = 0;
LABEL_47:

        return v40;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMicroLocationLocalization *)self absoluteTimeStamp];
  id v5 = [(BMMicroLocationLocalization *)self clientBundleID];
  uint64_t v6 = [(BMMicroLocationLocalization *)self maxProbabilityLabel];
  uint64_t v7 = NSNumber;
  [(BMMicroLocationLocalization *)self maxProbability];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v9 = [(BMMicroLocationLocalization *)self probabilityVector];
  id v10 = [(BMMicroLocationLocalization *)self numDevicesVector];
  double v11 = (void *)[v3 initWithFormat:@"BMMicroLocationLocalization with absoluteTimeStamp: %@, clientBundleID: %@, maxProbabilityLabel: %@, maxProbability: %@, probabilityVector: %@, numDevicesVector: %@", v4, v5, v6, v8, v9, v10];

  return (NSString *)v11;
}

- (BMMicroLocationLocalization)initWithAbsoluteTimeStamp:(id)a3 clientBundleID:(id)a4 maxProbabilityLabel:(id)a5 maxProbability:(id)a6 probabilityVector:(id)a7 numDevicesVector:(id)a8
{
  id v14 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMMicroLocationLocalization;
  long long v19 = [(BMEventBase *)&v24 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v19->_hasRaw_absoluteTimeStamp = 1;
      [v14 timeIntervalSinceReferenceDate];
    }
    else
    {
      v19->_hasRaw_absoluteTimeStamp = 0;
      double v20 = -1.0;
    }
    v19->_raw_absoluteTimeStamp = v20;
    objc_storeStrong((id *)&v19->_clientBundleID, a4);
    objc_storeStrong((id *)&v19->_maxProbabilityLabel, a5);
    if (v16)
    {
      v19->_hasMaxProbability = 1;
      [v16 doubleValue];
    }
    else
    {
      v19->_hasMaxProbability = 0;
      double v21 = -1.0;
    }
    v19->_maxProbability = v21;
    objc_storeStrong((id *)&v19->_probabilityVector, a7);
    objc_storeStrong((id *)&v19->_numDevicesVector, a8);
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimeStamp" number:1 type:0 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientBundleID" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"maxProbabilityLabel" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"maxProbability" number:4 type:0 subMessageClass:0];
  v10[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"probabilityVector" number:5 type:14 subMessageClass:objc_opt_class()];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numDevicesVector" number:6 type:14 subMessageClass:objc_opt_class()];
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4EA8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimeStamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientBundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"maxProbabilityLabel" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"maxProbability" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"probabilityVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_39486];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"numDevicesVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_199_39487];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __38__BMMicroLocationLocalization_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _numDevicesVectorJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __38__BMMicroLocationLocalization_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _probabilityVectorJSONArray];
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

    uint64_t v7 = [[BMMicroLocationLocalization alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[9] = 1;
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