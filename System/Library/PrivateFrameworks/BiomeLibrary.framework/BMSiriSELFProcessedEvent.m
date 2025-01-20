@interface BMSiriSELFProcessedEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriSELFProcessedEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriSELFProcessedEvent)initWithLogicalTimestamp:(id)a3 clusterRepresentativeId:(id)a4 componentId:(id)a5 anyEventType:(id)a6 innerType:(id)a7 messageUuid:(id)a8 eventData:(id)a9;
- (BMSiriSELFProcessedEventComponentIdentifier)clusterRepresentativeId;
- (BMSiriSELFProcessedEventComponentIdentifier)componentId;
- (BMSiriSELFProcessedEventLogicalTimestamp)logicalTimestamp;
- (BOOL)hasAnyEventType;
- (BOOL)hasInnerType;
- (BOOL)isEqual:(id)a3;
- (NSData)eventData;
- (NSString)description;
- (NSUUID)messageUuid;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)anyEventType;
- (int)innerType;
- (unsigned)dataVersion;
- (void)setHasAnyEventType:(BOOL)a3;
- (void)setHasInnerType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriSELFProcessedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_componentId, 0);
  objc_storeStrong((id *)&self->_clusterRepresentativeId, 0);
  objc_storeStrong((id *)&self->_logicalTimestamp, 0);

  objc_storeStrong((id *)&self->_raw_messageUuid, 0);
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setHasInnerType:(BOOL)a3
{
  self->_hasInnerType = a3;
}

- (BOOL)hasInnerType
{
  return self->_hasInnerType;
}

- (int)innerType
{
  return self->_innerType;
}

- (void)setHasAnyEventType:(BOOL)a3
{
  self->_hasAnyEventType = a3;
}

- (BOOL)hasAnyEventType
{
  return self->_hasAnyEventType;
}

- (int)anyEventType
{
  return self->_anyEventType;
}

- (BMSiriSELFProcessedEventComponentIdentifier)componentId
{
  return self->_componentId;
}

- (BMSiriSELFProcessedEventComponentIdentifier)clusterRepresentativeId
{
  return self->_clusterRepresentativeId;
}

- (BMSiriSELFProcessedEventLogicalTimestamp)logicalTimestamp
{
  return self->_logicalTimestamp;
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
    v6 = [(BMSiriSELFProcessedEvent *)self logicalTimestamp];
    uint64_t v7 = [v5 logicalTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriSELFProcessedEvent *)self logicalTimestamp];
      v10 = [v5 logicalTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_27;
      }
    }
    v13 = [(BMSiriSELFProcessedEvent *)self clusterRepresentativeId];
    uint64_t v14 = [v5 clusterRepresentativeId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriSELFProcessedEvent *)self clusterRepresentativeId];
      v17 = [v5 clusterRepresentativeId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_27;
      }
    }
    v19 = [(BMSiriSELFProcessedEvent *)self componentId];
    uint64_t v20 = [v5 componentId];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriSELFProcessedEvent *)self componentId];
      v23 = [v5 componentId];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_27;
      }
    }
    if ([(BMSiriSELFProcessedEvent *)self hasAnyEventType]
      || [v5 hasAnyEventType])
    {
      if (![(BMSiriSELFProcessedEvent *)self hasAnyEventType]) {
        goto LABEL_27;
      }
      if (![v5 hasAnyEventType]) {
        goto LABEL_27;
      }
      int v25 = [(BMSiriSELFProcessedEvent *)self anyEventType];
      if (v25 != [v5 anyEventType]) {
        goto LABEL_27;
      }
    }
    if ([(BMSiriSELFProcessedEvent *)self hasInnerType]
      || [v5 hasInnerType])
    {
      if (![(BMSiriSELFProcessedEvent *)self hasInnerType]) {
        goto LABEL_27;
      }
      if (![v5 hasInnerType]) {
        goto LABEL_27;
      }
      int v26 = [(BMSiriSELFProcessedEvent *)self innerType];
      if (v26 != [v5 innerType]) {
        goto LABEL_27;
      }
    }
    v27 = [(BMSiriSELFProcessedEvent *)self messageUuid];
    uint64_t v28 = [v5 messageUuid];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(BMSiriSELFProcessedEvent *)self messageUuid];
      v31 = [v5 messageUuid];
      int v32 = [v30 isEqual:v31];

      if (!v32)
      {
LABEL_27:
        char v12 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v34 = [(BMSiriSELFProcessedEvent *)self eventData];
    v35 = [v5 eventData];
    if (v34 == v35)
    {
      char v12 = 1;
    }
    else
    {
      v36 = [(BMSiriSELFProcessedEvent *)self eventData];
      v37 = [v5 eventData];
      char v12 = [v36 isEqual:v37];
    }
    goto LABEL_28;
  }
  char v12 = 0;
LABEL_29:

  return v12;
}

- (NSUUID)messageUuid
{
  raw_messageUuid = self->_raw_messageUuid;
  if (raw_messageUuid)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_messageUuid toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v30[7] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriSELFProcessedEvent *)self logicalTimestamp];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = [(BMSiriSELFProcessedEvent *)self clusterRepresentativeId];
  uint64_t v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMSiriSELFProcessedEvent *)self componentId];
  uint64_t v8 = [v7 jsonDictionary];

  if ([(BMSiriSELFProcessedEvent *)self hasAnyEventType])
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriSELFProcessedEvent anyEventType](self, "anyEventType"));
  }
  else
  {
    v9 = 0;
  }
  if ([(BMSiriSELFProcessedEvent *)self hasInnerType])
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriSELFProcessedEvent innerType](self, "innerType"));
  }
  else
  {
    v10 = 0;
  }
  int v11 = [(BMSiriSELFProcessedEvent *)self messageUuid];
  char v12 = [v11 UUIDString];

  v13 = [(BMSiriSELFProcessedEvent *)self eventData];
  uint64_t v14 = [v13 base64EncodedStringWithOptions:0];

  v29[0] = @"logicalTimestamp";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v15;
  v30[0] = v15;
  v29[1] = @"clusterRepresentativeId";
  uint64_t v16 = v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = (void *)v4;
  int v24 = (void *)v16;
  v30[1] = v16;
  v29[2] = @"componentId";
  v17 = (void *)v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v6;
  v30[2] = v17;
  v29[3] = @"anyEventType";
  int v18 = v9;
  if (!v9)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v8;
  v30[3] = v18;
  v29[4] = @"innerType";
  v19 = v10;
  if (!v10)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[4] = v19;
  v29[5] = @"messageUuid";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[5] = v20;
  v29[6] = @"eventData";
  v21 = v14;
  if (!v14)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[6] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
  if (v14)
  {
    if (v12) {
      goto LABEL_23;
    }
LABEL_34:

    if (v10) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }

  if (!v12) {
    goto LABEL_34;
  }
LABEL_23:
  if (v10) {
    goto LABEL_24;
  }
LABEL_35:

LABEL_24:
  if (!v9) {

  }
  if (!v26) {
  if (v27)
  }
  {
    if (v28) {
      goto LABEL_30;
    }
  }
  else
  {

    if (v28) {
      goto LABEL_30;
    }
  }

LABEL_30:

  return v22;
}

- (BMSiriSELFProcessedEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v112[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"logicalTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"clusterRepresentativeId"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      id v95 = 0;
      v10 = [[BMSiriSELFProcessedEventComponentIdentifier alloc] initWithJSONDictionary:v11 error:&v95];
      id v19 = v95;
      if (v19)
      {
        uint64_t v20 = v19;
        if (a4) {
          *a4 = v19;
        }

        a4 = 0;
        goto LABEL_59;
      }

LABEL_7:
      id v11 = [v6 objectForKeyedSubscript:@"componentId"];
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4) {
            goto LABEL_59;
          }
          v91 = self;
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          v89 = v10;
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v107 = *MEMORY[0x1E4F28568];
          v49 = v8;
          id v50 = [NSString alloc];
          uint64_t v79 = objc_opt_class();
          v51 = v50;
          uint64_t v8 = v49;
          v92 = (BMSiriSELFProcessedEventComponentIdentifier *)[v51 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v79, @"componentId"];
          v108 = v92;
          id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
          v52 = v47;
          uint64_t v53 = v48;
          v10 = v89;
          self = v91;
          id v54 = (id)[v52 initWithDomain:v53 code:2 userInfo:v21];
          v55 = a4;
          a4 = 0;
          id *v55 = v54;
          goto LABEL_58;
        }
        id v21 = v11;
        id v94 = 0;
        v92 = [[BMSiriSELFProcessedEventComponentIdentifier alloc] initWithJSONDictionary:v21 error:&v94];
        id v22 = v94;
        if (v22)
        {
          v23 = v22;
          if (a4) {
            *a4 = v22;
          }

          a4 = 0;
          goto LABEL_58;
        }
        id v82 = v9;
        char v12 = v7;
        id v13 = v11;
      }
      else
      {
        id v82 = v9;
        char v12 = v7;
        id v13 = v11;
        v92 = 0;
      }
      uint64_t v14 = [v6 objectForKeyedSubscript:@"anyEventType"];
      v84 = (void *)v14;
      v88 = v10;
      if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v21 = 0;
            id v11 = v13;
            uint64_t v7 = v12;
            id v9 = v82;
            goto LABEL_57;
          }
          v56 = a4;
          v57 = self;
          id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
          v59 = v8;
          uint64_t v60 = *MEMORY[0x1E4F502C8];
          uint64_t v105 = *MEMORY[0x1E4F28568];
          id v87 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"anyEventType"];
          id v106 = v87;
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
          v61 = v58;
          self = v57;
          uint64_t v62 = v60;
          uint64_t v8 = v59;
          a4 = 0;
          id v21 = 0;
          id *v56 = (id)[v61 initWithDomain:v62 code:2 userInfo:v16];
          id v11 = v13;
          uint64_t v7 = v12;
          id v9 = v82;
LABEL_56:

          v10 = v88;
LABEL_57:

LABEL_58:
          goto LABEL_59;
        }
        id v86 = v15;
      }
      else
      {
        id v86 = 0;
      }
      uint64_t v16 = [v6 objectForKeyedSubscript:@"innerType"];
      v90 = self;
      v85 = v8;
      if (v16)
      {
        objc_opt_class();
        id v11 = v13;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          uint64_t v7 = v12;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v9 = v82;
            if (!a4)
            {
              id v87 = 0;
              id v21 = v86;
              goto LABEL_56;
            }
            id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
            v64 = v16;
            v65 = a4;
            uint64_t v66 = *MEMORY[0x1E4F502C8];
            uint64_t v103 = *MEMORY[0x1E4F28568];
            v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"innerType"];
            v104 = v30;
            id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
            id v67 = (id)[v63 initWithDomain:v66 code:2 userInfo:v32];
            a4 = 0;
            id v87 = 0;
            id *v65 = v67;
            uint64_t v16 = v64;
            goto LABEL_53;
          }
          id v87 = v16;
LABEL_35:
          v30 = [v6 objectForKeyedSubscript:@"messageUuid"];
          v81 = v16;
          if (v30)
          {
            objc_opt_class();
            id v9 = v82;
            if (objc_opt_isKindOfClass())
            {
              v31 = a4;
              id v32 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v21 = v86;
                  goto LABEL_55;
                }
                v68 = a4;
                id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v70 = *MEMORY[0x1E4F502C8];
                uint64_t v99 = *MEMORY[0x1E4F28568];
                id v32 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"messageUuid"];
                id v100 = v32;
                v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
                id *v68 = (id)[v69 initWithDomain:v70 code:2 userInfo:v71];
                uint64_t v16 = v81;

                a4 = 0;
                goto LABEL_53;
              }
              v31 = a4;
              id v32 = v30;
              uint64_t v42 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v32];
              if (!v42)
              {
                if (a4)
                {
                  id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v75 = *MEMORY[0x1E4F502C8];
                  uint64_t v101 = *MEMORY[0x1E4F28568];
                  v76 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"messageUuid"];
                  v102 = v76;
                  v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
                  id *v31 = (id)[v74 initWithDomain:v75 code:2 userInfo:v77];
                }
                a4 = 0;
                v30 = v32;
                id v21 = v86;
                uint64_t v16 = v81;
                goto LABEL_54;
              }
              v43 = (void *)v42;

              id v32 = v43;
            }
          }
          else
          {
            v31 = a4;
            id v32 = 0;
            id v9 = v82;
          }
          v44 = [v6 objectForKeyedSubscript:@"eventData"];
          if (v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v31)
              {
                id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v80 = *MEMORY[0x1E4F502C8];
                uint64_t v97 = *MEMORY[0x1E4F28568];
                v72 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"eventData"];
                v98 = v72;
                v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
                id *v31 = (id)[v83 initWithDomain:v80 code:2 userInfo:v73];
              }
              a4 = 0;
              id v45 = 0;
              goto LABEL_52;
            }
            id v45 = v44;
          }
          else
          {
            id v45 = 0;
          }
          a4 = [(BMSiriSELFProcessedEvent *)v90 initWithLogicalTimestamp:v85 clusterRepresentativeId:v88 componentId:v92 anyEventType:v86 innerType:v87 messageUuid:v32 eventData:v45];
          v90 = (BMSiriSELFProcessedEvent *)a4;
LABEL_52:
          uint64_t v16 = v81;

LABEL_53:
          id v21 = v86;
LABEL_54:

          self = v90;
          uint64_t v8 = v85;
LABEL_55:

          goto LABEL_56;
        }
        id v87 = 0;
      }
      else
      {
        id v87 = 0;
        id v11 = v13;
      }
      uint64_t v7 = v12;
      goto LABEL_35;
    }
    if (a4)
    {
      v93 = a4;
      v33 = self;
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v109 = *MEMORY[0x1E4F28568];
      v36 = v8;
      id v37 = [NSString alloc];
      uint64_t v78 = objc_opt_class();
      v38 = v37;
      uint64_t v8 = v36;
      uint64_t v39 = [v38 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v78, @"clusterRepresentativeId"];
      uint64_t v110 = v39;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      v40 = v34;
      self = v33;
      uint64_t v41 = v35;
      v10 = (BMSiriSELFProcessedEventComponentIdentifier *)v39;
      a4 = 0;
      id *v93 = (id)[v40 initWithDomain:v41 code:2 userInfo:v11];
LABEL_59:
    }
LABEL_60:

    goto LABEL_61;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v96 = 0;
    uint64_t v8 = [[BMSiriSELFProcessedEventLogicalTimestamp alloc] initWithJSONDictionary:v9 error:&v96];
    id v17 = v96;
    if (v17)
    {
      int v18 = v17;
      if (a4) {
        *a4 = v17;
      }

      a4 = 0;
      goto LABEL_60;
    }

    goto LABEL_4;
  }
  if (a4)
  {
    int v24 = self;
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v26 = *MEMORY[0x1E4F502C8];
    uint64_t v111 = *MEMORY[0x1E4F28568];
    v112[0] = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"logicalTimestamp"];
    uint64_t v8 = (BMSiriSELFProcessedEventLogicalTimestamp *)v112[0];
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:&v111 count:1];
    v27 = v25;
    self = v24;
    id v28 = (id)[v27 initWithDomain:v26 code:2 userInfo:v9];
    v29 = a4;
    a4 = 0;
    id *v29 = v28;
    goto LABEL_60;
  }
LABEL_61:

  return (BMSiriSELFProcessedEvent *)a4;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriSELFProcessedEvent *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_logicalTimestamp)
  {
    PBDataWriterPlaceMark();
    [(BMSiriSELFProcessedEventLogicalTimestamp *)self->_logicalTimestamp writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_clusterRepresentativeId)
  {
    PBDataWriterPlaceMark();
    [(BMSiriSELFProcessedEventComponentIdentifier *)self->_clusterRepresentativeId writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_componentId)
  {
    PBDataWriterPlaceMark();
    [(BMSiriSELFProcessedEventComponentIdentifier *)self->_componentId writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasAnyEventType) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasInnerType) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_raw_messageUuid) {
    PBDataWriterWriteDataField();
  }
  if (self->_eventData) {
    PBDataWriterWriteDataField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMSiriSELFProcessedEvent;
  id v5 = [(BMEventBase *)&v46 init];
  if (!v5)
  {
LABEL_61:
    v44 = v5;
    goto LABEL_62;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_59:
    if (v4[*v8]) {
      goto LABEL_60;
    }
    goto LABEL_61;
  }
  id v9 = off_1E6027000;
  v10 = off_1E6027000;
  id v11 = &OBJC_IVAR___BMSiriMusicInferenceTrainingIndependentSignals__foregroundBundleRecencyS;
  char v12 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v8]) {
      goto LABEL_59;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v6;
      unint64_t v17 = *(void *)&v4[v16];
      if (v17 == -1 || v17 >= *(void *)&v4[*v7]) {
        break;
      }
      char v18 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
      *(void *)&v4[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0) {
        goto LABEL_13;
      }
      v13 += 7;
      BOOL v19 = v14++ >= 9;
      if (v19)
      {
        unint64_t v15 = 0;
        int v20 = v4[*v8];
        goto LABEL_15;
      }
    }
    v4[*v8] = 1;
LABEL_13:
    int v20 = v4[*v8];
    if (v4[*v8]) {
      unint64_t v15 = 0;
    }
LABEL_15:
    if (v20 || (v15 & 7) == 4) {
      goto LABEL_59;
    }
    switch((v15 >> 3))
    {
      case 1u:
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_60;
        }
        uint64_t v22 = [objc_alloc(v9[45]) initByReadFrom:v4];
        if (!v22) {
          goto LABEL_60;
        }
        uint64_t v23 = 40;
        goto LABEL_31;
      case 2u:
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_60;
        }
        uint64_t v22 = [objc_alloc(v10[44]) initByReadFrom:v4];
        if (!v22) {
          goto LABEL_60;
        }
        uint64_t v23 = 48;
        goto LABEL_31;
      case 3u:
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_60;
        }
        uint64_t v22 = [objc_alloc(v10[44]) initByReadFrom:v4];
        if (!v22) {
          goto LABEL_60;
        }
        uint64_t v23 = 56;
LABEL_31:
        int v24 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        PBReaderRecallMark();
        goto LABEL_58;
      case 4u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *((unsigned char *)&v5->super.super.isa + v11[237]) = 1;
        while (2)
        {
          uint64_t v28 = *v6;
          unint64_t v29 = *(void *)&v4[v28];
          if (v29 == -1 || v29 >= *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)&v4[*v12] + v29);
            *(void *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v19 = v26++ >= 9;
              if (v19)
              {
                LODWORD(v27) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v27) = 0;
        }
LABEL_52:
        uint64_t v43 = 32;
        goto LABEL_57;
      case 5u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v27 = 0;
        v5->_hasInnerType = 1;
        while (2)
        {
          uint64_t v33 = *v6;
          unint64_t v34 = *(void *)&v4[v33];
          if (v34 == -1 || v34 >= *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)&v4[*v12] + v34);
            *(void *)&v4[v33] = v34 + 1;
            v27 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              BOOL v19 = v32++ >= 9;
              if (v19)
              {
                LODWORD(v27) = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v27) = 0;
        }
LABEL_56:
        uint64_t v43 = 36;
LABEL_57:
        *(_DWORD *)((char *)&v5->super.super.isa + v43) = v27;
        goto LABEL_58;
      case 6u:
        v36 = v10;
        id v37 = v11;
        v38 = v9;
        PBReaderReadData();
        uint64_t v39 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v39 length] == 16)
        {
          raw_messageUuid = v5->_raw_messageUuid;
          v5->_raw_messageUuid = v39;

          id v9 = v38;
          id v11 = v37;
          v10 = v36;
LABEL_58:
          if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
            goto LABEL_59;
          }
          continue;
        }

LABEL_60:
        v44 = 0;
LABEL_62:

        return v44;
      case 7u:
        uint64_t v41 = PBReaderReadData();
        eventData = v5->_eventData;
        v5->_eventData = (NSData *)v41;

        goto LABEL_58;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_58;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriSELFProcessedEvent *)self logicalTimestamp];
  id v5 = [(BMSiriSELFProcessedEvent *)self clusterRepresentativeId];
  id v6 = [(BMSiriSELFProcessedEvent *)self componentId];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriSELFProcessedEvent anyEventType](self, "anyEventType"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriSELFProcessedEvent innerType](self, "innerType"));
  id v9 = [(BMSiriSELFProcessedEvent *)self messageUuid];
  v10 = [(BMSiriSELFProcessedEvent *)self eventData];
  id v11 = (void *)[v3 initWithFormat:@"BMSiriSELFProcessedEvent with logicalTimestamp: %@, clusterRepresentativeId: %@, componentId: %@, anyEventType: %@, innerType: %@, messageUuid: %@, eventData: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMSiriSELFProcessedEvent)initWithLogicalTimestamp:(id)a3 clusterRepresentativeId:(id)a4 componentId:(id)a5 anyEventType:(id)a6 innerType:(id)a7 messageUuid:(id)a8 eventData:(id)a9
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriSELFProcessedEvent;
  int v20 = [(BMEventBase *)&v29 init];
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27, v28);
    objc_storeStrong((id *)&v20->_logicalTimestamp, a3);
    objc_storeStrong((id *)&v20->_clusterRepresentativeId, a4);
    objc_storeStrong((id *)&v20->_componentId, a5);
    if (v16)
    {
      v20->_hasAnyEventType = 1;
      int v21 = [v16 intValue];
    }
    else
    {
      v20->_hasAnyEventType = 0;
      int v21 = -1;
    }
    v20->_anyEventType = v21;
    if (v17)
    {
      v20->_hasInnerType = 1;
      int v22 = [v17 intValue];
    }
    else
    {
      v20->_hasInnerType = 0;
      int v22 = -1;
    }
    v20->_innerType = v22;
    if (v18)
    {
      v30[0] = 0;
      v30[1] = 0;
      [v18 getUUIDBytes:v30];
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v30 length:16];
      raw_messageUuid = v20->_raw_messageUuid;
      v20->_raw_messageUuid = (NSData *)v23;
    }
    else
    {
      raw_messageUuid = v20->_raw_messageUuid;
      v20->_raw_messageUuid = 0;
    }

    objc_storeStrong((id *)&v20->_eventData, a9);
  }

  return v20;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"logicalTimestamp" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"clusterRepresentativeId", 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"componentId" number:3 type:14 subMessageClass:objc_opt_class()];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"anyEventType" number:4 type:2 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"innerType" number:5 type:2 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageUuid" number:6 type:14 subMessageClass:0];
  v11[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventData" number:7 type:14 subMessageClass:0];
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF43B0;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"logicalTimestamp_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_23830];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"clusterRepresentativeId_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_200];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"componentId_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_202];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"anyEventType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"innerType" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageUuid" dataType:6 requestOnly:0 fieldNumber:6 protoDataType:14 convertedType:3];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventData" dataType:4 requestOnly:0 fieldNumber:7 protoDataType:14 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

id __35__BMSiriSELFProcessedEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 componentId];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __35__BMSiriSELFProcessedEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 clusterRepresentativeId];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __35__BMSiriSELFProcessedEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 logicalTimestamp];
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

    uint64_t v8 = [[BMSiriSELFProcessedEvent alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end