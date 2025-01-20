@interface FFFeatureGroup
- (FFFeatureGroup)initWithName:(id)a3;
- (NSDictionary)attributes;
- (NSDictionary)featureSets;
- (NSString)disclosure;
- (NSString)name;
- (void)setAttributes:(id)a3;
- (void)setDisclosure:(id)a3;
- (void)setFeatureSets:(id)a3;
@end

@implementation FFFeatureGroup

- (FFFeatureGroup)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FFFeatureGroup;
  v6 = [(FFFeatureGroup *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)featureSets
{
  return self->_featureSets;
}

- (void)setFeatureSets:(id)a3
{
}

- (NSString)disclosure
{
  return self->_disclosure;
}

- (void)setDisclosure:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_disclosure, 0);
  objc_storeStrong((id *)&self->_featureSets, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end