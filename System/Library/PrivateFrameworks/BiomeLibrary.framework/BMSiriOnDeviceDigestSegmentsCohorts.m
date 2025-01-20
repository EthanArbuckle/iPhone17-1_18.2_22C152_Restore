@interface BMSiriOnDeviceDigestSegmentsCohorts
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestSegmentsCohorts)initWithEventMetadata:(id)a3 deviceSegmentsReported:(id)a4 deviceCohortsReported:(id)a5;
- (BMSiriOnDeviceDigestSegmentsCohorts)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)eventMetadata;
- (BOOL)isEqual:(id)a3;
- (NSArray)deviceCohortsReported;
- (NSArray)deviceSegmentsReported;
- (NSString)description;
- (id)_deviceCohortsReportedJSONArray;
- (id)_deviceSegmentsReportedJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestSegmentsCohorts

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"eventMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_343];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"deviceSegmentsReported_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_345];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"deviceCohortsReported_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_347_36248];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCohortsReported, 0);
  objc_storeStrong((id *)&self->_deviceSegmentsReported, 0);

  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (NSArray)deviceCohortsReported
{
  return self->_deviceCohortsReported;
}

- (NSArray)deviceSegmentsReported
{
  return self->_deviceSegmentsReported;
}

- (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata)eventMetadata
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
    v6 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self eventMetadata];
    uint64_t v7 = [v5 eventMetadata];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self eventMetadata];
      v10 = [v5 eventMetadata];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceSegmentsReported];
    uint64_t v14 = [v5 deviceSegmentsReported];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceSegmentsReported];
      v17 = [v5 deviceSegmentsReported];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceCohortsReported];
    v20 = [v5 deviceCohortsReported];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceCohortsReported];
      v22 = [v5 deviceCohortsReported];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self eventMetadata];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self _deviceSegmentsReportedJSONArray];
  v6 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self _deviceCohortsReportedJSONArray];
  v12[0] = @"eventMetadata";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v7;
  v12[1] = @"deviceSegmentsReported";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v12[2] = @"deviceCohortsReported";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (v6)
  {
    if (v5) {
      goto LABEL_9;
    }
LABEL_14:

    if (v4) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v5) {
    goto LABEL_14;
  }
LABEL_9:
  if (v4) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (id)_deviceCohortsReportedJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceCohortsReported];
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

- (id)_deviceSegmentsReportedJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceSegmentsReported];
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

- (BMSiriOnDeviceDigestSegmentsCohorts)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"eventMetadata"];
  v63 = (void *)v6;
  if (v6 && (uint64_t v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        v91[0] = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"eventMetadata"];
        v8 = (BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)v91[0];
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];
        v28 = 0;
        *a4 = (id)[v26 initWithDomain:v27 code:2 userInfo:v9];
        goto LABEL_68;
      }
      v28 = 0;
      goto LABEL_69;
    }
    id v9 = v7;
    id v75 = 0;
    v8 = [[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata alloc] initWithJSONDictionary:v9 error:&v75];
    id v24 = v75;
    if (v24)
    {
      v25 = v24;
      if (a4) {
        *a4 = v24;
      }

      goto LABEL_51;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = [v5 objectForKeyedSubscript:@"deviceSegmentsReported"];
  v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  v61 = v5;
  if (!v11)
  {
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v60 = v8;
      goto LABEL_9;
    }
    if (a4)
    {
      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v46 = *MEMORY[0x1E4F502C8];
      uint64_t v88 = *MEMORY[0x1E4F28568];
      v64 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"deviceSegmentsReported"];
      v89 = v64;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      v28 = 0;
      *a4 = (id)[v45 initWithDomain:v46 code:2 userInfo:v21];
      goto LABEL_67;
    }
LABEL_51:
    v28 = 0;
    goto LABEL_68;
  }
  v60 = v8;

  id v9 = 0;
LABEL_9:
  v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v9 = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (!v12) {
    goto LABEL_19;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v72;
  v58 = self;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v72 != v14) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v85 = *MEMORY[0x1E4F28568];
          id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"deviceSegmentsReported"];
          id v86 = v17;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          *a4 = (id)[v29 initWithDomain:v30 code:2 userInfo:v31];

LABEL_35:
          v28 = 0;
          id v21 = v9;
          self = v58;
          v8 = v60;
          goto LABEL_66;
        }
LABEL_52:
        v28 = 0;
        id v21 = v9;
        self = v58;
        v8 = v60;
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v33 = *MEMORY[0x1E4F502C8];
          uint64_t v83 = *MEMORY[0x1E4F28568];
          id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"deviceSegmentsReported"];
          id v84 = v17;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          *a4 = (id)[v32 initWithDomain:v33 code:2 userInfo:v34];

          goto LABEL_35;
        }
        goto LABEL_52;
      }
      id v17 = v16;
      int v18 = [BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments alloc];
      id v70 = 0;
      v19 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments *)v18 initWithJSONDictionary:v17 error:&v70];
      id v20 = v70;
      if (v20)
      {
        v35 = v20;
        if (a4) {
          *a4 = v20;
        }

        goto LABEL_35;
      }
      [v64 addObject:v19];
    }
    uint64_t v13 = [v9 countByEnumeratingWithState:&v71 objects:v87 count:16];
    self = v58;
  }
  while (v13);
LABEL_19:

  id v21 = [v61 objectForKeyedSubscript:@"deviceCohortsReported"];
  v22 = [MEMORY[0x1E4F1CA98] null];
  int v23 = [v21 isEqual:v22];

  if (v23)
  {

    id v21 = 0;
LABEL_38:
    id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v21 = v21;
    uint64_t v36 = [v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (!v36) {
      goto LABEL_48;
    }
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v67;
    v59 = self;
LABEL_40:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v67 != v38) {
        objc_enumerationMutation(v21);
      }
      v40 = *(void **)(*((void *)&v66 + 1) + 8 * v39);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v59;
        v8 = v60;
        v47 = a4;
        if (!a4) {
          goto LABEL_64;
        }
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        id v41 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"deviceCohortsReported"];
        id v77 = v41;
        v50 = (void *)MEMORY[0x1E4F1C9E8];
        v51 = &v77;
        v52 = &v76;
        goto LABEL_59;
      }
      id v41 = v40;
      v42 = [BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts alloc];
      id v65 = 0;
      v43 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)v42 initWithJSONDictionary:v41 error:&v65];
      id v44 = v65;
      if (v44)
      {
        v53 = v44;
        if (a4) {
          *a4 = v44;
        }

        self = v59;
        v8 = v60;
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      [v17 addObject:v43];

      if (v37 == ++v39)
      {
        uint64_t v37 = [v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
        self = v59;
        if (v37) {
          goto LABEL_40;
        }
LABEL_48:

        v8 = v60;
        self = [(BMSiriOnDeviceDigestSegmentsCohorts *)self initWithEventMetadata:v60 deviceSegmentsReported:v64 deviceCohortsReported:v17];
        v28 = self;
LABEL_66:

        goto LABEL_67;
      }
    }
    self = v59;
    v8 = v60;
    v47 = a4;
    if (!a4) {
      goto LABEL_64;
    }
    id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v49 = *MEMORY[0x1E4F502C8];
    uint64_t v78 = *MEMORY[0x1E4F28568];
    id v41 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"deviceCohortsReported"];
    id v79 = v41;
    v50 = (void *)MEMORY[0x1E4F1C9E8];
    v51 = &v79;
    v52 = &v78;
LABEL_59:
    v53 = [v50 dictionaryWithObjects:v51 forKeys:v52 count:1];
    id *v47 = (id)[v48 initWithDomain:v49 code:2 userInfo:v53];
    goto LABEL_63;
  }
  if (!v21) {
    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_38;
  }
  v8 = v60;
  if (a4)
  {
    id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v56 = *MEMORY[0x1E4F502C8];
    uint64_t v81 = *MEMORY[0x1E4F28568];
    id v17 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"deviceCohortsReported"];
    id v82 = v17;
    v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    *a4 = (id)[v55 initWithDomain:v56 code:2 userInfo:v57];

LABEL_65:
    v28 = 0;
    goto LABEL_66;
  }
  v28 = 0;
LABEL_67:

  id v5 = v61;
LABEL_68:

LABEL_69:
  return v28;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestSegmentsCohorts *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_eventMetadata)
  {
    uint64_t v25 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestSegmentsCohortsEventMetadata *)self->_eventMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_deviceSegmentsReported;
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

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v11 = self->_deviceCohortsReported;
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
  v35.receiver = self;
  v35.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohorts;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_35;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    int v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v10]) {
        goto LABEL_34;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        unint64_t v16 = *(void *)&v4[v15];
        if (v16 == -1 || v16 >= *(void *)&v4[*v9]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v16 + 1;
        v14 |= (unint64_t)(v17 & 0x7F) << v12;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        if (v13++ >= 9)
        {
          unint64_t v14 = 0;
          int v19 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v19 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v19 || (v14 & 7) == 4) {
        goto LABEL_34;
      }
      unint64_t v21 = v14 >> 3;
      if ((v14 >> 3) == 3) {
        break;
      }
      if (v21 == 2)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_36;
        }
        id v27 = [[BMSiriOnDeviceDigestSegmentsCohortsDeviceSegments alloc] initByReadFrom:v4];
        if (!v27) {
          goto LABEL_36;
        }
        uint64_t v25 = v27;
        id v26 = v6;
LABEL_31:
        [v26 addObject:v25];
        PBReaderRecallMark();

        goto LABEL_33;
      }
      if (v21 == 1)
      {
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_36;
        }
        long long v22 = [[BMSiriOnDeviceDigestSegmentsCohortsEventMetadata alloc] initByReadFrom:v4];
        if (!v22) {
          goto LABEL_36;
        }
        eventMetadata = v5->_eventMetadata;
        v5->_eventMetadata = v22;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_36;
      }
LABEL_33:
      if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
        goto LABEL_34;
      }
    }
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    if ((PBReaderPlaceMark() & 1) == 0
      || (id v24 = [[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts alloc] initByReadFrom:v4]) == 0)
    {
LABEL_36:

      goto LABEL_37;
    }
    uint64_t v25 = v24;
    id v26 = v7;
    goto LABEL_31;
  }
LABEL_34:
  uint64_t v28 = [v6 copy];
  deviceSegmentsReported = v5->_deviceSegmentsReported;
  v5->_deviceSegmentsReported = (NSArray *)v28;

  uint64_t v30 = [v7 copy];
  deviceCohortsReported = v5->_deviceCohortsReported;
  v5->_deviceCohortsReported = (NSArray *)v30;

  int v32 = v4[*v10];
  if (v32) {
LABEL_37:
  }
    uint64_t v33 = 0;
  else {
LABEL_35:
  }
    uint64_t v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self eventMetadata];
  id v5 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceSegmentsReported];
  uint64_t v6 = [(BMSiriOnDeviceDigestSegmentsCohorts *)self deviceCohortsReported];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestSegmentsCohorts with eventMetadata: %@, deviceSegmentsReported: %@, deviceCohortsReported: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriOnDeviceDigestSegmentsCohorts)initWithEventMetadata:(id)a3 deviceSegmentsReported:(id)a4 deviceCohortsReported:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohorts;
  char v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_eventMetadata, a3);
    objc_storeStrong((id *)&v12->_deviceSegmentsReported, a4);
    objc_storeStrong((id *)&v12->_deviceCohortsReported, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventMetadata" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"deviceSegmentsReported", 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceCohortsReported" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4C50;
}

id __46__BMSiriOnDeviceDigestSegmentsCohorts_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _deviceCohortsReportedJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __46__BMSiriOnDeviceDigestSegmentsCohorts_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _deviceSegmentsReportedJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __46__BMSiriOnDeviceDigestSegmentsCohorts_columns__block_invoke(uint64_t a1, void *a2)
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

    uint64_t v8 = [[BMSiriOnDeviceDigestSegmentsCohorts alloc] initByReadFrom:v7];
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