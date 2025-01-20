@interface LCFCoreMLFeatureProvider
+ (id)fromMLProvider:(id)a3;
- (NSDate)timestamp;
- (NSDictionary)featureValues;
- (NSSet)featureNames;
- (NSString)featureStoreKey;
- (id)featureValueForName:(id)a3;
- (id)init:(id)a3 timestamp:(id)a4 featureValues:(id)a5;
@end

@implementation LCFCoreMLFeatureProvider

- (id)init:(id)a3 timestamp:(id)a4 featureValues:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)LCFCoreMLFeatureProvider;
  v12 = [(LCFCoreMLFeatureProvider *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_featureStoreKey, a3);
    objc_storeStrong((id *)&v13->_timestamp, a4);
    objc_storeStrong((id *)&v13->_featureValues, a5);
    id v14 = objc_alloc(MEMORY[0x263EFFA08]);
    v15 = [(NSDictionary *)v13->_featureValues allKeys];
    uint64_t v16 = [v14 initWithArray:v15];
    featureNames = v13->_featureNames;
    v13->_featureNames = (NSSet *)v16;
  }
  return v13;
}

- (id)featureValueForName:(id)a3
{
  return [(NSDictionary *)self->_featureValues objectForKeyedSubscript:a3];
}

+ (id)fromMLProvider:(id)a3
{
  id v3 = a3;
  return v3;
}

- (NSString)featureStoreKey
{
  return self->_featureStoreKey;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

- (NSSet)featureNames
{
  return self->_featureNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_featureValues, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_featureStoreKey, 0);
}

@end