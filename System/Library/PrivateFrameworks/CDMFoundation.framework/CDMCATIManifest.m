@interface CDMCATIManifest
- (BOOL)isPreGuidVersion;
- (BOOL)manifestValid;
- (BOOL)validateManifest;
- (CDMCATIManifest)initWithPath:(id)a3;
- (NSDictionary)intentLookup;
- (NSDictionary)manifest;
- (NSDictionary)positiveOverrides;
- (NSDictionary)weights;
- (NSString)GUID;
- (NSString)date;
- (NSString)locale;
- (NSString)usoEdge;
- (NSString)usoEntity;
- (NSString)usoVerb;
- (NSString)version;
- (float)confidenceScoreThreshold;
- (float)getMultiturnThresholdValue:(id)a3;
- (float)getThresholdValue:(id)a3;
- (float)multiturnConfidenceScoreThreshold;
- (id)getPositiveOverrideGuidsForModelType:(unint64_t)a3;
- (id)getWeightGuidsForModelType:(unint64_t)a3;
- (int)expectedPositiveUtterances;
- (int)getExpectedPositiveUtterancesValue:(id)a3;
- (int)getUsoElementId:(id)a3;
- (int)usoElementId;
- (void)extractWeightsAndOverridesFromManifest:(id)a3;
- (void)getWeightsAndOverridesAtIntentKeyFromManifest:(id)a3;
- (void)getWeightsAndOverridesWithLegacyKeysFromManifest:(id)a3;
- (void)readCatiManifest:(id)a3;
- (void)setConfidenceScoreThreshold:(float)a3;
- (void)setDate:(id)a3;
- (void)setExpectedPositiveUtterances:(int)a3;
- (void)setGUID:(id)a3;
- (void)setIntentLookup:(id)a3;
- (void)setIsPreGuidVersion:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setManifest:(id)a3;
- (void)setManifestValid:(BOOL)a3;
- (void)setMultiturnConfidenceScoreThreshold:(float)a3;
- (void)setPositiveOverrides:(id)a3;
- (void)setUsoEdge:(id)a3;
- (void)setUsoElementId:(int)a3;
- (void)setUsoEntity:(id)a3;
- (void)setUsoVerb:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWeights:(id)a3;
@end

@implementation CDMCATIManifest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentLookup, 0);
  objc_storeStrong((id *)&self->_positiveOverrides, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_usoEdge, 0);
  objc_storeStrong((id *)&self->_usoVerb, 0);
  objc_storeStrong((id *)&self->_usoEntity, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

- (void)setIsPreGuidVersion:(BOOL)a3
{
  self->_isPreGuidVersion = a3;
}

- (BOOL)isPreGuidVersion
{
  return self->_isPreGuidVersion;
}

- (void)setIntentLookup:(id)a3
{
}

- (NSDictionary)intentLookup
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPositiveOverrides:(id)a3
{
}

- (NSDictionary)positiveOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWeights:(id)a3
{
}

- (NSDictionary)weights
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExpectedPositiveUtterances:(int)a3
{
  self->_expectedPositiveUtterances = a3;
}

- (int)expectedPositiveUtterances
{
  return self->_expectedPositiveUtterances;
}

- (void)setUsoEdge:(id)a3
{
}

- (NSString)usoEdge
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUsoVerb:(id)a3
{
}

- (NSString)usoVerb
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUsoElementId:(int)a3
{
  self->_usoElementId = a3;
}

- (int)usoElementId
{
  return self->_usoElementId;
}

- (void)setUsoEntity:(id)a3
{
}

- (NSString)usoEntity
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMultiturnConfidenceScoreThreshold:(float)a3
{
  self->_multiturnConfidenceScoreThreshold = a3;
}

- (float)multiturnConfidenceScoreThreshold
{
  return self->_multiturnConfidenceScoreThreshold;
}

- (void)setConfidenceScoreThreshold:(float)a3
{
  self->_confidenceScoreThreshold = a3;
}

- (float)confidenceScoreThreshold
{
  return self->_confidenceScoreThreshold;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setGUID:(id)a3
{
}

- (NSString)GUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDate:(id)a3
{
}

- (NSString)date
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setManifestValid:(BOOL)a3
{
  self->_manifestValid = a3;
}

- (BOOL)manifestValid
{
  return self->_manifestValid;
}

- (void)setManifest:(id)a3
{
}

- (NSDictionary)manifest
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)getWeightsAndOverridesWithLegacyKeysFromManifest:(id)a3
{
  id v31 = a3;
  v34 = [v31 objectForKey:@"weights"];
  v3 = [v31 objectForKey:@"positive-overrides"];
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  for (unint64_t i = 0; [v3 count] > i; ++i)
  {
    v6 = objc_alloc_init(CDMCATIIntent);
    v7 = [v3 objectAtIndexedSubscript:i];
    v8 = [v7 componentsSeparatedByString:@"."];
    v9 = [v8 objectAtIndexedSubscript:0];
    [(CDMCATIIntent *)v6 setIntentName:v9];

    v10 = [(CDMCATIIntent *)v6 intentName];
    [(CDMCATIIntent *)v6 setGuid:v10];

    [(CDMCATIIntent *)v6 setEnsemble:@"invocation"];
    v11 = [(CDMCATIIntent *)v6 guid];
    [v4 setObject:v6 forKey:v11];

    v12 = [(CDMCATIIntent *)v6 guid];
    [v35 addObject:v12];

    v13 = [v3 objectAtIndexedSubscript:i];
    LODWORD(v12) = [v34 containsObject:v13];

    if (v12)
    {
      v14 = [(CDMCATIIntent *)v6 guid];
      [v33 addObject:v14];
    }
  }
  v15 = (NSDictionary *)[objc_alloc(NSDictionary) initWithDictionary:v4];
  intentLookup = self->_intentLookup;
  self->_intentLookup = v15;

  id v17 = objc_alloc(NSDictionary);
  v18 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v33];
  v19 = [NSNumber numberWithInteger:0];
  id v20 = objc_alloc_init(MEMORY[0x263EFFA08]);
  v21 = [NSNumber numberWithInteger:1];
  v22 = (NSDictionary *)objc_msgSend(v17, "initWithObjectsAndKeys:", v18, v19, v20, v21, 0);
  weights = self->_weights;
  self->_weights = v22;

  id v24 = objc_alloc(NSDictionary);
  v25 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v35];
  v26 = [NSNumber numberWithInteger:0];
  id v27 = objc_alloc_init(MEMORY[0x263EFFA08]);
  v28 = [NSNumber numberWithInteger:1];
  v29 = (NSDictionary *)objc_msgSend(v24, "initWithObjectsAndKeys:", v25, v26, v27, v28, 0);
  positiveOverrides = self->_positiveOverrides;
  self->_positiveOverrides = v29;
}

- (id)getWeightGuidsForModelType:(unint64_t)a3
{
  if (a3 > 1)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  else
  {
    weights = self->_weights;
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    id v5 = [(NSDictionary *)weights objectForKey:v4];
  }
  return v5;
}

- (id)getPositiveOverrideGuidsForModelType:(unint64_t)a3
{
  if (a3 > 1)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  else
  {
    positiveOverrides = self->_positiveOverrides;
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    id v5 = [(NSDictionary *)positiveOverrides objectForKey:v4];
  }
  return v5;
}

- (void)getWeightsAndOverridesAtIntentKeyFromManifest:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v65 = a3;
  v64 = [v65 objectForKey:@"intents"];
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v66 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v70 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obunint64_t j = v64;
  uint64_t v3 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v3)
  {
    uint64_t v74 = *(void *)v77;
    do
    {
      uint64_t v75 = v3;
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v77 != v74) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
        v7 = [v5 objectForKey:@"modelType"];
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v8 = [NSNumber numberWithInteger:99];
            [v6 addObject:v8];

            v9 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
              __int16 v82 = 2112;
              v83 = v5;
              _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: The modelType key exists but it is not castable to an Array, so the model type is invalid for intent object: %@", buf, 0x16u);
            }
            goto LABEL_49;
          }
        }
        else
        {
          v10 = [NSNumber numberWithInteger:0];
          [v6 addObject:v10];
        }
        v9 = v7;
        for (unint64_t j = 0; [v9 count] > j; ++j)
        {
          v12 = [v9 objectAtIndexedSubscript:j];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            v16 = CDMOSLoggerForCategory(0);
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
              goto LABEL_21;
            }
            *(_DWORD *)buf = 136315394;
            v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
            __int16 v82 = 2112;
            v83 = v5;
            id v17 = v16;
            v18 = "%s [WARN]: The modelType value is not castable to NSNumber, ignoring intent: %@";
            goto LABEL_20;
          }
          v14 = [v9 objectAtIndexedSubscript:j];
          unsigned int v15 = [v14 intValue];

          if (v15 <= 1)
          {
            v16 = [NSNumber numberWithInteger:v15];
            [v6 addObject:v16];
            goto LABEL_21;
          }
          v16 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
            __int16 v82 = 2112;
            v83 = v5;
            id v17 = v16;
            v18 = "%s [WARN]: The modelType value is neither invocation nor multiturn, ignoring intent: %@";
LABEL_20:
            _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, v18, buf, 0x16u);
          }
LABEL_21:
        }
        if (![v6 count])
        {
          v19 = [NSNumber numberWithInteger:99];
          [v6 addObject:v19];
        }
        id v20 = [NSNumber numberWithInteger:99];
        char v21 = [v6 containsObject:v20];

        if ((v21 & 1) == 0)
        {
          if (self->_isPreGuidVersion)
          {
            v73 = [v5 objectForKey:@"weights"];
            v22 = [v5 objectForKey:@"positiveOverrides"];
            v23 = v22;
            if (v22
              && ([v22 componentsSeparatedByString:@"."],
                  id v24 = objc_claimAutoreleasedReturnValue(),
                  [v24 objectAtIndexedSubscript:0],
                  v25 = objc_claimAutoreleasedReturnValue(),
                  v24,
                  v25))
            {
              v26 = [[CDMCATIIntent alloc] initWithGuid:v25 intentName:v25 ensemble:@"invocation"];
              id v27 = [(CDMCATIIntent *)v26 guid];
              [v70 setObject:v26 forKey:v27];

              v28 = [NSNumber numberWithInteger:0];
              int v29 = [v6 containsObject:v28];

              if (v29)
              {
                if ([(CDMCATIIntent *)v73 length])
                {
                  v30 = [(CDMCATIIntent *)v26 guid];
                  [v68 addObject:v30];
                }
                if ([v23 length])
                {
                  id v31 = [(CDMCATIIntent *)v26 guid];
                  [v69 addObject:v31];
                }
              }
            }
            else
            {
              v25 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
                __int16 v82 = 2112;
                v83 = v5;
                _os_log_impl(&dword_2263A0000, v25, OS_LOG_TYPE_INFO, "%s There are no positive overrides for %@, skipping.", buf, 0x16u);
              }
            }

LABEL_37:
          }
          else
          {
            v32 = [CDMCATIIntent alloc];
            id v33 = [v5 objectForKey:@"GUID"];
            v34 = [v5 objectForKey:@"intentName"];
            id v35 = [v5 objectForKey:@"ensemble"];
            v73 = [(CDMCATIIntent *)v32 initWithGuid:v33 intentName:v34 ensemble:v35];

            v36 = [(CDMCATIIntent *)v73 guid];
            [v70 setObject:v73 forKey:v36];

            v37 = [v5 objectForKey:@"weights"];
            int v38 = [v37 BOOLValue];

            v39 = [v5 objectForKey:@"positiveOverrides"];
            int v40 = [v39 BOOLValue];

            v41 = [NSNumber numberWithInteger:0];
            int v42 = [v6 containsObject:v41];

            if (v42)
            {
              if (v38)
              {
                v43 = [(CDMCATIIntent *)v73 guid];
                [v68 addObject:v43];
              }
              if (v40)
              {
                v44 = [(CDMCATIIntent *)v73 guid];
                [v69 addObject:v44];
              }
            }
            v45 = [NSNumber numberWithInteger:1];
            int v46 = [v6 containsObject:v45];

            if (v46)
            {
              if (v38)
              {
                v47 = [(CDMCATIIntent *)v73 guid];
                [v66 addObject:v47];
              }
              if (v40)
              {
                v23 = [(CDMCATIIntent *)v73 guid];
                [v67 addObject:v23];
                goto LABEL_37;
              }
            }
          }
        }
LABEL_49:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
    }
    while (v3);
  }

  v48 = (NSDictionary *)[objc_alloc(NSDictionary) initWithDictionary:v70];
  intentLookup = self->_intentLookup;
  self->_intentLookup = v48;

  id v50 = objc_alloc(NSDictionary);
  v51 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v68];
  v52 = [NSNumber numberWithInteger:0];
  v53 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v66];
  v54 = [NSNumber numberWithInteger:1];
  v55 = (NSDictionary *)objc_msgSend(v50, "initWithObjectsAndKeys:", v51, v52, v53, v54, 0, v64);
  weights = self->_weights;
  self->_weights = v55;

  id v57 = objc_alloc(NSDictionary);
  v58 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v69];
  v59 = [NSNumber numberWithInteger:0];
  v60 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v67];
  v61 = [NSNumber numberWithInteger:1];
  v62 = (NSDictionary *)objc_msgSend(v57, "initWithObjectsAndKeys:", v58, v59, v60, v61, 0);
  positiveOverrides = self->_positiveOverrides;
  self->_positiveOverrides = v62;
}

- (void)extractWeightsAndOverridesFromManifest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"intents"];
  if (v5
    && ([v4 objectForKey:@"intents"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = [v4 objectForKey:@"intents"];
    if ([v8 count])
    {
      v9 = [v8 objectAtIndexedSubscript:0];
      v10 = [v9 objectForKey:@"GUID"];

      if (v10)
      {
        v11 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
          _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Intents key present in manifest and contains guids.", (uint8_t *)&v15, 0xCu);
        }
        BOOL v12 = 0;
      }
      else
      {
        v11 = CDMOSLoggerForCategory(0);
        BOOL v12 = 1;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
          _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Intents key present in manifest, but no guids. This is an older version of assets", (uint8_t *)&v15, 0xCu);
        }
      }

      self->_isPreGuidVersion = v12;
      [(CDMCATIManifest *)self getWeightsAndOverridesAtIntentKeyFromManifest:v4];
    }
    else
    {
      v14 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315138;
        v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
        _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Intents key present in manifest, but it's an empty array. Using legacy keys to get weights and overrides.", (uint8_t *)&v15, 0xCu);
      }

      self->_isPreGuidVersion = 1;
      [(CDMCATIManifest *)self getWeightsAndOverridesWithLegacyKeysFromManifest:v4];
    }
  }
  else
  {
    v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: No intents key in manifest. Using legacy keys to get weights and overrides.", (uint8_t *)&v15, 0xCu);
    }

    self->_isPreGuidVersion = 1;
    [(CDMCATIManifest *)self getWeightsAndOverridesWithLegacyKeysFromManifest:v4];
  }
}

- (int)getUsoElementId:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 intValue];
  }
  else
  {
    id v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "-[CDMCATIManifest getUsoElementId:]";
      __int16 v10 = 2112;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid uso element id key. Current value type: %@", (uint8_t *)&v8, 0x16u);
    }
    int v4 = -1;
  }

  return v4;
}

- (int)getExpectedPositiveUtterancesValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 intValue];
  }
  else
  {
    id v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "-[CDMCATIManifest getExpectedPositiveUtterancesValue:]";
      __int16 v10 = 2112;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid expected number of positive utterances key. Current value type: %@", (uint8_t *)&v8, 0x16u);
    }
    int v4 = -1;
  }

  return v4;
}

- (float)getMultiturnThresholdValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 floatValue];
    float v5 = v4;
  }
  else
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      __int16 v10 = "-[CDMCATIManifest getMultiturnThresholdValue:]";
      __int16 v11 = 2112;
      id v12 = (id)objc_opt_class();
      id v7 = v12;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid multiturn confidence threshold key.Current value type: %@", (uint8_t *)&v9, 0x16u);
    }
    float v5 = 0.7;
  }

  return v5;
}

- (float)getThresholdValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 floatValue];
    float v5 = v4;
  }
  else
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      __int16 v10 = "-[CDMCATIManifest getThresholdValue:]";
      __int16 v11 = 2112;
      id v12 = (id)objc_opt_class();
      id v7 = v12;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid confidence threshold key. Current value type: %@", (uint8_t *)&v9, 0x16u);
    }
    float v5 = 0.9;
  }

  return v5;
}

- (BOOL)validateManifest
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"locale", @"date", @"GUID", @"version", 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v9 = [(NSDictionary *)self->_manifest objectForKey:v8];
        BOOL v10 = v9 == 0;

        if (v10)
        {
          __int16 v11 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v18 = "-[CDMCATIManifest validateManifest]";
            __int16 v19 = 2112;
            uint64_t v20 = v8;
            _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest is invalid. Missing field: %@", buf, 0x16u);
          }

          char v6 = 0;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v4);
  }
  else
  {
    char v6 = 1;
  }

  return v6 & 1;
}

- (void)readCatiManifest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
    if (v7)
    {
      id v12 = 0;
      uint64_t v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v12];
      int v9 = v12;
      if (v8)
      {
        BOOL v10 = [v8 objectForKey:@"cati-manifest"];
        p_super = &self->_manifest->super;
        self->_manifest = v10;
      }
      else
      {
        p_super = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          long long v14 = "-[CDMCATIManifest readCatiManifest:]";
          __int16 v15 = 2112;
          long long v16 = v9;
          _os_log_error_impl(&dword_2263A0000, p_super, OS_LOG_TYPE_ERROR, "%s [ERR]: Error parsing JSON: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      int v9 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v14 = "-[CDMCATIManifest readCatiManifest:]";
        __int16 v15 = 2112;
        long long v16 = v4;
        _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI manifest data could not be read at %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v14 = "-[CDMCATIManifest readCatiManifest:]";
      __int16 v15 = 2112;
      long long v16 = v4;
      _os_log_error_impl(&dword_2263A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI manifest file not found at %@", buf, 0x16u);
    }
  }
}

- (CDMCATIManifest)initWithPath:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CDMCATIManifest;
  uint64_t v5 = [(CDMCATIManifest *)&v44 init];
  char v6 = v5;
  if (!v5) {
    goto LABEL_22;
  }
  v5->_manifestValid = 0;
  [(CDMCATIManifest *)v5 readCatiManifest:v4];
  if (!v6->_manifest) {
    goto LABEL_22;
  }
  BOOL v7 = [(CDMCATIManifest *)v6 validateManifest];
  v6->_manifestValid = v7;
  if (!v7) {
    goto LABEL_22;
  }
  uint64_t v8 = [(NSDictionary *)v6->_manifest objectForKey:@"locale"];
  locale = v6->_locale;
  v6->_locale = (NSString *)v8;

  uint64_t v10 = [(NSDictionary *)v6->_manifest objectForKey:@"date"];
  date = v6->_date;
  v6->_date = (NSString *)v10;

  uint64_t v12 = [(NSDictionary *)v6->_manifest objectForKey:@"GUID"];
  GUID = v6->_GUID;
  v6->_GUID = (NSString *)v12;

  uint64_t v14 = [(NSDictionary *)v6->_manifest objectForKey:@"version"];
  version = v6->_version;
  v6->_version = (NSString *)v14;

  long long v16 = [(NSDictionary *)v6->_manifest objectForKey:@"confidenceThreshold"];
  [(CDMCATIManifest *)v6 getThresholdValue:v16];
  v6->_confidenceScoreThreshold = v17;

  v18 = [(NSDictionary *)v6->_manifest objectForKey:@"multiturnConfidenceThreshold"];
  [(CDMCATIManifest *)v6 getMultiturnThresholdValue:v18];
  v6->_multiturnConfidenceScoreThreshold = v19;

  [(CDMCATIManifest *)v6 extractWeightsAndOverridesFromManifest:v6->_manifest];
  uint64_t v20 = [(NSDictionary *)v6->_manifest objectForKey:@"usoEntity"];
  usoEntity = v6->_usoEntity;
  v6->_usoEntity = (NSString *)v20;

  uint64_t v22 = [(NSDictionary *)v6->_manifest objectForKey:@"usoElementId"];
  v6->_int usoElementId = [(CDMCATIManifest *)v6 getUsoElementId:v22];

  v23 = v6->_usoEntity;
  if (v23)
  {
    if ([(NSString *)v23 length]) {
      goto LABEL_9;
    }
    id v24 = v6->_usoEntity;
  }
  else
  {
    id v24 = 0;
  }
  v6->_usoEntity = (NSString *)@"siri_Canned";

LABEL_9:
  uint64_t v25 = [(NSDictionary *)v6->_manifest objectForKey:@"usoVerb"];
  usoVerb = v6->_usoVerb;
  v6->_usoVerb = (NSString *)v25;

  id v27 = v6->_usoVerb;
  if (v27)
  {
    if ([(NSString *)v27 length]) {
      goto LABEL_14;
    }
    v28 = v6->_usoVerb;
  }
  else
  {
    v28 = 0;
  }
  v6->_usoVerb = (NSString *)@"action";

LABEL_14:
  uint64_t v29 = [(NSDictionary *)v6->_manifest objectForKey:@"usoCATIdEdge"];
  usoEdge = v6->_usoEdge;
  v6->_usoEdge = (NSString *)v29;

  id v31 = v6->_usoEdge;
  if (!v31)
  {
    v32 = 0;
    goto LABEL_18;
  }
  if (![(NSString *)v31 length])
  {
    v32 = v6->_usoEdge;
LABEL_18:
    v6->_usoEdge = (NSString *)@"dialogId";
  }
  id v33 = [(NSDictionary *)v6->_manifest objectForKey:@"expectedPositiveUtterances"];
  v6->_expectedPositiveUtterances = [(CDMCATIManifest *)v6 getExpectedPositiveUtterancesValue:v33];

  v34 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v36 = v6->_locale;
    v37 = v6->_date;
    int v38 = v6->_GUID;
    v39 = v6->_version;
    int usoElementId = v6->_usoElementId;
    v41 = v6->_usoEntity;
    int v42 = v6->_usoVerb;
    v43 = v6->_usoEdge;
    *(_DWORD *)buf = 136317186;
    int v46 = "-[CDMCATIManifest initWithPath:]";
    __int16 v47 = 2112;
    v48 = v36;
    __int16 v49 = 2112;
    id v50 = v37;
    __int16 v51 = 2112;
    v52 = v38;
    __int16 v53 = 2112;
    v54 = v39;
    __int16 v55 = 2112;
    v56 = v41;
    __int16 v57 = 1024;
    int v58 = usoElementId;
    __int16 v59 = 2112;
    v60 = v42;
    __int16 v61 = 2112;
    v62 = v43;
    _os_log_debug_impl(&dword_2263A0000, v34, OS_LOG_TYPE_DEBUG, "%s CATI manifest locale: %@, date: %@, GUID: %@, version: %@, uso entity: %@, usoElementId: %d, usoVerb: %@, usoEdge: %@", buf, 0x58u);
  }

LABEL_22:
  return v6;
}

@end