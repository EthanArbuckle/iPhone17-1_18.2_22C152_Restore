@interface MLLazyUnionFeatureProvider
- (MLFeatureProvider)first;
- (MLFeatureProvider)second;
- (MLLazyUnionFeatureProvider)initWithFeaturesFrom:(id)a3 addedToFeaturesFrom:(id)a4;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (id)unionFeatureProvider;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation MLLazyUnionFeatureProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);

  objc_storeStrong((id *)&self->_first, 0);
}

- (void)setSecond:(id)a3
{
}

- (MLFeatureProvider)second
{
  return self->_second;
}

- (void)setFirst:(id)a3
{
}

- (MLFeatureProvider)first
{
  return self->_first;
}

- (id)unionFeatureProvider
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(MLLazyUnionFeatureProvider *)self featureNames];
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  v5 = [v3 allObjects];
  v6 = [v4 sharedKeySetForKeys:v5];

  v7 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = -[MLLazyUnionFeatureProvider featureValueForName:](self, "featureValueForName:", v12, (void)v16);
        if (v13) {
          [v7 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v14 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v7];

  return v14;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  v5 = [(MLFeatureProvider *)self->_first featureValueForName:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(MLFeatureProvider *)self->_second featureValueForName:v4];
  }
  id v8 = v7;

  return v8;
}

- (NSSet)featureNames
{
  v3 = [(MLFeatureProvider *)self->_second featureNames];
  id v4 = [(MLFeatureProvider *)self->_first featureNames];
  v5 = [v3 setByAddingObjectsFromSet:v4];

  return (NSSet *)v5;
}

- (MLLazyUnionFeatureProvider)initWithFeaturesFrom:(id)a3 addedToFeaturesFrom:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLLazyUnionFeatureProvider;
  uint64_t v9 = [(MLLazyUnionFeatureProvider *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

@end