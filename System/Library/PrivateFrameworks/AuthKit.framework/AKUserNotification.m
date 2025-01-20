@interface AKUserNotification
- (AKUserNotification)initWithPushMessage:(id)a3;
- (NSString)actionButtonText;
- (NSString)bodyKey;
- (NSString)identifier;
- (NSString)localizedAppsNameList;
- (NSString)otherButtonText;
- (NSString)subTitleKey;
- (NSString)titleKey;
- (id)description;
- (void)setActionButtonText:(id)a3;
- (void)setBodyKey:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedAppsNameList:(id)a3;
- (void)setOtherButtonText:(id)a3;
- (void)setSubTitleKey:(id)a3;
- (void)setTitleKey:(id)a3;
@end

@implementation AKUserNotification

- (AKUserNotification)initWithPushMessage:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AKUserNotification;
  v5 = [(AKUserNotification *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 messageId];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 alertTitle];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v8;

    uint64_t v10 = [v4 secondaryTitle];
    subTitleKey = v5->_subTitleKey;
    v5->_subTitleKey = (NSString *)v10;

    uint64_t v12 = [v4 alertBody];
    bodyKey = v5->_bodyKey;
    v5->_bodyKey = (NSString *)v12;

    uint64_t v14 = [v4 defaultButtonTitle];
    actionButtonText = v5->_actionButtonText;
    v5->_actionButtonText = (NSString *)v14;

    uint64_t v16 = [v4 alternateButtonTitle];
    otherButtonText = v5->_otherButtonText;
    v5->_otherButtonText = (NSString *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ - identifier: %@, title: %@, subTitle: %@, body: %@, action button: %@, other button: %@, apps:%@>", v4, self->_identifier, self->_titleKey, self->_subTitleKey, self->_bodyKey, self->_actionButtonText, self->_otherButtonText, self->_localizedAppsNameList];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
}

- (NSString)subTitleKey
{
  return self->_subTitleKey;
}

- (void)setSubTitleKey:(id)a3
{
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (void)setBodyKey:(id)a3
{
}

- (NSString)actionButtonText
{
  return self->_actionButtonText;
}

- (void)setActionButtonText:(id)a3
{
}

- (NSString)otherButtonText
{
  return self->_otherButtonText;
}

- (void)setOtherButtonText:(id)a3
{
}

- (NSString)localizedAppsNameList
{
  return self->_localizedAppsNameList;
}

- (void)setLocalizedAppsNameList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppsNameList, 0);
  objc_storeStrong((id *)&self->_otherButtonText, 0);
  objc_storeStrong((id *)&self->_actionButtonText, 0);
  objc_storeStrong((id *)&self->_bodyKey, 0);
  objc_storeStrong((id *)&self->_subTitleKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end