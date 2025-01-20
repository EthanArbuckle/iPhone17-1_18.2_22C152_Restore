@interface BMSiriService
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriService)initWithDismissalReason:(int)a3 unintended:(id)a4 requestSource:(int)a5;
- (BMSiriService)initWithDismissalReason:(int)a3 unintended:(id)a4 requestSource:(int)a5 identifier:(id)a6 domain:(id)a7 command:(id)a8;
- (BMSiriService)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasUnintended;
- (BOOL)isEqual:(id)a3;
- (BOOL)unintended;
- (NSString)command;
- (NSString)description;
- (NSString)domain;
- (NSString)identifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)dismissalReason;
- (int)requestSource;
- (unsigned)dataVersion;
- (void)setHasUnintended:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriService

- (BMSiriService)initWithDismissalReason:(int)a3 unintended:(id)a4 requestSource:(int)a5
{
  return [(BMSiriService *)self initWithDismissalReason:*(void *)&a3 unintended:a4 requestSource:*(void *)&a5 identifier:0 domain:0 command:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)command
{
  return self->_command;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)requestSource
{
  return self->_requestSource;
}

- (void)setHasUnintended:(BOOL)a3
{
  self->_hasUnintended = a3;
}

- (BOOL)hasUnintended
{
  return self->_hasUnintended;
}

- (BOOL)unintended
{
  return self->_unintended;
}

- (int)dismissalReason
{
  return self->_dismissalReason;
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
    int v6 = [(BMSiriService *)self dismissalReason];
    if (v6 != [v5 dismissalReason]) {
      goto LABEL_16;
    }
    if (-[BMSiriService hasUnintended](self, "hasUnintended") || [v5 hasUnintended])
    {
      if (![(BMSiriService *)self hasUnintended]) {
        goto LABEL_16;
      }
      if (![v5 hasUnintended]) {
        goto LABEL_16;
      }
      int v7 = [(BMSiriService *)self unintended];
      if (v7 != [v5 unintended]) {
        goto LABEL_16;
      }
    }
    int v8 = [(BMSiriService *)self requestSource];
    if (v8 != [v5 requestSource]) {
      goto LABEL_16;
    }
    v9 = [(BMSiriService *)self identifier];
    uint64_t v10 = [v5 identifier];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = [(BMSiriService *)self identifier];
      v13 = [v5 identifier];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_16;
      }
    }
    v16 = [(BMSiriService *)self domain];
    uint64_t v17 = [v5 domain];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMSiriService *)self domain];
      v20 = [v5 domain];
      int v21 = [v19 isEqual:v20];

      if (!v21)
      {
LABEL_16:
        char v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    v23 = [(BMSiriService *)self command];
    v24 = [v5 command];
    if (v23 == v24)
    {
      char v15 = 1;
    }
    else
    {
      v25 = [(BMSiriService *)self command];
      v26 = [v5 command];
      char v15 = [v25 isEqual:v26];
    }
    goto LABEL_17;
  }
  char v15 = 0;
LABEL_18:

  return v15;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriService dismissalReason](self, "dismissalReason"));
  if ([(BMSiriService *)self hasUnintended])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriService unintended](self, "unintended"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriService requestSource](self, "requestSource"));
  int v6 = [(BMSiriService *)self identifier];
  int v7 = [(BMSiriService *)self domain];
  int v8 = [(BMSiriService *)self command];
  v21[0] = @"dismissalReason";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = @"unintended";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"requestSource";
  v11 = v5;
  if (!v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"identifier";
  v12 = v6;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"domain";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"command";
  int v14 = v8;
  if (!v8)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  char v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_18;
    }
LABEL_26:

    if (v6) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v7) {
    goto LABEL_26;
  }
LABEL_18:
  if (v6) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:
  if (v5)
  {
    if (v4) {
      goto LABEL_21;
    }
LABEL_29:

    if (v20) {
      goto LABEL_22;
    }
    goto LABEL_30;
  }

  if (!v4) {
    goto LABEL_29;
  }
LABEL_21:
  if (v20) {
    goto LABEL_22;
  }
LABEL_30:

LABEL_22:

  return v15;
}

- (BMSiriService)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"dismissalReason"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v43 = 0;
LABEL_9:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"unintended"];
    v40 = (void *)v9;
    if (v9 && (uint64_t v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v18 = 0;
          goto LABEL_51;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        int v21 = a4;
        id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"unintended"];
        id v53 = v42;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        a4 = 0;
        v18 = 0;
        *int v21 = (id)[v19 initWithDomain:v20 code:2 userInfo:v11];
        goto LABEL_50;
      }
      v39 = v10;
    }
    else
    {
      v39 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"requestSource"];
    v38 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v42 = 0;
            v18 = 0;
            a4 = v39;
            goto LABEL_50;
          }
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v35 = *MEMORY[0x1E4F502C8];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          id v41 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"requestSource"];
          id v51 = v41;
          v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          id v42 = 0;
          v18 = 0;
          *a4 = (id)[v34 initWithDomain:v35 code:2 userInfo:v12];
          goto LABEL_59;
        }
        id v42 = [NSNumber numberWithInt:BMSiriServiceRequestSourceFromString(v11)];
      }
    }
    else
    {
      id v42 = 0;
    }
    v12 = [v6 objectForKeyedSubscript:@"identifier"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v41 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = v12;
LABEL_18:
      v13 = [v6 objectForKeyedSubscript:@"domain"];
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        int v14 = self;
        id v15 = 0;
        goto LABEL_21;
      }
      objc_opt_class();
      int v14 = self;
      if (objc_opt_isKindOfClass())
      {
        id v15 = v13;
LABEL_21:
        v16 = [v6 objectForKeyedSubscript:@"command"];
        if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v17 = 0;
LABEL_24:
          a4 = v39;
          v18 = -[BMSiriService initWithDismissalReason:unintended:requestSource:identifier:domain:command:](v14, "initWithDismissalReason:unintended:requestSource:identifier:domain:command:", [v43 intValue], v39, objc_msgSend(v42, "intValue"), v41, v15, v17);
          int v14 = v18;
LABEL_47:

LABEL_48:
          self = v14;
LABEL_49:

          int v7 = v38;
LABEL_50:

          uint64_t v10 = v40;
          goto LABEL_51;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          goto LABEL_24;
        }
        if (a4)
        {
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v44 = *MEMORY[0x1E4F28568];
          v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"command"];
          v45 = v28;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          *a4 = (id)[v37 initWithDomain:v36 code:2 userInfo:v29];
        }
        id v17 = 0;
        v18 = 0;
LABEL_46:
        a4 = v39;
        goto LABEL_47;
      }
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
        id v47 = v17;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v16];
        v18 = 0;
        id v15 = 0;
        *a4 = v27;
        goto LABEL_46;
      }
      id v15 = 0;
      v18 = 0;
LABEL_61:
      a4 = v39;
      goto LABEL_48;
    }
    if (a4)
    {
      int v14 = self;
      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v23 = *MEMORY[0x1E4F502C8];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
      id v49 = v15;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v13];
      v18 = 0;
      id v41 = 0;
      *a4 = v24;
      goto LABEL_61;
    }
    id v41 = 0;
    v18 = 0;
LABEL_59:
    a4 = v39;
    goto LABEL_49;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_8:
    v43 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMSiriServiceDismissalReasonFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v43 = 0;
    v18 = 0;
    goto LABEL_52;
  }
  id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v32 = *MEMORY[0x1E4F502C8];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  v33 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"dismissalReason"];
  v55[0] = v33;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
  v43 = 0;
  v18 = 0;
  *a4 = (id)[v31 initWithDomain:v32 code:2 userInfo:v10];
  a4 = v33;
LABEL_51:

LABEL_52:
  return v18;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriService *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasUnintended) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_command)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMSiriService;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_67;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
              goto LABEL_48;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_50;
            }
          }
          v4[*v8] = 1;
LABEL_48:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_50:
          if (v21 >= 0x36) {
            LODWORD(v21) = 0;
          }
          uint64_t v39 = 24;
          goto LABEL_63;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasUnintended = 1;
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
              char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  uint64_t v27 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
LABEL_56:
          v5->_unintended = v27 != 0;
          continue;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v21 = 0;
          break;
        case 4u:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 32;
          goto LABEL_46;
        case 5u:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 40;
          goto LABEL_46;
        case 6u:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 48;
LABEL_46:
          v38 = *(Class *)((char *)&v5->super.super.isa + v37);
          *(Class *)((char *)&v5->super.super.isa + v37) = (Class)v36;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_66;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v6;
        unint64_t v34 = *(void *)&v4[v33];
        if (v34 == -1 || v34 >= *(void *)&v4[*v7]) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
        *(void *)&v4[v33] = v34 + 1;
        v21 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0) {
          goto LABEL_58;
        }
        v31 += 7;
        BOOL v16 = v32++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_60;
        }
      }
      v4[*v8] = 1;
LABEL_58:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_60:
      if (v21 >= 0x2D) {
        LODWORD(v21) = 0;
      }
      uint64_t v39 = 28;
LABEL_63:
      *(_DWORD *)((char *)&v5->super.super.isa + v39) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_66:
  }
    v40 = 0;
  else {
LABEL_67:
  }
    v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSiriServiceDismissalReasonAsString([(BMSiriService *)self dismissalReason]);
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriService unintended](self, "unintended"));
  id v6 = BMSiriServiceRequestSourceAsString([(BMSiriService *)self requestSource]);
  int v7 = [(BMSiriService *)self identifier];
  id v8 = [(BMSiriService *)self domain];
  uint64_t v9 = [(BMSiriService *)self command];
  char v10 = (void *)[v3 initWithFormat:@"BMSiriService with dismissalReason: %@, unintended: %@, requestSource: %@, identifier: %@, domain: %@, command: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriService)initWithDismissalReason:(int)a3 unintended:(id)a4 requestSource:(int)a5 identifier:(id)a6 domain:(id)a7 command:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriService;
  v18 = [(BMEventBase *)&v20 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v18->_dismissalReason = a3;
    if (v14)
    {
      v18->_hasUnintended = 1;
      v18->_unintended = [v14 BOOLValue];
    }
    else
    {
      v18->_hasUnintended = 0;
      v18->_unintended = 0;
    }
    v18->_requestSource = a5;
    objc_storeStrong((id *)&v18->_identifier, a6);
    objc_storeStrong((id *)&v18->_domain, a7);
    objc_storeStrong((id *)&v18->_command, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dismissalReason" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"unintended" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestSource" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"command" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7218;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dismissalReason" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"unintended" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestSource" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"command" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriService alloc] initByReadFrom:v7];
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