@interface FFFeatureSet
- (FFFeatureSet)initWithGroup:(id)a3 set:(id)a4;
- (FFFeatureSet)initWithIdentifier:(id)a3;
- (FFFeatureSetIdentifier)identifier;
- (NSArray)features;
- (void)setFeatures:(id)a3;
@end

@implementation FFFeatureSet

- (FFFeatureSet)initWithGroup:(id)a3 set:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[FFFeatureSetIdentifier alloc] initWithGroup:v7 set:v6];

  v9 = [(FFFeatureSet *)self initWithIdentifier:v8];
  return v9;
}

- (FFFeatureSet)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FFFeatureSet;
  id v6 = [(FFFeatureSet *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (FFFeatureSetIdentifier)identifier
{
  return self->_identifier;
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end