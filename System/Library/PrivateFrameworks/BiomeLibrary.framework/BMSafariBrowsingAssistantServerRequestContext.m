@interface BMSafariBrowsingAssistantServerRequestContext
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantServerRequestContext)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistantServerRequestContext)initWithWebpageViewIdentifier:(id)a3 requestIdentifier:(id)a4 started:(id)a5 ended:(id)a6 failed:(id)a7;
- (BMSafariBrowsingAssistantServerRequestContextEnded)ended;
- (BMSafariBrowsingAssistantServerRequestContextFailed)failed;
- (BMSafariBrowsingAssistantServerRequestContextStarted)started;
- (BOOL)isEqual:(id)a3;
- (NSData)webpageViewIdentifier;
- (NSString)description;
- (NSString)requestIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantServerRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_started, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_webpageViewIdentifier, 0);
}

- (BMSafariBrowsingAssistantServerRequestContextFailed)failed
{
  return self->_failed;
}

- (BMSafariBrowsingAssistantServerRequestContextEnded)ended
{
  return self->_ended;
}

- (BMSafariBrowsingAssistantServerRequestContextStarted)started
{
  return self->_started;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSData)webpageViewIdentifier
{
  return self->_webpageViewIdentifier;
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
    v6 = [(BMSafariBrowsingAssistantServerRequestContext *)self webpageViewIdentifier];
    uint64_t v7 = [v5 webpageViewIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistantServerRequestContext *)self webpageViewIdentifier];
      v10 = [v5 webpageViewIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMSafariBrowsingAssistantServerRequestContext *)self requestIdentifier];
    uint64_t v14 = [v5 requestIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariBrowsingAssistantServerRequestContext *)self requestIdentifier];
      v17 = [v5 requestIdentifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMSafariBrowsingAssistantServerRequestContext *)self started];
    uint64_t v20 = [v5 started];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSafariBrowsingAssistantServerRequestContext *)self started];
      v23 = [v5 started];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMSafariBrowsingAssistantServerRequestContext *)self ended];
    uint64_t v26 = [v5 ended];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSafariBrowsingAssistantServerRequestContext *)self ended];
      v29 = [v5 ended];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMSafariBrowsingAssistantServerRequestContext *)self failed];
    v32 = [v5 failed];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMSafariBrowsingAssistantServerRequestContext *)self failed];
      v34 = [v5 failed];
      char v12 = [v33 isEqual:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (id)jsonDictionary
{
  v26[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariBrowsingAssistantServerRequestContext *)self webpageViewIdentifier];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  id v5 = [(BMSafariBrowsingAssistantServerRequestContext *)self requestIdentifier];
  v6 = [(BMSafariBrowsingAssistantServerRequestContext *)self started];
  uint64_t v7 = [v6 jsonDictionary];

  v8 = [(BMSafariBrowsingAssistantServerRequestContext *)self ended];
  v9 = [v8 jsonDictionary];

  v10 = [(BMSafariBrowsingAssistantServerRequestContext *)self failed];
  int v11 = [v10 jsonDictionary];

  v21 = @"webpageViewIdentifier";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v12;
  v26[0] = v12;
  v22 = @"requestIdentifier";
  v13 = v5;
  if (!v5)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12, v21, v22);
  }
  v26[1] = v13;
  v23 = @"started";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[2] = v14;
  int v24 = @"ended";
  v15 = v9;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[3] = v15;
  v25 = @"failed";
  v16 = v11;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v21, 5, v19);
  if (v11)
  {
    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v9)
    {
LABEL_13:
      if (v7) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v7)
  {
LABEL_14:
    if (v5) {
      goto LABEL_15;
    }
LABEL_22:

    if (v4) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v5) {
    goto LABEL_22;
  }
LABEL_15:
  if (v4) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v17;
}

- (BMSafariBrowsingAssistantServerRequestContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"webpageViewIdentifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"requestIdentifier"];
    v49 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v20 = 0;
          v17 = 0;
          goto LABEL_53;
        }
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        v27 = self;
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requestIdentifier"];
        id v62 = v18;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        uint64_t v30 = v28;
        self = v27;
        v51 = (BMSafariBrowsingAssistantServerRequestContextStarted *)v29;
        v17 = 0;
        uint64_t v20 = 0;
        id *v49 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v30, 2);
        goto LABEL_51;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"started"];
    id v50 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v49)
        {
          v17 = 0;
          uint64_t v20 = v10;
          goto LABEL_52;
        }
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v59 = *MEMORY[0x1E4F28568];
        id v33 = v8;
        v34 = self;
        id v35 = [NSString alloc];
        uint64_t v40 = objc_opt_class();
        v36 = v35;
        self = v34;
        id v8 = v33;
        v51 = (BMSafariBrowsingAssistantServerRequestContextStarted *)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v40, @"started"];
        v60 = v51;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        id *v49 = (id)[v48 initWithDomain:v44 code:2 userInfo:v37];

        v17 = 0;
        id v18 = v11;
        goto LABEL_50;
      }
      id v18 = v11;
      id v54 = 0;
      v51 = [[BMSafariBrowsingAssistantServerRequestContextStarted alloc] initWithJSONDictionary:v18 error:&v54];
      id v19 = v54;
      uint64_t v20 = v50;
      if (v19)
      {
        v21 = v19;
        if (v49) {
          id *v49 = v19;
        }

        v17 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      v51 = 0;
    }
    id v47 = v8;
    uint64_t v12 = [v6 objectForKeyedSubscript:@"ended"];
    v13 = self;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v49)
        {
          v17 = 0;
          goto LABEL_49;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        uint64_t v14 = (BMSafariBrowsingAssistantServerRequestContextEnded *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"ended"];
        v58 = v14;
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        v17 = 0;
        id *v49 = (id)[v45 initWithDomain:v41 code:2 userInfo:v15];
LABEL_48:

LABEL_49:
        id v18 = v11;
        self = v13;
        id v8 = v47;
LABEL_50:
        uint64_t v20 = v50;
LABEL_51:

        int v11 = v18;
LABEL_52:

        goto LABEL_53;
      }
      id v15 = v12;
      id v53 = 0;
      uint64_t v14 = [[BMSafariBrowsingAssistantServerRequestContextEnded alloc] initWithJSONDictionary:v15 error:&v53];
      id v22 = v53;
      if (v22)
      {
        v23 = v22;
        if (v49) {
          id *v49 = v22;
        }

        goto LABEL_55;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v15 = [v6 objectForKeyedSubscript:@"failed"];
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = 0;
LABEL_16:
      v17 = [(BMSafariBrowsingAssistantServerRequestContext *)v13 initWithWebpageViewIdentifier:v47 requestIdentifier:v50 started:v51 ended:v14 failed:v16];
      v13 = v17;
LABEL_47:

      goto LABEL_48;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v52 = 0;
      id v43 = v15;
      v16 = [[BMSafariBrowsingAssistantServerRequestContextFailed alloc] initWithJSONDictionary:v43 error:&v52];
      id v31 = v52;
      if (!v31)
      {

        goto LABEL_16;
      }
      v32 = v31;
      if (v49) {
        id *v49 = v31;
      }

LABEL_46:
      v17 = 0;
      goto LABEL_47;
    }
    if (v49)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v16 = (BMSafariBrowsingAssistantServerRequestContextFailed *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"failed"];
      v56 = v16;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      id *v49 = (id)[v46 initWithDomain:v42 code:2 userInfo:v38];

      goto LABEL_46;
    }
LABEL_55:
    v17 = 0;
    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    id v8 = 0;
    goto LABEL_54;
  }
  id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v25 = *MEMORY[0x1E4F502C8];
  uint64_t v63 = *MEMORY[0x1E4F28568];
  uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"webpageViewIdentifier"];
  v64[0] = v20;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
  v17 = 0;
  id v8 = 0;
  *a4 = (id)[v24 initWithDomain:v25 code:2 userInfo:v9];
LABEL_53:

LABEL_54:
  return v17;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantServerRequestContext *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_webpageViewIdentifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_requestIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_started)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantServerRequestContextStarted *)self->_started writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_ended)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantServerRequestContextEnded *)self->_ended writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_failed)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantServerRequestContextFailed *)self->_failed writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariBrowsingAssistantServerRequestContext;
  id v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_38;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
        if (v11++ >= 9)
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
          uint64_t v19 = PBReaderReadData();
          uint64_t v20 = 24;
          goto LABEL_24;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
LABEL_24:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        case 3u:
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_37;
          }
          id v22 = [[BMSafariBrowsingAssistantServerRequestContextStarted alloc] initByReadFrom:v4];
          if (!v22) {
            goto LABEL_37;
          }
          uint64_t v23 = 40;
          goto LABEL_34;
        case 4u:
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_37;
          }
          id v22 = [[BMSafariBrowsingAssistantServerRequestContextEnded alloc] initByReadFrom:v4];
          if (!v22) {
            goto LABEL_37;
          }
          uint64_t v23 = 48;
          goto LABEL_34;
        case 5u:
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_37;
          }
          id v22 = [[BMSafariBrowsingAssistantServerRequestContextFailed alloc] initByReadFrom:v4];
          if (!v22) {
            goto LABEL_37;
          }
          uint64_t v23 = 56;
LABEL_34:
          id v24 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = v22;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_37;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_37:
  }
    uint64_t v25 = 0;
  else {
LABEL_38:
  }
    uint64_t v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariBrowsingAssistantServerRequestContext *)self webpageViewIdentifier];
  id v5 = [(BMSafariBrowsingAssistantServerRequestContext *)self requestIdentifier];
  id v6 = [(BMSafariBrowsingAssistantServerRequestContext *)self started];
  uint64_t v7 = [(BMSafariBrowsingAssistantServerRequestContext *)self ended];
  id v8 = [(BMSafariBrowsingAssistantServerRequestContext *)self failed];
  v9 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantServerRequestContext with webpageViewIdentifier: %@, requestIdentifier: %@, started: %@, ended: %@, failed: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSafariBrowsingAssistantServerRequestContext)initWithWebpageViewIdentifier:(id)a3 requestIdentifier:(id)a4 started:(id)a5 ended:(id)a6 failed:(id)a7
{
  id v19 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSafariBrowsingAssistantServerRequestContext;
  int v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v17->_requestIdentifier, a4);
    objc_storeStrong((id *)&v17->_started, a5);
    objc_storeStrong((id *)&v17->_ended, a6);
    objc_storeStrong((id *)&v17->_failed, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webpageViewIdentifier" number:1 type:14 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"requestIdentifier", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"started" number:3 type:14 subMessageClass:objc_opt_class()];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ended" number:4 type:14 subMessageClass:objc_opt_class()];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"failed" number:5 type:14 subMessageClass:objc_opt_class()];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5688;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"webpageViewIdentifier" dataType:4 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"started_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_711];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"ended_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_713];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"failed_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_715];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __56__BMSafariBrowsingAssistantServerRequestContext_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 failed];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __56__BMSafariBrowsingAssistantServerRequestContext_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 ended];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __56__BMSafariBrowsingAssistantServerRequestContext_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 started];
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

    id v8 = [[BMSafariBrowsingAssistantServerRequestContext alloc] initByReadFrom:v7];
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