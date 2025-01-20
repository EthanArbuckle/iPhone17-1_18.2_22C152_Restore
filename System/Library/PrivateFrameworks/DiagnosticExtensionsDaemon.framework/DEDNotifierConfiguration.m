@interface DEDNotifierConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
- (BOOL)followupUseSpringboardNotification;
- (BOOL)isEqual:(id)a3;
- (BOOL)userNotificationShouldPlaySound;
- (DEDNotifierConfiguration)initWithCoder:(id)a3;
- (DEDNotifierConfiguration)initWithHostAppIdentifier:(id)a3 localizedNotificationTitle:(id)a4 localizedNotificationBody:(id)a5;
- (NSDictionary)followupReviewActionUserInfo;
- (NSDictionary)followupSendActionUserInfo;
- (NSString)followupExtensionIdentifier;
- (NSString)followupLocalizedInformativeText;
- (NSString)followupLocalizedTitle;
- (NSString)followupNotificationActionTitle;
- (NSString)followupNotificationBundleIconName;
- (NSString)followupNotificationBundlePath;
- (NSString)followupUniqueIdentifier;
- (NSString)hostAppIdentifier;
- (NSString)localizedNotificationBody;
- (NSString)localizedNotificationTitle;
- (NSString)reviewActionLabel;
- (NSString)sendActionLabel;
- (NSURL)followupNotificationActionURL;
- (NSURL)followupReviewActionURL;
- (NSURL)followupSendActionURL;
- (double)followupFrequency;
- (void)encodeWithCoder:(id)a3;
- (void)setFollowupExtensionIdentifier:(id)a3;
- (void)setFollowupFrequency:(double)a3;
- (void)setFollowupLocalizedInformativeText:(id)a3;
- (void)setFollowupLocalizedTitle:(id)a3;
- (void)setFollowupNotificationActionTitle:(id)a3;
- (void)setFollowupNotificationActionURL:(id)a3;
- (void)setFollowupNotificationBundleIconName:(id)a3;
- (void)setFollowupNotificationBundlePath:(id)a3;
- (void)setFollowupReviewActionURL:(id)a3;
- (void)setFollowupReviewActionUserInfo:(id)a3;
- (void)setFollowupSendActionURL:(id)a3;
- (void)setFollowupSendActionUserInfo:(id)a3;
- (void)setFollowupUniqueIdentifier:(id)a3;
- (void)setFollowupUseSpringboardNotification:(BOOL)a3;
- (void)setHostAppIdentifier:(id)a3;
- (void)setLocalizedNotificationBody:(id)a3;
- (void)setLocalizedNotificationTitle:(id)a3;
- (void)setReviewActionLabel:(id)a3;
- (void)setSendActionLabel:(id)a3;
- (void)setUserNotificationShouldPlaySound:(BOOL)a3;
@end

@implementation DEDNotifierConfiguration

- (DEDNotifierConfiguration)initWithHostAppIdentifier:(id)a3 localizedNotificationTitle:(id)a4 localizedNotificationBody:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DEDNotifierConfiguration;
  v12 = [(DEDNotifierConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hostAppIdentifier, a3);
    objc_storeStrong((id *)&v13->_localizedNotificationTitle, a4);
    objc_storeStrong((id *)&v13->_localizedNotificationBody, a5);
  }

  return v13;
}

- (DEDNotifierConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)DEDNotifierConfiguration;
  v5 = [(DEDNotifierConfiguration *)&v44 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostAppIdentifier"];
    hostAppIdentifier = v5->_hostAppIdentifier;
    v5->_hostAppIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedNotificationTitle"];
    localizedNotificationTitle = v5->_localizedNotificationTitle;
    v5->_localizedNotificationTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedNotificationBody"];
    localizedNotificationBody = v5->_localizedNotificationBody;
    v5->_localizedNotificationBody = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reviewActionLabel"];
    reviewActionLabel = v5->_reviewActionLabel;
    v5->_reviewActionLabel = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendActionLabel"];
    sendActionLabel = v5->_sendActionLabel;
    v5->_sendActionLabel = (NSString *)v14;

    v5->_userNotificationShouldPlaySound = [v4 decodeBoolForKey:@"userNotificationShouldPlaySound"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupUniqueIdentifier"];
    followupUniqueIdentifier = v5->_followupUniqueIdentifier;
    v5->_followupUniqueIdentifier = (NSString *)v16;

    [v4 decodeDoubleForKey:@"followupFrequency"];
    v5->_followupFrequency = v18;
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupReviewActionURL"];
    followupReviewActionURL = v5->_followupReviewActionURL;
    v5->_followupReviewActionURL = (NSURL *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupSendActionURL"];
    followupSendActionURL = v5->_followupSendActionURL;
    v5->_followupSendActionURL = (NSURL *)v21;

    v23 = [(id)objc_opt_class() archivedClasses];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"followupReviewActionUserInfo"];
    followupReviewActionUserInfo = v5->_followupReviewActionUserInfo;
    v5->_followupReviewActionUserInfo = (NSDictionary *)v24;

    v26 = [(id)objc_opt_class() archivedClasses];
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"followupSendActionUserInfo"];
    followupSendActionUserInfo = v5->_followupSendActionUserInfo;
    v5->_followupSendActionUserInfo = (NSDictionary *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupLocalizedTitle"];
    followupLocalizedTitle = v5->_followupLocalizedTitle;
    v5->_followupLocalizedTitle = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupLocalizedInformativeText"];
    followupLocalizedInformativeText = v5->_followupLocalizedInformativeText;
    v5->_followupLocalizedInformativeText = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupExtensionIdentifier"];
    followupExtensionIdentifier = v5->_followupExtensionIdentifier;
    v5->_followupExtensionIdentifier = (NSString *)v33;

    v5->_followupUseSpringboardNotification = [v4 decodeBoolForKey:@"followupUseSpringboardNotification"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupNotificationActionURL"];
    followupNotificationActionURL = v5->_followupNotificationActionURL;
    v5->_followupNotificationActionURL = (NSURL *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupNotificationActionTitle"];
    followupNotificationActionTitle = v5->_followupNotificationActionTitle;
    v5->_followupNotificationActionTitle = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupNotificationBundlePath"];
    followupNotificationBundlePath = v5->_followupNotificationBundlePath;
    v5->_followupNotificationBundlePath = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"followupNotificationBundleIconName"];
    followupNotificationBundleIconName = v5->_followupNotificationBundleIconName;
    v5->_followupNotificationBundleIconName = (NSString *)v41;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DEDNotifierConfiguration *)self hostAppIdentifier];
  [v4 encodeObject:v5 forKey:@"hostAppIdentifier"];

  uint64_t v6 = [(DEDNotifierConfiguration *)self localizedNotificationTitle];
  [v4 encodeObject:v6 forKey:@"localizedNotificationTitle"];

  v7 = [(DEDNotifierConfiguration *)self localizedNotificationBody];
  [v4 encodeObject:v7 forKey:@"localizedNotificationBody"];

  uint64_t v8 = [(DEDNotifierConfiguration *)self reviewActionLabel];
  [v4 encodeObject:v8 forKey:@"reviewActionLabel"];

  id v9 = [(DEDNotifierConfiguration *)self sendActionLabel];
  [v4 encodeObject:v9 forKey:@"sendActionLabel"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDNotifierConfiguration userNotificationShouldPlaySound](self, "userNotificationShouldPlaySound"), @"userNotificationShouldPlaySound");
  uint64_t v10 = [(DEDNotifierConfiguration *)self followupUniqueIdentifier];
  [v4 encodeObject:v10 forKey:@"followupUniqueIdentifier"];

  [(DEDNotifierConfiguration *)self followupFrequency];
  objc_msgSend(v4, "encodeDouble:forKey:", @"followupFrequency");
  id v11 = [(DEDNotifierConfiguration *)self followupReviewActionURL];
  [v4 encodeObject:v11 forKey:@"followupReviewActionURL"];

  uint64_t v12 = [(DEDNotifierConfiguration *)self followupSendActionURL];
  [v4 encodeObject:v12 forKey:@"followupSendActionURL"];

  v13 = [(DEDNotifierConfiguration *)self followupLocalizedTitle];
  [v4 encodeObject:v13 forKey:@"followupLocalizedTitle"];

  uint64_t v14 = [(DEDNotifierConfiguration *)self followupLocalizedInformativeText];
  [v4 encodeObject:v14 forKey:@"followupLocalizedInformativeText"];

  objc_super v15 = [(DEDNotifierConfiguration *)self followupExtensionIdentifier];
  [v4 encodeObject:v15 forKey:@"followupExtensionIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDNotifierConfiguration followupUseSpringboardNotification](self, "followupUseSpringboardNotification"), @"followupUseSpringboardNotification");
  uint64_t v16 = [(DEDNotifierConfiguration *)self followupNotificationActionURL];
  [v4 encodeObject:v16 forKey:@"followupNotificationActionURL"];

  v17 = [(DEDNotifierConfiguration *)self followupNotificationActionTitle];
  [v4 encodeObject:v17 forKey:@"followupNotificationActionTitle"];

  double v18 = [(DEDNotifierConfiguration *)self followupNotificationBundlePath];
  [v4 encodeObject:v18 forKey:@"followupNotificationBundlePath"];

  id v19 = [(DEDNotifierConfiguration *)self followupNotificationBundleIconName];
  [v4 encodeObject:v19 forKey:@"followupNotificationBundleIconName"];
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(DEDNotifierConfiguration *)self hostAppIdentifier];
    v7 = [v5 hostAppIdentifier];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [(DEDNotifierConfiguration *)self localizedNotificationTitle];
      id v9 = [v5 localizedNotificationTitle];
      if ([v8 isEqualToString:v9])
      {
        uint64_t v10 = [(DEDNotifierConfiguration *)self localizedNotificationBody];
        id v11 = [v5 localizedNotificationBody];
        if ([v10 isEqualToString:v11])
        {
          uint64_t v12 = [(DEDNotifierConfiguration *)self reviewActionLabel];
          v49 = [v5 reviewActionLabel];
          if (objc_msgSend(v12, "isEqualToString:"))
          {
            v46 = v10;
            v13 = [(DEDNotifierConfiguration *)self sendActionLabel];
            v47 = [v5 sendActionLabel];
            v48 = v13;
            if (objc_msgSend(v13, "isEqualToString:"))
            {
              v45 = v12;
              int v14 = [(DEDNotifierConfiguration *)self userNotificationShouldPlaySound];
              if (v14 == [v5 userNotificationShouldPlaySound])
              {
                uint64_t v16 = [(DEDNotifierConfiguration *)self followupUniqueIdentifier];
                v43 = [v5 followupUniqueIdentifier];
                uint64_t v12 = v45;
                objc_super v44 = v16;
                if (objc_msgSend(v16, "isEqualToString:")
                  && ([(DEDNotifierConfiguration *)self followupFrequency],
                      double v18 = v17,
                      [v5 followupFrequency],
                      v18 == v19))
                {
                  v20 = [(DEDNotifierConfiguration *)self followupReviewActionURL];
                  uint64_t v41 = [v5 followupReviewActionURL];
                  v42 = v20;
                  if (objc_msgSend(v20, "isEqual:"))
                  {
                    uint64_t v21 = [(DEDNotifierConfiguration *)self followupSendActionURL];
                    uint64_t v39 = [v5 followupSendActionURL];
                    v40 = v21;
                    if (objc_msgSend(v21, "isEqual:"))
                    {
                      v38 = [(DEDNotifierConfiguration *)self followupLocalizedTitle];
                      uint64_t v37 = [v5 followupLocalizedTitle];
                      if (objc_msgSend(v38, "isEqualToString:"))
                      {
                        v22 = [(DEDNotifierConfiguration *)self followupLocalizedInformativeText];
                        uint64_t v35 = [v5 followupLocalizedInformativeText];
                        v36 = v22;
                        if (objc_msgSend(v22, "isEqualToString:"))
                        {
                          int v23 = [(DEDNotifierConfiguration *)self followupUseSpringboardNotification];
                          if (v23 == [v5 followupUseSpringboardNotification])
                          {
                            uint64_t v24 = [(DEDNotifierConfiguration *)self followupNotificationActionURL];
                            v34 = [v5 followupNotificationActionURL];
                            if (objc_msgSend(v24, "isEqual:"))
                            {
                              v25 = [(DEDNotifierConfiguration *)self followupNotificationActionTitle];
                              v32 = [v5 followupNotificationActionTitle];
                              uint64_t v33 = v25;
                              if (objc_msgSend(v25, "isEqualToString:"))
                              {
                                v26 = [(DEDNotifierConfiguration *)self followupNotificationBundlePath];
                                v30 = [v5 followupNotificationBundlePath];
                                uint64_t v31 = v26;
                                if (objc_msgSend(v26, "isEqualToString:"))
                                {
                                  uint64_t v29 = [(DEDNotifierConfiguration *)self followupNotificationBundleIconName];
                                  uint64_t v27 = [v5 followupNotificationBundleIconName];
                                  char v15 = [v29 isEqualToString:v27];
                                }
                                else
                                {
                                  char v15 = 0;
                                }
                              }
                              else
                              {
                                char v15 = 0;
                              }
                            }
                            else
                            {
                              char v15 = 0;
                            }
                          }
                          else
                          {
                            char v15 = 0;
                          }
                          uint64_t v12 = v45;
                        }
                        else
                        {
                          char v15 = 0;
                        }
                        uint64_t v10 = v46;
                      }
                      else
                      {
                        char v15 = 0;
                        uint64_t v10 = v46;
                      }
                    }
                    else
                    {
                      char v15 = 0;
                      uint64_t v10 = v46;
                    }
                  }
                  else
                  {
                    char v15 = 0;
                    uint64_t v10 = v46;
                  }
                }
                else
                {
                  char v15 = 0;
                  uint64_t v10 = v46;
                }
              }
              else
              {
                char v15 = 0;
                uint64_t v12 = v45;
                uint64_t v10 = v46;
              }
            }
            else
            {
              char v15 = 0;
              uint64_t v10 = v46;
            }
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (NSString)hostAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHostAppIdentifier:(id)a3
{
}

- (NSString)localizedNotificationTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedNotificationTitle:(id)a3
{
}

- (NSString)localizedNotificationBody
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalizedNotificationBody:(id)a3
{
}

- (NSString)reviewActionLabel
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReviewActionLabel:(id)a3
{
}

- (NSString)sendActionLabel
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSendActionLabel:(id)a3
{
}

- (BOOL)userNotificationShouldPlaySound
{
  return self->_userNotificationShouldPlaySound;
}

- (void)setUserNotificationShouldPlaySound:(BOOL)a3
{
  self->_userNotificationShouldPlaySound = a3;
}

- (NSString)followupUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFollowupUniqueIdentifier:(id)a3
{
}

- (double)followupFrequency
{
  return self->_followupFrequency;
}

- (void)setFollowupFrequency:(double)a3
{
  self->_followupFrequency = a3;
}

- (NSURL)followupReviewActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFollowupReviewActionURL:(id)a3
{
}

- (NSURL)followupSendActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFollowupSendActionURL:(id)a3
{
}

- (NSDictionary)followupReviewActionUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFollowupReviewActionUserInfo:(id)a3
{
}

- (NSDictionary)followupSendActionUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFollowupSendActionUserInfo:(id)a3
{
}

- (NSString)followupLocalizedTitle
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFollowupLocalizedTitle:(id)a3
{
}

- (NSString)followupLocalizedInformativeText
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFollowupLocalizedInformativeText:(id)a3
{
}

- (NSString)followupExtensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFollowupExtensionIdentifier:(id)a3
{
}

- (BOOL)followupUseSpringboardNotification
{
  return self->_followupUseSpringboardNotification;
}

- (void)setFollowupUseSpringboardNotification:(BOOL)a3
{
  self->_followupUseSpringboardNotification = a3;
}

- (NSURL)followupNotificationActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFollowupNotificationActionURL:(id)a3
{
}

- (NSString)followupNotificationActionTitle
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFollowupNotificationActionTitle:(id)a3
{
}

- (NSString)followupNotificationBundlePath
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFollowupNotificationBundlePath:(id)a3
{
}

- (NSString)followupNotificationBundleIconName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFollowupNotificationBundleIconName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followupNotificationBundleIconName, 0);
  objc_storeStrong((id *)&self->_followupNotificationBundlePath, 0);
  objc_storeStrong((id *)&self->_followupNotificationActionTitle, 0);
  objc_storeStrong((id *)&self->_followupNotificationActionURL, 0);
  objc_storeStrong((id *)&self->_followupExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_followupLocalizedInformativeText, 0);
  objc_storeStrong((id *)&self->_followupLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_followupSendActionUserInfo, 0);
  objc_storeStrong((id *)&self->_followupReviewActionUserInfo, 0);
  objc_storeStrong((id *)&self->_followupSendActionURL, 0);
  objc_storeStrong((id *)&self->_followupReviewActionURL, 0);
  objc_storeStrong((id *)&self->_followupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_sendActionLabel, 0);
  objc_storeStrong((id *)&self->_reviewActionLabel, 0);
  objc_storeStrong((id *)&self->_localizedNotificationBody, 0);
  objc_storeStrong((id *)&self->_localizedNotificationTitle, 0);
  objc_storeStrong((id *)&self->_hostAppIdentifier, 0);
}

@end