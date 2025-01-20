@interface BMProactiveHarvestingNewsArticle
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingNewsArticle)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingNewsArticle)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9 contentProtection:(id)a10 personaId:(id)a11;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)description;
- (NSString)domainID;
- (NSString)personaId;
- (NSString)publication;
- (NSString)summary;
- (NSString)title;
- (NSString)uniqueID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingNewsArticle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_publication, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
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

- (NSString)publication
{
  return self->_publication;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)title
{
  return self->_title;
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
    v6 = [(BMProactiveHarvestingNewsArticle *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingNewsArticle *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMProactiveHarvestingNewsArticle *)self domainID];
    uint64_t v14 = [v5 domainID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingNewsArticle *)self domainID];
      v17 = [v5 domainID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    v19 = [(BMProactiveHarvestingNewsArticle *)self absoluteTimestamp];
    uint64_t v20 = [v5 absoluteTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingNewsArticle *)self absoluteTimestamp];
      v23 = [v5 absoluteTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_33;
      }
    }
    v25 = [(BMProactiveHarvestingNewsArticle *)self title];
    uint64_t v26 = [v5 title];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingNewsArticle *)self title];
      v29 = [v5 title];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_33;
      }
    }
    v31 = [(BMProactiveHarvestingNewsArticle *)self content];
    uint64_t v32 = [v5 content];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingNewsArticle *)self content];
      v35 = [v5 content];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_33;
      }
    }
    v37 = [(BMProactiveHarvestingNewsArticle *)self summary];
    uint64_t v38 = [v5 summary];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingNewsArticle *)self summary];
      v41 = [v5 summary];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_33;
      }
    }
    v43 = [(BMProactiveHarvestingNewsArticle *)self publication];
    uint64_t v44 = [v5 publication];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMProactiveHarvestingNewsArticle *)self publication];
      v47 = [v5 publication];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_33;
      }
    }
    v49 = [(BMProactiveHarvestingNewsArticle *)self contentProtection];
    uint64_t v50 = [v5 contentProtection];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMProactiveHarvestingNewsArticle *)self contentProtection];
      v53 = [v5 contentProtection];
      int v54 = [v52 isEqual:v53];

      if (!v54)
      {
LABEL_33:
        char v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v56 = [(BMProactiveHarvestingNewsArticle *)self personaId];
    v57 = [v5 personaId];
    if (v56 == v57)
    {
      char v12 = 1;
    }
    else
    {
      v58 = [(BMProactiveHarvestingNewsArticle *)self personaId];
      v59 = [v5 personaId];
      char v12 = [v58 isEqual:v59];
    }
    goto LABEL_34;
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
  uint64_t v3 = [(BMProactiveHarvestingNewsArticle *)self uniqueID];
  uint64_t v4 = [(BMProactiveHarvestingNewsArticle *)self domainID];
  id v5 = [(BMProactiveHarvestingNewsArticle *)self absoluteTimestamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMProactiveHarvestingNewsArticle *)self absoluteTimestamp];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = [(BMProactiveHarvestingNewsArticle *)self title];
  v10 = [(BMProactiveHarvestingNewsArticle *)self content];
  uint64_t v32 = [(BMProactiveHarvestingNewsArticle *)self summary];
  int v11 = [(BMProactiveHarvestingNewsArticle *)self publication];
  char v12 = [(BMProactiveHarvestingNewsArticle *)self contentProtection];
  v13 = [(BMProactiveHarvestingNewsArticle *)self personaId];
  v33[0] = @"uniqueID";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v14;
  v34[0] = v14;
  v33[1] = @"domainID";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v15;
  v34[1] = v15;
  v33[2] = @"absoluteTimestamp";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v3;
  v25 = (void *)v16;
  v34[2] = v16;
  v33[3] = @"title";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v4;
  int v24 = (void *)v17;
  v34[3] = v17;
  v33[4] = @"content";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v8;
  v34[4] = v18;
  v33[5] = @"summary";
  v19 = v32;
  if (!v32)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[5] = v19;
  v33[6] = @"publication";
  uint64_t v20 = v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[6] = v20;
  v33[7] = @"contentProtection";
  v21 = v12;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[7] = v21;
  v33[8] = @"personaId";
  v22 = v13;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v34[8] = v22;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:9];
  if (v13)
  {
    if (v12) {
      goto LABEL_24;
    }
LABEL_38:

    if (v11) {
      goto LABEL_25;
    }
    goto LABEL_39;
  }

  if (!v12) {
    goto LABEL_38;
  }
LABEL_24:
  if (v11) {
    goto LABEL_25;
  }
LABEL_39:

LABEL_25:
  if (!v32) {

  }
  if (!v10) {
  if (!v9)
  }

  if (v29)
  {
    if (v30) {
      goto LABEL_33;
    }
LABEL_41:

    if (v31) {
      goto LABEL_34;
    }
    goto LABEL_42;
  }

  if (!v30) {
    goto LABEL_41;
  }
LABEL_33:
  if (v31) {
    goto LABEL_34;
  }
LABEL_42:

LABEL_34:

  return v28;
}

- (BMProactiveHarvestingNewsArticle)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"uniqueID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"domainID"];
    v76 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          int v24 = 0;
          goto LABEL_50;
        }
        v25 = a4;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v96 = *MEMORY[0x1E4F28568];
        v80 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainID"];
        v97 = v80;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        v29 = v26;
        int v11 = (void *)v28;
        id v30 = (id)[v29 initWithDomain:v27 code:2 userInfo:v28];
        id v10 = 0;
        int v24 = 0;
        id *v25 = v30;
        goto LABEL_49;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
    id v79 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v12 = (objc_class *)MEMORY[0x1E4F1C9C8];
        v13 = v11;
        id v14 = v11;
        id v15 = [v12 alloc];
        [v14 doubleValue];
        double v17 = v16;

        int v11 = v13;
        id v18 = (id)[v15 initWithTimeIntervalSinceReferenceDate:v17];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v80 = [v31 dateFromString:v11];

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v76)
          {
            v80 = 0;
            int v24 = 0;
            goto LABEL_49;
          }
          id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v94 = *MEMORY[0x1E4F28568];
          int v42 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          v95 = v42;
          uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          uint64_t v63 = v61;
          id v10 = v79;
          v77 = (void *)v62;
          id v64 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v63, 2);
          v80 = 0;
          int v24 = 0;
          id *v76 = v64;
LABEL_48:

LABEL_49:
          goto LABEL_50;
        }
        id v18 = v11;
      }
      v80 = v18;
    }
    else
    {
      v80 = 0;
    }
LABEL_23:
    uint64_t v32 = [v6 objectForKeyedSubscript:@"title"];
    v72 = v11;
    v73 = v9;
    v77 = (void *)v32;
    if (v32 && (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          int v42 = 0;
          int v24 = 0;
          goto LABEL_48;
        }
        id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v45 = *MEMORY[0x1E4F502C8];
        uint64_t v92 = *MEMORY[0x1E4F28568];
        id v78 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
        id v93 = v78;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        v46 = v44;
        int v11 = v72;
        uint64_t v47 = v45;
        id v10 = v79;
        int v24 = 0;
        int v42 = 0;
        id *v76 = (id)[v46 initWithDomain:v47 code:2 userInfo:v34];
        goto LABEL_47;
      }
      id v75 = v33;
    }
    else
    {
      id v75 = 0;
    }
    v34 = [v6 objectForKeyedSubscript:@"content"];
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          id v78 = 0;
          int v24 = 0;
          goto LABEL_46;
        }
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        id v74 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"content"];
        id v91 = v74;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        uint64_t v50 = v48;
        int v11 = v72;
        uint64_t v51 = v49;
        id v10 = v79;
        int v24 = 0;
        id v78 = 0;
        id *v76 = (id)[v50 initWithDomain:v51 code:2 userInfo:v35];
LABEL_45:

LABEL_46:
        int v42 = v75;
LABEL_47:

        v9 = v73;
        goto LABEL_48;
      }
      id v78 = v34;
    }
    else
    {
      id v78 = 0;
    }
    v35 = [v6 objectForKeyedSubscript:@"summary"];
    id v71 = v8;
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          id v74 = 0;
          int v24 = 0;
          goto LABEL_45;
        }
        id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v53 = *MEMORY[0x1E4F502C8];
        uint64_t v88 = *MEMORY[0x1E4F28568];
        id v69 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"summary"];
        id v89 = v69;
        int v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        id v54 = (id)[v52 initWithDomain:v53 code:2 userInfo:v36];
        int v24 = 0;
        id v74 = 0;
        id *v76 = v54;
        goto LABEL_44;
      }
      id v74 = v35;
    }
    else
    {
      id v74 = 0;
    }
    int v36 = [v6 objectForKeyedSubscript:@"publication"];
    v68 = v7;
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          id v69 = 0;
          int v24 = 0;
          goto LABEL_44;
        }
        uint64_t v38 = self;
        id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v55 = *MEMORY[0x1E4F502C8];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"publication"];
        id v87 = v39;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        id v56 = (id)[v70 initWithDomain:v55 code:2 userInfo:v37];
        int v24 = 0;
        id v69 = 0;
        id *v76 = v56;
LABEL_43:

        self = v38;
        uint64_t v7 = v68;
LABEL_44:
        int v11 = v72;

        id v8 = v71;
        id v10 = v79;
        goto LABEL_45;
      }
      id v69 = v36;
    }
    else
    {
      id v69 = 0;
    }
    v37 = [v6 objectForKeyedSubscript:@"contentProtection"];
    if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      uint64_t v38 = self;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v76)
        {
          id v39 = 0;
          int v24 = 0;
          goto LABEL_43;
        }
        id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v57 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        id v41 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contentProtection"];
        id v85 = v41;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        id v58 = (id)[v66 initWithDomain:v57 code:2 userInfo:v40];
        int v24 = 0;
        id v39 = 0;
        id *v76 = v58;
        goto LABEL_42;
      }
      id v39 = v37;
    }
    else
    {
      uint64_t v38 = self;
      id v39 = 0;
    }
    v40 = [v6 objectForKeyedSubscript:@"personaId"];
    if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v76)
        {
          id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v65 = *MEMORY[0x1E4F502C8];
          uint64_t v82 = *MEMORY[0x1E4F28568];
          v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"personaId"];
          v83 = v59;
          v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id *v76 = (id)[v67 initWithDomain:v65 code:2 userInfo:v60];
        }
        id v41 = 0;
        int v24 = 0;
        goto LABEL_42;
      }
      id v41 = v40;
    }
    else
    {
      id v41 = 0;
    }
    int v24 = [(BMProactiveHarvestingNewsArticle *)v38 initWithUniqueID:v71 domainID:v79 absoluteTimestamp:v80 title:v75 content:v78 summary:v74 publication:v69 contentProtection:v39 personaId:v41];
    uint64_t v38 = v24;
LABEL_42:

    goto LABEL_43;
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
    int v24 = 0;
    goto LABEL_51;
  }
  v19 = a4;
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v98 = *MEMORY[0x1E4F28568];
  uint64_t v22 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
  v99[0] = v22;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
  uint64_t v23 = v21;
  id v10 = (id)v22;
  id v8 = 0;
  int v24 = 0;
  id *v19 = (id)[v20 initWithDomain:v23 code:2 userInfo:v9];
LABEL_50:

LABEL_51:
  return v24;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingNewsArticle *)self writeTo:v3];
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
  if (self->_content)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_summary)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_publication)
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
  v28.super_class = (Class)BMProactiveHarvestingNewsArticle;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_40;
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
          goto LABEL_33;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_33;
        case 3u:
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
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_33;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_33;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_33;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_33;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
          goto LABEL_33;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 96;
LABEL_33:
          v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_39;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_39:
  }
    id v26 = 0;
  else {
LABEL_40:
  }
    id v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingNewsArticle *)self uniqueID];
  id v5 = [(BMProactiveHarvestingNewsArticle *)self domainID];
  id v6 = [(BMProactiveHarvestingNewsArticle *)self absoluteTimestamp];
  uint64_t v7 = [(BMProactiveHarvestingNewsArticle *)self title];
  id v8 = [(BMProactiveHarvestingNewsArticle *)self content];
  v9 = [(BMProactiveHarvestingNewsArticle *)self summary];
  char v10 = [(BMProactiveHarvestingNewsArticle *)self publication];
  unsigned int v11 = [(BMProactiveHarvestingNewsArticle *)self contentProtection];
  unint64_t v12 = [(BMProactiveHarvestingNewsArticle *)self personaId];
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingNewsArticle with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, title: %@, content: %@, summary: %@, publication: %@, contentProtection: %@, personaId: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMProactiveHarvestingNewsArticle)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 title:(id)a6 content:(id)a7 summary:(id)a8 publication:(id)a9 contentProtection:(id)a10 personaId:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v18 = a5;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  v19 = v18;
  id v24 = a10;
  id v20 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMProactiveHarvestingNewsArticle;
  uint64_t v21 = [(BMEventBase *)&v31 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v21->_uniqueID, a3);
    objc_storeStrong((id *)&v21->_domainID, a4);
    if (v19)
    {
      v21->_hasRaw_absoluteTimestamp = 1;
      [v19 timeIntervalSinceReferenceDate];
    }
    else
    {
      v21->_hasRaw_absoluteTimestamp = 0;
      double v22 = -1.0;
    }
    v21->_raw_absoluteTimestamp = v22;
    objc_storeStrong((id *)&v21->_title, a6);
    objc_storeStrong((id *)&v21->_content, a7);
    objc_storeStrong((id *)&v21->_summary, a8);
    objc_storeStrong((id *)&v21->_publication, a9);
    objc_storeStrong((id *)&v21->_contentProtection, a10);
    objc_storeStrong((id *)&v21->_personaId, a11);
  }

  return v21;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"domainID", 2, 13, 0, v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:3 type:0 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:4 type:13 subMessageClass:0];
  v13[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"content" number:5 type:13 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"summary" number:6 type:13 subMessageClass:0];
  v13[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"publication" number:7 type:13 subMessageClass:0];
  v13[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:8 type:13 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:9 type:13 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4368;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"content" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"summary" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"publication" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
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
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingNewsArticle alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[8] = 1;
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