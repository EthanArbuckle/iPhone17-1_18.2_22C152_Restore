@interface BMMLSELabeledDataStore
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSELabeledDataStore)initWithItemIdentifier:(id)a3 featureVersion:(id)a4 featureVector:(id)a5 deviceIdentifier:(id)a6 isPositiveLabeled:(id)a7 labelingPolicyVersion:(id)a8 labelingEvidence:(int)a9 sharingEventUID:(id)a10 configurationInfo:(id)a11;
- (BMMLSELabeledDataStore)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasFeatureVersion;
- (BOOL)hasIsPositiveLabeled;
- (BOOL)hasLabelingPolicyVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPositiveLabeled;
- (NSArray)featureVector;
- (NSString)configurationInfo;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)itemIdentifier;
- (NSString)sharingEventUID;
- (id)_featureVectorJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)labelingEvidence;
- (unsigned)dataVersion;
- (unsigned)featureVersion;
- (unsigned)labelingPolicyVersion;
- (void)setHasFeatureVersion:(BOOL)a3;
- (void)setHasIsPositiveLabeled:(BOOL)a3;
- (void)setHasLabelingPolicyVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSELabeledDataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationInfo, 0);
  objc_storeStrong((id *)&self->_sharingEventUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_featureVector, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (NSString)configurationInfo
{
  return self->_configurationInfo;
}

- (NSString)sharingEventUID
{
  return self->_sharingEventUID;
}

- (int)labelingEvidence
{
  return self->_labelingEvidence;
}

- (void)setHasLabelingPolicyVersion:(BOOL)a3
{
  self->_hasLabelingPolicyVersion = a3;
}

- (BOOL)hasLabelingPolicyVersion
{
  return self->_hasLabelingPolicyVersion;
}

- (unsigned)labelingPolicyVersion
{
  return self->_labelingPolicyVersion;
}

- (void)setHasIsPositiveLabeled:(BOOL)a3
{
  self->_hasIsPositiveLabeled = a3;
}

- (BOOL)hasIsPositiveLabeled
{
  return self->_hasIsPositiveLabeled;
}

- (BOOL)isPositiveLabeled
{
  return self->_isPositiveLabeled;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSArray)featureVector
{
  return self->_featureVector;
}

- (void)setHasFeatureVersion:(BOOL)a3
{
  self->_hasFeatureVersion = a3;
}

- (BOOL)hasFeatureVersion
{
  return self->_hasFeatureVersion;
}

- (unsigned)featureVersion
{
  return self->_featureVersion;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
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
    v6 = [(BMMLSELabeledDataStore *)self itemIdentifier];
    uint64_t v7 = [v5 itemIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSELabeledDataStore *)self itemIdentifier];
      v10 = [v5 itemIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    if ([(BMMLSELabeledDataStore *)self hasFeatureVersion]
      || [v5 hasFeatureVersion])
    {
      if (![(BMMLSELabeledDataStore *)self hasFeatureVersion]) {
        goto LABEL_33;
      }
      if (![v5 hasFeatureVersion]) {
        goto LABEL_33;
      }
      unsigned int v13 = [(BMMLSELabeledDataStore *)self featureVersion];
      if (v13 != [v5 featureVersion]) {
        goto LABEL_33;
      }
    }
    v14 = [(BMMLSELabeledDataStore *)self featureVector];
    uint64_t v15 = [v5 featureVector];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMMLSELabeledDataStore *)self featureVector];
      v18 = [v5 featureVector];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_33;
      }
    }
    v20 = [(BMMLSELabeledDataStore *)self deviceIdentifier];
    uint64_t v21 = [v5 deviceIdentifier];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMMLSELabeledDataStore *)self deviceIdentifier];
      v24 = [v5 deviceIdentifier];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_33;
      }
    }
    if ([(BMMLSELabeledDataStore *)self hasIsPositiveLabeled]
      || [v5 hasIsPositiveLabeled])
    {
      if (![(BMMLSELabeledDataStore *)self hasIsPositiveLabeled]) {
        goto LABEL_33;
      }
      if (![v5 hasIsPositiveLabeled]) {
        goto LABEL_33;
      }
      int v26 = [(BMMLSELabeledDataStore *)self isPositiveLabeled];
      if (v26 != [v5 isPositiveLabeled]) {
        goto LABEL_33;
      }
    }
    if ([(BMMLSELabeledDataStore *)self hasLabelingPolicyVersion]
      || [v5 hasLabelingPolicyVersion])
    {
      if (![(BMMLSELabeledDataStore *)self hasLabelingPolicyVersion]) {
        goto LABEL_33;
      }
      if (![v5 hasLabelingPolicyVersion]) {
        goto LABEL_33;
      }
      unsigned int v27 = [(BMMLSELabeledDataStore *)self labelingPolicyVersion];
      if (v27 != [v5 labelingPolicyVersion]) {
        goto LABEL_33;
      }
    }
    int v28 = [(BMMLSELabeledDataStore *)self labelingEvidence];
    if (v28 != [v5 labelingEvidence]) {
      goto LABEL_33;
    }
    v29 = [(BMMLSELabeledDataStore *)self sharingEventUID];
    uint64_t v30 = [v5 sharingEventUID];
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      v32 = [(BMMLSELabeledDataStore *)self sharingEventUID];
      v33 = [v5 sharingEventUID];
      int v34 = [v32 isEqual:v33];

      if (!v34)
      {
LABEL_33:
        char v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v36 = [(BMMLSELabeledDataStore *)self configurationInfo];
    v37 = [v5 configurationInfo];
    if (v36 == v37)
    {
      char v12 = 1;
    }
    else
    {
      v38 = [(BMMLSELabeledDataStore *)self configurationInfo];
      v39 = [v5 configurationInfo];
      char v12 = [v38 isEqual:v39];
    }
    goto LABEL_34;
  }
  char v12 = 0;
LABEL_35:

  return v12;
}

- (id)jsonDictionary
{
  v33[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMLSELabeledDataStore *)self itemIdentifier];
  if ([(BMMLSELabeledDataStore *)self hasFeatureVersion])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStore featureVersion](self, "featureVersion"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(BMMLSELabeledDataStore *)self _featureVectorJSONArray];
  uint64_t v6 = [(BMMLSELabeledDataStore *)self deviceIdentifier];
  if ([(BMMLSELabeledDataStore *)self hasIsPositiveLabeled])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSELabeledDataStore isPositiveLabeled](self, "isPositiveLabeled"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMMLSELabeledDataStore *)self hasLabelingPolicyVersion])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStore labelingPolicyVersion](self, "labelingPolicyVersion"));
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSELabeledDataStore labelingEvidence](self, "labelingEvidence"));
  v10 = [(BMMLSELabeledDataStore *)self sharingEventUID];
  int v11 = [(BMMLSELabeledDataStore *)self configurationInfo];
  v32[0] = @"itemIdentifier";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v12;
  v33[0] = v12;
  v32[1] = @"featureVersion";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v13;
  v33[1] = v13;
  v32[2] = @"featureVector";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v3;
  v24 = (void *)v14;
  v33[2] = v14;
  v32[3] = @"deviceIdentifier";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v30 = (void *)v4;
  v23 = (void *)v15;
  v33[3] = v15;
  v32[4] = @"isPositiveLabeled";
  v16 = (void *)v7;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v5;
  v33[4] = v16;
  v32[5] = @"labelingPolicyVersion";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v28 = (void *)v7;
  v18 = (void *)v6;
  v33[5] = v17;
  v32[6] = @"labelingEvidence";
  int v19 = v9;
  if (!v9)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[6] = v19;
  v32[7] = @"sharingEventUID";
  v20 = v10;
  if (!v10)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[7] = v20;
  v32[8] = @"configurationInfo";
  uint64_t v21 = v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[8] = v21;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:9];
  if (v11)
  {
    if (v10) {
      goto LABEL_30;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_30;
    }
  }

LABEL_30:
  if (!v9) {

  }
  if (!v8) {
  if (!v28)
  }

  if (!v18) {
  if (v29)
  }
  {
    if (v30) {
      goto LABEL_40;
    }
LABEL_47:

    if (v31) {
      goto LABEL_41;
    }
    goto LABEL_48;
  }

  if (!v30) {
    goto LABEL_47;
  }
LABEL_40:
  if (v31) {
    goto LABEL_41;
  }
LABEL_48:

LABEL_41:

  return v27;
}

- (id)_featureVectorJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMMLSELabeledDataStore *)self featureVector];
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

- (BMMLSELabeledDataStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v127[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"itemIdentifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v126 = *MEMORY[0x1E4F28568];
        id v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemIdentifier"];
        v127[0] = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:&v126 count:1];
        v29 = v25;
        v8 = (void *)v28;
        id v30 = (id)[v29 initWithDomain:v26 code:2 userInfo:v28];
        id v7 = 0;
        v31 = 0;
        *a4 = v30;
        goto LABEL_94;
      }
      id v7 = 0;
      v31 = 0;
      goto LABEL_95;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"featureVersion"];
  v96 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v32 = v8;
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v124 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"featureVersion"];
        id v125 = v9;
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
        v36 = v33;
        v8 = v32;
        v99 = (void *)v35;
        id v37 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v34, 2);
        id v27 = 0;
        v31 = 0;
        *a4 = v37;

        goto LABEL_93;
      }
      id v27 = 0;
      v31 = 0;
      goto LABEL_94;
    }
    id v95 = v8;
  }
  else
  {
    id v95 = 0;
  }
  id v9 = [v5 objectForKeyedSubscript:@"featureVector"];
  v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    v88 = v8;
    v89 = self;
    id v92 = v7;

    id v9 = 0;
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v31 = 0;
          id v27 = v95;
          goto LABEL_93;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v122 = *MEMORY[0x1E4F28568];
        v98 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"featureVector"];
        v123 = v98;
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
        id v47 = (id)[v45 initWithDomain:v46 code:2 userInfo:v21];
        v31 = 0;
        *a4 = v47;
LABEL_48:
        id v27 = v95;
        goto LABEL_91;
      }
    }
    v88 = v8;
    v89 = self;
    id v92 = v7;
  }
  v98 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v9 = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v101 objects:v121 count:16];
  if (!v12) {
    goto LABEL_22;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v102;
  id v87 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v102 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void **)(*((void *)&v101 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = a4;
        if (a4)
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v119 = *MEMORY[0x1E4F28568];
          id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"featureVector"];
          id v120 = v17;
          v41 = (void *)MEMORY[0x1E4F1C9E8];
          v42 = &v120;
          v43 = &v119;
LABEL_40:
          id v24 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:1];
          id v44 = (id)[v39 initWithDomain:v40 code:2 userInfo:v24];
          v31 = 0;
          id *v38 = v44;
LABEL_44:
          id v21 = v9;
          id v5 = v87;
          v8 = v88;
          self = v89;
          id v7 = v92;
          id v27 = v95;
          goto LABEL_89;
        }
        goto LABEL_47;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v38 = a4;
        if (a4)
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v117 = *MEMORY[0x1E4F28568];
          id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"featureVector"];
          id v118 = v17;
          v41 = (void *)MEMORY[0x1E4F1C9E8];
          v42 = &v118;
          v43 = &v117;
          goto LABEL_40;
        }
LABEL_47:
        v31 = 0;
        id v21 = v9;
        id v5 = v87;
        v8 = v88;
        self = v89;
        id v7 = v92;
        goto LABEL_48;
      }
      id v17 = v16;
      v18 = [BMMLSELabeledDataStoreFeature alloc];
      id v100 = 0;
      int v19 = [(BMMLSELabeledDataStoreFeature *)v18 initWithJSONDictionary:v17 error:&v100];
      id v20 = v100;
      if (v20)
      {
        id v24 = v20;
        if (a4) {
          *a4 = v20;
        }

        v31 = 0;
        goto LABEL_44;
      }
      [v98 addObject:v19];
    }
    uint64_t v13 = [v9 countByEnumeratingWithState:&v101 objects:v121 count:16];
    id v5 = v87;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_22:

  id v17 = [v5 objectForKeyedSubscript:@"deviceIdentifier"];
  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v21 = 0;
    self = v89;
    goto LABEL_25;
  }
  objc_opt_class();
  self = v89;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      id v21 = 0;
      v31 = 0;
      id v7 = v92;
      id v27 = v95;
      v8 = v88;
      goto LABEL_90;
    }
    id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v54 = *MEMORY[0x1E4F502C8];
    uint64_t v115 = *MEMORY[0x1E4F28568];
    id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceIdentifier"];
    id v116 = v24;
    v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    id v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2);
    id v21 = 0;
    v31 = 0;
    *a4 = v55;
    id v7 = v92;
    goto LABEL_107;
  }
  id v21 = v17;
LABEL_25:
  uint64_t v22 = [v5 objectForKeyedSubscript:@"isPositiveLabeled"];
  v85 = (void *)v22;
  if (!v22)
  {
    id v24 = 0;
    id v7 = v92;
    goto LABEL_54;
  }
  v23 = (void *)v22;
  objc_opt_class();
  id v7 = v92;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v23;
      goto LABEL_54;
    }
    if (a4)
    {
      id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v56 = *MEMORY[0x1E4F502C8];
      uint64_t v113 = *MEMORY[0x1E4F28568];
      id v57 = v21;
      id v58 = [NSString alloc];
      uint64_t v77 = objc_opt_class();
      v59 = v58;
      id v21 = v57;
      id v86 = (id)[v59 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v77, @"isPositiveLabeled"];
      id v114 = v86;
      v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      id v60 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v56, 2);
      id v24 = 0;
      v31 = 0;
      *a4 = v60;
LABEL_111:
      v8 = v88;
      id v27 = v95;
      goto LABEL_87;
    }
    id v24 = 0;
    v31 = 0;
LABEL_107:
    v8 = v88;
    id v27 = v95;
    goto LABEL_88;
  }
  id v24 = 0;
LABEL_54:
  uint64_t v48 = [v5 objectForKeyedSubscript:@"labelingPolicyVersion"];
  id v84 = v21;
  v82 = (void *)v48;
  if (v48)
  {
    v49 = (void *)v48;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v86 = v49;
        goto LABEL_57;
      }
      if (a4)
      {
        id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v62 = *MEMORY[0x1E4F502C8];
        uint64_t v111 = *MEMORY[0x1E4F28568];
        id v83 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"labelingPolicyVersion"];
        id v112 = v83;
        uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        uint64_t v64 = v62;
        id v21 = v84;
        v79 = (void *)v63;
        id v86 = 0;
        v31 = 0;
        *a4 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v64, 2);
        v8 = v88;
        id v27 = v95;
        goto LABEL_86;
      }
      id v86 = 0;
      v31 = 0;
      goto LABEL_111;
    }
  }
  id v86 = 0;
LABEL_57:
  uint64_t v50 = [v5 objectForKeyedSubscript:@"labelingEvidence"];
  v79 = (void *)v50;
  if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v83 = 0;
LABEL_76:
    uint64_t v65 = [v5 objectForKeyedSubscript:@"sharingEventUID"];
    v91 = (void *)v65;
    if (v65 && (v66 = (void *)v65, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v80 = v66;
        goto LABEL_79;
      }
      if (a4)
      {
        id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v71 = *MEMORY[0x1E4F502C8];
        uint64_t v107 = *MEMORY[0x1E4F28568];
        id v68 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sharingEventUID"];
        id v108 = v68;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
        id v72 = (id)[v81 initWithDomain:v71 code:2 userInfo:v67];
        v31 = 0;
        id v80 = 0;
        *a4 = v72;
        id v27 = v95;
        goto LABEL_83;
      }
      id v80 = 0;
      v31 = 0;
      id v27 = v95;
    }
    else
    {
      id v80 = 0;
LABEL_79:
      v67 = [v5 objectForKeyedSubscript:@"configurationInfo"];
      if (!v67 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v68 = 0;
        goto LABEL_82;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v68 = v67;
LABEL_82:
        LODWORD(v76) = [v83 intValue];
        id v27 = v95;
        self = [(BMMLSELabeledDataStore *)self initWithItemIdentifier:v7 featureVersion:v95 featureVector:v98 deviceIdentifier:v84 isPositiveLabeled:v24 labelingPolicyVersion:v86 labelingEvidence:v76 sharingEventUID:v80 configurationInfo:v68];
        v31 = self;
      }
      else
      {
        if (a4)
        {
          id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v78 = *MEMORY[0x1E4F502C8];
          uint64_t v105 = *MEMORY[0x1E4F28568];
          v73 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"configurationInfo"];
          v106 = v73;
          v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
          *a4 = (id)[v93 initWithDomain:v78 code:2 userInfo:v74];
        }
        id v68 = 0;
        v31 = 0;
        id v27 = v95;
      }
LABEL_83:

      id v21 = v84;
    }
    v69 = v91;
LABEL_85:

    v8 = v88;
    goto LABEL_86;
  }
  id v52 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v83 = v51;
LABEL_75:
    id v21 = v84;
    goto LABEL_76;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v83 = [NSNumber numberWithInt:BMMLSELabeledDataStoreLabelingEvidenceTypeFromString(v51)];
    goto LABEL_75;
  }
  if (a4)
  {
    id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v75 = *MEMORY[0x1E4F502C8];
    uint64_t v109 = *MEMORY[0x1E4F28568];
    id v80 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"labelingEvidence"];
    id v110 = v80;
    v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    id v83 = 0;
    v31 = 0;
    *a4 = (id)[v94 initWithDomain:v75 code:2 userInfo:v69];
    id v7 = v52;
    id v27 = v95;
    id v21 = v84;
    goto LABEL_85;
  }
  id v83 = 0;
  v31 = 0;
  v8 = v88;
  id v27 = v95;
  id v21 = v84;
LABEL_86:

LABEL_87:
LABEL_88:

LABEL_89:
LABEL_90:

LABEL_91:
LABEL_93:

  uint64_t v6 = v96;
LABEL_94:

LABEL_95:
  return v31;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMLSELabeledDataStore *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_itemIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasFeatureVersion) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_featureVector;
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
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_deviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsPositiveLabeled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasLabelingPolicyVersion) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_sharingEventUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_configurationInfo) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BMMLSELabeledDataStore;
  id v5 = [(BMEventBase *)&v63 init];
  if (!v5) {
    goto LABEL_80;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    long long v11 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    long long v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v8]) {
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
          int v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v21 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = v10[234];
          goto LABEL_57;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *((unsigned char *)&v5->super.super.isa + v11[235]) = 1;
          while (2)
          {
            uint64_t v28 = *v7;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v12] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v20 = v26++ >= 9;
                if (v20)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v27) = 0;
          }
LABEL_61:
          uint64_t v57 = 24;
          goto LABEL_70;
        case 3u:
          uint64_t v64 = 0;
          uint64_t v65 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_82;
          }
          v32 = v11;
          id v33 = v10;
          id v34 = [[BMMLSELabeledDataStoreFeature alloc] initByReadFrom:v4];
          if (!v34) {
            goto LABEL_82;
          }
          uint64_t v35 = v34;
          [v6 addObject:v34];
          PBReaderRecallMark();

          v10 = v33;
          long long v11 = v32;
          continue;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_57;
        case 5u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          v5->_hasIsPositiveLabeled = 1;
          while (2)
          {
            uint64_t v39 = *v7;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v12] + v40);
              *(void *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v20 = v37++ >= 9;
                if (v20)
                {
                  uint64_t v38 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v38 = 0;
          }
LABEL_65:
          v5->_isPositiveLabeled = v38 != 0;
          continue;
        case 6u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v27 = 0;
          v5->_hasLabelingPolicyVersion = 1;
          while (2)
          {
            uint64_t v45 = *v7;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v12] + v46);
              *(void *)&v4[v45] = v47;
              v27 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v20 = v44++ >= 9;
                if (v20)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v27) = 0;
          }
LABEL_69:
          uint64_t v57 = 28;
LABEL_70:
          *(_DWORD *)((char *)&v5->super.super.isa + v57) = v27;
          continue;
        case 7u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v51 = 0;
          break;
        case 8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
          goto LABEL_57;
        case 9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
LABEL_57:
          uint64_t v56 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_82:

          goto LABEL_79;
      }
      while (1)
      {
        uint64_t v52 = *v7;
        uint64_t v53 = *(void *)&v4[v52];
        unint64_t v54 = v53 + 1;
        if (v53 == -1 || v54 > *(void *)&v4[*v8]) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)&v4[*v12] + v53);
        *(void *)&v4[v52] = v54;
        v51 |= (unint64_t)(v55 & 0x7F) << v49;
        if ((v55 & 0x80) == 0) {
          goto LABEL_72;
        }
        v49 += 7;
        BOOL v20 = v50++ >= 9;
        if (v20)
        {
          LODWORD(v51) = 0;
          goto LABEL_74;
        }
      }
      v4[*v9] = 1;
LABEL_72:
      if (v4[*v9]) {
        LODWORD(v51) = 0;
      }
LABEL_74:
      if (v51 >= 4) {
        LODWORD(v51) = 0;
      }
      v5->_labelingEvidence = v51;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v58 = [v6 copy];
  featureVector = v5->_featureVector;
  v5->_featureVector = (NSArray *)v58;

  int v60 = v4[*v9];
  if (v60) {
LABEL_79:
  }
    id v61 = 0;
  else {
LABEL_80:
  }
    id v61 = v5;

  return v61;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSELabeledDataStore *)self itemIdentifier];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStore featureVersion](self, "featureVersion"));
  uint64_t v6 = [(BMMLSELabeledDataStore *)self featureVector];
  uint64_t v7 = [(BMMLSELabeledDataStore *)self deviceIdentifier];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSELabeledDataStore isPositiveLabeled](self, "isPositiveLabeled"));
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSELabeledDataStore labelingPolicyVersion](self, "labelingPolicyVersion"));
  v10 = BMMLSELabeledDataStoreLabelingEvidenceTypeAsString([(BMMLSELabeledDataStore *)self labelingEvidence]);
  long long v11 = [(BMMLSELabeledDataStore *)self sharingEventUID];
  long long v12 = [(BMMLSELabeledDataStore *)self configurationInfo];
  char v13 = (void *)[v3 initWithFormat:@"BMMLSELabeledDataStore with itemIdentifier: %@, featureVersion: %@, featureVector: %@, deviceIdentifier: %@, isPositiveLabeled: %@, labelingPolicyVersion: %@, labelingEvidence: %@, sharingEventUID: %@, configurationInfo: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMMLSELabeledDataStore)initWithItemIdentifier:(id)a3 featureVersion:(id)a4 featureVector:(id)a5 deviceIdentifier:(id)a6 isPositiveLabeled:(id)a7 labelingPolicyVersion:(id)a8 labelingEvidence:(int)a9 sharingEventUID:(id)a10 configurationInfo:(id)a11
{
  id v29 = a3;
  id v18 = a4;
  id v28 = a5;
  id v27 = a6;
  id v19 = a7;
  id v20 = a8;
  id v26 = a10;
  id v21 = a11;
  v30.receiver = self;
  v30.super_class = (Class)BMMLSELabeledDataStore;
  uint64_t v22 = [(BMEventBase *)&v30 init];
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27, v28, v29);
    objc_storeStrong((id *)&v22->_itemIdentifier, a3);
    if (v18)
    {
      v22->_hasFeatureVersion = 1;
      unsigned int v23 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v23 = 0;
      v22->_hasFeatureVersion = 0;
    }
    v22->_featureVersion = v23;
    objc_storeStrong((id *)&v22->_featureVector, a5);
    objc_storeStrong((id *)&v22->_deviceIdentifier, a6);
    if (v19)
    {
      v22->_hasIsPositiveLabeled = 1;
      v22->_isPositiveLabeled = [v19 BOOLValue];
    }
    else
    {
      v22->_hasIsPositiveLabeled = 0;
      v22->_isPositiveLabeled = 0;
    }
    if (v20)
    {
      v22->_hasLabelingPolicyVersion = 1;
      unsigned int v24 = [v20 unsignedIntValue];
    }
    else
    {
      unsigned int v24 = 0;
      v22->_hasLabelingPolicyVersion = 0;
    }
    v22->_labelingPolicyVersion = v24;
    v22->_labelingEvidence = a9;
    objc_storeStrong((id *)&v22->_sharingEventUID, a10);
    objc_storeStrong((id *)&v22->_configurationInfo, a11);
  }

  return v22;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemIdentifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"featureVersion", 2, 4, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"featureVector" number:3 type:14 subMessageClass:objc_opt_class()];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceIdentifier" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPositiveLabeled" number:5 type:12 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"labelingPolicyVersion" number:6 type:4 subMessageClass:0];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"labelingEvidence" number:7 type:4 subMessageClass:0];
  v13[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sharingEventUID" number:8 type:13 subMessageClass:0];
  v13[7] = v9;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"configurationInfo" number:9 type:13 subMessageClass:0];
  v13[8] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3828;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"featureVersion" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"featureVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_340];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPositiveLabeled" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"labelingPolicyVersion" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"labelingEvidence" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sharingEventUID" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"configurationInfo" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

id __33__BMMLSELabeledDataStore_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _featureVectorJSONArray];
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

    uint64_t v8 = [[BMMLSELabeledDataStore alloc] initByReadFrom:v7];
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