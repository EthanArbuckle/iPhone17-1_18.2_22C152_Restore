@interface BMProactiveHarvestingThirdPartyApp
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingThirdPartyApp)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingThirdPartyApp)initWithUniqueID:(id)a3 domainID:(id)a4 bundleID:(id)a5 absoluteTimestamp:(id)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10 contentProtection:(id)a11 personaId:(id)a12;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)bundleID;
- (NSString)comment;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)desc;
- (NSString)description;
- (NSString)domainID;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingThirdPartyApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_domainID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSString)desc
{
  return self->_desc;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)domainID
{
  return self->_domainID;
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
    v6 = [(BMProactiveHarvestingThirdPartyApp *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingThirdPartyApp *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_37;
      }
    }
    v13 = [(BMProactiveHarvestingThirdPartyApp *)self domainID];
    uint64_t v14 = [v5 domainID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingThirdPartyApp *)self domainID];
      v17 = [v5 domainID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_37;
      }
    }
    v19 = [(BMProactiveHarvestingThirdPartyApp *)self bundleID];
    uint64_t v20 = [v5 bundleID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingThirdPartyApp *)self bundleID];
      v23 = [v5 bundleID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_37;
      }
    }
    v25 = [(BMProactiveHarvestingThirdPartyApp *)self absoluteTimestamp];
    uint64_t v26 = [v5 absoluteTimestamp];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingThirdPartyApp *)self absoluteTimestamp];
      v29 = [v5 absoluteTimestamp];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_37;
      }
    }
    v31 = [(BMProactiveHarvestingThirdPartyApp *)self title];
    uint64_t v32 = [v5 title];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingThirdPartyApp *)self title];
      v35 = [v5 title];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_37;
      }
    }
    v37 = [(BMProactiveHarvestingThirdPartyApp *)self desc];
    uint64_t v38 = [v5 desc];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingThirdPartyApp *)self desc];
      v41 = [v5 desc];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_37;
      }
    }
    v43 = [(BMProactiveHarvestingThirdPartyApp *)self comment];
    uint64_t v44 = [v5 comment];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMProactiveHarvestingThirdPartyApp *)self comment];
      v47 = [v5 comment];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_37;
      }
    }
    v49 = [(BMProactiveHarvestingThirdPartyApp *)self content];
    uint64_t v50 = [v5 content];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMProactiveHarvestingThirdPartyApp *)self content];
      v53 = [v5 content];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_37;
      }
    }
    v55 = [(BMProactiveHarvestingThirdPartyApp *)self contentProtection];
    uint64_t v56 = [v5 contentProtection];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMProactiveHarvestingThirdPartyApp *)self contentProtection];
      v59 = [v5 contentProtection];
      int v60 = [v58 isEqual:v59];

      if (!v60)
      {
LABEL_37:
        char v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    v62 = [(BMProactiveHarvestingThirdPartyApp *)self personaId];
    v63 = [v5 personaId];
    if (v62 == v63)
    {
      char v12 = 1;
    }
    else
    {
      v64 = [(BMProactiveHarvestingThirdPartyApp *)self personaId];
      v65 = [v5 personaId];
      char v12 = [v64 isEqual:v65];
    }
    goto LABEL_38;
  }
  char v12 = 0;
LABEL_39:

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
  v40[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingThirdPartyApp *)self uniqueID];
  uint64_t v4 = [(BMProactiveHarvestingThirdPartyApp *)self domainID];
  uint64_t v5 = [(BMProactiveHarvestingThirdPartyApp *)self bundleID];
  v6 = [(BMProactiveHarvestingThirdPartyApp *)self absoluteTimestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMProactiveHarvestingThirdPartyApp *)self absoluteTimestamp];
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    uint64_t v9 = 0;
  }

  uint64_t v10 = [(BMProactiveHarvestingThirdPartyApp *)self title];
  uint64_t v11 = [(BMProactiveHarvestingThirdPartyApp *)self desc];
  char v12 = [(BMProactiveHarvestingThirdPartyApp *)self comment];
  uint64_t v38 = [(BMProactiveHarvestingThirdPartyApp *)self content];
  v13 = [(BMProactiveHarvestingThirdPartyApp *)self contentProtection];
  uint64_t v14 = [(BMProactiveHarvestingThirdPartyApp *)self personaId];
  v39[0] = @"uniqueID";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v15;
  v40[0] = v15;
  v39[1] = @"domainID";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v16;
  v40[1] = v16;
  v39[2] = @"bundleID";
  uint64_t v17 = v5;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v3;
  int v30 = (void *)v17;
  v40[2] = v17;
  v39[3] = @"absoluteTimestamp";
  uint64_t v18 = v9;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v4;
  v29 = (void *)v18;
  v40[3] = v18;
  v39[4] = @"title";
  uint64_t v19 = v10;
  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v5;
  v28 = (void *)v19;
  v40[4] = v19;
  v39[5] = @"desc";
  uint64_t v20 = (void *)v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v9;
  v40[5] = v20;
  v39[6] = @"comment";
  v21 = v12;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v10;
  v40[6] = v21;
  v39[7] = @"content";
  v23 = v38;
  if (!v38)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v11;
  v40[7] = v23;
  v39[8] = @"contentProtection";
  v25 = v13;
  if (!v13)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[8] = v25;
  v39[9] = @"personaId";
  uint64_t v26 = v14;
  if (!v14)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[9] = v26;
  id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:10];
  if (v14)
  {
    if (v13) {
      goto LABEL_26;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_26;
    }
  }

LABEL_26:
  if (!v38) {

  }
  if (!v12) {
  if (!v24)
  }

  if (!v22) {
  if (!v34)
  }

  if (v35)
  {
    if (v36) {
      goto LABEL_38;
    }
LABEL_45:

    if (v37) {
      goto LABEL_39;
    }
    goto LABEL_46;
  }

  if (!v36) {
    goto LABEL_45;
  }
LABEL_38:
  if (v37) {
    goto LABEL_39;
  }
LABEL_46:

LABEL_39:

  return v33;
}

- (BMProactiveHarvestingThirdPartyApp)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"domainID"];
    v83 = a4;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v9 = 0;
          v23 = 0;
          goto LABEL_60;
        }
        int v24 = a4;
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v104 = *MEMORY[0x1E4F28568];
        v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainID"];
        v105 = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
        v29 = v25;
        uint64_t v10 = (void *)v28;
        id v30 = (id)[v29 initWithDomain:v26 code:2 userInfo:v28];
        id v9 = 0;
        v23 = 0;
        *int v24 = v30;
        goto LABEL_59;
      }
      id v9 = v8;
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"bundleID"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          v27 = 0;
          v23 = 0;
          goto LABEL_59;
        }
        id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v31 = v9;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v102 = *MEMORY[0x1E4F28568];
        v84 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        v103 = v84;
        uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        uint64_t v34 = v32;
        id v9 = v31;
        v27 = 0;
        v23 = 0;
        id *v83 = (id)[v82 initWithDomain:v34 code:2 userInfo:v33];
        uint64_t v11 = (void *)v33;
LABEL_58:

LABEL_59:
        goto LABEL_60;
      }
      id v81 = v10;
    }
    else
    {
      id v81 = 0;
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
    v77 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v12 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v13 = v11;
        id v14 = [v12 alloc];
        [v13 doubleValue];
        double v16 = v15;

        id v17 = (id)[v14 initWithTimeIntervalSinceReferenceDate:v16];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v84 = [v35 dateFromString:v11];

          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v83)
          {
            v84 = 0;
            v23 = 0;
            v27 = v81;
            goto LABEL_58;
          }
          id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v65 = v9;
          uint64_t v66 = *MEMORY[0x1E4F502C8];
          uint64_t v100 = *MEMORY[0x1E4F28568];
          id v80 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          id v101 = v80;
          int v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
          uint64_t v67 = v66;
          id v9 = v65;
          id v68 = (id)[v85 initWithDomain:v67 code:2 userInfo:v36];
          v84 = 0;
          v23 = 0;
          id *v83 = v68;
          goto LABEL_56;
        }
        id v17 = v11;
      }
      v84 = v17;
    }
    else
    {
      v84 = 0;
    }
LABEL_30:
    int v36 = [v5 objectForKeyedSubscript:@"title"];
    id v79 = v9;
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          id v80 = 0;
          v23 = 0;
          v27 = v81;
          goto LABEL_57;
        }
        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v98 = *MEMORY[0x1E4F28568];
        id v78 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
        id v99 = v78;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        int v48 = v46;
        id v9 = v79;
        id v49 = (id)[v48 initWithDomain:v47 code:2 userInfo:v37];
        v23 = 0;
        id v80 = 0;
        id *v83 = v49;
        goto LABEL_55;
      }
      id v80 = v36;
    }
    else
    {
      id v80 = 0;
    }
    v37 = [v5 objectForKeyedSubscript:@"desc"];
    v75 = v8;
    v72 = v36;
    if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          id v78 = 0;
          v23 = 0;
          goto LABEL_54;
        }
        id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v96 = *MEMORY[0x1E4F28568];
        id v76 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"desc"];
        id v97 = v76;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        v52 = v50;
        id v9 = v79;
        id v53 = (id)[v52 initWithDomain:v51 code:2 userInfo:v38];
        v23 = 0;
        id v78 = 0;
        id *v83 = v53;
LABEL_53:

LABEL_54:
        int v36 = v72;
LABEL_55:

LABEL_56:
        v27 = v81;
LABEL_57:

        uint64_t v10 = v77;
        goto LABEL_58;
      }
      id v78 = v37;
    }
    else
    {
      id v78 = 0;
    }
    uint64_t v38 = [v5 objectForKeyedSubscript:@"comment"];
    v73 = v11;
    if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          id v76 = 0;
          v23 = 0;
          goto LABEL_53;
        }
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v94 = *MEMORY[0x1E4F28568];
        id v74 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"comment"];
        id v95 = v74;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        id v56 = (id)[v54 initWithDomain:v55 code:2 userInfo:v39];
        v23 = 0;
        id v76 = 0;
        id *v83 = v56;
        goto LABEL_51;
      }
      id v76 = v38;
    }
    else
    {
      id v76 = 0;
    }
    v39 = [v5 objectForKeyedSubscript:@"content"];
    v70 = v6;
    id v71 = v7;
    if (v39 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v83)
        {
          id v74 = 0;
          v23 = 0;
          goto LABEL_52;
        }
        v41 = self;
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v92 = *MEMORY[0x1E4F28568];
        id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"content"];
        id v93 = v42;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        id v59 = (id)[v57 initWithDomain:v58 code:2 userInfo:v40];
        v23 = 0;
        id v74 = 0;
        id *v83 = v59;
        goto LABEL_50;
      }
      id v74 = v39;
    }
    else
    {
      id v74 = 0;
    }
    v40 = [v5 objectForKeyedSubscript:@"contentProtection"];
    if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v41 = self;
        if (!v83)
        {
          id v42 = 0;
          v23 = 0;
          goto LABEL_50;
        }
        id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        id v44 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
        id v91 = v44;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        id v62 = (id)[v60 initWithDomain:v61 code:2 userInfo:v43];
        v23 = 0;
        id v42 = 0;
        id *v83 = v62;
        goto LABEL_49;
      }
      v41 = self;
      id v42 = v40;
    }
    else
    {
      v41 = self;
      id v42 = 0;
    }
    v43 = [v5 objectForKeyedSubscript:@"personaId"];
    if (v43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v83)
        {
          id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v69 = *MEMORY[0x1E4F502C8];
          uint64_t v88 = *MEMORY[0x1E4F28568];
          v63 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
          v89 = v63;
          v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
          id *v83 = (id)[v87 initWithDomain:v69 code:2 userInfo:v64];
        }
        id v44 = 0;
        v23 = 0;
        goto LABEL_49;
      }
      id v44 = v43;
    }
    else
    {
      id v44 = 0;
    }
    v23 = [(BMProactiveHarvestingThirdPartyApp *)v41 initWithUniqueID:v71 domainID:v79 bundleID:v81 absoluteTimestamp:v84 title:v80 desc:v78 comment:v76 content:v74 contentProtection:v42 personaId:v44];
    v41 = v23;
LABEL_49:

LABEL_50:
    self = v41;

    v6 = v70;
    id v7 = v71;
LABEL_51:
    id v9 = v79;
    uint64_t v11 = v73;
LABEL_52:

    v8 = v75;
    goto LABEL_53;
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
    v23 = 0;
    goto LABEL_61;
  }
  uint64_t v18 = a4;
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v106 = *MEMORY[0x1E4F28568];
  uint64_t v21 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
  v107[0] = v21;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:&v106 count:1];
  uint64_t v22 = v20;
  id v9 = (id)v21;
  id v7 = 0;
  v23 = 0;
  *uint64_t v18 = (id)[v19 initWithDomain:v22 code:2 userInfo:v8];
LABEL_60:

LABEL_61:
  return v23;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingThirdPartyApp *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_domainID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_desc)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_comment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_content)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMProactiveHarvestingThirdPartyApp;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_41;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        if (v11++ >= 9)
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
          uint64_t v21 = 40;
          goto LABEL_34;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_34;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_34;
        case 4u:
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
          break;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_34;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_34;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_34;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
          goto LABEL_34;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 96;
          goto LABEL_34;
        case 0xAu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 104;
LABEL_34:
          id v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_40;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_40:
  }
    uint64_t v26 = 0;
  else {
LABEL_41:
  }
    uint64_t v26 = v5;

  return v26;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  uint64_t v14 = [(BMProactiveHarvestingThirdPartyApp *)self uniqueID];
  uint64_t v3 = [(BMProactiveHarvestingThirdPartyApp *)self domainID];
  id v4 = [(BMProactiveHarvestingThirdPartyApp *)self bundleID];
  id v5 = [(BMProactiveHarvestingThirdPartyApp *)self absoluteTimestamp];
  v6 = [(BMProactiveHarvestingThirdPartyApp *)self title];
  id v7 = [(BMProactiveHarvestingThirdPartyApp *)self desc];
  v8 = [(BMProactiveHarvestingThirdPartyApp *)self comment];
  id v9 = [(BMProactiveHarvestingThirdPartyApp *)self content];
  char v10 = [(BMProactiveHarvestingThirdPartyApp *)self contentProtection];
  unsigned int v11 = [(BMProactiveHarvestingThirdPartyApp *)self personaId];
  unint64_t v12 = (void *)[v15 initWithFormat:@"BMProactiveHarvestingThirdPartyApp with uniqueID: %@, domainID: %@, bundleID: %@, absoluteTimestamp: %@, title: %@, desc: %@, comment: %@, content: %@, contentProtection: %@, personaId: %@", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMProactiveHarvestingThirdPartyApp)initWithUniqueID:(id)a3 domainID:(id)a4 bundleID:(id)a5 absoluteTimestamp:(id)a6 title:(id)a7 desc:(id)a8 comment:(id)a9 content:(id)a10 contentProtection:(id)a11 personaId:(id)a12
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v18 = a6;
  id v27 = a7;
  id v30 = a7;
  id v28 = a8;
  id v29 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  v34.receiver = self;
  v34.super_class = (Class)BMProactiveHarvestingThirdPartyApp;
  unint64_t v23 = [(BMEventBase *)&v34 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v23->_uniqueID, a3);
    objc_storeStrong((id *)&v23->_domainID, a4);
    objc_storeStrong((id *)&v23->_bundleID, a5);
    if (v18)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      [v18 timeIntervalSinceReferenceDate];
    }
    else
    {
      v23->_hasRaw_absoluteTimestamp = 0;
      double v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_title, v27);
    objc_storeStrong((id *)&v23->_desc, v28);
    objc_storeStrong((id *)&v23->_comment, a9);
    objc_storeStrong((id *)&v23->_content, a10);
    objc_storeStrong((id *)&v23->_contentProtection, a11);
    objc_storeStrong((id *)&v23->_personaId, a12);
  }

  return v23;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domainID" number:2 type:13 subMessageClass:0];
  v14[1] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:3 type:13 subMessageClass:0];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:4 type:0 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:5 type:13 subMessageClass:0];
  v14[4] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"desc" number:6 type:13 subMessageClass:0];
  v14[5] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"comment" number:7 type:13 subMessageClass:0];
  v14[6] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"content" number:8 type:13 subMessageClass:0];
  v14[7] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:9 type:13 subMessageClass:0];
  v14[8] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:10 type:13 subMessageClass:0];
  v14[9] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6168;
}

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:1];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"desc" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"comment" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"content" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    id v7 = [[BMProactiveHarvestingThirdPartyApp alloc] initByReadFrom:v6];
    v8 = v7;
    if (v7) {
      v7[8] = 1;
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