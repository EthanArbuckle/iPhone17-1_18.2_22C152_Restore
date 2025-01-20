@interface _HDStatisticsSyntheticQuantityType
+ (BOOL)supportsSecureCoding;
+ (id)syntheticQuantityTypeWithConfigurationProviding:(id)a3;
+ (id)syntheticQuantityTypeWithUnderlyingSampleType:(id)a3 aggregationStyle:(int64_t)a4 canonicalUnit:(id)a5;
+ (id)syntheticQuantityTypeWithUnderlyingSampleType:(id)a3 aggregationStyle:(int64_t)a4 canonicalUnit:(id)a5 shouldUseUnderlyingTypeForStatistics:(BOOL)a6;
- (BOOL)shouldUseUnderlyingTypeForStatistics;
- (Class)dataObjectClass;
- (HKSampleType)underlyingSampleType;
- (HKUnit)overriddenCanonicalUnit;
- (_HDStatisticsSyntheticQuantityType)initWithCoder:(id)a3;
- (id)_initWithUnderlyingSampleType:(uint64_t)a3 aggregationStyle:(void *)a4 canonicalUnit:(char)a5 shouldUseUnderlyingTypeForStatistics:;
- (id)canonicalUnit;
- (int64_t)aggregationStyle;
- (int64_t)overriddenAggregationStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldUseUnderlyingTypeForStatistics:(BOOL)a3;
@end

@implementation _HDStatisticsSyntheticQuantityType

+ (id)syntheticQuantityTypeWithUnderlyingSampleType:(id)a3 aggregationStyle:(int64_t)a4 canonicalUnit:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = -[_HDStatisticsSyntheticQuantityType _initWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:]([_HDStatisticsSyntheticQuantityType alloc], v8, a4, v7, 1);

  return v9;
}

- (id)_initWithUnderlyingSampleType:(uint64_t)a3 aggregationStyle:(void *)a4 canonicalUnit:(char)a5 shouldUseUnderlyingTypeForStatistics:
{
  id v9 = a2;
  id v10 = a4;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)_HDStatisticsSyntheticQuantityType;
    a1 = objc_msgSendSuper2(&v16, sel__initWithCode_, [v9 code]);
    if (a1)
    {
      uint64_t v11 = [v9 copy];
      v12 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v11;

      *((void *)a1 + 7) = a3;
      uint64_t v13 = [v10 copy];
      v14 = (void *)*((void *)a1 + 8);
      *((void *)a1 + 8) = v13;

      *((unsigned char *)a1 + 40) = a5;
    }
  }

  return a1;
}

+ (id)syntheticQuantityTypeWithUnderlyingSampleType:(id)a3 aggregationStyle:(int64_t)a4 canonicalUnit:(id)a5 shouldUseUnderlyingTypeForStatistics:(BOOL)a6
{
  id v9 = a5;
  id v10 = a3;
  id v11 = -[_HDStatisticsSyntheticQuantityType _initWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:]([_HDStatisticsSyntheticQuantityType alloc], v10, a4, v9, a6);

  return v11;
}

+ (id)syntheticQuantityTypeWithConfigurationProviding:(id)a3
{
  id v3 = a3;
  v4 = [_HDStatisticsSyntheticQuantityType alloc];
  v5 = [v3 underlyingSampleType];
  uint64_t v6 = [v3 aggregationStyleForStatistics];
  id v7 = [v3 canonicalUnitForStatistics];

  id v8 = -[_HDStatisticsSyntheticQuantityType _initWithUnderlyingSampleType:aggregationStyle:canonicalUnit:shouldUseUnderlyingTypeForStatistics:](v4, v5, v6, v7, 1);

  return v8;
}

- (int64_t)aggregationStyle
{
  return self->_overriddenAggregationStyle;
}

- (id)canonicalUnit
{
  return self->_overriddenCanonicalUnit;
}

- (Class)dataObjectClass
{
  return (Class)[(HKSampleType *)self->_underlyingSampleType dataObjectClass];
}

+ (BOOL)supportsSecureCoding
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];
}

- (_HDStatisticsSyntheticQuantityType)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HKSampleType)underlyingSampleType
{
  return self->_underlyingSampleType;
}

- (int64_t)overriddenAggregationStyle
{
  return self->_overriddenAggregationStyle;
}

- (HKUnit)overriddenCanonicalUnit
{
  return self->_overriddenCanonicalUnit;
}

- (BOOL)shouldUseUnderlyingTypeForStatistics
{
  return self->_shouldUseUnderlyingTypeForStatistics;
}

- (void)setShouldUseUnderlyingTypeForStatistics:(BOOL)a3
{
  self->_shouldUseUnderlyingTypeForStatistics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenCanonicalUnit, 0);

  objc_storeStrong((id *)&self->_underlyingSampleType, 0);
}

@end