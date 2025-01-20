@interface MAKGWeightConversion
+ (id)kgPropertiesForMAProperties:(void *)a3 weight:;
+ (void)maPropertiesAndWeightForKGProperties:(id)a3 maProperties:(id *)a4 maWeight:(float *)a5;
@end

@implementation MAKGWeightConversion

+ (void)maPropertiesAndWeightForKGProperties:(id)a3 maProperties:(id *)a4 maWeight:(float *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    float v12 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v15 = [v8 objectForKeyedSubscript:v14];
        if ([@"__weight" isEqualToString:v14])
        {
          [v15 value];
          float v12 = v16;
        }
        else
        {
          v17 = [v15 kgPropertyValue];
          [v7 setObject:v17 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  else
  {
    float v12 = 1.0;
  }

  if (a4) {
    *a4 = v7;
  }
  if (a5) {
    *a5 = v12;
  }
}

+ (id)kgPropertiesForMAProperties:(void *)a3 weight:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v18 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v12, v18, (void)v19);
        uint64_t v14 = +[KGPropertyValue kgPropertyValueWithMAPropertyValue:v13];
        if (v14)
        {
          [v5 setObject:v14 forKeyedSubscript:v12];
        }
        else
        {
          v15 = KGLoggingConnection();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v18;
            uint64_t v24 = v13;
            _os_log_fault_impl(&dword_1D1654000, v15, OS_LOG_TYPE_FAULT, "Invalid matisse property value %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  if (a1 != 1.0)
  {
    double v16 = [[KGDoublePropertyValue alloc] initWithValue:a1];
    [v5 setObject:v16 forKeyedSubscript:@"__weight"];
  }
  return v5;
}

@end