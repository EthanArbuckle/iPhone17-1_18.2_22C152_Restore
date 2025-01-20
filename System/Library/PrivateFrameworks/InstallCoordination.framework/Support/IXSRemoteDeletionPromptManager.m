@interface IXSRemoteDeletionPromptManager
+ (id)sharedInstance;
- (BOOL)iCloudIsEnabledForMessages;
- (BOOL)isValidBundleIDForRemoteAlert:(id)a3 withAppType:(unint64_t *)a4 numAppsInstalled:(unint64_t *)a5;
- (IXSRemoteDeletionPromptConnection)connection;
- (IXSRemoteDeletionPromptManager)init;
- (id)_constructRelevantAppData:(id)a3 showArchiveOption:(BOOL)a4;
- (unint64_t)sharedMediaInMessagesCount;
- (void)dismissRemoteAlert;
- (void)displayDeletionAlertForRecord:(id)a3 showArchiveOption:(BOOL)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
@end

@implementation IXSRemoteDeletionPromptManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067118;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109F88 != -1) {
    dispatch_once(&qword_100109F88, block);
  }
  v2 = (void *)qword_100109F80;

  return v2;
}

- (IXSRemoteDeletionPromptManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IXSRemoteDeletionPromptManager;
  v2 = [(IXSRemoteDeletionPromptManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;
  }
  return v3;
}

- (void)dismissRemoteAlert
{
  v2 = [(IXSRemoteDeletionPromptManager *)self connection];
  v3 = v2;
  if (v2)
  {
    [v2 dismissAlert];
  }
  else
  {
    v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10009632C(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (BOOL)iCloudIsEnabledForMessages
{
  if (qword_100109F90)
  {
    v2 = [(id)qword_100109F90 sharedInstance];
    unsigned int v3 = [v2 isEnabled];

    v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        int v5 = 89;
      }
      else {
        int v5 = 78;
      }
      int v14 = 136315394;
      v15 = "-[IXSRemoteDeletionPromptManager iCloudIsEnabledForMessages]";
      __int16 v16 = 1024;
      int v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: IMCloudKitHooks returned %c for iCloud state", (uint8_t *)&v14, 0x12u);
    }
  }
  else
  {
    v4 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000963A4(v4, v6, v7, v8, v9, v10, v11, v12);
    }
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (unint64_t)sharedMediaInMessagesCount
{
  if (qword_100109FA0) {
    BOOL v2 = qword_100109F98 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    uint64_t v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009641C(v10, v3, v4, v5, v6, v7, v8, v9);
    }
    id v13 = 0;
  }
  else
  {
    uint64_t v10 = [(id)qword_100109FA0 sharedPhotoLibrary];
    uint64_t v11 = [v10 librarySpecificFetchOptions];
    [v11 setIncludeGuestAssets:1];
    uint64_t v12 = [(id)qword_100109F98 fetchGuestAssetsWithOptions:v11];
    id v13 = [v12 count];
    int v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[IXSRemoteDeletionPromptManager sharedMediaInMessagesCount]";
      __int16 v19 = 2048;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: PHPhotoLibrary and PHAsset returned %lu for shared media count", (uint8_t *)&v17, 0x16u);
    }
  }
  return (unint64_t)v13;
}

- (BOOL)isValidBundleIDForRemoteAlert:(id)a3 withAppType:(unint64_t *)a4 numAppsInstalled:(unint64_t *)a5
{
  id v7 = a3;
  id v35 = 0;
  BOOL v8 = sub_100038F14(v7, 17, &v35);
  id v9 = v35;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_APP_TYPE_KEY"];
    objc_opt_class();
    id v12 = v11;
    id v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;

    if (v13)
    {
      uint64_t v14 = (uint64_t)[v13 unsignedIntegerValue];
      char v15 = sub_1000678C8(v14);
      __int16 v16 = [v10 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_NUM_INSTALLED_APPS_KEY"];
      objc_opt_class();
      id v17 = v16;
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }

      if (v18) {
        id v20 = [v18 unsignedIntegerValue];
      }
      else {
        id v20 = 0;
      }

LABEL_30:
      id v23 = 0;
      v22 = 0;
      if (!a4) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  __int16 v19 = [&off_1000F4D70 objectForKey:v7];
  if (!v19)
  {
    v21 = +[LSApplicationWorkspace defaultWorkspace];
    id v34 = 0;
    v22 = [v21 getPreferredAppMarketplacesWithError:&v34];
    id v23 = v34;

    if (v22)
    {
      if ([v22 count] && objc_msgSend(v22, "containsObject:", v7))
      {
        uint64_t v24 = sub_100067918(v7);
        if (v24) {
          uint64_t v14 = 4;
        }
        else {
          uint64_t v14 = 0;
        }
        id v13 = 0;
        if (v24) {
          id v20 = (id)v24;
        }
        else {
          id v20 = 0;
        }
        char v15 = v24 != 0;
        if (!a4) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      uint64_t v14 = 0;
    }
    else
    {
      v26 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100096494(v26, v27, v28, v29, v30, v31, v32, v33);
      }

      uint64_t v14 = 0;
      v22 = 0;
    }
    id v13 = 0;
    id v20 = 0;
    char v15 = 0;
    if (!a4) {
      goto LABEL_32;
    }
LABEL_31:
    *a4 = v14;
    goto LABEL_32;
  }
  id v13 = v19;
  uint64_t v14 = (uint64_t)[v19 unsignedIntegerValue];
  char v15 = sub_1000678C8(v14);
  if (v14 == 2)
  {
    id v20 = (id)sub_100067918(v7);
    goto LABEL_30;
  }
  id v23 = 0;
  v22 = 0;
  id v20 = 0;
  if (a4) {
    goto LABEL_31;
  }
LABEL_32:
  if (a5) {
    *a5 = (unint64_t)v20;
  }

  return v15;
}

- (id)_constructRelevantAppData:(id)a3 showArchiveOption:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  if ([(IXSRemoteDeletionPromptManager *)self isValidBundleIDForRemoteAlert:v6 withAppType:&v56 numAppsInstalled:&v55]&& v56)
  {
    id v7 = objc_opt_new();
    BOOL v8 = +[NSNumber numberWithUnsignedInteger:v56];
    [v7 setObject:v8 forKeyedSubscript:@"SADAppType"];

    id v9 = +[NSNumber numberWithBool:v4];
    [v7 setObject:v9 forKeyedSubscript:@"ShowArchiveOption"];

    id v54 = 0;
    BOOL v10 = sub_100038F14(v6, 17, &v54);
    id v11 = v54;
    id v12 = v11;
    if (v11) {
      BOOL v13 = v10;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      uint64_t v14 = [v11 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_KILL_FOR_TESTING_KEY"];
      objc_opt_class();
      id v15 = v14;
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }

      if (v16) {
        [v7 setObject:v16 forKeyedSubscript:@"TestCrash"];
      }
    }
    switch(v56)
    {
      case 1:
        if (v13
          && (([v12 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_ICLOUD_ON_KEY"],
               id v20 = objc_claimAutoreleasedReturnValue(),
               objc_opt_class(),
               id v21 = v20,
               (objc_opt_isKindOfClass() & 1) == 0)
            ? (v22 = 0)
            : (v22 = v21),
              v21,
              v21,
              v22))
        {
          id v26 = [v22 BOOLValue];
        }
        else if (qword_100109FA0)
        {
          uint64_t v27 = [(id)qword_100109FA0 sharedPhotoLibrary];
          id v26 = [v27 isCloudPhotoLibraryEnabled];

          v22 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            if (v26) {
              int v28 = 89;
            }
            else {
              int v28 = 78;
            }
            *(_DWORD *)buf = 136315394;
            v58 = "_iCloudIsEnabledForPhotos";
            __int16 v59 = 1024;
            int v60 = v28;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: PHPhotoLibrary returned %c for iCloud state", buf, 0x12u);
          }
        }
        else
        {
          v22 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10009650C(v22, v29, v30, v31, v32, v33, v34, v35);
          }
          id v26 = 0;
        }

        id v18 = +[NSNumber numberWithBool:v26];
        CFStringRef v19 = @"IsICloudOn";
        goto LABEL_66;
      case 2:
      case 4:
        id v18 = +[NSNumber numberWithUnsignedInteger:v55];
        CFStringRef v19 = @"NumInstalledApps";
        goto LABEL_66;
      case 3:
        if (v13
          && (([v12 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_ICLOUD_ON_KEY"],
               id v23 = objc_claimAutoreleasedReturnValue(),
               objc_opt_class(),
               id v24 = v23,
               (objc_opt_isKindOfClass() & 1) == 0)
            ? (id v25 = 0)
            : (id v25 = v24),
              v24,
              v24,
              v25))
        {
          id v36 = [v25 BOOLValue];
        }
        else
        {
          id v36 = (id)[(IXSRemoteDeletionPromptManager *)self iCloudIsEnabledForMessages];
        }
        v37 = +[NSNumber numberWithBool:v36];
        [v7 setObject:v37 forKeyedSubscript:@"IsICloudOn"];

        if (v13
          && (([v12 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_NUM_MEDIA_SHARED_KEY"], v38 = objc_claimAutoreleasedReturnValue(), objc_opt_class(), id v39 = v38, (objc_opt_isKindOfClass() & 1) == 0)? (v40 = 0): (v40 = v39), v39, v39, v40))
        {
          id v41 = [v40 unsignedIntegerValue];
        }
        else
        {
          id v41 = [(IXSRemoteDeletionPromptManager *)self sharedMediaInMessagesCount];
        }
        v42 = +[NSNumber numberWithUnsignedInteger:v41];
        [v7 setObject:v42 forKeyedSubscript:@"SharedMedia"];

        if (v13
          && (([v12 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_WATCH_PAIRED_KEY"],
               v43 = objc_claimAutoreleasedReturnValue(),
               objc_opt_class(),
               id v44 = v43,
               (objc_opt_isKindOfClass() & 1) == 0)
            ? (v45 = 0)
            : (v45 = v44),
              v44,
              v44,
              v45))
        {
          unint64_t v46 = (unint64_t)[v45 BOOLValue];
        }
        else
        {
          v47 = +[NRPairedDeviceRegistry sharedInstance];
          v48 = [v47 getActivePairedDevice];
          unint64_t v46 = v48 != 0;

          v45 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            if (v48) {
              int v49 = 89;
            }
            else {
              int v49 = 78;
            }
            *(_DWORD *)buf = 136315394;
            v58 = "_watchIsPaired";
            __int16 v59 = 1024;
            int v60 = v49;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s: NRPairedDeviceRegistry returned %c for watch paired state", buf, 0x12u);
          }
        }

        v50 = +[NSNumber numberWithBool:v46];
        [v7 setObject:v50 forKeyedSubscript:@"WatchIsPaired"];

        if (!v13) {
          goto LABEL_67;
        }
        v51 = [v12 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_SOS_AVAILABLE_KEY"];
        objc_opt_class();
        id v52 = v51;
        id v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v52 : 0;

        if (!v18) {
          goto LABEL_67;
        }
        CFStringRef v19 = @"TestSOSAvailable";
LABEL_66:
        [v7 setObject:v18 forKeyedSubscript:v19];

LABEL_67:
        id v17 = [v7 copy];
LABEL_68:

        break;
      default:
        id v17 = 0;
        goto LABEL_68;
    }
  }
  else
  {
    id v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100096584((uint64_t)v6, v7);
    }
    id v17 = 0;
  }

  return v17;
}

- (void)displayDeletionAlertForRecord:(id)a3 showArchiveOption:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [v8 bundleIdentifier];
  id v11 = [(IXSRemoteDeletionPromptManager *)self _constructRelevantAppData:v10 showArchiveOption:v6];
  if (v11)
  {
    id v12 = +[RBSProcessIdentity identityForApplicationJobLabel:@"com.apple.AppDeletionUIHost"];
    id v13 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithSceneProvidingProcess:v12 configurationIdentifier:@"AppDeletionUI"];
    id v14 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    v27[0] = v10;
    v26[0] = kCFBundleIdentifierKey;
    v26[1] = kCFBundleNameKey;
    id v15 = [v8 localizedName];
    v26[2] = @"RelevantAppData";
    v27[1] = v15;
    v27[2] = v11;
    id v16 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

    [v14 setUserInfo:v16];
    id v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v21 = 136315650;
      *(void *)&v21[4] = "-[IXSRemoteDeletionPromptManager displayDeletionAlertForRecord:showArchiveOption:completion:]";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Showing deletion sheet for %@ with data %@", v21, 0x20u);
    }

    id v18 = objc_alloc_init(IXSRemoteDeletionPromptConnection);
    [(IXSRemoteDeletionPromptConnection *)v18 startConnectionWithConfig:v14 alertDefinition:v13 completion:v9];

    [(IXSRemoteDeletionPromptManager *)self setConnection:v18];
    id v9 = v13;
  }
  else
  {
    CFStringRef v19 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100096610(v19);
    }

    id v12 = sub_10003DAE4((uint64_t)"-[IXSRemoteDeletionPromptManager displayDeletionAlertForRecord:showArchiveOption:completion:]", 363, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to construct alert relevant data", v20, *(uint64_t *)v21);
    (*((void (**)(id, uint64_t, void *))v9 + 2))(v9, 5, v12);
  }
}

- (IXSRemoteDeletionPromptConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end