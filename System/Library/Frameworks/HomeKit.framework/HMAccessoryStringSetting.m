@interface HMAccessoryStringSetting
- (Class)valueClass;
- (HMAccessoryStringSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5;
@end

@implementation HMAccessoryStringSetting

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HMAccessoryStringSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[_HMAccessorySetting alloc] initWithType:3 properties:a4 name:v9 constraints:0];

  [(_HMAccessorySetting *)v10 setValue:v8];
  v11 = [(HMAccessorySetting *)self initWithInternal:v10];

  return v11;
}

@end