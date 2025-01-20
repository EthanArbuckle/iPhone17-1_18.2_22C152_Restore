@interface BMSafariPageLoad
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariPageLoad)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariPageLoad)initWithSearch:(id)a3 visited:(id)a4 mode:(id)a5 platform:(int)a6 userAgent:(int)a7 countryCode:(id)a8 entryPoint:(int)a9 actualized:(id)a10;
- (BOOL)actualized;
- (BOOL)hasActualized;
- (BOOL)hasMode;
- (BOOL)hasSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)mode;
- (BOOL)search;
- (NSDate)visited;
- (NSString)countryCode;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)entryPoint;
- (int)platform;
- (int)userAgent;
- (unsigned)dataVersion;
- (void)setHasActualized:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasSearch:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariPageLoad

- (void).cxx_destruct
{
}

- (void)setHasActualized:(BOOL)a3
{
  self->_hasActualized = a3;
}

- (BOOL)hasActualized
{
  return self->_hasActualized;
}

- (BOOL)actualized
{
  return self->_actualized;
}

- (int)entryPoint
{
  return self->_entryPoint;
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

- (void)setHasMode:(BOOL)a3
{
  self->_hasMode = a3;
}

- (BOOL)hasMode
{
  return self->_hasMode;
}

- (BOOL)mode
{
  return self->_mode;
}

- (void)setHasSearch:(BOOL)a3
{
  self->_hasSearch = a3;
}

- (BOOL)hasSearch
{
  return self->_hasSearch;
}

- (BOOL)search
{
  return self->_search;
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
    if (-[BMSafariPageLoad hasSearch](self, "hasSearch") || [v5 hasSearch])
    {
      if (![(BMSafariPageLoad *)self hasSearch]) {
        goto LABEL_29;
      }
      if (![v5 hasSearch]) {
        goto LABEL_29;
      }
      int v6 = [(BMSafariPageLoad *)self search];
      if (v6 != [v5 search]) {
        goto LABEL_29;
      }
    }
    v7 = [(BMSafariPageLoad *)self visited];
    uint64_t v8 = [v5 visited];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMSafariPageLoad *)self visited];
      v11 = [v5 visited];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_29;
      }
    }
    if (-[BMSafariPageLoad hasMode](self, "hasMode") || [v5 hasMode])
    {
      if (![(BMSafariPageLoad *)self hasMode]) {
        goto LABEL_29;
      }
      if (![v5 hasMode]) {
        goto LABEL_29;
      }
      int v14 = [(BMSafariPageLoad *)self mode];
      if (v14 != [v5 mode]) {
        goto LABEL_29;
      }
    }
    int v15 = [(BMSafariPageLoad *)self platform];
    if (v15 != [v5 platform]) {
      goto LABEL_29;
    }
    int v16 = [(BMSafariPageLoad *)self userAgent];
    if (v16 != [v5 userAgent]) {
      goto LABEL_29;
    }
    v17 = [(BMSafariPageLoad *)self countryCode];
    uint64_t v18 = [v5 countryCode];
    if (v17 == (void *)v18)
    {
    }
    else
    {
      v19 = (void *)v18;
      v20 = [(BMSafariPageLoad *)self countryCode];
      v21 = [v5 countryCode];
      int v22 = [v20 isEqual:v21];

      if (!v22) {
        goto LABEL_29;
      }
    }
    int v23 = [(BMSafariPageLoad *)self entryPoint];
    if (v23 == [v5 entryPoint])
    {
      if (!-[BMSafariPageLoad hasActualized](self, "hasActualized") && ![v5 hasActualized])
      {
        LOBYTE(v13) = 1;
        goto LABEL_30;
      }
      if (-[BMSafariPageLoad hasActualized](self, "hasActualized") && [v5 hasActualized])
      {
        BOOL v24 = [(BMSafariPageLoad *)self actualized];
        int v13 = v24 ^ [v5 actualized] ^ 1;
LABEL_30:

        goto LABEL_31;
      }
    }
LABEL_29:
    LOBYTE(v13) = 0;
    goto LABEL_30;
  }
  LOBYTE(v13) = 0;
LABEL_31:

  return v13;
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
  v30[8] = *MEMORY[0x1E4F143B8];
  if ([(BMSafariPageLoad *)self hasSearch])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariPageLoad search](self, "search"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BMSafariPageLoad *)self visited];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMSafariPageLoad *)self visited];
    [v6 timeIntervalSince1970];
    v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    v7 = 0;
  }

  if ([(BMSafariPageLoad *)self hasMode])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariPageLoad mode](self, "mode"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariPageLoad platform](self, "platform"));
  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariPageLoad userAgent](self, "userAgent"));
  v27 = [(BMSafariPageLoad *)self countryCode];
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariPageLoad entryPoint](self, "entryPoint"));
  if ([(BMSafariPageLoad *)self hasActualized])
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariPageLoad actualized](self, "actualized"));
  }
  else
  {
    v11 = 0;
  }
  v29[0] = @"search";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v24 = (void *)v12;
  v30[0] = v12;
  v29[1] = @"visited";
  uint64_t v13 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v23 = (void *)v13;
  v30[1] = v13;
  v29[2] = @"mode";
  uint64_t v14 = v8;
  v25 = (void *)v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v22 = (void *)v14;
  v30[2] = v14;
  v29[3] = @"platform";
  int v15 = v9;
  if (!v9)
  {
    int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v3;
  v30[3] = v15;
  v29[4] = @"userAgent";
  int v16 = v28;
  if (!v28)
  {
    int v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[4] = v16;
  v29[5] = @"countryCode";
  v17 = v27;
  if (!v27)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[5] = v17;
  v29[6] = @"entryPoint";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[6] = v18;
  v29[7] = @"actualized";
  v19 = v11;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[7] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];
  if (v11)
  {
    if (v10) {
      goto LABEL_31;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_31;
    }
  }

LABEL_31:
  if (!v27) {

  }
  if (!v28) {
  if (!v9)
  }

  if (v25)
  {
    if (v7) {
      goto LABEL_39;
    }
LABEL_46:

    if (v26) {
      goto LABEL_40;
    }
    goto LABEL_47;
  }

  if (!v7) {
    goto LABEL_46;
  }
LABEL_39:
  if (v26) {
    goto LABEL_40;
  }
LABEL_47:

LABEL_40:

  return v20;
}

- (BMSafariPageLoad)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v100[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"search"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"visited"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v12 = v9;
        id v13 = [v11 alloc];
        [v12 doubleValue];
        double v15 = v14;

        id v16 = (id)[v13 initWithTimeIntervalSince1970:v15];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v10 = [v22 dateFromString:v9];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            v21 = 0;
            goto LABEL_65;
          }
          id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
          v67 = a4;
          uint64_t v68 = *MEMORY[0x1E4F502C8];
          uint64_t v97 = *MEMORY[0x1E4F28568];
          id v84 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"visited"];
          id v98 = v84;
          v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          id v69 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v68, 2);
          v10 = 0;
          v21 = 0;
          id *v67 = v69;
          goto LABEL_64;
        }
        id v16 = v9;
      }
      v10 = v16;
    }
    else
    {
      v10 = 0;
    }
LABEL_16:
    uint64_t v23 = [v6 objectForKeyedSubscript:@"mode"];
    v81 = (void *)v23;
    v75 = a4;
    if (v23 && (BOOL v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v84 = 0;
          v21 = 0;
          goto LABEL_64;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        v30 = v10;
        id v31 = [NSString alloc];
        uint64_t v71 = objc_opt_class();
        v32 = v31;
        v10 = v30;
        v83 = (void *)[v32 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v71, @"mode"];
        v96 = v83;
        v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        id v33 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
        id v84 = 0;
        v21 = 0;
        id *v75 = v33;
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      id v84 = v24;
    }
    else
    {
      id v84 = 0;
    }
    uint64_t v25 = [v6 objectForKeyedSubscript:@"platform"];
    v79 = v10;
    v77 = (void *)v25;
    if (v25 && (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v26;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v83 = 0;
            v21 = 0;
            goto LABEL_63;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v56 = *MEMORY[0x1E4F502C8];
          uint64_t v93 = *MEMORY[0x1E4F28568];
          v80 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"platform"];
          v94 = v80;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          uint64_t v57 = v56;
          v10 = v79;
          id v58 = (id)[v55 initWithDomain:v57 code:2 userInfo:v34];
          v83 = 0;
          v21 = 0;
          id *v75 = v58;
          goto LABEL_62;
        }
        id v27 = [NSNumber numberWithInt:BMSafariPageLoadPlatformFromString(v26)];
      }
      v83 = v27;
    }
    else
    {
      v83 = 0;
    }
    v34 = [v6 objectForKeyedSubscript:@"userAgent"];
    v76 = v9;
    id v78 = v8;
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v34;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            v80 = 0;
            v21 = 0;
            goto LABEL_61;
          }
          id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v60 = *MEMORY[0x1E4F502C8];
          uint64_t v91 = *MEMORY[0x1E4F28568];
          id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userAgent"];
          id v92 = v37;
          v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
          uint64_t v61 = v60;
          v10 = v79;
          id v62 = (id)[v59 initWithDomain:v61 code:2 userInfo:v36];
          v80 = 0;
          v21 = 0;
          id *v75 = v62;
LABEL_60:

          id v8 = v78;
LABEL_61:
          v9 = v76;
LABEL_62:

          goto LABEL_63;
        }
        id v35 = [NSNumber numberWithInt:BMSafariPageLoadDeviceClassFromString(v34)];
      }
      v80 = v35;
    }
    else
    {
      v80 = 0;
    }
    v36 = [v6 objectForKeyedSubscript:@"countryCode"];
    v74 = v7;
    v82 = self;
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v75)
        {
          id v37 = 0;
          v21 = 0;
          goto LABEL_60;
        }
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v89 = *MEMORY[0x1E4F28568];
        v39 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"countryCode"];
        v90 = v39;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        id v43 = (id)[v41 initWithDomain:v42 code:2 userInfo:v38];
        id v37 = 0;
        v21 = 0;
        id *v75 = v43;
        goto LABEL_59;
      }
      id v37 = v36;
    }
    else
    {
      id v37 = 0;
    }
    v38 = [v6 objectForKeyedSubscript:@"entryPoint"];
    if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v73 = v37;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v38;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            v39 = 0;
            v21 = 0;
            goto LABEL_59;
          }
          id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v64 = *MEMORY[0x1E4F502C8];
          uint64_t v87 = *MEMORY[0x1E4F28568];
          id v47 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"entryPoint"];
          id v88 = v47;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          id v65 = (id)[v63 initWithDomain:v64 code:2 userInfo:v44];
          v39 = 0;
          v21 = 0;
          id *v75 = v65;
          goto LABEL_82;
        }
        id v40 = [NSNumber numberWithInt:BMSafariPageLoadEntryPointFromString(v38)];
      }
      v39 = v40;
    }
    else
    {
      v39 = 0;
    }
    v44 = [v6 objectForKeyedSubscript:@"actualized"];
    if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v45 = v34;
      id v46 = v37;
      id v47 = 0;
LABEL_57:
      uint64_t v48 = [v83 intValue];
      uint64_t v49 = [v80 intValue];
      LODWORD(v70) = [v39 intValue];
      uint64_t v50 = v49;
      id v37 = v46;
      v21 = [(BMSafariPageLoad *)v82 initWithSearch:v78 visited:v79 mode:v84 platform:v48 userAgent:v50 countryCode:v46 entryPoint:v70 actualized:v47];
      v82 = v21;
      v34 = v45;
LABEL_58:

LABEL_59:
      self = v82;
      v7 = v74;
      v10 = v79;
      goto LABEL_60;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = v34;
      id v46 = v37;
      id v47 = v44;
      goto LABEL_57;
    }
    id v73 = v37;
    if (v75)
    {
      id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v72 = *MEMORY[0x1E4F502C8];
      uint64_t v85 = *MEMORY[0x1E4F28568];
      v53 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"actualized"];
      v86 = v53;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      id *v75 = (id)[v52 initWithDomain:v72 code:2 userInfo:v54];
    }
    id v47 = 0;
    v21 = 0;
LABEL_82:
    id v37 = v73;
    goto LABEL_58;
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
    v21 = 0;
    goto LABEL_66;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = a4;
  uint64_t v19 = *MEMORY[0x1E4F502C8];
  uint64_t v99 = *MEMORY[0x1E4F28568];
  v10 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"search"];
  v100[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:&v99 count:1];
  id v20 = (id)[v17 initWithDomain:v19 code:2 userInfo:v9];
  id v8 = 0;
  v21 = 0;
  *uint64_t v18 = v20;
LABEL_65:

LABEL_66:
  return v21;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSafariPageLoad *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasSearch) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRaw_visited) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasMode) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasActualized) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)BMSafariPageLoad;
  id v5 = [(BMEventBase *)&v70 init];
  if (!v5) {
    goto LABEL_105;
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
          v5->_hasSearch = 1;
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
              goto LABEL_69;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_71;
            }
          }
          v4[*v8] = 1;
LABEL_69:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_71:
          BOOL v65 = v22 != 0;
          uint64_t v66 = 32;
          goto LABEL_99;
        case 2u:
          v5->_hasRaw_visited = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(double *)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0.0;
          }
          v5->_raw_visited = v29;
          continue;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasMode = 1;
          while (2)
          {
            uint64_t v33 = *v6;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  uint64_t v32 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v32 = 0;
          }
LABEL_75:
          BOOL v65 = v32 != 0;
          uint64_t v66 = 34;
          goto LABEL_99;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
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
              v39 |= (unint64_t)(v43 & 0x7F) << v37;
              if (v43 < 0)
              {
                v37 += 7;
                BOOL v17 = v38++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v39) = 0;
          }
LABEL_79:
          if (v39 >= 4) {
            LODWORD(v39) = 0;
          }
          uint64_t v67 = 44;
          goto LABEL_94;
        case 5u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v39 = 0;
          while (2)
          {
            uint64_t v46 = *v6;
            uint64_t v47 = *(void *)&v4[v46];
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v47);
              *(void *)&v4[v46] = v48;
              v39 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v39) = 0;
          }
LABEL_85:
          if (v39 >= 3) {
            LODWORD(v39) = 0;
          }
          uint64_t v67 = 48;
          goto LABEL_94;
        case 6u:
          uint64_t v50 = PBReaderReadString();
          countryCode = v5->_countryCode;
          v5->_countryCode = (NSString *)v50;

          continue;
        case 7u:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v39 = 0;
          while (2)
          {
            uint64_t v54 = *v6;
            uint64_t v55 = *(void *)&v4[v54];
            unint64_t v56 = v55 + 1;
            if (v55 == -1 || v56 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v9] + v55);
              *(void *)&v4[v54] = v56;
              v39 |= (unint64_t)(v57 & 0x7F) << v52;
              if (v57 < 0)
              {
                v52 += 7;
                BOOL v17 = v53++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v39) = 0;
          }
LABEL_91:
          if (v39 >= 3) {
            LODWORD(v39) = 0;
          }
          uint64_t v67 = 52;
LABEL_94:
          *(_DWORD *)((char *)&v5->super.super.isa + v67) = v39;
          continue;
        case 8u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          v5->_hasActualized = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_104;
          }
          continue;
      }
      while (1)
      {
        uint64_t v61 = *v6;
        uint64_t v62 = *(void *)&v4[v61];
        unint64_t v63 = v62 + 1;
        if (v62 == -1 || v63 > *(void *)&v4[*v7]) {
          break;
        }
        char v64 = *(unsigned char *)(*(void *)&v4[*v9] + v62);
        *(void *)&v4[v61] = v63;
        v60 |= (unint64_t)(v64 & 0x7F) << v58;
        if ((v64 & 0x80) == 0) {
          goto LABEL_96;
        }
        v58 += 7;
        BOOL v17 = v59++ >= 9;
        if (v17)
        {
          uint64_t v60 = 0;
          goto LABEL_98;
        }
      }
      v4[*v8] = 1;
LABEL_96:
      if (v4[*v8]) {
        uint64_t v60 = 0;
      }
LABEL_98:
      BOOL v65 = v60 != 0;
      uint64_t v66 = 36;
LABEL_99:
      *((unsigned char *)&v5->super.super.isa + v66) = v65;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_104:
  }
    uint64_t v68 = 0;
  else {
LABEL_105:
  }
    uint64_t v68 = v5;

  return v68;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariPageLoad search](self, "search"));
  id v5 = [(BMSafariPageLoad *)self visited];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariPageLoad mode](self, "mode"));
  v7 = BMSafariPageLoadPlatformAsString([(BMSafariPageLoad *)self platform]);
  id v8 = BMSafariPageLoadDeviceClassAsString([(BMSafariPageLoad *)self userAgent]);
  v9 = [(BMSafariPageLoad *)self countryCode];
  char v10 = BMSafariPageLoadEntryPointAsString([(BMSafariPageLoad *)self entryPoint]);
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariPageLoad actualized](self, "actualized"));
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMSafariPageLoad with search: %@, visited: %@, mode: %@, platform: %@, userAgent: %@, countryCode: %@, entryPoint: %@, actualized: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSafariPageLoad)initWithSearch:(id)a3 visited:(id)a4 mode:(id)a5 platform:(int)a6 userAgent:(int)a7 countryCode:(id)a8 entryPoint:(int)a9 actualized:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a10;
  v24.receiver = self;
  v24.super_class = (Class)BMSafariPageLoad;
  unsigned int v21 = [(BMEventBase *)&v24 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v21->_hasSearch = 1;
      v21->_search = [v16 BOOLValue];
    }
    else
    {
      v21->_hasSearch = 0;
      v21->_search = 0;
    }
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
    if (v18)
    {
      v21->_hasMode = 1;
      v21->_mode = [v18 BOOLValue];
    }
    else
    {
      v21->_hasMode = 0;
      v21->_mode = 0;
    }
    v21->_platform = a6;
    v21->_userAgent = a7;
    objc_storeStrong((id *)&v21->_countryCode, a8);
    v21->_entryPoint = a9;
    if (v20)
    {
      v21->_hasActualized = 1;
      v21->_actualized = [v20 BOOLValue];
    }
    else
    {
      v21->_hasActualized = 0;
      v21->_actualized = 0;
    }
  }

  return v21;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"search" number:1 type:12 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visited" number:2 type:0 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mode" number:3 type:12 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"platform" number:4 type:4 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userAgent" number:5 type:4 subMessageClass:0];
  v12[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entryPoint" number:7 type:4 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actualized" number:8 type:12 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3438;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"search" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visited" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mode" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"platform" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userAgent" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"entryPoint" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actualized" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSafariPageLoad alloc] initByReadFrom:v7];
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