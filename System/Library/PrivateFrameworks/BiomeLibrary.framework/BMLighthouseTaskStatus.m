@interface BMLighthouseTaskStatus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseTaskStatus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseTaskStatus)initWithVersion:(id)a3 taskName:(id)a4 taskState:(id)a5;
- (BMLighthouseTaskStatus)initWithVersion:(id)a3 taskName:(id)a4 taskState:(id)a5 taskSource:(id)a6 pushMetadata:(id)a7 pullMetadata:(id)a8;
- (BMLighthouseTaskStatusPullMetadata)pullMetadata;
- (BMLighthouseTaskStatusPushMetadata)pushMetadata;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)taskName;
- (NSString)taskSource;
- (NSString)taskState;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)version;
- (unsigned)dataVersion;
- (void)setHasVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseTaskStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pullMetadata, 0);
  objc_storeStrong((id *)&self->_pushMetadata, 0);
  objc_storeStrong((id *)&self->_taskSource, 0);
  objc_storeStrong((id *)&self->_taskState, 0);

  objc_storeStrong((id *)&self->_taskName, 0);
}

- (BMLighthouseTaskStatusPullMetadata)pullMetadata
{
  return self->_pullMetadata;
}

- (BMLighthouseTaskStatusPushMetadata)pushMetadata
{
  return self->_pushMetadata;
}

- (NSString)taskSource
{
  return self->_taskSource;
}

- (NSString)taskState
{
  return self->_taskState;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (int)version
{
  return self->_version;
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
    if (-[BMLighthouseTaskStatus hasVersion](self, "hasVersion") || [v5 hasVersion])
    {
      if (![(BMLighthouseTaskStatus *)self hasVersion]) {
        goto LABEL_22;
      }
      if (![v5 hasVersion]) {
        goto LABEL_22;
      }
      int v6 = [(BMLighthouseTaskStatus *)self version];
      if (v6 != [v5 version]) {
        goto LABEL_22;
      }
    }
    v7 = [(BMLighthouseTaskStatus *)self taskName];
    uint64_t v8 = [v5 taskName];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMLighthouseTaskStatus *)self taskName];
      v11 = [v5 taskName];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_22;
      }
    }
    v14 = [(BMLighthouseTaskStatus *)self taskState];
    uint64_t v15 = [v5 taskState];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMLighthouseTaskStatus *)self taskState];
      v18 = [v5 taskState];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_22;
      }
    }
    v20 = [(BMLighthouseTaskStatus *)self taskSource];
    uint64_t v21 = [v5 taskSource];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMLighthouseTaskStatus *)self taskSource];
      v24 = [v5 taskSource];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_22;
      }
    }
    v26 = [(BMLighthouseTaskStatus *)self pushMetadata];
    uint64_t v27 = [v5 pushMetadata];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMLighthouseTaskStatus *)self pushMetadata];
      v30 = [v5 pushMetadata];
      int v31 = [v29 isEqual:v30];

      if (!v31)
      {
LABEL_22:
        char v13 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v33 = [(BMLighthouseTaskStatus *)self pullMetadata];
    v34 = [v5 pullMetadata];
    if (v33 == v34)
    {
      char v13 = 1;
    }
    else
    {
      v35 = [(BMLighthouseTaskStatus *)self pullMetadata];
      v36 = [v5 pullMetadata];
      char v13 = [v35 isEqual:v36];
    }
    goto LABEL_23;
  }
  char v13 = 0;
LABEL_24:

  return v13;
}

- (id)jsonDictionary
{
  v24[6] = *MEMORY[0x1E4F143B8];
  if ([(BMLighthouseTaskStatus *)self hasVersion])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskStatus version](self, "version"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BMLighthouseTaskStatus *)self taskName];
  id v5 = [(BMLighthouseTaskStatus *)self taskState];
  int v6 = [(BMLighthouseTaskStatus *)self taskSource];
  v7 = [(BMLighthouseTaskStatus *)self pushMetadata];
  uint64_t v8 = [v7 jsonDictionary];

  v9 = [(BMLighthouseTaskStatus *)self pullMetadata];
  v10 = [v9 jsonDictionary];

  v23[0] = @"version";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = (void *)v11;
  v22 = (void *)v3;
  v24[0] = v11;
  v23[1] = @"taskName";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v12;
  v24[1] = v12;
  v23[2] = @"taskState";
  char v13 = v5;
  if (!v5)
  {
    char v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12, v21);
  }
  v24[2] = v13;
  v23[3] = @"taskSource";
  v14 = v6;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v14;
  v23[4] = @"pushMetadata";
  uint64_t v15 = v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v15;
  v23[5] = @"pullMetadata";
  v16 = v10;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  if (v10)
  {
    if (v8) {
      goto LABEL_18;
    }
  }
  else
  {

    if (v8)
    {
LABEL_18:
      if (v6) {
        goto LABEL_19;
      }
      goto LABEL_28;
    }
  }

  if (v6)
  {
LABEL_19:
    if (v5) {
      goto LABEL_20;
    }
LABEL_29:

    if (v4) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
LABEL_28:

  if (!v5) {
    goto LABEL_29;
  }
LABEL_20:
  if (v4) {
    goto LABEL_21;
  }
LABEL_30:

LABEL_21:
  if (!v22) {

  }
  return v17;
}

- (BMLighthouseTaskStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"version"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"taskName"];
    v55 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v23 = 0;
          v16 = 0;
          goto LABEL_59;
        }
        id v25 = v8;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = a4;
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v68 = *MEMORY[0x1E4F28568];
        v29 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskName"];
        v69 = v29;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        v30 = v26;
        id v8 = v25;
        uint64_t v31 = v28;
        a4 = v29;
        v16 = 0;
        v23 = 0;
        *uint64_t v27 = (id)[v30 initWithDomain:v31 code:2 userInfo:v10];
        goto LABEL_58;
      }
      id v56 = v9;
    }
    else
    {
      id v56 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"taskState"];
    v57 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          goto LABEL_57;
        }
        id v34 = v8;
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        v36 = a4;
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v66 = *MEMORY[0x1E4F28568];
        id v54 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskState"];
        id v67 = v54;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        v38 = v35;
        id v8 = v34;
        id v39 = (id)[v38 initWithDomain:v37 code:2 userInfo:v11];
        v16 = 0;
        a4 = 0;
        id *v36 = v39;
LABEL_56:

        self = v57;
LABEL_57:
        v23 = v56;
LABEL_58:

        v7 = v55;
        goto LABEL_59;
      }
      v52 = v10;
    }
    else
    {
      v52 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"taskSource"];
    id v53 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v54 = 0;
          v16 = 0;
          a4 = v52;
          goto LABEL_56;
        }
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"taskSource"];
        id v65 = v17;
        char v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        v42 = v40;
        id v8 = v53;
        id v43 = (id)[v42 initWithDomain:v41 code:2 userInfo:v13];
        v16 = 0;
        id v54 = 0;
        *a4 = v43;
        a4 = v52;
        goto LABEL_54;
      }
      id v54 = v11;
    }
    else
    {
      id v54 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"pushMetadata"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v13 = 0;
LABEL_16:
      v14 = [v6 objectForKeyedSubscript:@"pullMetadata"];
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v15 = 0;
LABEL_19:
        a4 = v52;
        v16 = [(BMLighthouseTaskStatus *)v57 initWithVersion:v53 taskName:v56 taskState:v52 taskSource:v54 pushMetadata:v13 pullMetadata:v15];
        v57 = v16;
LABEL_52:

LABEL_53:
        id v17 = v12;
        id v8 = v53;
        goto LABEL_54;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v58 = 0;
        id v50 = v14;
        uint64_t v15 = [[BMLighthouseTaskStatusPullMetadata alloc] initWithJSONDictionary:v50 error:&v58];
        id v32 = v58;
        if (!v32)
        {

          goto LABEL_19;
        }
        v33 = v32;
        if (a4) {
          *a4 = v32;
        }
      }
      else
      {
        if (!a4)
        {
          v16 = 0;
          a4 = v52;
          goto LABEL_53;
        }
        id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        uint64_t v15 = (BMLighthouseTaskStatusPullMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"pullMetadata"];
        v61 = v15;
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        *a4 = (id)[v51 initWithDomain:v49 code:2 userInfo:v46];
      }
      v16 = 0;
      a4 = v52;
      goto LABEL_52;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v12;
      id v59 = 0;
      char v13 = [[BMLighthouseTaskStatusPushMetadata alloc] initWithJSONDictionary:v17 error:&v59];
      id v18 = v59;
      if (!v18)
      {

        goto LABEL_16;
      }
      uint64_t v19 = v18;
      if (a4) {
        *a4 = v18;
      }

      v16 = 0;
    }
    else
    {
      if (!a4)
      {
        v16 = 0;
        a4 = v52;
        goto LABEL_55;
      }
      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v44 = *MEMORY[0x1E4F502C8];
      uint64_t v62 = *MEMORY[0x1E4F28568];
      char v13 = (BMLighthouseTaskStatusPushMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"pushMetadata"];
      v63 = v13;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      *a4 = (id)[v48 initWithDomain:v44 code:2 userInfo:v45];

      v16 = 0;
      id v17 = v12;
    }
    a4 = v52;
    id v8 = v53;
LABEL_54:

    uint64_t v12 = v17;
LABEL_55:

    goto LABEL_56;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    id v8 = 0;
    goto LABEL_60;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = a4;
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v70 = *MEMORY[0x1E4F28568];
  v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"version"];
  v71[0] = v23;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
  id v24 = (id)[v20 initWithDomain:v22 code:2 userInfo:v9];
  v16 = 0;
  id v8 = 0;
  *uint64_t v21 = v24;
LABEL_59:

LABEL_60:
  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMLighthouseTaskStatus *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasVersion) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_taskName) {
    PBDataWriterWriteStringField();
  }
  if (self->_taskState) {
    PBDataWriterWriteStringField();
  }
  if (self->_taskSource) {
    PBDataWriterWriteStringField();
  }
  if (self->_pushMetadata)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseTaskStatusPushMetadata *)self->_pushMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_pullMetadata)
  {
    PBDataWriterPlaceMark();
    [(BMLighthouseTaskStatusPullMetadata *)self->_pullMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMLighthouseTaskStatus;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_47;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasVersion = 1;
          break;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 32;
          goto LABEL_32;
        case 3u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 40;
          goto LABEL_32;
        case 4u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 48;
LABEL_32:
          v29 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 5u:
          uint64_t v36 = 0;
          uint64_t v37 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_46;
          }
          v30 = [[BMLighthouseTaskStatusPushMetadata alloc] initByReadFrom:v4];
          if (!v30) {
            goto LABEL_46;
          }
          uint64_t v31 = 56;
          goto LABEL_39;
        case 6u:
          uint64_t v36 = 0;
          uint64_t v37 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_46;
          }
          v30 = [[BMLighthouseTaskStatusPullMetadata alloc] initByReadFrom:v4];
          if (!v30) {
            goto LABEL_46;
          }
          uint64_t v31 = 64;
LABEL_39:
          id v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = v30;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_46;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v6;
        uint64_t v24 = *(void *)&v4[v23];
        unint64_t v25 = v24 + 1;
        if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
        *(void *)&v4[v23] = v25;
        v22 |= (unint64_t)(v26 & 0x7F) << v20;
        if ((v26 & 0x80) == 0) {
          goto LABEL_41;
        }
        v20 += 7;
        BOOL v17 = v21++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_43;
        }
      }
      v4[*v8] = 1;
LABEL_41:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_43:
      v5->_version = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_46:
  }
    v33 = 0;
  else {
LABEL_47:
  }
    v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLighthouseTaskStatus version](self, "version"));
  id v5 = [(BMLighthouseTaskStatus *)self taskName];
  id v6 = [(BMLighthouseTaskStatus *)self taskState];
  v7 = [(BMLighthouseTaskStatus *)self taskSource];
  id v8 = [(BMLighthouseTaskStatus *)self pushMetadata];
  v9 = [(BMLighthouseTaskStatus *)self pullMetadata];
  char v10 = (void *)[v3 initWithFormat:@"BMLighthouseTaskStatus with version: %@, taskName: %@, taskState: %@, taskSource: %@, pushMetadata: %@, pullMetadata: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMLighthouseTaskStatus)initWithVersion:(id)a3 taskName:(id)a4 taskState:(id)a5 taskSource:(id)a6 pushMetadata:(id)a7 pullMetadata:(id)a8
{
  id v14 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMLighthouseTaskStatus;
  int v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22);
    if (v14)
    {
      v18->_hasVersion = 1;
      int v19 = [v14 intValue];
    }
    else
    {
      v18->_hasVersion = 0;
      int v19 = -1;
    }
    v18->_version = v19;
    objc_storeStrong((id *)&v18->_taskName, a4);
    objc_storeStrong((id *)&v18->_taskState, a5);
    objc_storeStrong((id *)&v18->_taskSource, a6);
    objc_storeStrong((id *)&v18->_pushMetadata, a7);
    objc_storeStrong((id *)&v18->_pullMetadata, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"version" number:1 type:2 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskName" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskState" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"taskSource" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pushMetadata" number:5 type:14 subMessageClass:objc_opt_class()];
  v10[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pullMetadata" number:6 type:14 subMessageClass:objc_opt_class()];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF60F0;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"version" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskState" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"taskSource" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"pushMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_60924];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"pullMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_185];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __33__BMLighthouseTaskStatus_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 pullMetadata];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __33__BMLighthouseTaskStatus_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 pushMetadata];
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMLighthouseTaskStatus alloc] initByReadFrom:v7];
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

- (BMLighthouseTaskStatus)initWithVersion:(id)a3 taskName:(id)a4 taskState:(id)a5
{
  return [(BMLighthouseTaskStatus *)self initWithVersion:a3 taskName:a4 taskState:a5 taskSource:0 pushMetadata:0 pullMetadata:0];
}

@end