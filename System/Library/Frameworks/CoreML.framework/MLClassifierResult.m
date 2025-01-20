@interface MLClassifierResult
+ (id)resultWithClassProbability:(id)a3 additionalFeatures:(id)a4 classLabelOfMaxProbability:(id)a5;
+ (id)resultWithIntClassProbability:(id)a3;
+ (id)resultWithIntClassProbability:(id)a3 additionalFeatures:(id)a4;
+ (id)resultWithStringClassProbability:(id)a3;
+ (id)resultWithStringClassProbability:(id)a3 additionalFeatures:(id)a4;
- (MLClassifierResult)initWithClassProbability:(id)a3 additionalFeatures:(id)a4 classLabelOfMaxProbability:(id)a5;
- (MLClassifierResult)initWithIntClassProbability:(id)a3 classFeatureType:(int64_t)a4 additionalFeatures:(id)a5;
- (MLClassifierResult)initWithStringClassProbability:(id)a3 classFeatureType:(int64_t)a4 additionalFeatures:(id)a5;
- (MLFeatureProvider)additionalFeatures;
- (MLFeatureValue)predictedClass;
- (NSDictionary)classProbability;
- (id)asFeatureDictionaryWithPredictedClassDescription:(id)a3 classProbabilityDescription:(id)a4;
- (int64_t)predictedClassFeatureType;
@end

@implementation MLClassifierResult

- (id)asFeatureDictionaryWithPredictedClassDescription:(id)a3 classProbabilityDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v9 = [(MLClassifierResult *)self additionalFeatures];
  if (v9)
  {
    v10 = [[MLDictionaryFeatureProvider alloc] initWithFeatureProvider:v9];
    v11 = [(MLDictionaryFeatureProvider *)v10 dictionary];
    uint64_t v12 = [v11 mutableCopy];

    v8 = (void *)v12;
  }
  if (v6)
  {
    v13 = [v6 name];
    if (!v13) {
      goto LABEL_20;
    }
    uint64_t v14 = [(MLClassifierResult *)self predictedClass];
    if (!v14) {
      goto LABEL_12;
    }
    v15 = (void *)v14;
    [v8 setObject:v14 forKeyedSubscript:v13];
  }
  if (v7)
  {
    v13 = [v7 name];
    if (!v13) {
      goto LABEL_20;
    }
    uint64_t v16 = [(MLClassifierResult *)self classProbability];
    if (v16)
    {
      v17 = (void *)v16;
      if ([(MLClassifierResult *)self predictedClassFeatureType] == 3)
      {
        uint64_t v18 = +[MLFeatureValue featureValueWithStringKeyDictionary:v17];
      }
      else
      {
        if ([(MLClassifierResult *)self predictedClassFeatureType] != 1)
        {
          id v25 = 0;
          v21 = +[MLFeatureValue featureValueWithDictionary:v17 error:&v25];
          id v19 = v25;
          [v8 setObject:v21 forKeyedSubscript:v13];

          goto LABEL_18;
        }
        uint64_t v18 = +[MLFeatureValue featureValueWithInt64KeyDictionary:v17];
      }
      v20 = (void *)v18;
      [v8 setObject:v18 forKeyedSubscript:v13];

      id v19 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_12:

    v13 = 0;
    goto LABEL_20;
  }
  id v19 = 0;
LABEL_19:
  id v24 = v19;
  v13 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v8 error:&v24];
  id v22 = v24;

LABEL_20:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFeatures, 0);
  objc_storeStrong((id *)&self->_classProbability, 0);

  objc_storeStrong((id *)&self->_predictedClass, 0);
}

- (MLFeatureProvider)additionalFeatures
{
  return (MLFeatureProvider *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)predictedClassFeatureType
{
  return self->_predictedClassFeatureType;
}

- (NSDictionary)classProbability
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (MLFeatureValue)predictedClass
{
  return (MLFeatureValue *)objc_getProperty(self, a2, 8, 1);
}

- (MLClassifierResult)initWithClassProbability:(id)a3 additionalFeatures:(id)a4 classLabelOfMaxProbability:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MLClassifierResult;
  uint64_t v12 = [(MLClassifierResult *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_classProbability, a3);
    objc_storeStrong((id *)&v13->_additionalFeatures, a4);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13->_predictedClassFeatureType = 1;
      uint64_t v14 = +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", (int)[v11 intValue]);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v16 = 0;
        goto LABEL_8;
      }
      v13->_predictedClassFeatureType = 3;
      uint64_t v14 = +[MLFeatureValue featureValueWithString:v11];
    }
    predictedClass = v13->_predictedClass;
    v13->_predictedClass = (MLFeatureValue *)v14;
  }
  uint64_t v16 = v13;
LABEL_8:

  return v16;
}

- (MLClassifierResult)initWithIntClassProbability:(id)a3 classFeatureType:(int64_t)a4 additionalFeatures:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)MLClassifierResult;
  id v11 = [(MLClassifierResult *)&v36 init];
  uint64_t v12 = v11;
  if (v11)
  {
    id v30 = v10;
    v11->_predictedClassFeatureType = a4;
    objc_storeStrong((id *)&v11->_classProbability, a3);
    objc_storeStrong((id *)&v12->_additionalFeatures, a5);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v31 = v9;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v33;
      objc_super v18 = &unk_1EF11AB58;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v13);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v21 = objc_msgSend(v13, "objectForKeyedSubscript:", v20, v30);
          [v21 doubleValue];
          double v23 = v22;
          [v18 doubleValue];
          if (v23 > v24)
          {
            id v25 = v21;

            id v26 = v20;
            uint64_t v16 = v26;
            objc_super v18 = v25;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v16 = 0;
      objc_super v18 = &unk_1EF11AB58;
    }

    uint64_t v27 = +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", (int)[v16 intValue]);
    predictedClass = v12->_predictedClass;
    v12->_predictedClass = (MLFeatureValue *)v27;

    id v10 = v30;
    id v9 = v31;
  }

  return v12;
}

- (MLClassifierResult)initWithStringClassProbability:(id)a3 classFeatureType:(int64_t)a4 additionalFeatures:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)MLClassifierResult;
  id v11 = [(MLClassifierResult *)&v37 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_predictedClassFeatureType = a4;
    objc_storeStrong((id *)&v11->_classProbability, a3);
    objc_storeStrong((id *)&v12->_additionalFeatures, a5);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v31 = v10;
      id v32 = v9;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v34;
      objc_super v18 = &unk_1EF11AB58;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v13);
          }
          v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v21 = objc_msgSend(v13, "objectForKeyedSubscript:", v20, v31, v32, (void)v33);
          [v21 doubleValue];
          double v23 = v22;
          [v18 doubleValue];
          if (v23 > v24)
          {
            id v25 = v21;

            id v26 = v20;
            uint64_t v16 = v26;
            objc_super v18 = v25;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v15);

      if (v16)
      {
        uint64_t v27 = +[MLFeatureValue featureValueWithString:v16];
        predictedClass = v12->_predictedClass;
        v12->_predictedClass = (MLFeatureValue *)v27;

        id v10 = v31;
        id v9 = v32;
LABEL_16:

        goto LABEL_17;
      }
      id v10 = v31;
      id v9 = v32;
    }
    else
    {

      objc_super v18 = &unk_1EF11AB58;
    }
    uint64_t v29 = +[MLFeatureValue undefinedFeatureValueWithType:3];
    uint64_t v16 = v12->_predictedClass;
    v12->_predictedClass = (MLFeatureValue *)v29;
    goto LABEL_16;
  }
LABEL_17:

  return v12;
}

+ (id)resultWithClassProbability:(id)a3 additionalFeatures:(id)a4 classLabelOfMaxProbability:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithClassProbability:v10 additionalFeatures:v9 classLabelOfMaxProbability:v8];

  return v11;
}

+ (id)resultWithIntClassProbability:(id)a3 additionalFeatures:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithIntClassProbability:v7 classFeatureType:1 additionalFeatures:v6];

  return v8;
}

+ (id)resultWithStringClassProbability:(id)a3 additionalFeatures:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithStringClassProbability:v7 classFeatureType:3 additionalFeatures:v6];

  return v8;
}

+ (id)resultWithIntClassProbability:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIntClassProbability:v4 classFeatureType:1 additionalFeatures:0];

  return v5;
}

+ (id)resultWithStringClassProbability:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStringClassProbability:v4 classFeatureType:3 additionalFeatures:0];

  return v5;
}

@end