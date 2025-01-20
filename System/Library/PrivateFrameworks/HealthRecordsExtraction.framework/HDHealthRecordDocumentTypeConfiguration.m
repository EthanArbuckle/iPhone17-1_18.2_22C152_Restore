@interface HDHealthRecordDocumentTypeConfiguration
+ (HDHealthRecordDocumentTypeConfiguration)configurationWithError:(id *)a3;
+ (HDHealthRecordDocumentTypeConfiguration)configurationWithExtractionVersionOverride:(id)a3 rulesetOverrides:(id)a4 error:(id *)a5;
+ (id)_bundledPipelineConfigurationWithError:(id *)a3;
+ (id)_rulesetDictionaryFromRulesetData:(id)a3 error:(id *)a4;
- (HDHealthRecordDocumentTypeConfiguration)initWithVersion:(id)a3 extractionRulesets:(id)a4;
- (HRSSupportedFHIRConfiguration)supportedFHIRConfiguration;
- (NSArray)extractionRulesets;
- (NSNumber)extractionRulesetVersion;
- (id)extractionRulesetForRelease:(id)a3;
- (void)setExtractionRulesets:(id)a3;
@end

@implementation HDHealthRecordDocumentTypeConfiguration

- (HDHealthRecordDocumentTypeConfiguration)initWithVersion:(id)a3 extractionRulesets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordDocumentTypeConfiguration;
  v8 = [(HDHealthRecordDocumentTypeConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    extractionRulesetVersion = v8->_extractionRulesetVersion;
    v8->_extractionRulesetVersion = (NSNumber *)v9;

    objc_storeStrong((id *)&v8->_extractionRulesets, a4);
  }

  return v8;
}

- (id)extractionRulesetForRelease:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_extractionRulesets;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "FHIRRelease", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HRSSupportedFHIRConfiguration)supportedFHIRConfiguration
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v28 = objc_alloc_init(MEMORY[0x263F45D48]);
  v3 = objc_alloc_init(HKHealthRecordsExtractionRouter);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v26 = self;
  obj = self->_extractionRulesets;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v31;
    *(void *)&long long v5 = 138544130;
    long long v25 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "releaseSupport", v25);
        v11 = [v10 FHIRRelease];
        long long v12 = [(HKHealthRecordsExtractionRouter *)v3 supportedResourceTypesForRelease:v11];

        long long v13 = [v9 releaseSupport];
        long long v14 = [v13 resourceTypes];
        long long v15 = [v12 setByAddingObjectsFromSet:v14];

        id v16 = objc_alloc(MEMORY[0x263F45D50]);
        uint64_t v17 = [v9 releaseSupport];
        uint64_t v18 = [v17 FHIRRelease];
        v19 = (void *)[v16 initWithFHIRRelease:v18 resourceTypes:v15];

        id v29 = 0;
        LOBYTE(v18) = [v28 addSupportedFHIRRelease:v19 error:&v29];
        id v20 = v29;
        if ((v18 & 1) == 0)
        {
          _HKInitializeLogging();
          v21 = (void *)*MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            v23 = [v9 releaseSupport];
            *(_DWORD *)buf = v25;
            v35 = v26;
            __int16 v36 = 2114;
            v37 = v23;
            __int16 v38 = 2114;
            id v39 = v28;
            __int16 v40 = 2114;
            id v41 = v20;
            _os_log_error_impl(&dword_232E63000, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to add release %{public}@ to %{public}@: %{public}@", buf, 0x2Au);
          }
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v6);
  }

  return (HRSSupportedFHIRConfiguration *)v28;
}

+ (HDHealthRecordDocumentTypeConfiguration)configurationWithError:(id *)a3
{
  return (HDHealthRecordDocumentTypeConfiguration *)[a1 configurationWithExtractionVersionOverride:0 rulesetOverrides:0 error:a3];
}

+ (HDHealthRecordDocumentTypeConfiguration)configurationWithExtractionVersionOverride:(id)a3 rulesetOverrides:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v44 = a4;
  id v52 = 0;
  id v40 = a1;
  uint64_t v9 = [a1 _bundledPipelineConfigurationWithError:&v52];
  id v10 = v52;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a5, 100, @"unable to read bundled extraction pipeline configuration", v10);
    long long v12 = 0;
    goto LABEL_32;
  }
  if (v8)
  {
    uint64_t v43 = (HDHealthRecordDocumentTypeConfiguration *)v8;
    id v11 = 0;
LABEL_6:
    long long v14 = [v9 objectForKeyedSubscript:@"FHIRExtractionRulesets"];
    if (v14)
    {
      id v39 = a5;
      id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = v14;
      uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v48;
        v19 = (void *)*MEMORY[0x263F09560];
        v37 = v9;
        id v38 = v8;
        id v35 = v11;
        id v36 = v10;
        v34 = v14;
        id v41 = v15;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * v20);
            uint64_t v22 = HKFHIRReleaseFromNSString();
            if ((void *)v22 == v19)
            {
              objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", v39, 100, @"Not a supported FHIR release: %@", v21);

LABEL_28:
              long long v12 = 0;
              uint64_t v9 = v37;
              id v8 = v38;
              id v11 = v35;
              id v10 = v36;
              long long v14 = v34;
              id v15 = v41;
              goto LABEL_29;
            }
            v23 = (void *)v22;
            uint64_t v24 = [v44 objectForKeyedSubscript:v22];
            if (v24)
            {
              long long v25 = (void *)v24;
              id v26 = 0;
            }
            else
            {
              v27 = [obj objectForKeyedSubscript:v21];
              id v46 = 0;
              long long v25 = [v40 _rulesetDictionaryFromRulesetData:v27 error:&v46];
              id v26 = v46;

              if (!v25)
              {
                long long v25 = [NSString stringWithFormat:@"Unable to parse extraction rules data for FHIR release %@", v23];
                objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", v39, 100, v25, v26);
                int v30 = 1;
                goto LABEL_20;
              }
            }
            id v28 = v26;
            id v45 = v26;
            id v29 = +[HDHealthRecordRuleset rulesetFromDictionary:v25 rulesetVersion:v43 error:&v45];
            id v26 = v45;

            if (v29)
            {
              [v41 addObject:v29];
              int v30 = 0;
            }
            else
            {
              long long v31 = [NSString stringWithFormat:@"Unable to create extraction ruleset from extraction rules for FHIR release %@", v21];
              objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", v39, 100, v31, v26);

              int v30 = 1;
            }

LABEL_20:
            if (v30) {
              goto LABEL_28;
            }
            ++v20;
          }
          while (v17 != v20);
          uint64_t v32 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
          uint64_t v17 = v32;
          uint64_t v9 = v37;
          id v8 = v38;
          id v11 = v35;
          id v10 = v36;
          long long v14 = v34;
          id v15 = v41;
        }
        while (v32);
      }

      long long v12 = [[HDHealthRecordDocumentTypeConfiguration alloc] initWithVersion:v43 extractionRulesets:v15];
LABEL_29:
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 100, @"The bundled pipeline configuration does not contain any available extraction rulesets");
      long long v12 = 0;
    }

    goto LABEL_31;
  }
  long long v13 = [v9 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  uint64_t v51 = 0;
  HKSafeObject();
  long long v12 = (HDHealthRecordDocumentTypeConfiguration *)objc_claimAutoreleasedReturnValue();
  id v11 = 0;

  uint64_t v43 = v12;
  if (v12) {
    goto LABEL_6;
  }
LABEL_31:

LABEL_32:
  return v12;
}

+ (id)_rulesetDictionaryFromRulesetData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:a4];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    id v8 = (objc_class *)objc_opt_class();

    NSStringFromClass(v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_assignError:code:format:", a4, 100, @"Expecting NSData for extraction ruleset but got %@", v5);
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)_bundledPipelineConfigurationWithError:(id *)a3
{
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 pathForResource:@"HDHealthRecordPipelineConfiguration" ofType:@"plist"];
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5 options:1 error:a3];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:a3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSNumber)extractionRulesetVersion
{
  return self->_extractionRulesetVersion;
}

- (NSArray)extractionRulesets
{
  return self->_extractionRulesets;
}

- (void)setExtractionRulesets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionRulesets, 0);
  objc_storeStrong((id *)&self->_extractionRulesetVersion, 0);
}

@end