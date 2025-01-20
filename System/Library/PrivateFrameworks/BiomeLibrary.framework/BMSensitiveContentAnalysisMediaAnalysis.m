@interface BMSensitiveContentAnalysisMediaAnalysis
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSensitiveContentAnalysisMediaAnalysis)initWithContentType:(int)a3 ageGroup:(int)a4 isSensitive:(int)a5 clientBundleID:(id)a6 trackingVersion:(id)a7;
- (BMSensitiveContentAnalysisMediaAnalysis)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)trackingVersion;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)ageGroup;
- (int)contentType;
- (int)isSensitive;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSensitiveContentAnalysisMediaAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingVersion, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

- (NSString)trackingVersion
{
  return self->_trackingVersion;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (int)isSensitive
{
  return self->_isSensitive;
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (int)contentType
{
  return self->_contentType;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v15 = 0;
    goto LABEL_10;
  }
  id v5 = v4;
  int v6 = [(BMSensitiveContentAnalysisMediaAnalysis *)self contentType];
  if (v6 != [v5 contentType]) {
    goto LABEL_7;
  }
  int v7 = [(BMSensitiveContentAnalysisMediaAnalysis *)self ageGroup];
  if (v7 != [v5 ageGroup]) {
    goto LABEL_7;
  }
  int v8 = [(BMSensitiveContentAnalysisMediaAnalysis *)self isSensitive];
  if (v8 != [v5 isSensitive]) {
    goto LABEL_7;
  }
  v9 = [(BMSensitiveContentAnalysisMediaAnalysis *)self clientBundleID];
  uint64_t v10 = [v5 clientBundleID];
  if (v9 == (void *)v10)
  {

    goto LABEL_12;
  }
  v11 = (void *)v10;
  v12 = [(BMSensitiveContentAnalysisMediaAnalysis *)self clientBundleID];
  v13 = [v5 clientBundleID];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
LABEL_12:
    v17 = [(BMSensitiveContentAnalysisMediaAnalysis *)self trackingVersion];
    v18 = [v5 trackingVersion];
    if (v17 == v18)
    {
      char v15 = 1;
    }
    else
    {
      v19 = [(BMSensitiveContentAnalysisMediaAnalysis *)self trackingVersion];
      v20 = [v5 trackingVersion];
      char v15 = [v19 isEqual:v20];
    }
    goto LABEL_8;
  }
LABEL_7:
  char v15 = 0;
LABEL_8:

LABEL_10:
  return v15;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisMediaAnalysis contentType](self, "contentType"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisMediaAnalysis ageGroup](self, "ageGroup"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSensitiveContentAnalysisMediaAnalysis isSensitive](self, "isSensitive"));
  int v6 = [(BMSensitiveContentAnalysisMediaAnalysis *)self clientBundleID];
  int v7 = [(BMSensitiveContentAnalysisMediaAnalysis *)self trackingVersion];
  v17 = @"contentType";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  v18 = @"ageGroup";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"isSensitive";
  uint64_t v10 = v5;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  v20 = @"clientBundleID";
  v11 = v6;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"trackingVersion";
  v12 = v7;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4) {
      goto LABEL_15;
    }
LABEL_22:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v4) {
    goto LABEL_22;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (BMSensitiveContentAnalysisMediaAnalysis)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"contentType"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v16 = 0;
          uint64_t v15 = self;
          goto LABEL_45;
        }
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"contentType"];
        v47[0] = v36;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
        v37 = 0;
        v16 = 0;
        *a4 = (id)[v24 initWithDomain:v25 code:2 userInfo:v8];
        goto LABEL_56;
      }
      id v7 = [NSNumber numberWithInt:BMSensitiveContentAnalysisMediaAnalysisContentTypeFromString(v6)];
    }
    v37 = v7;
  }
  else
  {
    v37 = 0;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"ageGroup"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = v8;
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = [NSNumber numberWithInt:BMSensitiveContentAnalysisMediaAnalysisAgeGroupFromString(v8)];
        goto LABEL_12;
      }
      if (a4)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"ageGroup"];
        v45 = v10;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        id v36 = 0;
        v16 = 0;
        *a4 = (id)[v26 initWithDomain:v27 code:2 userInfo:v9];
        goto LABEL_58;
      }
      id v36 = 0;
      v16 = 0;
LABEL_56:
      uint64_t v15 = self;
      goto LABEL_44;
    }
  }
  id v36 = 0;
LABEL_12:
  v9 = [v5 objectForKeyedSubscript:@"isSensitive"];
  v34 = v6;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
LABEL_23:
        uint64_t v10 = v11;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [NSNumber numberWithInt:BMSensitiveContentAnalysisMediaAnalysisIsSensitiveFromString(v9)];
        goto LABEL_23;
      }
      if (a4)
      {
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = a4;
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"isSensitive"];
        id v43 = v13;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v10 = 0;
        v16 = 0;
        id *v29 = (id)[v28 initWithDomain:v30 code:2 userInfo:v12];
        goto LABEL_53;
      }
      uint64_t v10 = 0;
      v16 = 0;
LABEL_58:
      uint64_t v15 = self;
      goto LABEL_43;
    }
  }
  uint64_t v10 = 0;
LABEL_24:
  v12 = [v5 objectForKeyedSubscript:@"clientBundleID"];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        goto LABEL_27;
      }
      if (a4)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        v18 = a4;
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientBundleID"];
        v41 = a4;
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v19 = (id)[v32 initWithDomain:v17 code:2 userInfo:v14];
        v16 = 0;
        id v13 = 0;
        id *v18 = v19;
        goto LABEL_40;
      }
      id v13 = 0;
      v16 = 0;
LABEL_53:
      uint64_t v15 = self;
      goto LABEL_42;
    }
  }
  id v13 = 0;
LABEL_27:
  int v14 = [v5 objectForKeyedSubscript:@"trackingVersion"];
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a4 = v14;
        goto LABEL_30;
      }
      if (a4)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v38 = *MEMORY[0x1E4F28568];
        v20 = a4;
        v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"trackingVersion"];
        v39 = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        id *v20 = (id)[v33 initWithDomain:v31 code:2 userInfo:v22];

        a4 = 0;
      }
      v16 = 0;
LABEL_40:
      uint64_t v15 = self;
      goto LABEL_41;
    }
  }
  a4 = 0;
LABEL_30:
  uint64_t v15 = -[BMSensitiveContentAnalysisMediaAnalysis initWithContentType:ageGroup:isSensitive:clientBundleID:trackingVersion:](self, "initWithContentType:ageGroup:isSensitive:clientBundleID:trackingVersion:", [v37 intValue], objc_msgSend(v36, "intValue"), objc_msgSend(v10, "intValue"), v13, a4);
  v16 = v15;
LABEL_41:

LABEL_42:
  int v6 = v34;
LABEL_43:

LABEL_44:
LABEL_45:

  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSensitiveContentAnalysisMediaAnalysis *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_clientBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_trackingVersion) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMSensitiveContentAnalysisMediaAnalysis;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_68;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_47;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_49;
            }
          }
          v4[*v8] = 1;
LABEL_47:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_49:
          if (v21 >= 3) {
            LODWORD(v21) = 0;
          }
          uint64_t v38 = 20;
          goto LABEL_64;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v27 = *v6;
            unint64_t v28 = *(void *)&v4[v27];
            if (v28 == -1 || v28 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v28);
              *(void *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_55:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          uint64_t v38 = 24;
          goto LABEL_64;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          break;
        case 4u:
          uint64_t v35 = PBReaderReadString();
          uint64_t v36 = 32;
          goto LABEL_45;
        case 5u:
          uint64_t v35 = PBReaderReadString();
          uint64_t v36 = 40;
LABEL_45:
          v37 = *(Class *)((char *)&v5->super.super.isa + v36);
          *(Class *)((char *)&v5->super.super.isa + v36) = (Class)v35;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_67;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v6;
        unint64_t v33 = *(void *)&v4[v32];
        if (v33 == -1 || v33 >= *(void *)&v4[*v7]) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
        *(void *)&v4[v32] = v33 + 1;
        v21 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0) {
          goto LABEL_59;
        }
        v30 += 7;
        BOOL v16 = v31++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_61:
      if (v21 >= 3) {
        LODWORD(v21) = 0;
      }
      uint64_t v38 = 28;
LABEL_64:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_67:
  }
    v39 = 0;
  else {
LABEL_68:
  }
    v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSensitiveContentAnalysisMediaAnalysisContentTypeAsString([(BMSensitiveContentAnalysisMediaAnalysis *)self contentType]);
  id v5 = BMSensitiveContentAnalysisMediaAnalysisAgeGroupAsString([(BMSensitiveContentAnalysisMediaAnalysis *)self ageGroup]);
  int v6 = BMSensitiveContentAnalysisMediaAnalysisIsSensitiveAsString([(BMSensitiveContentAnalysisMediaAnalysis *)self isSensitive]);
  id v7 = [(BMSensitiveContentAnalysisMediaAnalysis *)self clientBundleID];
  uint64_t v8 = [(BMSensitiveContentAnalysisMediaAnalysis *)self trackingVersion];
  v9 = (void *)[v3 initWithFormat:@"BMSensitiveContentAnalysisMediaAnalysis with contentType: %@, ageGroup: %@, isSensitive: %@, clientBundleID: %@, trackingVersion: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSensitiveContentAnalysisMediaAnalysis)initWithContentType:(int)a3 ageGroup:(int)a4 isSensitive:(int)a5 clientBundleID:(id)a6 trackingVersion:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)BMSensitiveContentAnalysisMediaAnalysis;
  char v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v15->_contentType = a3;
    v15->_ageGroup = a4;
    v15->_isSensitive = a5;
    objc_storeStrong((id *)&v15->_clientBundleID, a6);
    objc_storeStrong((id *)&v15->_trackingVersion, a7);
  }

  return v15;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentType" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"ageGroup", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSensitive" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientBundleID" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"trackingVersion" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF45D8;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ageGroup" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSensitive" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientBundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"trackingVersion" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSensitiveContentAnalysisMediaAnalysis alloc] initByReadFrom:v7];
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