@interface BMIntelligenceFlowIdentifiers
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligenceFlowIdentifiers)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligenceFlowIdentifiers)initWithSessionId:(id)a3 spanId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6 clientApplicationId:(id)a7 clientGroupIdentifier:(id)a8;
- (BMIntelligenceFlowIdentifiers)initWithSessionId:(id)a3 spanId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6 clientApplicationId:(id)a7 clientGroupIdentifier:(id)a8 requestEventId:(id)a9;
- (BOOL)hasSpanId;
- (BOOL)isEqual:(id)a3;
- (NSString)clientApplicationId;
- (NSString)clientGroupIdentifier;
- (NSString)clientRequestId;
- (NSString)clientSessionId;
- (NSString)description;
- (NSUUID)requestEventId;
- (NSUUID)sessionId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)spanId;
- (unsigned)dataVersion;
- (void)setHasSpanId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligenceFlowIdentifiers

- (BMIntelligenceFlowIdentifiers)initWithSessionId:(id)a3 spanId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6 clientApplicationId:(id)a7 clientGroupIdentifier:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[BMIntelligenceFlowIdentifiers alloc] initWithSessionId:v19 spanId:v18 clientRequestId:v17 clientSessionId:v16 clientApplicationId:v15 clientGroupIdentifier:v14 requestEventId:0];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_clientApplicationId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_raw_requestEventId, 0);

  objc_storeStrong((id *)&self->_raw_sessionId, 0);
}

- (NSString)clientGroupIdentifier
{
  return self->_clientGroupIdentifier;
}

- (NSString)clientApplicationId
{
  return self->_clientApplicationId;
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setHasSpanId:(BOOL)a3
{
  self->_hasSpanId = a3;
}

- (BOOL)hasSpanId
{
  return self->_hasSpanId;
}

- (unint64_t)spanId
{
  return self->_spanId;
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
    v6 = [(BMIntelligenceFlowIdentifiers *)self sessionId];
    uint64_t v7 = [v5 sessionId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligenceFlowIdentifiers *)self sessionId];
      v10 = [v5 sessionId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_26;
      }
    }
    if (-[BMIntelligenceFlowIdentifiers hasSpanId](self, "hasSpanId") || [v5 hasSpanId])
    {
      if (![(BMIntelligenceFlowIdentifiers *)self hasSpanId]) {
        goto LABEL_26;
      }
      if (![v5 hasSpanId]) {
        goto LABEL_26;
      }
      unint64_t v13 = [(BMIntelligenceFlowIdentifiers *)self spanId];
      if (v13 != [v5 spanId]) {
        goto LABEL_26;
      }
    }
    id v14 = [(BMIntelligenceFlowIdentifiers *)self clientRequestId];
    uint64_t v15 = [v5 clientRequestId];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      id v16 = (void *)v15;
      id v17 = [(BMIntelligenceFlowIdentifiers *)self clientRequestId];
      id v18 = [v5 clientRequestId];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_26;
      }
    }
    v20 = [(BMIntelligenceFlowIdentifiers *)self clientSessionId];
    uint64_t v21 = [v5 clientSessionId];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMIntelligenceFlowIdentifiers *)self clientSessionId];
      v24 = [v5 clientSessionId];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_26;
      }
    }
    v26 = [(BMIntelligenceFlowIdentifiers *)self clientApplicationId];
    uint64_t v27 = [v5 clientApplicationId];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMIntelligenceFlowIdentifiers *)self clientApplicationId];
      v30 = [v5 clientApplicationId];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_26;
      }
    }
    v32 = [(BMIntelligenceFlowIdentifiers *)self clientGroupIdentifier];
    uint64_t v33 = [v5 clientGroupIdentifier];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMIntelligenceFlowIdentifiers *)self clientGroupIdentifier];
      v36 = [v5 clientGroupIdentifier];
      int v37 = [v35 isEqual:v36];

      if (!v37)
      {
LABEL_26:
        char v12 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    v39 = [(BMIntelligenceFlowIdentifiers *)self requestEventId];
    v40 = [v5 requestEventId];
    if (v39 == v40)
    {
      char v12 = 1;
    }
    else
    {
      v41 = [(BMIntelligenceFlowIdentifiers *)self requestEventId];
      v42 = [v5 requestEventId];
      char v12 = [v41 isEqual:v42];
    }
    goto LABEL_27;
  }
  char v12 = 0;
LABEL_28:

  return v12;
}

- (NSUUID)requestEventId
{
  raw_requestEventId = self->_raw_requestEventId;
  if (raw_requestEventId)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_requestEventId toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (NSUUID)sessionId
{
  raw_sessionId = self->_raw_sessionId;
  if (raw_sessionId)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_sessionId toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v27[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligenceFlowIdentifiers *)self sessionId];
  uint64_t v4 = [v3 UUIDString];

  if ([(BMIntelligenceFlowIdentifiers *)self hasSpanId])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMIntelligenceFlowIdentifiers spanId](self, "spanId"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = [(BMIntelligenceFlowIdentifiers *)self clientRequestId];
  uint64_t v7 = [(BMIntelligenceFlowIdentifiers *)self clientSessionId];
  v8 = [(BMIntelligenceFlowIdentifiers *)self clientApplicationId];
  v9 = [(BMIntelligenceFlowIdentifiers *)self clientGroupIdentifier];
  v10 = [(BMIntelligenceFlowIdentifiers *)self requestEventId];
  int v11 = [v10 UUIDString];

  v26[0] = @"sessionId";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v12;
  v27[0] = v12;
  v26[1] = @"spanId";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v13;
  v27[1] = v13;
  v26[2] = @"clientRequestId";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v4;
  uint64_t v21 = (void *)v14;
  v27[2] = v14;
  v26[3] = @"clientSessionId";
  uint64_t v15 = v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v5;
  v27[3] = v15;
  v26[4] = @"clientApplicationId";
  id v16 = v8;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[4] = v16;
  v26[5] = @"clientGroupIdentifier";
  id v17 = v9;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v17;
  v26[6] = @"requestEventId";
  id v18 = v11;
  if (!v11)
  {
    id v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[6] = v18;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:7];
  if (v11)
  {
    if (v9) {
      goto LABEL_20;
    }
LABEL_30:

    if (v8) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }

  if (!v9) {
    goto LABEL_30;
  }
LABEL_20:
  if (v8) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v7) {

  }
  if (v6)
  {
    if (v24) {
      goto LABEL_25;
    }
LABEL_33:

    if (v25) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }

  if (!v24) {
    goto LABEL_33;
  }
LABEL_25:
  if (v25) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:

  return v19;
}

- (BMIntelligenceFlowIdentifiers)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"sessionId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"spanId"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v21 = 0;
          id v10 = 0;
          goto LABEL_32;
        }
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        v68 = a4;
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"spanId"];
        v91 = a4;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        id v33 = (id)[v31 initWithDomain:v32 code:2 userInfo:v23];
        uint64_t v21 = 0;
        id v10 = 0;
        id *v68 = v33;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"clientRequestId"];
    v76 = (void *)v11;
    v77 = self;
    if (v11 && (uint64_t v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v21 = 0;
          v23 = v76;
          goto LABEL_31;
        }
        v36 = a4;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v38 = v10;
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v88 = *MEMORY[0x1E4F28568];
        v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientRequestId"];
        v89 = v22;
        uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        v41 = v37;
        uint64_t v13 = (void *)v40;
        uint64_t v42 = v39;
        id v10 = v38;
        uint64_t v21 = 0;
        a4 = 0;
        id *v36 = (id)[v41 initWithDomain:v42 code:2 userInfo:v40];
        goto LABEL_30;
      }
      v75 = v12;
    }
    else
    {
      v75 = 0;
    }
    uint64_t v13 = [v6 objectForKeyedSubscript:@"clientSessionId"];
    id v74 = v10;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          uint64_t v21 = 0;
          goto LABEL_29;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        v69 = a4;
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        id v72 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientSessionId"];
        id v87 = v72;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        uint64_t v21 = 0;
        v22 = 0;
        id *v69 = (id)[v43 initWithDomain:v44 code:2 userInfo:v14];
LABEL_28:

        id v10 = v74;
LABEL_29:
        a4 = v75;
LABEL_30:

        v23 = v76;
        self = v77;
        goto LABEL_31;
      }
      id v71 = v13;
    }
    else
    {
      id v71 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"clientApplicationId"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v72 = 0;
          uint64_t v21 = 0;
          goto LABEL_27;
        }
        id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientApplicationId"];
        id v85 = v16;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        uint64_t v15 = v46 = a4;
        id v47 = (id)[v73 initWithDomain:v45 code:2 userInfo:v15];
        uint64_t v21 = 0;
        id v72 = 0;
        id *v46 = v47;
LABEL_26:

LABEL_27:
        v22 = v71;
        goto LABEL_28;
      }
      v67 = a4;
      id v72 = v14;
    }
    else
    {
      v67 = a4;
      id v72 = 0;
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:@"clientGroupIdentifier"];
    v70 = v13;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v67)
        {
          id v16 = 0;
          uint64_t v21 = 0;
          goto LABEL_25;
        }
        id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v48 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientGroupIdentifier"];
        v83 = v17;
        v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        id *v67 = (id)[v64 initWithDomain:v48 code:2 userInfo:v49];

        uint64_t v21 = 0;
        id v16 = 0;
LABEL_24:

LABEL_25:
        uint64_t v13 = v70;
        goto LABEL_26;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }
    id v17 = [v6 objectForKeyedSubscript:@"requestEventId"];
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v67)
        {
          id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v62 = *MEMORY[0x1E4F502C8];
          uint64_t v78 = *MEMORY[0x1E4F28568];
          v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requestEventId"];
          v79 = v60;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          id *v67 = (id)[v65 initWithDomain:v62 code:2 userInfo:v57];
        }
        uint64_t v21 = 0;
        goto LABEL_24;
      }
      id v18 = v9;
      int v19 = v7;
      id v34 = v17;
      uint64_t v35 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v34];
      if (!v35)
      {
        if (v67)
        {
          id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v80 = *MEMORY[0x1E4F28568];
          v58 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"requestEventId"];
          v81 = v58;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          v59 = id v66 = v34;
          id *v67 = (id)[v63 initWithDomain:v61 code:2 userInfo:v59];

          id v34 = v66;
        }

        id v17 = v34;
        uint64_t v21 = 0;
        goto LABEL_23;
      }
      v20 = (void *)v35;
    }
    else
    {
      id v18 = v9;
      int v19 = v7;
      v20 = 0;
    }
    uint64_t v21 = [(BMIntelligenceFlowIdentifiers *)v77 initWithSessionId:v8 spanId:v74 clientRequestId:v75 clientSessionId:v71 clientApplicationId:v72 clientGroupIdentifier:v16 requestEventId:v20];

    v77 = v21;
LABEL_23:
    uint64_t v7 = v19;
    v9 = v18;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      uint64_t v21 = 0;
      goto LABEL_35;
    }
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v28 = *MEMORY[0x1E4F502C8];
    uint64_t v92 = *MEMORY[0x1E4F28568];
    uint64_t v29 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sessionId"];
    uint64_t v93 = v29;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    uint64_t v30 = v28;
    id v8 = (id)v29;
    uint64_t v21 = 0;
    *a4 = (id)[v27 initWithDomain:v30 code:2 userInfo:v10];
    goto LABEL_33;
  }
  id v8 = v7;
  uint64_t v25 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  if (v25)
  {
    v26 = (void *)v25;

    id v8 = v26;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v21 = 0;
    goto LABEL_34;
  }
  id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
  v51 = a4;
  v52 = v7;
  id v53 = v8;
  uint64_t v54 = *MEMORY[0x1E4F502C8];
  uint64_t v94 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"sessionId"];
  v95[0] = v10;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
  uint64_t v56 = v54;
  id v8 = v53;
  uint64_t v7 = v52;
  id *v51 = (id)[v50 initWithDomain:v56 code:2 userInfo:v55];

  uint64_t v21 = 0;
LABEL_33:

LABEL_34:
LABEL_35:

  return v21;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligenceFlowIdentifiers *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_raw_sessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_hasSpanId)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_clientRequestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientSessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientApplicationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientGroupIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_raw_requestEventId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMIntelligenceFlowIdentifiers;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5)
  {
LABEL_48:
    uint64_t v30 = v5;
    goto LABEL_49;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_46:
    if (v4[*v8]) {
      goto LABEL_47;
    }
    goto LABEL_48;
  }
  v9 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v8]) {
      goto LABEL_46;
    }
    char v10 = 0;
    unsigned int v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = *v6;
      unint64_t v14 = *(void *)&v4[v13];
      if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
      *(void *)&v4[v13] = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0) {
        goto LABEL_13;
      }
      v10 += 7;
      BOOL v16 = v11++ >= 9;
      if (v16)
      {
        unint64_t v12 = 0;
        int v17 = v4[*v8];
        goto LABEL_15;
      }
    }
    v4[*v8] = 1;
LABEL_13:
    int v17 = v4[*v8];
    if (v4[*v8]) {
      unint64_t v12 = 0;
    }
LABEL_15:
    if (v17 || (v12 & 7) == 4) {
      goto LABEL_46;
    }
    switch((v12 >> 3))
    {
      case 1u:
        int v19 = PBReaderReadData();
        if ([v19 length] != 16) {
          goto LABEL_50;
        }
        uint64_t v20 = 16;
        goto LABEL_38;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        unint64_t v23 = 0;
        v5->_hasSpanId = 1;
        while (2)
        {
          uint64_t v24 = *v6;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 == -1 || v25 >= *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
            *(void *)&v4[v24] = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v16 = v22++ >= 9;
              if (v16)
              {
                unint64_t v23 = 0;
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          unint64_t v23 = 0;
        }
LABEL_45:
        v5->_spanId = v23;
        goto LABEL_40;
      case 3u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 48;
        goto LABEL_35;
      case 4u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 56;
        goto LABEL_35;
      case 5u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 64;
        goto LABEL_35;
      case 6u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 72;
LABEL_35:
        uint64_t v29 = *(Class *)((char *)&v5->super.super.isa + v28);
        *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;
        goto LABEL_39;
      case 7u:
        int v19 = PBReaderReadData();
        if ([v19 length] == 16)
        {
          uint64_t v20 = 24;
LABEL_38:
          uint64_t v29 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;
LABEL_39:

LABEL_40:
          if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
            goto LABEL_46;
          }
          continue;
        }
LABEL_50:

LABEL_47:
        uint64_t v30 = 0;
LABEL_49:

        return v30;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_47;
        }
        goto LABEL_40;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligenceFlowIdentifiers *)self sessionId];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMIntelligenceFlowIdentifiers spanId](self, "spanId"));
  id v6 = [(BMIntelligenceFlowIdentifiers *)self clientRequestId];
  uint64_t v7 = [(BMIntelligenceFlowIdentifiers *)self clientSessionId];
  id v8 = [(BMIntelligenceFlowIdentifiers *)self clientApplicationId];
  v9 = [(BMIntelligenceFlowIdentifiers *)self clientGroupIdentifier];
  char v10 = [(BMIntelligenceFlowIdentifiers *)self requestEventId];
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMIntelligenceFlowIdentifiers with sessionId: %@, spanId: %@, clientRequestId: %@, clientSessionId: %@, clientApplicationId: %@, clientGroupIdentifier: %@, requestEventId: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMIntelligenceFlowIdentifiers)initWithSessionId:(id)a3 spanId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6 clientApplicationId:(id)a7 clientGroupIdentifier:(id)a8 requestEventId:(id)a9
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)BMIntelligenceFlowIdentifiers;
  int v19 = [(BMEventBase *)&v29 init];
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27);
    if (v15)
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      [v15 getUUIDBytes:&v30];
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v30 length:16];
      raw_sessionId = v19->_raw_sessionId;
      v19->_raw_sessionId = (NSData *)v20;
    }
    else
    {
      id v15 = 0;
      raw_sessionId = v19->_raw_sessionId;
      v19->_raw_sessionId = 0;
    }

    uint64_t v22 = (uint64_t)v28;
    if (v28)
    {
      v19->_hasSpanId = 1;
      uint64_t v22 = [v28 unsignedLongLongValue];
    }
    else
    {
      v19->_hasSpanId = 0;
    }
    v19->_spanId = v22;
    objc_storeStrong((id *)&v19->_clientRequestId, a5);
    objc_storeStrong((id *)&v19->_clientSessionId, a6);
    objc_storeStrong((id *)&v19->_clientApplicationId, a7);
    objc_storeStrong((id *)&v19->_clientGroupIdentifier, a8);
    if (v18)
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      [v18 getUUIDBytes:&v30];
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v30 length:16];
      raw_requestEventId = v19->_raw_requestEventId;
      v19->_raw_requestEventId = (NSData *)v23;
    }
    else
    {
      raw_requestEventId = v19->_raw_requestEventId;
      v19->_raw_requestEventId = 0;
    }
  }
  return v19;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionId" number:1 type:14 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"spanId", 2, 5, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientRequestId" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientSessionId" number:4 type:13 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientApplicationId" number:5 type:13 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientGroupIdentifier" number:6 type:13 subMessageClass:0];
  v11[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestEventId" number:7 type:14 subMessageClass:0];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6180;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionId" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"spanId" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:5 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientRequestId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientSessionId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientApplicationId" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientGroupIdentifier" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestEventId" dataType:6 requestOnly:0 fieldNumber:7 protoDataType:14 convertedType:3];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
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

    id v8 = [[BMIntelligenceFlowIdentifiers alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end