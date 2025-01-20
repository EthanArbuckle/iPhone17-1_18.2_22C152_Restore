@interface BMAppWebUsage
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppWebUsage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppWebUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageState:(int)a5 webpageURL:(id)a6 webDomain:(id)a7 applicationID:(id)a8 deviceID:(id)a9 isUsageTrusted:(id)a10 safariProfileID:(id)a11;
- (BOOL)hasIsUsageTrusted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsageTrusted;
- (NSDate)absoluteTimestamp;
- (NSString)applicationID;
- (NSString)description;
- (NSString)deviceID;
- (NSString)safariProfileID;
- (NSString)uniqueID;
- (NSString)webDomain;
- (NSString)webpageURL;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)usageState;
- (unsigned)dataVersion;
- (void)setHasIsUsageTrusted:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppWebUsage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariProfileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_webDomain, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
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

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)webDomain
{
  return self->_webDomain;
}

- (NSString)webpageURL
{
  return self->_webpageURL;
}

- (int)usageState
{
  return self->_usageState;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
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
    v6 = [(BMAppWebUsage *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppWebUsage *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMAppWebUsage *)self absoluteTimestamp];
    uint64_t v14 = [v5 absoluteTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAppWebUsage *)self absoluteTimestamp];
      v17 = [v5 absoluteTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    int v19 = [(BMAppWebUsage *)self usageState];
    if (v19 == [v5 usageState])
    {
      v20 = [(BMAppWebUsage *)self webpageURL];
      uint64_t v21 = [v5 webpageURL];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMAppWebUsage *)self webpageURL];
        v24 = [v5 webpageURL];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_33;
        }
      }
      v26 = [(BMAppWebUsage *)self webDomain];
      uint64_t v27 = [v5 webDomain];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMAppWebUsage *)self webDomain];
        v30 = [v5 webDomain];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_33;
        }
      }
      v32 = [(BMAppWebUsage *)self applicationID];
      uint64_t v33 = [v5 applicationID];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMAppWebUsage *)self applicationID];
        v36 = [v5 applicationID];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_33;
        }
      }
      v38 = [(BMAppWebUsage *)self deviceID];
      uint64_t v39 = [v5 deviceID];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(BMAppWebUsage *)self deviceID];
        v42 = [v5 deviceID];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_33;
        }
      }
      if (![(BMAppWebUsage *)self hasIsUsageTrusted]
        && ![v5 hasIsUsageTrusted]
        || [(BMAppWebUsage *)self hasIsUsageTrusted]
        && [v5 hasIsUsageTrusted]
        && (int v44 = [(BMAppWebUsage *)self isUsageTrusted],
            v44 == [v5 isUsageTrusted]))
      {
        v46 = [(BMAppWebUsage *)self safariProfileID];
        v47 = [v5 safariProfileID];
        if (v46 == v47)
        {
          char v12 = 1;
        }
        else
        {
          v48 = [(BMAppWebUsage *)self safariProfileID];
          v49 = [v5 safariProfileID];
          char v12 = [v48 isEqual:v49];
        }
        goto LABEL_34;
      }
    }
LABEL_33:
    char v12 = 0;
LABEL_34:

    goto LABEL_35;
  }
  char v12 = 0;
LABEL_35:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v34[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAppWebUsage *)self uniqueID];
  id v4 = [(BMAppWebUsage *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMAppWebUsage *)self absoluteTimestamp];
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppWebUsage usageState](self, "usageState"));
  uint64_t v9 = [(BMAppWebUsage *)self webpageURL];
  v32 = [(BMAppWebUsage *)self webDomain];
  int v31 = [(BMAppWebUsage *)self applicationID];
  v10 = [(BMAppWebUsage *)self deviceID];
  if ([(BMAppWebUsage *)self hasIsUsageTrusted])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppWebUsage isUsageTrusted](self, "isUsageTrusted"));
  }
  else
  {
    int v11 = 0;
  }
  char v12 = [(BMAppWebUsage *)self safariProfileID];
  v33[0] = @"uniqueID";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = @"absoluteTimestamp";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = @"usageState";
  uint64_t v15 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = @"webpageURL";
  uint64_t v16 = v9;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v3;
  v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = @"webDomain";
  v17 = v32;
  if (!v32)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v7;
  v34[4] = v17;
  v33[5] = @"applicationID";
  int v18 = v31;
  if (!v31)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v18;
  v33[6] = @"deviceID";
  int v19 = v10;
  if (!v10)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v9;
  v34[6] = v19;
  v33[7] = @"isUsageTrusted";
  uint64_t v21 = v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v21;
  v33[8] = @"safariProfileID";
  v22 = v12;
  if (!v12)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[8] = v22;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  if (v12)
  {
    if (v11) {
      goto LABEL_27;
    }
LABEL_40:

    if (v10) {
      goto LABEL_28;
    }
    goto LABEL_41;
  }

  if (!v11) {
    goto LABEL_40;
  }
LABEL_27:
  if (v10) {
    goto LABEL_28;
  }
LABEL_41:

LABEL_28:
  if (!v31) {

  }
  if (!v32) {
  if (v20)
  }
  {
    if (v8) {
      goto LABEL_34;
    }
  }
  else
  {

    if (v8)
    {
LABEL_34:
      if (v29) {
        goto LABEL_35;
      }
LABEL_44:

      if (v30) {
        goto LABEL_36;
      }
      goto LABEL_45;
    }
  }

  if (!v29) {
    goto LABEL_44;
  }
LABEL_35:
  if (v30) {
    goto LABEL_36;
  }
LABEL_45:

LABEL_36:

  return v28;
}

- (BMAppWebUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v11 = v8;
        id v12 = [v10 alloc];
        [v11 doubleValue];
        double v14 = v13;

        id v15 = (id)[v12 initWithTimeIntervalSinceReferenceDate:v14];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          uint64_t v9 = [v21 dateFromString:v8];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v9 = 0;
            v20 = 0;
            goto LABEL_45;
          }
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v56 = *MEMORY[0x1E4F502C8];
          uint64_t v86 = *MEMORY[0x1E4F28568];
          id v70 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          id v87 = v70;
          v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
          id v57 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2);
          uint64_t v9 = 0;
          v20 = 0;
          *a4 = v57;
          goto LABEL_44;
        }
        id v15 = v8;
      }
      uint64_t v9 = v15;
    }
    else
    {
      uint64_t v9 = 0;
    }
LABEL_16:
    uint64_t v22 = [v5 objectForKeyedSubscript:@"usageState"];
    v65 = v8;
    v68 = (void *)v22;
    if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v70 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v70 = 0;
            v20 = 0;
            goto LABEL_44;
          }
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          v47 = v9;
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v84 = *MEMORY[0x1E4F28568];
          v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"usageState"];
          v85 = v32;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          uint64_t v49 = v48;
          uint64_t v9 = v47;
          id v70 = 0;
          v20 = 0;
          *a4 = (id)[v46 initWithDomain:v49 code:2 userInfo:v24];
LABEL_43:

          v8 = v65;
LABEL_44:

          goto LABEL_45;
        }
        id v70 = [NSNumber numberWithInt:BMAppWebUsageStateFromString(v23)];
      }
    }
    else
    {
      id v70 = 0;
    }
    v24 = [v5 objectForKeyedSubscript:@"webpageURL"];
    id v69 = v7;
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v20 = 0;
          goto LABEL_43;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        v35 = v9;
        uint64_t v36 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v67 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"webpageURL"];
        id v83 = v67;
        int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        uint64_t v37 = v36;
        uint64_t v9 = v35;
        v20 = 0;
        v32 = 0;
        *a4 = (id)[v34 initWithDomain:v37 code:2 userInfo:v25];
        goto LABEL_42;
      }
      id v64 = v24;
    }
    else
    {
      id v64 = 0;
    }
    int v25 = [v5 objectForKeyedSubscript:@"webDomain"];
    v60 = v6;
    v63 = v9;
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v67 = 0;
          v20 = 0;
          v32 = v64;
          goto LABEL_42;
        }
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"webDomain"];
        id v81 = v62;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        v20 = 0;
        id v67 = 0;
        *a4 = (id)[v38 initWithDomain:v39 code:2 userInfo:v26];
        goto LABEL_86;
      }
      id v67 = v25;
    }
    else
    {
      id v67 = 0;
    }
    v26 = [v5 objectForKeyedSubscript:@"applicationID"];
    if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v62 = 0;
LABEL_28:
      uint64_t v27 = [v5 objectForKeyedSubscript:@"deviceID"];
      v66 = self;
      if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v61 = 0;
            v20 = 0;
            goto LABEL_40;
          }
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v76 = *MEMORY[0x1E4F28568];
          id v29 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceID"];
          id v77 = v29;
          id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v28];
          v20 = 0;
          id v61 = 0;
          *a4 = v45;
          goto LABEL_39;
        }
        id v61 = v27;
      }
      else
      {
        id v61 = 0;
      }
      id v28 = [v5 objectForKeyedSubscript:@"isUsageTrusted"];
      if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v29 = 0;
            v20 = 0;
            goto LABEL_39;
          }
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v74 = *MEMORY[0x1E4F28568];
          id v31 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isUsageTrusted"];
          id v75 = v31;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          id v52 = (id)[v50 initWithDomain:v51 code:2 userInfo:v30];
          v20 = 0;
          id v29 = 0;
          *a4 = v52;
          goto LABEL_38;
        }
        id v29 = v28;
      }
      else
      {
        id v29 = 0;
      }
      v30 = [v5 objectForKeyedSubscript:@"safariProfileID"];
      if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v58 = *MEMORY[0x1E4F502C8];
            uint64_t v72 = *MEMORY[0x1E4F28568];
            v53 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"safariProfileID"];
            v73 = v53;
            v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
            *a4 = (id)[v59 initWithDomain:v58 code:2 userInfo:v54];
          }
          id v31 = 0;
          v20 = 0;
          goto LABEL_38;
        }
        id v31 = v30;
      }
      else
      {
        id v31 = 0;
      }
      v20 = -[BMAppWebUsage initWithUniqueID:absoluteTimestamp:usageState:webpageURL:webDomain:applicationID:deviceID:isUsageTrusted:safariProfileID:](v66, "initWithUniqueID:absoluteTimestamp:usageState:webpageURL:webDomain:applicationID:deviceID:isUsageTrusted:safariProfileID:", v69, v63, [v70 intValue], v64, v67, v62, v61, v29, v31);
      v66 = v20;
LABEL_38:

LABEL_39:
      self = v66;
LABEL_40:
      v32 = v64;

LABEL_41:
      v6 = v60;
      uint64_t v9 = v63;
LABEL_42:

      id v7 = v69;
      goto LABEL_43;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v62 = v26;
      goto LABEL_28;
    }
    if (a4)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F502C8];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      id v61 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"applicationID"];
      id v79 = v61;
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      id v42 = (id)[v40 initWithDomain:v41 code:2 userInfo:v27];
      v20 = 0;
      id v62 = 0;
      *a4 = v42;
      goto LABEL_40;
    }
    id v62 = 0;
    v20 = 0;
LABEL_86:
    v32 = v64;
    goto LABEL_41;
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
    v20 = 0;
    goto LABEL_46;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v88 = *MEMORY[0x1E4F28568];
  uint64_t v18 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
  v89[0] = v18;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
  uint64_t v19 = v17;
  uint64_t v9 = (void *)v18;
  id v7 = 0;
  v20 = 0;
  *a4 = (id)[v16 initWithDomain:v19 code:2 userInfo:v8];
LABEL_45:

LABEL_46:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppWebUsage *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_webpageURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_webDomain) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_applicationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsUsageTrusted)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_safariProfileID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMAppWebUsage;
  id v5 = [(BMEventBase *)&v42 init];
  if (!v5) {
    goto LABEL_62;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v21 = 48;
          goto LABEL_45;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
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
          v5->_raw_absoluteTimestamp = v24;
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
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_51:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          v5->_usageState = v27;
          continue;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_45;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_45;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_45;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_45;
        case 8u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasIsUsageTrusted = 1;
          break;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
LABEL_45:
          uint64_t v39 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_61;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v6;
        uint64_t v36 = *(void *)&v4[v35];
        unint64_t v37 = v36 + 1;
        if (v36 == -1 || v37 > *(void *)&v4[*v7]) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
        *(void *)&v4[v35] = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0) {
          goto LABEL_55;
        }
        v32 += 7;
        BOOL v17 = v33++ >= 9;
        if (v17)
        {
          uint64_t v34 = 0;
          goto LABEL_57;
        }
      }
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8]) {
        uint64_t v34 = 0;
      }
LABEL_57:
      v5->_isUsageTrusted = v34 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_61:
  }
    id v40 = 0;
  else {
LABEL_62:
  }
    id v40 = v5;

  return v40;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppWebUsage *)self uniqueID];
  id v5 = [(BMAppWebUsage *)self absoluteTimestamp];
  v6 = BMAppWebUsageStateAsString([(BMAppWebUsage *)self usageState]);
  id v7 = [(BMAppWebUsage *)self webpageURL];
  v8 = [(BMAppWebUsage *)self webDomain];
  uint64_t v9 = [(BMAppWebUsage *)self applicationID];
  char v10 = [(BMAppWebUsage *)self deviceID];
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppWebUsage isUsageTrusted](self, "isUsageTrusted"));
  unint64_t v12 = [(BMAppWebUsage *)self safariProfileID];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMAppWebUsage with uniqueID: %@, absoluteTimestamp: %@, usageState: %@, webpageURL: %@, webDomain: %@, applicationID: %@, deviceID: %@, isUsageTrusted: %@, safariProfileID: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMAppWebUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageState:(int)a5 webpageURL:(id)a6 webDomain:(id)a7 applicationID:(id)a8 deviceID:(id)a9 isUsageTrusted:(id)a10 safariProfileID:(id)a11
{
  id v28 = a3;
  id v17 = a4;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v18 = a10;
  id v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)BMAppWebUsage;
  uint64_t v20 = [(BMEventBase *)&v29 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_uniqueID, a3);
    if (v17)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      [v17 timeIntervalSinceReferenceDate];
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      double v21 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v21;
    v20->_usageState = a5;
    objc_storeStrong((id *)&v20->_webpageURL, a6);
    objc_storeStrong((id *)&v20->_webDomain, a7);
    objc_storeStrong((id *)&v20->_applicationID, a8);
    objc_storeStrong((id *)&v20->_deviceID, a9);
    if (v18)
    {
      v20->_hasIsUsageTrusted = 1;
      v20->_isUsageTrusted = [v18 BOOLValue];
    }
    else
    {
      v20->_hasIsUsageTrusted = 0;
      v20->_isUsageTrusted = 0;
    }
    objc_storeStrong((id *)&v20->_safariProfileID, a11);
  }

  return v20;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"absoluteTimestamp", 2, 0, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usageState" number:3 type:4 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webpageURL" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webDomain" number:5 type:13 subMessageClass:0];
  v13[4] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"applicationID" number:6 type:13 subMessageClass:0];
  v13[5] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceID" number:7 type:13 subMessageClass:0];
  v13[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isUsageTrusted" number:8 type:12 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"safariProfileID" number:9 type:13 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4A40;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usageState" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"webpageURL" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"webDomain" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"applicationID" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceID" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isUsageTrusted" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"safariProfileID" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
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
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    id v7 = [[BMAppWebUsage alloc] initByReadFrom:v6];
    v8 = v7;
    if (v7) {
      v7[9] = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end