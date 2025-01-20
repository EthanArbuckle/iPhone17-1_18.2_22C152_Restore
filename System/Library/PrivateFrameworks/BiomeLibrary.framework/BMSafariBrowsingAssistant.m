@interface BMSafariBrowsingAssistant
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistant)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistant)initWithWebpageViewStarted:(id)a3 dimensionContext:(id)a4 bloomFilterPassed:(id)a5 eligible:(id)a6 webpageUrlSent:(id)a7 serverRequestContext:(id)a8 visualComponentPresentationContext:(id)a9 userInteractionDetected:(id)a10;
- (BMSafariBrowsingAssistantBloomFilterPassed)bloomFilterPassed;
- (BMSafariBrowsingAssistantDimensionContext)dimensionContext;
- (BMSafariBrowsingAssistantEligible)eligible;
- (BMSafariBrowsingAssistantServerRequestContext)serverRequestContext;
- (BMSafariBrowsingAssistantUserInteractionDetected)userInteractionDetected;
- (BMSafariBrowsingAssistantVisualComponentPresentationContext)visualComponentPresentationContext;
- (BMSafariBrowsingAssistantWebpageUrlSent)webpageUrlSent;
- (BMSafariBrowsingAssistantWebpageViewStarted)webpageViewStarted;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionDetected, 0);
  objc_storeStrong((id *)&self->_visualComponentPresentationContext, 0);
  objc_storeStrong((id *)&self->_serverRequestContext, 0);
  objc_storeStrong((id *)&self->_webpageUrlSent, 0);
  objc_storeStrong((id *)&self->_eligible, 0);
  objc_storeStrong((id *)&self->_bloomFilterPassed, 0);
  objc_storeStrong((id *)&self->_dimensionContext, 0);

  objc_storeStrong((id *)&self->_webpageViewStarted, 0);
}

- (BMSafariBrowsingAssistantUserInteractionDetected)userInteractionDetected
{
  return self->_userInteractionDetected;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationContext)visualComponentPresentationContext
{
  return self->_visualComponentPresentationContext;
}

- (BMSafariBrowsingAssistantServerRequestContext)serverRequestContext
{
  return self->_serverRequestContext;
}

- (BMSafariBrowsingAssistantWebpageUrlSent)webpageUrlSent
{
  return self->_webpageUrlSent;
}

- (BMSafariBrowsingAssistantEligible)eligible
{
  return self->_eligible;
}

- (BMSafariBrowsingAssistantBloomFilterPassed)bloomFilterPassed
{
  return self->_bloomFilterPassed;
}

- (BMSafariBrowsingAssistantDimensionContext)dimensionContext
{
  return self->_dimensionContext;
}

- (BMSafariBrowsingAssistantWebpageViewStarted)webpageViewStarted
{
  return self->_webpageViewStarted;
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
    v6 = [(BMSafariBrowsingAssistant *)self webpageViewStarted];
    uint64_t v7 = [v5 webpageViewStarted];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistant *)self webpageViewStarted];
      v10 = [v5 webpageViewStarted];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_29;
      }
    }
    v13 = [(BMSafariBrowsingAssistant *)self dimensionContext];
    uint64_t v14 = [v5 dimensionContext];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariBrowsingAssistant *)self dimensionContext];
      v17 = [v5 dimensionContext];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_29;
      }
    }
    v19 = [(BMSafariBrowsingAssistant *)self bloomFilterPassed];
    uint64_t v20 = [v5 bloomFilterPassed];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSafariBrowsingAssistant *)self bloomFilterPassed];
      v23 = [v5 bloomFilterPassed];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_29;
      }
    }
    v25 = [(BMSafariBrowsingAssistant *)self eligible];
    uint64_t v26 = [v5 eligible];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSafariBrowsingAssistant *)self eligible];
      v29 = [v5 eligible];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_29;
      }
    }
    v31 = [(BMSafariBrowsingAssistant *)self webpageUrlSent];
    uint64_t v32 = [v5 webpageUrlSent];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSafariBrowsingAssistant *)self webpageUrlSent];
      v35 = [v5 webpageUrlSent];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_29;
      }
    }
    v37 = [(BMSafariBrowsingAssistant *)self serverRequestContext];
    uint64_t v38 = [v5 serverRequestContext];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMSafariBrowsingAssistant *)self serverRequestContext];
      v41 = [v5 serverRequestContext];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_29;
      }
    }
    v43 = [(BMSafariBrowsingAssistant *)self visualComponentPresentationContext];
    uint64_t v44 = [v5 visualComponentPresentationContext];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMSafariBrowsingAssistant *)self visualComponentPresentationContext];
      v47 = [v5 visualComponentPresentationContext];
      int v48 = [v46 isEqual:v47];

      if (!v48)
      {
LABEL_29:
        char v12 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    v50 = [(BMSafariBrowsingAssistant *)self userInteractionDetected];
    v51 = [v5 userInteractionDetected];
    if (v50 == v51)
    {
      char v12 = 1;
    }
    else
    {
      v52 = [(BMSafariBrowsingAssistant *)self userInteractionDetected];
      v53 = [v5 userInteractionDetected];
      char v12 = [v52 isEqual:v53];
    }
    goto LABEL_30;
  }
  char v12 = 0;
LABEL_31:

  return v12;
}

- (id)jsonDictionary
{
  v37[8] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariBrowsingAssistant *)self webpageViewStarted];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = [(BMSafariBrowsingAssistant *)self dimensionContext];
  uint64_t v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMSafariBrowsingAssistant *)self bloomFilterPassed];
  uint64_t v8 = [v7 jsonDictionary];

  v9 = [(BMSafariBrowsingAssistant *)self eligible];
  uint64_t v10 = [v9 jsonDictionary];

  int v11 = [(BMSafariBrowsingAssistant *)self webpageUrlSent];
  char v12 = [v11 jsonDictionary];

  v13 = [(BMSafariBrowsingAssistant *)self serverRequestContext];
  uint64_t v14 = [v13 jsonDictionary];

  v15 = [(BMSafariBrowsingAssistant *)self visualComponentPresentationContext];
  v16 = [v15 jsonDictionary];

  v17 = [(BMSafariBrowsingAssistant *)self userInteractionDetected];
  int v18 = [v17 jsonDictionary];

  v36[0] = @"webpageViewStarted";
  uint64_t v19 = v4;
  if (!v4)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v19;
  v37[0] = v19;
  v36[1] = @"dimensionContext";
  uint64_t v20 = v6;
  if (!v6)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v4;
  int v30 = (void *)v20;
  v37[1] = v20;
  v36[2] = @"bloomFilterPassed";
  uint64_t v21 = v8;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v6;
  v29 = (void *)v21;
  v37[2] = v21;
  v36[3] = @"eligible";
  v22 = (void *)v10;
  if (!v10)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v8;
  v37[3] = v22;
  v36[4] = @"webpageUrlSent";
  v23 = v12;
  if (!v12)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v10;
  v37[4] = v23;
  v36[5] = @"serverRequestContext";
  int v24 = v14;
  if (!v14)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[5] = v24;
  v36[6] = @"visualComponentPresentationContext";
  v25 = v16;
  if (!v16)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[6] = v25;
  v36[7] = @"userInteractionDetected";
  uint64_t v26 = v18;
  if (!v18)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[7] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:8];
  if (v18)
  {
    if (v16) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v16) {
      goto LABEL_19;
    }
  }

LABEL_19:
  if (!v14) {

  }
  if (!v12) {
  if (!v32)
  }

  if (!v33) {
  if (v34)
  }
  {
    if (v35) {
      goto LABEL_29;
    }
  }
  else
  {

    if (v35) {
      goto LABEL_29;
    }
  }

LABEL_29:

  return v27;
}

- (BMSafariBrowsingAssistant)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v126[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"webpageViewStarted"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v110 = 0;
    uint64_t v8 = [[BMSafariBrowsingAssistantWebpageViewStarted alloc] initWithJSONDictionary:v9 error:&v110];
    id v22 = v110;
    if (v22)
    {
      v23 = v22;
      if (a4) {
        *a4 = v22;
      }

LABEL_50:
      uint64_t v21 = 0;
      goto LABEL_100;
    }

LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"dimensionContext"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v101 = 0;
LABEL_7:
      id v10 = [v6 objectForKeyedSubscript:@"bloomFilterPassed"];
      v102 = self;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        int v11 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v10;
        id v108 = 0;
        int v11 = [[BMSafariBrowsingAssistantBloomFilterPassed alloc] initWithJSONDictionary:v12 error:&v108];
        id v28 = v108;
        if (v28)
        {
          v29 = v28;
          if (a4) {
            *a4 = v28;
          }

          uint64_t v21 = 0;
          goto LABEL_97;
        }

LABEL_10:
        id v12 = [v6 objectForKeyedSubscript:@"eligible"];
        v96 = a4;
        if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              uint64_t v21 = 0;
LABEL_97:
              v25 = v101;
              goto LABEL_98;
            }
            id v95 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v58 = *MEMORY[0x1E4F502C8];
            uint64_t v119 = *MEMORY[0x1E4F28568];
            v82 = v11;
            v59 = a4;
            v97 = (BMSafariBrowsingAssistantEligible *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"eligible"];
            v120 = v97;
            id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
            id v60 = (id)[v95 initWithDomain:v58 code:2 userInfo:v13];
            uint64_t v21 = 0;
            id *v59 = v60;
            int v11 = v82;
LABEL_96:

            goto LABEL_97;
          }
          id v13 = v12;
          id v107 = 0;
          v97 = [[BMSafariBrowsingAssistantEligible alloc] initWithJSONDictionary:v13 error:&v107];
          id v35 = v107;
          if (v35)
          {
            int v36 = v35;
            if (v96) {
              id *v96 = v35;
            }

LABEL_74:
            uint64_t v21 = 0;
            goto LABEL_96;
          }
        }
        else
        {
          v97 = 0;
        }
        id v13 = [v6 objectForKeyedSubscript:@"webpageUrlSent"];
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v90 = v13;
          uint64_t v14 = v11;
          v94 = 0;
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v42 = v13;
          uint64_t v14 = v11;
          id v90 = v42;
          id v43 = v42;
          id v106 = 0;
          v94 = [[BMSafariBrowsingAssistantWebpageUrlSent alloc] initWithJSONDictionary:v43 error:&v106];
          id v44 = v106;
          if (v44)
          {
            v45 = v44;
            if (v96) {
              id *v96 = v44;
            }

            uint64_t v21 = 0;
            v46 = v43;
            goto LABEL_105;
          }

LABEL_16:
          uint64_t v15 = [v6 objectForKeyedSubscript:@"serverRequestContext"];
          v89 = (void *)v15;
          if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v86 = v12;
            v92 = 0;
            goto LABEL_19;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v53 = v16;
            id v105 = 0;
            v92 = [[BMSafariBrowsingAssistantServerRequestContext alloc] initWithJSONDictionary:v53 error:&v105];
            id v54 = v105;
            id v86 = v12;
            if (v54)
            {
              v55 = v54;
              id v56 = v53;
              int v11 = v14;
              if (v96) {
                id *v96 = v54;
              }

              uint64_t v21 = 0;
              id v13 = v90;
              v57 = v56;
              goto LABEL_108;
            }

LABEL_19:
            int v11 = v14;
            uint64_t v17 = [v6 objectForKeyedSubscript:@"visualComponentPresentationContext"];
            id v13 = v90;
            v98 = v8;
            v84 = (void *)v17;
            if (!v17 || (int v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v87 = 0;
              goto LABEL_22;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              id v104 = 0;
              v87 = [[BMSafariBrowsingAssistantVisualComponentPresentationContext alloc] initWithJSONDictionary:v19 error:&v104];
              id v61 = v104;
              if (v61)
              {
                v62 = v61;
                id v12 = v86;
                if (v96) {
                  id *v96 = v61;
                }

                uint64_t v21 = 0;
                goto LABEL_93;
              }

LABEL_22:
              id v12 = v86;
              id v19 = [v6 objectForKeyedSubscript:@"userInteractionDetected"];
              if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                uint64_t v20 = 0;
LABEL_25:
                uint64_t v21 = [(BMSafariBrowsingAssistant *)v102 initWithWebpageViewStarted:v98 dimensionContext:v101 bloomFilterPassed:v11 eligible:v97 webpageUrlSent:v94 serverRequestContext:v92 visualComponentPresentationContext:v87 userInteractionDetected:v20];
                v102 = v21;
LABEL_92:

                goto LABEL_93;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v103 = 0;
                id v80 = v19;
                uint64_t v20 = [[BMSafariBrowsingAssistantUserInteractionDetected alloc] initWithJSONDictionary:v80 error:&v103];
                id v67 = v103;
                if (!v67)
                {

                  goto LABEL_25;
                }
                v68 = v67;
                v83 = v11;
                if (v96) {
                  id *v96 = v67;
                }
              }
              else
              {
                v83 = v11;
                if (!v96)
                {
                  uint64_t v21 = 0;
                  goto LABEL_93;
                }
                id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v79 = *MEMORY[0x1E4F502C8];
                uint64_t v111 = *MEMORY[0x1E4F28568];
                uint64_t v20 = (BMSafariBrowsingAssistantUserInteractionDetected *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"userInteractionDetected"];
                v112 = v20;
                v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
                id *v96 = (id)[v81 initWithDomain:v79 code:2 userInfo:v75];
              }
              uint64_t v21 = 0;
              int v11 = v83;
              goto LABEL_92;
            }
            if (v96)
            {
              id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v73 = *MEMORY[0x1E4F502C8];
              uint64_t v113 = *MEMORY[0x1E4F28568];
              v87 = (BMSafariBrowsingAssistantVisualComponentPresentationContext *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"visualComponentPresentationContext"];
              v114 = v87;
              id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
              id v74 = (id)[v72 initWithDomain:v73 code:2 userInfo:v19];
              uint64_t v21 = 0;
              id *v96 = v74;
              id v12 = v86;
LABEL_93:

              uint64_t v8 = v98;
              v57 = v84;
              goto LABEL_94;
            }
            uint64_t v21 = 0;
            v57 = v84;
LABEL_108:
            id v12 = v86;
            goto LABEL_94;
          }
          if (v96)
          {
            id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v85 = *MEMORY[0x1E4F502C8];
            uint64_t v115 = *MEMORY[0x1E4F28568];
            v69 = v8;
            id v70 = [NSString alloc];
            uint64_t v78 = objc_opt_class();
            v71 = v70;
            uint64_t v8 = v69;
            int v11 = v14;
            v92 = (BMSafariBrowsingAssistantServerRequestContext *)[v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v78, @"serverRequestContext"];
            v116 = v92;
            v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
            uint64_t v21 = 0;
            id *v96 = (id)[v88 initWithDomain:v85 code:2 userInfo:v57];
            id v13 = v90;
LABEL_94:

            v46 = v89;
            goto LABEL_95;
          }
          uint64_t v21 = 0;
          v46 = v89;
LABEL_105:
          int v11 = v14;
          id v13 = v90;
          goto LABEL_95;
        }
        if (v96)
        {
          id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v91 = *MEMORY[0x1E4F502C8];
          uint64_t v117 = *MEMORY[0x1E4F28568];
          v63 = v11;
          v64 = v8;
          id v65 = [NSString alloc];
          uint64_t v77 = objc_opt_class();
          v66 = v65;
          uint64_t v8 = v64;
          int v11 = v63;
          v94 = (BMSafariBrowsingAssistantWebpageUrlSent *)[v66 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v77, @"webpageUrlSent"];
          v118 = v94;
          v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
          uint64_t v21 = 0;
          id *v96 = (id)[v93 initWithDomain:v91 code:2 userInfo:v46];
LABEL_95:

          goto LABEL_96;
        }
        goto LABEL_74;
      }
      if (a4)
      {
        v100 = v8;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v48 = *MEMORY[0x1E4F502C8];
        uint64_t v121 = *MEMORY[0x1E4F28568];
        v49 = a4;
        uint64_t v50 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bloomFilterPassed"];
        uint64_t v122 = v50;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
        v51 = v47;
        uint64_t v8 = v100;
        v25 = v101;
        id v52 = (id)[v51 initWithDomain:v48 code:2 userInfo:v12];
        uint64_t v21 = 0;
        id *v49 = v52;
        int v11 = (BMSafariBrowsingAssistantBloomFilterPassed *)v50;
LABEL_98:

        self = v102;
        goto LABEL_99;
      }
      uint64_t v21 = 0;
      v25 = v101;
LABEL_99:

      goto LABEL_100;
    }
    int v24 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v109 = 0;
      v25 = [[BMSafariBrowsingAssistantDimensionContext alloc] initWithJSONDictionary:v10 error:&v109];
      id v26 = v109;
      if (v26)
      {
        v27 = v26;
        if (v24) {
          *int v24 = v26;
        }

        uint64_t v21 = 0;
        goto LABEL_99;
      }
      v101 = v25;

      a4 = v24;
      goto LABEL_7;
    }
    if (a4)
    {
      v99 = v8;
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v38 = *MEMORY[0x1E4F502C8];
      uint64_t v123 = *MEMORY[0x1E4F28568];
      uint64_t v39 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"dimensionContext"];
      uint64_t v124 = v39;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      v40 = v37;
      uint64_t v8 = v99;
      v25 = (BMSafariBrowsingAssistantDimensionContext *)v39;
      id v41 = (id)[v40 initWithDomain:v38 code:2 userInfo:v10];
      uint64_t v21 = 0;
      *int v24 = v41;
      goto LABEL_99;
    }
    goto LABEL_50;
  }
  if (a4)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = *MEMORY[0x1E4F502C8];
    uint64_t v125 = *MEMORY[0x1E4F28568];
    uint64_t v32 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"webpageViewStarted"];
    v126[0] = v32;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:&v125 count:1];
    v33 = v30;
    uint64_t v8 = (BMSafariBrowsingAssistantWebpageViewStarted *)v32;
    id v34 = (id)[v33 initWithDomain:v31 code:2 userInfo:v9];
    uint64_t v21 = 0;
    *a4 = v34;
LABEL_100:

    goto LABEL_101;
  }
  uint64_t v21 = 0;
LABEL_101:

  return v21;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistant *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_webpageViewStarted)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantWebpageViewStarted *)self->_webpageViewStarted writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_dimensionContext)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantDimensionContext *)self->_dimensionContext writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_bloomFilterPassed)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantBloomFilterPassed *)self->_bloomFilterPassed writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_eligible)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantEligible *)self->_eligible writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_webpageUrlSent)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantWebpageUrlSent *)self->_webpageUrlSent writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_serverRequestContext)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantServerRequestContext *)self->_serverRequestContext writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_visualComponentPresentationContext)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self->_visualComponentPresentationContext writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_userInteractionDetected)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantUserInteractionDetected *)self->_userInteractionDetected writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMSafariBrowsingAssistant;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_50;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
        if (v11++ >= 9)
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
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantWebpageViewStarted alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 24;
          goto LABEL_46;
        case 2u:
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantDimensionContext alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 32;
          goto LABEL_46;
        case 3u:
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantBloomFilterPassed alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 40;
          goto LABEL_46;
        case 4u:
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantEligible alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 48;
          goto LABEL_46;
        case 5u:
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantWebpageUrlSent alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 56;
          goto LABEL_46;
        case 6u:
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantServerRequestContext alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 64;
          goto LABEL_46;
        case 7u:
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantVisualComponentPresentationContext alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 72;
          goto LABEL_46;
        case 8u:
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMSafariBrowsingAssistantUserInteractionDetected alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 80;
LABEL_46:
          uint64_t v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = v19;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_49;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_49:
  }
    id v22 = 0;
  else {
LABEL_50:
  }
    id v22 = v5;

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariBrowsingAssistant *)self webpageViewStarted];
  id v5 = [(BMSafariBrowsingAssistant *)self dimensionContext];
  id v6 = [(BMSafariBrowsingAssistant *)self bloomFilterPassed];
  uint64_t v7 = [(BMSafariBrowsingAssistant *)self eligible];
  uint64_t v8 = [(BMSafariBrowsingAssistant *)self webpageUrlSent];
  id v9 = [(BMSafariBrowsingAssistant *)self serverRequestContext];
  char v10 = [(BMSafariBrowsingAssistant *)self visualComponentPresentationContext];
  unsigned int v11 = [(BMSafariBrowsingAssistant *)self userInteractionDetected];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistant with webpageViewStarted: %@, dimensionContext: %@, bloomFilterPassed: %@, eligible: %@, webpageUrlSent: %@, serverRequestContext: %@, visualComponentPresentationContext: %@, userInteractionDetected: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMSafariBrowsingAssistant)initWithWebpageViewStarted:(id)a3 dimensionContext:(id)a4 bloomFilterPassed:(id)a5 eligible:(id)a6 webpageUrlSent:(id)a7 serverRequestContext:(id)a8 visualComponentPresentationContext:(id)a9 userInteractionDetected:(id)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v21 = a8;
  id v20 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariBrowsingAssistant;
  int v18 = [(BMEventBase *)&v27 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_webpageViewStarted, a3);
    objc_storeStrong((id *)&v18->_dimensionContext, a4);
    objc_storeStrong((id *)&v18->_bloomFilterPassed, a5);
    objc_storeStrong((id *)&v18->_eligible, a6);
    objc_storeStrong((id *)&v18->_webpageUrlSent, a7);
    objc_storeStrong((id *)&v18->_serverRequestContext, a8);
    objc_storeStrong((id *)&v18->_visualComponentPresentationContext, a9);
    objc_storeStrong((id *)&v18->_userInteractionDetected, a10);
  }

  return v18;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webpageViewStarted" number:1 type:14 subMessageClass:objc_opt_class()];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dimensionContext" number:2 type:14 subMessageClass:objc_opt_class()];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bloomFilterPassed" number:3 type:14 subMessageClass:objc_opt_class()];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eligible" number:4 type:14 subMessageClass:objc_opt_class()];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webpageUrlSent" number:5 type:14 subMessageClass:objc_opt_class()];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serverRequestContext" number:6 type:14 subMessageClass:objc_opt_class()];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualComponentPresentationContext" number:7 type:14 subMessageClass:objc_opt_class()];
  v12[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userInteractionDetected" number:8 type:14 subMessageClass:objc_opt_class()];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5718;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"webpageViewStarted_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_951];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"dimensionContext_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_953];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bloomFilterPassed_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_955];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"eligible_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_957];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"webpageUrlSent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_959];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"serverRequestContext_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_961];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"visualComponentPresentationContext_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_963];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"userInteractionDetected_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_965];
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

id __36__BMSafariBrowsingAssistant_columns__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 userInteractionDetected];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 visualComponentPresentationContext];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 serverRequestContext];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 webpageUrlSent];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 eligible];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 bloomFilterPassed];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 dimensionContext];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __36__BMSafariBrowsingAssistant_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 webpageViewStarted];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
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

    uint64_t v8 = [[BMSafariBrowsingAssistant alloc] initByReadFrom:v7];
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