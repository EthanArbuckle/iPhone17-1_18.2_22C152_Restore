@interface SGExtractionModelCoreMLFeatureWrapper
- (NSDictionary)featureDict;
- (NSSet)featureNames;
- (SGExtractionModelCoreMLFeatureWrapper)initWithFeatureDict:(id)a3;
- (SGExtractionModelCoreMLFeatureWrapper)initWithFeatureProvider:(id)a3;
- (id)featureValueForName:(id)a3;
- (id)valueForKey:(id)a3;
@end

@implementation SGExtractionModelCoreMLFeatureWrapper

- (void).cxx_destruct
{
}

- (NSDictionary)featureDict
{
  return self->_featureDict;
}

- (id)valueForKey:(id)a3
{
  return [(NSDictionary *)self->_featureDict objectForKeyedSubscript:a3];
}

- (NSSet)featureNames
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4 = [(NSDictionary *)self->_featureDict allKeys];
  v5 = (void *)[v3 initWithArray:v4];

  return (NSSet *)v5;
}

- (id)featureValueForName:(id)a3
{
  id v3 = [(NSDictionary *)self->_featureDict objectForKeyedSubscript:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (SGExtractionModelCoreMLFeatureWrapper)initWithFeatureProvider:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = [v4 featureNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v4 featureValueForName:v11];
        v13 = v12;
        if (!v12
          || ([v12 multiArrayValue],
              v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              !v14))
        {
          v17 = sgLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v19 = 0;
            _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "SGExtractionModelCoreMLWrapper: Inconsistent MLFeatureProvider passed", v19, 2u);
          }

          v16 = 0;
          goto LABEL_14;
        }
        v15 = [v13 multiArrayValue];
        [v5 setObject:v15 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  self = [(SGExtractionModelCoreMLFeatureWrapper *)self initWithFeatureDict:v5];
  v16 = self;
LABEL_14:

  return v16;
}

- (SGExtractionModelCoreMLFeatureWrapper)initWithFeatureDict:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGExtractionModelCoreMLFeatureWrapper;
  v6 = [(SGExtractionModelCoreMLFeatureWrapper *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureDict, a3);
  }

  return v7;
}

@end