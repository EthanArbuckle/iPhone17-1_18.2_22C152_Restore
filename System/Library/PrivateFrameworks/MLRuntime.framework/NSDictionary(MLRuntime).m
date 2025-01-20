@interface NSDictionary(MLRuntime)
- (double)mlr_doubleValueForKey:()MLRuntime defaultValue:;
- (float)mlr_floatValueForKey:()MLRuntime defaultValue:;
- (id)_numberValueForKey:()MLRuntime;
- (id)mlr_dictionaryValueForKey:()MLRuntime;
- (id)mlr_stringValueForKey:()MLRuntime defaultValue:;
- (uint64_t)mlr_BOOLValueForKey:()MLRuntime defaultValue:;
- (uint64_t)mlr_integerValueForKey:()MLRuntime defaultValue:;
- (uint64_t)mlr_unsignedIntegerValueForKey:()MLRuntime defaultValue:;
@end

@implementation NSDictionary(MLRuntime)

- (id)_numberValueForKey:()MLRuntime
{
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  if (v5)
  {
    v6 = [a1 objectForKeyedSubscript:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [a1 objectForKeyedSubscript:v4];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)mlr_floatValueForKey:()MLRuntime defaultValue:
{
  v3 = objc_msgSend(a1, "_numberValueForKey:");
  id v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    a2 = v5;
  }

  return a2;
}

- (double)mlr_doubleValueForKey:()MLRuntime defaultValue:
{
  v3 = objc_msgSend(a1, "_numberValueForKey:");
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    a2 = v5;
  }

  return a2;
}

- (uint64_t)mlr_BOOLValueForKey:()MLRuntime defaultValue:
{
  double v5 = objc_msgSend(a1, "_numberValueForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (uint64_t)mlr_integerValueForKey:()MLRuntime defaultValue:
{
  double v5 = objc_msgSend(a1, "_numberValueForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (uint64_t)mlr_unsignedIntegerValueForKey:()MLRuntime defaultValue:
{
  double v5 = objc_msgSend(a1, "_numberValueForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 unsignedIntegerValue];
  }

  return a4;
}

- (id)mlr_stringValueForKey:()MLRuntime defaultValue:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 objectForKeyedSubscript:v6];
  if (v8)
  {
    v9 = [a1 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [a1 objectForKeyedSubscript:v6];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = v7;
  }
  id v12 = v11;

  return v12;
}

- (id)mlr_dictionaryValueForKey:()MLRuntime
{
  id v4 = a3;
  double v5 = [a1 objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [a1 objectForKeyedSubscript:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [a1 objectForKeyedSubscript:v4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end