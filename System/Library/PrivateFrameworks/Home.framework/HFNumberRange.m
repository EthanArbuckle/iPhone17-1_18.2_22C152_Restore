@interface HFNumberRange
+ (HFNumberRange)rangeWithFloatRange:(id)a3;
+ (HFNumberRange)rangeWithMaxValue:(id)a3 minValue:(id)a4;
+ (NAIdentity)na_identity;
+ (id)valueWithValue:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)floatRangeValue;
- (BOOL)isEqual:(id)a3;
- (HFNumberRange)init;
- (HFNumberRange)initWithType:(unint64_t)a3;
- (NSNumber)maxValue;
- (NSNumber)midValue;
- (NSNumber)minValue;
- (NSNumber)spanValue;
- (NSString)description;
- (id)intersectRange:(id)a3;
- (id)mapValue:(id)a3 fromRange:(id)a4;
- (id)percentageValueForValue:(id)a3;
- (id)unionRange:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setMaxValue:(id)a3;
- (void)setMidValue:(id)a3;
- (void)setMinValue:(id)a3;
@end

@implementation HFNumberRange

- (NSNumber)midValue
{
  if ([(HFNumberRange *)self type] == 1)
  {
    v3 = NSNumber;
    v4 = [(HFNumberRange *)self maxValue];
    [v4 doubleValue];
    double v6 = v5;
    v7 = [(HFNumberRange *)self minValue];
    [v7 doubleValue];
    v9 = [v3 numberWithDouble:(v6 + v8) * 0.5];
  }
  else
  {
    v9 = self->_midValue;
  }
  return v9;
}

- (NSNumber)minValue
{
  if ([(HFNumberRange *)self type] == 1)
  {
    v3 = self->_minValue;
  }
  else
  {
    v3 = [(HFNumberRange *)self midValue];
  }
  return v3;
}

- (NSNumber)maxValue
{
  if ([(HFNumberRange *)self type] == 1)
  {
    v3 = self->_maxValue;
  }
  else
  {
    v3 = [(HFNumberRange *)self midValue];
  }
  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_midValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
}

+ (HFNumberRange)rangeWithMaxValue:(id)a3 minValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HFNumberRange alloc] initWithType:1];
  [(HFNumberRange *)v7 setMaxValue:v6];

  [(HFNumberRange *)v7 setMinValue:v5];
  return v7;
}

- (HFNumberRange)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFNumberRange;
  result = [(HFNumberRange *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (void)setMinValue:(id)a3
{
}

- (void)setMaxValue:(id)a3
{
}

+ (id)valueWithValue:(id)a3
{
  id v3 = a3;
  v4 = [[HFNumberRange alloc] initWithType:0];
  [(HFNumberRange *)v4 setMidValue:v3];

  return v4;
}

- (void)setMidValue:(id)a3
{
}

+ (HFNumberRange)rangeWithFloatRange:(id)a3
{
  double var0 = a3.var0;
  v4 = [NSNumber numberWithDouble:a3.var1];
  objc_super v5 = [NSNumber numberWithDouble:var0];
  id v6 = +[HFNumberRange rangeWithMaxValue:v4 minValue:v5];

  return (HFNumberRange *)v6;
}

- (HFNumberRange)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_super v5 = NSStringFromSelector(sel_initWithType_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFNumberRange.m", 43, @"%s is unavailable; use %@ instead",
    "-[HFNumberRange init]",
    v5);

  return 0;
}

- (NSNumber)spanValue
{
  id v3 = NSNumber;
  v4 = [(HFNumberRange *)self maxValue];
  [v4 doubleValue];
  double v6 = v5;
  v7 = [(HFNumberRange *)self minValue];
  [v7 doubleValue];
  v9 = [v3 numberWithDouble:v6 - v8];

  return (NSNumber *)v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)floatRangeValue
{
  id v3 = [(HFNumberRange *)self minValue];
  [v3 doubleValue];
  double v5 = v4;
  double v6 = [(HFNumberRange *)self maxValue];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.var1 = v10;
  result.double var0 = v9;
  return result;
}

- (id)percentageValueForValue:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    double v6 = [(HFNumberRange *)self minValue];
    [v6 doubleValue];
    double v8 = v7;

    double v9 = [(HFNumberRange *)self maxValue];
    [v9 doubleValue];
    double v11 = v10;

    v12 = NSNumber;
    [v5 doubleValue];
    double v14 = v13;

    v15 = [v12 numberWithDouble:(v14 - v8) / (v11 - v8)];
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)mapValue:(id)a3 fromRange:(id)a4
{
  if (a3)
  {
    id v7 = a4;
    id v8 = a3;
    double v9 = [(HFNumberRange *)self minValue];
    [v9 doubleValue];
    double v11 = v10;

    v12 = [(HFNumberRange *)self maxValue];
    [v12 doubleValue];
    double v14 = v13;

    v15 = [v7 percentageValueForValue:v8];

    [v15 doubleValue];
    double v17 = v16;

    v18 = [NSNumber numberWithDouble:v11 + v17 * (v14 - v11)];
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)unionRange:(id)a3
{
  id v4 = a3;
  id v5 = [(HFNumberRange *)self maxValue];
  double v6 = [v4 maxValue];
  id v7 = objc_msgSend(v5, "na_largerNumber:", v6);
  id v8 = [(HFNumberRange *)self minValue];
  double v9 = [v4 minValue];

  double v10 = objc_msgSend(v8, "na_smallerNumber:", v9);
  double v11 = +[HFNumberRange rangeWithMaxValue:v7 minValue:v10];

  return v11;
}

- (id)intersectRange:(id)a3
{
  id v4 = a3;
  id v5 = [(HFNumberRange *)self maxValue];
  double v6 = [v4 maxValue];
  id v7 = objc_msgSend(v5, "na_smallerNumber:", v6);
  id v8 = [(HFNumberRange *)self minValue];
  double v9 = [v4 minValue];

  double v10 = objc_msgSend(v8, "na_largerNumber:", v9);
  double v11 = +[HFNumberRange rangeWithMaxValue:v7 minValue:v10];

  return v11;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_246 != -1) {
    dispatch_once(&_MergedGlobals_246, &__block_literal_global_11_2);
  }
  v2 = (void *)qword_26AB2F028;
  return (NAIdentity *)v2;
}

void __28__HFNumberRange_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_18_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_20_3];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_22_2];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_24_2];
  uint64_t v5 = [v0 build];

  double v6 = (void *)qword_26AB2F028;
  qword_26AB2F028 = v5;
}

uint64_t __28__HFNumberRange_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 type];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __28__HFNumberRange_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 minValue];
}

uint64_t __28__HFNumberRange_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 maxValue];
}

uint64_t __28__HFNumberRange_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 midValue];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)description
{
  unint64_t v3 = [(HFNumberRange *)self type];
  unint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3 == 1)
  {
    double v6 = [(HFNumberRange *)self minValue];
    id v7 = [(HFNumberRange *)self maxValue];
    id v8 = [v4 stringWithFormat:@"<%@:%p (%@-%@)>", v5, self, v6, v7];
  }
  else
  {
    double v6 = [(HFNumberRange *)self midValue];
    id v8 = [v4 stringWithFormat:@"<%@:%p (%@)>", v5, self, v6];
  }

  return (NSString *)v8;
}

@end