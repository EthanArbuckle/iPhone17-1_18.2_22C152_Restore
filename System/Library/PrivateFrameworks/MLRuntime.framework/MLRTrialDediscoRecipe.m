@interface MLRTrialDediscoRecipe
- (MLRTrialDediscoRecipe)initWithAssetURL:(id)a3 configOverride:(id)a4 error:(id *)a5;
- (NSDictionary)dediscoTaskConfig;
- (NSDictionary)dpConfig;
- (NSDictionary)encodingSchema;
- (NSString)baseKeyFormat;
- (id)description;
- (id)mlrDediscoMetadata;
@end

@implementation MLRTrialDediscoRecipe

- (MLRTrialDediscoRecipe)initWithAssetURL:(id)a3 configOverride:(id)a4 error:(id *)a5
{
  v71[2] = *MEMORY[0x263EF8340];
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    id v52 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"assetURL and configOverride cannot be both nil" userInfo:0];
    objc_exception_throw(v52);
  }
  v10 = (void *)v9;
  v61.receiver = self;
  v61.super_class = (Class)MLRTrialDediscoRecipe;
  v11 = [(MLRTrialDediscoRecipe *)&v61 init];
  if (v11)
  {
    v12 = [MEMORY[0x263EFF9A0] dictionary];
    if (v8)
    {
      v57 = a5;
      id v60 = 0;
      v13 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8 options:8 error:&v60];
      id v14 = v60;
      if (v13)
      {
        id v59 = v14;
        v15 = [MEMORY[0x263F08900] JSONObjectWithData:v13 options:0 error:&v59];
        id v16 = v59;

        if (v15)
        {
          v55 = v16;
          v17 = [v15 objectForKeyedSubscript:@"dediscoConfig"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v19 = [v15 objectForKeyedSubscript:@"dediscoConfig"];
            uint64_t v20 = [v19 mutableCopy];

            v12 = (void *)v20;
            v21 = v55;
            a5 = v57;
            if (!v10)
            {
LABEL_12:
              uint64_t v23 = [v12 objectForKeyedSubscript:@"encodingSchema"];
              encodingSchema = v11->_encodingSchema;
              v11->_encodingSchema = (NSDictionary *)v23;

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v25 = [v12 objectForKeyedSubscript:@"baseKey"];
                baseKeyFormat = v11->_baseKeyFormat;
                v11->_baseKeyFormat = (NSString *)v25;

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v27 = [v12 objectForKeyedSubscript:@"DifferentialPrivacyParameters"];
                  dpConfig = v11->_dpConfig;
                  v11->_dpConfig = (NSDictionary *)v27;

                  uint64_t v29 = [v12 objectForKeyedSubscript:@"DediscoTaskConfig"];
                  dediscoTaskConfig = v11->_dediscoTaskConfig;
                  v11->_dediscoTaskConfig = (NSDictionary *)v29;

                  v22 = v11;
                  id v31 = v21;
LABEL_29:

                  goto LABEL_30;
                }
                v58 = v12;
                v32 = (void *)MEMORY[0x263F087E8];
                v33 = v21;
                uint64_t v34 = *MEMORY[0x263F3A4A0];
                uint64_t v62 = *MEMORY[0x263F08320];
                v35 = [NSString stringWithFormat:@"key=%@ is of wrong type, value=%@", @"baseKey", v11->_baseKeyFormat];
                v63 = v35;
                v36 = NSDictionary;
                v37 = &v63;
                v38 = &v62;
              }
              else
              {
                v58 = v12;
                v32 = (void *)MEMORY[0x263F087E8];
                v33 = v21;
                uint64_t v34 = *MEMORY[0x263F3A4A0];
                uint64_t v64 = *MEMORY[0x263F08320];
                v35 = [NSString stringWithFormat:@"key=%@ is of wrong type, value=%@", @"encodingSchema", v11->_encodingSchema];
                v65 = v35;
                v36 = NSDictionary;
                v37 = &v65;
                v38 = &v64;
              }
              v46 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:1];
              id v31 = [v32 errorWithDomain:v34 code:5007 userInfo:v46];

              if (a5)
              {
                id v31 = v31;
                v22 = 0;
                *a5 = v31;
              }
              else
              {
                v22 = 0;
              }
              v12 = v58;
              goto LABEL_29;
            }
LABEL_11:
            [v12 addEntriesFromDictionary:v10];
            goto LABEL_12;
          }
          v54 = (void *)MEMORY[0x263F087E8];
          uint64_t v53 = *MEMORY[0x263F3A4A0];
          uint64_t v66 = *MEMORY[0x263F08320];
          v47 = NSString;
          v48 = [v15 objectForKeyedSubscript:@"dediscoConfig"];
          v49 = [v47 stringWithFormat:@"key=%@ is of wrong type, value=%@", @"dediscoConfig", v48];
          v67 = v49;
          v50 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          id v31 = [v54 errorWithDomain:v53 code:5007 userInfo:v50];
        }
        else
        {
          v56 = (void *)MEMORY[0x263F087E8];
          uint64_t v43 = *MEMORY[0x263F3A4A0];
          v68[0] = *MEMORY[0x263F08320];
          v44 = [NSString stringWithFormat:@"Fail to decode recipe from path=%@", v8];
          v68[1] = *MEMORY[0x263F08608];
          v69[0] = v44;
          v69[1] = v16;
          v45 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
          id v31 = [v56 errorWithDomain:v43 code:5007 userInfo:v45];
        }
        if (v57)
        {
          id v31 = v31;
          id *v57 = v31;
        }
      }
      else
      {
        v39 = (void *)MEMORY[0x263F087E8];
        uint64_t v40 = *MEMORY[0x263F3A4A0];
        v70[0] = *MEMORY[0x263F08320];
        v41 = [NSString stringWithFormat:@"Fail to read recipe with path=%@", v8];
        v70[1] = *MEMORY[0x263F08608];
        v71[0] = v41;
        v71[1] = v14;
        v42 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
        id v31 = [v39 errorWithDomain:v40 code:5007 userInfo:v42];

        if (v57)
        {
          id v31 = v31;
          v22 = 0;
          id *v57 = v31;
          goto LABEL_29;
        }
      }
      v22 = 0;
      goto LABEL_29;
    }
    v21 = 0;
    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v22 = 0;
LABEL_30:

  return v22;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MLRTrialDediscoRecipe *)self baseKeyFormat];
  v7 = [(MLRTrialDediscoRecipe *)self encodingSchema];
  unint64_t v8 = [(MLRTrialDediscoRecipe *)self dpConfig];
  unint64_t v9 = [(MLRTrialDediscoRecipe *)self dediscoTaskConfig];
  v10 = [v3 stringWithFormat:@"%@\n(%@, %@, %@, %@)\n", v5, v6, v7, v8, v9];

  return v10;
}

- (id)mlrDediscoMetadata
{
  v3 = [(MLRTrialDediscoRecipe *)self dpConfig];

  if (v3)
  {
    v4 = [(MLRTrialDediscoRecipe *)self dediscoTaskConfig];

    if (v4)
    {
      v5 = (void *)MEMORY[0x263EFF9A0];
      v6 = [(MLRTrialDediscoRecipe *)self dpConfig];
      v3 = [v5 dictionaryWithDictionary:v6];

      v7 = [(MLRTrialDediscoRecipe *)self dediscoTaskConfig];
      [v3 setObject:v7 forKeyedSubscript:@"DediscoTaskConfig"];
    }
    else
    {
      v3 = [(MLRTrialDediscoRecipe *)self dpConfig];
    }
  }

  return v3;
}

- (NSString)baseKeyFormat
{
  return self->_baseKeyFormat;
}

- (NSDictionary)encodingSchema
{
  return self->_encodingSchema;
}

- (NSDictionary)dpConfig
{
  return self->_dpConfig;
}

- (NSDictionary)dediscoTaskConfig
{
  return self->_dediscoTaskConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dediscoTaskConfig, 0);
  objc_storeStrong((id *)&self->_dpConfig, 0);
  objc_storeStrong((id *)&self->_encodingSchema, 0);

  objc_storeStrong((id *)&self->_baseKeyFormat, 0);
}

@end