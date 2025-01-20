@interface ACNotificationsFormatProvider
- (ACNotificationsFormatProvider)initWithAceObject:(id)a3;
- (id)identifier;
- (id)speakableNamespaceProviderForAceObject:(id)a3;
- (id)stringForExpression:(id)a3;
- (void)setAssistantBulletin:(id)a3;
@end

@implementation ACNotificationsFormatProvider

- (id)speakableNamespaceProviderForAceObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = [[ACNotificationsFormatProvider alloc] initWithAceObject:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (ACNotificationsFormatProvider)initWithAceObject:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACNotificationsFormatProvider;
  v6 = [(ACNotificationsFormatProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notification, a3);
    v8 = [(SANotificationObject *)v7->_notification identifier];
    uint64_t v9 = [v8 host];
    notificationIdentifier = v7->_notificationIdentifier;
    v7->_notificationIdentifier = (NSString *)v9;
  }
  return v7;
}

- (id)identifier
{
  return self->_notificationIdentifier;
}

- (void)setAssistantBulletin:(id)a3
{
}

- (id)stringForExpression:(id)a3
{
  id v4 = a3;
  assistantBulletin = self->_assistantBulletin;
  if (assistantBulletin)
  {
    v6 = [(AFBulletin *)assistantBulletin sectionID];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.mobilecal"];

    if (v7)
    {
      if ([v4 isEqualToString:@"dateTime"])
      {
        uint64_t v8 = [(AFBulletin *)self->_assistantBulletin modalAlertContentMessage];
LABEL_25:
        v20 = (void *)v8;
LABEL_30:
        if ([v20 length])
        {
          uint64_t v9 = +[AFSpeakableUtteranceParser parseUserGeneratedMessage:v20];
        }
        else
        {
          uint64_t v9 = 0;
        }

        goto LABEL_34;
      }
      if (![v4 isEqualToString:@"content"])
      {
        if ([v4 isEqualToString:@"subtitle"])
        {
LABEL_11:
          uint64_t v8 = [(AFBulletin *)self->_assistantBulletin subtitle];
          goto LABEL_25;
        }
        if (![v4 isEqualToString:@"message"])
        {
LABEL_29:
          v20 = 0;
          goto LABEL_30;
        }
LABEL_8:
        uint64_t v8 = [(AFBulletin *)self->_assistantBulletin message];
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    v10 = [(AFBulletin *)self->_assistantBulletin sectionID];
    unsigned int v11 = [v10 isEqualToString:@"com.apple.mobilephone"];

    if (v11)
    {
      if ([v4 isEqualToString:@"subject"]) {
        goto LABEL_8;
      }
    }
    else
    {
      objc_super v12 = [(AFBulletin *)self->_assistantBulletin sectionID];
      unsigned int v13 = [v12 isEqualToString:@"com.apple.reminders"];

      if (!v13)
      {
        v14 = [(AFBulletin *)self->_assistantBulletin sectionID];
        unsigned int v15 = [v14 isEqualToString:@"com.apple.mobilemail"];

        unsigned int v16 = [v4 isEqualToString:@"subject"];
        if (v15)
        {
          if (!v16)
          {
            if ([v4 isEqualToString:@"content"]) {
              goto LABEL_11;
            }
            goto LABEL_29;
          }
        }
        else if (!v16 {
               || ([(AFBulletin *)self->_assistantBulletin title],
        }
                   v17 = objc_claimAutoreleasedReturnValue(),
                   [(SANotificationObject *)self->_notification type],
                   v18 = objc_claimAutoreleasedReturnValue(),
                   id v19 = [v17 localizedCaseInsensitiveCompare:v18],
                   v18,
                   v17,
                   !v19))
        {
          if (![v4 isEqualToString:@"content"])
          {
            v21 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
              sub_3268((uint64_t)self, (uint64_t)v4, v21);
            }
            goto LABEL_29;
          }
          goto LABEL_8;
        }
LABEL_24:
        uint64_t v8 = [(AFBulletin *)self->_assistantBulletin title];
        goto LABEL_25;
      }
      if ([v4 isEqualToString:@"subject"]) {
        goto LABEL_29;
      }
    }
    if (![v4 isEqualToString:@"content"]) {
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  uint64_t v9 = 0;
LABEL_34:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantBulletin, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end