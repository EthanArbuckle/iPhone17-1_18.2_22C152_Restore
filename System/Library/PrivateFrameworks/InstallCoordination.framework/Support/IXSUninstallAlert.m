@interface IXSUninstallAlert
+ (id)stringForCFOptionFlag:(unint64_t)a3;
- (BOOL)_onMainQueue_deleteButtonActionWithDisposition:(unint64_t *)a3 error:(id *)a4;
- (BOOL)appHasiCloudDataOrDocuments;
- (BOOL)appIsRemovable;
- (BOOL)defaultButtonAppearsDestructive;
- (BOOL)deletionIsRestricted;
- (BOOL)isMDMRestrictedWithOrganizationName:(id *)a3;
- (BOOL)needsArchiveOptionButton;
- (BOOL)needsDemoteOptionButton;
- (IXSUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6;
- (LSApplicationRecord)appRecord;
- (NSString)bundleIdentifier;
- (NSString)cancelButtonLabel;
- (NSString)defaultButtonLabel;
- (NSString)defaultStringsTableName;
- (NSString)message;
- (NSString)optionalButtonForNotRemovableAppActionURL;
- (NSString)optionalButtonForNotRemovableAppLabel;
- (NSString)otherButtonLabel;
- (NSString)title;
- (NSString)typeDescription;
- (__CFBundle)defaultStringsBundle;
- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4;
- (unint64_t)appRemovability;
- (unint64_t)notificationFlags;
- (void)_configureOptionalButtonForConfiguration:(id)a3;
- (void)_onMainQueue_displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4;
- (void)_processUserNotification:(__CFUserNotification *)a3 withConfiguration:(id)a4 response:(unint64_t)a5 completion:(id)a6;
- (void)dealloc;
- (void)displayAlertWithCompletion:(id)a3;
- (void)displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4;
- (void)otherButtonActionWithCompletion:(id)a3;
- (void)setDefaultButtonAppearsDestructive:(BOOL)a3;
- (void)setNeedsArchiveOptionButton:(BOOL)a3;
- (void)setNeedsDemoteOptionButton:(BOOL)a3;
- (void)setTypeDescription:(id)a3;
@end

@implementation IXSUninstallAlert

- (IXSUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IXSUninstallAlert;
  v13 = [(IXSUninstallAlert *)&v23 init];
  v14 = v13;
  if (v13)
  {
    BOOL v15 = !a6;
    if (a5 != 1) {
      BOOL v15 = 0;
    }
    v13->_appIsRemovable = v15;
    v13->_appRemovability = a5;
    v13->_deletionIsRestricted = a6;
    objc_storeStrong((id *)&v13->_appRecord, a3);
    objc_storeStrong((id *)&v14->_bundleIdentifier, a4);
    v16 = +[IXGlobalConfiguration sharedInstance];
    v17 = [v16 frameworkURL];

    v14->_defaultStringsBundle = (__CFBundle *)_CFBundleCreateUnique();
    if (![(IXSUninstallAlert *)v14 defaultStringsBundle])
    {
      v18 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v17 path];
        *(_DWORD *)buf = 136315394;
        v25 = "-[IXSUninstallAlert initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:]";
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Failed to create default strings bundle from path %@", buf, 0x16u);
      }
    }
    defaultStringsTableName = v14->_defaultStringsTableName;
    v14->_defaultStringsTableName = (NSString *)@"IXUninstallAlert";

    typeDescription = v14->_typeDescription;
    v14->_typeDescription = (NSString *)@"Generic";

    *(_WORD *)&v14->_needsArchiveOptionButton = 0;
    v14->_defaultButtonAppearsDestructive = 1;
  }
  return v14;
}

- (NSString)title
{
}

- (NSString)message
{
}

- (NSString)defaultButtonLabel
{
}

- (NSString)cancelButtonLabel
{
}

- (NSString)optionalButtonForNotRemovableAppLabel
{
  return 0;
}

- (NSString)optionalButtonForNotRemovableAppActionURL
{
  return 0;
}

- (NSString)otherButtonLabel
{
  return 0;
}

- (unint64_t)notificationFlags
{
  return 3;
}

- (BOOL)appHasiCloudDataOrDocuments
{
  v3 = [(IXSUninstallAlert *)self appRecord];
  v4 = [v3 entitlements];
  v5 = [v4 objectForKey:@"com.apple.developer.icloud-services" ofClass:objc_opt_class()];

  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          id v12 = v11;
          if (objc_opt_isKindOfClass()) {
            id v13 = v12;
          }
          else {
            id v13 = 0;
          }

          if (v13 && !objc_msgSend(v12, "caseInsensitiveCompare:", @"cloudkit", (void)v19))
          {
            BOOL v17 = 1;
            goto LABEL_20;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  if (qword_100109F28 != -1) {
    dispatch_once(&qword_100109F28, &stru_1000EA3B8);
  }
  v14 = (void (*)(void))off_100109F20;
  if (off_100109F20)
  {
    id v6 = [(IXSUninstallAlert *)self appRecord];
    BOOL v15 = [v6 entitlements];
    v16 = v14();
    BOOL v17 = [v16 count] != 0;

LABEL_20:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_onMainQueue_deleteButtonActionWithDisposition:(unint64_t *)a3 error:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(IXSUninstallAlert *)self appIsRemovable])
  {
    id v7 = 0;
    BOOL v8 = 1;
    unint64_t v9 = 3;
  }
  else if ([(IXSUninstallAlert *)self needsArchiveOptionButton])
  {
    id v7 = 0;
    BOOL v8 = 1;
    unint64_t v9 = 2;
  }
  else
  {
    v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000924A4(self, v10);
    }

    id v11 = [(IXSUninstallAlert *)self bundleIdentifier];
    sub_10003DAE4((uint64_t)"-[IXSUninstallAlert _onMainQueue_deleteButtonActionWithDisposition:error:]", 358, @"IXErrorDomain", 0x16uLL, 0, 0, @"App with bundle ID %@ cannot be uninstalled", v12, (uint64_t)v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v7 = v7;
      unint64_t v9 = 0;
      BOOL v8 = 0;
      *a4 = v7;
    }
    else
    {
      unint64_t v9 = 0;
      BOOL v8 = 0;
    }
  }
  *a3 = v9;

  return v8;
}

- (void)_processUserNotification:(__CFUserNotification *)a3 withConfiguration:(id)a4 response:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, void *))a6;
  uint64_t v12 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = +[IXSUninstallAlert stringForCFOptionFlag:a5];
    *(_DWORD *)buf = 136315650;
    v41 = "-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]";
    __int16 v42 = 2048;
    unint64_t v43 = a5;
    __int16 v44 = 2112;
    v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: User selected response: %lx - %@", buf, 0x20u);
  }
  if ((a5 & 3) >= 2)
  {
    if ((a5 & 3) == 3)
    {
      id v18 = 0;
      id v19 = 0;
      BOOL v17 = 0;
      uint64_t v20 = 4;
      goto LABEL_11;
    }
    long long v21 = CFUserNotificationGetResponseDictionary(a3);
    objc_opt_class();
    id v18 = v21;
    if (objc_opt_isKindOfClass()) {
      id v22 = v18;
    }
    else {
      id v22 = 0;
    }

    if (v22)
    {
      uint64_t v23 = SBSUserNotificationButtonDefinitionResponseIndexKey;
      v24 = [v18 objectForKeyedSubscript:SBSUserNotificationButtonDefinitionResponseIndexKey];
      objc_opt_class();
      id v19 = v24;
      if (objc_opt_isKindOfClass()) {
        id v25 = v19;
      }
      else {
        id v25 = 0;
      }

      if (v25)
      {
        id v28 = [v19 unsignedIntegerValue];
        if (v28 < [v10 numButtons])
        {
          v29 = [v10 actionForButtonAtIndex:v28];
          ((void (**)(void, void (**)(id, uint64_t, void *)))v29)[2](v29, v11);

          BOOL v17 = 0;
          goto LABEL_12;
        }
        v32 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v36 = [(IXSUninstallAlert *)self typeDescription];
          v37 = [(IXSUninstallAlert *)self bundleIdentifier];
          id v38 = [v10 numButtons];
          *(_DWORD *)buf = 136316418;
          v41 = "-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]";
          __int16 v42 = 2112;
          unint64_t v43 = (unint64_t)v36;
          __int16 v44 = 2112;
          v45 = v37;
          __int16 v46 = 2048;
          id v47 = v28;
          __int16 v48 = 2048;
          id v49 = v38;
          __int16 v50 = 2112;
          uint64_t v51 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s: Received an invalid response (kCFUserNotificationOtherResponse) from the %@ uninstall alert for app with bundleID %@, Index: %lu, numButtons: %lu : %@", buf, 0x3Eu);
        }
        v33 = [(IXSUninstallAlert *)self typeDescription];
        v34 = [(IXSUninstallAlert *)self bundleIdentifier];
        [v10 numButtons];
        BOOL v17 = sub_10003DAE4((uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]", 411, @"IXErrorDomain", 1uLL, 0, 0, @"Received an invalid response (kCFUserNotificationOtherResponse) from the %@ uninstall alert for app with bundleID %@, Index: %lu, numButtons: %lu", v35, (uint64_t)v33);
      }
      else
      {
        v30 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1000925C4();
        }

        BOOL v17 = sub_10003DAE4((uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]", 402, @"IXErrorDomain", 1uLL, 0, 0, @"Invalid response received for %@ key: %@", v31, v23);
      }
      goto LABEL_8;
    }
    __int16 v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100092544();
    }

    BOOL v17 = sub_10003DAE4((uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]", 396, @"IXErrorDomain", 1uLL, 0, 0, @"Invalid response received from CFUserNotification: %@", v27, (uint64_t)v18);
  }
  else
  {
    v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100092650(self, a5, v14);
    }

    BOOL v15 = [(IXSUninstallAlert *)self typeDescription];
    v39 = [(IXSUninstallAlert *)self bundleIdentifier];
    BOOL v17 = sub_10003DAE4((uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]", 417, @"IXErrorDomain", 1uLL, 0, 0, @"Received unknown response %lx from the %@ uninstall alert for app with bundleID %@", v16, a5);

    id v18 = 0;
  }
  id v19 = 0;
LABEL_8:
  uint64_t v20 = 0;
LABEL_11:
  v11[2](v11, v20, v17);
LABEL_12:
}

- (void)_onMainQueue_displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4
{
  id v6 = (void (**)(id, void, void *))a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  SInt32 error = 0;
  CFOptionFlags responseFlags = 0;
  CFOptionFlags v8 = [(IXSUninstallAlert *)self notificationFlags];
  CFDictionaryRef v9 = [v7 alertParameters];
  id v10 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v8, &error, v9);

  id v11 = sub_100004B28((uint64_t)off_100109BB8);
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 136315394;
      __int16 v26 = "-[IXSUninstallAlert _onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:]";
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Showing user alert of type:%@", buf, 0x16u);
    }
    if (CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags))
    {
      BOOL v15 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10009281C(self);
      }

      uint64_t v16 = [(IXSUninstallAlert *)self typeDescription];
      long long v21 = [(IXSUninstallAlert *)self bundleIdentifier];
      id v18 = sub_10003DAE4((uint64_t)"-[IXSUninstallAlert _onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:]", 489, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to recieve notification response for %@ uninstall alert for app with bundle ID %@, Response: %d", v17, (uint64_t)v16);

      v6[2](v6, 0, v18);
    }
    else
    {
      [(IXSUninstallAlert *)self _processUserNotification:v10 withConfiguration:v7 response:responseFlags completion:v6];
      id v18 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009273C(self);
    }

    id v19 = [(IXSUninstallAlert *)self typeDescription];
    id v22 = [(IXSUninstallAlert *)self bundleIdentifier];
    id v18 = sub_10003DAE4((uint64_t)"-[IXSUninstallAlert _onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:]", 479, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create %@ uninstall alert for app with bundle ID %@, error code %d", v20, (uint64_t)v19);

    v6[2](v6, 0, v18);
  }
}

- (void)displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000429A4;
  v9[3] = &unk_1000EA3E0;
  id v10 = a4;
  id v11 = v6;
  v9[4] = self;
  id v7 = v10;
  id v8 = v6;
  sub_100066F24(&_dispatch_main_q, v9);
}

- (void)_configureOptionalButtonForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IXSUninstallAlert *)self optionalButtonForNotRemovableAppLabel];
  uint64_t v6 = [(IXSUninstallAlert *)self optionalButtonForNotRemovableAppActionURL];
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    id v8 = [[IXSUninstallButtonConfiguration alloc] initWithTitle:v5 buttonType:2];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100042B88;
    v11[3] = &unk_1000EA408;
    id v12 = v7;
    [v4 addButtonDefinition:v8 forAction:v11];

LABEL_7:
    goto LABEL_8;
  }
  if (v5 | v6)
  {
    sub_100004B28((uint64_t)off_100109BB8);
    id v8 = (IXSUninstallButtonConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_FAULT))
    {
      CFDictionaryRef v9 = [(IXSUninstallAlert *)self appRecord];
      id v10 = [v9 bundleIdentifier];
      *(_DWORD *)buf = 136315906;
      v14 = "-[IXSUninstallAlert _configureOptionalButtonForConfiguration:]";
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_fault_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_FAULT, "%s: Required app label (%@) and action URL (%@) both to be non-nil for %@, but one was nil", buf, 0x2Au);
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)displayAlertWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [IXSUninstallAlertConfiguration alloc];
  uint64_t v6 = [(IXSUninstallAlert *)self title];
  id v7 = [(IXSUninstallAlert *)self message];
  id v8 = [(IXSUninstallAlertConfiguration *)v5 initWithTitle:v6 message:v7];

  CFDictionaryRef v9 = [(IXSUninstallAlert *)self appRecord];
  LODWORD(v7) = [v9 isDeletable];

  id v10 = [IXSUninstallButtonConfiguration alloc];
  if (v7)
  {
    id v11 = [(IXSUninstallAlert *)self defaultButtonLabel];
    id v12 = [(IXSUninstallButtonConfiguration *)v10 initWithTitle:v11 buttonType:0];

    if ([(IXSUninstallAlert *)self defaultButtonAppearsDestructive]) {
      [(IXSUninstallButtonConfiguration *)v12 setPresentationStyle:1];
    }
    id v13 = [(IXSUninstallAlert *)self otherButtonLabel];

    if (v13)
    {
      v14 = [IXSUninstallButtonConfiguration alloc];
      __int16 v15 = [(IXSUninstallAlert *)self otherButtonLabel];
      id v13 = [(IXSUninstallButtonConfiguration *)v14 initWithTitle:v15 buttonType:1];
    }
    uint64_t v16 = [(IXSUninstallAlert *)self cancelButtonLabel];
    if (v16)
    {
      __int16 v17 = [[IXSUninstallButtonConfiguration alloc] initWithTitle:v16 buttonType:2];
      id v18 = v17;
      if (v13 && v17)
      {
        if ((![(IXSUninstallAlert *)self needsDemoteOptionButton]
           || ![(IXSUninstallAlert *)self appIsRemovable])
          && [(IXSUninstallAlert *)self needsDemoteOptionButton])
        {
          if (![(IXSUninstallAlert *)self appIsRemovable]
            && [(IXSUninstallAlert *)self needsDemoteOptionButton])
          {
            [(IXSUninstallAlert *)self _configureOptionalButtonForConfiguration:v8];
          }
          goto LABEL_32;
        }
        if ([(IXSUninstallAlert *)self needsDemoteOptionButton])
        {
          if ((id)[(IXSUninstallAlert *)self appRemovability] != (id)3
            && ![(IXSUninstallAlert *)self deletionIsRestricted])
          {
            [(IXSUninstallAlertConfiguration *)v8 addButtonDefinition:v12 forAction:&stru_1000EA428];
          }
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1000430B8;
          v30[3] = &unk_1000EA408;
          v30[4] = self;
          __int16 v26 = (Block_layout *)v30;
          __int16 v27 = v8;
          id v28 = v13;
        }
        else
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000430C4;
          v29[3] = &unk_1000EA408;
          v29[4] = self;
          [(IXSUninstallAlertConfiguration *)v8 addButtonDefinition:v13 forAction:v29];
          if ((id)[(IXSUninstallAlert *)self appRemovability] == (id)3
            || [(IXSUninstallAlert *)self deletionIsRestricted])
          {
            goto LABEL_32;
          }
          __int16 v26 = &stru_1000EA448;
          __int16 v27 = v8;
          id v28 = v12;
        }
        [(IXSUninstallAlertConfiguration *)v27 addButtonDefinition:v28 forAction:v26];
LABEL_32:
        uint64_t v23 = &stru_1000EA468;
        v24 = v8;
        id v25 = v18;
        goto LABEL_33;
      }
      if (v17)
      {
        [(IXSUninstallAlertConfiguration *)v8 addButtonDefinition:v17 forAction:&stru_1000EA488];
        if (![(IXSUninstallAlert *)self appIsRemovable])
        {
          [(IXSUninstallAlert *)self _configureOptionalButtonForConfiguration:v8];
LABEL_34:

          goto LABEL_35;
        }
        uint64_t v23 = &stru_1000EA4A8;
        v24 = v8;
        id v25 = v12;
LABEL_33:
        [(IXSUninstallAlertConfiguration *)v24 addButtonDefinition:v25 forAction:v23];
        goto LABEL_34;
      }
    }
    [(IXSUninstallAlertConfiguration *)v8 addButtonDefinition:v12 forAction:&stru_1000EA4C8];
LABEL_35:

    goto LABEL_36;
  }
  __int16 v19 = [(IXSUninstallAlert *)self cancelButtonLabel];
  id v12 = [(IXSUninstallButtonConfiguration *)v10 initWithTitle:v19 buttonType:0];

  if ([(IXSUninstallAlert *)self needsArchiveOptionButton])
  {
    uint64_t v20 = [IXSUninstallButtonConfiguration alloc];
    long long v21 = [(IXSUninstallAlert *)self otherButtonLabel];
    id v22 = [(IXSUninstallButtonConfiguration *)v20 initWithTitle:v21 buttonType:1];

    [(IXSUninstallAlertConfiguration *)v8 addButtonDefinition:v22 forAction:&stru_1000EA4E8];
  }
  [(IXSUninstallAlertConfiguration *)v8 addButtonDefinition:v12 forAction:&stru_1000EA508];
LABEL_36:

  [(IXSUninstallAlert *)self displayAlertWithCompletion:v4 uninstallAlertConfiguration:v8];
}

- (void)otherButtonActionWithCompletion:(id)a3
{
  id v3 = a3;
  abort();
}

- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  id v8 = v7;
  if ([(IXSUninstallAlert *)self defaultStringsBundle])
  {
    CFDictionaryRef v9 = [(IXSUninstallAlert *)self defaultStringsBundle];
    id v10 = [(IXSUninstallAlert *)self defaultStringsTableName];
    id v8 = (__CFString *)CFBundleCopyLocalizedString(v9, v6, 0, v10);
  }
  if (v8 == v6)
  {
    id v8 = v7;
  }

  return v8;
}

- (BOOL)isMDMRestrictedWithOrganizationName:(id *)a3
{
  uint64_t v5 = +[MCProfileConnection sharedConnection];
  uint64_t v6 = [(IXSUninstallAlert *)self appRecord];
  id v7 = [v6 bundleIdentifier];
  unsigned int v8 = [v5 isRemovalRestrictedByPolicyForApp:v7];

  if (v8)
  {
    CFDictionaryRef v9 = [v5 managingOrganizationInformation];
    id v10 = [v9 objectForKeyedSubscript:kMCCCOrganizationNameKey];
    objc_opt_class();
    id v11 = v10;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (a3 && v12) {
      *a3 = v12;
    }
  }
  return v8;
}

- (void)dealloc
{
  defaultStringsBundle = self->_defaultStringsBundle;
  if (defaultStringsBundle) {
    CFRelease(defaultStringsBundle);
  }
  self->_defaultStringsBundle = 0;
  v4.receiver = self;
  v4.super_class = (Class)IXSUninstallAlert;
  [(IXSUninstallAlert *)&v4 dealloc];
}

+ (id)stringForCFOptionFlag:(unint64_t)a3
{
  return off_1000EA528[a3 & 3];
}

- (LSApplicationRecord)appRecord
{
  return self->_appRecord;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)appIsRemovable
{
  return self->_appIsRemovable;
}

- (unint64_t)appRemovability
{
  return self->_appRemovability;
}

- (BOOL)deletionIsRestricted
{
  return self->_deletionIsRestricted;
}

- (BOOL)needsArchiveOptionButton
{
  return self->_needsArchiveOptionButton;
}

- (void)setNeedsArchiveOptionButton:(BOOL)a3
{
  self->_needsArchiveOptionButton = a3;
}

- (BOOL)needsDemoteOptionButton
{
  return self->_needsDemoteOptionButton;
}

- (void)setNeedsDemoteOptionButton:(BOOL)a3
{
  self->_needsDemoteOptionButton = a3;
}

- (__CFBundle)defaultStringsBundle
{
  return self->_defaultStringsBundle;
}

- (NSString)defaultStringsTableName
{
  return self->_defaultStringsTableName;
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
}

- (BOOL)defaultButtonAppearsDestructive
{
  return self->_defaultButtonAppearsDestructive;
}

- (void)setDefaultButtonAppearsDestructive:(BOOL)a3
{
  self->_defaultButtonAppearsDestructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDescription, 0);
  objc_storeStrong((id *)&self->_defaultStringsTableName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_appRecord, 0);
}

@end