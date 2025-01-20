@interface ADAnnounceNotificationRequest
- (ADAnnounceNotificationRequest)initWithNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7 completion:(id)a8;
- (AFSiriUserNotificationSummary)summary;
- (BOOL)_supportsBargeInForAnnounceNotificationType:(int64_t)a3;
- (BOOL)supportsImmediateBurstMode;
- (NSString)appID;
- (UNNotification)notification;
- (int64_t)_announceNotificationRequestTypeForNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5;
- (int64_t)announcementType;
- (int64_t)summaryDecision;
- (void)setAnnouncementType:(int64_t)a3;
- (void)setAppID:(id)a3;
- (void)setNotification:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryDecision:(int64_t)a3;
@end

@implementation ADAnnounceNotificationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

- (void)setSummaryDecision:(int64_t)a3
{
  self->_summaryDecision = a3;
}

- (int64_t)summaryDecision
{
  return self->_summaryDecision;
}

- (void)setSummary:(id)a3
{
}

- (AFSiriUserNotificationSummary)summary
{
  return self->_summary;
}

- (void)setAnnouncementType:(int64_t)a3
{
  self->_announcementType = a3;
}

- (int64_t)announcementType
{
  return self->_announcementType;
}

- (void)setAppID:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setNotification:(id)a3
{
}

- (UNNotification)notification
{
  return self->_notification;
}

- (BOOL)supportsImmediateBurstMode
{
  if ((id)[(ADAnnouncementRequest *)self platform] == (id)2) {
    return 0;
  }
  v3 = [(ADAnnounceNotificationRequest *)self summary];

  if (v3) {
    return 0;
  }
  if (+[AFFeatureFlags isAnnouncePolicyEnhancementsEnabled])
  {
    unint64_t v5 = [(ADAnnounceNotificationRequest *)self announcementType];
    if (v5 <= 9) {
      return (0x3Au >> v5) & 1;
    }
    else {
      return 1;
    }
  }
  else
  {
    v6 = AFSiriLogContextConnection;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v7)
    {
      int v8 = 136315138;
      v9 = "-[ADAnnounceNotificationRequest supportsImmediateBurstMode]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s isAnnouncePolicyEnhancementsEnabled is disabled, no immediateBurstMode", (uint8_t *)&v8, 0xCu);
      return 0;
    }
  }
  return result;
}

- (BOOL)_supportsBargeInForAnnounceNotificationType:(int64_t)a3
{
  return ((unint64_t)a3 > 9) | (0x17Eu >> a3) & 1;
}

- (int64_t)_announceNotificationRequestTypeForNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 request];
  v11 = [v10 content];

  v12 = [v8 intentIdentifiers];
  int64_t v13 = +[AFSiriAnnouncementRequestCapabilityManager notificationAnnouncementTypeForNotificationFromApp:v9 withIntentIDs:v12 notificationContent:v11 onPlatform:a5];

  if (a5 != 2 && v13 != 3)
  {
    v14 = +[APApplication applicationWithBundleIdentifier:v9];
    unsigned int v15 = [v14 isLocked];

    if (v15)
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2050000000;
      v16 = (void *)qword_100585790;
      uint64_t v30 = qword_100585790;
      if (!qword_100585790)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_10006D0B4;
        v32 = &unk_10050E318;
        v33 = &v27;
        sub_10006D0B4((uint64_t)buf);
        v16 = (void *)v28[3];
      }
      id v17 = v16;
      _Block_object_dispose(&v27, 8);
      v18 = objc_msgSend(v17, "currentNotificationSettingsCenter", v27);
      v19 = [v18 notificationSourceWithIdentifier:v9];
      v20 = [v19 sourceSettings];
      v21 = [v20 notificationSettings];
      id v22 = [v21 showPreviewsSetting];
      v23 = AFSiriLogContextConnection;
      BOOL v24 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
      if (v22 == (id)2)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[ADAnnounceNotificationRequest _announceNotificationRequestTypeForNotification:appID:platform:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Notification from locked app: %@ received, using generic notification announcement", buf, 0x16u);
        }
        int64_t v13 = 3;
      }
      else if (v24)
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[ADAnnounceNotificationRequest _announceNotificationRequestTypeForNotification:appID:platform:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Notification from locked app: %@ received, but show previews is enabled", buf, 0x16u);
      }
    }
    else if (![(NSString *)self->_appID hasPrefix:@"com.apple"] {
           && (sub_1001FD7D8((uint64_t)v9) & 1) == 0)
    }
    {
      v25 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[ADAnnounceNotificationRequest _announceNotificationRequestTypeForNotification:appID:platform:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Siri TCC not enabled for app: %@ using generic notification announcement", buf, 0x16u);
      }
      int64_t v13 = 3;
    }
  }

  return v13;
}

- (ADAnnounceNotificationRequest)initWithNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ADAnnounceNotificationRequest;
  v18 = [(ADAnnouncementRequest *)&v23 initWithAnnouncementRequestType:1 platform:a5 completion:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_notification, a3);
    v20 = (NSString *)[v16 copy];
    appID = v19->_appID;
    v19->_appID = v20;

    v19->_announcementType = [(ADAnnounceNotificationRequest *)v19 _announceNotificationRequestTypeForNotification:v15 appID:v16 platform:a5];
    objc_storeStrong((id *)&v19->_summary, a7);
    v19->_summaryDecision = a6;
    [(ADAnnouncementRequest *)v19 setRequiresOpportuneTime:a5 == 1];
    if (a5 == 1) {
      [(ADAnnouncementRequest *)v19 setRequestSupportsBargeIn:[(ADAnnounceNotificationRequest *)v19 _supportsBargeInForAnnounceNotificationType:v19->_announcementType]];
    }
  }

  return v19;
}

@end