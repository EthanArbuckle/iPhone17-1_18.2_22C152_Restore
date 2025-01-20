@interface BMSafariAutoPlay
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariAutoPlay)initWithDomain:(id)a3 visited:(id)a4 signal:(int)a5 countryCode:(id)a6;
- (BMSafariAutoPlay)initWithDomain:(id)a3 visited:(id)a4 signal:(int)a5 countryCode:(id)a6 privacyProxy:(id)a7;
- (BMSafariAutoPlay)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasPrivacyProxy;
- (BOOL)isEqual:(id)a3;
- (BOOL)privacyProxy;
- (NSDate)visited;
- (NSString)countryCode;
- (NSString)description;
- (NSString)domain;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)signal;
- (unsigned)dataVersion;
- (void)setHasPrivacyProxy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariAutoPlay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setHasPrivacyProxy:(BOOL)a3
{
  self->_hasPrivacyProxy = a3;
}

- (BOOL)hasPrivacyProxy
{
  return self->_hasPrivacyProxy;
}

- (BOOL)privacyProxy
{
  return self->_privacyProxy;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int)signal
{
  return self->_signal;
}

- (NSString)domain
{
  return self->_domain;
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
    v6 = [(BMSafariAutoPlay *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariAutoPlay *)self domain];
      v10 = [v5 domain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMSafariAutoPlay *)self visited];
    uint64_t v14 = [v5 visited];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariAutoPlay *)self visited];
      v17 = [v5 visited];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    int v19 = [(BMSafariAutoPlay *)self signal];
    if (v19 == [v5 signal])
    {
      v20 = [(BMSafariAutoPlay *)self countryCode];
      uint64_t v21 = [v5 countryCode];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMSafariAutoPlay *)self countryCode];
        v24 = [v5 countryCode];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_21;
        }
      }
      if (![(BMSafariAutoPlay *)self hasPrivacyProxy]
        && ![v5 hasPrivacyProxy])
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if ([(BMSafariAutoPlay *)self hasPrivacyProxy]
        && [v5 hasPrivacyProxy])
      {
        BOOL v26 = [(BMSafariAutoPlay *)self privacyProxy];
        int v12 = v26 ^ [v5 privacyProxy] ^ 1;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
}

- (NSDate)visited
{
  if (self->_hasRaw_visited)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_visited];
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
  v25[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariAutoPlay *)self domain];
  id v4 = [(BMSafariAutoPlay *)self visited];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMSafariAutoPlay *)self visited];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariAutoPlay signal](self, "signal"));
  v9 = [(BMSafariAutoPlay *)self countryCode];
  if ([(BMSafariAutoPlay *)self hasPrivacyProxy])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariAutoPlay privacyProxy](self, "privacyProxy"));
  }
  else
  {
    v10 = 0;
  }
  v20 = @"domain";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v11;
  v25[0] = v11;
  uint64_t v21 = @"visited";
  int v12 = v7;
  if (!v7)
  {
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v20, v21);
  }
  v25[1] = v12;
  v22 = @"signal";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v13;
  v23 = @"countryCode";
  uint64_t v14 = v9;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v14;
  v24 = @"privacyProxy";
  v15 = v10;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v9)
    {
LABEL_19:
      if (v8) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v8)
  {
LABEL_20:
    if (v7) {
      goto LABEL_21;
    }
LABEL_28:

    if (v3) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:

  if (!v7) {
    goto LABEL_28;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_29:

LABEL_22:

  return v16;
}

- (BMSafariAutoPlay)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"domain"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v41 = 0;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"visited"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v10 = v8;
        id v11 = [v9 alloc];
        [v10 doubleValue];
        double v13 = v12;

        uint64_t v14 = (id *)[v11 initWithTimeIntervalSince1970:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v38 = [v19 dateFromString:v8];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v18 = 0;
            goto LABEL_44;
          }
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          v40 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"visited"];
          v49 = v40;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          uint64_t v18 = 0;
          *a4 = (id)[v33 initWithDomain:v34 code:2 userInfo:v20];
          a4 = 0;
          goto LABEL_43;
        }
        uint64_t v14 = v8;
      }
      v38 = v14;
    }
    else
    {
      v38 = 0;
    }
LABEL_16:
    v20 = [v6 objectForKeyedSubscript:@"signal"];
    v39 = v7;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v40 = 0;
            uint64_t v18 = 0;
            a4 = v38;
            goto LABEL_43;
          }
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v32 = *MEMORY[0x1E4F502C8];
          uint64_t v46 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"signal"];
          id v47 = v23;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          v40 = 0;
          uint64_t v18 = 0;
          *a4 = (id)[v31 initWithDomain:v32 code:2 userInfo:v22];
          goto LABEL_52;
        }
        id v21 = [NSNumber numberWithInt:BMSafariAutoPlayAutoPlaySignalFromString(v20)];
      }
      v40 = v21;
    }
    else
    {
      v40 = 0;
    }
    v22 = [v6 objectForKeyedSubscript:@"countryCode"];
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v23 = 0;
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
LABEL_27:
      v24 = [v6 objectForKeyedSubscript:@"privacyProxy"];
      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v25 = 0;
LABEL_30:
        a4 = v38;
        uint64_t v18 = -[BMSafariAutoPlay initWithDomain:visited:signal:countryCode:privacyProxy:](self, "initWithDomain:visited:signal:countryCode:privacyProxy:", v41, v38, [v40 intValue], v23, v25);
        self = v18;
LABEL_41:

LABEL_42:
        uint64_t v7 = v39;
LABEL_43:

        goto LABEL_44;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v24;
        goto LABEL_30;
      }
      if (a4)
      {
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"privacyProxy"];
        v43 = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        *a4 = (id)[v37 initWithDomain:v35 code:2 userInfo:v29];
      }
      id v25 = 0;
      uint64_t v18 = 0;
LABEL_40:
      a4 = v38;
      goto LABEL_41;
    }
    if (a4)
    {
      id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v26 = *MEMORY[0x1E4F502C8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"countryCode"];
      id v45 = v25;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v27 = (id)[v36 initWithDomain:v26 code:2 userInfo:v24];
      uint64_t v18 = 0;
      id v23 = 0;
      *a4 = v27;
      goto LABEL_40;
    }
    id v23 = 0;
    uint64_t v18 = 0;
LABEL_52:
    a4 = v38;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v41 = 0;
    uint64_t v18 = 0;
    goto LABEL_45;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  v17 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
  v51[0] = v17;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  id v41 = 0;
  uint64_t v18 = 0;
  *a4 = (id)[v15 initWithDomain:v16 code:2 userInfo:v8];
  a4 = v17;
LABEL_44:

LABEL_45:
  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariAutoPlay *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_visited) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasPrivacyProxy) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMSafariAutoPlay;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_57;
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_34;
        case 2u:
          v5->_hasRaw_visited = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            double v24 = *(double *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v24 = 0.0;
          }
          v5->_raw_visited = v24;
          continue;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
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
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_45:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          v5->_signal = v27;
          continue;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
LABEL_34:
          uint64_t v32 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasPrivacyProxy = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_56;
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
          goto LABEL_49;
        }
        v33 += 7;
        BOOL v17 = v34++ >= 9;
        if (v17)
        {
          uint64_t v35 = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8]) {
        uint64_t v35 = 0;
      }
LABEL_51:
      v5->_privacyProxy = v35 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_56:
  }
    v40 = 0;
  else {
LABEL_57:
  }
    v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariAutoPlay *)self domain];
  id v5 = [(BMSafariAutoPlay *)self visited];
  id v6 = BMSafariAutoPlayAutoPlaySignalAsString([(BMSafariAutoPlay *)self signal]);
  uint64_t v7 = [(BMSafariAutoPlay *)self countryCode];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariAutoPlay privacyProxy](self, "privacyProxy"));
  v9 = (void *)[v3 initWithFormat:@"BMSafariAutoPlay with domain: %@, visited: %@, signal: %@, countryCode: %@, privacyProxy: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSafariAutoPlay)initWithDomain:(id)a3 visited:(id)a4 signal:(int)a5 countryCode:(id)a6 privacyProxy:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSafariAutoPlay;
  BOOL v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_domain, a3);
    if (v14)
    {
      v17->_hasRaw_visited = 1;
      [v14 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_visited = 0;
      double v18 = -1.0;
    }
    v17->_raw_visited = v18;
    v17->_signal = a5;
    objc_storeStrong((id *)&v17->_countryCode, a6);
    if (v16)
    {
      v17->_hasPrivacyProxy = 1;
      v17->_privacyProxy = [v16 BOOLValue];
    }
    else
    {
      v17->_hasPrivacyProxy = 0;
      v17->_privacyProxy = 0;
    }
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"visited", 2, 0, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"signal" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"privacyProxy" number:5 type:12 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3C90;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visited" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"signal" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"privacyProxy" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMSafariAutoPlay alloc] initByReadFrom:v7];
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

- (BMSafariAutoPlay)initWithDomain:(id)a3 visited:(id)a4 signal:(int)a5 countryCode:(id)a6
{
  return [(BMSafariAutoPlay *)self initWithDomain:a3 visited:a4 signal:*(void *)&a5 countryCode:a6 privacyProxy:&unk_1F0BF7D40];
}

@end