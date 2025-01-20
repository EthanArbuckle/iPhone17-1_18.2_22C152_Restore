@interface HPSBooleanSetting
+ (Class)valueClass;
+ (id)settingWithKeyPath:(id)a3 BOOLeanValue:(BOOL)a4;
- (BOOL)BOOLeanValue;
- (HPSBooleanSetting)initWithKeyPath:(id)a3 BOOLeanValue:(BOOL)a4;
- (id)description;
- (id)homeAdapterLegacySettingValue;
@end

@implementation HPSBooleanSetting

- (HPSBooleanSetting)initWithKeyPath:(id)a3 BOOLeanValue:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithBool:v4];
  v9 = [(HPSSetting *)self initWithKeyPath:v7 value:v8];

  return v9;
}

+ (id)settingWithKeyPath:(id)a3 BOOLeanValue:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithBool:v4];
  v9 = [a1 settingWithKeyPath:v7 value:v8];

  return v9;
}

- (BOOL)BOOLeanValue
{
  v2 = [(HPSSetting *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = v2 != 0;
  }

  return v3;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)homeAdapterLegacySettingValue
{
  v2 = NSNumber;
  BOOL v3 = [(HPSBooleanSetting *)self BOOLeanValue];
  return (id)[v2 numberWithBool:v3];
}

- (id)description
{
  BOOL v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HPSSetting *)self keyPath];
  if ([(HPSBooleanSetting *)self BOOLeanValue]) {
    id v7 = @"true";
  }
  else {
    id v7 = @"false";
  }
  v8 = [(HPSSetting *)self lastModifiedDescription];
  v9 = [v3 stringWithFormat:@"<%@: %p, %@ = %@%@>", v5, self, v6, v7, v8];

  return v9;
}

@end