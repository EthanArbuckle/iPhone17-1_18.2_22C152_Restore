@interface BMAppMediaUsage
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppMediaUsage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppMediaUsage)initWithStarting:(id)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 isUsageTrusted:(id)a7 absoluteTimestamp:(id)a8 safariProfileID:(id)a9;
- (BMAppMediaUsage)initWithStarting:(id)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 isUsageTrusted:(id)a7 absoluteTimestamp:(id)a8 safariProfileID:(id)a9 uniqueID:(id)a10;
- (BOOL)hasIsUsageTrusted;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsageTrusted;
- (BOOL)starting;
- (NSDate)absoluteTimestamp;
- (NSString)URL;
- (NSString)bundleID;
- (NSString)description;
- (NSString)mediaURL;
- (NSString)safariProfileID;
- (NSString)uniqueID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsUsageTrusted:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppMediaUsage

- (BMAppMediaUsage)initWithStarting:(id)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 isUsageTrusted:(id)a7 absoluteTimestamp:(id)a8 safariProfileID:(id)a9
{
  return [(BMAppMediaUsage *)self initWithStarting:a3 bundleID:a4 URL:a5 mediaURL:a6 isUsageTrusted:a7 absoluteTimestamp:a8 safariProfileID:a9 uniqueID:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_safariProfileID, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)safariProfileID
{
  return self->_safariProfileID;
}

- (void)setHasIsUsageTrusted:(BOOL)a3
{
  self->_hasIsUsageTrusted = a3;
}

- (BOOL)hasIsUsageTrusted
{
  return self->_hasIsUsageTrusted;
}

- (BOOL)isUsageTrusted
{
  return self->_isUsageTrusted;
}

- (NSString)mediaURL
{
  return self->_mediaURL;
}

- (NSString)URL
{
  return self->_URL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (BOOL)starting
{
  return self->_starting;
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
    if (-[BMAppMediaUsage hasStarting](self, "hasStarting") || [v5 hasStarting])
    {
      if (![(BMAppMediaUsage *)self hasStarting]) {
        goto LABEL_31;
      }
      if (![v5 hasStarting]) {
        goto LABEL_31;
      }
      int v6 = [(BMAppMediaUsage *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_31;
      }
    }
    v7 = [(BMAppMediaUsage *)self bundleID];
    uint64_t v8 = [v5 bundleID];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMAppMediaUsage *)self bundleID];
      v11 = [v5 bundleID];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_31;
      }
    }
    v14 = [(BMAppMediaUsage *)self URL];
    uint64_t v15 = [v5 URL];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMAppMediaUsage *)self URL];
      v18 = [v5 URL];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_31;
      }
    }
    v20 = [(BMAppMediaUsage *)self mediaURL];
    uint64_t v21 = [v5 mediaURL];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMAppMediaUsage *)self mediaURL];
      v24 = [v5 mediaURL];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_31;
      }
    }
    if ([(BMAppMediaUsage *)self hasIsUsageTrusted]
      || [v5 hasIsUsageTrusted])
    {
      if (![(BMAppMediaUsage *)self hasIsUsageTrusted]) {
        goto LABEL_31;
      }
      if (![v5 hasIsUsageTrusted]) {
        goto LABEL_31;
      }
      int v26 = [(BMAppMediaUsage *)self isUsageTrusted];
      if (v26 != [v5 isUsageTrusted]) {
        goto LABEL_31;
      }
    }
    v27 = [(BMAppMediaUsage *)self absoluteTimestamp];
    uint64_t v28 = [v5 absoluteTimestamp];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(BMAppMediaUsage *)self absoluteTimestamp];
      v31 = [v5 absoluteTimestamp];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_31;
      }
    }
    v33 = [(BMAppMediaUsage *)self safariProfileID];
    uint64_t v34 = [v5 safariProfileID];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(BMAppMediaUsage *)self safariProfileID];
      v37 = [v5 safariProfileID];
      int v38 = [v36 isEqual:v37];

      if (!v38)
      {
LABEL_31:
        char v13 = 0;
LABEL_32:

        goto LABEL_33;
      }
    }
    v40 = [(BMAppMediaUsage *)self uniqueID];
    v41 = [v5 uniqueID];
    if (v40 == v41)
    {
      char v13 = 1;
    }
    else
    {
      v42 = [(BMAppMediaUsage *)self uniqueID];
      v43 = [v5 uniqueID];
      char v13 = [v42 isEqual:v43];
    }
    goto LABEL_32;
  }
  char v13 = 0;
LABEL_33:

  return v13;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  if ([(BMAppMediaUsage *)self hasStarting])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppMediaUsage starting](self, "starting"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(BMAppMediaUsage *)self bundleID];
  uint64_t v5 = [(BMAppMediaUsage *)self URL];
  v29 = [(BMAppMediaUsage *)self mediaURL];
  if ([(BMAppMediaUsage *)self hasIsUsageTrusted])
  {
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppMediaUsage isUsageTrusted](self, "isUsageTrusted"));
  }
  else
  {
    uint64_t v28 = 0;
  }
  int v6 = [(BMAppMediaUsage *)self absoluteTimestamp];
  if (v6)
  {
    v7 = NSNumber;
    uint64_t v8 = [(BMAppMediaUsage *)self absoluteTimestamp];
    [v8 timeIntervalSince1970];
    v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v9 = 0;
  }

  v10 = [(BMAppMediaUsage *)self safariProfileID];
  v11 = [(BMAppMediaUsage *)self uniqueID];
  v30[0] = @"starting";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v12;
  v31[0] = v12;
  v30[1] = @"bundleID";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v13;
  v31[1] = v13;
  v30[2] = @"URL";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v14;
  v31[2] = v14;
  v30[3] = @"mediaURL";
  uint64_t v15 = v29;
  if (!v29)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v3;
  v31[3] = v15;
  v30[4] = @"isUsageTrusted";
  v16 = v28;
  if (!v28)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v4;
  v31[4] = v16;
  v30[5] = @"absoluteTimestamp";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v5;
  v31[5] = v17;
  v30[6] = @"safariProfileID";
  int v19 = v10;
  if (!v10)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[6] = v19;
  v30[7] = @"uniqueID";
  v20 = v11;
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[7] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:8];
  if (v11)
  {
    if (v10) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_28;
    }
  }

LABEL_28:
  if (!v9) {

  }
  if (!v28) {
  if (v29)
  }
  {
    if (v18) {
      goto LABEL_34;
    }
  }
  else
  {

    if (v18)
    {
LABEL_34:
      if (v26) {
        goto LABEL_35;
      }
LABEL_43:

      if (v27) {
        goto LABEL_36;
      }
      goto LABEL_44;
    }
  }

  if (!v26) {
    goto LABEL_43;
  }
LABEL_35:
  if (v27) {
    goto LABEL_36;
  }
LABEL_44:

LABEL_36:

  return v21;
}

- (BMAppMediaUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"bundleID"];
    v70 = a4;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
LABEL_7:
      uint64_t v11 = [v6 objectForKeyedSubscript:@"URL"];
      v73 = (void *)v11;
      if (!v11 || (uint64_t v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v68 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v68 = v12;
LABEL_10:
        uint64_t v13 = [v6 objectForKeyedSubscript:@"mediaURL"];
        id v66 = v8;
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v14 = self;
          uint64_t v15 = v9;
          v16 = v7;
          id v71 = 0;
LABEL_13:
          v17 = [v6 objectForKeyedSubscript:@"isUsageTrusted"];
          id v65 = v10;
          v62 = v13;
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v70)
              {
                id v67 = 0;
                a4 = 0;
                v31 = v68;
                v39 = v17;
                v7 = v16;
                v9 = v15;
                self = v14;
                id v8 = v66;
                goto LABEL_64;
              }
              id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v42 = *MEMORY[0x1E4F502C8];
              uint64_t v80 = *MEMORY[0x1E4F28568];
              v63 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isUsageTrusted"];
              v81 = v63;
              v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
              id v43 = (id)[v41 initWithDomain:v42 code:2 userInfo:v18];
              id v67 = 0;
              a4 = 0;
              v31 = v68;
              id *v70 = v43;
              uint64_t v13 = v62;
              v39 = v17;
              v7 = v16;
              v9 = v15;
              self = v14;
              id v8 = v66;
              goto LABEL_63;
            }
            v61 = v17;
            id v67 = v17;
          }
          else
          {
            v61 = v17;
            id v67 = 0;
          }
          v18 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
          v7 = v16;
          if (v18)
          {
            objc_opt_class();
            v9 = v15;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              self = v14;
              if (objc_opt_isKindOfClass())
              {
                v23 = (objc_class *)MEMORY[0x1E4F1C9C8];
                id v24 = v18;
                id v25 = [v23 alloc];
                [v24 doubleValue];
                double v27 = v26;

                id v28 = (id)[v25 initWithTimeIntervalSince1970:v27];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v44 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                  v63 = [v44 dateFromString:v18];

                  goto LABEL_52;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v70)
                  {
                    v63 = 0;
                    a4 = 0;
                    goto LABEL_62;
                  }
                  id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v56 = *MEMORY[0x1E4F502C8];
                  uint64_t v78 = *MEMORY[0x1E4F28568];
                  id v47 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
                  id v79 = v47;
                  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
                  id v57 = (id)[v55 initWithDomain:v56 code:2 userInfo:v45];
                  v63 = 0;
                  a4 = 0;
                  id *v70 = v57;
LABEL_61:

LABEL_62:
                  id v8 = v66;
                  v31 = v68;
                  v39 = v61;
                  uint64_t v13 = v62;
LABEL_63:

                  id v10 = v65;
                  goto LABEL_64;
                }
                id v28 = v18;
              }
              v63 = v28;
              goto LABEL_52;
            }
            v63 = 0;
          }
          else
          {
            v63 = 0;
            v9 = v15;
          }
          self = v14;
LABEL_52:
          v45 = [v6 objectForKeyedSubscript:@"safariProfileID"];
          v46 = self;
          if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v70)
              {
                id v47 = 0;
                a4 = 0;
                goto LABEL_60;
              }
              id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v51 = *MEMORY[0x1E4F502C8];
              uint64_t v76 = *MEMORY[0x1E4F28568];
              id v49 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"safariProfileID"];
              id v77 = v49;
              v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
              id v52 = (id)[v59 initWithDomain:v51 code:2 userInfo:v48];
              a4 = 0;
              id v47 = 0;
              id *v70 = v52;
              goto LABEL_59;
            }
            id v47 = v45;
          }
          else
          {
            id v47 = 0;
          }
          v48 = [v6 objectForKeyedSubscript:@"uniqueID"];
          if (v48 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v70)
              {
                id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v58 = *MEMORY[0x1E4F502C8];
                uint64_t v74 = *MEMORY[0x1E4F28568];
                v53 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
                v75 = v53;
                v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
                id *v70 = (id)[v60 initWithDomain:v58 code:2 userInfo:v54];
              }
              id v49 = 0;
              a4 = 0;
              goto LABEL_59;
            }
            id v49 = v48;
          }
          else
          {
            id v49 = 0;
          }
          a4 = [(BMAppMediaUsage *)v46 initWithStarting:v66 bundleID:v65 URL:v68 mediaURL:v71 isUsageTrusted:v67 absoluteTimestamp:v63 safariProfileID:v47 uniqueID:v49];
          v46 = (BMAppMediaUsage *)a4;
LABEL_59:

LABEL_60:
          self = v46;
          goto LABEL_61;
        }
        v64 = self;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = v9;
          v16 = v7;
          id v71 = v13;
          uint64_t v14 = v64;
          goto LABEL_13;
        }
        a4 = v70;
        if (v70)
        {
          id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v82 = *MEMORY[0x1E4F28568];
          id v67 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mediaURL"];
          id v83 = v67;
          uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          uint64_t v38 = v36;
          v39 = (void *)v37;
          id v40 = (id)[v72 initWithDomain:v38 code:2 userInfo:v37];
          id v71 = 0;
          a4 = 0;
          v31 = v68;
          id *v70 = v40;
LABEL_64:

          goto LABEL_65;
        }
        id v71 = 0;
        v31 = v68;
LABEL_65:

        goto LABEL_66;
      }
      a4 = v70;
      if (v70)
      {
        id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        id v71 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"URL"];
        id v85 = v71;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        id v35 = (id)[v69 initWithDomain:v33 code:2 userInfo:v34];
        v31 = 0;
        a4 = 0;
        id *v70 = v35;
        uint64_t v13 = (void *)v34;
        goto LABEL_65;
      }
      v31 = 0;
LABEL_66:

      goto LABEL_67;
    }
    if (a4)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v86 = *MEMORY[0x1E4F28568];
      v31 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
      v87 = v31;
      v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      id v32 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2);
      id v10 = 0;
      a4 = 0;
      id *v70 = v32;
      goto LABEL_66;
    }
    id v10 = 0;
LABEL_67:

    goto LABEL_68;
  }
  if (a4)
  {
    int v19 = a4;
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F502C8];
    uint64_t v88 = *MEMORY[0x1E4F28568];
    id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
    v89[0] = v10;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
    id v22 = (id)[v20 initWithDomain:v21 code:2 userInfo:v9];
    id v8 = 0;
    a4 = 0;
    *int v19 = v22;
    goto LABEL_67;
  }
  id v8 = 0;
LABEL_68:

  return (BMAppMediaUsage *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppMediaUsage *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_URL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_mediaURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsUsageTrusted)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_safariProfileID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMAppMediaUsage;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_59;
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
          v5->_hasStarting = 1;
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
              goto LABEL_46;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_48;
            }
          }
          v4[*v8] = 1;
LABEL_46:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_48:
          BOOL v40 = v22 != 0;
          uint64_t v41 = 32;
          goto LABEL_53;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 40;
          goto LABEL_44;
        case 3u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 48;
          goto LABEL_44;
        case 4u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 56;
          goto LABEL_44;
        case 5u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasIsUsageTrusted = 1;
          break;
        case 6u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v7])
          {
            double v38 = *(double *)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v38 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v38;
          continue;
        case 7u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 64;
          goto LABEL_44;
        case 8u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 72;
LABEL_44:
          v39 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_58;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v6;
        uint64_t v33 = *(void *)&v4[v32];
        unint64_t v34 = v33 + 1;
        if (v33 == -1 || v34 > *(void *)&v4[*v7]) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
        *(void *)&v4[v32] = v34;
        v31 |= (unint64_t)(v35 & 0x7F) << v29;
        if ((v35 & 0x80) == 0) {
          goto LABEL_50;
        }
        v29 += 7;
        BOOL v17 = v30++ >= 9;
        if (v17)
        {
          uint64_t v31 = 0;
          goto LABEL_52;
        }
      }
      v4[*v8] = 1;
LABEL_50:
      if (v4[*v8]) {
        uint64_t v31 = 0;
      }
LABEL_52:
      BOOL v40 = v31 != 0;
      uint64_t v41 = 34;
LABEL_53:
      *((unsigned char *)&v5->super.super.isa + v41) = v40;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_58:
  }
    uint64_t v42 = 0;
  else {
LABEL_59:
  }
    uint64_t v42 = v5;

  return v42;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppMediaUsage starting](self, "starting"));
  id v5 = [(BMAppMediaUsage *)self bundleID];
  id v6 = [(BMAppMediaUsage *)self URL];
  v7 = [(BMAppMediaUsage *)self mediaURL];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppMediaUsage isUsageTrusted](self, "isUsageTrusted"));
  v9 = [(BMAppMediaUsage *)self absoluteTimestamp];
  char v10 = [(BMAppMediaUsage *)self safariProfileID];
  unsigned int v11 = [(BMAppMediaUsage *)self uniqueID];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMAppMediaUsage with starting: %@, bundleID: %@, URL: %@, mediaURL: %@, isUsageTrusted: %@, absoluteTimestamp: %@, safariProfileID: %@, uniqueID: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMAppMediaUsage)initWithStarting:(id)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 isUsageTrusted:(id)a7 absoluteTimestamp:(id)a8 safariProfileID:(id)a9 uniqueID:(id)a10
{
  id v16 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v17 = a7;
  id v18 = a8;
  id v23 = a9;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMAppMediaUsage;
  char v20 = [(BMEventBase *)&v27 init];
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v23, v24, v25, v26);
    if (v16)
    {
      v20->_hasStarting = 1;
      v20->_starting = [v16 BOOLValue];
    }
    else
    {
      v20->_hasStarting = 0;
      v20->_starting = 0;
    }
    objc_storeStrong((id *)&v20->_bundleID, a4);
    objc_storeStrong((id *)&v20->_URL, a5);
    objc_storeStrong((id *)&v20->_mediaURL, a6);
    if (v17)
    {
      v20->_hasIsUsageTrusted = 1;
      v20->_isUsageTrusted = [v17 BOOLValue];
    }
    else
    {
      v20->_hasIsUsageTrusted = 0;
      v20->_isUsageTrusted = 0;
    }
    if (v18)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      [v18 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      double v21 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v21;
    objc_storeStrong((id *)&v20->_safariProfileID, a9);
    objc_storeStrong((id *)&v20->_uniqueID, a10);
  }

  return v20;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"URL" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaURL" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUsageTrusted" number:5 type:12 subMessageClass:0];
  v12[4] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:6 type:0 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"safariProfileID" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4B60;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"URL" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaURL" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUsageTrusted" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:2];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"safariProfileID" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
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
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    v7 = [[BMAppMediaUsage alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[9] = 1;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end