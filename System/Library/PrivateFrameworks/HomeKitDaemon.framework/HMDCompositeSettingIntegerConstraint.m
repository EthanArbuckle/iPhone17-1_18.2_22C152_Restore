@interface HMDCompositeSettingIntegerConstraint
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (HMDCompositeSettingIntegerConstraint)initWithMaxValue:(int64_t)a3 minValue:(int64_t)a4 stepValue:(int64_t)a5;
- (int64_t)max;
- (int64_t)min;
- (int64_t)step;
@end

@implementation HMDCompositeSettingIntegerConstraint

- (int64_t)step
{
  return self->_step;
}

- (int64_t)max
{
  return self->_max;
}

- (int64_t)min
{
  return self->_min;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_26E4D7BE8]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  v9 = v8;
  if (!v8)
  {
    BOOL v25 = 0;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  v10 = [v8 numberValue];
  uint64_t v11 = [v10 integerValue];
  v12 = [v9 numberValue];
  uint64_t v13 = [v12 integerValue];

  int64_t v14 = [(HMDCompositeSettingIntegerConstraint *)self max];
  if (v13 >= v14) {
    int64_t v15 = v14;
  }
  else {
    int64_t v15 = v13;
  }
  if (v11 == v15)
  {
    v16 = [v9 numberValue];
    uint64_t v17 = [v16 integerValue];
    v18 = [v9 numberValue];
    uint64_t v19 = [v18 integerValue];

    int64_t v20 = [(HMDCompositeSettingIntegerConstraint *)self min];
    if (v19 <= v20) {
      int64_t v21 = v20;
    }
    else {
      int64_t v21 = v19;
    }
    if (v17 == v21)
    {
      v22 = [v9 numberValue];
      uint64_t v23 = [v22 integerValue];
      uint64_t v24 = v23 - [(HMDCompositeSettingIntegerConstraint *)self min];
      BOOL v25 = v24 % [(HMDCompositeSettingIntegerConstraint *)self step] == 0;
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  if (a4)
  {
LABEL_20:
    if (!v25)
    {
      *a4 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    }
  }
LABEL_22:

  return v25;
}

- (HMDCompositeSettingIntegerConstraint)initWithMaxValue:(int64_t)a3 minValue:(int64_t)a4 stepValue:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingIntegerConstraint;
  result = [(HMDCompositeSettingIntegerConstraint *)&v9 init];
  if (result)
  {
    result->_min = a4;
    result->_max = a3;
    result->_step = a5;
  }
  return result;
}

@end