@interface ANDefaultsItem
+ (id)itemWithValue:(id)a3 userInfo:(id)a4;
- (NSObject)defaultValue;
- (NSString)userInfo;
- (void)setDefaultValue:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation ANDefaultsItem

+ (id)itemWithValue:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setDefaultValue:v6];

  [v7 setUserInfo:v5];

  return v7;
}

- (NSObject)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end