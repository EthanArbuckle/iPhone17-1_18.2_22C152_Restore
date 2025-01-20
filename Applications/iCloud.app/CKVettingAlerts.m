@interface CKVettingAlerts
+ (id)_alertContentForAppStoreOperationWithApp:(id)a3 shareMetadata:(id)a4 keyPrefix:(id)a5 titleKeySuffix:(id)a6 bodyKeySuffix:(id)a7 isSourceICS:(BOOL)a8;
+ (id)_alertContentForDropDownSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 locKeyPrefix:(id)a8 isSourceICS:(BOOL)a9;
+ (id)_alertContentForVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isShortcut:(BOOL)a7 isSourceICS:(BOOL)a8;
+ (id)_sanitizedShareURLSlug:(id)a3;
+ (id)alertContentDictionaryForDeviceOfflineErrorWithURLSlug:(id)a3;
+ (id)alertContentDictionaryForServiceUnavailableErrorWithURLSlug:(id)a3;
+ (id)alertContentForAppDownload:(id)a3 shareMetadata:(id)a4 isSourceICS:(BOOL)a5;
+ (id)alertContentForAppSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 isSourceICS:(BOOL)a8;
+ (id)alertContentForAppStoreAppLookupFailureWithShareName:(id)a3 error:(id)a4;
+ (id)alertContentForAppStoreAppSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 isSourceICS:(BOOL)a8;
+ (id)alertContentForAppStoreUpdateLookupFailureWithShareName:(id)a3 appName:(id)a4 error:(id)a5;
+ (id)alertContentForAppUpdate:(id)a3 shareMetadata:(id)a4 isSourceICS:(BOOL)a5;
+ (id)alertContentForCompleteVettingError:(id)a3 shareTitle:(id)a4 email:(id)a5 phone:(id)a6 reconstructedShareURL:(id)a7;
+ (id)alertContentForFirstJoinAlertWithRecordName:(id)a3 appName:(id)a4 bundleID:(id)a5 shareMetadata:(id)a6 currentUserName:(id)a7 currentUserFormattedUsername:(id)a8;
+ (id)alertContentForFullVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isSourceICS:(BOOL)a7;
+ (id)alertContentForGenericErrorWithURLSlug:(id)a3;
+ (id)alertContentForGenericInitiateVettingError;
+ (id)alertContentForICloudAccountError:(id)a3 shareMetadata:(id)a4 shareURL:(id)a5;
+ (id)alertContentForInitiateVettingError:(id)a3 shareTitle:(id)a4 isEmail:(BOOL)a5 address:(id)a6;
+ (id)alertContentForShareMetadataErrorWithURL:(id)a3;
+ (id)alertContentForShortcutVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isSourceICS:(BOOL)a7;
+ (id)appSpecificLocKeyForBundleID:(id)a3 shareType:(id)a4 prefix:(id)a5;
+ (id)appSpecificLocKeyForURLSlug:(id)a3 prefix:(id)a4;
+ (id)deviceTypeSpecificSuffix;
+ (id)getAlertOptionsFromOptions:(id)a3 isSourceICS:(BOOL)a4;
+ (id)getLaunchingOptionsFromOptions:(id)a3 isSourceICS:(BOOL)a4;
+ (id)mediumNameFromComponents:(id)a3;
+ (id)platformSpecificAlertOptionsWithOptions:(id)a3 bundleIdentifier:(id)a4;
+ (void)showDropDownAlert:(id)a3 defaultResponseBlock:(id)a4 alternateResponseBlock:(id)a5 errorBlock:(id)a6;
+ (void)showFailureAlert:(id)a3 isSourceICS:(BOOL)a4;
+ (void)showICloudAccountSettingAlert:(id)a3 appName:(id)a4 previewRequested:(BOOL *)a5 isSourceICS:(BOOL)a6;
@end

@implementation CKVettingAlerts

+ (id)alertContentForFirstJoinAlertWithRecordName:(id)a3 appName:(id)a4 bundleID:(id)a5 shareMetadata:(id)a6 currentUserName:(id)a7 currentUserFormattedUsername:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v63 = a7;
  id v62 = a8;
  id v18 = a3;
  v19 = +[NSCharacterSet whitespaceCharacterSet];
  v20 = [v18 stringByTrimmingCharactersInSet:v19];

  v21 = [v17 containerID];
  unint64_t v22 = (unint64_t)[v21 specialContainerType];

  if (v22 <= 0x1D)
  {
    if (((1 << v22) & 0x32200000) != 0)
    {
      SEL v55 = a2;
      id v57 = a1;
      v23 = [v17 share];
      v24 = [v23 objectForKeyedSubscript:CKShareTypeKey];

      v59 = v20;
      if ([v20 length])
      {
        id v25 = v15;
        id v48 = v20;
        v52 = v15;
        v26 = sub_10000E514(@"TITLED_DOCUMENT_OPEN_TITLE", @"%@%@");
      }
      else
      {
        v27 = +[CKVettingAlerts appSpecificLocKeyForBundleID:v16 shareType:v24 prefix:@"UNTITLED_DOCUMENT_OPEN_TITLE_"];
        id v25 = v15;
        id v48 = v15;
        v26 = sub_10000E514(v27, @"%@");
      }
      id v60 = v16;
      v28 = +[CKVettingAlerts appSpecificLocKeyForBundleID:v16, v24, @"PRIVATE_DOCUMENT_OPEN_BODY_", v48, v52 shareType prefix];
      v29 = [v17 ownerIdentity];
      v30 = [v29 nameComponents];
      v31 = +[CKVettingAlerts mediumNameFromComponents:v30];
      v53 = +[CKVettingAlerts mediumNameFromComponents:v63];
      v49 = v31;
      v32 = sub_10000E514(v28, @"%@%@%@");

      id v15 = v25;
      if (!v26 || !v32)
      {
        v46 = +[NSAssertionHandler currentHandler];
        [v46 handleFailureInMethod:v55, v57, @"CKVettingAlerts.m", 101, @"Failed to construct alertTitle: %@ and/or alertBody: %@ for %@", v26, v32, v25 object file lineNumber description];
      }
      v66[0] = @"ckVettingAlertTitle";
      v66[1] = @"ckVettingAlertBody";
      v67[0] = v26;
      v67[1] = v32;
      v33 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 2, v49);

      v20 = v59;
      id v16 = v60;
      goto LABEL_9;
    }
    if (v22 == 4)
    {
      v35 = +[NSAssertionHandler currentHandler];
      [v35 handleFailureInMethod:a2 object:a1 file:@"CKVettingAlerts.m" lineNumber:77 description:@"ShareAcceptor isn't responsible for iWork FirstJoinAlert"];

      v36 = +[NSAssertionHandler currentHandler];
      [v36 handleFailureInMethod:a2, a1, @"CKVettingAlerts.m", 131, @"Appeasing the compiler, should never get here" object file lineNumber description];

      v33 = &__NSDictionary0__struct;
      goto LABEL_9;
    }
  }
  SEL v56 = a2;
  id v61 = v16;
  id v58 = a1;
  if ([v20 length])
  {
    id v50 = v20;
    v37 = @"TITLED_NONIWORK_DOCUMENT_OPEN_TITLE";
  }
  else
  {
    id v50 = v15;
    v37 = @"UNTITLED_NONIWORK_DOCUMENT_OPEN_TITLE";
  }
  v38 = sub_10000E514(v37, @"%@");
  v39 = [v17 share:v50];
  unsigned int v40 = [v39 allowsAnonymousPublicAccess];

  v41 = [v17 ownerIdentity];
  v42 = [v41 nameComponents];
  uint64_t v43 = +[CKVettingAlerts mediumNameFromComponents:v42];
  v44 = (void *)v43;
  if (v40)
  {
    v51 = (void *)v43;
    v45 = sub_10000E514(@"PUBLIC_ANONYMOUS_SHARING_OPEN_BODY", @"%@");
  }
  else
  {
    v52 = +[CKVettingAlerts mediumNameFromComponents:v63];
    id v54 = v62;
    v51 = v44;
    v45 = sub_10000E514(@"GENERIC_APP_SHARING_OPEN_BODY", @"%@%@%@");
  }
  if (!v38 || !v45)
  {
    v47 = +[NSAssertionHandler currentHandler];
    [v47 handleFailureInMethod:v56, v58, @"CKVettingAlerts.m", 126, @"Filed to construct alertTitle: %@ and/or alertBody: %@ for generic share", v38, v45 object file lineNumber description];
  }
  v64[0] = @"ckVettingAlertTitle";
  v64[1] = @"ckVettingAlertBody";
  v65[0] = v38;
  v65[1] = v45;
  v33 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 2, v51);

  id v16 = v61;
LABEL_9:

  return v33;
}

+ (id)alertContentForFullVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isSourceICS:(BOOL)a7
{
  return +[CKVettingAlerts _alertContentForVettingBindingPromptWithBundleID:a3 shareName:a4 ownerName:a5 shareType:a6 isShortcut:0 isSourceICS:a7];
}

+ (id)alertContentForShortcutVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isSourceICS:(BOOL)a7
{
  return +[CKVettingAlerts _alertContentForVettingBindingPromptWithBundleID:a3 shareName:a4 ownerName:a5 shareType:a6 isShortcut:1 isSourceICS:a7];
}

+ (id)getAlertOptionsFromOptions:(id)a3 isSourceICS:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [v7 addEntriesFromDictionary:v6];
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationForcesModalAlertAppearance];
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDisplayActionButtonOnLockScreen];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

+ (id)getLaunchingOptionsFromOptions:(id)a3 isSourceICS:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [v7 addEntriesFromDictionary:v6];
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:FBSOpenApplicationOptionKeyUnlockDevice];
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:FBSOpenApplicationOptionKeyPromptUnlockDevice];
    id v8 = [v7 copy];
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

+ (id)_alertContentForVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isShortcut:(BOOL)a7 isSourceICS:(BOOL)a8
{
  BOOL v34 = a8;
  BOOL v8 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v33 = v14;
  if (v14)
  {
    if (v8) {
      CFStringRef v16 = @"VETTING_ALERT_SINGLE_MATCH_BODY_";
    }
    else {
      CFStringRef v16 = @"VETTING_ALERT_BODY_";
    }
    id v17 = +[CKVettingAlerts appSpecificLocKeyForBundleID:v12 shareType:v15 prefix:v16];
    v29 = +[CKVettingAlerts mediumNameFromComponents:v14];
    id v18 = CKLocalizedString();
  }
  else
  {
    if (v8) {
      CFStringRef v19 = @"VETTING_ALERT_SINGLE_MATCH_BODY_UNKNOWN_USER_";
    }
    else {
      CFStringRef v19 = @"VETTING_ALERT_BODY_UNKNOWN_USER_";
    }
    id v17 = +[CKVettingAlerts appSpecificLocKeyForBundleID:v12 shareType:v15 prefix:v19];
    id v18 = CKLocalizedString();
  }

  v20 = +[NSString stringWithFormat:@"VETTING_ALERT_TITLE%@_", @"_IOS"];
  v21 = +[CKVettingAlerts appSpecificLocKeyForBundleID:v12 shareType:v15 prefix:v20];
  id v30 = v13;
  unint64_t v22 = CKLocalizedString();
  v32 = v15;
  v35[0] = kCFUserNotificationAlertHeaderKey;
  v35[1] = kCFUserNotificationAlertMessageKey;
  v36[0] = v22;
  v36[1] = v18;
  v35[2] = kCFUserNotificationDefaultButtonTitleKey;
  CKLocalizedString();
  v23 = v31 = v13;
  v36[2] = v23;
  v35[3] = kCFUserNotificationAlternateButtonTitleKey;
  v24 = CKLocalizedString();
  v36[3] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 4, v30);
  v26 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v25 bundleIdentifier:v12];

  v27 = +[CKVettingAlerts getAlertOptionsFromOptions:v26 isSourceICS:v34];

  return v27;
}

+ (id)deviceTypeSpecificSuffix
{
  v4 = CKDeviceClass();
  if ([v4 isEqualToString:@"iPhone"])
  {
    CFStringRef v5 = @"_IPHONE";
LABEL_7:
    v6 = [@"_IOS" stringByAppendingString:v5];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"iPad"])
  {
    CFStringRef v5 = @"_IPAD";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"iPod"])
  {
    CFStringRef v5 = @"_IPOD_TOUCH";
    goto LABEL_7;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  BOOL v8 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Device class %@ is not yet supported by CloudKit Vetting Alerts", buf, 0xCu);
  }
  v9 = +[NSAssertionHandler currentHandler];
  [v9 handleFailureInMethod:a2, a1, @"CKVettingAlerts.m", 240, @"Unsupported device class: %@", v4 object file lineNumber description];

  v6 = @"_IOS";
LABEL_8:

  return v6;
}

+ (id)alertContentForAppDownload:(id)a3 shareMetadata:(id)a4 isSourceICS:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 deviceTypeSpecificSuffix];
  v11 = +[CKVettingAlerts _alertContentForAppStoreOperationWithApp:v9 shareMetadata:v8 keyPrefix:@"GET_APP_" titleKeySuffix:@"_IOS" bodyKeySuffix:v10 isSourceICS:v5];

  return v11;
}

+ (id)alertContentForAppUpdate:(id)a3 shareMetadata:(id)a4 isSourceICS:(BOOL)a5
{
  return +[CKVettingAlerts _alertContentForAppStoreOperationWithApp:a3 shareMetadata:a4 keyPrefix:@"UPDATE_APP_" titleKeySuffix:@"_IOS" bodyKeySuffix:@"_IOS" isSourceICS:a5];
}

+ (id)alertContentForAppStoreAppLookupFailureWithShareName:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 deviceTypeSpecificSuffix];
  id v9 = [@"APP_STORE_FAILURE_TITLE" stringByAppendingString:@"_IOS"];
  v10 = CKLocalizedString();

  [v6 domain:v7];
  NSErrorDomain v11 = (NSErrorDomain)objc_claimAutoreleasedReturnValue();

  if (v11 == NSURLErrorDomain)
  {
    if ([v6 code] == (id)-1009)
    {
      id v14 = +[NSString stringWithFormat:@"APP_STORE_GET_APP_FAILURE_OFFLINE_BODY%@", v8];
      v28[0] = v10;
      v27[0] = @"ckVettingAlertTitle";
      v27[1] = @"ckVettingAlertBody";
      id v15 = CKLocalizedString();
      v28[1] = v15;
      CFStringRef v16 = v28;
      id v17 = v27;
    }
    else
    {
      id v14 = +[NSString stringWithFormat:@"APP_STORE_GET_APP_FAILURE_STORE_NOT_AVAILABLE_BODY%@", v8];
      v25[0] = @"ckVettingAlertTitle";
      v25[1] = @"ckVettingAlertBody";
      v26[0] = v10;
      id v15 = CKLocalizedString();
      v26[1] = v15;
      CFStringRef v16 = v26;
      id v17 = v25;
    }
  }
  else
  {
    id v12 = [v6 domain];
    id v13 = v12;
    if (v12 == (void *)CKUnderlyingErrorDomain)
    {
      id v18 = [v6 code];

      if (v18 == (id)1024)
      {
        v23[0] = @"ckVettingAlertTitle";
        v23[1] = @"ckVettingAlertBody";
        v24[0] = v10;
        id v14 = CKLocalizedString();
        v24[1] = v14;
        CFStringRef v19 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v14 = +[NSString stringWithFormat:@"APP_STORE_GET_APP_FAILURE_STORE_NOT_AVAILABLE_BODY%@", v8];
    v21[0] = @"ckVettingAlertTitle";
    v21[1] = @"ckVettingAlertBody";
    v22[0] = v10;
    id v15 = CKLocalizedString();
    v22[1] = v15;
    CFStringRef v16 = v22;
    id v17 = v21;
  }
  CFStringRef v19 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17 count:2];

LABEL_11:

  return v19;
}

+ (id)alertContentForAppStoreUpdateLookupFailureWithShareName:(id)a3 appName:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [@"APP_STORE_FAILURE_TITLE" stringByAppendingString:@"_IOS"];
  NSErrorDomain v11 = CKLocalizedString();

  [v8 domain:v9];
  NSErrorDomain v12 = (NSErrorDomain)objc_claimAutoreleasedReturnValue();

  if (v12 == NSURLErrorDomain)
  {
    id v21 = v7;
    if ([v8 code] == (id)-1009)
    {
      id v15 = CKLocalizedString();
      CFStringRef v34 = @"ckVettingAlertTitle";
      CFStringRef v35 = @"ckVettingAlertBody";
      v36 = v11;
      v37 = v15;
      CFStringRef v16 = &v36;
      id v17 = &v34;
    }
    else
    {
      id v15 = CKLocalizedString();
      CFStringRef v30 = @"ckVettingAlertTitle";
      CFStringRef v31 = @"ckVettingAlertBody";
      v32 = v11;
      v33 = v15;
      CFStringRef v16 = &v32;
      id v17 = &v30;
    }
  }
  else
  {
    id v13 = [v8 domain];
    id v14 = v13;
    if (v13 == (void *)CKUnderlyingErrorDomain)
    {
      id v18 = [v8 code];

      if (v18 == (id)1024)
      {
        id v21 = v7;
        id v15 = CKLocalizedString();
        CFStringRef v26 = @"ckVettingAlertTitle";
        CFStringRef v27 = @"ckVettingAlertBody";
        v28 = v11;
        v29 = v15;
        CFStringRef v16 = &v28;
        id v17 = &v26;
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v21 = v7;
    id v15 = CKLocalizedString();
    CFStringRef v22 = @"ckVettingAlertTitle";
    CFStringRef v23 = @"ckVettingAlertBody";
    v24 = v11;
    id v25 = v15;
    CFStringRef v16 = &v24;
    id v17 = &v22;
  }
LABEL_10:
  +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v17, 2, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
    v35,
    v36,
  CFStringRef v19 = v37);

  return v19;
}

+ (id)_alertContentForAppStoreOperationWithApp:(id)a3 shareMetadata:(id)a4 keyPrefix:(id)a5 titleKeySuffix:(id)a6 bodyKeySuffix:(id)a7 isSourceICS:(BOOL)a8
{
  BOOL v31 = a8;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a5;
  CFStringRef v16 = +[NSString stringWithFormat:@"%@TITLE%@", v15, a6];
  id v17 = CKLocalizedString();
  id v18 = [v13 ownerIdentity];
  CFStringRef v19 = [v18 nameComponents];

  if (v19)
  {
    v20 = +[NSString stringWithFormat:@"%@BODY%@", v15, v14];

    id v21 = [v13 ownerIdentity];
    CFStringRef v22 = [v21 nameComponents];
    CFStringRef v30 = +[CKVettingAlerts mediumNameFromComponents:v22];
    CFStringRef v23 = CKLocalizedString();
  }
  else
  {
    v20 = +[NSString stringWithFormat:@"%@BODY_UNKNOWN_USER%@", v15, v14];

    CFStringRef v30 = v12;
    CFStringRef v23 = CKLocalizedString();
  }

  v32[0] = kCFUserNotificationAlertHeaderKey;
  v32[1] = kCFUserNotificationAlertMessageKey;
  v33[0] = v17;
  v33[1] = v23;
  v32[2] = kCFUserNotificationDefaultButtonTitleKey;
  v24 = CKLocalizedString();
  v33[2] = v24;
  v32[3] = kCFUserNotificationAlternateButtonTitleKey;
  id v25 = CKLocalizedString();
  v33[3] = v25;
  CFStringRef v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4, v30);
  CFStringRef v27 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v26 bundleIdentifier:0];

  v28 = +[CKVettingAlerts getAlertOptionsFromOptions:v27 isSourceICS:v31];

  return v28;
}

+ (id)alertContentForInitiateVettingError:(id)a3 shareTitle:(id)a4 isEmail:(BOOL)a5 address:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_TITLE_CANT_SEND_LINK%@", @"_IOS"];
  id v13 = sub_10000E514(v12, &stru_100024D18);
  id v14 = sub_10000E514(@"VETTING_FAILURE_ALERT_BODY_INITIATE_GENERIC_ERROR", &stru_100024D18);
  id v15 = [v9 domain];
  unsigned int v16 = [v15 isEqualToString:CKErrorDomain];

  if (v16)
  {
    id v17 = [v9 userInfo];
    id v18 = [v17 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v19 = [v18 code];
    switch((unint64_t)v19)
    {
      case 0x1F46uLL:
        id v33 = v11;
        if (v7) {
          v20 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_TOO_MANY_VETS_EMAIL";
        }
        else {
          v20 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_TOO_MANY_VETS_NUMBER";
        }
        goto LABEL_15;
      case 0x1F47uLL:
        id v21 = [v18 userInfo];
        CFStringRef v22 = [v21 objectForKeyedSubscript:CKErrorAccountPrimaryEmailKey];

        if (v7)
        {
          CFStringRef v23 = [@"VETTING_FAILURE_ALERT_TITLE_INITIATE_VETTED_TO_CALLER_ERROR_EMAIL" stringByAppendingString:@"_IOS"];

          uint64_t v24 = sub_10000E514(v23, &stru_100024D18);

          if (!v22 || ([v22 isEqualToString:&stru_100024D18] & 1) != 0)
          {
            id v33 = v11;
            id v25 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_EMAIL_NO_APPLE_ID";
LABEL_20:
            v28 = @"%@";
            goto LABEL_27;
          }
          id v33 = v11;
          CFStringRef v34 = v22;
          id v25 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_EMAIL";
        }
        else
        {
          CFStringRef v23 = [@"VETTING_FAILURE_ALERT_TITLE_INITIATE_VETTED_TO_CALLER_ERROR_PHONE" stringByAppendingString:@"_IOS"];

          uint64_t v24 = sub_10000E514(v23, &stru_100024D18);

          if (!v22 || ([v22 isEqualToString:&stru_100024D18] & 1) != 0)
          {
            id v33 = v11;
            id v25 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_PHONE_NO_APPLE_ID";
            goto LABEL_20;
          }
          id v33 = v11;
          CFStringRef v34 = v22;
          id v25 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_PHONE";
        }
        v28 = @"%@%@";
LABEL_27:
        uint64_t v30 = sub_10000E514(v25, v28);

        id v14 = (void *)v30;
LABEL_28:

        id v13 = (void *)v24;
        id v12 = v23;
LABEL_29:

        break;
      case 0x1F48uLL:
        CFStringRef v22 = +[CKContainer matterhornName];
        id v33 = v11;
        CFStringRef v34 = v22;
        if (v7) {
          CFStringRef v26 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_OTHER_EMAIL";
        }
        else {
          CFStringRef v26 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_OTHER_NUMBER";
        }
        uint64_t v29 = sub_10000E514(v26, @"%@%@");

        uint64_t v24 = (uint64_t)v13;
        id v14 = (void *)v29;
        goto LABEL_23;
      case 0x1F49uLL:
        goto LABEL_29;
      case 0x1F4AuLL:
        v20 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_SERVER_ERROR";
        CFStringRef v27 = &stru_100024D18;
        goto LABEL_16;
      default:
        if (v19 != (id)5005) {
          goto LABEL_29;
        }
        id v33 = v10;
        v20 = @"VETTING_FAILURE_ALERT_BODY_INITIATE_PCS_ERROR";
LABEL_15:
        CFStringRef v27 = @"%@";
LABEL_16:
        sub_10000E514(v20, v27);
        CFStringRef v22 = v14;
        id v14 = v24 = (uint64_t)v13;
LABEL_23:
        CFStringRef v23 = v12;
        goto LABEL_28;
    }
  }
  v35[0] = @"ckVettingAlertTitle";
  v35[1] = @"ckVettingAlertBody";
  v36[0] = v13;
  v36[1] = v14;
  BOOL v31 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2, v33, v34);

  return v31;
}

+ (id)_sanitizedShareURLSlug:(id)a3
{
  id v3 = a3;
  if (qword_10002A788 != -1) {
    dispatch_once(&qword_10002A788, &stru_100024AC8);
  }
  v4 = [v3 CKURLSlug];
  if ([(id)qword_10002A790 containsObject:v4]) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = @"share";
  }

  return v5;
}

+ (id)alertContentForCompleteVettingError:(id)a3 shareTitle:(id)a4 email:(id)a5 phone:(id)a6 reconstructedShareURL:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = @"_WITH_SHARE_NAME";
  if (!v13) {
    id v17 = @"_WITHOUT_SHARE_NAME";
  }
  v82 = v17;
  v79 = v16;
  v81 = [a1 _sanitizedShareURLSlug:v16];
  id v18 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_GENERIC_ERROR" stringByAppendingString:@"_IOS"];
  id v19 = sub_10000E514(v18, &stru_100024D18);
  v20 = sub_10000E514(@"VETTING_FAILURE_ALERT_BODY_COMPLETE_GENERIC_ERROR_ADDRESS", &stru_100024D18);
  if (v14)
  {
    uint64_t v21 = sub_10000E514(@"VETTING_FAILURE_ALERT_BODY_COMPLETE_GENERIC_ERROR_EMAIL", &stru_100024D18);

    v20 = (void *)v21;
  }
  v80 = v15;
  if (v15)
  {
    uint64_t v22 = sub_10000E514(@"VETTING_FAILURE_ALERT_BODY_COMPLETE_GENERIC_ERROR_PHONE", &stru_100024D18);

    v20 = (void *)v22;
  }
  CFStringRef v23 = [v12 domain];
  unsigned int v24 = [v23 isEqualToString:CKErrorDomain];

  if (v24)
  {
    id v25 = v13;
    id v26 = v14;
    CFStringRef v27 = [v12 userInfo];
    v28 = [v27 objectForKeyedSubscript:NSUnderlyingErrorKey];

    v78 = v28;
    id v29 = [v28 code];
    id v14 = v26;
    id v13 = v25;
    switch((unint64_t)v29)
    {
      case 0x1F42uLL:
        id v33 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_TOKEN_INVALID" stringByAppendingString:@"_IOS"];

        uint64_t v31 = sub_10000E514(v33, &stru_100024D18);

        id v18 = +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_BODY_COMPLETE_TOKEN_INVALID%@", v82];

        if (v14)
        {
          id v71 = v14;
          id v72 = v25;
        }
        else
        {
          id v71 = v80;
          id v72 = v25;
        }
        v32 = @"%@%@";
        goto LABEL_31;
      case 0x1F43uLL:
      case 0x1F44uLL:
        uint64_t v30 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_GENERIC_ERROR" stringByAppendingString:@"_IOS"];

        uint64_t v31 = sub_10000E514(v30, &stru_100024D18);

        id v18 = +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_BODY_COMPLETE_VETTING_RECORD_ERROR%@%@", v82, @"_IOS"];

        id v71 = v25;
        v32 = @"%@";
LABEL_31:
        sub_10000E514(v18, v32);
        v20 = v42 = v20;
        goto LABEL_63;
      case 0x1F49uLL:
        CFStringRef v34 = +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_DRYRUN_KEYSWAP_FAILED%@_%@", @"_IOS", v81];

        uint64_t v35 = sub_10000E514(v34, &stru_100024D18);

        if (([v81 isEqualToString:kCKPhotosSharedLibraryShareURLSlug] & 1) != 0
          || [v81 isEqualToString:kCKFreeformShareURLSlug])
        {
          CFStringRef v36 = @"PHONE";
          if (!v80) {
            CFStringRef v36 = @"EMAIL";
          }
          uint64_t v37 = [@"VETTING_FAILURE_ALERT_BODY_COMPLETE_DRYRUN_KEYSWAP_FAILED_" stringByAppendingFormat:@"%@_%@", v81, v36];
        }
        else
        {
          if (v80) {
            CFStringRef v52 = @"PHONE";
          }
          else {
            CFStringRef v52 = @"EMAIL";
          }
          uint64_t v37 = +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_BODY_COMPLETE_DRYRUN_KEYSWAP_FAILED%@_IOS_%@", v82, v52];
        }
        id v18 = (void *)v37;

        id v71 = v25;
        sub_10000E514(v18, @"%@");
        v20 = v42 = v20;
        uint64_t v31 = v35;
        goto LABEL_63;
      case 0x1F4BuLL:
        if (v14)
        {
          v38 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_TOKEN_AUTH_FAILED_EMAIL" stringByAppendingString:@"_IOS"];
          uint64_t v39 = sub_10000E514(v38, &stru_100024D18);

          uint64_t v31 = v39;
          unsigned int v40 = @"VETTING_FAILURE_ALERT_BODY_COMPLETE_TOKEN_AUTH_FAILED_EMAIL";
        }
        else
        {
          v49 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_TOKEN_AUTH_FAILED_PHONE" stringByAppendingString:@"_IOS"];
          uint64_t v50 = sub_10000E514(v49, &stru_100024D18);

          uint64_t v31 = v50;
          unsigned int v40 = @"VETTING_FAILURE_ALERT_BODY_COMPLETE_TOKEN_AUTH_FAILED_PHONE";
        }
        v42 = [(__CFString *)v40 stringByAppendingString:@"_IOS"];
        uint64_t v51 = sub_10000E514(v42, &stru_100024D18);

        v20 = (void *)v51;
        goto LABEL_63;
      case 0x1F4CuLL:
        v41 = [v78 userInfo];
        v42 = [v41 objectForKeyedSubscript:NSUnderlyingErrorKey];

        uint64_t v43 = [v42 domain];
        if (![v43 isEqualToString:CKErrorDomain]) {
          goto LABEL_22;
        }
        id v44 = [v42 code];

        if (v44 == (id)2)
        {
          uint64_t v43 = [v42 userInfo];
          v45 = [v43 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
          uint64_t v76 = [v45 objectForKeyedSubscript:v79];

          v42 = (void *)v76;
LABEL_22:
        }
        id v46 = [v14 length];
        v47 = @"_EMAIL";
        if (!v46) {
          v47 = @"_PHONE";
        }
        v77 = v47;
        id v48 = [v42 domain];
        if ([v48 isEqualToString:CKErrorDomain])
        {
          if ([v42 code] == (id)3)
          {

            goto LABEL_40;
          }
          id v53 = [v42 code];

          if (v53 == (id)4)
          {
LABEL_40:
            v75 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED" stringByAppendingFormat:@"%@_%@", @"_IOS", v81];
            uint64_t v73 = sub_10000E514(v75, &stru_100024D18);

            if (([v81 isEqualToString:kCKPhotosSharedLibraryShareURLSlug] & 1) != 0
              || [v81 isEqualToString:kCKFreeformShareURLSlug])
            {
              id v54 = [@"VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_OFFLINE_" stringByAppendingFormat:@"%@%@", v81, v77];
            }
            else
            {
              id v54 = +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_OFFLINE%@%@", v82, v77];
            }
            v67 = v54;
            id v71 = v13;
            uint64_t v65 = sub_10000E514(v54, @"%@");

            v20 = v67;
            uint64_t v31 = v73;
            id v63 = v77;
            goto LABEL_61;
          }
        }
        else
        {
        }
        SEL v55 = [v42 domain];
        if ([v55 isEqualToString:CKErrorDomain])
        {
          id v56 = [v42 code];

          if (v56 == (id)11)
          {
            if ([@"_IOS" isEqualToString:@"_IOS"]
              && [v81 isEqualToString:@"share"])
            {
              id v57 = v81;
              id v58 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE" stringByAppendingFormat:@"%@%@_%@", v82, @"_IOS", v81];
              v59 = v58;
              id v60 = @"%@";
            }
            else
            {
              id v57 = v81;
              id v58 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE" stringByAppendingFormat:@"%@_%@", @"_IOS", v81];
              v59 = v58;
              id v60 = &stru_100024D18;
            }
            uint64_t v74 = sub_10000E514(v58, v60);

            if (([v57 isEqualToString:kCKPhotosSharedLibraryShareURLSlug] & 1) != 0
              || [v57 isEqualToString:kCKFreeformShareURLSlug])
            {
              v66 = [@"VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE_" stringByAppendingFormat:@"%@%@", v57, v77];
            }
            else
            {
              v66 = +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE%@%@", v82, v77];
            }
            v68 = v66;
            uint64_t v31 = v74;
            id v71 = v13;
            uint64_t v65 = sub_10000E514(v66, @"%@");
            id v63 = v77;
LABEL_62:

            v20 = (void *)v65;
LABEL_63:

            id v19 = (void *)v31;
LABEL_64:

            break;
          }
        }
        else
        {
        }
        id v61 = [v42 domain];
        if ([v61 isEqualToString:CKErrorDomain])
        {
          id v62 = [v42 code];

          if (v62 == (id)1000)
          {
            v75 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED" stringByAppendingFormat:@"%@_%@", @"_IOS", v81];
            uint64_t v31 = sub_10000E514(v75, &stru_100024D18);

            id v63 = v77;
            +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_SERVER_ERROR%@%@", v82, v77];
            v64 = LABEL_54:;
            id v71 = v13;
            uint64_t v65 = sub_10000E514(v64, @"%@");

            v20 = v64;
LABEL_61:
            v68 = v75;
            goto LABEL_62;
          }
        }
        else
        {
        }
        v75 = [@"VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED" stringByAppendingFormat:@"%@_%@", @"_IOS", v81];
        uint64_t v31 = sub_10000E514(v75, &stru_100024D18);

        id v63 = v77;
        +[NSString stringWithFormat:@"VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_UNKNOWN%@%@", v82, v77];
        goto LABEL_54;
      default:
        goto LABEL_64;
    }
  }
  v83[0] = @"ckVettingAlertTitle";
  v83[1] = @"ckVettingAlertBody";
  v84[0] = v19;
  v84[1] = v20;
  v69 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v84, v83, 2, v71, v72);

  return v69;
}

+ (id)alertContentForShareMetadataErrorWithURL:(id)a3
{
  id v3 = [a3 CKURLSlug];
  v4 = [@"ITEM_UNAVAILABLE_FAILURE_ALERT_TITLE" stringByAppendingFormat:@"%@_", @"_IOS"];
  BOOL v5 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v3 prefix:v4];

  v10[0] = @"ckVettingAlertTitle";
  id v6 = sub_10000E514(v5, &stru_100024D18);
  v10[1] = @"ckVettingAlertBody";
  v11[0] = v6;
  BOOL v7 = sub_10000E514(@"ITEM_UNAVAILABLE_FAILURE_ALERT_BODY", &stru_100024D18);
  v11[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

+ (id)alertContentForICloudAccountError:(id)a3 shareMetadata:(id)a4 shareURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 domain];
  if ([v10 isEqualToString:CKErrorDomain])
  {
    if ([v7 code] == (id)9)
    {

LABEL_6:
      id v12 = [@"SIGN_IN_TO_ICLOUD_TITLE" stringByAppendingString:@"_IOS"];
      id v13 = +[CKContainer matterhornName];
      CKLocalizedString();
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v15 = [@"SIGN_IN_TO_ICLOUD_BODY" stringByAppendingFormat:@"%@_", @"_IOS"];
      id v16 = [v9 CKURLSlug];
      id v17 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v16 prefix:v15];
      uint64_t v39 = +[CKContainer matterhornName];
      CKLocalizedString();
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v49[0] = @"ckVettingAlertTitle";
      v49[1] = @"ckVettingAlertBody";
      v50[0] = v14;
      v50[1] = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 2, v39);

      goto LABEL_23;
    }
    id v11 = [v7 code];

    if (v11 == (id)115) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v20 = [v7 domain];
  if ([v20 isEqualToString:CKUnderlyingErrorDomain])
  {
    id v21 = [v7 code];

    if (v21 == (id)1023)
    {
      uint64_t v22 = [v7 userInfo];
      CFStringRef v23 = [v22 objectForKeyedSubscript:CKErrorDisabledAppLocalizedName];

      unsigned int v24 = [@"ENABLE_IN_ICLOUD_TITLE" stringByAppendingString:@"_IOS"];
      unsigned int v40 = +[CKContainer matterhornName];
      CKLocalizedString();
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v25 = [v8 ownerIdentity];
      id v26 = [v25 nameComponents];

      if (v23)
      {
        CFStringRef v27 = [v9 CKURLSlug];
        if (v26)
        {
          v28 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v27 prefix:@"ENABLE_IN_ICLOUD_BODY_"];

          id v44 = [v8 ownerIdentity];
          id v29 = [v44 nameComponents];
          +[CKVettingAlerts mediumNameFromComponents:v29];
          v31 = uint64_t v30 = v23;
          v42 = +[CKContainer matterhornName];
          v41 = v31;
          CKLocalizedString();
          id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

          CFStringRef v23 = v30;
        }
        else
        {
          v28 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v27 prefix:@"ENABLE_IN_ICLOUD_BODY_UNKNOWN_USER_"];

          v41 = +[CKContainer matterhornName];
          CKLocalizedString();
          id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (v26)
      {
        v28 = [v8 ownerIdentity];
        CFStringRef v36 = [v28 nameComponents];
        uint64_t v37 = +[CKVettingAlerts mediumNameFromComponents:v36];
        +[CKContainer matterhornName];
        uint64_t v43 = v41 = v37;
        CKLocalizedString();
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = +[CKContainer matterhornName];
        v41 = v28;
        CKLocalizedString();
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      v47[0] = @"ckVettingAlertTitle";
      v47[1] = @"ckVettingAlertBody";
      v48[0] = v14;
      v48[1] = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2, v41);

      goto LABEL_23;
    }
  }
  else
  {
  }
  v32 = [v7 domain];
  if ([v32 isEqualToString:CKErrorDomain])
  {
    id v33 = [v7 code];

    if (v33 == (id)110)
    {
      CFStringRef v34 = [@"UPDATE_APPLE_ID_SETTINGS_TITLE" stringByAppendingFormat:@"%@", @"_IOS"];
      CKLocalizedString();
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      CKLocalizedString();
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v45[0] = @"ckVettingAlertTitle";
      v45[1] = @"ckVettingAlertBody";
      v46[0] = v14;
      v46[1] = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v35 = [v9 CKURLSlug];
  id v19 = +[CKVettingAlerts alertContentForGenericErrorWithURLSlug:v35];

  id v18 = &stru_100024D18;
  id v14 = &stru_100024D18;
LABEL_23:

  return v19;
}

+ (id)alertContentDictionaryForDeviceOfflineErrorWithURLSlug:(id)a3
{
  id v3 = a3;
  v4 = +[NSString stringWithFormat:@"DEVICE_OFFLINE_TITLE%@_", @"_IOS"];
  BOOL v5 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v3 prefix:v4];
  id v6 = CKLocalizedString();

  id v7 = +[NSString stringWithFormat:@"DEVICE_OFFLINE_BODY%@_", @"_IOS"];
  id v8 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v3 prefix:v7];

  id v9 = CKLocalizedString();

  v12[0] = @"ckVettingAlertTitle";
  v12[1] = @"ckVettingAlertBody";
  v13[0] = v6;
  v13[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

+ (id)alertContentDictionaryForServiceUnavailableErrorWithURLSlug:(id)a3
{
  id v3 = a3;
  v4 = +[NSString stringWithFormat:@"SERVER_ERROR_TITLE%@_", @"_IOS"];
  BOOL v5 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v3 prefix:v4];
  id v6 = CKLocalizedString();

  id v7 = +[NSString stringWithFormat:@"SERVER_ERROR_BODY%@_", @"_IOS"];
  id v8 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v3 prefix:v7];

  id v9 = CKLocalizedString();

  v12[0] = @"ckVettingAlertTitle";
  v12[1] = @"ckVettingAlertBody";
  v13[0] = v6;
  v13[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

+ (id)alertContentForAppSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 isSourceICS:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return +[CKVettingAlerts _alertContentForDropDownSelectionWithShareName:a3 ownerName:a4 currentUserName:a5 currentUserFormattedUsername:a6 dropDownTitles:a7 locKeyPrefix:@"APP_SELECTION_ALERT_" isSourceICS:v9];
}

+ (id)alertContentForAppStoreAppSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 isSourceICS:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return +[CKVettingAlerts _alertContentForDropDownSelectionWithShareName:a3 ownerName:a4 currentUserName:a5 currentUserFormattedUsername:a6 dropDownTitles:a7 locKeyPrefix:@"APP_STORE_SELECTION_ALERT_" isSourceICS:v9];
}

+ (id)_alertContentForDropDownSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 locKeyPrefix:(id)a8 isSourceICS:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v34 = a7;
  id v18 = a8;
  if (v14) {
    +[NSString stringWithFormat:@"%@TITLE%@", v18, @"_IOS"];
  }
  else {
  id v19 = +[NSString stringWithFormat:@"%@UNTITLED_TITLE%@", v18, @"_IOS"];
  }
  id v33 = CKLocalizedString();

  v32 = v17;
  uint64_t v31 = v16;
  if (v15)
  {
    v20 = +[NSString stringWithFormat:@"%@BODY%@", v18, @"_IOS"];
    id v21 = +[CKVettingAlerts mediumNameFromComponents:v15];
    uint64_t v30 = +[CKVettingAlerts mediumNameFromComponents:v16];
    uint64_t v22 = CKLocalizedString();
  }
  else
  {
    v20 = +[NSString stringWithFormat:@"%@UNKNOWN_USER_BODY%@", v18, @"_IOS"];
    id v21 = +[CKVettingAlerts mediumNameFromComponents:v16];
    uint64_t v30 = v17;
    uint64_t v22 = CKLocalizedString();
  }

  CFStringRef v23 = +[NSString stringWithFormat:@"%@OPEN_BUTTON_MAC", v18, v30];
  unsigned int v24 = CKLocalizedString();
  v35[0] = kCFUserNotificationAlertHeaderKey;
  v35[1] = kCFUserNotificationAlertMessageKey;
  v36[0] = v33;
  v36[1] = v22;
  void v36[2] = v24;
  void v35[2] = kCFUserNotificationDefaultButtonTitleKey;
  v35[3] = kCFUserNotificationAlternateButtonTitleKey;
  id v25 = CKLocalizedString();
  void v35[4] = kCFUserNotificationPopUpTitlesKey;
  v36[3] = v25;
  void v36[4] = v34;
  id v26 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
  CFStringRef v27 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v26 bundleIdentifier:0];

  v28 = +[CKVettingAlerts getAlertOptionsFromOptions:v27 isSourceICS:a9];

  return v28;
}

+ (void)showFailureAlert:(id)a3 isSourceICS:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:@"ckVettingAlertTitle"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"ckVettingAlertBody"];

  if (!v8)
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"CKVettingAlerts.m" lineNumber:696 description:@"Error alert title empty"];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"CKVettingAlerts.m" lineNumber:697 description:@"Error alert body empty"];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v18[0] = kCFUserNotificationAlertHeaderKey;
  v18[1] = kCFUserNotificationAlertMessageKey;
  v19[0] = v8;
  v19[1] = v9;
  v18[2] = kCFUserNotificationDefaultButtonTitleKey;
  id v10 = CKLocalizedString();
  v19[2] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v12 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v11 bundleIdentifier:0];

  CFDictionaryRef v13 = +[CKVettingAlerts getAlertOptionsFromOptions:v12 isSourceICS:v4];

  id v14 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v13);
  CFOptionFlags v17 = 0;
  CFUserNotificationReceiveResponse(v14, 604800.0, &v17);
  CFRelease(v14);
}

+ (void)showICloudAccountSettingAlert:(id)a3 appName:(id)a4 previewRequested:(BOOL *)a5 isSourceICS:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a4;
  id v9 = a3;
  uint64_t v30 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
  uint64_t v10 = CKLocalizedString();
  if (v8)
  {
    id v11 = +[NSString stringWithFormat:@"PREVIEW_BUTTON_IOS_%@", v8];
    if (v11)
    {
      id v12 = CKLocalizedString();
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
    id v11 = 0;
  }
  CFDictionaryRef v13 = CKLocalizedString();
  v35[0] = kCFUserNotificationAlertHeaderKey;
  id v14 = [v9 objectForKeyedSubscript:@"ckVettingAlertTitle"];
  v36[0] = v14;
  v35[1] = kCFUserNotificationAlertMessageKey;
  id v15 = [v9 objectForKeyedSubscript:@"ckVettingAlertBody"];

  v36[1] = v15;
  void v36[2] = v10;
  v28 = (void *)v10;
  void v35[2] = kCFUserNotificationDefaultButtonTitleKey;
  v35[3] = kCFUserNotificationAlternateButtonTitleKey;
  v36[3] = v13;
  id v16 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];

  CFOptionFlags v17 = +[CKVettingAlerts getAlertOptionsFromOptions:v16 isSourceICS:v6];

  if (v12)
  {
    id v18 = [v17 mutableCopy];
    [v18 setObject:v12 forKey:kCFUserNotificationOtherButtonTitleKey];

    CFOptionFlags v17 = v18;
  }
  CFDictionaryRef v19 = +[CKVettingAlerts platformSpecificAlertOptionsWithOptions:v17 bundleIdentifier:0];

  v20 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v19);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v20, 604800.0, &responseFlags);
  if ((responseFlags & 3) == 2)
  {
    BOOL v27 = 1;
  }
  else
  {
    if ((responseFlags & 3) == 0)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v21 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Redirecting user to iCloud preferences", buf, 2u);
      }
      uint64_t v22 = +[CKVettingAlerts getLaunchingOptionsFromOptions:0 isSourceICS:v6];
      CFStringRef v23 = +[LSApplicationWorkspace defaultWorkspace];
      id v31 = 0;
      unsigned __int8 v24 = [v23 openSensitiveURL:v30 withOptions:v22 error:&v31];
      id v25 = v31;

      if ((v24 & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        id v26 = ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to open iCloud settings: %@", buf, 0xCu);
        }
      }
    }
    BOOL v27 = 0;
  }
  CFRelease(v20);
  if (a5) {
    *a5 = v27;
  }
}

+ (void)showDropDownAlert:(id)a3 defaultResponseBlock:(id)a4 alternateResponseBlock:(id)a5 errorBlock:(id)a6
{
  id v9 = (void (**)(id, CFOptionFlags))a4;
  uint64_t v10 = (void (**)(void))a5;
  id v11 = (void (**)(void))a6;
  id v12 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, (CFDictionaryRef)a3);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v12, 604800.0, &responseFlags);
  if ((responseFlags & 3) == 1)
  {
    v10[2](v10);
  }
  else if ((responseFlags & 3) != 0)
  {
    v11[2](v11);
  }
  else
  {
    v9[2](v9, responseFlags >> 24);
  }
  CFRelease(v12);
}

+ (id)platformSpecificAlertOptionsWithOptions:(id)a3 bundleIdentifier:(id)a4
{
  id v4 = [a3 mutableCopy];
  BOOL v5 = +[NSBundle mainBundle];
  BOOL v6 = [v5 resourceURL];
  [v4 setObject:v6 forKeyedSubscript:kCFUserNotificationLocalizationURLKey];

  return v4;
}

+ (id)alertContentForGenericInitiateVettingError
{
  v2 = [@"VETTING_FAILURE_ALERT_TITLE_CANT_SEND_LINK" stringByAppendingString:@"_IOS"];
  v7[0] = @"ckVettingAlertTitle";
  id v3 = sub_10000E514(v2, &stru_100024D18);
  v7[1] = @"ckVettingAlertBody";
  v8[0] = v3;
  id v4 = sub_10000E514(@"VETTING_FAILURE_ALERT_BODY_INITIATE_GENERIC_ERROR", &stru_100024D18);
  v8[1] = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)mediumNameFromComponents:(id)a3
{
  if (a3)
  {
    id v3 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:a3 style:2 options:0];
    id v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  }
  else
  {
    id v4 = &stru_100024D18;
  }

  return v4;
}

+ (id)alertContentForGenericErrorWithURLSlug:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:@"GENERIC_ERROR_BODY_TRY_AGAIN%@_", @"_IOS"];
  BOOL v5 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v3 prefix:v4];
  BOOL v6 = +[NSString stringWithFormat:@"GENERIC_ERROR_TITLE%@_", @"_IOS"];
  id v7 = +[CKVettingAlerts appSpecificLocKeyForURLSlug:v3 prefix:v6];

  v12[0] = @"ckVettingAlertTitle";
  id v8 = CKLocalizedString();
  v12[1] = @"ckVettingAlertBody";
  v13[0] = v8;
  id v9 = CKLocalizedString();
  v13[1] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

+ (id)appSpecificLocKeyForBundleID:(id)a3 shareType:(id)a4 prefix:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (qword_10002A798 != -1) {
    dispatch_once(&qword_10002A798, &stru_100024AE8);
  }
  uint64_t v10 = [(id)qword_10002A7A0 objectForKey:v7];

  if (v10)
  {
    id v11 = [(id)qword_10002A7A0 objectForKeyedSubscript:v7];
    id v12 = [(id)qword_10002A7A8 objectForKeyedSubscript:v11];
    unsigned int v13 = [v12 containsObject:v8];

    if (v13) {
      +[NSString stringWithFormat:@"%@%@_%@", v9, v11, v8];
    }
    else {
    id v14 = +[NSString stringWithFormat:@"%@%@", v9, v11, v16];
    }
  }
  else
  {
    id v14 = +[NSString stringWithFormat:@"%@Generic", v9];
  }

  return v14;
}

+ (id)appSpecificLocKeyForURLSlug:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length]) {
    +[NSString stringWithFormat:@"%@%@", v6, v5];
  }
  else {
  id v7 = +[NSString stringWithFormat:@"%@share", v6, v9];
  }

  return v7;
}

@end