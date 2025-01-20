@interface HDHealthRecordRuleset
+ (id)rulesetFromDictionary:(id)a3 rulesetVersion:(id)a4 error:(id *)a5;
- (HRSSupportedFHIRRelease)releaseSupport;
- (NSDictionary)rulesByClinicalType;
- (NSDictionary)rulesByResourceType;
- (NSNumber)rulesetVersion;
- (NSString)FHIRRelease;
- (id)initForFHIRRelease:(id)a3 rulesetVersion:(id)a4;
- (id)rulesetForClinicalType:(int64_t)a3;
- (id)rulesetForFHIRResourceObject:(id)a3;
- (id)rulesetForFHIRResourceType:(id)a3;
- (void)setRulesByClinicalType:(id)a3;
- (void)setRulesByResourceType:(id)a3;
@end

@implementation HDHealthRecordRuleset

- (id)initForFHIRRelease:(id)a3 rulesetVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDHealthRecordRuleset;
  v9 = [(HDHealthRecordRuleset *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_FHIRRelease, a3);
    uint64_t v11 = [v8 copy];
    rulesetVersion = v10->_rulesetVersion;
    v10->_rulesetVersion = (NSNumber *)v11;
  }
  return v10;
}

+ (id)rulesetFromDictionary:(id)a3 rulesetVersion:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"HDHealthRecordRuleset.m", 43, @"Invalid parameter not satisfying: %@", @"dict" object file lineNumber description];
  }
  id v53 = 0;
  uint64_t v11 = objc_msgSend(v9, "hk_safeStringForKeyPath:error:", @"release", &v53);
  id v12 = v53;
  if (v11)
  {
    v13 = HKFHIRReleaseFromNSString();
    if (v13 == (void *)*MEMORY[0x263F09560])
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 100, @"Ruleset specifies an unsupported release: \"%@\"", v11);
      id v32 = 0;
    }
    else
    {
      id v14 = [[HDHealthRecordRuleset alloc] initForFHIRRelease:v13 rulesetVersion:v10];

      id v52 = 0;
      v15 = objc_msgSend(v9, "hk_safeValueForKeyPath:class:error:", @"resources", objc_opt_class(), &v52);
      id v12 = v52;
      if (v15)
      {
        uint64_t v45 = [MEMORY[0x263EFF9A0] dictionary];
        v44 = [MEMORY[0x263EFF9A0] dictionary];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id obj = [v15 allKeys];
        uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          v36 = a5;
          id v37 = v14;
          uint64_t v18 = *(void *)v49;
          v43 = v15;
          v19 = (void *)v45;
          id v40 = v10;
          id v41 = v9;
          v38 = v13;
          v39 = v11;
LABEL_8:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v49 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v48 + 1) + 8 * v20);
            uint64_t v22 = objc_opt_class();
            id v47 = v12;
            v23 = objc_msgSend(v15, "hk_safeValueForKeyPath:class:error:", v21, v22, &v47);
            id v24 = v47;

            if (!v23) {
              break;
            }
            id v46 = v24;
            v25 = +[HDHealthRecordRulesetResource resourceFromDictionary:v23 resourceName:v21 error:&v46];
            id v12 = v46;

            if (!v25)
            {
              objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", v36, 100, @"Ruleset couldn't create rule from resource", v12);

              id v24 = v12;
              goto LABEL_28;
            }
            v26 = [v25 resourceType];
            v27 = [v19 objectForKeyedSubscript:v26];
            if (!v27)
            {
              v27 = [MEMORY[0x263EFF980] array];
              [v19 setObject:v27 forKeyedSubscript:v26];
            }
            v28 = [v25 condition];

            if (v28) {
              [v27 insertObject:v25 atIndex:0];
            }
            else {
              [v27 addObject:v25];
            }
            v29 = NSNumber;
            v30 = [v25 clinicalType];
            v31 = objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v30, "type"));
            [v44 setObject:v25 forKeyedSubscript:v31];

            ++v20;
            v15 = v43;
            v19 = (void *)v45;
            if (v17 == v20)
            {
              uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
              id v10 = v40;
              id v9 = v41;
              v13 = v38;
              uint64_t v11 = v39;
              id v14 = v37;
              if (v17) {
                goto LABEL_8;
              }
              goto LABEL_25;
            }
          }
          objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", v36, 100, @"Ruleset couldn't load resources", v24);
LABEL_28:

          id v32 = 0;
          id v12 = v24;
          id v10 = v40;
          id v9 = v41;
          v13 = v38;
          uint64_t v11 = v39;
          id v14 = v37;
          v33 = v44;
          goto LABEL_29;
        }
        v19 = (void *)v45;
LABEL_25:

        [v14 setRulesByResourceType:v19];
        v33 = v44;
        [v14 setRulesByClinicalType:v44];
        id v32 = v14;
LABEL_29:
      }
      else
      {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a5, 100, @"Ruleset couldn't find resources", v12);
        id v32 = 0;
      }
    }
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

- (HRSSupportedFHIRRelease)releaseSupport
{
  id v3 = objc_alloc(MEMORY[0x263F45D50]);
  FHIRRelease = self->_FHIRRelease;
  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [(NSDictionary *)self->_rulesByResourceType allKeys];
  id v7 = [v5 setWithArray:v6];
  id v8 = (void *)[v3 initWithFHIRRelease:FHIRRelease resourceTypes:v7];

  return (HRSSupportedFHIRRelease *)v8;
}

- (id)rulesetForClinicalType:(int64_t)a3
{
  rulesByClinicalType = self->_rulesByClinicalType;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSDictionary *)rulesByClinicalType objectForKeyedSubscript:v4];

  return v5;
}

- (id)rulesetForFHIRResourceType:(id)a3
{
  id v3 = [(NSDictionary *)self->_rulesByResourceType objectForKeyedSubscript:a3];
  v4 = [v3 lastObject];

  return v4;
}

- (id)rulesetForFHIRResourceObject:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v5 resourceType];

  [(NSDictionary *)self->_rulesByResourceType objectForKeyedSubscript:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "evaluateWithObject:", v4, (void)v16))
        {
          id v14 = v12;

          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEBUG)) {
    -[HDHealthRecordRuleset rulesetForFHIRResourceObject:](v13);
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (NSString)FHIRRelease
{
  return self->_FHIRRelease;
}

- (NSNumber)rulesetVersion
{
  return self->_rulesetVersion;
}

- (NSDictionary)rulesByResourceType
{
  return self->_rulesByResourceType;
}

- (void)setRulesByResourceType:(id)a3
{
}

- (NSDictionary)rulesByClinicalType
{
  return self->_rulesByClinicalType;
}

- (void)setRulesByClinicalType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulesByClinicalType, 0);
  objc_storeStrong((id *)&self->_rulesByResourceType, 0);
  objc_storeStrong((id *)&self->_rulesetVersion, 0);
  objc_storeStrong((id *)&self->_FHIRRelease, 0);
}

- (void)rulesetForFHIRResourceObject:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = HKSensitiveLogItem();
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_232E63000, v1, OS_LOG_TYPE_DEBUG, "rulesetForFHIRResourceObject: no suitable ruleset found for %@", (uint8_t *)&v3, 0xCu);
}

@end