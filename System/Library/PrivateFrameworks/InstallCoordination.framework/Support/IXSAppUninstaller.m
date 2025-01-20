@interface IXSAppUninstaller
+ (id)sharedUninstaller;
- (BOOL)_screenTimeManagementEnabled;
- (BOOL)_webContentFilterEnabled;
- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4;
- (id)_dextIDsForBundleID:(id)a3;
- (unint64_t)_contentRestrictionIsEnabledForBundleID:(id)a3;
- (void)_displayAuthenticationErrorForApp:(id)a3;
- (void)_finalDeletionPromptWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8;
- (void)_performUninstallOfAppWithIdentity:(id)a3 clientName:(id)a4 withFlags:(unint64_t)a5 record:(id)a6 completion:(id)a7;
- (void)_postUninstallAlertsWithIdentity:(id)a3 flags:(unint64_t)a4 record:(id)a5;
- (void)_promptForDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8;
- (void)_promptForGatingDefaultAppDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8;
- (void)_promptForMoveOrDeleteAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8;
- (void)_promptForRelatedDataAndUninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7;
- (void)_promptForUnlockOfAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8;
- (void)_promptToOverrideManagedSettingsOfAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7;
- (void)_promptViewHealthKitDataWithIdentity:(id)a3 record:(id)a4;
- (void)_uninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8;
- (void)uninstallAppWithIdentity:(id)a3 clientName:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)uninstallParallelPlaceholderForIdentity:(id)a3 reason:(id)a4;
@end

@implementation IXSAppUninstaller

+ (id)sharedUninstaller
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017748;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109E18 != -1) {
    dispatch_once(&qword_100109E18, block);
  }
  v2 = (void *)qword_100109E10;

  return v2;
}

- (void)uninstallParallelPlaceholderForIdentity:(id)a3 reason:(id)a4
{
  id v5 = a3;
  uint64_t v17 = kMIUninstallParallelPlaceholderKey;
  v18 = &__kCFBooleanTrue;
  id v6 = a4;
  v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  char v8 = sub_1000136C0(v5, v7, v6);

  id v9 = 0;
  if ((v8 & 1) == 0)
  {
    v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[IXSAppUninstaller uninstallParallelPlaceholderForIdentity:reason:]";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to uninstall parallel placeholder %@: %@", buf, 0x20u);
    }
  }
}

- (void)_promptViewHealthKitDataWithIdentity:(id)a3 record:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [IXSHealthKitDataUninstallAlert alloc];
  char v8 = [v5 bundleID];
  id v9 = [(IXSHealthKitDataUninstallAlert *)v7 initWithAppRecord:v6 bundleIdentifier:v8];

  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100017A88;
    v11[3] = &unk_1000E93B8;
    v12 = v9;
    id v13 = v5;
    [v12 displayAlertWithCompletion:v11];

    v10 = v12;
  }
  else
  {
    v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[IXSAppUninstaller _promptViewHealthKitDataWithIdentity:record:]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to create HealthKit data uninstall alert for app with identity %@", buf, 0x16u);
    }
  }
}

- (void)_postUninstallAlertsWithIdentity:(id)a3 flags:(unint64_t)a4 record:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((v6 & 8) != 0)
  {
    v10 = [v8 bundleID];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100017D40;
    v11[3] = &unk_1000E93E0;
    void v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    +[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:v10 completion:v11];
  }
}

- (id)_dextIDsForBundleID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v36 = 0;
  v28 = v3;
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v36];
  id v6 = v36;
  if (v5)
  {
    v27 = v4;
    id v26 = v5;
    [v5 driverExtensionPaths];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (!v7) {
      goto LABEL_25;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        v11 = v6;
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        char v31 = 0;
        id v13 = +[NSURL fileURLWithPath:v12 isDirectory:1];
        id v14 = +[IXFileManager defaultManager];
        id v30 = v6;
        unsigned __int8 v15 = [v14 itemExistsAtURL:v13 isDirectory:&v31 error:&v30];
        id v6 = v30;

        if ((v15 & 1) == 0)
        {
          v18 = sub_100004B28((uint64_t)off_100109BB8);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 136315906;
          v38 = "-[IXSAppUninstaller _dextIDsForBundleID:]";
          __int16 v39 = 2112;
          v40 = v28;
          __int16 v41 = 2112;
          id v42 = v12;
          __int16 v43 = 2112;
          id v44 = v6;
          v19 = v18;
          v20 = "%s: Failed to lookup DriverKit bundle for %@ requested to be uninstalled %@ : %@";
          uint32_t v21 = 42;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
          goto LABEL_23;
        }
        if (!v31)
        {
          v18 = sub_100004B28((uint64_t)off_100109BB8);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 136315650;
          v38 = "-[IXSAppUninstaller _dextIDsForBundleID:]";
          __int16 v39 = 2112;
          v40 = v28;
          __int16 v41 = 2112;
          id v42 = v12;
          v19 = v18;
          v20 = "%s: DriverKit path associated with the app requested to be uninstalled is not a directory %@ : %@";
          uint32_t v21 = 32;
          goto LABEL_18;
        }
        Unique = (__CFBundle *)_CFBundleCreateUnique();
        if (!Unique)
        {
          v18 = sub_100004B28((uint64_t)off_100109BB8);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 136315394;
          v38 = "-[IXSAppUninstaller _dextIDsForBundleID:]";
          __int16 v39 = 2112;
          v40 = v12;
          v19 = v18;
          v20 = "%s: Failed to create CFBundle from %@";
          uint32_t v21 = 22;
          goto LABEL_18;
        }
        id v17 = Unique;
        v18 = CFBundleGetIdentifier(Unique);
        if (v18)
        {
          [v27 addObject:v18];
        }
        else
        {
          v22 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v38 = "-[IXSAppUninstaller _dextIDsForBundleID:]";
            __int16 v39 = 2112;
            v40 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Failed to get bundle ID from bundle %@", buf, 0x16u);
          }
        }
        CFRelease(v17);
LABEL_23:
      }
      id v8 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
      if (!v8)
      {
LABEL_25:
        v4 = v27;
        id v23 = [v27 copy];

        id v5 = v26;
        goto LABEL_29;
      }
    }
  }
  v24 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v38 = "-[IXSAppUninstaller _dextIDsForBundleID:]";
    __int16 v39 = 2112;
    v40 = v28;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Failed to query LSApplicationRecord for %@ : %@", buf, 0x20u);
  }

  id v23 = [v4 copy];
LABEL_29:

  return v23;
}

- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bundleID];
  id v8 = +[NSMutableSet setWithObject:v7];
  uint64_t v9 = [v6 miAppIdentity];
  uint64_t v36 = 0;
  v10 = MobileInstallationLinkedBundleIDsForIdentity();
  id v11 = 0;

  if (!v10)
  {
    v24 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10008CFD4((uint64_t)v6, (uint64_t)v11, v24);
    }

    sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _acquireTerminationAssertionForIdentity:withError:]", 294, @"IXErrorDomain", 1uLL, v11, 0, @"Failed to query linked children for app with identity: %@", v25, (uint64_t)v6);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = 0;
    id v20 = 0;
LABEL_21:

    id v11 = v21;
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  v28 = a4;
  v29 = v7;
  [v8 unionSet:v10];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = [v8 copy];
  id v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [(IXSAppUninstaller *)self _dextIDsForBundleID:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        [v8 unionSet:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }

  id v18 = [v8 copy];
  if (v18)
  {
    uint64_t v19 = +[NSString stringWithFormat:@"IX terminating bundleIDs for uninstallation: %@", v8];
    id v31 = v11;
    id v20 = [[IXSTerminationAssertion alloc] initForBundleIDs:v18 description:v19 terminationResistance:50 error:&v31];
    id v21 = v31;

    if (v20)
    {
      id v30 = v21;
      unsigned __int8 v22 = [v20 acquireAssertion:&v30];
      id v23 = v30;

      if ((v22 & 1) == 0)
      {
        [v20 invalidate];

        id v20 = 0;
      }
      id v11 = (id)v19;
      id v21 = v23;
    }
    else
    {
      id v11 = (id)v19;
    }
    a4 = v28;
    id v7 = v29;
    goto LABEL_21;
  }
  id v20 = 0;
  a4 = v28;
  id v7 = v29;
  if (!v28) {
    goto LABEL_24;
  }
LABEL_22:
  if (!v20) {
    *a4 = v11;
  }
LABEL_24:
  id v26 = v20;

  return v26;
}

- (void)_performUninstallOfAppWithIdentity:(id)a3 clientName:(id)a4 withFlags:(unint64_t)a5 record:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  __int16 v16 = +[IXSCoordinatorManager sharedInstance];
  [v12 bundleID];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000186AC;
  v23[3] = &unk_1000E9430;
  id v24 = v16;
  id v25 = v12;
  id v26 = v13;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  id v28 = v14;
  v29 = self;
  id v30 = v15;
  unint64_t v31 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v27;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  [v22 performCreationBlockingOperation:v23];
}

- (void)_promptForRelatedDataAndUninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7
{
}

- (void)_promptForMoveOrDeleteAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = [IXSMoveOrDeleteAlert alloc];
  id v19 = [v15 bundleID];
  id v20 = [(IXSMoveOrDeleteAlert *)v18 initWithAppRecord:v14 bundleIdentifier:v19 removability:a8 deletionIsRestricted:(a6 >> 10) & 1];

  if (v20)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000191FC;
    v24[3] = &unk_1000E9458;
    id v30 = v17;
    id v25 = v20;
    id v26 = v15;
    id v27 = self;
    id v28 = v14;
    id v29 = v16;
    unint64_t v31 = a6;
    unint64_t v32 = a8;
    [(IXSUninstallAlert *)v25 displayAlertWithCompletion:v24];

    id v21 = v30;
  }
  else
  {
    id v22 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10008D2F8();
    }

    id v21 = sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _promptForMoveOrDeleteAppRecord:identity:clientName:flags:completion:removability:]", 411, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create move or delete alert for app with identity %@", v23, (uint64_t)v15);
    if (v17) {
      (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v21);
    }
  }
}

- (void)_promptForUnlockOfAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (v14)
  {
    sub_100031064();
    id v18 = v27 = a8;
    [v18 localizedStringForKey:@"AUTHENTICATE_TO_DELETE_APP_TITLE" value:&stru_1000ED390 table:@"IXUninstallAlert"];
    v20 = id v19 = v15;
    id v21 = [v14 localizedName];
    id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);

    id v15 = v19;
    uint64_t v23 = +[APGuard sharedGuard];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000195B4;
    v28[3] = &unk_1000E9480;
    v28[4] = self;
    id v29 = v14;
    id v30 = v19;
    id v31 = v16;
    unint64_t v33 = a6;
    id v32 = v17;
    unint64_t v34 = v27;
    [v23 authenticateUnconditionallyWithReason:v22 completion:v28];
  }
  else
  {
    id v24 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10008D36C();
    }

    id v18 = sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _promptForUnlockOfAppRecord:identity:clientName:flags:completion:removability:]", 434, @"IXErrorDomain", 1uLL, 0, 0, @"No record specified with unlock prompt", v25, v26);
    if (v17) {
      (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v18);
    }
  }
}

- (BOOL)_screenTimeManagementEnabled
{
  if (qword_100109E28 != -1) {
    dispatch_once(&qword_100109E28, &stru_1000E94A0);
  }
  if (qword_100109E20)
  {
    v2 = objc_alloc_init((Class)qword_100109E20);
    if ([v2 isRestrictionsPasscodeSet]
      && ([v2 shouldRequestMoreTime] & 1) != 0)
    {

      return 1;
    }
  }
  else
  {
    v2 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10008D3E4(v2);
    }
  }

  return 0;
}

- (BOOL)_webContentFilterEnabled
{
  if (qword_100109E38 != -1) {
    dispatch_once(&qword_100109E38, &stru_1000E94C0);
  }
  if (qword_100109E30)
  {
    v2 = [(id)qword_100109E30 sharedWebFilterSettings];
    unsigned __int8 v3 = [v2 isWebFilterEnabled];

    if (v3) {
      return 1;
    }
  }
  else
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10008D55C(v5);
    }
  }
  return 0;
}

- (unint64_t)_contentRestrictionIsEnabledForBundleID:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  BOOL v5 = sub_100038F14(v4, 21, &v13);
  id v6 = v13;
  id v7 = v6;
  if (!v5
    || !v6
    || (([v6 objectForKeyedSubscript:@"TEST_MODE_CONTENT_RESTRICTION_MANAGEMENT_TYPE"],
         id v8 = objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         id v9 = v8,
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (id v10 = 0)
      : (id v10 = v9),
        v9,
        v9,
        !v10))
  {
    if ([v4 isEqualToString:@"com.apple.mobilesafari"])
    {
      if ([(IXSAppUninstaller *)self _screenTimeManagementEnabled])
      {
        unint64_t v11 = 1;
        goto LABEL_14;
      }
      if ([(IXSAppUninstaller *)self _webContentFilterEnabled])
      {
        unint64_t v11 = 2;
        goto LABEL_14;
      }
    }
    unint64_t v11 = 0;
    goto LABEL_14;
  }
  unint64_t v11 = (unint64_t)[v10 unsignedIntegerValue];

LABEL_14:
  return v11;
}

- (void)_finalDeletionPromptWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = [v15 bundleID];
  unint64_t v19 = [(IXSAppUninstaller *)self _contentRestrictionIsEnabledForBundleID:v18];
  if (v19)
  {
    id v20 = [[IXSContentRestrictedAppDeleteAlert alloc] initWithAppRecord:v14 removability:a7 appType:v19];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100019DE8;
    v40[3] = &unk_1000E94E8;
    id v43 = v17;
    __int16 v41 = v20;
    id v42 = v15;
    id v21 = v20;
    [(IXSContentRestrictedAppDeleteAlert *)v21 displayAlertWithCompletion:v40];
  }
  else
  {
    id v22 = +[IXSRemoteDeletionPromptManager sharedInstance];
    id v21 = v22;
    uint64_t v39 = 0;
    if (a7 == 1
      && -[IXSContentRestrictedAppDeleteAlert isValidBundleIDForRemoteAlert:withAppType:numAppsInstalled:](v22, "isValidBundleIDForRemoteAlert:withAppType:numAppsInstalled:", v18, &v39, 0)&& (v39 != 3|| (+[IXGlobalConfiguration sharedInstance](IXGlobalConfiguration, "sharedInstance"), uint64_t v23 = objc_claimAutoreleasedReturnValue(), v30 = [v23 isiPad], v23, (v30 & 1) == 0)))
    {
      if ((a6 & 0x80) != 0) {
        [(IXSAppUninstaller *)self _promptToOverrideManagedSettingsOfAppWithRecord:v14 identity:v15 clientName:v16 flags:a6 completion:v17];
      }
      else {
        [(IXSAppUninstaller *)self _promptForRelatedDataAndUninstallAppWithRecord:v14 identity:v15 clientName:v16 flags:a6 completion:v17];
      }
    }
    else
    {
      unint64_t v24 = (a6 >> 7) & 1;
      uint64_t v25 = [[IXSAppUninstallAlert alloc] initWithAppRecord:v14 bundleIdentifier:v18 removability:a7 isManagedByManagedSettings:v24 deletionIsRestricted:(a6 >> 10) & 1];
      uint64_t v26 = v25;
      if (v25)
      {
        if ((a6 & 0x100) != 0) {
          [(IXSUninstallAlert *)v25 setNeedsDemoteOptionButton:1];
        }
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100019F30;
        v31[3] = &unk_1000E9510;
        char v38 = v24;
        v31[4] = self;
        id v32 = v14;
        id v33 = v15;
        id v34 = v16;
        unint64_t v37 = a6;
        id v36 = v17;
        long long v35 = v26;
        [(IXSUninstallAlert *)v35 displayAlertWithCompletion:v31];
      }
      else
      {
        unint64_t v27 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10008D6D4();
        }

        id v29 = sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _finalDeletionPromptWithRecord:identity:clientName:flags:removability:completion:]", 587, @"IXErrorDomain", 1uLL, 0, 0, @"Failed to create app uninstall alert for app with bundle ID %@", v28, (uint64_t)v18);
        if (v17) {
          (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v29);
        }
      }
    }
  }
}

- (void)_promptForGatingDefaultAppDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (a7 == 1)
  {
    id v18 = +[IXSDefaultAppDeletionManager sharedInstance];
    uint64_t v53 = 0;
    unint64_t v19 = [v14 bundleIdentifier];
    __int16 v52 = 0;
    id v51 = 0;
    unsigned __int8 v20 = [v18 getAppRecordNeedsDefaultAppDeletionAlert:(char *)&v52 + 1 forRecord:v14 defaultAppType:&v53 gateDeletionOfLastApp:&v52 error:&v51];
    id v21 = v51;
    id v22 = v21;
    if (v20)
    {
      if (HIBYTE(v52))
      {
        char v50 = 0;
        id v49 = v21;
        id v32 = v19;
        unsigned __int8 v23 = [v18 getOtherAppsAreInstalled:&v50 forDefaultAppType:v53 exceptBundleID:v19 error:&v49];
        id v24 = v49;

        if (v23)
        {
          if (v50)
          {
            uint64_t v25 = [IXSDefaultAppSelectAlert alloc];
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_10001A4B0;
            v44[3] = &unk_1000E9538;
            v45 = [(IXSDefaultAppSelectAlert *)v25 initWithAppRecord:v14 removability:1 defaultAppType:v53];
            id v46 = v32;
            id v48 = v17;
            id v47 = v15;
            uint64_t v26 = v45;
            [(IXSDefaultAppSelectAlert *)v26 displayAlertWithCompletion:v44];

            unint64_t v19 = v32;
          }
          else
          {
            if ((_BYTE)v52)
            {
              unint64_t v27 = [IXSDefaultAppDownloadAlert alloc];
              v33[0] = _NSConcreteStackBlock;
              v33[1] = 3221225472;
              v33[2] = sub_10001A764;
              v33[3] = &unk_1000E9588;
              id v34 = [(IXSDefaultAppDownloadAlert *)v27 initWithAppRecord:v14 removability:1 defaultAppType:v53];
              id v36 = v17;
              id v35 = v15;
              uint64_t v28 = v34;
              [(IXSDefaultAppDownloadAlert *)v28 displayAlertWithCompletion:v33];

              id v29 = v34;
            }
            else
            {
              unsigned __int8 v30 = [IXSDefaultAppDeleteAlert alloc];
              id v31 = [(IXSDefaultAppDeleteAlert *)v30 initWithAppRecord:v14 removability:1 defaultAppType:v53];
              v37[0] = _NSConcreteStackBlock;
              v37[1] = 3221225472;
              v37[2] = sub_10001A604;
              v37[3] = &unk_1000E9560;
              v37[4] = self;
              char v38 = (IXSDefaultAppDownloadAlert *)v14;
              id v39 = v15;
              id v40 = v16;
              unint64_t v43 = a6;
              __int16 v41 = v31;
              id v42 = v17;
              uint64_t v28 = v31;
              [(IXSDefaultAppDownloadAlert *)v28 displayAlertWithCompletion:v37];

              id v29 = v38;
            }

            unint64_t v19 = v32;
          }
        }
        else
        {
          unint64_t v19 = v32;
          if (v17) {
            (*((void (**)(id, void, id))v17 + 2))(v17, 0, v24);
          }
        }
        goto LABEL_12;
      }
      [(IXSAppUninstaller *)self _finalDeletionPromptWithRecord:v14 identity:v15 clientName:v16 flags:a6 removability:1 completion:v17];
    }
    else if (v17)
    {
      (*((void (**)(id, void, id))v17 + 2))(v17, 0, v21);
    }
    id v24 = v22;
LABEL_12:

    goto LABEL_13;
  }
  [(IXSAppUninstaller *)self _finalDeletionPromptWithRecord:v14 identity:v15 clientName:v16 flags:a6 removability:a7 completion:v17];
LABEL_13:
}

- (void)_promptForDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v19 = [v18 applicationIsInstalled:@"com.apple.AppDeletionUIHost"];

  if (v19)
  {
    unsigned __int8 v20 = +[IXSRemoteDeletionPromptManager sharedInstance];
    id v21 = [v14 bundleIdentifier];
    unsigned __int8 v22 = [v20 isValidBundleIDForRemoteAlert:v21 withAppType:0 numAppsInstalled:0];

    if (a8 == 1 && (v22 & 1) != 0)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10001AB84;
      v24[3] = &unk_1000E95B0;
      void v24[4] = self;
      id v25 = v14;
      id v26 = v15;
      id v27 = v16;
      unint64_t v29 = a6;
      uint64_t v30 = 1;
      id v28 = v17;
      [v20 displayDeletionAlertForRecord:v25 showArchiveOption:(a6 >> 5) & 1 completion:v24];
    }
    else
    {
      [(IXSAppUninstaller *)self _promptForGatingDefaultAppDeletionWithRecord:v14 identity:v15 clientName:v16 flags:a6 removability:a8 completion:v17];
    }
  }
  else
  {
    unsigned __int8 v23 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10008D7BC(v14, v23);
    }

    [(IXSAppUninstaller *)self _promptForGatingDefaultAppDeletionWithRecord:v14 identity:v15 clientName:v16 flags:a6 removability:a8 completion:v17];
  }
}

- (void)_displayAuthenticationErrorForApp:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AD24;
  v5[3] = &unk_1000E8E08;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  sub_100066F24(&_dispatch_main_q, v5);
}

- (void)_promptToOverrideManagedSettingsOfAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (objc_opt_class())
  {
    id v16 = [v13 bundleID];
    id v17 = [v12 teamIdentifier];
    if (v17)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001B1FC;
      v22[3] = &unk_1000E95D8;
      id v23 = v16;
      id v28 = v15;
      id v24 = self;
      id v25 = v12;
      id v26 = v13;
      id v27 = v14;
      unint64_t v29 = a6;
      +[MOEffectiveApplicationSettings askToOverrideUnremovabilityOfApplication:v23 teamIdentifier:v17 completionHandler:v22];
    }
    else
    {
      unsigned __int8 v20 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v31 = "-[IXSAppUninstaller _promptToOverrideManagedSettingsOfAppWithRecord:identity:clientName:flags:completion:]";
        __int16 v32 = 2112;
        id v33 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Unable to retrieve team identifier for bundle ID %@", buf, 0x16u);
      }

      [(IXSAppUninstaller *)self _promptForRelatedDataAndUninstallAppWithRecord:v12 identity:v13 clientName:v14 flags:a6 completion:v15];
    }
  }
  else
  {
    id v18 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10008D8E4();
    }

    id v16 = sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _promptToOverrideManagedSettingsOfAppWithRecord:identity:clientName:flags:completion:]", 814, @"IXErrorDomain", 1uLL, 0, 0, @"Unable to load ManagedSettingsObjC framework", v19, v21);
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v16);
  }
}

- (void)_uninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (void (**)(id, void, void *))a8;
  if ((a6 & 4) != 0)
  {
    id v18 = [v15 bundleID];
    uint64_t v19 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v39 = "-[IXSAppUninstaller _uninstallAppWithRecord:identity:clientName:flags:removability:completion:]";
      __int16 v40 = 2112;
      __int16 v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: Posting IXAppMayUninstallNotificationName for %@", buf, 0x16u);
    }

    unsigned __int8 v20 = +[NSDistributedNotificationCenter defaultCenter];
    CFStringRef v36 = kCFBundleIdentifierKey;
    unint64_t v37 = v18;
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    if (([v15 isPersonalPersonaPlaceholder] & 1) == 0)
    {
      id v35 = v17;
      unint64_t v22 = a7;
      id v23 = [v21 mutableCopy];
      [v15 personaUniqueString];
      id v34 = v15;
      id v24 = self;
      id v25 = v16;
      v27 = id v26 = v14;
      [v23 setValue:v27 forKey:@"PersonaUniqueString"];

      id v28 = [v23 copy];
      a7 = v22;
      uint64_t v21 = v28;
      id v14 = v26;
      id v16 = v25;
      self = v24;
      id v15 = v34;
      id v17 = v35;
    }
    [v20 postNotificationName:@"com.apple.installcoordination.AppMayUninstall" object:0 userInfo:v21 deliverImmediately:1];
  }
  if ((a6 & 3) == 2)
  {
    [(IXSAppUninstaller *)self _promptForRelatedDataAndUninstallAppWithRecord:v14 identity:v15 clientName:v16 flags:a6 completion:v17];
LABEL_27:
    id v33 = 0;
    goto LABEL_28;
  }
  if ((a6 & 3) != 0)
  {
    if ((a6 & 0x20) != 0)
    {
      if ((a6 & 0x200) == 0)
      {
        [(IXSAppUninstaller *)self _promptForMoveOrDeleteAppRecord:v14 identity:v15 clientName:v16 flags:a6 completion:v17 removability:a7];
        goto LABEL_27;
      }
    }
    else if ((a6 & 0x200) == 0)
    {
      [(IXSAppUninstaller *)self _promptForDeletionWithRecord:v14 identity:v15 clientName:v16 flags:a6 completion:v17 removability:a7];
      goto LABEL_27;
    }
    [(IXSAppUninstaller *)self _promptForUnlockOfAppRecord:v14 identity:v15 clientName:v16 flags:a6 completion:v17 removability:a7];
    goto LABEL_27;
  }
  if ((a6 & 0x200) != 0)
  {
    id v31 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10008DB34();
    }

    sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _uninstallAppWithRecord:identity:clientName:flags:removability:completion:]", 851, @"IXErrorDomain", 0x16uLL, 0, 0, @"App with identity %@ needs to be unlocked before it can be uninstalled", v32, (uint64_t)v15);
    goto LABEL_21;
  }
  if ((a6 & 4) != 0)
  {
    [(IXSAppUninstaller *)self _performUninstallOfAppWithIdentity:v15 clientName:v16 withFlags:a6 record:v14 completion:v17];
    goto LABEL_27;
  }
  unint64_t v29 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10008DAC0();
  }

  sub_10003DAE4((uint64_t)"-[IXSAppUninstaller _uninstallAppWithRecord:identity:clientName:flags:removability:completion:]", 858, @"IXErrorDomain", 0x16uLL, 0, 0, @"App with identity %@ cannot be uninstalled", v30, (uint64_t)v15);
  id v33 = LABEL_21:;
  if (v17) {
    v17[2](v17, 0, v33);
  }
LABEL_28:
}

- (void)uninstallAppWithIdentity:(id)a3 clientName:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v46 = a6;
  id v44 = a4;
  unint64_t v11 = [v10 bundleID];
  unint64_t v12 = a5 & 3 | (16 * ((a5 >> 2) & 7)) & 0xFFFFFFFFFFFFFEFFLL | (((a5 >> 5) & 1) << 8);
  if ((a5 & 0x100) == 0)
  {
    id v13 = [v10 bundleID];
    id v14 = +[APApplication applicationWithBundleIdentifier:v13];
    unsigned int v15 = [v14 isLocked];

    if (v15) {
      v12 |= 0x200uLL;
    }
  }
  v45 = self;
  if (sub_1000392E4(v11, 19))
  {
    if ((a5 & 0x80) == 0) {
      v12 |= 0x400uLL;
    }
    goto LABEL_12;
  }
  id v16 = +[MCProfileConnection sharedConnection];
  unsigned int v17 = [v16 effectiveBoolValueForSetting:MCFeatureAppRemovalAllowed];

  uint64_t v18 = v12 | 0x400;
  if ((a5 & 0x80) != 0) {
    uint64_t v18 = v12;
  }
  if (v17 == 2)
  {
    unint64_t v12 = v18;
LABEL_12:
    int v19 = 1;
    goto LABEL_14;
  }
  int v19 = 0;
LABEL_14:
  id v53 = 0;
  id v20 = [objc_alloc((Class)LSApplicationRecord) initForInstallMachineryWithBundleIdentifier:v11 error:&v53];
  id v21 = v53;
  if (!v20)
  {
    uint64_t v32 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
      __int16 v56 = 2112;
      id v57 = v11;
      __int16 v58 = 2112;
      *(void *)v59 = v21;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: Failed to create LSApplicationRecord for bundle ID %@: %@", buf, 0x20u);
    }

    id v21 = 0;
    unint64_t v12 = v12 & 0x7F8 | 4;
    uint64_t v31 = 1;
    goto LABEL_41;
  }
  unsigned int v22 = [v20 isDeletable];
  id v23 = [v20 bundleContainerURL];

  BOOL v25 = (a5 & 0x80) == 0 || v23 == 0;
  if ((v19 | v22 ^ 1) == 1 && v25)
  {
    id v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v55 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
      __int16 v56 = 2112;
      if (v22) {
        int v27 = 89;
      }
      else {
        int v27 = 78;
      }
      *(_DWORD *)buf = 136316418;
      id v57 = v10;
      if (v19) {
        int v28 = 89;
      }
      else {
        int v28 = 78;
      }
      *(_DWORD *)v59 = v27;
      if ((a5 & 0x80) != 0) {
        int v29 = 89;
      }
      else {
        int v29 = 78;
      }
      __int16 v58 = 1024;
      if (v23) {
        int v30 = 89;
      }
      else {
        int v30 = 78;
      }
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v28;
      __int16 v60 = 1024;
      int v61 = v29;
      __int16 v62 = 1024;
      int v63 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: %@ cannot be uninstalled: deletableAccordingToLS:%c deletionIsRestricted:%c ignoreRestrictions:%c hasBundleContainer:%c", buf, 0x2Eu);
    }

    uint64_t v31 = 0;
LABEL_41:
    id v34 = v44;
    id v33 = v45;
    goto LABEL_57;
  }
  id v35 = +[IXSAppRemovabilityManager sharedInstance];
  CFStringRef v36 = [v35 removabilityMetadataForAppWithIdentity:v10];

  uint64_t v31 = (uint64_t)[v36 removability];
  if ([v36 removability] == (id)1)
  {
    v12 |= 4uLL;
    id v34 = v44;
    id v33 = v45;
  }
  else if ((a5 & 0x40) != 0)
  {
    unint64_t v37 = +[IXSAppRemovabilityManager sharedInstance];
    id v52 = v21;
    unsigned __int8 v38 = [v37 clearRemovabilityStateForIdentity:v10 error:&v52];
    id v43 = v52;

    if (v38)
    {
      id v34 = v44;
      id v33 = v45;
      id v21 = v43;
    }
    else
    {
      __int16 v40 = sub_100004B28((uint64_t)off_100109BB8);
      id v33 = v45;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v55 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
        __int16 v56 = 2112;
        id v57 = v10;
        __int16 v58 = 2112;
        *(void *)v59 = v43;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s: Failed to clear removability state for %@ : %@", buf, 0x20u);
      }

      id v21 = 0;
      id v34 = v44;
    }
    v12 |= 4uLL;
  }
  else
  {
    id v34 = v44;
    id v33 = v45;
    if ([v36 client] == (id)2)
    {
      v12 |= 0x84uLL;
    }
    else
    {
      id v39 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v55 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
        __int16 v56 = 2112;
        id v57 = v10;
        __int16 v58 = 2112;
        *(void *)v59 = v36;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s: %@ cannot be uninstalled because removability does not allow it: %@", buf, 0x20u);
      }
    }
  }

LABEL_57:
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10001BE18;
  v47[3] = &unk_1000E9600;
  uint64_t v50 = v31;
  unint64_t v51 = v12;
  id v48 = v10;
  id v49 = v46;
  id v41 = v46;
  id v42 = v10;
  [(IXSAppUninstaller *)v33 _uninstallAppWithRecord:v20 identity:v42 clientName:v34 flags:v12 removability:v31 completion:v47];
}

@end