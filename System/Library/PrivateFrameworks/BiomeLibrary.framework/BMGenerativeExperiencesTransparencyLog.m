@interface BMGenerativeExperiencesTransparencyLog
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMGenerativeExperiencesTransparencyLog)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMGenerativeExperiencesTransparencyLog)initWithTimestamp:(id)a3 identifier:(id)a4 prompt:(id)a5 response:(id)a6 model:(id)a7 modelVersion:(id)a8 useCase:(id)a9 errorCode:(id)a10 clientIdentifier:(id)a11 executionEnvironment:(int)a12;
- (BOOL)hasErrorCode;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)model;
- (NSString)modelVersion;
- (NSString)prompt;
- (NSString)response;
- (NSString)useCase;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)errorCode;
- (int)executionEnvironment;
- (unsigned)dataVersion;
- (void)setHasErrorCode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMGenerativeExperiencesTransparencyLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int)executionEnvironment
{
  return self->_executionEnvironment;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_hasErrorCode = a3;
}

- (BOOL)hasErrorCode
{
  return self->_hasErrorCode;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)response
{
  return self->_response;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMGenerativeExperiencesTransparencyLog *)self timestamp];
    uint64_t v7 = [v5 timestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMGenerativeExperiencesTransparencyLog *)self timestamp];
      v10 = [v5 timestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_38;
      }
    }
    v13 = [(BMGenerativeExperiencesTransparencyLog *)self identifier];
    uint64_t v14 = [v5 identifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMGenerativeExperiencesTransparencyLog *)self identifier];
      v17 = [v5 identifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_38;
      }
    }
    v19 = [(BMGenerativeExperiencesTransparencyLog *)self prompt];
    uint64_t v20 = [v5 prompt];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMGenerativeExperiencesTransparencyLog *)self prompt];
      v23 = [v5 prompt];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_38;
      }
    }
    v25 = [(BMGenerativeExperiencesTransparencyLog *)self response];
    uint64_t v26 = [v5 response];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMGenerativeExperiencesTransparencyLog *)self response];
      v29 = [v5 response];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_38;
      }
    }
    v31 = [(BMGenerativeExperiencesTransparencyLog *)self model];
    uint64_t v32 = [v5 model];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMGenerativeExperiencesTransparencyLog *)self model];
      v35 = [v5 model];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_38;
      }
    }
    v37 = [(BMGenerativeExperiencesTransparencyLog *)self modelVersion];
    uint64_t v38 = [v5 modelVersion];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMGenerativeExperiencesTransparencyLog *)self modelVersion];
      v41 = [v5 modelVersion];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_38;
      }
    }
    v43 = [(BMGenerativeExperiencesTransparencyLog *)self useCase];
    uint64_t v44 = [v5 useCase];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMGenerativeExperiencesTransparencyLog *)self useCase];
      v47 = [v5 useCase];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_38;
      }
    }
    if ([(BMGenerativeExperiencesTransparencyLog *)self hasErrorCode]
      || [v5 hasErrorCode])
    {
      if (![(BMGenerativeExperiencesTransparencyLog *)self hasErrorCode]) {
        goto LABEL_38;
      }
      if (![v5 hasErrorCode]) {
        goto LABEL_38;
      }
      int v49 = [(BMGenerativeExperiencesTransparencyLog *)self errorCode];
      if (v49 != [v5 errorCode]) {
        goto LABEL_38;
      }
    }
    v50 = [(BMGenerativeExperiencesTransparencyLog *)self clientIdentifier];
    uint64_t v51 = [v5 clientIdentifier];
    if (v50 == (void *)v51)
    {
    }
    else
    {
      v52 = (void *)v51;
      v53 = [(BMGenerativeExperiencesTransparencyLog *)self clientIdentifier];
      v54 = [v5 clientIdentifier];
      int v55 = [v53 isEqual:v54];

      if (!v55)
      {
LABEL_38:
        BOOL v12 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    int v57 = [(BMGenerativeExperiencesTransparencyLog *)self executionEnvironment];
    BOOL v12 = v57 == [v5 executionEnvironment];
    goto LABEL_39;
  }
  BOOL v12 = 0;
LABEL_40:

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
  v42[10] = *MEMORY[0x1E4F143B8];
  v3 = [(BMGenerativeExperiencesTransparencyLog *)self timestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMGenerativeExperiencesTransparencyLog *)self timestamp];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMGenerativeExperiencesTransparencyLog *)self identifier];
  uint64_t v8 = [(BMGenerativeExperiencesTransparencyLog *)self prompt];
  uint64_t v9 = [(BMGenerativeExperiencesTransparencyLog *)self response];
  uint64_t v10 = [(BMGenerativeExperiencesTransparencyLog *)self model];
  uint64_t v11 = [(BMGenerativeExperiencesTransparencyLog *)self modelVersion];
  v40 = [(BMGenerativeExperiencesTransparencyLog *)self useCase];
  uint64_t v38 = (void *)v11;
  if ([(BMGenerativeExperiencesTransparencyLog *)self hasErrorCode])
  {
    BOOL v12 = NSNumber;
    uint64_t v13 = [(BMGenerativeExperiencesTransparencyLog *)self errorCode];
    uint64_t v14 = v12;
    uint64_t v11 = (uint64_t)v38;
    v39 = [v14 numberWithInt:v13];
  }
  else
  {
    v39 = 0;
  }
  v15 = [(BMGenerativeExperiencesTransparencyLog *)self clientIdentifier];
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGenerativeExperiencesTransparencyLog executionEnvironment](self, "executionEnvironment"));
  v41[0] = @"timestamp";
  uint64_t v17 = v6;
  if (!v6)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v17;
  v42[0] = v17;
  v41[1] = @"identifier";
  uint64_t v18 = v7;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v18;
  v42[1] = v18;
  v41[2] = @"prompt";
  uint64_t v19 = v8;
  if (!v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v19;
  v42[2] = v19;
  v41[3] = @"response";
  uint64_t v20 = v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v6;
  int v30 = (void *)v20;
  v42[3] = v20;
  v41[4] = @"model";
  v21 = (void *)v10;
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v7;
  v42[4] = v21;
  v41[5] = @"modelVersion";
  v22 = (void *)v11;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v8;
  v42[5] = v22;
  v41[6] = @"useCase";
  v23 = v40;
  if (!v40)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v9;
  v42[6] = v23;
  v41[7] = @"errorCode";
  v25 = v39;
  if (!v39)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v10;
  v42[7] = v25;
  v41[8] = @"clientIdentifier";
  v27 = v15;
  if (!v15)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[8] = v27;
  v41[9] = @"executionEnvironment";
  v28 = v16;
  if (!v16)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[9] = v28;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:10];
  if (v16)
  {
    if (v15) {
      goto LABEL_29;
    }
  }
  else
  {

    if (v15) {
      goto LABEL_29;
    }
  }

LABEL_29:
  if (!v39) {

  }
  if (!v40) {
  if (!v38)
  }

  if (!v26) {
  if (v24)
  }
  {
    if (v35) {
      goto LABEL_39;
    }
  }
  else
  {

    if (v35)
    {
LABEL_39:
      if (v36) {
        goto LABEL_40;
      }
LABEL_48:

      if (v37) {
        goto LABEL_41;
      }
      goto LABEL_49;
    }
  }

  if (!v36) {
    goto LABEL_48;
  }
LABEL_40:
  if (v37) {
    goto LABEL_41;
  }
LABEL_49:

LABEL_41:

  return v34;
}

- (BMGenerativeExperiencesTransparencyLog)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v121[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"timestamp"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v6;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSince1970:v12];
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
      if (!a4)
      {
        uint64_t v7 = 0;
        v33 = 0;
        v46 = self;
        goto LABEL_94;
      }
      id v71 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v72 = *MEMORY[0x1E4F502C8];
      uint64_t v120 = *MEMORY[0x1E4F28568];
      uint64_t v73 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
      v121[0] = v73;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:&v120 count:1];
      uint64_t v74 = v72;
      id v16 = (id)v73;
      id v75 = (id)[v71 initWithDomain:v74 code:2 userInfo:v15];
      uint64_t v7 = 0;
      v33 = 0;
      *a4 = v75;
      goto LABEL_80;
    }
    id v13 = v6;
    goto LABEL_6;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v7 = [v14 dateFromString:v6];

LABEL_9:
  v15 = [v5 objectForKeyedSubscript:@"identifier"];
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
LABEL_12:
    uint64_t v17 = [v5 objectForKeyedSubscript:@"prompt"];
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v99 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v99 = v17;
LABEL_15:
      uint64_t v18 = [v5 objectForKeyedSubscript:@"response"];
      v98 = (void *)v18;
      v95 = a4;
      v96 = v17;
      if (!v18 || (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v100 = 0;
LABEL_18:
        uint64_t v20 = [v5 objectForKeyedSubscript:@"model"];
        v93 = v7;
        if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v95)
            {
              id v97 = 0;
              v33 = 0;
              v46 = self;
              int v30 = v99;
              goto LABEL_90;
            }
            id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
            v89 = v6;
            id v56 = v16;
            uint64_t v57 = *MEMORY[0x1E4F502C8];
            uint64_t v112 = *MEMORY[0x1E4F28568];
            id v94 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"model"];
            id v113 = v94;
            uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
            v59 = v55;
            uint64_t v7 = v93;
            uint64_t v60 = v57;
            id v16 = v56;
            v90 = (void *)v58;
            id v97 = 0;
            v33 = 0;
            id *v95 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2);
            uint64_t v6 = v89;
            v46 = self;
            int v30 = v99;
            goto LABEL_89;
          }
          v21 = v15;
          id v97 = v20;
        }
        else
        {
          v21 = v15;
          id v97 = 0;
        }
        uint64_t v22 = [v5 objectForKeyedSubscript:@"modelVersion"];
        id v92 = v16;
        v90 = (void *)v22;
        if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v95)
            {
              id v94 = 0;
              v33 = 0;
              v46 = self;
              int v30 = v99;
              v15 = v21;
              uint64_t v17 = v96;
              goto LABEL_89;
            }
            id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v63 = *MEMORY[0x1E4F502C8];
            uint64_t v110 = *MEMORY[0x1E4F28568];
            id v91 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"modelVersion"];
            id v111 = v91;
            v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
            id v94 = 0;
            v33 = 0;
            id *v95 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v63, 2);
            v46 = self;
            int v30 = v99;
            v15 = v21;
            uint64_t v17 = v96;
LABEL_88:

            id v16 = v92;
LABEL_89:

            goto LABEL_90;
          }
          id v94 = v23;
        }
        else
        {
          id v94 = 0;
        }
        uint64_t v24 = [v5 objectForKeyedSubscript:@"useCase"];
        v15 = v21;
        v84 = (void *)v24;
        if (v24)
        {
          v25 = (void *)v24;
          objc_opt_class();
          uint64_t v26 = v25;
          uint64_t v17 = v96;
          if (objc_opt_isKindOfClass())
          {
            id v91 = 0;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v95)
              {
                id v91 = 0;
                v33 = 0;
                v46 = self;
                int v30 = v99;
                goto LABEL_88;
              }
              id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v65 = *MEMORY[0x1E4F502C8];
              uint64_t v108 = *MEMORY[0x1E4F28568];
              id v85 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"useCase"];
              id v109 = v85;
              id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
              v66 = v64;
              uint64_t v7 = v93;
              id v91 = 0;
              v33 = 0;
              id *v95 = (id)[v66 initWithDomain:v65 code:2 userInfo:v34];
              goto LABEL_99;
            }
            id v91 = v26;
          }
        }
        else
        {
          id v91 = 0;
          uint64_t v17 = v96;
        }
        id v34 = [v5 objectForKeyedSubscript:@"errorCode"];
        v86 = v6;
        v83 = v20;
        if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v85 = 0;
          goto LABEL_45;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v85 = v34;
LABEL_45:
          v35 = [v5 objectForKeyedSubscript:@"clientIdentifier"];
          if (v35)
          {
            int v36 = v95;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v37 = v35;
                goto LABEL_53;
              }
              if (v95)
              {
                id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v69 = *MEMORY[0x1E4F502C8];
                uint64_t v104 = *MEMORY[0x1E4F28568];
                int v48 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientIdentifier"];
                v105 = v48;
                v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
                id v70 = (id)[v81 initWithDomain:v69 code:2 userInfo:v47];
                id v37 = 0;
                v33 = 0;
                id *v95 = v70;
                goto LABEL_85;
              }
              id v37 = 0;
              v33 = 0;
LABEL_104:
              uint64_t v6 = v86;
              goto LABEL_86;
            }
          }
          else
          {
            int v36 = v95;
          }
          id v37 = 0;
LABEL_53:
          v47 = [v5 objectForKeyedSubscript:@"executionEnvironment"];
          if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v61 = v47;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v36)
                {
                  id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v80 = *MEMORY[0x1E4F502C8];
                  uint64_t v102 = *MEMORY[0x1E4F28568];
                  v77 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"executionEnvironment"];
                  v103 = v77;
                  v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
                  *int v36 = (id)[v82 initWithDomain:v80 code:2 userInfo:v78];
                }
                int v48 = 0;
                v33 = 0;
                goto LABEL_85;
              }
              id v61 = [NSNumber numberWithInt:BMGenerativeExperiencesTransparencyLogExecutionEnvironmentFromString(v47)];
            }
            int v48 = v61;
          }
          else
          {
            int v48 = 0;
          }
          LODWORD(v79) = [v48 intValue];
          v33 = [(BMGenerativeExperiencesTransparencyLog *)self initWithTimestamp:v93 identifier:v92 prompt:v99 response:v100 model:v97 modelVersion:v94 useCase:v91 errorCode:v85 clientIdentifier:v37 executionEnvironment:v79];
          self = v33;
LABEL_85:
          uint64_t v6 = v86;

LABEL_86:
          v46 = self;
          uint64_t v7 = v93;
          int v30 = v99;
          uint64_t v20 = v83;
LABEL_87:

          goto LABEL_88;
        }
        if (v95)
        {
          id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v106 = *MEMORY[0x1E4F28568];
          id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"errorCode"];
          id v107 = v37;
          v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
          id v85 = 0;
          v33 = 0;
          id *v95 = (id)[v67 initWithDomain:v68 code:2 userInfo:v35];
          goto LABEL_104;
        }
        id v85 = 0;
        v33 = 0;
LABEL_99:
        v46 = self;
        int v30 = v99;
        goto LABEL_87;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v100 = v19;
        goto LABEL_18;
      }
      if (a4)
      {
        int v49 = v7;
        id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
        v88 = v6;
        id v51 = v16;
        uint64_t v52 = *MEMORY[0x1E4F502C8];
        uint64_t v114 = *MEMORY[0x1E4F28568];
        id v97 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"response"];
        id v115 = v97;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        v53 = v50;
        uint64_t v7 = v49;
        uint64_t v54 = v52;
        id v16 = v51;
        id v100 = 0;
        v33 = 0;
        id *v95 = (id)[v53 initWithDomain:v54 code:2 userInfo:v20];
        uint64_t v6 = v88;
        v46 = self;
        int v30 = v99;
LABEL_90:

        goto LABEL_91;
      }
      id v100 = 0;
      v33 = 0;
      v46 = self;
      int v30 = v99;
LABEL_91:

      goto LABEL_92;
    }
    if (a4)
    {
      uint64_t v38 = v7;
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      v87 = v6;
      v40 = a4;
      id v41 = v16;
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v116 = *MEMORY[0x1E4F28568];
      id v100 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"prompt"];
      id v117 = v100;
      uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      uint64_t v44 = v39;
      uint64_t v7 = v38;
      uint64_t v45 = v42;
      id v16 = v41;
      v98 = (void *)v43;
      int v30 = 0;
      v33 = 0;
      id *v40 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
      uint64_t v6 = v87;
      v46 = self;
      goto LABEL_91;
    }
    int v30 = 0;
    v33 = 0;
LABEL_74:
    v46 = self;
LABEL_92:

    goto LABEL_93;
  }
  if (a4)
  {
    v27 = v7;
    id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v29 = *MEMORY[0x1E4F502C8];
    uint64_t v118 = *MEMORY[0x1E4F28568];
    int v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
    v119 = v30;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
    v31 = v28;
    uint64_t v7 = v27;
    id v32 = (id)[v31 initWithDomain:v29 code:2 userInfo:v17];
    id v16 = 0;
    v33 = 0;
    *a4 = v32;
    goto LABEL_74;
  }
  id v16 = 0;
  v33 = 0;
LABEL_80:
  v46 = self;
LABEL_93:

LABEL_94:
  return v33;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMGenerativeExperiencesTransparencyLog *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_prompt) {
    PBDataWriterWriteStringField();
  }
  if (self->_response) {
    PBDataWriterWriteStringField();
  }
  if (self->_model) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_useCase) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasErrorCode) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMGenerativeExperiencesTransparencyLog;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_63;
  }
  uint64_t v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
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
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasRaw_timestamp = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            double v22 = *(double *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v22 = 0.0;
          }
          v5->_raw_timestamp = v22;
          continue;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 48;
          goto LABEL_39;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_39;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
          goto LABEL_39;
        case 5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
          goto LABEL_39;
        case 6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_39;
        case 7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 88;
          goto LABEL_39;
        case 8u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasErrorCode = 1;
          while (2)
          {
            uint64_t v28 = *v6;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v17 = v26++ >= 9;
                if (v17)
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
          v5->_errorCode = v27;
          continue;
        case 9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
LABEL_39:
          id v32 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0xAu:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_62;
          }
          continue;
      }
      while (1)
      {
        uint64_t v36 = *v6;
        uint64_t v37 = *(void *)&v4[v36];
        unint64_t v38 = v37 + 1;
        if (v37 == -1 || v38 > *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
        *(void *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0) {
          goto LABEL_54;
        }
        v33 += 7;
        if (v34++ > 8)
        {
          unsigned int v41 = 0;
          goto LABEL_58;
        }
      }
      v4[*v8] = 1;
LABEL_54:
      unsigned int v41 = 0;
      if (v4[*v8]) {
        LODWORD(v35) = 0;
      }
      if (v35 <= 5) {
        unsigned int v41 = dword_1B35D81E8[v35];
      }
LABEL_58:
      v5->_executionEnvironment = v41;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_62:
  }
    uint64_t v42 = 0;
  else {
LABEL_63:
  }
    uint64_t v42 = v5;

  return v42;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  uint64_t v14 = [(BMGenerativeExperiencesTransparencyLog *)self timestamp];
  v3 = [(BMGenerativeExperiencesTransparencyLog *)self identifier];
  id v4 = [(BMGenerativeExperiencesTransparencyLog *)self prompt];
  id v5 = [(BMGenerativeExperiencesTransparencyLog *)self response];
  uint64_t v6 = [(BMGenerativeExperiencesTransparencyLog *)self model];
  uint64_t v7 = [(BMGenerativeExperiencesTransparencyLog *)self modelVersion];
  uint64_t v8 = [(BMGenerativeExperiencesTransparencyLog *)self useCase];
  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGenerativeExperiencesTransparencyLog errorCode](self, "errorCode"));
  char v10 = [(BMGenerativeExperiencesTransparencyLog *)self clientIdentifier];
  unsigned int v11 = BMGenerativeExperiencesTransparencyLogExecutionEnvironmentAsString([(BMGenerativeExperiencesTransparencyLog *)self executionEnvironment]);
  unint64_t v12 = (void *)[v15 initWithFormat:@"BMGenerativeExperiencesTransparencyLog with timestamp: %@, identifier: %@, prompt: %@, response: %@, model: %@, modelVersion: %@, useCase: %@, errorCode: %@, clientIdentifier: %@, executionEnvironment: %@", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMGenerativeExperiencesTransparencyLog)initWithTimestamp:(id)a3 identifier:(id)a4 prompt:(id)a5 response:(id)a6 model:(id)a7 modelVersion:(id)a8 useCase:(id)a9 errorCode:(id)a10 clientIdentifier:(id)a11 executionEnvironment:(int)a12
{
  id v18 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v19 = a10;
  id v24 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMGenerativeExperiencesTransparencyLog;
  uint64_t v20 = [(BMEventBase *)&v31 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v18)
    {
      v20->_hasRaw_timestamp = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_timestamp = 0;
      double v21 = -1.0;
    }
    v20->_raw_timestamp = v21;
    objc_storeStrong((id *)&v20->_identifier, a4);
    objc_storeStrong((id *)&v20->_prompt, a5);
    objc_storeStrong((id *)&v20->_response, a6);
    objc_storeStrong((id *)&v20->_model, a7);
    objc_storeStrong((id *)&v20->_modelVersion, a8);
    objc_storeStrong((id *)&v20->_useCase, a9);
    if (v19)
    {
      v20->_hasErrorCode = 1;
      int v22 = [v19 intValue];
    }
    else
    {
      v20->_hasErrorCode = 0;
      int v22 = -1;
    }
    v20->_errorCode = v22;
    objc_storeStrong((id *)&v20->_clientIdentifier, a11);
    v20->_executionEnvironment = a12;
  }

  return v20;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:1 type:0 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:2 type:13 subMessageClass:0];
  v14[1] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prompt" number:3 type:13 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"response" number:4 type:13 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"model" number:5 type:13 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelVersion" number:6 type:13 subMessageClass:0];
  v14[5] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"useCase" number:7 type:13 subMessageClass:0];
  v14[6] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"errorCode" number:8 type:2 subMessageClass:0];
  v14[7] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientIdentifier" number:9 type:13 subMessageClass:0];
  v14[8] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"executionEnvironment" number:10 type:4 subMessageClass:0];
  v14[9] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4A28;
}

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prompt" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"response" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"model" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"modelVersion" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"useCase" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"errorCode" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientIdentifier" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"executionEnvironment" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
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

    uint64_t v8 = [[BMGenerativeExperiencesTransparencyLog alloc] initByReadFrom:v7];
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