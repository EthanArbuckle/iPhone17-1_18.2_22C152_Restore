@interface HREActionRangeVarianceRule
+ (id)rangeVarianceWithType:(id)a3 max:(unint64_t)a4;
+ (id)rangeVarianceWithType:(id)a3 min:(unint64_t)a4;
+ (id)rangeVarianceWithType:(id)a3 min:(unint64_t)a4 max:(unint64_t)a5;
+ (id)rangeVarianceWithType:(id)a3 range:(_NSRange)a4;
- (BOOL)passesForAction:(id)a3;
- (BOOL)passesWithTargetValue:(id)a3;
- (_NSRange)allowedTargetValues;
- (id)_initWithType:(id)a3 range:(_NSRange)a4;
@end

@implementation HREActionRangeVarianceRule

- (id)_initWithType:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)HREActionRangeVarianceRule;
  id result = [(HRECharacteristicActionVarianceRule *)&v7 _initWithType:a3];
  if (result)
  {
    *((void *)result + 3) = location;
    *((void *)result + 4) = length;
  }
  return result;
}

+ (id)rangeVarianceWithType:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v7, location, length);

  return v8;
}

+ (id)rangeVarianceWithType:(id)a3 max:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v6, 0, a4 + 1);

  return v7;
}

+ (id)rangeVarianceWithType:(id)a3 min:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v6, a4, -1);

  return v7;
}

+ (id)rangeVarianceWithType:(id)a3 min:(unint64_t)a4 max:(unint64_t)a5
{
  id v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:range:", v8, a4, a5 - a4 + 1);

  return v9;
}

- (BOOL)passesForAction:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HREActionRangeVarianceRule;
  if ([(HRECharacteristicActionVarianceRule *)&v8 passesForAction:v4])
  {
    v5 = [v4 targetValue];
    BOOL v6 = [(HREActionRangeVarianceRule *)self passesWithTargetValue:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)passesWithTargetValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    unint64_t v8 = [v7 unsignedIntegerValue];
    unint64_t v9 = [(HREActionRangeVarianceRule *)self allowedTargetValues];
    BOOL v12 = v8 >= v9 && v8 - v9 < v10;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (_NSRange)allowedTargetValues
{
  p_allowedTargetValues = &self->_allowedTargetValues;
  NSUInteger location = self->_allowedTargetValues.location;
  NSUInteger length = p_allowedTargetValues->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end