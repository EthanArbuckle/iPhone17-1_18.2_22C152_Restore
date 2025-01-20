@interface BBGlobalSettings
+ (BOOL)supportsSecureCoding;
- (BBGlobalSettings)initWithCoder:(id)a3;
- (BBGlobalSettings)initWithContentPreviewSetting:(int64_t)a3 announceSetting:(int64_t)a4 announceHeadphonesSetting:(int64_t)a5 announceCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 summarizationSetting:(int64_t)a11 highlightsSettings:(int64_t)a12;
- (BOOL)isEqual:(id)a3;
- (NSArray)globalScheduledDeliveryTimes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)globalAnnounceCarPlaySetting;
- (int64_t)globalAnnounceHeadphonesSetting;
- (int64_t)globalAnnounceSetting;
- (int64_t)globalContentPreviewSetting;
- (int64_t)globalHighlightsSetting;
- (int64_t)globalNotificationListDisplayStyleSetting;
- (int64_t)globalScheduledDeliverySetting;
- (int64_t)globalScheduledDeliveryShowNextSummarySetting;
- (int64_t)globalSpokenNotificationSetting;
- (int64_t)globalSummarizationSetting;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3;
- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3;
- (void)setGlobalAnnounceSetting:(int64_t)a3;
- (void)setGlobalContentPreviewSetting:(int64_t)a3;
- (void)setGlobalHighlightsSetting:(int64_t)a3;
- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)setGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3;
- (void)setGlobalScheduledDeliveryTimes:(id)a3;
- (void)setGlobalSummarizationSetting:(int64_t)a3;
@end

@implementation BBGlobalSettings

- (BBGlobalSettings)initWithContentPreviewSetting:(int64_t)a3 announceSetting:(int64_t)a4 announceHeadphonesSetting:(int64_t)a5 announceCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 summarizationSetting:(int64_t)a11 highlightsSettings:(int64_t)a12
{
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BBGlobalSettings;
  v19 = [(BBGlobalSettings *)&v24 init];
  v20 = v19;
  if (v19)
  {
    v19->_globalContentPreviewSetting = a3;
    v19->_globalAnnounceSetting = a4;
    v19->_globalAnnounceHeadphonesSetting = a5;
    v19->_globalAnnounceCarPlaySetting = a6;
    v19->_globalScheduledDeliverySetting = a7;
    uint64_t v21 = [v18 copy];
    globalScheduledDeliveryTimes = v20->_globalScheduledDeliveryTimes;
    v20->_globalScheduledDeliveryTimes = (NSArray *)v21;

    v20->_globalScheduledDeliveryShowNextSummarySetting = a9;
    v20->_globalNotificationListDisplayStyleSetting = a10;
    v20->_globalSummarizationSetting = a11;
    v20->_globalHighlightsSetting = a12;
  }

  return v20;
}

- (id)description
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if ([(BBGlobalSettings *)self globalContentPreviewSetting])
  {
    v3 = BBStringFromBBContentPreviewSetting([(BBGlobalSettings *)self globalContentPreviewSetting]);
    v4 = [@" Global Settings: " stringByAppendingFormat:@"Content Preview Setting: '%@'", v3];
  }
  else
  {
    v4 = @" Global Settings: ";
  }
  if ([(BBGlobalSettings *)self globalAnnounceSetting])
  {
    v5 = BBStringFromBBAnnounceSetting([(BBGlobalSettings *)self globalAnnounceSetting]);
    uint64_t v6 = [(__CFString *)v4 stringByAppendingFormat:@"Announce Setting: '%@'", v5];

    v4 = (__CFString *)v6;
  }
  if ([(BBGlobalSettings *)self globalAnnounceHeadphonesSetting])
  {
    v7 = BBStringFromBBAnnounceSetting([(BBGlobalSettings *)self globalAnnounceHeadphonesSetting]);
    uint64_t v8 = [(__CFString *)v4 stringByAppendingFormat:@"Announce Headphone Setting: '%@'", v7];

    v4 = (__CFString *)v8;
  }
  if ([(BBGlobalSettings *)self globalAnnounceCarPlaySetting])
  {
    v9 = BBStringFromBBAnnounceCarPlaySetting([(BBGlobalSettings *)self globalAnnounceCarPlaySetting]);
    uint64_t v10 = [(__CFString *)v4 stringByAppendingFormat:@"Announce CarPlay Setting: '%@'", v9];

    v4 = (__CFString *)v10;
  }
  if ([(BBGlobalSettings *)self globalScheduledDeliverySetting])
  {
    v11 = BBStringFromBBScheduledDeliverySetting([(BBGlobalSettings *)self globalScheduledDeliverySetting]);
    uint64_t v12 = [(__CFString *)v4 stringByAppendingFormat:@"Scheduled Delivery Setting: '%@'", v11];

    v4 = (__CFString *)v12;
  }
  v13 = [(BBGlobalSettings *)self globalScheduledDeliveryTimes];

  if (v13)
  {
    v14 = [(__CFString *)v4 stringByAppendingFormat:@"Scheduled Delivery Times: [ "];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v15 = [(BBGlobalSettings *)self globalScheduledDeliveryTimes];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        uint64_t v19 = 0;
        v20 = v14;
        do
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          v14 = objc_msgSend(v20, "stringByAppendingFormat:", @" %li:%li,", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v19), "hour"), objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v19), "minute"));

          ++v19;
          v20 = v14;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v17);
    }

    v4 = [v14 stringByAppendingFormat:@" ]"];
  }
  if ([(BBGlobalSettings *)self globalScheduledDeliveryShowNextSummarySetting])
  {
    uint64_t v21 = BBStringFromBBSystemSetting([(BBGlobalSettings *)self globalScheduledDeliveryShowNextSummarySetting]);
    uint64_t v22 = [(__CFString *)v4 stringByAppendingFormat:@"Scheduled Delivery Show Next Summary Setting: '%@'", v21];

    v4 = (__CFString *)v22;
  }
  if ([(BBGlobalSettings *)self globalNotificationListDisplayStyleSetting])
  {
    v23 = BBStringFromBBNotificationListDisplayStyleSetting([(BBGlobalSettings *)self globalNotificationListDisplayStyleSetting]);
    uint64_t v24 = [(__CFString *)v4 stringByAppendingFormat:@"Notification List State Setting: '%@'", v23];

    v4 = (__CFString *)v24;
  }
  if ([(BBGlobalSettings *)self globalSummarizationSetting])
  {
    v25 = BBStringFromBBSystemSetting([(BBGlobalSettings *)self globalSummarizationSetting]);
    uint64_t v26 = [(__CFString *)v4 stringByAppendingFormat:@"Summarization Setting: '%@'", v25];

    v4 = (__CFString *)v26;
  }
  if ([(BBGlobalSettings *)self globalHighlightsSetting])
  {
    v27 = BBStringFromBBSystemSetting([(BBGlobalSettings *)self globalHighlightsSetting]);
    uint64_t v28 = [(__CFString *)v4 stringByAppendingFormat:@"Highlights Setting: '%@'", v27];

    v4 = (__CFString *)v28;
  }
  v32.receiver = self;
  v32.super_class = (Class)BBGlobalSettings;
  v29 = [(BBGlobalSettings *)&v32 description];
  v30 = [v29 stringByAppendingString:v4];

  return v30;
}

- (unint64_t)hash
{
  int64_t v3 = [(BBGlobalSettings *)self globalContentPreviewSetting];
  int64_t v4 = [(BBGlobalSettings *)self globalAnnounceSetting] ^ v3;
  int64_t v5 = [(BBGlobalSettings *)self globalAnnounceHeadphonesSetting];
  int64_t v6 = v4 ^ v5 ^ [(BBGlobalSettings *)self globalAnnounceCarPlaySetting];
  int64_t v7 = [(BBGlobalSettings *)self globalScheduledDeliverySetting];
  uint64_t v8 = [(BBGlobalSettings *)self globalScheduledDeliveryTimes];
  uint64_t v9 = v6 ^ v7 ^ [v8 hash];
  int64_t v10 = [(BBGlobalSettings *)self globalScheduledDeliveryShowNextSummarySetting];
  int64_t v11 = v10 ^ [(BBGlobalSettings *)self globalNotificationListDisplayStyleSetting];
  int64_t v12 = v11 ^ [(BBGlobalSettings *)self globalSummarizationSetting];
  unint64_t v13 = v9 ^ v12 ^ [(BBGlobalSettings *)self globalHighlightsSetting];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (BBGlobalSettings *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      int64_t v5 = v4;
      int64_t v6 = [(BBGlobalSettings *)self globalContentPreviewSetting];
      if (v6 == [(BBGlobalSettings *)v5 globalContentPreviewSetting]
        && (int64_t v7 = [(BBGlobalSettings *)self globalAnnounceSetting],
            v7 == [(BBGlobalSettings *)v5 globalAnnounceSetting])
        && (int64_t v8 = [(BBGlobalSettings *)self globalAnnounceHeadphonesSetting],
            v8 == [(BBGlobalSettings *)v5 globalAnnounceHeadphonesSetting])
        && (int64_t v9 = [(BBGlobalSettings *)self globalAnnounceCarPlaySetting],
            v9 == [(BBGlobalSettings *)v5 globalAnnounceCarPlaySetting])
        && (int64_t v10 = [(BBGlobalSettings *)self globalScheduledDeliverySetting],
            v10 == [(BBGlobalSettings *)v5 globalScheduledDeliverySetting]))
      {
        int64_t v11 = [(BBGlobalSettings *)self globalScheduledDeliveryTimes];
        int64_t v12 = [(BBGlobalSettings *)v5 globalScheduledDeliveryTimes];
        if ([v11 isEqualToArray:v12]
          && (int64_t v13 = [(BBGlobalSettings *)self globalScheduledDeliveryShowNextSummarySetting], v13 == [(BBGlobalSettings *)v5 globalScheduledDeliveryShowNextSummarySetting])&& (v14 = [(BBGlobalSettings *)self globalNotificationListDisplayStyleSetting], v14 == [(BBGlobalSettings *)v5 globalNotificationListDisplayStyleSetting])&& (v15 = [(BBGlobalSettings *)self globalSummarizationSetting], v15 == [(BBGlobalSettings *)v5 globalSummarizationSetting]))
        {
          int64_t v16 = [(BBGlobalSettings *)self globalHighlightsSetting];
          BOOL v17 = v16 == [(BBGlobalSettings *)v5 globalHighlightsSetting];
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setGlobalContentPreviewSetting:", -[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting"));
  objc_msgSend(v4, "setGlobalAnnounceSetting:", -[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"));
  objc_msgSend(v4, "setGlobalAnnounceHeadphonesSetting:", -[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting"));
  objc_msgSend(v4, "setGlobalAnnounceCarPlaySetting:", -[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting"));
  objc_msgSend(v4, "setGlobalScheduledDeliverySetting:", -[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
  int64_t v5 = [(BBGlobalSettings *)self globalScheduledDeliveryTimes];
  [v4 setGlobalScheduledDeliveryTimes:v5];

  objc_msgSend(v4, "setGlobalScheduledDeliveryShowNextSummarySetting:", -[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting"));
  objc_msgSend(v4, "setGlobalNotificationListDisplayStyleSetting:", -[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting"));
  objc_msgSend(v4, "setGlobalSummarizationSetting:", -[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting"));
  objc_msgSend(v4, "setGlobalHighlightsSetting:", -[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting"), @"contentPreviews");
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"), @"announce");
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting"), @"announceHeadphones");
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting"), @"announceCarPlay");
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"), @"scheduledDelivery");
  int64_t v4 = [(BBGlobalSettings *)self globalScheduledDeliveryTimes];
  [v5 encodeObject:v4 forKey:@"scheduledDeliveryTimes"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting"), @"scheduledDeliveryShowNextSummary");
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting"), @"notificationListDisplayStyle");
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting"), @"summarization");
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting"), @"highlights");
}

- (BBGlobalSettings)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeIntegerForKey:@"contentPreviews"];
  if ([v3 containsValueForKey:@"announce"]) {
    id v5 = @"announce";
  }
  else {
    id v5 = @"spokenNotifications";
  }
  uint64_t v6 = [v3 decodeIntegerForKey:v5];
  uint64_t v7 = [v3 decodeIntegerForKey:@"announceHeadphones"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"announceCarPlay"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"scheduledDelivery"];
  int64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  int64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  int64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"scheduledDeliveryTimes"];

  int64_t v14 = -[BBGlobalSettings initWithContentPreviewSetting:announceSetting:announceHeadphonesSetting:announceCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:summarizationSetting:highlightsSettings:](self, "initWithContentPreviewSetting:announceSetting:announceHeadphonesSetting:announceCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:summarizationSetting:highlightsSettings:", v4, v6, v7, v8, v9, v13, [v3 decodeIntegerForKey:@"scheduledDeliveryShowNextSummary"], objc_msgSend(v3, "decodeIntegerForKey:", @"notificationListDisplayStyle"), objc_msgSend(v3, "decodeIntegerForKey:", @"summarization"), objc_msgSend(v3, "decodeIntegerForKey:", @"highlights"));
  return v14;
}

- (int64_t)globalSpokenNotificationSetting
{
  unint64_t v2 = [(BBGlobalSettings *)self globalAnnounceSetting];
  return BBSpokenNotificationSettingForAnnounceSetting(v2);
}

- (int64_t)globalContentPreviewSetting
{
  return self->_globalContentPreviewSetting;
}

- (void)setGlobalContentPreviewSetting:(int64_t)a3
{
  self->_globalContentPreviewSetting = a3;
}

- (int64_t)globalAnnounceSetting
{
  return self->_globalAnnounceSetting;
}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  self->_globalAnnounceSetting = a3;
}

- (int64_t)globalAnnounceHeadphonesSetting
{
  return self->_globalAnnounceHeadphonesSetting;
}

- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  self->_globalAnnounceHeadphonesSetting = a3;
}

- (int64_t)globalAnnounceCarPlaySetting
{
  return self->_globalAnnounceCarPlaySetting;
}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  self->_globalAnnounceCarPlaySetting = a3;
}

- (int64_t)globalScheduledDeliverySetting
{
  return self->_globalScheduledDeliverySetting;
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  self->_globalScheduledDeliverySetting = a3;
}

- (NSArray)globalScheduledDeliveryTimes
{
  return self->_globalScheduledDeliveryTimes;
}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
{
}

- (int64_t)globalScheduledDeliveryShowNextSummarySetting
{
  return self->_globalScheduledDeliveryShowNextSummarySetting;
}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  self->_globalScheduledDeliveryShowNextSummarySetting = a3;
}

- (int64_t)globalNotificationListDisplayStyleSetting
{
  return self->_globalNotificationListDisplayStyleSetting;
}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  self->_globalNotificationListDisplayStyleSetting = a3;
}

- (int64_t)globalSummarizationSetting
{
  return self->_globalSummarizationSetting;
}

- (void)setGlobalSummarizationSetting:(int64_t)a3
{
  self->_globalSummarizationSetting = a3;
}

- (int64_t)globalHighlightsSetting
{
  return self->_globalHighlightsSetting;
}

- (void)setGlobalHighlightsSetting:(int64_t)a3
{
  self->_globalHighlightsSetting = a3;
}

- (void).cxx_destruct
{
}

@end