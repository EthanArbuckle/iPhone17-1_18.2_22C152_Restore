@interface MOEffectiveCategoryShieldPolicy
- (MOCategoryShieldPolicy)defaultValue;
- (MOCategoryShieldPolicy)value;
- (MOEffectiveCategoryShieldPolicy)initWithValue:(id)a3 defaultValue:(id)a4;
@end

@implementation MOEffectiveCategoryShieldPolicy

- (MOEffectiveCategoryShieldPolicy)initWithValue:(id)a3 defaultValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOEffectiveCategoryShieldPolicy;
  v9 = [(MOEffectiveCategoryShieldPolicy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    objc_storeStrong((id *)&v10->_defaultValue, a4);
  }

  return v10;
}

- (MOCategoryShieldPolicy)value
{
  return (MOCategoryShieldPolicy *)objc_getProperty(self, a2, 8, 1);
}

- (MOCategoryShieldPolicy)defaultValue
{
  return (MOCategoryShieldPolicy *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end