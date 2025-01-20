@interface HFNumberValueConstraints
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFNumberRange)validRange;
- (HFNumberValueConstraints)init;
- (HFNumberValueConstraints)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5;
- (HFNumberValueConstraints)initWithValidRange:(id)a3 stepValue:(id)a4;
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (NSNumber)stepValue;
- (NSString)description;
- (id)_normalizeRangeValue:(id)a3 withinRange:(id)a4;
- (id)_normalizeStepValue:(id)a3 withinRange:(id)a4;
- (id)boundedValueForValue:(id)a3;
- (id)normalizedRangeForRange:(id)a3;
- (id)normalizedValueForValue:(id)a3;
- (id)percentageConstraints;
- (id)percentageConstraintsWithinRange:(id)a3;
- (id)roundedValueForValue:(id)a3;
- (unint64_t)hash;
@end

@implementation HFNumberValueConstraints

- (id)normalizedValueForValue:(id)a3
{
  v4 = [(HFNumberValueConstraints *)self roundedValueForValue:a3];
  v5 = [(HFNumberValueConstraints *)self boundedValueForValue:v4];

  return v5;
}

- (id)roundedValueForValue:(id)a3
{
  id v4 = a3;
  v5 = [(HFNumberValueConstraints *)self stepValue];

  if (v5)
  {
    v6 = [(HFNumberValueConstraints *)self stepValue];
    uint64_t v7 = [(HFNumberValueConstraints *)self minValue];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = &unk_26C0F79C8;
    }
    objc_msgSend(v4, "na_valueRoundedToNearestStepValue:relativeToBaseValue:", v6, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (HFNumberValueConstraints)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HFNumberValueConstraints;
  v11 = [(HFNumberValueConstraints *)&v25 init];
  if (v11)
  {
    objc_opt_class();
    id v12 = v8;
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    v14 = v13;

    minValue = v11->_minValue;
    v11->_minValue = v14;

    objc_opt_class();
    id v16 = v9;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    v18 = v17;

    maxValue = v11->_maxValue;
    v11->_maxValue = v18;

    objc_opt_class();
    id v20 = v10;
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    v22 = v21;

    stepValue = v11->_stepValue;
    v11->_stepValue = v22;
  }
  return v11;
}

- (id)boundedValueForValue:(id)a3
{
  id v4 = a3;
  v5 = [(HFNumberValueConstraints *)self minValue];

  v6 = v4;
  if (v5)
  {
    uint64_t v7 = [(HFNumberValueConstraints *)self minValue];
    v6 = objc_msgSend(v4, "na_largerNumber:", v7);
  }
  id v8 = [(HFNumberValueConstraints *)self maxValue];

  if (v8)
  {
    id v9 = [(HFNumberValueConstraints *)self maxValue];
    uint64_t v10 = objc_msgSend(v6, "na_smallerNumber:", v9);

    v6 = (void *)v10;
  }

  return v6;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
}

- (HFNumberValueConstraints)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithMinValue_maxValue_stepValue_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFNumberValueConstraints.m", 17, @"%s is unavailable; use %@ instead",
    "-[HFNumberValueConstraints init]",
    v5);

  return 0;
}

- (HFNumberValueConstraints)initWithValidRange:(id)a3 stepValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 minValue];
  id v9 = [v7 maxValue];

  uint64_t v10 = [(HFNumberValueConstraints *)self initWithMinValue:v8 maxValue:v9 stepValue:v6];
  return v10;
}

- (HFNumberRange)validRange
{
  uint64_t v3 = [(HFNumberValueConstraints *)self minValue];
  if (v3
    && (id v4 = (void *)v3,
        [(HFNumberValueConstraints *)self maxValue],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [(HFNumberValueConstraints *)self maxValue];
    id v7 = [(HFNumberValueConstraints *)self minValue];
    id v8 = +[HFNumberRange rangeWithMaxValue:v6 minValue:v7];
  }
  else
  {
    id v8 = 0;
  }
  return (HFNumberRange *)v8;
}

- (id)normalizedRangeForRange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 type];
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    id v7 = [v5 maxValue];
    id v8 = [(HFNumberValueConstraints *)self normalizedValueForValue:v7];
    id v9 = [v5 minValue];
    uint64_t v10 = [(HFNumberValueConstraints *)self normalizedValueForValue:v9];
    uint64_t v3 = +[HFNumberRange rangeWithMaxValue:v8 minValue:v10];
  }
  else
  {
    id v7 = [v5 midValue];
    id v8 = [(HFNumberValueConstraints *)self normalizedValueForValue:v7];
    uint64_t v3 = +[HFNumberRange valueWithValue:v8];
  }

LABEL_6:
  return v3;
}

- (id)percentageConstraints
{
  uint64_t v3 = [(HFNumberValueConstraints *)self validRange];

  if (v3)
  {
    id v4 = [(HFNumberValueConstraints *)self validRange];
    id v5 = [(HFNumberValueConstraints *)self percentageConstraintsWithinRange:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)percentageConstraintsWithinRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [HFNumberValueConstraints alloc];
    uint64_t v6 = [(HFNumberValueConstraints *)self minValue];
    id v7 = [(HFNumberValueConstraints *)self _normalizeRangeValue:v6 withinRange:v4];
    id v8 = [(HFNumberValueConstraints *)self maxValue];
    id v9 = [(HFNumberValueConstraints *)self _normalizeRangeValue:v8 withinRange:v4];
    uint64_t v10 = [(HFNumberValueConstraints *)self stepValue];
    v11 = [(HFNumberValueConstraints *)self _normalizeStepValue:v10 withinRange:v4];
    id v12 = [(HFNumberValueConstraints *)v5 initWithMinValue:v7 maxValue:v9 stepValue:v11];
  }
  else
  {
    NSLog(&cfstr_CannotCreatePe.isa);
    id v12 = 0;
  }

  return v12;
}

- (id)_normalizeStepValue:(id)a3 withinRange:(id)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && a4)
  {
    id v7 = [a4 spanValue];
    id v8 = +[HFNumberRange rangeWithMaxValue:v7 minValue:&unk_26C0F79C8];

    id v9 = [v8 percentageValueForValue:v6];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (id)_normalizeRangeValue:(id)a3 withinRange:(id)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5 && a4)
  {
    id v7 = [a4 percentageValueForValue:v5];
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_311 != -1) {
    dispatch_once(&_MergedGlobals_311, &__block_literal_global_16_9);
  }
  v2 = (void *)qword_26AB2FCF0;
  return (NAIdentity *)v2;
}

void __39__HFNumberValueConstraints_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_23_5];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_25_14];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_27_12];
  uint64_t v4 = [v0 build];

  id v5 = (void *)qword_26AB2FCF0;
  qword_26AB2FCF0 = v4;
}

uint64_t __39__HFNumberValueConstraints_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 minValue];
}

uint64_t __39__HFNumberValueConstraints_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 maxValue];
}

uint64_t __39__HFNumberValueConstraints_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 stepValue];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = [(HFNumberValueConstraints *)self minValue];
  id v5 = (id)[v3 appendObject:v4 withName:@"min" skipIfNil:1];

  uint64_t v6 = [(HFNumberValueConstraints *)self maxValue];
  id v7 = (id)[v3 appendObject:v6 withName:@"max" skipIfNil:1];

  id v8 = [(HFNumberValueConstraints *)self stepValue];
  id v9 = (id)[v3 appendObject:v8 withName:@"step" skipIfNil:1];

  uint64_t v10 = [v3 build];

  return (NSString *)v10;
}

@end