@interface BMSafariMemoryFootprint
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariMemoryFootprint)initWithDomain:(id)a3 visited:(id)a4 footprint:(int)a5 pageCount:(int)a6 lifetime:(int)a7 countryCode:(id)a8 inForeground:(id)a9 privacyProxy:(id)a10 canSuspend:(id)a11;
- (BMSafariMemoryFootprint)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)canSuspend;
- (BOOL)hasCanSuspend;
- (BOOL)hasInForeground;
- (BOOL)hasPrivacyProxy;
- (BOOL)inForeground;
- (BOOL)isEqual:(id)a3;
- (BOOL)privacyProxy;
- (NSDate)visited;
- (NSString)countryCode;
- (NSString)description;
- (NSString)domain;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)footprint;
- (int)lifetime;
- (int)pageCount;
- (unsigned)dataVersion;
- (void)setHasCanSuspend:(BOOL)a3;
- (void)setHasInForeground:(BOOL)a3;
- (void)setHasPrivacyProxy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariMemoryFootprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setHasCanSuspend:(BOOL)a3
{
  self->_hasCanSuspend = a3;
}

- (BOOL)hasCanSuspend
{
  return self->_hasCanSuspend;
}

- (BOOL)canSuspend
{
  return self->_canSuspend;
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

- (void)setHasInForeground:(BOOL)a3
{
  self->_hasInForeground = a3;
}

- (BOOL)hasInForeground
{
  return self->_hasInForeground;
}

- (BOOL)inForeground
{
  return self->_inForeground;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int)lifetime
{
  return self->_lifetime;
}

- (int)pageCount
{
  return self->_pageCount;
}

- (int)footprint
{
  return self->_footprint;
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
    v6 = [(BMSafariMemoryFootprint *)self domain];
    uint64_t v7 = [v5 domain];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariMemoryFootprint *)self domain];
      v10 = [v5 domain];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMSafariMemoryFootprint *)self visited];
    uint64_t v14 = [v5 visited];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariMemoryFootprint *)self visited];
      v17 = [v5 visited];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    int v19 = [(BMSafariMemoryFootprint *)self footprint];
    if (v19 != [v5 footprint]) {
      goto LABEL_33;
    }
    int v20 = [(BMSafariMemoryFootprint *)self pageCount];
    if (v20 != [v5 pageCount]) {
      goto LABEL_33;
    }
    int v21 = [(BMSafariMemoryFootprint *)self lifetime];
    if (v21 != [v5 lifetime]) {
      goto LABEL_33;
    }
    v22 = [(BMSafariMemoryFootprint *)self countryCode];
    uint64_t v23 = [v5 countryCode];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(BMSafariMemoryFootprint *)self countryCode];
      v26 = [v5 countryCode];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_33;
      }
    }
    if (![(BMSafariMemoryFootprint *)self hasInForeground]
      && ![v5 hasInForeground]
      || [(BMSafariMemoryFootprint *)self hasInForeground]
      && [v5 hasInForeground]
      && (int v28 = [(BMSafariMemoryFootprint *)self inForeground],
          v28 == [v5 inForeground]))
    {
      if (![(BMSafariMemoryFootprint *)self hasPrivacyProxy]
        && ![v5 hasPrivacyProxy]
        || [(BMSafariMemoryFootprint *)self hasPrivacyProxy]
        && [v5 hasPrivacyProxy]
        && (int v29 = [(BMSafariMemoryFootprint *)self privacyProxy],
            v29 == [v5 privacyProxy]))
      {
        if (![(BMSafariMemoryFootprint *)self hasCanSuspend]
          && ![v5 hasCanSuspend])
        {
          LOBYTE(v12) = 1;
          goto LABEL_34;
        }
        if ([(BMSafariMemoryFootprint *)self hasCanSuspend]
          && [v5 hasCanSuspend])
        {
          BOOL v30 = [(BMSafariMemoryFootprint *)self canSuspend];
          int v12 = v30 ^ [v5 canSuspend] ^ 1;
LABEL_34:

          goto LABEL_35;
        }
      }
    }
LABEL_33:
    LOBYTE(v12) = 0;
    goto LABEL_34;
  }
  LOBYTE(v12) = 0;
LABEL_35:

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
  v41[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSafariMemoryFootprint *)self domain];
  id v4 = [(BMSafariMemoryFootprint *)self visited];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMSafariMemoryFootprint *)self visited];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariMemoryFootprint footprint](self, "footprint"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariMemoryFootprint pageCount](self, "pageCount"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariMemoryFootprint lifetime](self, "lifetime"));
  uint64_t v11 = [(BMSafariMemoryFootprint *)self countryCode];
  if ([(BMSafariMemoryFootprint *)self hasInForeground])
  {
    v39 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariMemoryFootprint inForeground](self, "inForeground"));
  }
  else
  {
    v39 = 0;
  }
  if ([(BMSafariMemoryFootprint *)self hasPrivacyProxy])
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariMemoryFootprint privacyProxy](self, "privacyProxy"));
  }
  else
  {
    v38 = 0;
  }
  if ([(BMSafariMemoryFootprint *)self hasCanSuspend])
  {
    uint64_t v12 = v11;
    v13 = NSNumber;
    BOOL v14 = [(BMSafariMemoryFootprint *)self canSuspend];
    v15 = v13;
    uint64_t v11 = v12;
    v16 = [v15 numberWithBool:v14];
  }
  else
  {
    v16 = 0;
  }
  v40[0] = @"domain";
  uint64_t v17 = v3;
  if (!v3)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v17;
  v41[0] = v17;
  v40[1] = @"visited";
  uint64_t v18 = v7;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v18;
  v41[1] = v18;
  v40[2] = @"footprint";
  uint64_t v19 = v8;
  if (!v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v19;
  v41[2] = v19;
  v40[3] = @"pageCount";
  uint64_t v20 = v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v3;
  v31 = (void *)v20;
  v41[3] = v20;
  v40[4] = @"lifetime";
  int v21 = (void *)v10;
  if (!v10)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v7;
  v41[4] = v21;
  v40[5] = @"countryCode";
  v22 = (void *)v11;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v23 = (void *)v11;
  v24 = (void *)v10;
  v25 = (void *)v8;
  v41[5] = v22;
  v40[6] = @"inForeground";
  v26 = v39;
  if (!v39)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  int v27 = (void *)v9;
  v41[6] = v26;
  v40[7] = @"privacyProxy";
  int v28 = v38;
  if (!v38)
  {
    int v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[7] = v28;
  v40[8] = @"canSuspend";
  int v29 = v16;
  if (!v16)
  {
    int v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v41[8] = v29;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:9];
  if (!v16) {

  }
  if (!v38) {
  if (v39)
  }
  {
    if (v23) {
      goto LABEL_37;
    }
  }
  else
  {

    if (v23) {
      goto LABEL_37;
    }
  }

LABEL_37:
  if (!v24) {

  }
  if (v27)
  {
    if (v25) {
      goto LABEL_41;
    }
  }
  else
  {

    if (v25)
    {
LABEL_41:
      if (v36) {
        goto LABEL_42;
      }
LABEL_50:

      if (v37) {
        goto LABEL_43;
      }
      goto LABEL_51;
    }
  }

  if (!v36) {
    goto LABEL_50;
  }
LABEL_42:
  if (v37) {
    goto LABEL_43;
  }
LABEL_51:

LABEL_43:

  return v35;
}

- (BMSafariMemoryFootprint)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"domain"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"visited"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v11 = v9;
        id v12 = [v10 alloc];
        [v11 doubleValue];
        double v14 = v13;

        id v15 = (id)[v12 initWithTimeIntervalSince1970:v14];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v80 = [v20 dateFromString:v9];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v80 = 0;
            uint64_t v19 = 0;
            goto LABEL_60;
          }
          id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
          v62 = a4;
          uint64_t v63 = *MEMORY[0x1E4F502C8];
          uint64_t v95 = *MEMORY[0x1E4F28568];
          id v79 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"visited"];
          id v96 = v79;
          int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          v80 = 0;
          uint64_t v19 = 0;
          id *v62 = (id)[v61 initWithDomain:v63 code:2 userInfo:v21];
          goto LABEL_59;
        }
        id v15 = v9;
      }
      v80 = v15;
    }
    else
    {
      v80 = 0;
    }
LABEL_16:
    int v21 = [v6 objectForKeyedSubscript:@"footprint"];
    id v77 = v8;
    v78 = v7;
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = self;
        id v79 = v21;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v79 = 0;
            uint64_t v19 = 0;
            goto LABEL_59;
          }
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          v75 = a4;
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v93 = *MEMORY[0x1E4F28568];
          id v76 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"footprint"];
          id v94 = v76;
          uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          v50 = v47;
          uint64_t v23 = (void *)v49;
          id v79 = 0;
          uint64_t v19 = 0;
          id *v75 = (id)[v50 initWithDomain:v48 code:2 userInfo:v49];
LABEL_58:

LABEL_59:
          goto LABEL_60;
        }
        v22 = self;
        id v79 = [NSNumber numberWithInt:BMSafariMemoryFootprintFootprintFromString(v21)];
      }
    }
    else
    {
      v22 = self;
      id v79 = 0;
    }
    uint64_t v23 = [v6 objectForKeyedSubscript:@"pageCount"];
    v71 = v21;
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v76 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self = v22;
          if (!a4)
          {
            id v76 = 0;
            uint64_t v19 = 0;
            uint64_t v7 = v78;
            goto LABEL_58;
          }
          id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
          v54 = a4;
          uint64_t v55 = *MEMORY[0x1E4F502C8];
          uint64_t v91 = *MEMORY[0x1E4F28568];
          id v74 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"pageCount"];
          id v92 = v74;
          uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
          v57 = v53;
          id v35 = (void *)v56;
          id v76 = 0;
          uint64_t v19 = 0;
          id *v54 = (id)[v57 initWithDomain:v55 code:2 userInfo:v56];
          uint64_t v7 = v78;
          goto LABEL_57;
        }
        id v76 = [NSNumber numberWithInt:BMSafariMemoryFootprintPageCountFromString(v23)];
      }
    }
    else
    {
      id v76 = 0;
    }
    uint64_t v24 = [v6 objectForKeyedSubscript:@"lifetime"];
    v69 = v9;
    v70 = v23;
    v68 = (void *)v24;
    if (v24 && (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v74 = v25;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v74 = 0;
            uint64_t v19 = 0;
            id v35 = v25;
            self = v22;
            uint64_t v7 = v78;
            goto LABEL_57;
          }
          id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
          v59 = a4;
          uint64_t v60 = *MEMORY[0x1E4F502C8];
          uint64_t v89 = *MEMORY[0x1E4F28568];
          id v73 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"lifetime"];
          id v90 = v73;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          id v74 = 0;
          uint64_t v19 = 0;
          id *v59 = (id)[v58 initWithDomain:v60 code:2 userInfo:v26];
          id v35 = v25;
          uint64_t v23 = v70;
          self = v22;
          uint64_t v7 = v78;
LABEL_56:

          uint64_t v9 = v69;
LABEL_57:

          goto LABEL_58;
        }
        id v74 = [NSNumber numberWithInt:BMSafariMemoryFootprintLifetimeFromString(v25)];
      }
    }
    else
    {
      id v74 = 0;
    }
    v67 = v22;
    v26 = [v6 objectForKeyedSubscript:@"countryCode"];
    int v27 = a4;
    if (v26)
    {
      objc_opt_class();
      uint64_t v7 = v78;
      if (objc_opt_isKindOfClass())
      {
        id v73 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v73 = 0;
            uint64_t v19 = 0;
            self = v67;
            id v35 = v68;
            goto LABEL_56;
          }
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          v38 = v21;
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v87 = *MEMORY[0x1E4F28568];
          id v72 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"countryCode"];
          id v88 = v72;
          int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          v40 = v37;
          uint64_t v23 = v70;
          uint64_t v41 = v39;
          int v21 = v38;
          uint64_t v19 = 0;
          id v73 = 0;
          *int v27 = (id)[v40 initWithDomain:v41 code:2 userInfo:v28];
          goto LABEL_90;
        }
        id v73 = v26;
      }
    }
    else
    {
      id v73 = 0;
      uint64_t v7 = v78;
    }
    int v28 = [v6 objectForKeyedSubscript:@"inForeground"];
    if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v72 = 0;
      goto LABEL_46;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v72 = v28;
LABEL_46:
      int v29 = [v6 objectForKeyedSubscript:@"privacyProxy"];
      if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v30 = 0;
        goto LABEL_49;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v29;
LABEL_49:
        v31 = [v6 objectForKeyedSubscript:@"canSuspend"];
        if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v34 = v67;
            v33 = v27;
            if (v27)
            {
              id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v64 = *MEMORY[0x1E4F502C8];
              uint64_t v81 = *MEMORY[0x1E4F28568];
              v51 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"canSuspend"];
              v82 = v51;
              v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
              id *v33 = (id)[v66 initWithDomain:v64 code:2 userInfo:v52];

              v33 = 0;
            }
            uint64_t v19 = 0;
            goto LABEL_53;
          }
          v32 = v67;
          v33 = v31;
        }
        else
        {
          v32 = v67;
          v33 = 0;
        }
        uint64_t v19 = -[BMSafariMemoryFootprint initWithDomain:visited:footprint:pageCount:lifetime:countryCode:inForeground:privacyProxy:canSuspend:](v32, "initWithDomain:visited:footprint:pageCount:lifetime:countryCode:inForeground:privacyProxy:canSuspend:", v77, v80, [v79 intValue], objc_msgSend(v76, "intValue"), objc_msgSend(v74, "intValue"), v73, v72, v30, v33);
        v34 = v19;
LABEL_53:

        self = v34;
        id v8 = v77;
        uint64_t v7 = v78;
LABEL_54:

        uint64_t v23 = v70;
        int v21 = v71;
LABEL_55:
        id v35 = v68;

        goto LABEL_56;
      }
      if (v27)
      {
        v34 = v67;
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        v33 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"privacyProxy"];
        v84 = v33;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id v46 = (id)[v65 initWithDomain:v45 code:2 userInfo:v31];
        uint64_t v19 = 0;
        id v30 = 0;
        *int v27 = v46;
        goto LABEL_53;
      }
      id v30 = 0;
      uint64_t v19 = 0;
LABEL_92:
      self = v67;
      goto LABEL_54;
    }
    if (v27)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v43 = *MEMORY[0x1E4F502C8];
      uint64_t v85 = *MEMORY[0x1E4F28568];
      id v30 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"inForeground"];
      id v86 = v30;
      int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      uint64_t v44 = v43;
      id v8 = v77;
      uint64_t v19 = 0;
      id v72 = 0;
      *int v27 = (id)[v42 initWithDomain:v44 code:2 userInfo:v29];
      goto LABEL_92;
    }
    id v72 = 0;
    uint64_t v19 = 0;
LABEL_90:
    self = v67;
    goto LABEL_55;
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
    uint64_t v19 = 0;
    goto LABEL_61;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = a4;
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v97 = *MEMORY[0x1E4F28568];
  v80 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domain"];
  v98[0] = v80;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:&v97 count:1];
  id v8 = 0;
  uint64_t v19 = 0;
  id *v17 = (id)[v16 initWithDomain:v18 code:2 userInfo:v9];
LABEL_60:

LABEL_61:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSafariMemoryFootprint *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_visited) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasInForeground) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = v5;
  if (self->_hasPrivacyProxy)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasCanSuspend)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BMSafariMemoryFootprint;
  id v5 = [(BMEventBase *)&v71 init];
  if (!v5) {
    goto LABEL_107;
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
          goto LABEL_48;
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
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_73:
          if (v27 >= 6) {
            LODWORD(v27) = 0;
          }
          uint64_t v66 = 44;
          goto LABEL_88;
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
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_79:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          uint64_t v66 = 48;
          goto LABEL_88;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v40 = *v6;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
              *(void *)&v4[v40] = v42;
              v27 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v17 = v39++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_85:
          if (v27 >= 9) {
            LODWORD(v27) = 0;
          }
          uint64_t v66 = 52;
LABEL_88:
          *(_DWORD *)((char *)&v5->super.super.isa + v66) = v27;
          continue;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
LABEL_48:
          uint64_t v44 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 7u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          v5->_hasInForeground = 1;
          while (2)
          {
            uint64_t v48 = *v6;
            uint64_t v49 = *(void *)&v4[v48];
            unint64_t v50 = v49 + 1;
            if (v49 == -1 || v50 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v51 = *(unsigned char *)(*(void *)&v4[*v9] + v49);
              *(void *)&v4[v48] = v50;
              v47 |= (unint64_t)(v51 & 0x7F) << v45;
              if (v51 < 0)
              {
                v45 += 7;
                BOOL v17 = v46++ >= 9;
                if (v17)
                {
                  uint64_t v47 = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v47 = 0;
          }
LABEL_92:
          BOOL v67 = v47 != 0;
          uint64_t v68 = 32;
          goto LABEL_101;
        case 8u:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v54 = 0;
          v5->_hasPrivacyProxy = 1;
          while (2)
          {
            uint64_t v55 = *v6;
            uint64_t v56 = *(void *)&v4[v55];
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)&v4[*v9] + v56);
              *(void *)&v4[v55] = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                BOOL v17 = v53++ >= 9;
                if (v17)
                {
                  uint64_t v54 = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v54 = 0;
          }
LABEL_96:
          BOOL v67 = v54 != 0;
          uint64_t v68 = 34;
          goto LABEL_101;
        case 9u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0;
          v5->_hasCanSuspend = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_106;
          }
          continue;
      }
      while (1)
      {
        uint64_t v62 = *v6;
        uint64_t v63 = *(void *)&v4[v62];
        unint64_t v64 = v63 + 1;
        if (v63 == -1 || v64 > *(void *)&v4[*v7]) {
          break;
        }
        char v65 = *(unsigned char *)(*(void *)&v4[*v9] + v63);
        *(void *)&v4[v62] = v64;
        v61 |= (unint64_t)(v65 & 0x7F) << v59;
        if ((v65 & 0x80) == 0) {
          goto LABEL_98;
        }
        v59 += 7;
        BOOL v17 = v60++ >= 9;
        if (v17)
        {
          uint64_t v61 = 0;
          goto LABEL_100;
        }
      }
      v4[*v8] = 1;
LABEL_98:
      if (v4[*v8]) {
        uint64_t v61 = 0;
      }
LABEL_100:
      BOOL v67 = v61 != 0;
      uint64_t v68 = 36;
LABEL_101:
      *((unsigned char *)&v5->super.super.isa + v68) = v67;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_106:
  }
    v69 = 0;
  else {
LABEL_107:
  }
    v69 = v5;

  return v69;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v3 = [(BMSafariMemoryFootprint *)self domain];
  id v4 = [(BMSafariMemoryFootprint *)self visited];
  id v5 = BMSafariMemoryFootprintFootprintAsString([(BMSafariMemoryFootprint *)self footprint]);
  id v6 = BMSafariMemoryFootprintPageCountAsString([(BMSafariMemoryFootprint *)self pageCount]);
  uint64_t v7 = BMSafariMemoryFootprintLifetimeAsString([(BMSafariMemoryFootprint *)self lifetime]);
  id v8 = [(BMSafariMemoryFootprint *)self countryCode];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariMemoryFootprint inForeground](self, "inForeground"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariMemoryFootprint privacyProxy](self, "privacyProxy"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariMemoryFootprint canSuspend](self, "canSuspend"));
  unint64_t v12 = (void *)[v14 initWithFormat:@"BMSafariMemoryFootprint with domain: %@, visited: %@, footprint: %@, pageCount: %@, lifetime: %@, countryCode: %@, inForeground: %@, privacyProxy: %@, canSuspend: %@", v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSafariMemoryFootprint)initWithDomain:(id)a3 visited:(id)a4 footprint:(int)a5 pageCount:(int)a6 lifetime:(int)a7 countryCode:(id)a8 inForeground:(id)a9 privacyProxy:(id)a10 canSuspend:(id)a11
{
  id v26 = a3;
  id v18 = a4;
  id v25 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariMemoryFootprint;
  uint64_t v22 = [(BMEventBase *)&v27 init];
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v25, v26);
    objc_storeStrong((id *)&v22->_domain, a3);
    if (v18)
    {
      v22->_hasRaw_visited = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v22->_hasRaw_visited = 0;
      double v23 = -1.0;
    }
    v22->_raw_visited = v23;
    v22->_footprint = a5;
    v22->_pageCount = a6;
    v22->_lifetime = a7;
    objc_storeStrong((id *)&v22->_countryCode, a8);
    if (v19)
    {
      v22->_hasInForeground = 1;
      v22->_inForeground = [v19 BOOLValue];
    }
    else
    {
      v22->_hasInForeground = 0;
      v22->_inForeground = 0;
    }
    if (v20)
    {
      v22->_hasPrivacyProxy = 1;
      v22->_privacyProxy = [v20 BOOLValue];
    }
    else
    {
      v22->_hasPrivacyProxy = 0;
      v22->_privacyProxy = 0;
    }
    if (v21)
    {
      v22->_hasCanSuspend = 1;
      v22->_canSuspend = [v21 BOOLValue];
    }
    else
    {
      v22->_hasCanSuspend = 0;
      v22->_canSuspend = 0;
    }
  }

  return v22;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:1 type:13 subMessageClass:0];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"visited", 2, 0, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"footprint" number:3 type:4 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pageCount" number:4 type:4 subMessageClass:0];
  v13[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lifetime" number:5 type:4 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:6 type:13 subMessageClass:0];
  v13[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"inForeground" number:7 type:12 subMessageClass:0];
  v13[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"privacyProxy" number:8 type:12 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"canSuspend" number:9 type:12 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5AD8;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visited" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"footprint" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pageCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lifetime" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inForeground" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"privacyProxy" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"canSuspend" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
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

    id v8 = [[BMSafariMemoryFootprint alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end