@interface _HKDimension
+ (id)dimensionFromString:(id)a3;
- (_HKDimension)init;
- (id)_baseDimensions;
- (id)description;
- (id)reduction;
@end

@implementation _HKDimension

- (_HKDimension)init
{
  v3.receiver = self;
  v3.super_class = (Class)_HKDimension;
  result = [(_HKDimension *)&v3 init];
  if (result) {
    result->_reductionLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)dimensionFromString:(id)a3
{
  id v3 = a3;
  if (_HKDimensionGrammar_onceToken != -1) {
    dispatch_once(&_HKDimensionGrammar_onceToken, &__block_literal_global_243_0);
  }
  v4 = +[_HKFactorization factorizationFromString:v3 factorGrammar:_HKDimensionGrammar___grammar];
  if ([v4 factorCount] == 1
    && ([v4 anyFactor],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v4 exponentForFactor:v5],
        v5,
        v6 == 1))
  {
    uint64_t v7 = [v4 anyFactor];
  }
  else
  {
    uint64_t v7 = +[_HKCompoundDimension dimensionWithBaseDimensions:v4];
  }
  v8 = (void *)v7;

  return v8;
}

- (id)reduction
{
  p_reductionLock = &self->_reductionLock;
  os_unfair_lock_lock(&self->_reductionLock);
  if (!self->_reduction)
  {
    v4 = +[_HKFactorization factorization];
    v5 = [(_HKDimension *)self _baseDimensions];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __25___HKDimension_reduction__block_invoke;
    v11[3] = &unk_1E58C2988;
    id v12 = v4;
    id v6 = v4;
    [v5 enumerateFactorsWithHandler:v11];

    uint64_t v7 = (_HKFactorization *)[v6 copy];
    reduction = self->_reduction;
    self->_reduction = v7;
  }
  os_unfair_lock_unlock(p_reductionLock);
  v9 = self->_reduction;

  return v9;
}

- (id)description
{
  v2 = [(_HKDimension *)self _baseDimensions];
  id v3 = [v2 description];

  return v3;
}

- (void).cxx_destruct
{
}

- (id)_baseDimensions
{
  return 0;
}

@end