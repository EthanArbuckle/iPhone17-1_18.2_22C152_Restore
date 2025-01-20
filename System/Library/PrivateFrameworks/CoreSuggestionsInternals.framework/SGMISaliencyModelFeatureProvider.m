@interface SGMISaliencyModelFeatureProvider
- (MLMultiArray)data;
- (NSSet)featureNames;
- (SGMISaliencyModelFeatureProvider)initWithData:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setData:(id)a3;
- (void)setFeatureNames:(id)a3;
@end

@implementation SGMISaliencyModelFeatureProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setFeatureNames:(id)a3
{
}

- (NSSet)featureNames
{
  return self->_featureNames;
}

- (void)setData:(id)a3
{
}

- (MLMultiArray)data
{
  return self->_data;
}

- (id)featureValueForName:(id)a3
{
  if ([(NSSet *)self->_featureNames containsObject:a3])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:self->_data];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (SGMISaliencyModelFeatureProvider)initWithData:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGMISaliencyModelFeatureProvider;
  v6 = [(SGMISaliencyModelFeatureProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"featureVector", 0);
    featureNames = v7->_featureNames;
    v7->_featureNames = (NSSet *)v9;
  }
  return v7;
}

@end