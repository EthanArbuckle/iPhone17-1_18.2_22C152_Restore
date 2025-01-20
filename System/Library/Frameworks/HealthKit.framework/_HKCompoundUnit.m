@interface _HKCompoundUnit
+ (BOOL)supportsSecureCoding;
+ (id)unitWithBaseUnits:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_HKCompoundUnit)initWithCoder:(id)a3;
- (id)_baseUnits;
- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4;
- (id)_initWithBaseUnits:(id)a3;
- (id)dimension;
- (id)unitString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKCompoundUnit

- (BOOL)isEqual:(id)a3
{
  v4 = (_HKCompoundUnit *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if ([(_HKCompoundUnit *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_HKCompoundUnit *)v4 _baseUnits];
    char v6 = [v5 isEqual:self->_baseUnits];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_baseUnits
{
  return self->_baseUnits;
}

- (id)unitString
{
  return [(_HKFactorization *)self->_baseUnits unitString];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_HKCompoundUnit;
  [(HKUnit *)&v3 encodeWithCoder:a3];
}

+ (id)unitWithBaseUnits:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithBaseUnits:v4];

  return v5;
}

- (id)_initWithBaseUnits:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKCompoundUnit;
  v5 = [(HKUnit *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[6];
    v5[6] = v6;

    *((_DWORD *)v5 + 16) = 0;
  }

  return v5;
}

- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  id v6 = a4;
  v7 = +[_HKFactorization factorization];
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x3FF0000000000000;
  baseUnits = self->_baseUnits;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77___HKCompoundUnit__computeBaseUnitReductionAndProportionalSize_withCycleSet___block_invoke;
  v14[3] = &unk_1E58C68F8;
  id v9 = v6;
  id v15 = v9;
  v17 = &v18;
  id v10 = v7;
  id v16 = v10;
  [(_HKFactorization *)baseUnits enumerateFactorsWithHandler:v14];
  if (a3) {
    *a3 = v19[3];
  }
  v11 = v16;
  id v12 = v10;

  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)dimension
{
  dimension = self->_dimension;
  if (!dimension)
  {
    os_unfair_lock_lock(&self->_dimensionLock);
    if (!self->_dimension)
    {
      id v4 = +[_HKFactorization factorization];
      baseUnits = self->_baseUnits;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __28___HKCompoundUnit_dimension__block_invoke;
      v10[3] = &unk_1E58C4638;
      id v11 = v4;
      id v6 = v4;
      [(_HKFactorization *)baseUnits enumerateFactorsWithHandler:v10];
      v7 = +[_HKCompoundDimension dimensionWithBaseDimensions:v6];
      v8 = self->_dimension;
      self->_dimension = v7;
    }
    os_unfair_lock_unlock(&self->_dimensionLock);
    dimension = self->_dimension;
  }

  return dimension;
}

- (unint64_t)hash
{
  return [(_HKFactorization *)self->_baseUnits hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCompoundUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKCompoundUnit;
  v5 = [(HKUnit *)&v12 initWithCoder:v4];
  if (v5 && ([v4 containsValueForKey:@"HKUnitStringKey"] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HKCompoundUnitBaseUnitsKey"];
    baseUnits = v5->_baseUnits;
    v5->_baseUnits = (_HKFactorization *)v9;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimension, 0);

  objc_storeStrong((id *)&self->_baseUnits, 0);
}

@end