@interface ADCarPlayAnnouncementRequestCapabilityProvider
- (void)_updateForCarPlaySessionConnected:(BOOL)a3;
@end

@implementation ADCarPlayAnnouncementRequestCapabilityProvider

- (void)_updateForCarPlaySessionConnected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ADCarPlayAnnouncementRequestCapabilityProvider;
  -[AFCarPlayAnnouncementRequestCapabilityProvider _updateForCarPlaySessionConnected:](&v8, "_updateForCarPlaySessionConnected:");
  if (v3)
  {
    _AFPreferencesAnnounceNotificationsInCarPlayType();
    switch(_AFPreferencesAnnounceNotificationsInCarPlayType())
    {
      case 0:
      case 1:
      case 4:
        CFStringRef v4 = @"Not resetting announce notifications.";
        break;
      case 2:
        _AFPreferencesSetAnnounceNotificationsInCarPlayTemporarilyDisabled();
        CFStringRef v4 = @"Resetting announce notifications in CarPlay to unmuted.";
        break;
      case 3:
        _AFPreferencesSetAnnounceNotificationsInCarPlayTemporarilyDisabled();
        CFStringRef v4 = @"Resetting announce notifications in CarPlay to muted.";
        break;
      default:
        CFStringRef v4 = 0;
        break;
    }
    v5 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      v7 = AFSiriCarPlayAnnounceEnablementTypeGetName();
      *(_DWORD *)buf = 136315650;
      v10 = "-[ADCarPlayAnnouncementRequestCapabilityProvider _updateForCarPlaySessionConnected:]";
      __int16 v11 = 2112;
      v12 = v7;
      __int16 v13 = 2112;
      CFStringRef v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s New CarPlay connection with setting %@. %@", buf, 0x20u);
    }
  }
}

@end