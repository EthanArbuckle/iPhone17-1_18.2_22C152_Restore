@interface MLDictionaryFeatureProvider
+ (BOOL)supportsSecureCoding;
- (MLDictionaryFeatureProvider)initWithCoder:(id)a3;
- (MLDictionaryFeatureProvider)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error;
- (MLDictionaryFeatureProvider)initWithFeatureProvider:(id)a3;
- (MLDictionaryFeatureProvider)initWithFeatureProvider:(id)a3 featureNames:(id)a4;
- (MLDictionaryFeatureProvider)initWithFeatureValueDictionary:(id)a3;
- (MLFeatureValue)objectForKeyedSubscript:(NSString *)featureName;
- (NSDictionary)dictionary;
- (NSSet)cachedFeatureNames;
- (id)description;
- (id)featureValueForName:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setDictionary:(id)a3;
@end

@implementation MLDictionaryFeatureProvider

- (id)featureValueForName:(id)a3
{
  return [(NSDictionary *)self->_dictionary objectForKeyedSubscript:a3];
}

- (MLDictionaryFeatureProvider)initWithFeatureValueDictionary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLDictionaryFeatureProvider;
  v6 = [(MLDictionaryFeatureProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = [(NSDictionary *)v7->_dictionary allKeys];
    uint64_t v10 = [v8 setWithArray:v9];
    cachedFeatureNames = v7->_cachedFeatureNames;
    v7->_cachedFeatureNames = (NSSet *)v10;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFeatureNames, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (NSSet)cachedFeatureNames
{
  return self->_cachedFeatureNames;
}

- (void)setDictionary:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (MLDictionaryFeatureProvider)initWithCoder:(id)a3
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:6];
  [v6 addObjectsFromArray:v7];

  v8 = [v5 allowedClasses];
  [v6 unionSet:v8];

  v9 = [v5 decodeObjectOfClasses:v6 forKey:@"dictionary"];

  uint64_t v12 = 0;
  uint64_t v10 = [(MLDictionaryFeatureProvider *)self initWithDictionary:v9 error:&v12];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLDictionaryFeatureProvider *)self dictionary];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

- (MLFeatureValue)objectForKeyedSubscript:(NSString *)featureName
{
  return (MLFeatureValue *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:featureName];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSDictionary *)self->_dictionary countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(MLDictionaryFeatureProvider *)self dictionary];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v9 = [(MLDictionaryFeatureProvider *)self dictionary];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];
        v11 = [v10 description];

        uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];
        [v3 appendFormat:@"%@ = %@\n", v8, v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v3;
}

- (MLDictionaryFeatureProvider)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = dictionary;
  v31.receiver = self;
  v31.super_class = (Class)MLDictionaryFeatureProvider;
  v7 = [(MLDictionaryFeatureProvider *)&v31 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v25 = v7;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](v6, "count"));
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v26 = v6;
    uint64_t v10 = v6;
    uint64_t v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v16 = [(NSDictionary *)v10 objectForKeyedSubscript:v15];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(NSDictionary *)v10 objectForKeyedSubscript:v15];
          }
          else {
          long long v17 = +[MLFeatureValue featureValueOfType:fromObject:error:](MLFeatureValue, "featureValueOfType:fromObject:error:", +[MLFeatureTypeUtils featureTypeForObject:v16], v16, error);
          }
          [(NSDictionary *)v9 setObject:v17 forKeyedSubscript:v15];
        }
        uint64_t v12 = [(NSDictionary *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    uint64_t v8 = v25;
    long long v18 = v25->_dictionary;
    v25->_dictionary = v9;
    v19 = v9;

    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    v21 = [(NSDictionary *)v19 allKeys];
    uint64_t v22 = [v20 setWithArray:v21];
    cachedFeatureNames = v25->_cachedFeatureNames;
    v25->_cachedFeatureNames = (NSSet *)v22;

    uint64_t v6 = v26;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MLDictionaryFeatureProvider)initWithFeatureProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 featureNames];
  uint64_t v6 = [(MLDictionaryFeatureProvider *)self initWithFeatureProvider:v4 featureNames:v5];

  return v6;
}

- (MLDictionaryFeatureProvider)initWithFeatureProvider:(id)a3 featureNames:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v6, "featureValueForName:", v14, (void)v18);
        if (v15) {
          [v8 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  long long v16 = [(MLDictionaryFeatureProvider *)self initWithDictionary:v8 error:0];
  return v16;
}

@end