@interface HUAnnounceNotificationSettingsItem
+ (unint64_t)sortOrderForMode:(unint64_t)a3;
- (HMUser)user;
- (HUAnnounceNotificationSettingsItem)initWithNotificationMode:(unint64_t)a3 user:(id)a4;
- (id)_notificationModeToString:(unint64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)notificationMode;
- (unint64_t)sortOrder;
@end

@implementation HUAnnounceNotificationSettingsItem

- (HUAnnounceNotificationSettingsItem)initWithNotificationMode:(unint64_t)a3 user:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceNotificationSettingsItem;
  v8 = [(HUAnnounceNotificationSettingsItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_notificationMode = a3;
    objc_storeStrong((id *)&v8->_user, a4);
    v9->_sortOrder = +[HUAnnounceNotificationSettingsItem sortOrderForMode:a3];
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  v4 = [(HUAnnounceNotificationSettingsItem *)self user];
  v5 = [v4 announceUserSettings];

  uint64_t v6 = [v5 deviceNotificationMode];
  v18[0] = *MEMORY[0x1E4F68AB8];
  id v7 = [(HUAnnounceNotificationSettingsItem *)self _notificationModeToString:[(HUAnnounceNotificationSettingsItem *)self notificationMode]];
  v19[0] = v7;
  v18[1] = *MEMORY[0x1E4F68B40];
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[HUAnnounceNotificationSettingsItem notificationMode](self, "notificationMode") == v6);
  v19[1] = v8;
  v18[2] = *MEMORY[0x1E4F68908];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [(HUAnnounceNotificationSettingsItem *)self user];
  objc_super v11 = [v9 setWithObject:v10];
  v19[2] = v11;
  v18[3] = *MEMORY[0x1E4F68B48];
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUAnnounceNotificationSettingsItem sortOrder](self, "sortOrder"));
  v18[4] = *MEMORY[0x1E4F68A70];
  v19[3] = v12;
  v19[4] = MEMORY[0x1E4F1CC28];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

  v14 = (void *)MEMORY[0x1E4F7A0D8];
  v15 = [MEMORY[0x1E4F69228] outcomeWithResults:v13];
  v16 = [v14 futureWithResult:v15];

  return v16;
}

+ (unint64_t)sortOrderForMode:(unint64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (id)_notificationModeToString:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = @"HUAnnounceNotificationSetting_NotSet";
      goto LABEL_9;
    case 1uLL:
      v4 = @"HUAnnounceNotificationSetting_Never";
      goto LABEL_9;
    case 2uLL:
      v4 = @"HUAnnounceNotificationSetting_AtHome";
      goto LABEL_9;
    case 3uLL:
      v4 = @"HUAnnounceNotificationSetting_Always";
LABEL_9:
      _HULocalizedStringWithDefaultValue(v4, v4, 1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = &stru_1F18F92B8;
      break;
  }
  return v5;
}

- (unint64_t)notificationMode
{
  return self->_notificationMode;
}

- (HMUser)user
{
  return self->_user;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (void).cxx_destruct
{
}

@end