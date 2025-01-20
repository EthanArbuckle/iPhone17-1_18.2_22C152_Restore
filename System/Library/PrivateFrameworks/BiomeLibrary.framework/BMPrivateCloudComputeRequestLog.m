@interface BMPrivateCloudComputeRequestLog
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPrivateCloudComputeRequestLog)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMPrivateCloudComputeRequestLog)initWithTimestamp:(id)a3 requestId:(id)a4 pipelineKind:(id)a5 pipelineParameters:(id)a6 nodes:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)nodes;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)pipelineKind;
- (NSString)pipelineParameters;
- (NSString)requestId;
- (id)_nodesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPrivateCloudComputeRequestLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_pipelineKind, 0);

  objc_storeStrong((id *)&self->_requestId, 0);
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (NSString)pipelineParameters
{
  return self->_pipelineParameters;
}

- (NSString)pipelineKind
{
  return self->_pipelineKind;
}

- (NSString)requestId
{
  return self->_requestId;
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
    v6 = [(BMPrivateCloudComputeRequestLog *)self timestamp];
    uint64_t v7 = [v5 timestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPrivateCloudComputeRequestLog *)self timestamp];
      v10 = [v5 timestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMPrivateCloudComputeRequestLog *)self requestId];
    uint64_t v14 = [v5 requestId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPrivateCloudComputeRequestLog *)self requestId];
      v17 = [v5 requestId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMPrivateCloudComputeRequestLog *)self pipelineKind];
    uint64_t v20 = [v5 pipelineKind];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMPrivateCloudComputeRequestLog *)self pipelineKind];
      v23 = [v5 pipelineKind];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMPrivateCloudComputeRequestLog *)self pipelineParameters];
    uint64_t v26 = [v5 pipelineParameters];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMPrivateCloudComputeRequestLog *)self pipelineParameters];
      v29 = [v5 pipelineParameters];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMPrivateCloudComputeRequestLog *)self nodes];
    v32 = [v5 nodes];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMPrivateCloudComputeRequestLog *)self nodes];
      v34 = [v5 nodes];
      char v12 = [v33 isEqual:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(BMPrivateCloudComputeRequestLog *)self timestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMPrivateCloudComputeRequestLog *)self timestamp];
    [v5 timeIntervalSince1970];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  uint64_t v7 = [(BMPrivateCloudComputeRequestLog *)self requestId];
  v8 = [(BMPrivateCloudComputeRequestLog *)self pipelineKind];
  v9 = [(BMPrivateCloudComputeRequestLog *)self pipelineParameters];
  v10 = [(BMPrivateCloudComputeRequestLog *)self _nodesJSONArray];
  v20[0] = @"timestamp";
  uint64_t v11 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v11;
  v22[0] = v11;
  v20[1] = @"requestId";
  char v12 = v7;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[1] = v12;
  v20[2] = @"pipelineKind";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v13;
  v20[3] = @"pipelineParameters";
  uint64_t v14 = v9;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v14;
  v20[4] = @"nodes";
  if (v10)
  {
    v23 = v10;
    v21 = @"attestations";
    v15 = v10;
  }
  else
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
    v23 = v18;
    v21 = @"attestations";
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v20 count:6];
  if (v10)
  {
    if (v9) {
      goto LABEL_17;
    }
  }
  else
  {

    if (v9)
    {
LABEL_17:
      if (v8) {
        goto LABEL_18;
      }
      goto LABEL_25;
    }
  }

  if (v8)
  {
LABEL_18:
    if (v7) {
      goto LABEL_19;
    }
LABEL_26:

    if (v6) {
      goto LABEL_20;
    }
    goto LABEL_27;
  }
LABEL_25:

  if (!v7) {
    goto LABEL_26;
  }
LABEL_19:
  if (v6) {
    goto LABEL_20;
  }
LABEL_27:

LABEL_20:

  return v16;
}

- (id)_nodesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMPrivateCloudComputeRequestLog *)self nodes];
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

- (BMPrivateCloudComputeRequestLog)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"timestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v10 = v7;
    id v11 = [v9 alloc];
    [v10 doubleValue];
    double v13 = v12;

    id v14 = (id)[v11 initWithTimeIntervalSince1970:v13];
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v8 = 0;
        v36 = 0;
        goto LABEL_63;
      }
      id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
      v82 = a4;
      uint64_t v67 = *MEMORY[0x1E4F502C8];
      uint64_t v106 = *MEMORY[0x1E4F28568];
      id v68 = v6;
      id v69 = [NSString alloc];
      uint64_t v73 = objc_opt_class();
      v70 = v69;
      id v6 = v68;
      v34 = (void *)[v70 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", v73, @"timestamp"];
      v107[0] = v34;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:&v106 count:1];
      v8 = 0;
      v36 = 0;
      id *v82 = (id)[v66 initWithDomain:v67 code:2 userInfo:v16];
      goto LABEL_62;
    }
    id v14 = v7;
    goto LABEL_6;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v8 = [v15 dateFromString:v7];

LABEL_9:
  uint64_t v16 = [v6 objectForKeyedSubscript:@"requestId"];
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v85 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v85 = v16;
LABEL_12:
    uint64_t v17 = [v6 objectForKeyedSubscript:@"pipelineKind"];
    v87 = (void *)v17;
    if (!v17 || (int v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v83 = 0;
LABEL_15:
      uint64_t v19 = [v6 objectForKeyedSubscript:@"pipelineParameters"];
      v78 = v16;
      v84 = (void *)v19;
      if (v19 && (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v86 = 0;
            v36 = 0;
            v34 = v85;
            v35 = v83;
            goto LABEL_59;
          }
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v100 = *MEMORY[0x1E4F28568];
          v52 = a4;
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"pipelineParameters"];
          id v101 = v21;
          int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
          id v53 = (id)[v50 initWithDomain:v51 code:2 userInfo:v24];
          v36 = 0;
          id v86 = 0;
          id *v52 = v53;
          goto LABEL_56;
        }
        v79 = a4;
        id v86 = v20;
      }
      else
      {
        v79 = a4;
        id v86 = 0;
      }
      id v21 = [v6 objectForKeyedSubscript:@"nodes"];
      v22 = [MEMORY[0x1E4F1CA98] null];
      int v23 = [v21 isEqual:v22];

      v77 = v8;
      if (v23)
      {
        v75 = self;
        v76 = v7;

        id v21 = 0;
LABEL_25:
        int v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v21 = v21;
        uint64_t v25 = [v21 countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (!v25) {
          goto LABEL_35;
        }
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v90;
        id v74 = v6;
LABEL_27:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v90 != v27) {
            objc_enumerationMutation(v21);
          }
          v29 = *(void **)(*((void *)&v89 + 1) + 8 * v28);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v6 = v74;
            self = v75;
            v8 = v77;
            v54 = v79;
            if (!v79) {
              goto LABEL_55;
            }
            id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v56 = *MEMORY[0x1E4F502C8];
            uint64_t v93 = *MEMORY[0x1E4F28568];
            id v30 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"nodes"];
            id v94 = v30;
            v57 = (void *)MEMORY[0x1E4F1C9E8];
            v58 = &v94;
            v59 = &v93;
            goto LABEL_50;
          }
          id v30 = v29;
          v31 = [BMPrivateCloudComputeRequestLogAttestation alloc];
          id v88 = 0;
          v32 = [(BMPrivateCloudComputeRequestLogAttestation *)v31 initWithJSONDictionary:v30 error:&v88];
          id v33 = v88;
          if (v33)
          {
            v60 = v33;
            if (v79) {
              id *v79 = v33;
            }

            id v6 = v74;
            self = v75;
            v8 = v77;
LABEL_54:

LABEL_55:
            v36 = 0;
            uint64_t v7 = v76;
            goto LABEL_56;
          }
          [v24 addObject:v32];

          if (v26 == ++v28)
          {
            uint64_t v26 = [v21 countByEnumeratingWithState:&v89 objects:v97 count:16];
            id v6 = v74;
            if (v26) {
              goto LABEL_27;
            }
LABEL_35:

            v8 = v77;
            v34 = v85;
            v35 = v83;
            self = [(BMPrivateCloudComputeRequestLog *)v75 initWithTimestamp:v77 requestId:v85 pipelineKind:v83 pipelineParameters:v86 nodes:v24];
            v36 = self;
            uint64_t v7 = v76;
LABEL_57:

            uint64_t v16 = v78;
LABEL_58:

LABEL_59:
            v49 = v84;
LABEL_60:

            goto LABEL_61;
          }
        }
        id v6 = v74;
        self = v75;
        v8 = v77;
        v54 = v79;
        if (!v79) {
          goto LABEL_55;
        }
        id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v56 = *MEMORY[0x1E4F502C8];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        id v30 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"nodes"];
        id v96 = v30;
        v57 = (void *)MEMORY[0x1E4F1C9E8];
        v58 = &v96;
        v59 = &v95;
LABEL_50:
        v60 = [v57 dictionaryWithObjects:v58 forKeys:v59 count:1];
        uint64_t v61 = v56;
        v8 = v77;
        id *v54 = (id)[v55 initWithDomain:v61 code:2 userInfo:v60];
        goto LABEL_54;
      }
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v75 = self;
        v76 = v7;
        goto LABEL_25;
      }
      if (!v79)
      {
        v36 = 0;
        v34 = v85;
        v35 = v83;
        goto LABEL_58;
      }
      id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v64 = *MEMORY[0x1E4F502C8];
      uint64_t v98 = *MEMORY[0x1E4F28568];
      int v24 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"nodes"];
      v99 = v24;
      v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
      id *v79 = (id)[v63 initWithDomain:v64 code:2 userInfo:v65];

      v36 = 0;
LABEL_56:
      v34 = v85;
      v35 = v83;
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v83 = v18;
      goto LABEL_15;
    }
    if (a4)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      v81 = a4;
      uint64_t v43 = *MEMORY[0x1E4F502C8];
      uint64_t v102 = *MEMORY[0x1E4F28568];
      v44 = v16;
      id v45 = [NSString alloc];
      uint64_t v72 = objc_opt_class();
      v46 = v45;
      uint64_t v16 = v44;
      id v86 = (id)[v46 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v72, @"pipelineKind"];
      id v103 = v86;
      uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
      v48 = v42;
      v49 = (void *)v47;
      v36 = 0;
      v35 = 0;
      id *v81 = (id)[v48 initWithDomain:v43 code:2 userInfo:v47];
      v34 = v85;
      goto LABEL_60;
    }
    v35 = 0;
    v36 = 0;
    v34 = v85;
LABEL_61:

    goto LABEL_62;
  }
  if (a4)
  {
    id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
    v80 = a4;
    uint64_t v38 = *MEMORY[0x1E4F502C8];
    uint64_t v104 = *MEMORY[0x1E4F28568];
    v39 = v16;
    id v40 = [NSString alloc];
    uint64_t v71 = objc_opt_class();
    v41 = v40;
    uint64_t v16 = v39;
    v35 = (void *)[v41 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v71, @"requestId"];
    v105 = v35;
    v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    v36 = 0;
    v34 = 0;
    id *v80 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2);
    goto LABEL_61;
  }
  v34 = 0;
  v36 = 0;
LABEL_62:

LABEL_63:
  return v36;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPrivateCloudComputeRequestLog *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_requestId) {
    PBDataWriterWriteStringField();
  }
  if (self->_pipelineKind) {
    PBDataWriterWriteStringField();
  }
  if (self->_pipelineParameters) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_nodes;
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
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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
  v34.receiver = self;
  v34.super_class = (Class)BMPrivateCloudComputeRequestLog;
  uint64_t v5 = [(BMEventBase *)&v34 init];
  if (!v5)
  {
LABEL_37:
    v32 = v5;
    goto LABEL_38;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_35:
    uint64_t v29 = [v6 copy];
    nodes = v5->_nodes;
    v5->_nodes = (NSArray *)v29;

    int v31 = v4[*v9];
    if (v31) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  id v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_35;
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
      goto LABEL_35;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 48;
        goto LABEL_31;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 56;
        goto LABEL_31;
      case 3u:
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_39;
        }
        id v23 = [[BMPrivateCloudComputeRequestLogAttestation alloc] initByReadFrom:v4];
        if (!v23) {
          goto LABEL_39;
        }
        int v24 = v23;
        [v6 addObject:v23];
        PBReaderRecallMark();

        goto LABEL_34;
      case 4u:
        v5->_hasRaw_timestamp = 1;
        uint64_t v25 = *v7;
        unint64_t v26 = *(void *)&v4[v25];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v8])
        {
          double v27 = *(double *)(*(void *)&v4[*v10] + v26);
          *(void *)&v4[v25] = v26 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v27 = 0.0;
        }
        v5->_raw_timestamp = v27;
        goto LABEL_34;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 40;
LABEL_31:
        uint64_t v28 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_34;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_34:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_35;
          }
          continue;
        }
LABEL_39:

LABEL_36:
        v32 = 0;
LABEL_38:

        return v32;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPrivateCloudComputeRequestLog *)self timestamp];
  uint64_t v5 = [(BMPrivateCloudComputeRequestLog *)self requestId];
  uint64_t v6 = [(BMPrivateCloudComputeRequestLog *)self pipelineKind];
  uint64_t v7 = [(BMPrivateCloudComputeRequestLog *)self pipelineParameters];
  uint64_t v8 = [(BMPrivateCloudComputeRequestLog *)self nodes];
  v9 = (void *)[v3 initWithFormat:@"BMPrivateCloudComputeRequestLog with timestamp: %@, requestId: %@, pipelineKind: %@, pipelineParameters: %@, nodes: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMPrivateCloudComputeRequestLog)initWithTimestamp:(id)a3 requestId:(id)a4 pipelineKind:(id)a5 pipelineParameters:(id)a6 nodes:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMPrivateCloudComputeRequestLog;
  char v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v17->_hasRaw_timestamp = 1;
      [v12 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_timestamp = 0;
      double v18 = -1.0;
    }
    v17->_raw_timestamp = v18;
    objc_storeStrong((id *)&v17->_requestId, a4);
    objc_storeStrong((id *)&v17->_pipelineKind, a5);
    objc_storeStrong((id *)&v17->_pipelineParameters, a6);
    objc_storeStrong((id *)&v17->_nodes, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:4 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"requestId", 5, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pipelineKind" number:1 type:13 subMessageClass:0];
  v9[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pipelineParameters" number:2 type:13 subMessageClass:0];
  v9[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nodes" number:3 type:14 subMessageClass:objc_opt_class()];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7548;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestId" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pipelineKind" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pipelineParameters" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"nodes_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_86159];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"attestations_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_165];
  v10[0] = v4;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v2;
  v10[5] = v3;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __42__BMPrivateCloudComputeRequestLog_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _attestationsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __42__BMPrivateCloudComputeRequestLog_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _nodesJSONArray];
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

    uint64_t v8 = [[BMPrivateCloudComputeRequestLog alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end