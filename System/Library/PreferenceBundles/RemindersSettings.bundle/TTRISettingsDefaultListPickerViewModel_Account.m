@interface TTRISettingsDefaultListPickerViewModel_Account
- (NSArray)lists;
- (NSString)name;
- (TTRISettingsDefaultListPickerViewModel_Account)initWithAccount:(id)a3;
- (void)setLists:(id)a3;
- (void)setName:(id)a3;
@end

@implementation TTRISettingsDefaultListPickerViewModel_Account

- (TTRISettingsDefaultListPickerViewModel_Account)initWithAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTRISettingsDefaultListPickerViewModel_Account;
  v5 = [(TTRISettingsDefaultListPickerViewModel_Account *)&v9 init];
  if (v5)
  {
    v6 = [v4 displayName];
    [(TTRISettingsDefaultListPickerViewModel_Account *)v5 setName:v6];

    v7 = +[NSArray array];
    [(TTRISettingsDefaultListPickerViewModel_Account *)v5 setLists:v7];
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)lists
{
  return self->_lists;
}

- (void)setLists:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lists, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end