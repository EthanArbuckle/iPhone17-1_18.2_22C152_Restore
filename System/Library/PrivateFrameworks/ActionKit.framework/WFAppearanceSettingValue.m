@interface WFAppearanceSettingValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isDarkModeOn;
- (NSString)wfName;
- (WFAppearanceSettingValue)initWithCoder:(id)a3;
- (WFAppearanceSettingValue)initWithSetting:(int64_t)a3;
- (id)valueByInvertingSetting;
- (int64_t)setting;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppearanceSettingValue

- (int64_t)setting
{
  return self->_setting;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAppearanceSettingValue setting](self, "setting"), @"setting");
}

- (WFAppearanceSettingValue)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"setting"];
  return [(WFAppearanceSettingValue *)self initWithSetting:v4];
}

- (NSString)wfName
{
  v2 = [(WFAppearanceSettingValue *)self setting];
  if (v2 == (void *)2)
  {
    v3 = @"Light Mode";
LABEL_7:
    v2 = WFLocalizedString(v3);
    goto LABEL_8;
  }
  if (v2 == (void *)1)
  {
    v3 = @"Dark Mode";
    goto LABEL_7;
  }
  if (!v2)
  {
    v2 = WFLocalizedStringWithKey(@"Unknown (appearance)", @"Unknown");
  }
LABEL_8:
  return (NSString *)v2;
}

- (BOOL)isDarkModeOn
{
  return [(WFAppearanceSettingValue *)self setting] == 1;
}

- (id)valueByInvertingSetting
{
  unint64_t v2 = [(WFAppearanceSettingValue *)self setting];
  if (v2 <= 2) {
    v3 = [[WFAppearanceSettingValue alloc] initWithSetting:qword_23C71CF58[v2]];
  }
  return v3;
}

- (WFAppearanceSettingValue)initWithSetting:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFAppearanceSettingValue;
  uint64_t v4 = [(WFAppearanceSettingValue *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_setting = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end