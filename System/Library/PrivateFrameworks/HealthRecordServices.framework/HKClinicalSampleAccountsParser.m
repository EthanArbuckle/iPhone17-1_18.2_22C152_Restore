@interface HKClinicalSampleAccountsParser
+ (id)_jsonDictionaryFromJSONObject:(id)a3 subElement:(id)a4 error:(id *)a5;
+ (id)_stringOnlyDictionaryFromJSONDictionary:(id)a3;
- (id)_parseAccountsFromJSONData:(id)a3 error:(id *)a4;
- (id)_parseBatchesFromSampleAccountJSONDict:(id)a3 error:(id *)a4;
- (id)_parseGatewayFromProviderJSONDict:(id)a3 error:(id *)a4;
- (id)_parseProviderFromSampleAccountJSONDict:(id)a3 error:(id *)a4;
- (id)parseAccountsFromFile:(id)a3 error:(id *)a4;
@end

@implementation HKClinicalSampleAccountsParser

- (id)parseAccountsFromFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6
    && ([MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v9 = [(HKClinicalSampleAccountsParser *)self _parseAccountsFromJSONData:v7 error:a4];
    v10 = v9;
    if (v9) {
      id v11 = v9;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v8 = [v6 absoluteString];
    objc_msgSend(v12, "hk_assignError:code:format:", a4, 3, @"Unable to read sample account from «%@»", v8);
    v10 = 0;
  }

  return v10;
}

- (id)_parseAccountsFromJSONData:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HKClinicalSampleAccount.m", 134, @"Invalid parameter not satisfying: %@", @"jsonData" object file lineNumber description];
  }
  v8 = objc_msgSend(MEMORY[0x263F08900], "hk_JSONObjectFromFHIRData:options:error:", v7, 0, a4);
  if (v8)
  {
    v9 = [(id)objc_opt_class() _jsonDictionaryFromJSONObject:v8 subElement:0 error:a4];
    v10 = v9;
    if (v9)
    {
      id v11 = [v9 objectForKeyedSubscript:@"providers"];
      objc_opt_class();
      v12 = HKSafeObject();

      if (v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id obj = v12;
        uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          v28 = v10;
          id v29 = v7;
          v27 = v12;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(obj);
              }
              uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              uint64_t v19 = [(HKClinicalSampleAccountsParser *)self _parseProviderFromSampleAccountJSONDict:v18 error:a4];
              if (!v19) {
                goto LABEL_20;
              }
              v20 = (void *)v19;
              uint64_t v21 = [(HKClinicalSampleAccountsParser *)self _parseBatchesFromSampleAccountJSONDict:v18 error:a4];
              if (!v21)
              {

LABEL_20:
                id v24 = 0;
                v10 = v28;
                id v7 = v29;
                v12 = v27;
                goto LABEL_21;
              }
              v22 = (void *)v21;
              v23 = objc_alloc_init(HKClinicalSampleAccount);
              [(HKClinicalSampleAccount *)v23 setProvider:v20];
              [(HKClinicalSampleAccount *)v23 setBatches:v22];
              [v13 addObject:v23];
            }
            uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
            v10 = v28;
            id v7 = v29;
            v12 = v27;
            if (v15) {
              continue;
            }
            break;
          }
        }

        id v24 = v13;
LABEL_21:
      }
      else
      {
        id v24 = 0;
      }
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)_parseProviderFromSampleAccountJSONDict:(id)a3 error:(id *)a4
{
  id v7 = [a3 objectForKeyedSubscript:@"provider"];
  objc_opt_class();
  v8 = HKSafeObject();

  if (a3)
  {
    v9 = [(id)objc_opt_class() _stringOnlyDictionaryFromJSONDictionary:v8];
    v10 = [v9 objectForKeyedSubscript:@"identifier"];
    if ([v10 length])
    {
      id v11 = [v9 objectForKeyedSubscript:@"title"];
      if ([v11 length])
      {
        v12 = [v8 objectForKeyedSubscript:@"minCompatibleAPIVersion"];
        id v13 = objc_alloc_init(HKClinicalSampleAccountProvider);
        uint64_t v14 = [NSString stringWithFormat:@"%@_%@", @"SIMULATOR_SAMPLE_PROVIDER_BATCH_PREFIX", v10];
        [(HKClinicalSampleAccountProvider *)v13 setIdentifier:v14];

        [(HKClinicalSampleAccountProvider *)v13 setTitle:v11];
        [(HKClinicalSampleAccountProvider *)v13 setProperties:v9];
        -[HKClinicalSampleAccountProvider setMinCompatibleAPIVersion:](v13, "setMinCompatibleAPIVersion:", [v12 integerValue]);
        uint64_t v15 = [(HKClinicalSampleAccountsParser *)self _parseGatewayFromProviderJSONDict:v8 error:a4];
        if (v15)
        {
          [(HKClinicalSampleAccountProvider *)v13 setGateway:v15];
          uint64_t v16 = v13;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)_parseGatewayFromProviderJSONDict:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() _jsonDictionaryFromJSONObject:v5 subElement:@"gateway" error:a4];

  if (v6)
  {
    id v7 = [(id)objc_opt_class() _stringOnlyDictionaryFromJSONDictionary:v6];
    v8 = [v7 objectForKeyedSubscript:@"identifier"];
    if ([v8 length])
    {
      v9 = [v7 objectForKeyedSubscript:@"title"];
      if ([v9 length])
      {
        v10 = [v7 objectForKeyedSubscript:@"fhirVersion"];
        if ([v10 length])
        {
          id v11 = [MEMORY[0x263F0A378] versionFromVersionString:v10 error:a4];
          if (v11)
          {
            v12 = objc_alloc_init(HKClinicalSampleAccountProviderGateway);
            id v13 = [NSString stringWithFormat:@"%@_%@", @"SIMULATOR_SAMPLE_GATEWAY_PREFIX", v8];
            [(HKClinicalSampleAccountProviderGateway *)v12 setIdentifier:v13];

            [(HKClinicalSampleAccountProviderGateway *)v12 setTitle:v9];
            [(HKClinicalSampleAccountProviderGateway *)v12 setProperties:v7];
            [(HKClinicalSampleAccountProviderGateway *)v12 setFHIRVersion:v11];
          }
          else
          {
            v12 = 0;
          }
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_parseBatchesFromSampleAccountJSONDict:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = [a3 objectForKeyedSubscript:@"batches"];
  objc_opt_class();
  id v6 = HKSafeObject();

  if (v6)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v18 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [(id)objc_opt_class() _jsonDictionaryFromJSONObject:*(void *)(*((void *)&v19 + 1) + 8 * i) subElement:@"resources" error:a4];
          if (!v13)
          {

            id v16 = 0;
            goto LABEL_12;
          }
          uint64_t v14 = (void *)v13;
          uint64_t v15 = objc_alloc_init(HKClinicalSampleAccountDataBatch);
          [(HKClinicalSampleAccountDataBatch *)v15 setResourceObjectsByResourceType:v14];
          [v7 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v16 = v7;
LABEL_12:

    id v6 = v18;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)_jsonDictionaryFromJSONObject:(id)a3 subElement:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = HKSafeObject();

  if (v8 && v6)
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:v6];
    objc_opt_class();
    uint64_t v10 = HKSafeObject();

    id v8 = (void *)v10;
  }

  return v8;
}

+ (id)_stringOnlyDictionaryFromJSONDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "hk_filterKeysWithBlock:", &__block_literal_global);
  id v5 = [v4 allObjects];
  id v6 = [v3 dictionaryWithValuesForKeys:v5];

  return v6;
}

uint64_t __74__HKClinicalSampleAccountsParser__stringOnlyDictionaryFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end