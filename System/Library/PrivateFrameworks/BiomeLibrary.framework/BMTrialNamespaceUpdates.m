@interface BMTrialNamespaceUpdates
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTrialNamespaceUpdates)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTrialNamespaceUpdates)initWithNamespaceNames:(id)a3 experimentStatus:(int)a4 userId:(id)a5 experimentId:(id)a6 deploymentId:(id)a7 treatmentId:(id)a8;
- (BMTrialNamespaceUpdatesNamespaceNamesList)NamespaceNames;
- (BOOL)isEqual:(id)a3;
- (NSString)deploymentId;
- (NSString)description;
- (NSString)experimentId;
- (NSString)treatmentId;
- (NSString)userId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)experimentStatus;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMTrialNamespaceUpdates

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"NamespaceNames_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_156_87436];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experimentStatus" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experimentId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deploymentId" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"treatmentId" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_userId, 0);

  objc_storeStrong((id *)&self->_NamespaceNames, 0);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)deploymentId
{
  return self->_deploymentId;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (NSString)userId
{
  return self->_userId;
}

- (int)experimentStatus
{
  return self->_experimentStatus;
}

- (BMTrialNamespaceUpdatesNamespaceNamesList)NamespaceNames
{
  return self->_NamespaceNames;
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
    v6 = [(BMTrialNamespaceUpdates *)self NamespaceNames];
    uint64_t v7 = [v5 NamespaceNames];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMTrialNamespaceUpdates *)self NamespaceNames];
      v10 = [v5 NamespaceNames];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_18;
      }
    }
    int v13 = [(BMTrialNamespaceUpdates *)self experimentStatus];
    if (v13 == [v5 experimentStatus])
    {
      v14 = [(BMTrialNamespaceUpdates *)self userId];
      uint64_t v15 = [v5 userId];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMTrialNamespaceUpdates *)self userId];
        v18 = [v5 userId];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_18;
        }
      }
      v20 = [(BMTrialNamespaceUpdates *)self experimentId];
      uint64_t v21 = [v5 experimentId];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMTrialNamespaceUpdates *)self experimentId];
        v24 = [v5 experimentId];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_18;
        }
      }
      v26 = [(BMTrialNamespaceUpdates *)self deploymentId];
      uint64_t v27 = [v5 deploymentId];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMTrialNamespaceUpdates *)self deploymentId];
        v30 = [v5 deploymentId];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_18;
        }
      }
      v33 = [(BMTrialNamespaceUpdates *)self treatmentId];
      v34 = [v5 treatmentId];
      if (v33 == v34)
      {
        char v12 = 1;
      }
      else
      {
        v35 = [(BMTrialNamespaceUpdates *)self treatmentId];
        v36 = [v5 treatmentId];
        char v12 = [v35 isEqual:v36];
      }
      goto LABEL_19;
    }
LABEL_18:
    char v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v23[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMTrialNamespaceUpdates *)self NamespaceNames];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMTrialNamespaceUpdates experimentStatus](self, "experimentStatus"));
  v6 = [(BMTrialNamespaceUpdates *)self userId];
  uint64_t v7 = [(BMTrialNamespaceUpdates *)self experimentId];
  v8 = [(BMTrialNamespaceUpdates *)self deploymentId];
  v9 = [(BMTrialNamespaceUpdates *)self treatmentId];
  v22[0] = @"NamespaceNames";
  uint64_t v10 = v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v10;
  v23[0] = v10;
  v22[1] = @"experimentStatus";
  uint64_t v11 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v23[1] = v11;
  v22[2] = @"userId";
  char v12 = v6;
  if (!v6)
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20);
  }
  uint64_t v21 = (void *)v4;
  v23[2] = v12;
  v22[3] = @"experimentId";
  int v13 = v7;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v13;
  v22[4] = @"deploymentId";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v14;
  v22[5] = @"treatmentId";
  uint64_t v15 = v9;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[5] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  if (v9)
  {
    if (v8) {
      goto LABEL_15;
    }
LABEL_23:

    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }

  if (!v8) {
    goto LABEL_23;
  }
LABEL_15:
  if (v7) {
    goto LABEL_16;
  }
LABEL_24:

LABEL_16:
  if (v6)
  {
    if (v5) {
      goto LABEL_18;
    }
LABEL_26:

    if (v21) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v5) {
    goto LABEL_26;
  }
LABEL_18:
  if (v21) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v16;
}

- (BMTrialNamespaceUpdates)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"NamespaceNames"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v52 = v7;
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = v7;
    id v55 = 0;
    v8 = [[BMTrialNamespaceUpdatesNamespaceNamesList alloc] initWithJSONDictionary:v10 error:&v55];
    id v11 = v55;
    if (v11)
    {
      char v12 = v11;
      if (a4) {
        *a4 = v11;
      }

      int v13 = 0;
      goto LABEL_55;
    }
    v52 = v7;

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"experimentStatus"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = v9;
      }
      else
      {
        uint64_t v10 = a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            int v13 = 0;
            goto LABEL_54;
          }
          id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
          v43 = v9;
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v64 = *MEMORY[0x1E4F28568];
          id v54 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"experimentStatus"];
          id v65 = v54;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
          uint64_t v45 = v44;
          v9 = v43;
          int v13 = 0;
          *a4 = (id)[v42 initWithDomain:v45 code:2 userInfo:v20];
          uint64_t v10 = 0;
LABEL_53:

LABEL_54:
          uint64_t v7 = v52;
          goto LABEL_55;
        }
        v14 = [NSNumber numberWithInt:BMTrialNamespaceUpdatesEventTypeFromString(v9)];
      }
      uint64_t v10 = v14;
    }
    else
    {
      uint64_t v10 = 0;
    }
    v20 = [v6 objectForKeyedSubscript:@"userId"];
    v53 = v8;
    v51 = v10;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v54 = 0;
          int v13 = 0;
          goto LABEL_53;
        }
        v29 = v9;
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v62 = *MEMORY[0x1E4F28568];
        id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userId"];
        id v63 = v23;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        v33 = v30;
        v9 = v29;
        int v13 = 0;
        id v54 = 0;
        *int v31 = (id)[v33 initWithDomain:v32 code:2 userInfo:v21];
        goto LABEL_63;
      }
      id v54 = v20;
    }
    else
    {
      id v54 = 0;
    }
    uint64_t v21 = [v6 objectForKeyedSubscript:@"experimentId"];
    v49 = v9;
    v22 = a4;
    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v23 = 0;
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v21;
LABEL_25:
      v24 = [v6 objectForKeyedSubscript:@"deploymentId"];
      id v50 = v23;
      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        int v25 = self;
        id v26 = 0;
        goto LABEL_28;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v25 = self;
        id v26 = v24;
LABEL_28:
        uint64_t v27 = [v6 objectForKeyedSubscript:@"treatmentId"];
        if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v28 = 0;
LABEL_31:
          uint64_t v10 = v51;
          int v13 = -[BMTrialNamespaceUpdates initWithNamespaceNames:experimentStatus:userId:experimentId:deploymentId:treatmentId:](v25, "initWithNamespaceNames:experimentStatus:userId:experimentId:deploymentId:treatmentId:", v53, [v51 intValue], v54, v50, v26, v28);
          int v25 = v13;
LABEL_50:

          self = v25;
          id v23 = v50;
LABEL_51:

          v9 = v49;
LABEL_52:

          v8 = v53;
          goto LABEL_53;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = v27;
          goto LABEL_31;
        }
        if (v22)
        {
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v46 = *MEMORY[0x1E4F502C8];
          uint64_t v56 = *MEMORY[0x1E4F28568];
          v39 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"treatmentId"];
          v57 = v39;
          v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          id *v22 = (id)[v48 initWithDomain:v46 code:2 userInfo:v40];
        }
        id v28 = 0;
        int v13 = 0;
LABEL_49:
        uint64_t v10 = v51;
        goto LABEL_50;
      }
      if (v22)
      {
        int v25 = self;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deploymentId"];
        id v59 = v28;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        id v38 = (id)[v47 initWithDomain:v37 code:2 userInfo:v27];
        int v13 = 0;
        id v26 = 0;
        id *v22 = v38;
        goto LABEL_49;
      }
      id v26 = 0;
      int v13 = 0;
LABEL_65:
      uint64_t v10 = v51;
      goto LABEL_51;
    }
    if (a4)
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v60 = *MEMORY[0x1E4F28568];
      id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"experimentId"];
      id v61 = v26;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      id v36 = (id)[v34 initWithDomain:v35 code:2 userInfo:v24];
      int v13 = 0;
      id v23 = 0;
      id *v22 = v36;
      goto LABEL_65;
    }
    id v23 = 0;
    int v13 = 0;
LABEL_63:
    uint64_t v10 = v51;
    goto LABEL_52;
  }
  if (!a4)
  {
    int v13 = 0;
    goto LABEL_56;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  v16 = v7;
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v66 = *MEMORY[0x1E4F28568];
  v8 = (BMTrialNamespaceUpdatesNamespaceNamesList *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"NamespaceNames"];
  v67[0] = v8;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
  uint64_t v19 = v17;
  uint64_t v7 = v16;
  int v13 = 0;
  *a4 = (id)[v15 initWithDomain:v19 code:2 userInfo:v18];
  uint64_t v10 = (id *)v18;
LABEL_55:

LABEL_56:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMTrialNamespaceUpdates *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_NamespaceNames)
  {
    PBDataWriterPlaceMark();
    [(BMTrialNamespaceUpdatesNamespaceNamesList *)self->_NamespaceNames writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_userId) {
    PBDataWriterWriteStringField();
  }
  if (self->_experimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_deploymentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMTrialNamespaceUpdates;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_46;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_45;
          }
          uint64_t v19 = [[BMTrialNamespaceUpdatesNamespaceNamesList alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_45;
          }
          NamespaceNames = v5->_NamespaceNames;
          v5->_NamespaceNames = v19;

          PBReaderRecallMark();
          continue;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          break;
        case 3u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 32;
          goto LABEL_36;
        case 4u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 40;
          goto LABEL_36;
        case 5u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 48;
          goto LABEL_36;
        case 6u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 56;
LABEL_36:
          v29 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_45;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v6;
        unint64_t v25 = *(void *)&v4[v24];
        if (v25 == -1 || v25 >= *(void *)&v4[*v7]) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
        *(void *)&v4[v24] = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_38;
        }
        v21 += 7;
        BOOL v16 = v22++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_40:
      if (v23 >= 3) {
        LODWORD(v23) = 0;
      }
      v5->_experimentStatus = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_45:
  }
    id v30 = 0;
  else {
LABEL_46:
  }
    id v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMTrialNamespaceUpdates *)self NamespaceNames];
  id v5 = BMTrialNamespaceUpdatesEventTypeAsString([(BMTrialNamespaceUpdates *)self experimentStatus]);
  id v6 = [(BMTrialNamespaceUpdates *)self userId];
  uint64_t v7 = [(BMTrialNamespaceUpdates *)self experimentId];
  v8 = [(BMTrialNamespaceUpdates *)self deploymentId];
  v9 = [(BMTrialNamespaceUpdates *)self treatmentId];
  char v10 = (void *)[v3 initWithFormat:@"BMTrialNamespaceUpdates with NamespaceNames: %@, experimentStatus: %@, userId: %@, experimentId: %@, deploymentId: %@, treatmentId: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMTrialNamespaceUpdates)initWithNamespaceNames:(id)a3 experimentStatus:(int)a4 userId:(id)a5 experimentId:(id)a6 deploymentId:(id)a7 treatmentId:(id)a8
{
  id v21 = a3;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMTrialNamespaceUpdates;
  uint64_t v18 = [(BMEventBase *)&v22 init];
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v20, v21);
    objc_storeStrong((id *)&v18->_NamespaceNames, a3);
    v18->_experimentStatus = a4;
    objc_storeStrong((id *)&v18->_userId, a5);
    objc_storeStrong((id *)&v18->_experimentId, a6);
    objc_storeStrong((id *)&v18->_deploymentId, a7);
    objc_storeStrong((id *)&v18->_treatmentId, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"NamespaceNames" number:1 type:14 subMessageClass:objc_opt_class()];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experimentStatus" number:2 type:4 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userId" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experimentId" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deploymentId" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"treatmentId" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF75D8;
}

id __34__BMTrialNamespaceUpdates_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 NamespaceNames];
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

    v8 = [[BMTrialNamespaceUpdates alloc] initByReadFrom:v7];
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