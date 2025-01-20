@interface KeyStoreNotificationHandler
- (KeyStoreNotificationHandler)init;
- (int)buddyLaunchType:(id)a3;
- (int)handleKeystoreNotification:(id)a3;
@end

@implementation KeyStoreNotificationHandler

- (KeyStoreNotificationHandler)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN AGENT - init", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)KeyStoreNotificationHandler;
  return [(KeyStoreNotificationHandler *)&v4 init];
}

- (int)handleKeystoreNotification:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = +[CloudSettingsManager sharedCloudSettingsManager];
    unsigned int v6 = [(KeyStoreNotificationHandler *)self buddyLaunchType:v4];
    if (!v6)
    {
      id v9 = v4;
      v10 = v9;
      if (v9)
      {
        v11 = v9;
        if ([v9 hasPrefix:@"com.apple.kvs.store-did-change."])
        {
          v11 = [v10 stringByReplacingOccurrencesOfString:@"com.apple.kvs.store-did-change." withString:&stru_100004168];
        }
      }
      else
      {
        v11 = 0;
      }
      unsigned int v14 = [v5 isServiceKnownForStore:v11] ^ 1;
      unsigned int v15 = [v5 isEnabledForStore:v11] ^ 1;
      if (v14 & 1) != 0 || (v15)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v18 = v10;
          __int16 v19 = 1024;
          unsigned int v20 = v14;
          __int16 v21 = 1024;
          unsigned int v22 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ERROR: notification name: %@ is not recognized: %d, or is disabled: %d", buf, 0x18u);
        }
      }
      else
      {
        [v5 applyCloudSettingsToDevice:0 forStore:v11];
      }

      goto LABEL_26;
    }
    unsigned int v7 = v6;
    if (v6 == 2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sync agent launched for minibuddy - update install", buf, 2u);
      }
      uint64_t v8 = 0;
    }
    else
    {
      if (v6 != 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v18 = [v4 UTF8String];
          __int16 v19 = 1024;
          unsigned int v20 = v7;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ERROR: notification: %s, unknown buddy launch type: %d", buf, 0x12u);
        }
        goto LABEL_26;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sync agent launched for BUDDY - new machine / clean install", buf, 2u);
      }
      uint64_t v8 = 1;
    }
    v12 = +[NSNumber numberWithBool:v8];
    v13 = +[NSDictionary dictionaryWithObjectsAndKeys:v12, @"newDevice", 0];
    [v5 performFirstTimeSetup:v13];

LABEL_26:
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sync agent launced, but feature is disabled, do nothing", buf, 2u);
  }
LABEL_27:

  return 0;
}

- (int)buddyLaunchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.fakebuddy.launchnew"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.fakebuddy.launchupdate"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end