@interface BMSiriOnDeviceDigestExperimentMetrics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestExperimentMetrics)initWithEventMetadata:(id)a3 digestType:(id)a4 experimentId:(id)a5 treatmentIdUUID:(id)a6 deploymentId:(id)a7 deviceType:(id)a8 programCode:(id)a9 digests:(id)a10;
- (BMSiriOnDeviceDigestExperimentMetrics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestExperimentMetricsEventMetadata)eventMetadata;
- (BOOL)hasDeploymentId;
- (BOOL)hasDigestType;
- (BOOL)hasProgramCode;
- (BOOL)isEqual:(id)a3;
- (NSArray)digests;
- (NSString)description;
- (NSString)deviceType;
- (NSString)experimentId;
- (NSString)treatmentIdUUID;
- (id)_digestsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int64_t)deploymentId;
- (unsigned)dataVersion;
- (unsigned)digestType;
- (unsigned)programCode;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setHasDigestType:(BOOL)a3;
- (void)setHasProgramCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestExperimentMetrics

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"eventMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_747];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"digestType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experimentId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"treatmentIdUUID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deploymentId" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:3 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"programCode" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"digests_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_749];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digests, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_treatmentIdUUID, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);

  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (NSArray)digests
{
  return self->_digests;
}

- (void)setHasProgramCode:(BOOL)a3
{
  self->_hasProgramCode = a3;
}

- (BOOL)hasProgramCode
{
  return self->_hasProgramCode;
}

- (unsigned)programCode
{
  return self->_programCode;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  self->_hasDeploymentId = a3;
}

- (BOOL)hasDeploymentId
{
  return self->_hasDeploymentId;
}

- (int64_t)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentIdUUID
{
  return self->_treatmentIdUUID;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setHasDigestType:(BOOL)a3
{
  self->_hasDigestType = a3;
}

- (BOOL)hasDigestType
{
  return self->_hasDigestType;
}

- (unsigned)digestType
{
  return self->_digestType;
}

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadata)eventMetadata
{
  return self->_eventMetadata;
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
    v6 = [(BMSiriOnDeviceDigestExperimentMetrics *)self eventMetadata];
    uint64_t v7 = [v5 eventMetadata];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriOnDeviceDigestExperimentMetrics *)self eventMetadata];
      v10 = [v5 eventMetadata];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_36;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetrics *)self hasDigestType]
      || [v5 hasDigestType])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetrics *)self hasDigestType]) {
        goto LABEL_36;
      }
      if (![v5 hasDigestType]) {
        goto LABEL_36;
      }
      unsigned int v13 = [(BMSiriOnDeviceDigestExperimentMetrics *)self digestType];
      if (v13 != [v5 digestType]) {
        goto LABEL_36;
      }
    }
    v14 = [(BMSiriOnDeviceDigestExperimentMetrics *)self experimentId];
    uint64_t v15 = [v5 experimentId];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMSiriOnDeviceDigestExperimentMetrics *)self experimentId];
      v18 = [v5 experimentId];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_36;
      }
    }
    v20 = [(BMSiriOnDeviceDigestExperimentMetrics *)self treatmentIdUUID];
    uint64_t v21 = [v5 treatmentIdUUID];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMSiriOnDeviceDigestExperimentMetrics *)self treatmentIdUUID];
      v24 = [v5 treatmentIdUUID];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_36;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetrics *)self hasDeploymentId]
      || [v5 hasDeploymentId])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetrics *)self hasDeploymentId]) {
        goto LABEL_36;
      }
      if (![v5 hasDeploymentId]) {
        goto LABEL_36;
      }
      int64_t v26 = [(BMSiriOnDeviceDigestExperimentMetrics *)self deploymentId];
      if (v26 != [v5 deploymentId]) {
        goto LABEL_36;
      }
    }
    v27 = [(BMSiriOnDeviceDigestExperimentMetrics *)self deviceType];
    uint64_t v28 = [v5 deviceType];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(BMSiriOnDeviceDigestExperimentMetrics *)self deviceType];
      v31 = [v5 deviceType];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_36;
      }
    }
    if (![(BMSiriOnDeviceDigestExperimentMetrics *)self hasProgramCode]
      && ![v5 hasProgramCode]
      || [(BMSiriOnDeviceDigestExperimentMetrics *)self hasProgramCode]
      && [v5 hasProgramCode]
      && (unsigned int v33 = [(BMSiriOnDeviceDigestExperimentMetrics *)self programCode],
          v33 == [v5 programCode]))
    {
      v34 = [(BMSiriOnDeviceDigestExperimentMetrics *)self digests];
      v35 = [v5 digests];
      if (v34 == v35)
      {
        char v12 = 1;
      }
      else
      {
        v36 = [(BMSiriOnDeviceDigestExperimentMetrics *)self digests];
        v37 = [v5 digests];
        char v12 = [v36 isEqual:v37];
      }
      goto LABEL_37;
    }
LABEL_36:
    char v12 = 0;
LABEL_37:

    goto LABEL_38;
  }
  char v12 = 0;
LABEL_38:

  return v12;
}

- (id)jsonDictionary
{
  v30[8] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriOnDeviceDigestExperimentMetrics *)self eventMetadata];
  uint64_t v4 = [v3 jsonDictionary];

  if ([(BMSiriOnDeviceDigestExperimentMetrics *)self hasDigestType])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics digestType](self, "digestType"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(BMSiriOnDeviceDigestExperimentMetrics *)self experimentId];
  uint64_t v7 = [(BMSiriOnDeviceDigestExperimentMetrics *)self treatmentIdUUID];
  if ([(BMSiriOnDeviceDigestExperimentMetrics *)self hasDeploymentId])
  {
    v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriOnDeviceDigestExperimentMetrics deploymentId](self, "deploymentId"));
  }
  else
  {
    v8 = 0;
  }
  v9 = [(BMSiriOnDeviceDigestExperimentMetrics *)self deviceType];
  if ([(BMSiriOnDeviceDigestExperimentMetrics *)self hasProgramCode])
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics programCode](self, "programCode"));
  }
  else
  {
    v10 = 0;
  }
  int v11 = [(BMSiriOnDeviceDigestExperimentMetrics *)self _digestsJSONArray];
  v29[0] = @"eventMetadata";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v12;
  v30[0] = v12;
  v29[1] = @"digestType";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = (void *)v4;
  v23 = (void *)v13;
  v30[1] = v13;
  v29[2] = @"experimentId";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v5;
  v22 = (void *)v14;
  v30[2] = v14;
  v29[3] = @"treatmentIdUUID";
  uint64_t v15 = (void *)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int64_t v26 = (void *)v6;
  v30[3] = v15;
  v29[4] = @"deploymentId";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v7;
  v30[4] = v16;
  v29[5] = @"deviceType";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[5] = v17;
  v29[6] = @"programCode";
  v18 = v10;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[6] = v18;
  v29[7] = @"digests";
  int v19 = v11;
  if (!v11)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[7] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];
  if (v11)
  {
    if (v10) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_28;
    }
  }

LABEL_28:
  if (!v9) {

  }
  if (!v8) {
  if (!v25)
  }

  if (!v26) {
  if (v27)
  }
  {
    if (v28) {
      goto LABEL_38;
    }
  }
  else
  {

    if (v28) {
      goto LABEL_38;
    }
  }

LABEL_38:

  return v20;
}

- (id)_digestsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMSiriOnDeviceDigestExperimentMetrics *)self digests];
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

- (BMSiriOnDeviceDigestExperimentMetrics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v147[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"eventMetadata"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v6;
    id v126 = 0;
    uint64_t v7 = [[BMSiriOnDeviceDigestExperimentMetricsEventMetadata alloc] initWithJSONDictionary:v19 error:&v126];
    id v20 = v126;
    if (v20)
    {
      uint64_t v21 = v20;
      if (a4) {
        *a4 = v20;
      }

      v22 = 0;
      goto LABEL_91;
    }

LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"digestType"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          id v19 = 0;
          goto LABEL_90;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = v8;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v144 = *MEMORY[0x1E4F28568];
        v31 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"digestType"];
        v145 = v31;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
        uint64_t v33 = v30;
        v8 = v29;
        v118 = (void *)v32;
        id v34 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v33, 2);
        v22 = 0;
        id v19 = 0;
        *a4 = v34;
LABEL_89:

LABEL_90:
        goto LABEL_91;
      }
      id v117 = v8;
    }
    else
    {
      id v117 = 0;
    }
    uint64_t v9 = [v5 objectForKeyedSubscript:@"experimentId"];
    v118 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v31 = 0;
          v22 = 0;
          id v19 = v117;
          goto LABEL_89;
        }
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        v50 = v8;
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v142 = *MEMORY[0x1E4F28568];
        v52 = v7;
        id v53 = [NSString alloc];
        uint64_t v101 = objc_opt_class();
        v54 = v53;
        uint64_t v7 = v52;
        uint64_t v55 = [v54 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v101, @"experimentId"];
        uint64_t v143 = v55;
        uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
        uint64_t v57 = v51;
        v8 = v50;
        v48 = (id *)v55;
        v116 = (void *)v56;
        id v58 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v57, 2);
        v22 = 0;
        v31 = 0;
        *a4 = v58;
        id v19 = v117;
        goto LABEL_88;
      }
      id v114 = v10;
    }
    else
    {
      id v114 = 0;
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:@"treatmentIdUUID"];
    v116 = (void *)v11;
    if (v11 && (long long v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v48 = a4;
        if (!a4)
        {
          v22 = 0;
          id v19 = v117;
          v31 = v114;
          goto LABEL_88;
        }
        id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
        v60 = v8;
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v140 = *MEMORY[0x1E4F28568];
        v62 = v7;
        id v63 = [NSString alloc];
        uint64_t v102 = objc_opt_class();
        v64 = v63;
        uint64_t v7 = v62;
        id v115 = (id)[v64 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v102, @"treatmentIdUUID"];
        id v141 = v115;
        uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
        uint64_t v66 = v61;
        v8 = v60;
        id v67 = (id)[v59 initWithDomain:v66 code:2 userInfo:v65];
        v22 = 0;
        v48 = 0;
        *a4 = v67;
        long long v13 = (void *)v65;
        id v19 = v117;
        v31 = v114;
LABEL_87:

LABEL_88:
        goto LABEL_89;
      }
      v111 = v12;
    }
    else
    {
      v111 = 0;
    }
    long long v13 = [v5 objectForKeyedSubscript:@"deploymentId"];
    v120 = v13;
    v113 = v6;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v115 = 0;
          v22 = 0;
          id v19 = v117;
          v31 = v114;
          v48 = v111;
          goto LABEL_87;
        }
        id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
        v69 = v8;
        uint64_t v70 = *MEMORY[0x1E4F502C8];
        uint64_t v138 = *MEMORY[0x1E4F28568];
        v71 = v7;
        id v72 = [NSString alloc];
        uint64_t v103 = objc_opt_class();
        v73 = v72;
        uint64_t v7 = v71;
        id v112 = (id)[v73 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v103, @"deploymentId"];
        id v139 = v112;
        uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
        uint64_t v75 = v70;
        v8 = v69;
        v110 = (void *)v74;
        id v76 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v75, 2);
        v22 = 0;
        id v115 = 0;
        *a4 = v76;
        id v19 = v117;
        v31 = v114;
        v48 = v111;
        goto LABEL_86;
      }
      long long v14 = self;
      id v115 = v13;
    }
    else
    {
      long long v14 = self;
      id v115 = 0;
    }
    uint64_t v15 = [v5 objectForKeyedSubscript:@"deviceType"];
    v110 = (void *)v15;
    if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v112 = 0;
          v22 = 0;
          id v19 = v117;
          v48 = v111;
          self = v14;
          uint64_t v6 = v113;
          v31 = v114;
          goto LABEL_86;
        }
        id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
        v78 = v8;
        uint64_t v79 = *MEMORY[0x1E4F502C8];
        uint64_t v136 = *MEMORY[0x1E4F28568];
        id v108 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceType"];
        id v137 = v108;
        uint64_t v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
        uint64_t v81 = v79;
        v8 = v78;
        v107 = (void *)v80;
        id v82 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v81, 2);
        v22 = 0;
        id v112 = 0;
        *a4 = v82;
        id v19 = v117;
        v48 = v111;
        self = v14;
        uint64_t v6 = v113;
        v31 = v114;
        goto LABEL_85;
      }
      id v112 = v16;
    }
    else
    {
      id v112 = 0;
    }
    uint64_t v17 = [v5 objectForKeyedSubscript:@"programCode"];
    v109 = v14;
    v105 = v8;
    v106 = v7;
    v107 = (void *)v17;
    if (!v17)
    {
      id v108 = 0;
      uint64_t v6 = v113;
      goto LABEL_44;
    }
    v18 = (void *)v17;
    objc_opt_class();
    uint64_t v6 = v113;
    if (objc_opt_isKindOfClass())
    {
      id v108 = 0;
LABEL_44:
      id v35 = [v5 objectForKeyedSubscript:@"digests"];
      v36 = [MEMORY[0x1E4F1CA98] null];
      int v37 = [v35 isEqual:v36];

      self = v109;
      if (v37)
      {
        id v104 = v5;

        id v35 = 0;
LABEL_49:
        v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count"));
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v35 = v35;
        uint64_t v39 = [v35 countByEnumeratingWithState:&v122 objects:v131 count:16];
        if (!v39) {
          goto LABEL_59;
        }
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v123;
LABEL_51:
        uint64_t v42 = 0;
        while (1)
        {
          if (*(void *)v123 != v41) {
            objc_enumerationMutation(v35);
          }
          v43 = *(void **)(*((void *)&v122 + 1) + 8 * v42);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v5 = v104;
            self = v109;
            uint64_t v6 = v113;
            v87 = a4;
            if (!a4) {
              goto LABEL_81;
            }
            v88 = v113;
            id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v90 = *MEMORY[0x1E4F502C8];
            uint64_t v127 = *MEMORY[0x1E4F28568];
            id v44 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"digests"];
            id v128 = v44;
            v91 = (void *)MEMORY[0x1E4F1C9E8];
            v92 = &v128;
            v93 = &v127;
            goto LABEL_76;
          }
          id v44 = v43;
          v45 = [BMSiriOnDeviceDigestExperimentMetricsExperimentDigest alloc];
          id v121 = 0;
          v46 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)v45 initWithJSONDictionary:v44 error:&v121];
          id v47 = v121;
          if (v47)
          {
            v94 = v47;
            if (a4) {
              *a4 = v47;
            }

            id v5 = v104;
            self = v109;
            uint64_t v6 = v113;
LABEL_80:

            long long v13 = v120;
LABEL_81:

            goto LABEL_82;
          }
          [v38 addObject:v46];

          ++v42;
          long long v13 = v120;
          if (v40 == v42)
          {
            uint64_t v40 = [v35 countByEnumeratingWithState:&v122 objects:v131 count:16];
            self = v109;
            if (v40) {
              goto LABEL_51;
            }
LABEL_59:

            id v19 = v117;
            v31 = v114;
            v48 = v111;
            self = [(BMSiriOnDeviceDigestExperimentMetrics *)self initWithEventMetadata:v106 digestType:v117 experimentId:v114 treatmentIdUUID:v111 deploymentId:v115 deviceType:v112 programCode:v108 digests:v38];
            v22 = self;
            id v5 = v104;
            uint64_t v6 = v113;
LABEL_83:

            uint64_t v7 = v106;
            goto LABEL_84;
          }
        }
        id v5 = v104;
        self = v109;
        uint64_t v6 = v113;
        v87 = a4;
        if (!a4) {
          goto LABEL_81;
        }
        v88 = v113;
        id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v90 = *MEMORY[0x1E4F502C8];
        uint64_t v129 = *MEMORY[0x1E4F28568];
        id v44 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"digests"];
        id v130 = v44;
        v91 = (void *)MEMORY[0x1E4F1C9E8];
        v92 = &v130;
        v93 = &v129;
LABEL_76:
        v94 = [v91 dictionaryWithObjects:v92 forKeys:v93 count:1];
        v95 = v89;
        uint64_t v6 = v88;
        id *v87 = (id)[v95 initWithDomain:v90 code:2 userInfo:v94];
        goto LABEL_80;
      }
      if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v104 = v5;
        goto LABEL_49;
      }
      if (a4)
      {
        id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v98 = *MEMORY[0x1E4F502C8];
        uint64_t v132 = *MEMORY[0x1E4F28568];
        v38 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"digests"];
        v133 = v38;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
        v100 = v99 = v6;
        *a4 = (id)[v97 initWithDomain:v98 code:2 userInfo:v100];

        uint64_t v6 = v99;
LABEL_82:
        v22 = 0;
        id v19 = v117;
        v31 = v114;
        v48 = v111;
        goto LABEL_83;
      }
      v22 = 0;
      id v19 = v117;
      v31 = v114;
      v48 = v111;
LABEL_84:

      v8 = v105;
      goto LABEL_85;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v108 = v18;
      goto LABEL_44;
    }
    if (a4)
    {
      id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v84 = *MEMORY[0x1E4F502C8];
      uint64_t v134 = *MEMORY[0x1E4F28568];
      id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"programCode"];
      id v135 = v35;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
      uint64_t v85 = v84;
      uint64_t v6 = v113;
      id v86 = (id)[v83 initWithDomain:v85 code:2 userInfo:v38];
      v22 = 0;
      id v108 = 0;
      *a4 = v86;
      id v19 = v117;
      v31 = v114;
      v48 = v111;
      self = v109;
      goto LABEL_83;
    }
    id v108 = 0;
    v22 = 0;
    id v19 = v117;
    v31 = v114;
    v48 = v111;
    self = v109;
LABEL_85:

LABEL_86:
    goto LABEL_87;
  }
  if (a4)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    v24 = self;
    uint64_t v25 = *MEMORY[0x1E4F502C8];
    uint64_t v146 = *MEMORY[0x1E4F28568];
    uint64_t v7 = (BMSiriOnDeviceDigestExperimentMetricsEventMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"eventMetadata"];
    v147[0] = v7;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:&v146 count:1];
    uint64_t v26 = v25;
    self = v24;
    id v27 = (id)[v23 initWithDomain:v26 code:2 userInfo:v19];
    v22 = 0;
    *a4 = v27;
LABEL_91:

    goto LABEL_92;
  }
  v22 = 0;
LABEL_92:

  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestExperimentMetrics *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_eventMetadata)
  {
    uint64_t v15 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestExperimentMetricsEventMetadata *)self->_eventMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasDigestType) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_experimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentIdUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasDeploymentId) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_deviceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasProgramCode) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_digests;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        uint64_t v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (void)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)BMSiriOnDeviceDigestExperimentMetrics;
  id v5 = [(BMEventBase *)&v59 init];
  if (!v5) {
    goto LABEL_69;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = off_1E6027000;
    long long v11 = &OBJC_IVAR___BMAppInFocus__hasDuration;
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
          uint64_t v60 = 0;
          uint64_t v61 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_71;
          }
          uint64_t v23 = [objc_alloc(v10[7]) initByReadFrom:v4];
          if (!v23) {
            goto LABEL_71;
          }
          uint64_t v24 = v11[988];
          uint64_t v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          PBReaderRecallMark();
          continue;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasDigestType = 1;
          while (2)
          {
            uint64_t v29 = *v7;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v12] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v20 = v27++ >= 9;
                if (v20)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v28) = 0;
          }
LABEL_56:
          uint64_t v53 = 24;
          goto LABEL_65;
        case 3u:
          uint64_t v33 = PBReaderReadString();
          uint64_t v34 = 40;
          goto LABEL_42;
        case 4u:
          uint64_t v33 = PBReaderReadString();
          uint64_t v34 = 48;
          goto LABEL_42;
        case 5u:
          char v35 = 0;
          unsigned int v36 = 0;
          int64_t v37 = 0;
          v5->_hasDeploymentId = 1;
          while (2)
          {
            uint64_t v38 = *v7;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v12] + v39);
              *(void *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                BOOL v20 = v36++ >= 9;
                if (v20)
                {
                  int64_t v37 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            int64_t v37 = 0;
          }
LABEL_60:
          v5->_deploymentId = v37;
          continue;
        case 6u:
          uint64_t v33 = PBReaderReadString();
          uint64_t v34 = 64;
LABEL_42:
          uint64_t v42 = *(Class *)((char *)&v5->super.super.isa + v34);
          *(Class *)((char *)&v5->super.super.isa + v34) = (Class)v33;

          continue;
        case 7u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v28 = 0;
          v5->_hasProgramCode = 1;
          break;
        case 8u:
          uint64_t v60 = 0;
          uint64_t v61 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_71;
          }
          id v49 = v11;
          v50 = v10;
          id v51 = [[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest alloc] initByReadFrom:v4];
          if (!v51) {
            goto LABEL_71;
          }
          v52 = v51;
          [v6 addObject:v51];
          PBReaderRecallMark();

          v10 = v50;
          long long v11 = v49;
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_71:

          goto LABEL_68;
      }
      while (1)
      {
        uint64_t v45 = *v7;
        uint64_t v46 = *(void *)&v4[v45];
        unint64_t v47 = v46 + 1;
        if (v46 == -1 || v47 > *(void *)&v4[*v8]) {
          break;
        }
        char v48 = *(unsigned char *)(*(void *)&v4[*v12] + v46);
        *(void *)&v4[v45] = v47;
        v28 |= (unint64_t)(v48 & 0x7F) << v43;
        if ((v48 & 0x80) == 0) {
          goto LABEL_62;
        }
        v43 += 7;
        BOOL v20 = v44++ >= 9;
        if (v20)
        {
          LODWORD(v28) = 0;
          goto LABEL_64;
        }
      }
      v4[*v9] = 1;
LABEL_62:
      if (v4[*v9]) {
        LODWORD(v28) = 0;
      }
LABEL_64:
      uint64_t v53 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v53) = v28;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v54 = [v6 copy];
  digests = v5->_digests;
  v5->_digests = (NSArray *)v54;

  int v56 = v4[*v9];
  if (v56) {
LABEL_68:
  }
    uint64_t v57 = 0;
  else {
LABEL_69:
  }
    uint64_t v57 = v5;

  return v57;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriOnDeviceDigestExperimentMetrics *)self eventMetadata];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics digestType](self, "digestType"));
  uint64_t v6 = [(BMSiriOnDeviceDigestExperimentMetrics *)self experimentId];
  uint64_t v7 = [(BMSiriOnDeviceDigestExperimentMetrics *)self treatmentIdUUID];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSiriOnDeviceDigestExperimentMetrics deploymentId](self, "deploymentId"));
  uint64_t v9 = [(BMSiriOnDeviceDigestExperimentMetrics *)self deviceType];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics programCode](self, "programCode"));
  long long v11 = [(BMSiriOnDeviceDigestExperimentMetrics *)self digests];
  long long v12 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestExperimentMetrics with eventMetadata: %@, digestType: %@, experimentId: %@, treatmentIdUUID: %@, deploymentId: %@, deviceType: %@, programCode: %@, digests: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSiriOnDeviceDigestExperimentMetrics)initWithEventMetadata:(id)a3 digestType:(id)a4 experimentId:(id)a5 treatmentIdUUID:(id)a6 deploymentId:(id)a7 deviceType:(id)a8 programCode:(id)a9 digests:(id)a10
{
  id v29 = a3;
  id v17 = a4;
  id v28 = a5;
  id v27 = a6;
  id v18 = a7;
  id v26 = a8;
  id v19 = a9;
  id v20 = a10;
  v30.receiver = self;
  v30.super_class = (Class)BMSiriOnDeviceDigestExperimentMetrics;
  int v21 = [(BMEventBase *)&v30 init];
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27, v28, v29);
    objc_storeStrong((id *)&v21->_eventMetadata, a3);
    if (v17)
    {
      v21->_hasDigestType = 1;
      unsigned int v22 = [v17 unsignedIntValue];
    }
    else
    {
      unsigned int v22 = 0;
      v21->_hasDigestType = 0;
    }
    v21->_digestType = v22;
    objc_storeStrong((id *)&v21->_experimentId, a5);
    objc_storeStrong((id *)&v21->_treatmentIdUUID, a6);
    if (v18)
    {
      v21->_hasDeploymentId = 1;
      uint64_t v23 = [v18 longLongValue];
    }
    else
    {
      v21->_hasDeploymentId = 0;
      uint64_t v23 = -1;
    }
    v21->_deploymentId = v23;
    objc_storeStrong((id *)&v21->_deviceType, a8);
    if (v19)
    {
      v21->_hasProgramCode = 1;
      unsigned int v24 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v24 = 0;
      v21->_hasProgramCode = 0;
    }
    v21->_programCode = v24;
    objc_storeStrong((id *)&v21->_digests, a10);
  }

  return v21;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventMetadata" number:1 type:14 subMessageClass:objc_opt_class()];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"digestType" number:2 type:4 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experimentId" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"treatmentIdUUID" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deploymentId" number:5 type:3 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"programCode" number:7 type:4 subMessageClass:0];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"digests" number:8 type:14 subMessageClass:objc_opt_class()];
  v12[7] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5B68;
}

id __48__BMSiriOnDeviceDigestExperimentMetrics_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _digestsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __48__BMSiriOnDeviceDigestExperimentMetrics_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 eventMetadata];
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

    uint64_t v8 = [[BMSiriOnDeviceDigestExperimentMetrics alloc] initByReadFrom:v7];
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