@interface BMSafariNavigations
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariNavigations)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 userAgent:(int)a6 countryCode:(id)a7 privacyProxy:(id)a8 error:(int)a9;
- (BMSafariNavigations)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 userAgent:(int)a6 countryCode:(id)a7 privacyProxy:(id)a8 error:(int)a9 url:(id)a10;
- (BMSafariNavigations)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasPrivacyProxy;
- (BOOL)isEqual:(id)a3;
- (BOOL)privacyProxy;
- (NSDate)visited;
- (NSString)countryCode;
- (NSString)description;
- (NSString)domain;
- (NSString)url;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)error;
- (int)platform;
- (int)userAgent;
- (unsigned)dataVersion;
- (void)setHasPrivacyProxy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariNavigations

- (BMSafariNavigations)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 userAgent:(int)a6 countryCode:(id)a7 privacyProxy:(id)a8 error:(int)a9
{
  LODWORD(v10) = a9;
  return [(BMSafariNavigations *)self initWithDomain:a3 visited:a4 platform:*(void *)&a5 userAgent:*(void *)&a6 countryCode:a7 privacyProxy:a8 error:v10 url:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (NSString)url
{
  return self->_url;
}

- (int)error
{
  return self->_error;
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

- (int)userAgent
{
  return self->_userAgent;
}

- (int)platform
{
  return self->_platform;
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
    v6 = [(BMSafariNavigations *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariNavigations *)self domain];
      uint64_t v10 = [v5 domain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
    }
    v13 = [(BMSafariNavigations *)self visited];
    uint64_t v14 = [v5 visited];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariNavigations *)self visited];
      v17 = [v5 visited];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_25;
      }
    }
    int v19 = [(BMSafariNavigations *)self platform];
    if (v19 != [v5 platform]) {
      goto LABEL_25;
    }
    int v20 = [(BMSafariNavigations *)self userAgent];
    if (v20 != [v5 userAgent]) {
      goto LABEL_25;
    }
    v21 = [(BMSafariNavigations *)self countryCode];
    uint64_t v22 = [v5 countryCode];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(BMSafariNavigations *)self countryCode];
      v25 = [v5 countryCode];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_25;
      }
    }
    if (![(BMSafariNavigations *)self hasPrivacyProxy]
      && ![v5 hasPrivacyProxy]
      || [(BMSafariNavigations *)self hasPrivacyProxy]
      && [v5 hasPrivacyProxy]
      && (int v27 = [(BMSafariNavigations *)self privacyProxy],
          v27 == [v5 privacyProxy]))
    {
      int v28 = [(BMSafariNavigations *)self error];
      if (v28 == [v5 error])
      {
        v29 = [(BMSafariNavigations *)self url];
        v30 = [v5 url];
        if (v29 == v30)
        {
          char v12 = 1;
        }
        else
        {
          v31 = [(BMSafariNavigations *)self url];
          v32 = [v5 url];
          char v12 = [v31 isEqual:v32];
        }
        goto LABEL_26;
      }
    }
LABEL_25:
    char v12 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v12 = 0;
LABEL_27:

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
  v31[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSafariNavigations *)self domain];
  id v4 = [(BMSafariNavigations *)self visited];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMSafariNavigations *)self visited];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariNavigations platform](self, "platform"));
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariNavigations userAgent](self, "userAgent"));
  v29 = [(BMSafariNavigations *)self countryCode];
  if ([(BMSafariNavigations *)self hasPrivacyProxy])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariNavigations privacyProxy](self, "privacyProxy"));
  }
  else
  {
    uint64_t v10 = 0;
  }
  int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariNavigations error](self, "error"));
  char v12 = [(BMSafariNavigations *)self url];
  v30[0] = @"domain";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v13;
  v31[0] = v13;
  v30[1] = @"visited";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v14;
  v31[1] = v14;
  v30[2] = @"platform";
  uint64_t v15 = v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v15;
  v31[2] = v15;
  v30[3] = @"userAgent";
  v16 = v9;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v28 = (void *)v3;
  v31[3] = v16;
  v30[4] = @"countryCode";
  v17 = v29;
  if (!v29)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v7;
  int v27 = (void *)v8;
  v31[4] = v17;
  v30[5] = @"privacyProxy";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[5] = v18;
  v30[6] = @"error";
  int v19 = v11;
  if (!v11)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[6] = v19;
  v30[7] = @"url";
  int v20 = v12;
  if (!v12)
  {
    int v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[7] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:8];
  if (v12)
  {
    if (v11) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_25;
    }
  }

LABEL_25:
  if (!v10) {

  }
  if (!v29) {
  if (v9)
  }
  {
    if (v27) {
      goto LABEL_31;
    }
  }
  else
  {

    if (v27)
    {
LABEL_31:
      if (v26) {
        goto LABEL_32;
      }
LABEL_40:

      if (v28) {
        goto LABEL_33;
      }
      goto LABEL_41;
    }
  }

  if (!v26) {
    goto LABEL_40;
  }
LABEL_32:
  if (v28) {
    goto LABEL_33;
  }
LABEL_41:

LABEL_33:

  return v21;
}

- (BMSafariNavigations)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"domain"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    uint64_t v8 = [v5 objectForKeyedSubscript:@"visited"];
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

        id v14 = (id)[v11 initWithTimeIntervalSince1970:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v74 = [v20 dateFromString:v8];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v74 = 0;
            int v19 = 0;
            goto LABEL_64;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          v56 = v8;
          uint64_t v57 = *MEMORY[0x1E4F502C8];
          uint64_t v87 = *MEMORY[0x1E4F28568];
          v73 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"visited"];
          v88 = v73;
          uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          uint64_t v59 = v57;
          uint64_t v8 = v56;
          v69 = (void *)v58;
          v74 = 0;
          int v19 = 0;
          *a4 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v59, 2);
          goto LABEL_63;
        }
        id v14 = v8;
      }
      v74 = v14;
    }
    else
    {
      v74 = 0;
    }
LABEL_16:
    uint64_t v21 = [v5 objectForKeyedSubscript:@"platform"];
    v69 = (void *)v21;
    v67 = v8;
    if (v21 && (uint64_t v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v73 = 0;
            int v19 = 0;
            goto LABEL_63;
          }
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v85 = *MEMORY[0x1E4F28568];
          v72 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"platform"];
          v86 = v72;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          v73 = 0;
          int v19 = 0;
          *a4 = (id)[v47 initWithDomain:v48 code:2 userInfo:v24];
LABEL_62:

          uint64_t v8 = v67;
LABEL_63:

          goto LABEL_64;
        }
        id v23 = [NSNumber numberWithInt:BMSafariNavigationsPlatformFromString(v22)];
      }
      v73 = v23;
    }
    else
    {
      v73 = 0;
    }
    v24 = [v5 objectForKeyedSubscript:@"userAgent"];
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v24;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v72 = 0;
            int v19 = 0;
            goto LABEL_62;
          }
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          v50 = v24;
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v83 = *MEMORY[0x1E4F28568];
          v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userAgent"];
          v84 = v35;
          int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          uint64_t v52 = v51;
          v24 = v50;
          v72 = 0;
          int v19 = 0;
          *a4 = (id)[v49 initWithDomain:v52 code:2 userInfo:v26];
          goto LABEL_61;
        }
        id v25 = [NSNumber numberWithInt:BMSafariNavigationsDeviceClassFromString(v24)];
      }
      v72 = v25;
    }
    else
    {
      v72 = 0;
    }
    int v26 = [v5 objectForKeyedSubscript:@"countryCode"];
    id v71 = v7;
    v66 = v24;
    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          int v19 = 0;
          goto LABEL_61;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v81 = *MEMORY[0x1E4F28568];
        id v70 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"countryCode"];
        id v82 = v70;
        int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        uint64_t v34 = v33;
        v24 = v66;
        v35 = 0;
        int v19 = 0;
        *a4 = (id)[v32 initWithDomain:v34 code:2 userInfo:v27];
LABEL_60:

        id v7 = v71;
LABEL_61:

        goto LABEL_62;
      }
      id v65 = v26;
    }
    else
    {
      id v65 = 0;
    }
    int v27 = [v5 objectForKeyedSubscript:@"privacyProxy"];
    v64 = v6;
    if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v70 = 0;
          int v19 = 0;
          v35 = v65;
          goto LABEL_60;
        }
        int v28 = self;
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"privacyProxy"];
        v80 = v30;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        id v38 = (id)[v36 initWithDomain:v37 code:2 userInfo:v29];
        id v70 = 0;
        int v19 = 0;
        *a4 = v38;
        goto LABEL_88;
      }
      int v28 = self;
      id v70 = v27;
    }
    else
    {
      int v28 = self;
      id v70 = 0;
    }
    v29 = [v5 objectForKeyedSubscript:@"error"];
    if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v30 = 0;
      goto LABEL_54;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = v29;
LABEL_53:
      v30 = v31;
LABEL_54:
      v39 = [v5 objectForKeyedSubscript:@"url"];
      if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v40 = 0;
LABEL_57:
        uint64_t v41 = [v73 intValue];
        uint64_t v42 = [v72 intValue];
        LODWORD(v60) = [v30 intValue];
        uint64_t v43 = v42;
        v35 = v65;
        int v19 = [(BMSafariNavigations *)v28 initWithDomain:v71 visited:v74 platform:v41 userAgent:v43 countryCode:v65 privacyProxy:v70 error:v60 url:v40];
        int v28 = v19;
LABEL_58:

LABEL_59:
        self = v28;
        v6 = v64;
        v24 = v66;
        goto LABEL_60;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = v39;
        goto LABEL_57;
      }
      v40 = a4;
      if (a4)
      {
        id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v75 = *MEMORY[0x1E4F28568];
        v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"url"];
        v76 = v45;
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        *a4 = (id)[v62 initWithDomain:v61 code:2 userInfo:v46];

        v40 = 0;
      }
      int v19 = 0;
LABEL_81:
      v35 = v65;
      goto LABEL_58;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = [NSNumber numberWithInt:BMSafariNavigationsErrorResponseFromString(v29)];
      goto LABEL_53;
    }
    if (a4)
    {
      id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v53 = *MEMORY[0x1E4F502C8];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      v40 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"error"];
      v78 = v40;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      id v54 = (id)[v63 initWithDomain:v53 code:2 userInfo:v39];
      v30 = 0;
      int v19 = 0;
      *a4 = v54;
      goto LABEL_81;
    }
    v30 = 0;
    int v19 = 0;
LABEL_88:
    v35 = v65;
    goto LABEL_59;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v7 = 0;
    int v19 = 0;
    goto LABEL_65;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v89 = *MEMORY[0x1E4F28568];
  v74 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
  v90[0] = v74;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
  uint64_t v18 = v16;
  uint64_t v8 = (void *)v17;
  id v7 = 0;
  int v19 = 0;
  *a4 = (id)[v15 initWithDomain:v18 code:2 userInfo:v17];
LABEL_64:

LABEL_65:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSafariNavigations *)self writeTo:v3];
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
  PBDataWriterWriteUint32Field();
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasPrivacyProxy) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMSafariNavigations;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_85;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
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
          uint64_t v21 = 56;
          goto LABEL_56;
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
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_60:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          uint64_t v52 = 40;
          goto LABEL_79;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v34 = *v6;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_66:
          if (v27 >= 3) {
            LODWORD(v27) = 0;
          }
          uint64_t v52 = 44;
          goto LABEL_79;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_56;
        case 6u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasPrivacyProxy = 1;
          while (2)
          {
            uint64_t v41 = *v6;
            uint64_t v42 = *(void *)&v4[v41];
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
              *(void *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                BOOL v17 = v39++ >= 9;
                if (v17)
                {
                  uint64_t v40 = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v40 = 0;
          }
LABEL_72:
          v5->_privacyProxy = v40 != 0;
          continue;
        case 7u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v27 = 0;
          break;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
LABEL_56:
          uint64_t v51 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_84;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v6;
        uint64_t v48 = *(void *)&v4[v47];
        unint64_t v49 = v48 + 1;
        if (v48 == -1 || v49 > *(void *)&v4[*v7]) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
        *(void *)&v4[v47] = v49;
        v27 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0) {
          goto LABEL_74;
        }
        v45 += 7;
        BOOL v17 = v46++ >= 9;
        if (v17)
        {
          LODWORD(v27) = 0;
          goto LABEL_76;
        }
      }
      v4[*v8] = 1;
LABEL_74:
      if (v4[*v8]) {
        LODWORD(v27) = 0;
      }
LABEL_76:
      if (v27 >= 0x26) {
        LODWORD(v27) = 0;
      }
      uint64_t v52 = 48;
LABEL_79:
      *(_DWORD *)((char *)&v5->super.super.isa + v52) = v27;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_84:
  }
    uint64_t v53 = 0;
  else {
LABEL_85:
  }
    uint64_t v53 = v5;

  return v53;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariNavigations *)self domain];
  id v5 = [(BMSafariNavigations *)self visited];
  v6 = BMSafariNavigationsPlatformAsString([(BMSafariNavigations *)self platform]);
  id v7 = BMSafariNavigationsDeviceClassAsString([(BMSafariNavigations *)self userAgent]);
  uint64_t v8 = [(BMSafariNavigations *)self countryCode];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariNavigations privacyProxy](self, "privacyProxy"));
  char v10 = BMSafariNavigationsErrorResponseAsString([(BMSafariNavigations *)self error]);
  unsigned int v11 = [(BMSafariNavigations *)self url];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMSafariNavigations with domain: %@, visited: %@, platform: %@, userAgent: %@, countryCode: %@, privacyProxy: %@, error: %@, url: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSafariNavigations)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 userAgent:(int)a6 countryCode:(id)a7 privacyProxy:(id)a8 error:(int)a9 url:(id)a10
{
  id v24 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMSafariNavigations;
  uint64_t v21 = [(BMEventBase *)&v25 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v21->_domain, a3);
    if (v17)
    {
      v21->_hasRaw_visited = 1;
      [v17 timeIntervalSince1970];
    }
    else
    {
      v21->_hasRaw_visited = 0;
      double v22 = -1.0;
    }
    v21->_raw_visited = v22;
    v21->_platform = a5;
    v21->_userAgent = a6;
    objc_storeStrong((id *)&v21->_countryCode, a7);
    if (v19)
    {
      v21->_hasPrivacyProxy = 1;
      v21->_privacyProxy = [v19 BOOLValue];
    }
    else
    {
      v21->_hasPrivacyProxy = 0;
      v21->_privacyProxy = 0;
    }
    v21->_error = a9;
    objc_storeStrong((id *)&v21->_url, a10);
  }

  return v21;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visited" number:2 type:0 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"platform" number:3 type:4 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAgent" number:4 type:4 subMessageClass:0];
  v12[3] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:5 type:13 subMessageClass:0];
  v12[4] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"privacyProxy" number:6 type:12 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"error" number:7 type:4 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"url" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF66F0;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visited" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"platform" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userAgent" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"privacyProxy" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"error" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"url" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
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

    uint64_t v8 = [[BMSafariNavigations alloc] initByReadFrom:v7];
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