@interface _HKCompoundDimension
+ (id)dimensionWithBaseDimensions:(id)a3;
- (id)_baseDimensions;
- (id)_initWithBaseDimensions:(id)a3;
@end

@implementation _HKCompoundDimension

+ (id)dimensionWithBaseDimensions:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithBaseDimensions:v4];

  return v5;
}

- (id)_initWithBaseDimensions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKCompoundDimension;
  v5 = [(_HKDimension *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    baseDimensions = v5->_baseDimensions;
    v5->_baseDimensions = (_HKFactorization *)v6;
  }
  return v5;
}

- (id)_baseDimensions
{
  return self->_baseDimensions;
}

- (void).cxx_destruct
{
}

@end