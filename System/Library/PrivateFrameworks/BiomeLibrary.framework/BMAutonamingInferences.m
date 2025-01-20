@interface BMAutonamingInferences
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAutonamingInferences)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7;
- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7 imageMessageIdentifier:(id)a8 contextMessageIdentifiers:(id)a9;
- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7 imageMessageIdentifier:(id)a8 contextMessageIdentifiers:(id)a9 modelVersion:(id)a10;
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (NSArray)contextMessageIdentifiers;
- (NSString)description;
- (NSString)imageMessageIdentifier;
- (NSString)inferredContactIdentifier;
- (NSString)inferredName;
- (NSString)inferredRelationshipToDeviceOwner;
- (NSString)modelVersion;
- (NSString)photosPersonIdentifier;
- (double)confidence;
- (id)_contextMessageIdentifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAutonamingInferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_contextMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredRelationshipToDeviceOwner, 0);
  objc_storeStrong((id *)&self->_inferredContactIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredName, 0);

  objc_storeStrong((id *)&self->_photosPersonIdentifier, 0);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSArray)contextMessageIdentifiers
{
  return self->_contextMessageIdentifiers;
}

- (NSString)imageMessageIdentifier
{
  return self->_imageMessageIdentifier;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)inferredRelationshipToDeviceOwner
{
  return self->_inferredRelationshipToDeviceOwner;
}

- (NSString)inferredContactIdentifier
{
  return self->_inferredContactIdentifier;
}

- (NSString)inferredName
{
  return self->_inferredName;
}

- (NSString)photosPersonIdentifier
{
  return self->_photosPersonIdentifier;
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
    v6 = [(BMAutonamingInferences *)self photosPersonIdentifier];
    uint64_t v7 = [v5 photosPersonIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAutonamingInferences *)self photosPersonIdentifier];
      v10 = [v5 photosPersonIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_30;
      }
    }
    v13 = [(BMAutonamingInferences *)self inferredName];
    uint64_t v14 = [v5 inferredName];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAutonamingInferences *)self inferredName];
      v17 = [v5 inferredName];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_30;
      }
    }
    v19 = [(BMAutonamingInferences *)self inferredContactIdentifier];
    uint64_t v20 = [v5 inferredContactIdentifier];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMAutonamingInferences *)self inferredContactIdentifier];
      v23 = [v5 inferredContactIdentifier];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_30;
      }
    }
    v25 = [(BMAutonamingInferences *)self inferredRelationshipToDeviceOwner];
    uint64_t v26 = [v5 inferredRelationshipToDeviceOwner];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMAutonamingInferences *)self inferredRelationshipToDeviceOwner];
      v29 = [v5 inferredRelationshipToDeviceOwner];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_30;
      }
    }
    if ([(BMAutonamingInferences *)self hasConfidence]
      || [v5 hasConfidence])
    {
      if (![(BMAutonamingInferences *)self hasConfidence]) {
        goto LABEL_30;
      }
      if (![v5 hasConfidence]) {
        goto LABEL_30;
      }
      [(BMAutonamingInferences *)self confidence];
      double v32 = v31;
      [v5 confidence];
      if (v32 != v33) {
        goto LABEL_30;
      }
    }
    v34 = [(BMAutonamingInferences *)self imageMessageIdentifier];
    uint64_t v35 = [v5 imageMessageIdentifier];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMAutonamingInferences *)self imageMessageIdentifier];
      v38 = [v5 imageMessageIdentifier];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_30;
      }
    }
    v40 = [(BMAutonamingInferences *)self contextMessageIdentifiers];
    uint64_t v41 = [v5 contextMessageIdentifiers];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMAutonamingInferences *)self contextMessageIdentifiers];
      v44 = [v5 contextMessageIdentifiers];
      int v45 = [v43 isEqual:v44];

      if (!v45)
      {
LABEL_30:
        char v12 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    v47 = [(BMAutonamingInferences *)self modelVersion];
    v48 = [v5 modelVersion];
    if (v47 == v48)
    {
      char v12 = 1;
    }
    else
    {
      v49 = [(BMAutonamingInferences *)self modelVersion];
      v50 = [v5 modelVersion];
      char v12 = [v49 isEqual:v50];
    }
    goto LABEL_31;
  }
  char v12 = 0;
LABEL_32:

  return v12;
}

- (id)jsonDictionary
{
  v31[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAutonamingInferences *)self photosPersonIdentifier];
  uint64_t v4 = [(BMAutonamingInferences *)self inferredName];
  uint64_t v5 = [(BMAutonamingInferences *)self inferredContactIdentifier];
  uint64_t v6 = [(BMAutonamingInferences *)self inferredRelationshipToDeviceOwner];
  if (![(BMAutonamingInferences *)self hasConfidence]
    || ([(BMAutonamingInferences *)self confidence], fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    [(BMAutonamingInferences *)self confidence];
    v8 = NSNumber;
    [(BMAutonamingInferences *)self confidence];
    v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  v10 = [(BMAutonamingInferences *)self imageMessageIdentifier];
  int v11 = [(BMAutonamingInferences *)self _contextMessageIdentifiersJSONArray];
  char v12 = [(BMAutonamingInferences *)self modelVersion];
  v30[0] = @"photosPersonIdentifier";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v13;
  v31[0] = v13;
  v30[1] = @"inferredName";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v3;
  int v24 = (void *)v14;
  v31[1] = v14;
  v30[2] = @"inferredContactIdentifier";
  uint64_t v15 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v4;
  v23 = (void *)v15;
  v31[2] = v15;
  v30[3] = @"inferredRelationshipToDeviceOwner";
  v16 = (void *)v6;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v5;
  v31[3] = v16;
  v30[4] = @"confidence";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v6;
  v31[4] = v17;
  v30[5] = @"imageMessageIdentifier";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[5] = v18;
  v30[6] = @"contextMessageIdentifiers";
  v19 = v11;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[6] = v19;
  v30[7] = @"modelVersion";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[7] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:8];
  if (v12)
  {
    if (v11) {
      goto LABEL_23;
    }
LABEL_36:

    if (v10) {
      goto LABEL_24;
    }
    goto LABEL_37;
  }

  if (!v11) {
    goto LABEL_36;
  }
LABEL_23:
  if (v10) {
    goto LABEL_24;
  }
LABEL_37:

LABEL_24:
  if (!v9) {

  }
  if (!v26) {
  if (!v27)
  }

  if (v28)
  {
    if (v29) {
      goto LABEL_32;
    }
  }
  else
  {

    if (v29) {
      goto LABEL_32;
    }
  }

LABEL_32:

  return v21;
}

- (id)_contextMessageIdentifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMAutonamingInferences *)self contextMessageIdentifiers];
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

- (BMAutonamingInferences)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v121[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"photosPersonIdentifier"];
  v96 = self;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v19 = a4;
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v120 = *MEMORY[0x1E4F28568];
        uint64_t v22 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"photosPersonIdentifier"];
        v121[0] = v22;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:&v120 count:1];
        uint64_t v23 = v21;
        id v10 = (id)v22;
        id v8 = 0;
        int v24 = 0;
        id *v19 = (id)[v20 initWithDomain:v23 code:2 userInfo:v9];
        self = v96;
        goto LABEL_89;
      }
      id v8 = 0;
      int v24 = 0;
      goto LABEL_90;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"inferredName"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v10 = 0;
        int v24 = 0;
        goto LABEL_89;
      }
      v38 = a4;
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v118 = *MEMORY[0x1E4F28568];
      id v41 = v8;
      id v42 = [NSString alloc];
      uint64_t v78 = objc_opt_class();
      v43 = v42;
      id v8 = v41;
      v44 = (void *)[v43 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v78, @"inferredName"];
      v119 = v44;
      uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
      v46 = v39;
      long long v11 = (void *)v45;
      id v47 = (id)[v46 initWithDomain:v40 code:2 userInfo:v45];
      id v10 = 0;
      int v24 = 0;
      id *v38 = v47;
LABEL_76:
      self = v96;
      goto LABEL_88;
    }
    v95 = a4;
    id v10 = v9;
  }
  else
  {
    v95 = a4;
    id v10 = 0;
  }
  long long v11 = [v6 objectForKeyedSubscript:@"inferredContactIdentifier"];
  id v93 = v10;
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v91 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v95)
    {
      id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v48 = *MEMORY[0x1E4F502C8];
      uint64_t v116 = *MEMORY[0x1E4F28568];
      id v94 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"inferredContactIdentifier"];
      id v117 = v94;
      long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      uint64_t v49 = v48;
      id v10 = v93;
      v44 = 0;
      int v24 = 0;
      id *v95 = (id)[v92 initWithDomain:v49 code:2 userInfo:v12];
      goto LABEL_86;
    }
    v44 = 0;
    int v24 = 0;
    goto LABEL_76;
  }
  id v91 = v11;
LABEL_10:
  long long v12 = [v6 objectForKeyedSubscript:@"inferredRelationshipToDeviceOwner"];
  v89 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v84 = v7;
    id v14 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v95)
      {
        id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v56 = *MEMORY[0x1E4F502C8];
        uint64_t v114 = *MEMORY[0x1E4F28568];
        uint64_t v57 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"inferredRelationshipToDeviceOwner"];
        uint64_t v115 = v57;
        uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        v59 = v55;
        long long v11 = v89;
        uint64_t v60 = v56;
        id v10 = v93;
        v90 = (void *)v58;
        id v94 = 0;
        int v24 = 0;
        id *v95 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2);
        v36 = (void *)v57;
        v44 = v91;
        uint64_t v7 = v84;
        goto LABEL_85;
      }
      id v94 = 0;
      int v24 = 0;
      v44 = v91;
      uint64_t v7 = v84;
      goto LABEL_87;
    }
    id v94 = v12;
    long long v13 = v84;
  }
  else
  {
    long long v13 = v7;
    id v14 = v8;
    id v94 = 0;
  }
  uint64_t v15 = [v6 objectForKeyedSubscript:@"confidence"];
  v88 = v12;
  v90 = (void *)v15;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v95)
      {
        id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v64 = *MEMORY[0x1E4F502C8];
        uint64_t v112 = *MEMORY[0x1E4F28568];
        id v87 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
        id v113 = v87;
        uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
        v66 = v63;
        long long v11 = v89;
        uint64_t v67 = v64;
        id v10 = v93;
        v86 = (void *)v65;
        int v24 = 0;
        id *v95 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v67, 2);
        v44 = v91;
        id v8 = v14;
        uint64_t v7 = v13;
        v36 = 0;
        goto LABEL_84;
      }
      int v24 = 0;
      v44 = v91;
      id v8 = v14;
      uint64_t v7 = v13;
      v36 = 0;
      goto LABEL_85;
    }
    id v82 = v16;
  }
  else
  {
    id v82 = 0;
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:@"imageMessageIdentifier"];
  id v8 = v14;
  v81 = v9;
  v86 = (void *)v17;
  if (v17)
  {
    int v18 = (void *)v17;
    objc_opt_class();
    v83 = v13;
    if (objc_opt_isKindOfClass())
    {
      id v87 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v95)
        {
          id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v110 = *MEMORY[0x1E4F28568];
          id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"imageMessageIdentifier"];
          id v111 = v25;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
          v70 = v68;
          long long v11 = v89;
          id v71 = (id)[v70 initWithDomain:v69 code:2 userInfo:v28];
          id v87 = 0;
          int v24 = 0;
          id *v95 = v71;
          v36 = v82;
          uint64_t v7 = v83;
          goto LABEL_82;
        }
        id v87 = 0;
        int v24 = 0;
        v44 = v91;
        v36 = v82;
        uint64_t v7 = v83;
        goto LABEL_84;
      }
      id v87 = v18;
    }
    uint64_t v7 = v13;
  }
  else
  {
    id v87 = 0;
    uint64_t v7 = v13;
  }
  id v25 = [v6 objectForKeyedSubscript:@"contextMessageIdentifiers"];
  uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  int v27 = [v25 isEqual:v26];

  if (v27)
  {
    id v85 = v8;

    id v25 = 0;
  }
  else
  {
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v36 = v82;
        if (!v95)
        {
          int v24 = 0;
          long long v11 = v89;
          goto LABEL_83;
        }
        id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v73 = *MEMORY[0x1E4F502C8];
        uint64_t v108 = *MEMORY[0x1E4F28568];
        v28 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"contextMessageIdentifiers"];
        v109 = v28;
        id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
        id v74 = (id)[v72 initWithDomain:v73 code:2 userInfo:v37];
        int v24 = 0;
        id *v95 = v74;
LABEL_72:
        long long v12 = v88;
        goto LABEL_81;
      }
    }
    id v85 = v8;
  }
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v25 = v25;
  uint64_t v29 = [v25 countByEnumeratingWithState:&v97 objects:v107 count:16];
  if (!v29) {
    goto LABEL_49;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)v98;
  while (2)
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v98 != v31) {
        objc_enumerationMutation(v25);
      }
      uint64_t v33 = *(void *)(*((void *)&v97 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v95)
        {
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v105 = *MEMORY[0x1E4F28568];
          v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"contextMessageIdentifiers"];
          v106 = v34;
          v52 = (void *)MEMORY[0x1E4F1C9E8];
          v53 = &v106;
          v54 = &v105;
LABEL_62:
          v61 = [v52 dictionaryWithObjects:v53 forKeys:v54 count:1];
          v62 = (void *)[v50 initWithDomain:v51 code:2 userInfo:v61];
          id v8 = v85;
          long long v12 = v88;
          id *v95 = v62;

          int v24 = 0;
          id v37 = v25;
          goto LABEL_63;
        }
        goto LABEL_66;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v95)
        {
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v103 = *MEMORY[0x1E4F28568];
          v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contextMessageIdentifiers"];
          v104 = v34;
          v52 = (void *)MEMORY[0x1E4F1C9E8];
          v53 = &v104;
          v54 = &v103;
          goto LABEL_62;
        }
LABEL_66:
        int v24 = 0;
        id v37 = v25;
        v36 = v82;
        id v8 = v85;
        goto LABEL_72;
      }
      [v28 addObject:v33];
    }
    uint64_t v30 = [v25 countByEnumeratingWithState:&v97 objects:v107 count:16];
    long long v12 = v88;
    if (v30) {
      continue;
    }
    break;
  }
LABEL_49:

  v34 = [v6 objectForKeyedSubscript:@"modelVersion"];
  if (!v34)
  {
    id v37 = 0;
    uint64_t v35 = v96;
    v36 = v82;
    id v8 = v85;
    goto LABEL_79;
  }
  objc_opt_class();
  uint64_t v35 = v96;
  v36 = v82;
  id v8 = v85;
  if (objc_opt_isKindOfClass())
  {
    id v37 = 0;
    goto LABEL_79;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = v34;
    long long v12 = v88;
LABEL_79:
    int v24 = [(BMAutonamingInferences *)v35 initWithPhotosPersonIdentifier:v8 inferredName:v93 inferredContactIdentifier:v91 inferredRelationshipToDeviceOwner:v94 confidence:v36 imageMessageIdentifier:v87 contextMessageIdentifiers:v28 modelVersion:v37];
    v96 = v24;
  }
  else
  {
    if (v95)
    {
      id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v79 = *MEMORY[0x1E4F502C8];
      uint64_t v101 = *MEMORY[0x1E4F28568];
      v76 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"modelVersion"];
      v102 = v76;
      v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      id *v95 = (id)[v80 initWithDomain:v79 code:2 userInfo:v77];
    }
    id v37 = 0;
    int v24 = 0;
    long long v12 = v88;
LABEL_63:
    v36 = v82;
  }

LABEL_81:
  long long v11 = v89;
LABEL_82:

  id v10 = v93;
LABEL_83:
  v44 = v91;

  v9 = v81;
LABEL_84:

LABEL_85:
LABEL_86:
  self = v96;
LABEL_87:

LABEL_88:
LABEL_89:

LABEL_90:
  return v24;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAutonamingInferences *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_photosPersonIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_inferredName) {
    PBDataWriterWriteStringField();
  }
  if (self->_inferredContactIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_inferredRelationshipToDeviceOwner) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasConfidence) {
    PBDataWriterWriteFloatField();
  }
  if (self->_imageMessageIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_contextMessageIdentifiers;
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

  if (self->_modelVersion) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMAutonamingInferences;
  uint64_t v5 = [(BMEventBase *)&v34 init];
  if (!v5)
  {
LABEL_40:
    double v32 = v5;
    goto LABEL_41;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_38:
    uint64_t v29 = [v6 copy];
    contextMessageIdentifiers = v5->_contextMessageIdentifiers;
    v5->_contextMessageIdentifiers = (NSArray *)v29;

    int v31 = v4[*v9];
    if (v31) {
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  long long v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_38;
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
      goto LABEL_38;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 24;
        goto LABEL_33;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 32;
        goto LABEL_33;
      case 3u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 40;
        goto LABEL_33;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 48;
        goto LABEL_33;
      case 5u:
        v5->_hasConfidence = 1;
        uint64_t v23 = *v7;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)&v4[*v8])
        {
          float v25 = *(float *)(*(void *)&v4[*v10] + v24);
          *(void *)&v4[v23] = v24 + 4;
        }
        else
        {
          v4[*v9] = 1;
          float v25 = 0.0;
        }
        v5->_confidence = v25;
        goto LABEL_34;
      case 6u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 64;
        goto LABEL_33;
      case 7u:
        uint64_t v26 = PBReaderReadString();
        if (!v26) {
          goto LABEL_42;
        }
        int v27 = (void *)v26;
        [v6 addObject:v26];

        goto LABEL_34;
      case 8u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 80;
LABEL_33:
        v28 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_34;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_34:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_38;
          }
          continue;
        }
LABEL_42:

LABEL_39:
        double v32 = 0;
LABEL_41:

        return v32;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAutonamingInferences *)self photosPersonIdentifier];
  uint64_t v5 = [(BMAutonamingInferences *)self inferredName];
  uint64_t v6 = [(BMAutonamingInferences *)self inferredContactIdentifier];
  uint64_t v7 = [(BMAutonamingInferences *)self inferredRelationshipToDeviceOwner];
  uint64_t v8 = NSNumber;
  [(BMAutonamingInferences *)self confidence];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  long long v10 = [(BMAutonamingInferences *)self imageMessageIdentifier];
  char v11 = [(BMAutonamingInferences *)self contextMessageIdentifiers];
  unsigned int v12 = [(BMAutonamingInferences *)self modelVersion];
  unint64_t v13 = (void *)[v3 initWithFormat:@"BMAutonamingInferences with photosPersonIdentifier: %@, inferredName: %@, inferredContactIdentifier: %@, inferredRelationshipToDeviceOwner: %@, confidence: %@, imageMessageIdentifier: %@, contextMessageIdentifiers: %@, modelVersion: %@", v4, v5, v6, v7, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7 imageMessageIdentifier:(id)a8 contextMessageIdentifiers:(id)a9 modelVersion:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v17 = a7;
  id v24 = a8;
  id v23 = a9;
  id v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)BMAutonamingInferences;
  int v19 = [(BMEventBase *)&v29 init];
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v23, v24, v25, v26, v27, v28);
    objc_storeStrong((id *)&v19->_photosPersonIdentifier, a3);
    objc_storeStrong((id *)&v19->_inferredName, a4);
    objc_storeStrong((id *)&v19->_inferredContactIdentifier, a5);
    objc_storeStrong((id *)&v19->_inferredRelationshipToDeviceOwner, a6);
    if (v17)
    {
      v19->_hasConfidence = 1;
      [v17 floatValue];
      double v21 = v20;
    }
    else
    {
      v19->_hasConfidence = 0;
      double v21 = -1.0;
    }
    v19->_confidence = v21;
    objc_storeStrong((id *)&v19->_imageMessageIdentifier, a8);
    objc_storeStrong((id *)&v19->_contextMessageIdentifiers, a9);
    objc_storeStrong((id *)&v19->_modelVersion, a10);
  }

  return v19;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photosPersonIdentifier" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"inferredName" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"inferredContactIdentifier" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"inferredRelationshipToDeviceOwner" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:5 type:1 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"imageMessageIdentifier" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contextMessageIdentifiers" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelVersion" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4ED8;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photosPersonIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inferredName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inferredContactIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inferredRelationshipToDeviceOwner" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"imageMessageIdentifier" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contextMessageIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_39834];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelVersion" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

id __33__BMAutonamingInferences_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _contextMessageIdentifiersJSONArray];
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

    uint64_t v8 = [[BMAutonamingInferences alloc] initByReadFrom:v7];
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

- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7 imageMessageIdentifier:(id)a8 contextMessageIdentifiers:(id)a9
{
  return [(BMAutonamingInferences *)self initWithPhotosPersonIdentifier:a3 inferredName:a4 inferredContactIdentifier:a5 inferredRelationshipToDeviceOwner:a6 confidence:a7 imageMessageIdentifier:a8 contextMessageIdentifiers:a9 modelVersion:0];
}

- (BMAutonamingInferences)initWithPhotosPersonIdentifier:(id)a3 inferredName:(id)a4 inferredContactIdentifier:(id)a5 inferredRelationshipToDeviceOwner:(id)a6 confidence:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_opt_new();
  id v18 = [(BMAutonamingInferences *)self initWithPhotosPersonIdentifier:v16 inferredName:v15 inferredContactIdentifier:v14 inferredRelationshipToDeviceOwner:v13 confidence:v12 imageMessageIdentifier:0 contextMessageIdentifiers:v17];

  return v18;
}

@end