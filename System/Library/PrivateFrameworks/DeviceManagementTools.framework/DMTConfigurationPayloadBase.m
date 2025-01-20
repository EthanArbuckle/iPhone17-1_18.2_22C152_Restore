@interface DMTConfigurationPayloadBase
+ (NSDictionary)payloadSubclassesByPayloadType;
+ (id)concretePayloadWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation DMTConfigurationPayloadBase

+ (id)concretePayloadWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v13 = &unk_26E1157F0;
    uint64_t v14 = 70;
LABEL_8:
    DMTErrorWithCodeAndUserInfo(v14, v13);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  CFTypeID v8 = CFGetTypeID(v6);
  if (v8 != CFDictionaryGetTypeID())
  {
    v13 = &unk_26E115818;
    uint64_t v14 = 71;
    goto LABEL_8;
  }
  v9 = DMTValidateProfileString(v7, @"PayloadType", 0, a4);
  v10 = [a1 payloadSubclassesByPayloadType];
  v11 = (objc_class *)[v10 objectForKeyedSubscript:v9];
  if (!v11) {
    v11 = (objc_class *)objc_opt_class();
  }

  v12 = (void *)[[v11 alloc] initWithDictionary:v7 error:a4];
LABEL_9:

  return v12;
}

+ (NSDictionary)payloadSubclassesByPayloadType
{
  if (payloadSubclassesByPayloadType_onceToken != -1) {
    dispatch_once(&payloadSubclassesByPayloadType_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)payloadSubclassesByPayloadType_payloadClassesByPayloadType;
  return (NSDictionary *)v2;
}

void __61__DMTConfigurationPayloadBase_payloadSubclassesByPayloadType__block_invoke()
{
  v35[5] = *MEMORY[0x263EF8340];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v35[3] = objc_opt_class();
  v35[4] = objc_opt_class();
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:5];
  v1 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v0;
  uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v2;
        v3 = *(void **)(*((void *)&v23 + 1) + 8 * v2);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v4 = [v3 supportedPayloadTypes];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v33 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v20;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v20 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
              if ([v1 objectForKeyedSubscript:v9])
              {
                if (_DMTLogGeneral_onceToken_4 != -1) {
                  dispatch_once(&_DMTLogGeneral_onceToken_4, &__block_literal_global_24);
                }
                v10 = (void *)_DMTLogGeneral_logObj_4;
                if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_4, OS_LOG_TYPE_ERROR))
                {
                  v11 = v10;
                  uint64_t v12 = [v1 objectForKeyedSubscript:v9];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v28 = v9;
                  __int16 v29 = 2114;
                  v30 = v3;
                  __int16 v31 = 2114;
                  uint64_t v32 = v12;
                  _os_log_error_impl(&dword_22D3D6000, v11, OS_LOG_TYPE_ERROR, "Multiple validators found for payload type “%{public}@”! (%{public}@ and %{public}@)", buf, 0x20u);
                }
              }
              else
              {
                [v1 setObject:v3 forKeyedSubscript:v9];
              }
              ++v8;
            }
            while (v6 != v8);
            uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v33 count:16];
          }
          while (v6);
        }

        uint64_t v2 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v17);
  }

  uint64_t v13 = [v1 copy];
  uint64_t v14 = (void *)payloadSubclassesByPayloadType_payloadClassesByPayloadType;
  payloadSubclassesByPayloadType_payloadClassesByPayloadType = v13;
}

@end