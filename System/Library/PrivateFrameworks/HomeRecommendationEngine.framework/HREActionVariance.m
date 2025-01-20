@interface HREActionVariance
+ (id)varianceKeyForAction:(id)a3;
- (BOOL)passesForAction:(id)a3;
- (NSString)key;
- (id)_initWithKey:(id)a3;
@end

@implementation HREActionVariance

- (id)_initWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HREActionVariance;
  v6 = [(HRERule *)&v9 _init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

- (BOOL)passesForAction:(id)a3
{
  return 0;
}

+ (id)varianceKeyForAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 characteristic];
    id v5 = [v4 characteristicType];
    v6 = +[HRECharacteristicActionVarianceRule varianceKeyForCharacteristicType:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end