@interface CPLSettingFeedbackMessage
+ (id)feedbackType;
- (CPLSettingFeedbackMessage)initWithSetting:(id)a3 value:(id)a4 libraryIdentifier:(id)a5;
- (NSString)settingName;
- (NSString)value;
- (id)serverMessage;
@end

@implementation CPLSettingFeedbackMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_settingName, 0);
}

- (NSString)value
{
  return self->_value;
}

- (NSString)settingName
{
  return self->_settingName;
}

- (id)serverMessage
{
  v7.receiver = self;
  v7.super_class = (Class)CPLSettingFeedbackMessage;
  v3 = [(CPLFeedbackMessage *)&v7 serverMessage];
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  [(CPLServerFeedbackKeyAndValue *)v4 setKey:@"setting"];
  [(CPLServerFeedbackKeyAndValue *)v4 setValue:self->_settingName];
  [v3 addKeysAndValues:v4];
  v5 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  [(CPLServerFeedbackKeyAndValue *)v5 setKey:@"settingValue"];
  [(CPLServerFeedbackKeyAndValue *)v5 setValue:self->_value];
  [v3 addKeysAndValues:v5];

  return v3;
}

- (CPLSettingFeedbackMessage)initWithSetting:(id)a3 value:(id)a4 libraryIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CPLSettingFeedbackMessage;
  v10 = [(CPLFeedbackMessage *)&v16 initWithLibraryIdentifier:a5];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    settingName = v10->_settingName;
    v10->_settingName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    value = v10->_value;
    v10->_value = (NSString *)v13;
  }
  return v10;
}

+ (id)feedbackType
{
  return @"setting";
}

@end