@interface BMSageTranscript
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligenceFlowIdentifiers)identifiers;
- (BMMonotonicTimestamp)monotonicTimestamp;
- (BMSageMetadata)_sageMetadata;
- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 _machAbsoluteTime:(id)a4 _sessionID:(id)a5 _bootSessionID:(id)a6 _clientSessionID:(id)a7 eventLabel:(id)a8 eventType:(id)a9 serializationFormat:(int)a10 eventPayload:(id)a11 _sageMetadata:(id)a12 monotonicTimestamp:(id)a13 identifiers:(id)a14;
- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 clientSessionID:(id)a4 eventLabel:(id)a5 eventType:(id)a6 serializationFormat:(int)a7 eventPayload:(id)a8;
- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 eventLabel:(id)a4 eventType:(id)a5 serializationFormat:(int)a6 eventPayload:(id)a7 monotonicTimestamp:(id)a8 identifiers:(id)a9;
- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 eventLabel:(id)a4 eventType:(id)a5 serializationFormat:(int)a6 eventPayload:(id)a7 sageMetadata:(id)a8 monotonicTimestamp:(id)a9;
- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 machAbsoluteTime:(id)a4 sessionID:(id)a5 bootSessionID:(id)a6 clientSessionID:(id)a7 eventLabel:(id)a8 eventType:(id)a9 serializationFormat:(int)a10 eventPayload:(id)a11;
- (BMSageTranscript)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasMachAbsoluteTime;
- (BOOL)has_machAbsoluteTime;
- (BOOL)isEqual:(id)a3;
- (NSData)eventPayload;
- (NSDate)absoluteTimestamp;
- (NSNumber)spanId;
- (NSString)clientRequestId;
- (NSString)clientSessionId;
- (NSString)description;
- (NSString)eventLabel;
- (NSString)eventType;
- (NSUUID)_bootSessionID;
- (NSUUID)_clientSessionID;
- (NSUUID)_sessionID;
- (NSUUID)sessionId;
- (double)_machAbsoluteTime;
- (double)machAbsoluteTime;
- (id)bootSessionID;
- (id)clientSessionID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)sageMetadata;
- (id)serialize;
- (id)sessionID;
- (int)serializationFormat;
- (unsigned)dataVersion;
- (void)setHas_machAbsoluteTime:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSageTranscript

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sageMetadata, 0);
  objc_storeStrong((id *)&self->__clientSessionID, 0);
  objc_storeStrong((id *)&self->__bootSessionID, 0);
  objc_storeStrong((id *)&self->__sessionID, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_monotonicTimestamp, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventLabel, 0);
  objc_storeStrong((id *)&self->_raw__clientSessionID, 0);
  objc_storeStrong((id *)&self->_raw__bootSessionID, 0);

  objc_storeStrong((id *)&self->_raw__sessionID, 0);
}

- (BMSageMetadata)_sageMetadata
{
  return self->__sageMetadata;
}

- (NSUUID)_clientSessionID
{
  return self->__clientSessionID;
}

- (NSUUID)_bootSessionID
{
  return self->__bootSessionID;
}

- (NSUUID)_sessionID
{
  return self->__sessionID;
}

- (void)setHas_machAbsoluteTime:(BOOL)a3
{
  self->_has_machAbsoluteTime = a3;
}

- (BOOL)has_machAbsoluteTime
{
  return self->_has_machAbsoluteTime;
}

- (double)_machAbsoluteTime
{
  return self->__machAbsoluteTime;
}

- (BMIntelligenceFlowIdentifiers)identifiers
{
  return self->_identifiers;
}

- (BMMonotonicTimestamp)monotonicTimestamp
{
  return self->_monotonicTimestamp;
}

- (NSData)eventPayload
{
  return self->_eventPayload;
}

- (int)serializationFormat
{
  return self->_serializationFormat;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)eventLabel
{
  return self->_eventLabel;
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
    v6 = [(BMSageTranscript *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSageTranscript *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_43;
      }
    }
    if ([(BMSageTranscript *)self has_machAbsoluteTime]
      || objc_msgSend(v5, "has_machAbsoluteTime"))
    {
      if (![(BMSageTranscript *)self has_machAbsoluteTime]) {
        goto LABEL_43;
      }
      if (!objc_msgSend(v5, "has_machAbsoluteTime")) {
        goto LABEL_43;
      }
      [(BMSageTranscript *)self _machAbsoluteTime];
      double v14 = v13;
      [v5 _machAbsoluteTime];
      if (v14 != v15) {
        goto LABEL_43;
      }
    }
    v16 = [(BMSageTranscript *)self _sessionID];
    uint64_t v17 = [v5 _sessionID];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMSageTranscript *)self _sessionID];
      v20 = [v5 _sessionID];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_43;
      }
    }
    v22 = [(BMSageTranscript *)self _bootSessionID];
    uint64_t v23 = [v5 _bootSessionID];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(BMSageTranscript *)self _bootSessionID];
      v26 = [v5 _bootSessionID];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_43;
      }
    }
    v28 = [(BMSageTranscript *)self _clientSessionID];
    uint64_t v29 = [v5 _clientSessionID];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      v30 = (void *)v29;
      v31 = [(BMSageTranscript *)self _clientSessionID];
      v32 = [v5 _clientSessionID];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_43;
      }
    }
    v34 = [(BMSageTranscript *)self eventLabel];
    uint64_t v35 = [v5 eventLabel];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMSageTranscript *)self eventLabel];
      v38 = [v5 eventLabel];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_43;
      }
    }
    v40 = [(BMSageTranscript *)self eventType];
    uint64_t v41 = [v5 eventType];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMSageTranscript *)self eventType];
      v44 = [v5 eventType];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_43;
      }
    }
    int v46 = [(BMSageTranscript *)self serializationFormat];
    if (v46 == [v5 serializationFormat])
    {
      v47 = [(BMSageTranscript *)self eventPayload];
      uint64_t v48 = [v5 eventPayload];
      if (v47 == (void *)v48)
      {
      }
      else
      {
        v49 = (void *)v48;
        v50 = [(BMSageTranscript *)self eventPayload];
        v51 = [v5 eventPayload];
        int v52 = [v50 isEqual:v51];

        if (!v52) {
          goto LABEL_43;
        }
      }
      v53 = [(BMSageTranscript *)self _sageMetadata];
      uint64_t v54 = [v5 _sageMetadata];
      if (v53 == (void *)v54)
      {
      }
      else
      {
        v55 = (void *)v54;
        v56 = [(BMSageTranscript *)self _sageMetadata];
        v57 = [v5 _sageMetadata];
        int v58 = [v56 isEqual:v57];

        if (!v58) {
          goto LABEL_43;
        }
      }
      v59 = [(BMSageTranscript *)self monotonicTimestamp];
      uint64_t v60 = [v5 monotonicTimestamp];
      if (v59 == (void *)v60)
      {
      }
      else
      {
        v61 = (void *)v60;
        v62 = [(BMSageTranscript *)self monotonicTimestamp];
        v63 = [v5 monotonicTimestamp];
        int v64 = [v62 isEqual:v63];

        if (!v64) {
          goto LABEL_43;
        }
      }
      v66 = [(BMSageTranscript *)self identifiers];
      v67 = [v5 identifiers];
      if (v66 == v67)
      {
        char v12 = 1;
      }
      else
      {
        v68 = [(BMSageTranscript *)self identifiers];
        v69 = [v5 identifiers];
        char v12 = [v68 isEqual:v69];
      }
      goto LABEL_44;
    }
LABEL_43:
    char v12 = 0;
LABEL_44:

    goto LABEL_45;
  }
  char v12 = 0;
LABEL_45:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  v3 = [(BMSageTranscript *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMSageTranscript *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  if (![(BMSageTranscript *)self has_machAbsoluteTime]
    || ([(BMSageTranscript *)self _machAbsoluteTime], fabs(v7) == INFINITY))
  {
    uint64_t v9 = 0;
  }
  else
  {
    [(BMSageTranscript *)self _machAbsoluteTime];
    v8 = NSNumber;
    [(BMSageTranscript *)self _machAbsoluteTime];
    uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  v10 = [(BMSageTranscript *)self _sessionID];
  uint64_t v11 = [v10 UUIDString];

  char v12 = [(BMSageTranscript *)self _bootSessionID];
  uint64_t v13 = [v12 UUIDString];

  double v14 = [(BMSageTranscript *)self _clientSessionID];
  uint64_t v15 = [v14 UUIDString];

  v16 = [(BMSageTranscript *)self eventLabel];
  v55 = [(BMSageTranscript *)self eventType];
  uint64_t v54 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSageTranscript serializationFormat](self, "serializationFormat"));
  uint64_t v17 = [(BMSageTranscript *)self eventPayload];
  v53 = [v17 base64EncodedStringWithOptions:0];

  v18 = [(BMSageTranscript *)self _sageMetadata];
  int v52 = [v18 jsonDictionary];

  v19 = [(BMSageTranscript *)self monotonicTimestamp];
  v51 = [v19 jsonDictionary];

  v20 = [(BMSageTranscript *)self identifiers];
  int v21 = [v20 jsonDictionary];

  v56[0] = @"absoluteTimestamp";
  uint64_t v22 = v6;
  if (!v6)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v45 = (void *)v22;
  uint64_t v72 = v22;
  v56[1] = @"_machAbsoluteTime";
  if (v9)
  {
    uint64_t v73 = v9;
    v57 = @"machAbsoluteTime";
    uint64_t v23 = v9;
  }
  else
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v73 = (uint64_t)v40;
    v57 = @"machAbsoluteTime";
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v23;
  uint64_t v74 = v23;
  int v58 = @"_sessionID";
  if (v11)
  {
    uint64_t v75 = v11;
    v59 = @"sessionID";
    uint64_t v24 = v11;
  }
  else
  {
    int v39 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v75 = (uint64_t)v39;
    v59 = @"sessionID";
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v24;
  uint64_t v76 = v24;
  uint64_t v60 = @"_bootSessionID";
  if (v13)
  {
    uint64_t v77 = v13;
    v61 = @"bootSessionID";
    uint64_t v25 = v13;
  }
  else
  {
    v38 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v77 = (uint64_t)v38;
    v61 = @"bootSessionID";
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v25;
  uint64_t v78 = v25;
  v62 = @"_clientSessionID";
  v49 = (void *)v9;
  v50 = (void *)v6;
  if (v15)
  {
    uint64_t v79 = v15;
    v63 = @"clientSessionID";
    uint64_t v26 = v15;
  }
  else
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v79 = (uint64_t)v37;
    v63 = @"clientSessionID";
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v48 = (void *)v11;
  uint64_t v41 = (void *)v26;
  uint64_t v80 = v26;
  int v64 = @"eventLabel";
  int v27 = v16;
  if (!v16)
  {
    int v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v13;
  v81 = v27;
  v65 = @"eventType";
  v28 = v55;
  if (!v55)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  int v46 = (void *)v15;
  v82 = v28;
  v66 = @"serializationFormat";
  uint64_t v29 = v54;
  if (!v54)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v83 = v29;
  v67 = @"eventPayload";
  v30 = v53;
  if (!v53)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v84 = v30;
  v68 = @"_sageMetadata";
  v31 = v52;
  if (v52)
  {
    v85 = v52;
    v69 = @"sageMetadata";
  }
  else
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
    v85 = v36;
    v69 = @"sageMetadata";
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = v31;
  v70 = @"monotonicTimestamp";
  v32 = v51;
  if (!v51)
  {
    v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v87 = v32;
  v71 = @"identifiers";
  int v33 = v21;
  if (!v21)
  {
    int v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v88 = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:v56 count:17];
  if (!v21) {

  }
  if (!v51) {
  if (!v52)
  }
  {
  }
  if (!v53) {

  }
  if (!v54) {
  if (!v55)
  }

  if (!v16) {
  if (!v46)
  }
  {
  }
  if (v47)
  {
    if (v48) {
      goto LABEL_55;
    }
  }
  else
  {

    if (v48)
    {
LABEL_55:
      if (v49) {
        goto LABEL_56;
      }
LABEL_62:

      if (v50) {
        goto LABEL_57;
      }
      goto LABEL_63;
    }
  }

  if (!v49) {
    goto LABEL_62;
  }
LABEL_56:
  if (v50) {
    goto LABEL_57;
  }
LABEL_63:

LABEL_57:

  return v34;
}

- (BMSageTranscript)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v227[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"_machAbsoluteTime"];
    if (!v9
      && ([v6 objectForKeyedSubscript:@"machAbsoluteTime"],
          (id v9 = (id)objc_claimAutoreleasedReturnValue()) == 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v194 = 0;
LABEL_10:
      v10 = [v6 objectForKeyedSubscript:@"_sessionID"];
      if (!v10
        && ([v6 objectForKeyedSubscript:@"sessionID"],
            (v10 = objc_claimAutoreleasedReturnValue()) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v193 = self;
        uint64_t v11 = 0;
        goto LABEL_14;
      }
      v183 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v158 = v9;
        id v15 = v8;
        v16 = (objc_class *)MEMORY[0x1E4F29128];
        id v17 = v10;
        uint64_t v18 = [[v16 alloc] initWithUUIDString:v17];
        v10 = v17;

        if (v18)
        {
          uint64_t v11 = (void *)v18;
          v193 = self;
          id v8 = v15;
          id v9 = v158;
LABEL_14:
          id v12 = [v6 objectForKeyedSubscript:@"_bootSessionID"];
          id v192 = v8;
          if (!v12
            && ([v6 objectForKeyedSubscript:@"bootSessionID"],
                (id v12 = (id)objc_claimAutoreleasedReturnValue()) == 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v182 = 0;
            goto LABEL_18;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = (objc_class *)MEMORY[0x1E4F29128];
            id v12 = v12;
            uint64_t v25 = [[v24 alloc] initWithUUIDString:v12];

            v182 = (id *)v25;
            if (v25)
            {
LABEL_18:
              uint64_t v13 = [v6 objectForKeyedSubscript:@"_clientSessionID"];
              if (!v13)
              {
                uint64_t v13 = [v6 objectForKeyedSubscript:@"clientSessionID"];
                if (!v13)
                {
                  id v170 = v12;
                  id v14 = 0;
                  goto LABEL_53;
                }
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v170 = v12;
                id v14 = v13;
LABEL_53:
                v191 = 0;
LABEL_54:
                uint64_t v67 = [v6 objectForKeyedSubscript:@"eventLabel"];
                v180 = (void *)v67;
                v190 = v14;
                if (!v67 || (v68 = (void *)v67, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v181 = 0;
                  goto LABEL_57;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v181 = v68;
LABEL_57:
                  uint64_t v69 = [v6 objectForKeyedSubscript:@"eventType"];
                  v168 = (void *)v69;
                  if (!v69 || (v70 = (void *)v69, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v169 = 0;
                    id v12 = v170;
                    goto LABEL_60;
                  }
                  objc_opt_class();
                  id v12 = v170;
                  if (objc_opt_isKindOfClass())
                  {
                    id v169 = v70;
LABEL_60:
                    uint64_t v71 = [v6 objectForKeyedSubscript:@"serializationFormat"];
                    v163 = (void *)v71;
                    if (!v71 || (uint64_t v72 = (void *)v71, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v164 = 0;
LABEL_63:
                      uint64_t v73 = [v6 objectForKeyedSubscript:@"eventPayload"];
                      v166 = a4;
                      v156 = (void *)v73;
                      if (v73 && (uint64_t v74 = (void *)v73, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!a4)
                          {
                            int v33 = 0;
                            int v39 = v194;
                            goto LABEL_140;
                          }
                          id v172 = v12;
                          v123 = v11;
                          id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
                          v125 = v7;
                          uint64_t v126 = *MEMORY[0x1E4F502C8];
                          uint64_t v204 = *MEMORY[0x1E4F28568];
                          id v161 = v9;
                          v127 = v10;
                          v128 = a4;
                          v157 = (BMSageMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"eventPayload"];
                          v205 = v157;
                          id v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v205 forKeys:&v204 count:1];
                          v129 = v124;
                          uint64_t v11 = v123;
                          id v12 = v172;
                          uint64_t v130 = v126;
                          double v7 = v125;
                          int v33 = 0;
                          a4 = 0;
                          id *v128 = (id)[v129 initWithDomain:v130 code:2 userInfo:v75];
                          v10 = v127;
                          id v9 = v161;
                          goto LABEL_113;
                        }
                        a4 = v74;
                      }
                      else
                      {
                        a4 = 0;
                      }
                      id v75 = [v6 objectForKeyedSubscript:@"_sageMetadata"];
                      if (!v75
                        && ([v6 objectForKeyedSubscript:@"sageMetadata"],
                            (id v75 = (id)objc_claimAutoreleasedReturnValue()) == 0)
                        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v154 = a4;
                        v157 = 0;
LABEL_70:
                        uint64_t v76 = [v6 objectForKeyedSubscript:@"monotonicTimestamp"];
                        v155 = (void *)v76;
                        if (!v76 || (uint64_t v77 = (void *)v76, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v160 = 0;
LABEL_73:
                          uint64_t v78 = [v6 objectForKeyedSubscript:@"identifiers"];
                          a4 = v154;
                          id v177 = v6;
                          v152 = (void *)v78;
                          if (!v78 || (uint64_t v79 = (void *)v78, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v80 = v9;
                            v81 = v10;
                            id v82 = v12;
                            v83 = v11;
                            v84 = v7;
                            v85 = 0;
LABEL_76:
                            LODWORD(v151) = [v164 intValue];
                            int v33 = [(BMSageTranscript *)v193 initWithAbsoluteTimestamp:v192 _machAbsoluteTime:v194 _sessionID:v83 _bootSessionID:v182 _clientSessionID:v191 eventLabel:v181 eventType:v169 serializationFormat:v151 eventPayload:v154 _sageMetadata:v157 monotonicTimestamp:v160 identifiers:v85];
                            v193 = v33;
LABEL_136:

                            double v7 = v84;
                            int v39 = v194;
                            uint64_t v11 = v83;
                            id v12 = v82;
                            v10 = v81;
                            id v9 = v80;
                            id v6 = v177;
                            goto LABEL_137;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v80 = v9;
                            v81 = v10;
                            id v82 = v12;
                            v83 = v11;
                            v84 = v7;
                            id v131 = v79;
                            id v195 = 0;
                            v85 = [[BMIntelligenceFlowIdentifiers alloc] initWithJSONDictionary:v131 error:&v195];
                            id v132 = v195;
                            if (!v132)
                            {

                              goto LABEL_76;
                            }
                            v133 = v132;
                            if (v166) {
                              id *v166 = v132;
                            }
                          }
                          else
                          {
                            if (!v166)
                            {
                              int v33 = 0;
                              int v39 = v194;
                              goto LABEL_137;
                            }
                            id v80 = v9;
                            v81 = v10;
                            id v82 = v12;
                            v83 = v11;
                            v84 = v7;
                            id v189 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v175 = *MEMORY[0x1E4F502C8];
                            uint64_t v198 = *MEMORY[0x1E4F28568];
                            v85 = (BMIntelligenceFlowIdentifiers *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"identifiers"];
                            v199 = v85;
                            v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];
                            id *v166 = (id)[v189 initWithDomain:v175 code:2 userInfo:v146];
                          }
                          int v33 = 0;
                          goto LABEL_136;
                        }
                        v188 = v7;
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v120 = v77;
                          id v196 = 0;
                          v160 = [[BMMonotonicTimestamp alloc] initWithJSONDictionary:v120 error:&v196];
                          id v121 = v196;
                          if (!v121)
                          {

                            goto LABEL_73;
                          }
                          v122 = v121;
                          v152 = v120;
                          int v39 = v194;
                          if (v166) {
                            id *v166 = v121;
                          }

                          int v33 = 0;
                        }
                        else
                        {
                          if (!v166)
                          {
                            int v33 = 0;
                            int v39 = v194;
                            a4 = v154;
                            goto LABEL_138;
                          }
                          id v173 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v153 = *MEMORY[0x1E4F502C8];
                          uint64_t v200 = *MEMORY[0x1E4F28568];
                          id v134 = v6;
                          id v135 = v9;
                          v136 = v10;
                          v137 = v11;
                          id v138 = [NSString alloc];
                          uint64_t v150 = objc_opt_class();
                          v139 = v138;
                          uint64_t v11 = v137;
                          v10 = v136;
                          id v9 = v135;
                          id v6 = v134;
                          v160 = (BMMonotonicTimestamp *)[v139 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v150, @"monotonicTimestamp"];
                          v201 = v160;
                          uint64_t v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
                          uint64_t v141 = v153;
                          v152 = (void *)v140;
                          int v33 = 0;
                          id *v166 = (id)objc_msgSend(v173, "initWithDomain:code:userInfo:", v141, 2);
                          double v7 = v188;
                          int v39 = v194;
                        }
                        a4 = v154;
LABEL_137:

LABEL_138:
                        goto LABEL_139;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v75 = v75;
                        id v197 = 0;
                        v157 = [[BMSageMetadata alloc] initWithJSONDictionary:v75 error:&v197];

                        id v86 = v197;
                        if (!v86)
                        {
                          v154 = a4;
                          goto LABEL_70;
                        }
                        v87 = v86;
                        if (v166) {
                          id *v166 = v86;
                        }
                      }
                      else
                      {
                        if (v166)
                        {
                          id v171 = objc_alloc(MEMORY[0x1E4F28C58]);
                          v187 = v7;
                          uint64_t v108 = *MEMORY[0x1E4F502C8];
                          uint64_t v202 = *MEMORY[0x1E4F28568];
                          id v179 = v6;
                          id v109 = v9;
                          v110 = v10;
                          v111 = v11;
                          v112 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"_sageMetadata"];
                          v203 = v112;
                          v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
                          uint64_t v114 = v108;
                          double v7 = v187;
                          id *v166 = (id)[v171 initWithDomain:v114 code:2 userInfo:v113];

                          uint64_t v11 = v111;
                          v10 = v110;
                          id v9 = v109;
                          id v6 = v179;
                        }
                        v157 = 0;
                      }
                      int v33 = 0;
LABEL_113:
                      int v39 = v194;
LABEL_139:

LABEL_140:
                      v144 = v156;
                      goto LABEL_141;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v164 = v72;
                      goto LABEL_63;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v164 = [NSNumber numberWithInt:BMSageTranscriptSerializationFormatFromString(v72)];
                      goto LABEL_63;
                    }
                    if (a4)
                    {
                      v142 = a4;
                      id v174 = objc_alloc(MEMORY[0x1E4F28C58]);
                      v162 = v11;
                      uint64_t v143 = *MEMORY[0x1E4F502C8];
                      uint64_t v206 = *MEMORY[0x1E4F28568];
                      a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"serializationFormat"];
                      v207 = a4;
                      v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v207 forKeys:&v206 count:1];
                      uint64_t v145 = v143;
                      uint64_t v11 = v162;
                      id v164 = 0;
                      int v33 = 0;
                      id *v142 = (id)[v174 initWithDomain:v145 code:2 userInfo:v144];
                      int v39 = v194;
LABEL_141:

LABEL_142:
                      a4 = v182;

                      goto LABEL_143;
                    }
                    id v164 = 0;
                    int v33 = 0;
LABEL_154:
                    int v39 = v194;
                    goto LABEL_142;
                  }
                  if (a4)
                  {
                    v97 = a4;
                    id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                    id v178 = v6;
                    id v99 = v9;
                    v100 = v10;
                    v101 = v11;
                    uint64_t v102 = *MEMORY[0x1E4F502C8];
                    uint64_t v208 = *MEMORY[0x1E4F28568];
                    v103 = v7;
                    id v104 = [NSString alloc];
                    uint64_t v149 = objc_opt_class();
                    v105 = v104;
                    double v7 = v103;
                    id v164 = (id)[v105 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v149, @"eventType"];
                    id v209 = v164;
                    uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v209 forKeys:&v208 count:1];
                    uint64_t v107 = v102;
                    uint64_t v11 = v101;
                    v10 = v100;
                    id v9 = v99;
                    id v6 = v178;
                    v163 = (void *)v106;
                    id v169 = 0;
                    int v33 = 0;
                    id *v97 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v107, 2);
                    goto LABEL_154;
                  }
                  id v169 = 0;
                  int v33 = 0;
                  int v39 = v194;
                  a4 = v182;
LABEL_143:

                  goto LABEL_144;
                }
                if (a4)
                {
                  v167 = a4;
                  id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v89 = *MEMORY[0x1E4F502C8];
                  uint64_t v210 = *MEMORY[0x1E4F28568];
                  v90 = v7;
                  id v91 = [NSString alloc];
                  uint64_t v148 = objc_opt_class();
                  v92 = v91;
                  double v7 = v90;
                  id v169 = (id)[v92 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v148, @"eventLabel"];
                  id v211 = v169;
                  v168 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
                  id v181 = 0;
                  int v33 = 0;
                  id *v167 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                  int v39 = v194;
                  a4 = v182;
                  id v12 = v170;
                  goto LABEL_143;
                }
                id v181 = 0;
                int v33 = 0;
                int v39 = v194;
                a4 = v182;
                goto LABEL_123;
              }
              v159 = v11;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v170 = v12;
                v185 = v10;
                uint64_t v48 = a4;
                v49 = (objc_class *)MEMORY[0x1E4F29128];
                id v14 = v13;
                uint64_t v50 = [[v49 alloc] initWithUUIDString:v14];

                v191 = (void *)v50;
                if (v50)
                {
                  a4 = v48;
                  v10 = v185;
                  goto LABEL_54;
                }
                v190 = v14;
                if (v48)
                {
                  id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v116 = v7;
                  uint64_t v117 = *MEMORY[0x1E4F502C8];
                  uint64_t v214 = *MEMORY[0x1E4F28568];
                  id v181 = (id)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"_clientSessionID"];
                  id v215 = v181;
                  uint64_t v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
                  uint64_t v119 = v117;
                  double v7 = v116;
                  uint64_t v11 = v159;
                  v180 = (void *)v118;
                  v191 = 0;
                  int v33 = 0;
                  *uint64_t v48 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v119, 2);
                  int v39 = v194;
                  a4 = v182;
                  v10 = v185;
LABEL_123:
                  id v12 = v170;
                  goto LABEL_144;
                }
                v191 = 0;
                int v33 = 0;
                int v39 = v194;
                a4 = v182;
                v10 = v185;
                id v12 = v170;
              }
              else
              {
                v190 = v13;
                if (a4)
                {
                  int v58 = a4;
                  id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v186 = v7;
                  uint64_t v60 = *MEMORY[0x1E4F502C8];
                  uint64_t v212 = *MEMORY[0x1E4F28568];
                  id v181 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"_clientSessionID"];
                  id v213 = v181;
                  uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v213 forKeys:&v212 count:1];
                  uint64_t v62 = v60;
                  double v7 = v186;
                  v180 = (void *)v61;
                  v191 = 0;
                  int v33 = 0;
                  *int v58 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v62, 2);
                  int v39 = v194;
                  a4 = v182;
LABEL_144:

                  goto LABEL_145;
                }
                v191 = 0;
                int v33 = 0;
                int v39 = v194;
                a4 = v182;
              }
LABEL_145:

              id v8 = v192;
              goto LABEL_146;
            }
            if (a4)
            {
              v184 = v10;
              uint64_t v26 = a4;
              id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
              v28 = v7;
              uint64_t v29 = *MEMORY[0x1E4F502C8];
              uint64_t v218 = *MEMORY[0x1E4F28568];
              v191 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"_bootSessionID"];
              v219 = v191;
              uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
              uint64_t v31 = v29;
              double v7 = v28;
              v190 = (void *)v30;
              id v32 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v31, 2);
              a4 = 0;
              int v33 = 0;
              id *v26 = v32;
              v10 = v184;
LABEL_42:
              int v39 = v194;
              goto LABEL_145;
            }
            int v33 = 0;
            id v8 = v192;
          }
          else
          {
            if (a4)
            {
              v165 = a4;
              id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
              v53 = v7;
              uint64_t v54 = *MEMORY[0x1E4F502C8];
              uint64_t v216 = *MEMORY[0x1E4F28568];
              v191 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"_bootSessionID"];
              v217 = v191;
              uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
              uint64_t v56 = v54;
              double v7 = v53;
              v190 = (void *)v55;
              id v57 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v56, 2);
              a4 = 0;
              int v33 = 0;
              id *v165 = v57;
              goto LABEL_42;
            }
            int v33 = 0;
          }
          goto LABEL_121;
        }
        if (a4)
        {
          v63 = a4;
          v193 = self;
          id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v65 = *MEMORY[0x1E4F502C8];
          uint64_t v222 = *MEMORY[0x1E4F28568];
          a4 = (id *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"_sessionID"];
          v223 = a4;
          id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v223 forKeys:&v222 count:1];
          id v66 = (id)[v64 initWithDomain:v65 code:2 userInfo:v12];
          uint64_t v11 = 0;
          int v33 = 0;
          id *v63 = v66;
          id v8 = v15;
          int v39 = v194;
          id v9 = v158;
LABEL_146:

          self = v193;
          goto LABEL_147;
        }
        uint64_t v11 = 0;
        int v33 = 0;
        id v8 = v15;
        int v39 = v194;
        id v9 = v158;
      }
      else
      {
        if (a4)
        {
          v193 = self;
          id v40 = v8;
          id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
          v42 = a4;
          uint64_t v43 = *MEMORY[0x1E4F502C8];
          uint64_t v220 = *MEMORY[0x1E4F28568];
          v44 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"_sessionID"];
          v221 = v44;
          uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v221 forKeys:&v220 count:1];
          int v46 = v41;
          id v8 = v40;
          uint64_t v47 = v43;
          a4 = v44;
          uint64_t v11 = 0;
          int v33 = 0;
          id *v42 = (id)[v46 initWithDomain:v47 code:2 userInfo:v45];
          id v12 = (id)v45;
          double v7 = v183;
LABEL_121:
          int v39 = v194;
          goto LABEL_146;
        }
        uint64_t v11 = 0;
        int v33 = 0;
        int v39 = v194;
      }
LABEL_147:

      goto LABEL_148;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v9;
      id v194 = v9;
      goto LABEL_10;
    }
    if (a4)
    {
      id v34 = v8;
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v176 = v6;
      v36 = a4;
      uint64_t v37 = *MEMORY[0x1E4F502C8];
      uint64_t v224 = *MEMORY[0x1E4F28568];
      uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"_machAbsoluteTime"];
      v225 = v11;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v225 forKeys:&v224 count:1];
      v38 = v35;
      id v8 = v34;
      int v39 = 0;
      int v33 = 0;
      id *v36 = (id)[v38 initWithDomain:v37 code:2 userInfo:v10];
      id v6 = v176;
      goto LABEL_147;
    }
    int v39 = 0;
    int v33 = 0;
LABEL_148:

    goto LABEL_149;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v20 = v7;
    id v21 = [v19 alloc];
    [v20 doubleValue];
    double v23 = v22;

    id v8 = (id)[v21 initWithTimeIntervalSinceReferenceDate:v23];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v51 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    id v8 = [v51 dateFromString:v7];

    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
    v94 = a4;
    uint64_t v95 = *MEMORY[0x1E4F502C8];
    uint64_t v226 = *MEMORY[0x1E4F28568];
    int v39 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
    v227[0] = v39;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v227 forKeys:&v226 count:1];
    id v96 = (id)[v93 initWithDomain:v95 code:2 userInfo:v9];
    id v8 = 0;
    int v33 = 0;
    id *v94 = v96;
    goto LABEL_148;
  }
  id v8 = 0;
  int v33 = 0;
LABEL_149:

  return v33;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSageTranscript *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_has_machAbsoluteTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_raw__sessionID) {
    PBDataWriterWriteDataField();
  }
  if (self->_raw__bootSessionID) {
    PBDataWriterWriteDataField();
  }
  if (self->_raw__clientSessionID) {
    PBDataWriterWriteDataField();
  }
  if (self->_eventLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventType) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_eventPayload) {
    PBDataWriterWriteDataField();
  }
  if (self->__sageMetadata)
  {
    PBDataWriterPlaceMark();
    [(BMSageMetadata *)self->__sageMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_monotonicTimestamp)
  {
    PBDataWriterPlaceMark();
    [(BMMonotonicTimestamp *)self->_monotonicTimestamp writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_identifiers)
  {
    PBDataWriterPlaceMark();
    [(BMIntelligenceFlowIdentifiers *)self->_identifiers writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSageTranscript;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5)
  {
LABEL_71:
    id v41 = v5;
    goto LABEL_72;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_69:
    if (v4[*v8]) {
      goto LABEL_70;
    }
    goto LABEL_71;
  }
  id v9 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v8]) {
      goto LABEL_69;
    }
    char v10 = 0;
    unsigned int v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = *v6;
      uint64_t v14 = *(void *)&v4[v13];
      unint64_t v15 = v14 + 1;
      if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
      *(void *)&v4[v13] = v15;
      v12 |= (unint64_t)(v16 & 0x7F) << v10;
      if ((v16 & 0x80) == 0) {
        goto LABEL_13;
      }
      v10 += 7;
      BOOL v17 = v11++ >= 9;
      if (v17)
      {
        unint64_t v12 = 0;
        int v18 = v4[*v8];
        goto LABEL_15;
      }
    }
    v4[*v8] = 1;
LABEL_13:
    int v18 = v4[*v8];
    if (v4[*v8]) {
      unint64_t v12 = 0;
    }
LABEL_15:
    if (v18 || (v12 & 7) == 4) {
      goto LABEL_69;
    }
    switch((v12 >> 3))
    {
      case 1u:
        v5->_hasRaw_absoluteTimestamp = 1;
        uint64_t v20 = *v6;
        unint64_t v21 = *(void *)&v4[v20];
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
        {
          double v22 = *(objc_class **)(*(void *)&v4[*v9] + v21);
          *(void *)&v4[v20] = v21 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v22 = 0;
        }
        uint64_t v40 = 24;
        goto LABEL_67;
      case 2u:
        double v23 = PBReaderReadData();
        if ([v23 length] != 16) {
          goto LABEL_73;
        }
        uint64_t v24 = 48;
        goto LABEL_42;
      case 3u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 72;
        goto LABEL_37;
      case 4u:
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = 80;
        goto LABEL_37;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        while (2)
        {
          uint64_t v30 = *v6;
          uint64_t v31 = *(void *)&v4[v30];
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              BOOL v17 = v28++ >= 9;
              if (v17)
              {
                LODWORD(v29) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v29) = 0;
        }
LABEL_60:
        if (v29 >= 3) {
          LODWORD(v29) = 0;
        }
        v5->_serializationFormat = v29;
        goto LABEL_68;
      case 6u:
        uint64_t v25 = PBReaderReadData();
        uint64_t v26 = 88;
LABEL_37:
        id v34 = *(Class *)((char *)&v5->super.super.isa + v26);
        *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;
        goto LABEL_43;
      case 7u:
        double v23 = PBReaderReadData();
        if ([v23 length] != 16) {
          goto LABEL_73;
        }
        uint64_t v24 = 32;
        goto LABEL_42;
      case 8u:
        double v23 = PBReaderReadData();
        if ([v23 length] == 16)
        {
          uint64_t v24 = 40;
LABEL_42:
          id v34 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;
LABEL_43:

LABEL_68:
          if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
            goto LABEL_69;
          }
          continue;
        }
LABEL_73:

LABEL_70:
        id v41 = 0;
LABEL_72:

        return v41;
      case 9u:
        v5->_has_machAbsoluteTime = 1;
        uint64_t v35 = *v6;
        unint64_t v36 = *(void *)&v4[v35];
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(void *)&v4[*v7])
        {
          double v22 = *(objc_class **)(*(void *)&v4[*v9] + v36);
          *(void *)&v4[v35] = v36 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v22 = 0;
        }
        uint64_t v40 = 112;
LABEL_67:
        *(Class *)((char *)&v5->super.super.isa + v40) = v22;
        goto LABEL_68;
      case 0xAu:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_70;
        }
        uint64_t v37 = [[BMSageMetadata alloc] initByReadFrom:v4];
        if (!v37) {
          goto LABEL_70;
        }
        uint64_t v38 = 144;
        goto LABEL_56;
      case 0xBu:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_70;
        }
        uint64_t v37 = [[BMMonotonicTimestamp alloc] initByReadFrom:v4];
        if (!v37) {
          goto LABEL_70;
        }
        uint64_t v38 = 96;
        goto LABEL_56;
      case 0xCu:
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_70;
        }
        uint64_t v37 = [[BMIntelligenceFlowIdentifiers alloc] initByReadFrom:v4];
        if (!v37) {
          goto LABEL_70;
        }
        uint64_t v38 = 104;
LABEL_56:
        int v39 = *(Class *)((char *)&v5->super.super.isa + v38);
        *(Class *)((char *)&v5->super.super.isa + v38) = v37;

        PBReaderRecallMark();
        goto LABEL_68;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_70;
        }
        goto LABEL_68;
    }
  }
}

- (NSString)description
{
  id v15 = [NSString alloc];
  int v18 = [(BMSageTranscript *)self absoluteTimestamp];
  v3 = NSNumber;
  [(BMSageTranscript *)self _machAbsoluteTime];
  BOOL v17 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = [(BMSageTranscript *)self _sessionID];
  id v5 = [(BMSageTranscript *)self _bootSessionID];
  id v6 = [(BMSageTranscript *)self _clientSessionID];
  double v7 = [(BMSageTranscript *)self eventLabel];
  id v8 = [(BMSageTranscript *)self eventType];
  id v9 = BMSageTranscriptSerializationFormatAsString([(BMSageTranscript *)self serializationFormat]);
  char v10 = [(BMSageTranscript *)self eventPayload];
  unsigned int v11 = [(BMSageTranscript *)self _sageMetadata];
  unint64_t v12 = [(BMSageTranscript *)self monotonicTimestamp];
  uint64_t v13 = [(BMSageTranscript *)self identifiers];
  id v16 = (id)[v15 initWithFormat:@"BMSageTranscript with absoluteTimestamp: %@, _machAbsoluteTime: %@, _sessionID: %@, _bootSessionID: %@, _clientSessionID: %@, eventLabel: %@, eventType: %@, serializationFormat: %@, eventPayload: %@, _sageMetadata: %@, monotonicTimestamp: %@, identifiers: %@", v18, v17, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13];

  return (NSString *)v16;
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 eventLabel:(id)a4 eventType:(id)a5 serializationFormat:(int)a6 eventPayload:(id)a7 monotonicTimestamp:(id)a8 identifiers:(id)a9
{
  id v14 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)BMSageTranscript;
  int v18 = [(BMEventBase *)&v24 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      [v14 timeIntervalSinceReferenceDate];
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      double v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_eventLabel, a4);
    objc_storeStrong((id *)&v18->_eventType, a5);
    v18->_serializationFormat = a6;
    objc_storeStrong((id *)&v18->_eventPayload, a7);
    objc_storeStrong((id *)&v18->_monotonicTimestamp, a8);
    objc_storeStrong((id *)&v18->_identifiers, a9);
  }

  return v18;
}

+ (id)protoFields
{
  v16[12] = *MEMORY[0x1E4F143B8];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v16[0] = v15;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"_machAbsoluteTime" number:9 type:0 subMessageClass:0];
  v16[1] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"_sessionID" number:7 type:14 subMessageClass:0];
  v16[2] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"_bootSessionID" number:8 type:14 subMessageClass:0];
  v16[3] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"_clientSessionID" number:2 type:14 subMessageClass:0];
  v16[4] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventLabel" number:3 type:13 subMessageClass:0];
  v16[5] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventType" number:4 type:13 subMessageClass:0];
  v16[6] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serializationFormat" number:5 type:4 subMessageClass:0];
  v16[7] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventPayload" number:6 type:14 subMessageClass:0];
  v16[8] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"_sageMetadata" number:10 type:14 subMessageClass:objc_opt_class()];
  v16[9] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"monotonicTimestamp" number:11 type:14 subMessageClass:objc_opt_class()];
  v16[10] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifiers" number:12 type:14 subMessageClass:objc_opt_class()];
  v16[11] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3630;
}

+ (id)columns
{
  v16[12] = *MEMORY[0x1E4F143B8];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"machAbsoluteTime" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionID" dataType:6 requestOnly:0 fieldNumber:7 protoDataType:14 convertedType:3];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bootSessionID" dataType:6 requestOnly:0 fieldNumber:8 protoDataType:14 convertedType:3];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientSessionID" dataType:6 requestOnly:0 fieldNumber:2 protoDataType:14 convertedType:3];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventLabel" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventType" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"serializationFormat" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventPayload" dataType:4 requestOnly:0 fieldNumber:6 protoDataType:14 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"sageMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_111];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"monotonicTimestamp_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_113_5711];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"identifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_115];
  v16[0] = v15;
  v16[1] = v2;
  v16[2] = v3;
  v16[3] = v4;
  v16[4] = v11;
  v16[5] = v5;
  v16[6] = v13;
  v16[7] = v12;
  v16[8] = v14;
  v16[9] = v6;
  v16[10] = v7;
  v16[11] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v10;
}

id __27__BMSageTranscript_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 identifiers];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __27__BMSageTranscript_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 monotonicTimestamp];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __27__BMSageTranscript_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 sageMetadata];
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSageTranscript alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[15] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (id)sageMetadata
{
  v3 = [BMSageMetadata alloc];
  id v4 = [(BMSageTranscript *)self identifiers];
  id v5 = [v4 sessionId];
  id v6 = [(BMSageTranscript *)self identifiers];
  double v7 = [v6 clientGroupIdentifier];
  id v8 = [(BMSageTranscript *)self identifiers];
  id v9 = [v8 clientRequestId];
  id v10 = [(BMSageTranscript *)self identifiers];
  unsigned int v11 = [v10 clientSessionId];
  unint64_t v12 = [(BMSageMetadata *)v3 initWithRawSessionId:v5 clientId:v7 clientRequestId:v9 clientSessionId:v11];

  return v12;
}

- (id)clientSessionID
{
  v3 = [(BMSageTranscript *)self identifiers];

  if (v3)
  {
    id v4 = [(BMSageTranscript *)self identifiers];
    id v5 = [v4 clientSessionId];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F29128]);
      double v7 = [(BMSageTranscript *)self identifiers];
      id v8 = [v7 clientSessionId];
      id v9 = (void *)[v6 initWithUUIDString:v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = [(BMSageTranscript *)self _clientSessionID];
  }

  return v9;
}

- (id)sessionID
{
  v3 = [(BMSageTranscript *)self identifiers];

  if (v3)
  {
    id v4 = [(BMSageTranscript *)self identifiers];
    id v5 = [v4 sessionId];
  }
  else
  {
    id v5 = [(BMSageTranscript *)self _sessionID];
  }

  return v5;
}

- (id)bootSessionID
{
  v3 = [(BMSageTranscript *)self monotonicTimestamp];

  if (v3)
  {
    id v4 = [(BMSageTranscript *)self monotonicTimestamp];
    id v5 = [v4 bootSessionUUID];
  }
  else
  {
    id v5 = [(BMSageTranscript *)self _bootSessionID];
  }

  return v5;
}

- (double)machAbsoluteTime
{
  v3 = [(BMSageTranscript *)self monotonicTimestamp];

  if (v3)
  {
    id v4 = [(BMSageTranscript *)self monotonicTimestamp];
    id v5 = [v4 value];
    double v6 = (double)(unint64_t)[v5 suspendingNanosecondsSinceBoot];

    return v6;
  }
  else
  {
    [(BMSageTranscript *)self _machAbsoluteTime];
  }
  return result;
}

- (BOOL)hasMachAbsoluteTime
{
  v3 = [(BMSageTranscript *)self monotonicTimestamp];

  if (v3)
  {
    id v4 = [(BMSageTranscript *)self monotonicTimestamp];
    id v5 = [v4 value];
    char v6 = [v5 hasSuspendingNanosecondsSinceBoot];

    return v6;
  }
  else
  {
    return [(BMSageTranscript *)self has_machAbsoluteTime];
  }
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 machAbsoluteTime:(id)a4 sessionID:(id)a5 bootSessionID:(id)a6 clientSessionID:(id)a7 eventLabel:(id)a8 eventType:(id)a9 serializationFormat:(int)a10 eventPayload:(id)a11
{
  id v16 = a4;
  id v17 = a6;
  id v18 = a11;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = a3;
  unint64_t v32 = v16;
  if (v16 && v17)
  {
    objc_super v24 = [[BMMonotonicTimestamp alloc] initWithBootSessionUUID:v17 machAbsoluteTime:v16 machContinuousTime:0];
  }
  else
  {
    objc_super v24 = +[BMMonotonicTimestamp nowFromSuspendingClock];
  }
  uint64_t v25 = v24;
  uint64_t v26 = v17;
  char v27 = [BMIntelligenceFlowIdentifiers alloc];
  unsigned int v28 = [v21 UUIDString];

  uint64_t v29 = [(BMIntelligenceFlowIdentifiers *)v27 initWithSessionId:v22 spanId:0 clientRequestId:0 clientSessionId:v28 clientApplicationId:0 clientGroupIdentifier:0];
  uint64_t v30 = [(BMSageTranscript *)self initWithAbsoluteTimestamp:v23 eventLabel:v20 eventType:v19 serializationFormat:a10 eventPayload:v18 monotonicTimestamp:v25 identifiers:v29];

  return v30;
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 _machAbsoluteTime:(id)a4 _sessionID:(id)a5 _bootSessionID:(id)a6 _clientSessionID:(id)a7 eventLabel:(id)a8 eventType:(id)a9 serializationFormat:(int)a10 eventPayload:(id)a11 _sageMetadata:(id)a12 monotonicTimestamp:(id)a13 identifiers:(id)a14
{
  id v44 = a3;
  id v43 = a4;
  id v45 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v41 = v26;
  if (v24 || v25 || v26)
  {
    id v39 = v20;
    id v40 = v19;
    uint64_t v30 = (BMIntelligenceFlowIdentifiers *)v26;
    uint64_t v31 = v30;
    if (v24)
    {
      char v27 = v44;
      if (!v30)
      {
        unint64_t v32 = [BMIntelligenceFlowIdentifiers alloc];
        char v33 = [v24 rawSessionId];
        id v34 = [v24 clientRequestId];
        uint64_t v35 = [v24 clientSessionId];
        unint64_t v36 = [v24 clientId];
        uint64_t v31 = [(BMIntelligenceFlowIdentifiers *)v32 initWithSessionId:v33 spanId:0 clientRequestId:v34 clientSessionId:v35 clientApplicationId:0 clientGroupIdentifier:v36];

        char v27 = v44;
      }
    }
    else
    {
      char v27 = v44;
    }
    uint64_t v29 = [(BMSageTranscript *)self initWithAbsoluteTimestamp:v27 eventLabel:v21 eventType:v22 serializationFormat:a10 eventPayload:v23 monotonicTimestamp:v25 identifiers:v31];

    unsigned int v28 = v43;
    id v20 = v39;
    id v19 = v40;
  }
  else
  {
    LODWORD(v38) = a10;
    unsigned int v28 = v43;
    char v27 = v44;
    uint64_t v29 = [(BMSageTranscript *)self initWithAbsoluteTimestamp:v44 machAbsoluteTime:v43 sessionID:v45 bootSessionID:v19 clientSessionID:v20 eventLabel:v21 eventType:v22 serializationFormat:v38 eventPayload:v23];
  }

  return v29;
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 eventLabel:(id)a4 eventType:(id)a5 serializationFormat:(int)a6 eventPayload:(id)a7 sageMetadata:(id)a8 monotonicTimestamp:(id)a9
{
  id v27 = a9;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [BMIntelligenceFlowIdentifiers alloc];
  id v20 = [v14 rawSessionId];
  id v21 = [v14 clientRequestId];
  id v22 = [v14 clientSessionId];
  id v23 = [v14 clientId];

  id v24 = [(BMIntelligenceFlowIdentifiers *)v19 initWithSessionId:v20 spanId:0 clientRequestId:v21 clientSessionId:v22 clientApplicationId:0 clientGroupIdentifier:v23];
  id v25 = [(BMSageTranscript *)self initWithAbsoluteTimestamp:v18 eventLabel:v17 eventType:v16 serializationFormat:a6 eventPayload:v15 monotonicTimestamp:v27 identifiers:v24];

  return v25;
}

- (BMSageTranscript)initWithAbsoluteTimestamp:(id)a3 clientSessionID:(id)a4 eventLabel:(id)a5 eventType:(id)a6 serializationFormat:(int)a7 eventPayload:(id)a8
{
  LODWORD(v9) = a7;
  return [(BMSageTranscript *)self initWithAbsoluteTimestamp:a3 machAbsoluteTime:0 sessionID:0 bootSessionID:0 clientSessionID:a4 eventLabel:a5 eventType:a6 serializationFormat:v9 eventPayload:a8];
}

- (NSString)clientRequestId
{
  v2 = [(BMSageTranscript *)self identifiers];
  v3 = [v2 clientRequestId];

  return (NSString *)v3;
}

- (NSString)clientSessionId
{
  v2 = [(BMSageTranscript *)self identifiers];
  v3 = [v2 clientSessionId];

  return (NSString *)v3;
}

- (NSNumber)spanId
{
  v3 = [(BMSageTranscript *)self identifiers];
  int v4 = [v3 hasSpanId];

  if (v4)
  {
    id v5 = NSNumber;
    char v6 = [(BMSageTranscript *)self identifiers];
    double v7 = objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v6, "spanId"));
  }
  else
  {
    double v7 = 0;
  }

  return (NSNumber *)v7;
}

- (NSUUID)sessionId
{
  v2 = [(BMSageTranscript *)self identifiers];
  v3 = [v2 sessionId];

  return (NSUUID *)v3;
}

@end