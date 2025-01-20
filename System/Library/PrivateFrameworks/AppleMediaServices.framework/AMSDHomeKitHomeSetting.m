@interface AMSDHomeKitHomeSetting
- (AMSDHomeKitHomeSetting)initWithSetting:(id)a3;
- (BOOL)BOOLValue;
- (HMSetting)setting;
- (NSString)hashedDescription;
- (void)setSetting:(id)a3;
@end

@implementation AMSDHomeKitHomeSetting

- (AMSDHomeKitHomeSetting)initWithSetting:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDHomeKitHomeSetting;
  v6 = [(AMSDHomeKitHomeSetting *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_setting, a3);
  }

  return v7;
}

- (BOOL)BOOLValue
{
  v2 = [(AMSDHomeKitHomeSetting *)self setting];
  v3 = [v2 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(AMSDHomeKitHomeSetting *)self setting];
  unsigned __int8 v5 = [v4 keyPath];
  v6 = [(AMSDHomeKitHomeSetting *)self setting];
  v7 = [v6 value];
  v8 = AMSHashIfNeeded();
  objc_super v9 = +[NSString stringWithFormat:@"<%@: %p keyPath = %@ | value = %@>", v3, self, v5, v8];

  return (NSString *)v9;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
}

- (void).cxx_destruct
{
}

@end