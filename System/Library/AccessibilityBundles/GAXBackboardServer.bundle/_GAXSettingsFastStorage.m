@interface _GAXSettingsFastStorage
- (BOOL)isActiveAppSelfLocked;
- (BOOL)selfLockUnmanaged;
- (NSMutableDictionary)settingsStorage;
- (NSString)activeAppID;
- (NSString)savedASAMAppIdForLostMode;
- (_GAXSettingsFastStorage)init;
- (id)_loadSettings;
- (void)_updateSetting:(id)a3 withKey:(id)a4;
- (void)setActiveAppID:(id)a3;
- (void)setActiveAppSelfLocked:(BOOL)a3;
- (void)setSavedASAMAppIdForLostMode:(id)a3;
- (void)setSelfLockUnmanaged:(BOOL)a3;
- (void)setSettingsStorage:(id)a3;
@end

@implementation _GAXSettingsFastStorage

- (_GAXSettingsFastStorage)init
{
  v8.receiver = self;
  v8.super_class = (Class)_GAXSettingsFastStorage;
  v2 = [(_GAXSettingsFastStorage *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(_GAXSettingsFastStorage *)v2 _loadSettings];
    [(_GAXSettingsFastStorage *)v3 setSettingsStorage:v4];

    v5 = [(_GAXSettingsFastStorage *)v3 settingsStorage];

    if (!v5)
    {
      v6 = +[NSMutableDictionary dictionary];
      [(_GAXSettingsFastStorage *)v3 setSettingsStorage:v6];
    }
  }
  return v3;
}

- (NSString)activeAppID
{
  v2 = [(_GAXSettingsFastStorage *)self settingsStorage];
  v3 = [v2 objectForKey:@"ActiveAppID"];

  return (NSString *)v3;
}

- (void)setActiveAppID:(id)a3
{
}

- (NSString)savedASAMAppIdForLostMode
{
  v2 = [(_GAXSettingsFastStorage *)self settingsStorage];
  v3 = [v2 objectForKey:@"GAXSettingsKeySavedASAMAppIdForLostMode"];

  return (NSString *)v3;
}

- (void)setSavedASAMAppIdForLostMode:(id)a3
{
}

- (BOOL)isActiveAppSelfLocked
{
  v2 = [(_GAXSettingsFastStorage *)self settingsStorage];
  v3 = [v2 objectForKey:@"ActiveAppSelfLocked"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setActiveAppSelfLocked:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(_GAXSettingsFastStorage *)self _updateSetting:v4 withKey:@"ActiveAppSelfLocked"];
}

- (BOOL)selfLockUnmanaged
{
  v2 = [(_GAXSettingsFastStorage *)self settingsStorage];
  v3 = [v2 objectForKey:@"SelfLockUnmanaged"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setSelfLockUnmanaged:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(_GAXSettingsFastStorage *)self _updateSetting:v4 withKey:@"SelfLockUnmanaged"];
}

- (id)_loadSettings
{
  v2 = +[NSFileManager defaultManager];
  if ([v2 fileExistsAtPath:@"/var/mobile/Library/Accessibility/GuidedAccessState"])
  {
    id v12 = 0;
    v3 = +[NSData dataWithContentsOfFile:@"/var/mobile/Library/Accessibility/GuidedAccessState" options:0 error:&v12];
    id v4 = v12;
    if (v3)
    {
      id v11 = v4;
      v5 = +[NSJSONSerialization JSONObjectWithData:v3 options:1 error:&v11];
      id v6 = v11;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v7 = [v5 mutableCopy];

          v5 = v7;
        }
        v5 = v5;
        objc_super v8 = v5;
      }
      else
      {
        v9 = GAXLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_2A0AC();
        }

        objc_super v8 = 0;
      }
    }
    else
    {
      v5 = GAXLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_2A040();
      }
      objc_super v8 = 0;
      id v6 = v4;
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (void)_updateSetting:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(_GAXSettingsFastStorage *)self settingsStorage];
  v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKey:v7];
  }
  else {
    [v8 removeObjectForKey:v7];
  }

  v10 = [(_GAXSettingsFastStorage *)self settingsStorage];
  unsigned __int8 v11 = +[NSJSONSerialization isValidJSONObject:v10];

  if (v11)
  {
    id v12 = [(_GAXSettingsFastStorage *)self settingsStorage];
    id v29 = 0;
    v13 = +[NSJSONSerialization dataWithJSONObject:v12 options:1 error:&v29];
    v14 = v29;

    if (!v13)
    {
      v15 = GAXLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_2A118();
      }
      goto LABEL_35;
    }
    v15 = +[NSFileManager defaultManager];
    if ([v15 fileExistsAtPath:@"/var/mobile/Library/Accessibility/GuidedAccessState"] & 1) != 0|| ([v15 fileExistsAtPath:@"/var/mobile/Library/Accessibility"])
    {
      v16 = v14;
    }
    else
    {
      v20 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", NSFileProtectionNone, NSFileProtectionKey, 0);
      v28 = v14;
      [v15 createDirectoryAtPath:@"/var/mobile/Library/Accessibility" withIntermediateDirectories:1 attributes:v20 error:&v28];
      v16 = v28;

      if (v16)
      {
        v19 = GAXLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_2A370();
        }
        goto LABEL_33;
      }
    }
    int v17 = open((const char *)[@"/var/mobile/Library/Accessibility/GuidedAccessState" fileSystemRepresentation], 1793, 384);
    if (v17 < 0)
    {
      v20 = GAXLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_2A184();
      }
      goto LABEL_34;
    }
    int v18 = v17;
    v19 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", NSFileProtectionNone, NSFileProtectionKey, 0);
    id v27 = 0;
    [v15 setAttributes:v19 ofItemAtPath:@"/var/mobile/Library/Accessibility/GuidedAccessState" error:&v27];
    v20 = v27;
    if (v20)
    {
      v21 = GAXLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_2A304();
      }
    }
    id v22 = v13;
    write(v18, [v22 bytes], (size_t)objc_msgSend(v22, "length"));
    fcntl(v18, 51, 0);
    close(v18);
    v23 = opendir((const char *)[@"/var/mobile/Library/Accessibility" fileSystemRepresentation]);
    v24 = v23;
    if (!v23 || dirfd(v23) == -1)
    {
      v26 = GAXLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_2A204();
      }

      if (!v24) {
        goto LABEL_33;
      }
    }
    else if (fcntl(v18, 51, 0) == -1)
    {
      v25 = GAXLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_2A284();
      }
    }
    closedir(v24);
LABEL_33:

LABEL_34:
    v14 = v16;
LABEL_35:

    goto LABEL_36;
  }
  v14 = GAXLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_2A3DC(self);
  }
LABEL_36:
}

- (NSMutableDictionary)settingsStorage
{
  return self->_settingsStorage;
}

- (void)setSettingsStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end