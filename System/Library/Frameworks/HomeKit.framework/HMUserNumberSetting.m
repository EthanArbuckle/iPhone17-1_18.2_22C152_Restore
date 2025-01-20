@interface HMUserNumberSetting
- (BOOL)doesValueConformToConstraints:(id)a3;
- (void)updateValue:(id)a3 completionHandler:(id)a4;
@end

@implementation HMUserNumberSetting

- (BOOL)doesValueConformToConstraints:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMNumberSetting *)self minimumValue];
    if (v7)
    {
      int v8 = [v6 intValue];
      v9 = [(HMNumberSetting *)self minimumValue];
      if (v8 >= (int)[v9 intValue])
      {
        v11 = [(HMNumberSetting *)self maximumValue];
        if (v11)
        {
          int v12 = [v6 intValue];
          v13 = [(HMNumberSetting *)self maximumValue];
          BOOL v10 = v12 <= (int)[v13 intValue];
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMSetting *)self settingManager];
  [v8 updateValueForSetting:self value:v7 completionHandler:v6];
}

@end