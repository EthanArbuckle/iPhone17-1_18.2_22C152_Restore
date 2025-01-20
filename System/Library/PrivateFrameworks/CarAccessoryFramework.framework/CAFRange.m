@interface CAFRange
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)isInRange:(id)a3;
- (CAFCachedDescription)cachedDescription;
- (CAFCharacteristicMetadata)metaData;
- (CAFFloatRange)floatRange;
- (CAFInt16Range)int16Range;
- (CAFInt32Range)int32Range;
- (CAFInt64Range)int64Range;
- (CAFInt8Range)int8Range;
- (CAFRange)initWithMetaData:(id)a3;
- (CAFUInt16Range)uInt16Range;
- (CAFUInt32Range)uInt32Range;
- (CAFUInt64Range)uInt64Range;
- (CAFUInt8Range)uInt8Range;
- (NSArray)validValues;
- (NSNumber)maximum;
- (NSNumber)minimum;
- (NSNumber)step;
- (NSString)description;
- (id)currentDescriptionForCache:(id)a3;
- (id)valueRoundedToNearestStepValue:(id)a3;
- (void)setCachedDescription:(id)a3;
@end

@implementation CAFRange

- (CAFInt64Range)int64Range
{
  v3 = [CAFInt64Range alloc];
  v4 = [(CAFRange *)self metaData];
  v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFInt16Range)int16Range
{
  v3 = [CAFInt16Range alloc];
  v4 = [(CAFRange *)self metaData];
  v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFUInt64Range)uInt64Range
{
  v3 = [CAFUInt64Range alloc];
  v4 = [(CAFRange *)self metaData];
  v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFRange)initWithMetaData:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAFRange;
  v6 = [(CAFRange *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metaData, a3);
    v8 = [[CAFCachedDescription alloc] initWithCacheable:v7 lazyRefreshDescription:1];
    cachedDescription = v7->_cachedDescription;
    v7->_cachedDescription = v8;
  }
  return v7;
}

- (NSNumber)minimum
{
  v3 = [(CAFRange *)self metaData];
  v4 = [v3 minimumValue];

  if (v4)
  {
    id v5 = [(CAFRange *)self metaData];
    v6 = [v5 minimumValue];
  }
  else
  {
    v6 = [(id)objc_opt_class() minimum];
  }
  return (NSNumber *)v6;
}

- (NSNumber)maximum
{
  v3 = [(CAFRange *)self metaData];
  v4 = [v3 maximumValue];

  if (v4)
  {
    id v5 = [(CAFRange *)self metaData];
    v6 = [v5 maximumValue];
  }
  else
  {
    v6 = [(id)objc_opt_class() maximum];
  }
  return (NSNumber *)v6;
}

- (NSNumber)step
{
  v3 = [(CAFRange *)self metaData];
  v4 = [v3 stepValue];

  if (v4)
  {
    id v5 = [(CAFRange *)self metaData];
    v6 = [v5 stepValue];
  }
  else
  {
    v6 = [(id)objc_opt_class() step];
  }
  return (NSNumber *)v6;
}

- (NSArray)validValues
{
  v2 = [(CAFRange *)self metaData];
  v3 = [v2 validValues];

  return (NSArray *)v3;
}

- (BOOL)isInRange:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFRange *)self validValues];

  if (v5)
  {
    v6 = [(CAFRange *)self validValues];
    char v7 = [v6 containsObject:v4];

    return v7;
  }
  else
  {
    v9 = [(CAFRange *)self minimum];
    unint64_t v10 = [v4 compare:v9];

    objc_super v11 = [(CAFRange *)self maximum];
    uint64_t v12 = [v4 compare:v11];

    return v10 < 2 && (unint64_t)(v12 + 1) < 2;
  }
}

- (id)valueRoundedToNearestStepValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F087B8]) initWithRoundingMode:0 scale:0 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  v6 = (void *)MEMORY[0x263F087B0];
  char v7 = [(CAFRange *)self minimum];
  v8 = v7;
  if (v7)
  {
    [v7 decimalValue];
  }
  else
  {
    v25[0] = 0;
    v25[1] = 0;
    int v26 = 0;
  }
  v9 = [v6 decimalNumberWithDecimal:v25];

  unint64_t v10 = (void *)MEMORY[0x263F087B0];
  objc_super v11 = [(CAFRange *)self step];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 decimalValue];
  }
  else
  {
    v23[0] = 0;
    v23[1] = 0;
    int v24 = 0;
  }
  v13 = [v10 decimalNumberWithDecimal:v23];

  v14 = (void *)MEMORY[0x263F087B0];
  if (v4)
  {
    [v4 decimalValue];
  }
  else
  {
    v21[0] = 0;
    v21[1] = 0;
    int v22 = 0;
  }
  v15 = [v14 decimalNumberWithDecimal:v21];
  v16 = [v15 decimalNumberBySubtracting:v9];
  v17 = [v16 decimalNumberByDividingBy:v13 withBehavior:v5];

  v18 = [v17 decimalNumberByMultiplyingBy:v13];
  v19 = [v9 decimalNumberByAdding:v18];

  return v19;
}

- (NSString)description
{
  v2 = [(CAFRange *)self cachedDescription];
  v3 = [v2 description];

  return (NSString *)v3;
}

+ (id)minimum
{
  return &unk_26FD90AC8;
}

+ (id)maximum
{
  return &unk_26FD90AC8;
}

+ (id)step
{
  return &unk_26FD90AE0;
}

- (id)currentDescriptionForCache:(id)a3
{
  id v4 = [(CAFRange *)self validValues];

  if (v4)
  {
    id v5 = NSString;
    v6 = [(CAFRange *)self validValues];
    char v7 = [v6 componentsJoinedByString:@","];
    v8 = [v5 stringWithFormat:@"[%@]", v7];
  }
  else
  {
    v8 = &stru_26FD46EB0;
  }
  v9 = NSString;
  unint64_t v10 = [(CAFRange *)self minimum];
  objc_super v11 = [(CAFRange *)self maximum];
  uint64_t v12 = [(CAFRange *)self step];
  v13 = [v9 stringWithFormat:@"%@[%@..%@]x%@", v8, v10, v11, v12];

  return v13;
}

- (CAFCharacteristicMetadata)metaData
{
  return self->_metaData;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

- (CAFFloatRange)floatRange
{
  v3 = [CAFFloatRange alloc];
  id v4 = [(CAFRange *)self metaData];
  id v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFUInt8Range)uInt8Range
{
  v3 = [CAFUInt8Range alloc];
  id v4 = [(CAFRange *)self metaData];
  id v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFInt32Range)int32Range
{
  v3 = [CAFInt32Range alloc];
  id v4 = [(CAFRange *)self metaData];
  id v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFUInt32Range)uInt32Range
{
  v3 = [CAFUInt32Range alloc];
  id v4 = [(CAFRange *)self metaData];
  id v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFUInt16Range)uInt16Range
{
  v3 = [CAFUInt16Range alloc];
  id v4 = [(CAFRange *)self metaData];
  id v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

- (CAFInt8Range)int8Range
{
  v3 = [CAFInt8Range alloc];
  id v4 = [(CAFRange *)self metaData];
  id v5 = [(CAFRange *)v3 initWithMetaData:v4];

  return v5;
}

@end