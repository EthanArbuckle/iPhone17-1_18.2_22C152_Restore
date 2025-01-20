@interface BMMailRecategorization
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMailRecategorization)initWithCategory:(int)a3 previous:(int)a4 scope:(int)a5 sender:(id)a6 domain:(id)a7 language:(id)a8;
- (BMMailRecategorization)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)domain;
- (NSString)language;
- (NSString)sender;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)category;
- (int)previous;
- (int)scope;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMailRecategorization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

- (NSString)language
{
  return self->_language;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)sender
{
  return self->_sender;
}

- (int)scope
{
  return self->_scope;
}

- (int)previous
{
  return self->_previous;
}

- (int)category
{
  return self->_category;
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
    int v6 = [(BMMailRecategorization *)self category];
    if (v6 != [v5 category]) {
      goto LABEL_12;
    }
    int v7 = [(BMMailRecategorization *)self previous];
    if (v7 != [v5 previous]) {
      goto LABEL_12;
    }
    int v8 = [(BMMailRecategorization *)self scope];
    if (v8 != [v5 scope]) {
      goto LABEL_12;
    }
    v9 = [(BMMailRecategorization *)self sender];
    uint64_t v10 = [v5 sender];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = [(BMMailRecategorization *)self sender];
      v13 = [v5 sender];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_12;
      }
    }
    v16 = [(BMMailRecategorization *)self domain];
    uint64_t v17 = [v5 domain];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMMailRecategorization *)self domain];
      v20 = [v5 domain];
      int v21 = [v19 isEqual:v20];

      if (!v21)
      {
LABEL_12:
        char v15 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    v23 = [(BMMailRecategorization *)self language];
    v24 = [v5 language];
    if (v23 == v24)
    {
      char v15 = 1;
    }
    else
    {
      v25 = [(BMMailRecategorization *)self language];
      v26 = [v5 language];
      char v15 = [v25 isEqual:v26];
    }
    goto LABEL_13;
  }
  char v15 = 0;
LABEL_14:

  return v15;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailRecategorization category](self, "category"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailRecategorization previous](self, "previous"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailRecategorization scope](self, "scope"));
  int v6 = [(BMMailRecategorization *)self sender];
  int v7 = [(BMMailRecategorization *)self domain];
  int v8 = [(BMMailRecategorization *)self language];
  v21[0] = @"category";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = @"previous";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"scope";
  v11 = v5;
  if (!v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"sender";
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
  v21[5] = @"language";
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
      goto LABEL_15;
    }
LABEL_23:

    if (v6) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }

  if (!v7) {
    goto LABEL_23;
  }
LABEL_15:
  if (v6) {
    goto LABEL_16;
  }
LABEL_24:

LABEL_16:
  if (v5)
  {
    if (v4) {
      goto LABEL_18;
    }
LABEL_26:

    if (v20) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }

  if (!v4) {
    goto LABEL_26;
  }
LABEL_18:
  if (v20) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v15;
}

- (BMMailRecategorization)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"category"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v41 = 0;
          v19 = 0;
          v18 = self;
          goto LABEL_54;
        }
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v43 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"category"];
        v55[0] = v43;
        int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
        v41 = 0;
        v19 = 0;
        *a4 = (id)[v29 initWithDomain:v30 code:2 userInfo:v8];
        goto LABEL_67;
      }
      id v7 = [NSNumber numberWithInt:BMMailRecategorizationCategoryFromString(v5)];
    }
    int v6 = v7;
  }
  else
  {
    int v6 = 0;
  }
  int v8 = [v4 objectForKeyedSubscript:@"previous"];
  v41 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
LABEL_16:
        v43 = v9;
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [NSNumber numberWithInt:BMMailRecategorizationCategoryFromString(v8)];
        goto LABEL_16;
      }
      if (a4)
      {
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        v42 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"previous"];
        v53 = v42;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        v43 = 0;
        v19 = 0;
        *a4 = (id)[v31 initWithDomain:v32 code:2 userInfo:v10];
        goto LABEL_69;
      }
      v43 = 0;
      v19 = 0;
LABEL_67:
      v18 = self;
      goto LABEL_53;
    }
  }
  v43 = 0;
LABEL_17:
  uint64_t v10 = [v4 objectForKeyedSubscript:@"scope"];
  v39 = v8;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
LABEL_24:
        v42 = v11;
        goto LABEL_25;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [NSNumber numberWithInt:BMMailRecategorizationScopeFromString(v10)];
        goto LABEL_24;
      }
      if (a4)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"scope"];
        id v51 = v13;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        v42 = 0;
        v19 = 0;
        *a4 = (id)[v33 initWithDomain:v34 code:2 userInfo:v12];
        goto LABEL_62;
      }
      v42 = 0;
      v19 = 0;
LABEL_69:
      v18 = self;
      goto LABEL_52;
    }
  }
  v42 = 0;
LABEL_25:
  v12 = [v4 objectForKeyedSubscript:@"sender"];
  v37 = v5;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        goto LABEL_28;
      }
      if (a4)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sender"];
        id v49 = v15;
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        id v22 = (id)[v20 initWithDomain:v21 code:2 userInfo:v14];
        v19 = 0;
        id v13 = 0;
        *a4 = v22;
        goto LABEL_64;
      }
      id v13 = 0;
      v19 = 0;
LABEL_62:
      v18 = self;
      goto LABEL_51;
    }
  }
  id v13 = 0;
LABEL_28:
  int v14 = [v4 objectForKeyedSubscript:@"domain"];
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        goto LABEL_31;
      }
      if (a4)
      {
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
        id v47 = v17;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id v25 = (id)[v23 initWithDomain:v24 code:2 userInfo:v16];
        v19 = 0;
        id v15 = 0;
        *a4 = v25;
        goto LABEL_48;
      }
      id v15 = 0;
      v19 = 0;
LABEL_64:
      v18 = self;
      goto LABEL_50;
    }
  }
  id v15 = 0;
LABEL_31:
  v16 = [v4 objectForKeyedSubscript:@"language"];
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        goto LABEL_34;
      }
      if (a4)
      {
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"language"];
        v45 = v26;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        *a4 = (id)[v36 initWithDomain:v35 code:2 userInfo:v27];
      }
      id v17 = 0;
      v19 = 0;
LABEL_48:
      v18 = self;
      goto LABEL_49;
    }
  }
  id v17 = 0;
LABEL_34:
  v18 = -[BMMailRecategorization initWithCategory:previous:scope:sender:domain:language:](self, "initWithCategory:previous:scope:sender:domain:language:", [v6 intValue], objc_msgSend(v43, "intValue"), objc_msgSend(v42, "intValue"), v13, v15, v17);
  v19 = v18;
LABEL_49:

LABEL_50:
  id v5 = v37;
LABEL_51:

  int v8 = v39;
LABEL_52:

LABEL_53:
LABEL_54:

  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMailRecategorization *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_sender) {
    PBDataWriterWriteStringField();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMMailRecategorization;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_69;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
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
          if (v21 >= 7) {
            LODWORD(v21) = 0;
          }
          uint64_t v38 = 20;
          goto LABEL_65;
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
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_56:
          if (v21 >= 7) {
            LODWORD(v21) = 0;
          }
          uint64_t v38 = 24;
          goto LABEL_65;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          break;
        case 4u:
          uint64_t v35 = PBReaderReadString();
          uint64_t v36 = 32;
          goto LABEL_46;
        case 5u:
          uint64_t v35 = PBReaderReadString();
          uint64_t v36 = 40;
          goto LABEL_46;
        case 6u:
          uint64_t v35 = PBReaderReadString();
          uint64_t v36 = 48;
LABEL_46:
          v37 = *(Class *)((char *)&v5->super.super.isa + v36);
          *(Class *)((char *)&v5->super.super.isa + v36) = (Class)v35;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_68;
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
          goto LABEL_60;
        }
        v30 += 7;
        BOOL v16 = v31++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_62;
        }
      }
      v4[*v8] = 1;
LABEL_60:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_62:
      if (v21 >= 3) {
        LODWORD(v21) = 0;
      }
      uint64_t v38 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_68:
  }
    v39 = 0;
  else {
LABEL_69:
  }
    v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMailRecategorizationCategoryAsString([(BMMailRecategorization *)self category]);
  id v5 = BMMailRecategorizationCategoryAsString([(BMMailRecategorization *)self previous]);
  int v6 = BMMailRecategorizationScopeAsString([(BMMailRecategorization *)self scope]);
  id v7 = [(BMMailRecategorization *)self sender];
  int v8 = [(BMMailRecategorization *)self domain];
  id v9 = [(BMMailRecategorization *)self language];
  char v10 = (void *)[v3 initWithFormat:@"BMMailRecategorization with category: %@, previous: %@, scope: %@, sender: %@, domain: %@, language: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMMailRecategorization)initWithCategory:(int)a3 previous:(int)a4 scope:(int)a5 sender:(id)a6 domain:(id)a7 language:(id)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BMMailRecategorization;
  v18 = [(BMEventBase *)&v20 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v18->_category = a3;
    v18->_previous = a4;
    v18->_scope = a5;
    objc_storeStrong((id *)&v18->_sender, a6);
    objc_storeStrong((id *)&v18->_domain, a7);
    objc_storeStrong((id *)&v18->_language, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"previous" number:2 type:4 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"scope" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sender" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"language" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5988;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"previous" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"scope" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sender" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"language" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    int v8 = [[BMMailRecategorization alloc] initByReadFrom:v7];
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