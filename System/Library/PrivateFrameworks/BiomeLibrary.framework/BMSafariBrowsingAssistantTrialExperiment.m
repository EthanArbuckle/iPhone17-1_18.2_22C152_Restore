@interface BMSafariBrowsingAssistantTrialExperiment
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantTrialExperiment)initWithExperiment_namespace:(id)a3 experiment_id:(id)a4 treatment_id:(id)a5 deployment_id:(id)a6 allocation_status:(int)a7 compatibility_version:(id)a8;
- (BMSafariBrowsingAssistantTrialExperiment)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasCompatibility_version;
- (BOOL)hasDeployment_id;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)experiment_id;
- (NSString)experiment_namespace;
- (NSString)treatment_id;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)allocation_status;
- (int64_t)deployment_id;
- (unsigned)compatibility_version;
- (unsigned)dataVersion;
- (void)setHasCompatibility_version:(BOOL)a3;
- (void)setHasDeployment_id:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantTrialExperiment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment_id, 0);
  objc_storeStrong((id *)&self->_experiment_id, 0);

  objc_storeStrong((id *)&self->_experiment_namespace, 0);
}

- (void)setHasCompatibility_version:(BOOL)a3
{
  self->_hasCompatibility_version = a3;
}

- (BOOL)hasCompatibility_version
{
  return self->_hasCompatibility_version;
}

- (unsigned)compatibility_version
{
  return self->_compatibility_version;
}

- (int)allocation_status
{
  return self->_allocation_status;
}

- (void)setHasDeployment_id:(BOOL)a3
{
  self->_hasDeployment_id = a3;
}

- (BOOL)hasDeployment_id
{
  return self->_hasDeployment_id;
}

- (int64_t)deployment_id
{
  return self->_deployment_id;
}

- (NSString)treatment_id
{
  return self->_treatment_id;
}

- (NSString)experiment_id
{
  return self->_experiment_id;
}

- (NSString)experiment_namespace
{
  return self->_experiment_namespace;
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
    v6 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_namespace];
    uint64_t v7 = objc_msgSend(v5, "experiment_namespace");
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_namespace];
      v10 = objc_msgSend(v5, "experiment_namespace");
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_26;
      }
    }
    v13 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_id];
    uint64_t v14 = objc_msgSend(v5, "experiment_id");
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_id];
      v17 = objc_msgSend(v5, "experiment_id");
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_26;
      }
    }
    v19 = [(BMSafariBrowsingAssistantTrialExperiment *)self treatment_id];
    uint64_t v20 = objc_msgSend(v5, "treatment_id");
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSafariBrowsingAssistantTrialExperiment *)self treatment_id];
      v23 = objc_msgSend(v5, "treatment_id");
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_26;
      }
    }
    if (![(BMSafariBrowsingAssistantTrialExperiment *)self hasDeployment_id]
      && !objc_msgSend(v5, "hasDeployment_id")
      || [(BMSafariBrowsingAssistantTrialExperiment *)self hasDeployment_id]
      && objc_msgSend(v5, "hasDeployment_id")
      && (int64_t v25 = [(BMSafariBrowsingAssistantTrialExperiment *)self deployment_id],
          v25 == objc_msgSend(v5, "deployment_id")))
    {
      int v26 = [(BMSafariBrowsingAssistantTrialExperiment *)self allocation_status];
      if (v26 == objc_msgSend(v5, "allocation_status"))
      {
        if (![(BMSafariBrowsingAssistantTrialExperiment *)self hasCompatibility_version]
          && !objc_msgSend(v5, "hasCompatibility_version"))
        {
          BOOL v12 = 1;
          goto LABEL_27;
        }
        if ([(BMSafariBrowsingAssistantTrialExperiment *)self hasCompatibility_version]
          && objc_msgSend(v5, "hasCompatibility_version"))
        {
          unsigned int v27 = [(BMSafariBrowsingAssistantTrialExperiment *)self compatibility_version];
          BOOL v12 = v27 == objc_msgSend(v5, "compatibility_version");
LABEL_27:

          goto LABEL_28;
        }
      }
    }
LABEL_26:
    BOOL v12 = 0;
    goto LABEL_27;
  }
  BOOL v12 = 0;
LABEL_28:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_namespace];
  id v4 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_id];
  id v5 = [(BMSafariBrowsingAssistantTrialExperiment *)self treatment_id];
  if ([(BMSafariBrowsingAssistantTrialExperiment *)self hasDeployment_id])
  {
    v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSafariBrowsingAssistantTrialExperiment deployment_id](self, "deployment_id"));
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantTrialExperiment allocation_status](self, "allocation_status"));
  if ([(BMSafariBrowsingAssistantTrialExperiment *)self hasCompatibility_version])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSafariBrowsingAssistantTrialExperiment compatibility_version](self, "compatibility_version"));
  }
  else
  {
    v8 = 0;
  }
  v21[0] = @"experiment_namespace";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  uint64_t v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = @"experiment_id";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"treatment_id";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v22[2] = v11;
  v21[3] = @"deployment_id";
  BOOL v12 = v6;
  if (!v6)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"allocation_status";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"compatibility_version";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
  }

  if (v6)
  {
LABEL_22:
    if (v5) {
      goto LABEL_23;
    }
LABEL_32:

    if (v4) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
LABEL_31:

  if (!v5) {
    goto LABEL_32;
  }
LABEL_23:
  if (v4) {
    goto LABEL_24;
  }
LABEL_33:

LABEL_24:
  if (!v20) {

  }
  return v15;
}

- (BMSafariBrowsingAssistantTrialExperiment)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"experiment_namespace"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"experiment_id"];
    v50 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v20 = 0;
          v22 = 0;
          goto LABEL_45;
        }
        id v23 = v8;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        int64_t v25 = a4;
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v62 = *MEMORY[0x1E4F28568];
        uint64_t v27 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"experiment_id"];
        uint64_t v63 = v27;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        v28 = v24;
        id v8 = v23;
        uint64_t v20 = 0;
        v22 = 0;
        *int64_t v25 = (id)[v28 initWithDomain:v26 code:2 userInfo:v10];
        id v11 = (id)v27;
        goto LABEL_44;
      }
      id v52 = v9;
    }
    else
    {
      id v52 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"treatment_id"];
    v53 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v22 = 0;
          uint64_t v20 = v52;
          goto LABEL_44;
        }
        id v29 = v8;
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        id v51 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"treatment_id"];
        id v61 = v51;
        BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        v33 = v30;
        id v8 = v29;
        v22 = 0;
        id *v31 = (id)[v33 initWithDomain:v32 code:2 userInfo:v12];
        id v11 = 0;
LABEL_43:
        uint64_t v20 = v52;

        self = v53;
LABEL_44:

        uint64_t v7 = v50;
        goto LABEL_45;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    BOOL v12 = [v6 objectForKeyedSubscript:@"deployment_id"];
    id v49 = v8;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v51 = 0;
          v22 = 0;
          goto LABEL_43;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        v36 = a4;
        v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"deployment_id"];
        v59 = v15;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        id v37 = (id)[v34 initWithDomain:v35 code:2 userInfo:v13];
        id v51 = 0;
        v22 = 0;
        id *v36 = v37;
        goto LABEL_42;
      }
      id v51 = v12;
    }
    else
    {
      id v51 = 0;
    }
    id v48 = v11;
    v13 = [v6 objectForKeyedSubscript:@"allocation_status"];
    uint64_t v14 = a4;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v15 = 0;
            v22 = 0;
            id v11 = v48;
            goto LABEL_42;
          }
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v56 = *MEMORY[0x1E4F28568];
          id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"allocation_status"];
          id v57 = v39;
          v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v38];
          v15 = 0;
          v22 = 0;
          *uint64_t v14 = v45;
          goto LABEL_57;
        }
        id v16 = [NSNumber numberWithInt:BMSafariBrowsingAssistantTreatmentAllocationStatusFromString(v13)];
      }
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
    v38 = [v6 objectForKeyedSubscript:@"compatibility_version"];
    if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v39 = 0;
LABEL_40:
      id v11 = v48;
      v22 = -[BMSafariBrowsingAssistantTrialExperiment initWithExperiment_namespace:experiment_id:treatment_id:deployment_id:allocation_status:compatibility_version:](v53, "initWithExperiment_namespace:experiment_id:treatment_id:deployment_id:allocation_status:compatibility_version:", v49, v52, v48, v51, [v15 intValue], v39);
      v53 = v22;
LABEL_41:

LABEL_42:
      id v8 = v49;
      goto LABEL_43;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v39 = v38;
      goto LABEL_40;
    }
    if (v14)
    {
      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v46 = *MEMORY[0x1E4F502C8];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v41 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"compatibility_version"];
      v55 = v41;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      *uint64_t v14 = (id)[v47 initWithDomain:v46 code:2 userInfo:v42];
    }
    id v39 = 0;
    v22 = 0;
LABEL_57:
    id v11 = v48;
    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    v22 = 0;
    goto LABEL_46;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v18 = a4;
  uint64_t v19 = *MEMORY[0x1E4F502C8];
  uint64_t v64 = *MEMORY[0x1E4F28568];
  uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"experiment_namespace"];
  v65[0] = v20;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
  id v21 = (id)[v17 initWithDomain:v19 code:2 userInfo:v9];
  id v8 = 0;
  v22 = 0;
  *int v18 = v21;
LABEL_45:

LABEL_46:
  return v22;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantTrialExperiment *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_experiment_namespace) {
    PBDataWriterWriteStringField();
  }
  if (self->_experiment_id) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatment_id) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasDeployment_id) {
    PBDataWriterWriteInt64Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasCompatibility_version) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMSafariBrowsingAssistantTrialExperiment;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_64;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_25;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_25;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
LABEL_25:
          id v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          int64_t v24 = 0;
          v5->_hasDeployment_id = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v16 = v23++ >= 9;
                if (v16)
                {
                  int64_t v24 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            int64_t v24 = 0;
          }
LABEL_50:
          v5->_deployment_id = v24;
          continue;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          while (2)
          {
            uint64_t v31 = *v6;
            unint64_t v32 = *(void *)&v4[v31];
            if (v32 == -1 || v32 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v30) = 0;
          }
LABEL_54:
          if (v30 >= 4) {
            LODWORD(v30) = 0;
          }
          v5->_allocation_status = v30;
          continue;
        case 6u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          v5->_hasCompatibility_version = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_63;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v6;
        unint64_t v38 = *(void *)&v4[v37];
        if (v38 == -1 || v38 >= *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
        *(void *)&v4[v37] = v38 + 1;
        v36 |= (unint64_t)(v39 & 0x7F) << v34;
        if ((v39 & 0x80) == 0) {
          goto LABEL_58;
        }
        v34 += 7;
        BOOL v16 = v35++ >= 9;
        if (v16)
        {
          LODWORD(v36) = 0;
          goto LABEL_60;
        }
      }
      v4[*v8] = 1;
LABEL_58:
      if (v4[*v8]) {
        LODWORD(v36) = 0;
      }
LABEL_60:
      v5->_compatibility_version = v36;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_63:
  }
    v40 = 0;
  else {
LABEL_64:
  }
    v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_namespace];
  id v5 = [(BMSafariBrowsingAssistantTrialExperiment *)self experiment_id];
  id v6 = [(BMSafariBrowsingAssistantTrialExperiment *)self treatment_id];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMSafariBrowsingAssistantTrialExperiment deployment_id](self, "deployment_id"));
  id v8 = BMSafariBrowsingAssistantTreatmentAllocationStatusAsString([(BMSafariBrowsingAssistantTrialExperiment *)self allocation_status]);
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSafariBrowsingAssistantTrialExperiment compatibility_version](self, "compatibility_version"));
  char v10 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantTrialExperiment with experiment_namespace: %@, experiment_id: %@, treatment_id: %@, deployment_id: %@, allocation_status: %@, compatibility_version: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSafariBrowsingAssistantTrialExperiment)initWithExperiment_namespace:(id)a3 experiment_id:(id)a4 treatment_id:(id)a5 deployment_id:(id)a6 allocation_status:(int)a7 compatibility_version:(id)a8
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSafariBrowsingAssistantTrialExperiment;
  uint64_t v19 = [(BMEventBase *)&v24 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_experiment_namespace, a3);
    objc_storeStrong((id *)&v19->_experiment_id, a4);
    objc_storeStrong((id *)&v19->_treatment_id, a5);
    if (v17)
    {
      v19->_hasDeployment_id = 1;
      uint64_t v20 = [v17 longLongValue];
    }
    else
    {
      v19->_hasDeployment_id = 0;
      uint64_t v20 = -1;
    }
    v19->_deployment_id = v20;
    v19->_allocation_status = a7;
    if (v18)
    {
      v19->_hasCompatibility_version = 1;
      unsigned int v21 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v21 = 0;
      v19->_hasCompatibility_version = 0;
    }
    v19->_compatibility_version = v21;
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experiment_namespace" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experiment_id" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"treatment_id" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deployment_id" number:4 type:3 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"allocation_status" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"compatibility_version" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5700;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experiment_namespace" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experiment_id" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"treatment_id" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deployment_id" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:3 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"allocation_status" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"compatibility_version" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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

    id v8 = [[BMSafariBrowsingAssistantTrialExperiment alloc] initByReadFrom:v7];
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