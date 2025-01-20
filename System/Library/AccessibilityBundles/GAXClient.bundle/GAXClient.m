__CFString *GAXProfileKeyForUIAutonomousSingleAppModeConfigurationDictionaryKey(void *a1)
{
  id v1;
  __CFString **v2;
  __CFString *v3;
  NSObject *v5;
  uint64_t vars8;

  v1 = a1;
  if ([v1 isEqualToString:UIAutonomousSingleAppModePropertyKeyAllowsLockButton])
  {
    v2 = &GAXProfileAllowsLockButton;
LABEL_11:
    v3 = *v2;
    goto LABEL_12;
  }
  if ([v1 isEqualToString:UIAutonomousSingleAppModePropertyKeyAllowsAutoLock])
  {
    v2 = &GAXProfileAllowsAutolock;
    goto LABEL_11;
  }
  if ([v1 isEqualToString:UIAutonomousSingleAppModePropertyKeyAllowsAccessibilityShortcut])
  {
    v2 = &GAXProfileAllowsAccessibilityShortcut;
    goto LABEL_11;
  }
  if ([v1 isEqualToString:UIAutonomousSingleAppModePropertyKeyAutomaticallyRelaunchesAfterAppCrash])
  {
    v2 = &GAXProfileShouldAutolaunchCrashedApps;
    goto LABEL_11;
  }
  if ([v1 isEqualToString:UIAutonomousSingleAppModePropertyKeyShowsUserConfirmationPromptsAndBanners])
  {
    v2 = &GAXProfileShowsUserConfirmationPromptsAndBanners;
    goto LABEL_11;
  }
  v5 = GAXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_AF18((uint64_t)v1, v5);
  }

  v3 = &stru_15118;
LABEL_12:

  return v3;
}

id GAXProfileOverridesFromConfiguration(void *a1)
{
  v1 = [a1 propertiesAsDictionary];
  v2 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v1 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = GAXProfileKeyForUIAutonomousSingleAppModeConfigurationDictionaryKey(v8);
        if (v9)
        {
          v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v12);
          [v2 setObject:v10 forKeyedSubscript:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_1A6C(id a1)
{
  qword_1BC80 = objc_opt_new();

  _objc_release_x1();
}

void sub_1C28(uint64_t a1)
{
  id v2 = objc_alloc((Class)AXIPCServer);
  id v4 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 32);
  id v5 = [v4 _messageServiceName];
  id v6 = [v2 initWithServiceName:v5 perPidService:1];

  [*v3 setAppServer:v6];
  [v6 setHandlerWithTarget:*v3 selector:"_handleGetAffectedViewsForPath:" forKey:11000];
  [v6 setHandlerWithTarget:*v3 selector:"_handleHideKeyboard:" forKey:11002];
  [v6 setHandlerWithTarget:*v3 selector:"_handleSettingsDidChange:" forKey:11003];
  [v6 setHandlerWithTarget:*v3 selector:"_handleGetRestrictionIdentifiers:" forKey:11004];
  [v6 setHandlerWithTarget:*v3 selector:"_handleRestrictionDidChangeState:" forKey:11005];
  [v6 setHandlerWithTarget:*v3 selector:"_handlePrepareClientAppForTransitionToWorkspace:" forKey:11006];
  [*v3 _initializeBackboardClient];
  id v12 = 0;
  unsigned __int8 v7 = [v6 startServerWithError:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_B044(v3, (uint64_t)v8, v9);
    }
  }
  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:*v3 selector:"_handleAppDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  [v10 addObserver:*v3 selector:"_handlePreferenceDidChange:" name:kAXSGuidedAccessEnabledNotification object:0];
  [*v3 setEnabled:_AXSGuidedAccessRequiresApplicationAccessibility() != 0];
  v11 = GAXLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_AF90(v11);
  }

  [*v3 _notifyGuidedAccessClientDidLoad];
}

id sub_20A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyAppDidBecomeActive];
}

id sub_211C(uint64_t a1)
{
  BOOL v2 = _AXSGuidedAccessRequiresApplicationAccessibility() != 0;
  id v3 = *(void **)(a1 + 32);

  return [v3 setEnabled:v2];
}

BOOL sub_2864(id a1, UIView *a2)
{
  BOOL v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_28BC(id a1, UIView *a2)
{
  BOOL v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

int64_t sub_2970(id a1, id a2, id a3)
{
  id v4 = a3;
  [a2 windowLevel];
  double v6 = v5;
  [v4 windowLevel];
  double v8 = v7;

  int64_t v9 = -1;
  if (v6 >= v8) {
    int64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

void sub_2E38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_B390(a1, v7, v8, v9, v10, v11, v12, v13);
    }
    id v14 = 0;
LABEL_11:

    goto LABEL_12;
  }
  long long v15 = [v5 payload];

  if (v15)
  {
    v16 = [v5 payload];
    v17 = [v16 objectForKeyedSubscript:&off_17CD0];
    id v18 = [v17 integerValue];
    if ((unint64_t)v18 >= 4)
    {
      v19 = GAXLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_B318((int)v18, v19);
      }

      id v18 = &dword_0 + 2;
    }

    v20 = +[UIAutonomousSingleAppModeConfiguration defaultConfigurationForStyle:v18];
    double v7 = [v5 payload];
    v21 = [v7 objectForKeyedSubscript:&off_17CE8];
    id v14 = v20;
    v22 = [v21 objectForKeyedSubscript:@"GAXProfileAllowsAutolock"];
    objc_msgSend(v14, "setAllowsAutoLock:", objc_msgSend(v22, "BOOLValue"));

    v23 = [v21 objectForKeyedSubscript:@"GAXProfileAllowsLockButton"];
    objc_msgSend(v14, "setAllowsLockButton:", objc_msgSend(v23, "BOOLValue"));

    goto LABEL_11;
  }
  id v14 = 0;
LABEL_12:
  uint64_t v24 = *(void *)(a1 + 40);
  if (v24) {
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v14);
  }
}

void sub_3404(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    double v7 = v6;
    uint64_t v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_B478();
    }

    id v9 = 0;
  }
  else
  {
    uint64_t v10 = [v5 payload];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"success"];
    id v9 = [v11 BOOLValue];

    uint64_t v12 = [v5 payload];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"errorCode"];
    id v14 = [v13 integerValue];

    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9) {
      uint64_t v15 = 0;
    }
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = (id)v15;
    }
    if (v14 || (v9 & 1) == 0)
    {
      v17 = GAXLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_B400((int)v16, v17);
      }
    }
    double v7 = [*(id *)(a1 + 32) _errorForGAXAXFeaturesResetErrorCode:v16];
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v9, v7);
  }
}

id sub_361C(uint64_t a1)
{
  v8[0] = @"GAXIPCPayloadKeyPid";
  BOOL v2 = +[NSNumber numberWithInt:getpid()];
  v9[0] = v2;
  v8[1] = @"GAXIPCPayloadKeyBundleIdentifier";
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 bundleIdentifier];
  v9[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  id v6 = [*(id *)(a1 + 32) _sendMessageToBackboardWithIdentifier:13013 payload:v5 replyMessage:0 description:@"notify backboard GAX client did load" error:0];
  return v6;
}

void sub_3740(id a1, BOOL a2, id a3, NSError *a4)
{
  if (a2) {
    _AXPerformBlockOnMainThreadAfterDelay(&stru_146B0, 0.5);
  }
}

void sub_3758(id a1)
{
  v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"GAXClientLoadedNotification" object:0];

  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:UIAccessibilityGuidedAccessStatusDidChangeNotification object:0];
}

id sub_3890(uint64_t a1)
{
  v8[0] = @"GAXIPCPayloadKeyPid";
  id v2 = +[NSNumber numberWithInt:getpid()];
  v9[0] = v2;
  v8[1] = @"GAXIPCPayloadKeyBundleIdentifier";
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 bundleIdentifier];
  v9[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  id v6 = [*(id *)(a1 + 32) _sendMessageToBackboardWithIdentifier:13012 payload:v5 replyMessage:0 description:@"notify backboard GAX client did become active" error:0];
  return v6;
}

void sub_39B4(id a1, BOOL a2, id a3, NSError *a4)
{
  if (a2) {
    _AXPerformBlockOnMainThreadAfterDelay(&stru_146F0, 0.5);
  }
}

void sub_39CC(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:UIAccessibilityGuidedAccessStatusDidChangeNotification object:0];
}

id sub_3DB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessageToBackboardWithIdentifier:13010 payload:0 replyMessage:0 description:@"tell backboard to show guided access active banner" error:0];
}

void sub_3FD4(id a1)
{
  id v1 = +[UIKeyboardImpl activeInstance];
  [v1 dismissKeyboard];
}

void sub_4120(id a1)
{
  id v1 = +[UIKeyboardImpl activeInstance];
  [v1 dismissKeyboard];
}

void sub_4234(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _guidedAccessRestrictionDelegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = [v2 guidedAccessRestrictionIdentifiers];
    if (v3)
    {
      id v4 = +[NSMutableArray array];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = v3;
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = objc_msgSend(v10, "copy", (void)v12);
              [v4 addObject:v11];
            }
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      [*(id *)(a1 + 40) setObject:v4 forKey:@"GAXIPCPayloadKeyRestrictionIdentifiers"];
    }
  }
}

uint64_t sub_446C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _guidedAccessRestrictionDelegate];
  if (v2)
  {
    id v9 = (void *)v2;
    if (objc_opt_respondsToSelector())
    {
      id v3 = objc_msgSend(*(id *)(a1 + 40), "payload", v9);
      id v4 = [v3 objectForKey:@"GAXIPCPayloadKeyRestrictionIdentifier"];

      if (v4)
      {
        id v5 = [*(id *)(a1 + 40) payload];
        id v6 = [v5 objectForKey:@"GAXIPCPayloadKeyRestrictionState"];
        id v7 = [v6 integerValue];

        [v9 guidedAccessRestrictionWithIdentifier:v4 didChangeState:v7];
      }
    }
  }

  return _objc_release_x2();
}

void sub_4620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_4638(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 isRotating];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_4784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_47A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_47B0(uint64_t a1)
{
}

void sub_47B8(uint64_t a1)
{
  uint64_t v1 = a1;
  if ([*(id *)(a1 + 32) _isAnyWindowRotating])
  {
    id v2 = objc_alloc((Class)NSDictionary);
    id v3 = +[NSNumber numberWithBool:1];
    id v4 = objc_msgSend(v2, "initWithObjectsAndKeys:", v3, @"GAXIPCPayloadKeyShouldAbortServerModeTransition", 0);
    uint64_t v5 = *(void *)(*(void *)(v1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Aborting transition due to rotation.", buf, 2u);
    }
  }
  else
  {
    id v7 = [*(id *)(v1 + 32) _guidedAccessRestrictionDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v7 guidedAccessRestrictionIdentifiers];
      if ([v8 count])
      {
        id v9 = [objc_alloc((Class)NSArray) initWithArray:v8 copyItems:1];
        id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", v9, @"GAXIPCPayloadKeyRestrictionIdentifiers", 0);
        v32 = v8;
        uint64_t v33 = v1;
        id v31 = v9;
        if (objc_opt_respondsToSelector())
        {
          id v11 = objc_opt_new();
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v12 = v9;
          id v13 = [v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v39;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v39 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                uint64_t v18 = [v7 textForGuidedAccessRestrictionWithIdentifier:v17];
                if (v18)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v19 = [v18 copy];
                    [v11 setObject:v19 forKey:v17];
                  }
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
            }
            while (v14);
          }

          [v10 setObject:v11 forKey:@"GAXIPCPayloadKeyTextsForRestrictions"];
          uint64_t v8 = v32;
          uint64_t v1 = v33;
          id v9 = v31;
        }
        if (objc_opt_respondsToSelector())
        {
          v20 = objc_opt_new();
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v21 = v9;
          id v22 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v35;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v35 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
                v27 = [v7 detailTextForGuidedAccessRestrictionWithIdentifier:v26];
                if (v27)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v28 = [v27 copy];
                    [v20 setObject:v28 forKey:v26];
                  }
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v23);
          }

          [v10 setObject:v20 forKey:@"GAXIPCPayloadKeyDetailTextsForRestrictions"];
          uint64_t v8 = v32;
          uint64_t v1 = v33;
          id v9 = v31;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v29 = *(void *)(*(void *)(v1 + 40) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v10;
  }
}

void sub_4C94(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_4CBC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_4D78(uint64_t a1)
{
  id v2 = +[AXValidationManager sharedInstance];
  [v2 performValidations:&stru_147E8 withPreValidationHandler:&stru_14808 postValidationHandler:0 safeCategoryInstallationHandler:&stru_14848];

  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 bundleIdentifier];

  if (([v4 isEqualToString:AX_SafariBundleName] & 1) != 0
    || [v4 isEqualToString:@"com.apple.webapp"])
  {
    uint64_t v5 = +[AXValidationManager sharedInstance];
    id v6 = v5;
    id v7 = &stru_14868;
    uint64_t v8 = &stru_14888;
    uint64_t v9 = &stru_148A8;
  }
  else
  {
    if (![v4 isEqualToString:@"com.apple.datadetectors.DDActionsService"]) {
      goto LABEL_5;
    }
    uint64_t v5 = +[AXValidationManager sharedInstance];
    id v6 = v5;
    id v7 = &stru_148C8;
    uint64_t v8 = &stru_148E8;
    uint64_t v9 = &stru_14908;
  }
  [v5 performValidations:v7 withPreValidationHandler:v8 postValidationHandler:0 safeCategoryInstallationHandler:v9];

LABEL_5:
  uint64_t v10 = +[AXBinaryMonitor sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5778;
  v12[3] = &unk_14928;
  v12[4] = *(void *)(a1 + 32);
  [v10 addHandler:v12 forFramework:@"StoreKit"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5780;
  v11[3] = &unk_14928;
  v11[4] = *(void *)(a1 + 32);
  [v10 addHandler:v11 forFramework:@"WebKit"];
  [v10 evaluateExistingBinaries];
  UIGuidedAccessSetConfigureAccessibilityFeaturesEnabledCallback();
}

BOOL sub_4F94(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"UIWebURLAction", @"performDefaultActionForURL: andDOMNode: withAllowedTypes: forFrame: inView:", "B", "@", "@", "Q", "@", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIWebURLAction", @"performDefaultActionForURL: andDOMNode: withAllowedTypes: forFrame: inView:", "B", "@", "@", "Q", "@", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"LSApplicationWorkspace", @"openSensitiveURL: withOptions:", "B", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"LSApplicationWorkspace", @"openURL: withOptions:", "B", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIActivity", @"activityType", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIActivityViewController", @"_performActivity:", "v", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIDevice", @"setOrientation: animated:", "v", "q", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UINavigationBar", @"backButtonViewAtPoint:", "@", "{CGPoint=dd}", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UINavigationBar", @"hitTest: withEvent:", "@", "{CGPoint=dd}", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UITabBarButton", @"pointInside: withEvent:", "B", "{CGPoint=dd}", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIWindow", @"_targetForStolenStatusBarTouchesAtPoint: withEvent: excludingWindow:", "@", "{CGPoint=dd}", "@", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIClientRotationContext", @"initWithClient: toOrientation: duration: andWindow:", "@", "@", "q", "d", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIViewController", @"window: willRotateToInterfaceOrientation: duration:", "v", "@", "q", "d", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIViewController", @"window: didRotateFromInterfaceOrientation:", "v", "@", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"_UIScrollsToTopInitiatorView" isKindOfClass:@"UIView"];
  [(AXValidationManager *)v2 validateClass:@"_UIHostedWindow" isKindOfClass:@"UIWindow"];
  objc_opt_class();
  [(AXValidationManager *)v2 validateClass:@"UIClientRotationContext" hasInstanceVariable:@"_rotationSettings" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  [(AXValidationManager *)v2 validateClass:@"UIResponder", @"_canBecomeFirstResponder", "B", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"_UINavigationInteractiveTransition", @"gestureRecognizerShouldBegin:", "B", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"_UINavigationInteractiveTransitionBase", @"_parent", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UINavigationBar", @"currentBackButton", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"UIStatusBarBreadcrumbItemView", @"userDidActivateButton:", "v", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"_UIStatusBarAction", @"performWithStatusBar: completionHandler:", "v", "@", "@?", 0 hasInstanceMethod withFullSignature];

  return 1;
}

BOOL sub_5340(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX Client Bundle"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access Client"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_53A0(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"GAXNSObjectPublicAPIOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"UIAutonomousSingleAppModeSessionAPIOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"UIAutonomousSingleAppModeConfigurationAPIOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIResponderOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIWindowOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIViewControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIDeviceOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUINavigationBarOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIWebURLActionOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUITabBarButtonOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIActivityViewControllerOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXUIClientRotationContextOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAXLSApplicationWorkspaceOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAX_UINavigationInteractiveTransitionOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAX_UIHostedWindowOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAX_UIStatusBarBreadcrumbItemViewOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAX_UIStatusBarActionOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAX_UIOpenInIBooksActivityOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAX_UIInputSwitcherViewOverride" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"GAX_UIKeyboardCameraViewControllerOverride" canInteractWithTargetClass:1];
}

BOOL sub_5564(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"WKContentView", @"canPerformAction: withSender:", "B", ":", "@", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"_SFWebView" isKindOfClass:@"UIResponder"];

  return 1;
}

BOOL sub_55E4(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX Safari Dictionary Bundle"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access Safari Dictionary"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_5644(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"UIApplicationGuidedAccessDictionaryLookup" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"WKContentViewGuidedAccessDictionaryLookup" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"_SFWebViewGuidedAccessDictionaryLookup" canInteractWithTargetClass:1];
}

BOOL sub_56B4(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL sub_56BC(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX Safari Dictionary Bundle"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access Safari Dictionary - Data Detectors"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_571C(id a1, AXValidationManager *a2)
{
  id v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"DDParsecNoDataViewControllerGuidedAccessDictionaryLookup" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"DDParsecServiceCollectionViewControllerGuidedAccessDictionaryLookup" canInteractWithTargetClass:1];
}

id sub_5778(uint64_t a1)
{
  return [*(id *)(a1 + 32) validateAndInstallForStoreKit];
}

id sub_5780(uint64_t a1)
{
  return [*(id *)(a1 + 32) validateAndInstallForWebKit];
}

void sub_5788(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[GAXClient sharedInstance];
  [v6 requestAXFeatures:a1 changeEnablement:a2 completion:v5];
}

void sub_5818(id a1)
{
  uint64_t v1 = +[NSBundle bundleWithPath:@"/System/Library/Frameworks/StoreKit.framework"];
  unsigned int v2 = [v1 isLoaded];

  if (v2 && qword_1BC98 != -1)
  {
    dispatch_once(&qword_1BC98, &stru_14968);
  }
}

void sub_589C(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&stru_14988 withPreValidationHandler:&stru_149A8 postValidationHandler:0 safeCategoryInstallationHandler:&stru_149C8];
}

BOOL sub_5900(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL sub_5944(id a1, AXValidationManager *a2)
{
  unsigned int v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX StoreKit Bundle"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided StoreKit"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_59A4(id a1, AXValidationManager *a2)
{
}

void sub_59E0(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&stru_14A08 withPreValidationHandler:&stru_14A28 postValidationHandler:0 safeCategoryInstallationHandler:&stru_14A48];
}

BOOL sub_5A44(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL sub_5A4C(id a1, AXValidationManager *a2)
{
  unsigned int v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"GAX WebKit Bundle"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"Guided Access WebKit"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void sub_5AAC(id a1, AXValidationManager *a2)
{
}

uint64_t sub_5CD0(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

uint64_t sub_5CF0(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

void sub_5E90(id a1, UIAutonomousSingleAppModeConfiguration *a2)
{
  if (a2)
  {
    unsigned int v2 = a2;
    id v3 = [objc_alloc((Class)UIAutonomousSingleAppModeSession) initWithEffectiveConfiguration:v2];

    id v4 = (void *)currentlyActiveSession;
    currentlyActiveSession = (uint64_t)v3;

    [(id)currentlyActiveSession setActive:1];
    id v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_B524(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void sub_6048(id a1, UIAutonomousSingleAppModeConfiguration *a2)
{
  unsigned int v2 = a2;
  id v3 = GAXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    uint64_t v15 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "potentially setting session, config is %@", (uint8_t *)&v14, 0xCu);
  }

  if (v2)
  {
    id v4 = [objc_alloc((Class)UIAutonomousSingleAppModeSession) initWithEffectiveConfiguration:v2];
    id v5 = (void *)currentlyActiveSession;
    currentlyActiveSession = (uint64_t)v4;

    [(id)currentlyActiveSession setActive:1];
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_B524(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void sub_63FC(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_64A4;
  block[3] = &unk_14B20;
  char v6 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_64A4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [objc_alloc((Class)UIAutonomousSingleAppModeSession) initWithEffectiveConfiguration:*(void *)(a1 + 32)];
    id v3 = (void *)currentlyActiveSession;
    currentlyActiveSession = (uint64_t)v2;

    [(id)currentlyActiveSession setActive:1];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
    else
    {
      uint64_t v6 = UIAutonomousSingleAppModeErrorDomain;
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"ERROR_REQUESTING_SESSION" value:0 table:@"GuidedAccessAppStrings"];
      uint64_t v12 = v8;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      uint64_t v10 = +[NSError errorWithDomain:v6 code:2 userInfo:v9];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_68F0(uint64_t a1)
{
  uint64_t v2 = UIAutonomousSingleAppModeErrorDomain;
  uint64_t v3 = *(void *)(a1 + 40);
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ERROR_ENDING_SESSION" value:0 table:@"GuidedAccessAppStrings"];
  uint64_t v9 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v7 = +[NSError errorWithDomain:v2 code:v3 userInfo:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6A30(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6ABC;
  block[3] = &unk_14B20;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_6ABC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2 == (void *)currentlyActiveSession)
    {
      currentlyActiveSession = 0;
    }
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
    else
    {
      char v5 = GAXLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)NSErrorUserInfoKey v11 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Request sent to AXBackboardServer to end session but came back with failure", v11, 2u);
      }

      uint64_t v6 = UIAutonomousSingleAppModeErrorDomain;
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
      NSErrorUserInfoKey v8 = [v7 localizedStringForKey:@"ERROR_ENDING_SESSION" value:0 table:@"GuidedAccessAppStrings"];
      uint64_t v13 = v8;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      uint64_t v10 = +[NSError errorWithDomain:v6 code:2 userInfo:v9];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t sub_72CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_72DC(uint64_t a1)
{
}

uint64_t sub_72E4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _contentsOfUserInterfaceItem:@"contextMenu"];

  return _objc_release_x1();
}

BOOL sub_7434(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  objc_opt_class();
  char v5 = __UIAccessibilityCastAsClass();
  uint64_t v6 = [v5 identifier];

  if ([v6 isEqualToString:@"WKElementActionTypeOpen"]) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = [v6 isEqualToString:@"WKElementActionTypeCopy"];
  }

  return v7;
}

void sub_8B9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id GAXFallbackValueForProfileKey(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  if (qword_1BCC0 == -1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_1BCC0, &stru_15080);
    if (a3)
    {
LABEL_3:
      uint64_t v6 = [(id)qword_1BCB8 objectForKey:v5];
      if (v6) {
        goto LABEL_8;
      }
    }
  }
  unsigned __int8 v7 = (void *)qword_1BCB0;
  NSErrorUserInfoKey v8 = +[NSNumber numberWithUnsignedInt:a2];
  uint64_t v9 = [v7 objectForKey:v8];
  uint64_t v6 = [v9 objectForKey:v5];

  if (!v6)
  {
    uint64_t v10 = GAXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_B758((uint64_t)v5, v10);
    }

    uint64_t v6 = 0;
  }
LABEL_8:

  return v6;
}

void sub_92D0(id a1)
{
  v52[0] = @"GAXProfileAllowsKeyboardTextInput";
  v52[1] = @"GAXProfileAllowsTouch";
  v53[0] = &__kCFBooleanTrue;
  v53[1] = &__kCFBooleanTrue;
  v52[2] = @"GAXProfileAllowsMotion";
  v52[3] = @"GAXProfileAllowsRingerSwitch";
  v53[2] = &__kCFBooleanTrue;
  v53[3] = &__kCFBooleanFalse;
  v52[4] = @"GAXProfileAllowsProximity";
  v52[5] = @"GAXProfileAllowsLockButton";
  v53[4] = &__kCFBooleanFalse;
  v53[5] = &__kCFBooleanFalse;
  v52[6] = @"GAXProfileAllowsVolumeButtons";
  v52[7] = @"GAXProfileAllowsAutolock";
  v53[6] = &__kCFBooleanFalse;
  v53[7] = &__kCFBooleanTrue;
  v52[8] = @"GAXProfileAppTimeoutDuration";
  v52[9] = @"GAXProfileAppTimeoutEnabled";
  v53[8] = &off_17D90;
  v53[9] = &__kCFBooleanFalse;
  v52[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  long long v41 = +[NSNull null];
  v53[10] = v41;
  v52[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  long long v38 = +[NSNull null];
  v53[11] = v38;
  v52[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  long long v35 = +[NSNull null];
  v53[12] = v35;
  v52[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  v32 = +[NSNull null];
  v53[13] = v32;
  v52[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  uint64_t v29 = +[NSNull null];
  v53[14] = v29;
  v52[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  id v1 = +[NSNull null];
  v53[15] = v1;
  v52[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  uint64_t v2 = +[NSNull null];
  v53[16] = v2;
  v52[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  uint64_t v3 = +[NSNull null];
  v53[17] = v3;
  v53[18] = &__kCFBooleanFalse;
  v52[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v52[19] = @"GAXProfileAllowsAXToggleZoom";
  v53[19] = &__kCFBooleanFalse;
  v53[20] = &__kCFBooleanFalse;
  v52[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v52[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v53[21] = &__kCFBooleanFalse;
  v53[22] = &__kCFBooleanFalse;
  v52[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v52[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v53[23] = &__kCFBooleanFalse;
  v52[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  id v4 = +[NSNull null];
  v53[24] = v4;
  v52[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  id v5 = +[NSNull null];
  v53[25] = v5;
  v52[26] = @"GAXProfileStatesForRestrictions";
  uint64_t v6 = +[NSNull null];
  v53[26] = v6;
  v52[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  unsigned __int8 v7 = +[NSNull null];
  v53[27] = v7;
  v53[28] = &__kCFBooleanFalse;
  v52[28] = @"GAXProfileAllowsHomeButton";
  v52[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v53[29] = &__kCFBooleanTrue;
  v53[30] = &__kCFBooleanTrue;
  v52[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v52[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v53[31] = &__kCFBooleanTrue;
  v53[32] = &__kCFBooleanTrue;
  v52[32] = @"GAXProfileAllowsExit";
  v52[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v53[33] = &__kCFBooleanFalse;
  v53[34] = &__kCFBooleanTrue;
  v52[34] = @"GAXProfileAllowsWebTextDefine";
  v52[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v53[35] = &__kCFBooleanFalse;
  v43 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:36];

  v50[0] = @"GAXProfileAllowsKeyboardTextInput";
  v50[1] = @"GAXProfileAllowsTouch";
  v51[0] = &__kCFBooleanTrue;
  v51[1] = &__kCFBooleanTrue;
  v50[2] = @"GAXProfileAllowsMotion";
  v50[3] = @"GAXProfileAllowsRingerSwitch";
  v51[2] = &__kCFBooleanTrue;
  v51[3] = &__kCFBooleanTrue;
  v50[4] = @"GAXProfileAllowsProximity";
  v50[5] = @"GAXProfileAllowsLockButton";
  v51[4] = &__kCFBooleanTrue;
  v51[5] = &__kCFBooleanTrue;
  v50[6] = @"GAXProfileAllowsVolumeButtons";
  v50[7] = @"GAXProfileAllowsAutolock";
  v51[6] = &__kCFBooleanTrue;
  v51[7] = &__kCFBooleanTrue;
  v50[8] = @"GAXProfileAppTimeoutDuration";
  v50[9] = @"GAXProfileAppTimeoutEnabled";
  v51[8] = &off_17D90;
  v51[9] = &__kCFBooleanFalse;
  v50[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  long long v39 = +[NSNull null];
  v51[10] = v39;
  v50[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  long long v36 = +[NSNull null];
  v51[11] = v36;
  v50[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  uint64_t v33 = +[NSNull null];
  v51[12] = v33;
  v50[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  v30 = +[NSNull null];
  v51[13] = v30;
  v50[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  v27 = +[NSNull null];
  v51[14] = v27;
  v50[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  NSErrorUserInfoKey v8 = +[NSNull null];
  v51[15] = v8;
  v50[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  uint64_t v9 = +[NSNull null];
  v51[16] = v9;
  v50[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  uint64_t v10 = +[NSNull null];
  v51[17] = v10;
  v51[18] = &__kCFBooleanFalse;
  v50[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v50[19] = @"GAXProfileAllowsAXToggleZoom";
  v51[19] = &__kCFBooleanFalse;
  v51[20] = &__kCFBooleanFalse;
  v50[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v50[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v51[21] = &__kCFBooleanFalse;
  v51[22] = &__kCFBooleanFalse;
  v50[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v50[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v51[23] = &__kCFBooleanFalse;
  v50[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  NSErrorUserInfoKey v11 = +[NSNull null];
  v51[24] = v11;
  v50[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  NSErrorUserInfoKey v12 = +[NSNull null];
  v51[25] = v12;
  v50[26] = @"GAXProfileStatesForRestrictions";
  uint64_t v13 = +[NSNull null];
  v51[26] = v13;
  v50[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  int v14 = +[NSNull null];
  v51[27] = v14;
  v51[28] = &__kCFBooleanFalse;
  v50[28] = @"GAXProfileAllowsHomeButton";
  v50[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v51[29] = &__kCFBooleanTrue;
  v51[30] = &__kCFBooleanTrue;
  v50[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v50[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v51[31] = &__kCFBooleanTrue;
  v51[32] = &__kCFBooleanFalse;
  v50[32] = @"GAXProfileAllowsExit";
  v50[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v51[33] = &__kCFBooleanTrue;
  v51[34] = &__kCFBooleanTrue;
  v50[34] = @"GAXProfileAllowsWebTextDefine";
  v50[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v51[35] = &__kCFBooleanFalse;
  v42 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:36];

  v48[0] = @"GAXProfileAllowsKeyboardTextInput";
  v48[1] = @"GAXProfileAllowsTouch";
  v49[0] = &__kCFBooleanTrue;
  v49[1] = &__kCFBooleanTrue;
  v48[2] = @"GAXProfileAllowsMotion";
  v48[3] = @"GAXProfileAllowsRingerSwitch";
  v49[2] = &__kCFBooleanTrue;
  v49[3] = &__kCFBooleanTrue;
  v48[4] = @"GAXProfileAllowsProximity";
  v48[5] = @"GAXProfileAllowsLockButton";
  v49[4] = &__kCFBooleanTrue;
  v49[5] = &__kCFBooleanTrue;
  v48[6] = @"GAXProfileAllowsVolumeButtons";
  v48[7] = @"GAXProfileAllowsAutolock";
  v49[6] = &__kCFBooleanTrue;
  v49[7] = &__kCFBooleanTrue;
  v48[8] = @"GAXProfileAppTimeoutDuration";
  v48[9] = @"GAXProfileAppTimeoutEnabled";
  v49[8] = &off_17D90;
  v49[9] = &__kCFBooleanFalse;
  v48[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  long long v40 = +[NSNull null];
  v49[10] = v40;
  v48[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  long long v37 = +[NSNull null];
  v49[11] = v37;
  v48[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  long long v34 = +[NSNull null];
  v49[12] = v34;
  v48[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  id v31 = +[NSNull null];
  v49[13] = v31;
  v48[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  id v28 = +[NSNull null];
  v49[14] = v28;
  v48[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  uint64_t v15 = +[NSNull null];
  v49[15] = v15;
  v48[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  id v16 = +[NSNull null];
  v49[16] = v16;
  v48[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  uint64_t v17 = +[NSNull null];
  v49[17] = v17;
  v49[18] = &__kCFBooleanFalse;
  v48[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v48[19] = @"GAXProfileAllowsAXToggleZoom";
  v49[19] = &__kCFBooleanFalse;
  v49[20] = &__kCFBooleanFalse;
  v48[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v48[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v49[21] = &__kCFBooleanFalse;
  v49[22] = &__kCFBooleanFalse;
  v48[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v48[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v49[23] = &__kCFBooleanFalse;
  v48[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  uint64_t v18 = +[NSNull null];
  v49[24] = v18;
  v48[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  id v19 = +[NSNull null];
  v49[25] = v19;
  v48[26] = @"GAXProfileStatesForRestrictions";
  v20 = +[NSNull null];
  v49[26] = v20;
  v48[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  id v21 = +[NSNull null];
  v49[27] = v21;
  v49[28] = &__kCFBooleanFalse;
  v48[28] = @"GAXProfileAllowsHomeButton";
  v48[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v49[29] = &__kCFBooleanTrue;
  v49[30] = &__kCFBooleanTrue;
  v48[30] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v48[31] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v49[31] = &__kCFBooleanTrue;
  v49[32] = &__kCFBooleanFalse;
  v48[32] = @"GAXProfileAllowsExit";
  v48[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v49[33] = &__kCFBooleanTrue;
  v49[34] = &__kCFBooleanTrue;
  v48[34] = @"GAXProfileAllowsWebTextDefine";
  v48[35] = @"GAXProfileAllowsAccessibilityShortcut";
  v49[35] = &__kCFBooleanFalse;
  id v22 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:36];

  v46[0] = @"GAXProfileAllowsAutolock";
  v46[1] = @"GAXProfileAllowsLockButton";
  v47[0] = &__kCFBooleanFalse;
  v47[1] = &__kCFBooleanFalse;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  uint64_t v24 = (void *)qword_1BCB8;
  qword_1BCB8 = v23;

  v44[0] = &off_17D48;
  v44[1] = &off_17D60;
  v45[0] = v43;
  v45[1] = v42;
  v44[2] = &off_17D78;
  v45[2] = v22;
  uint64_t v25 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
  uint64_t v26 = (void *)qword_1BCB0;
  qword_1BCB0 = v25;
}

id GAXAppIsMobilePhoneOrFacetime(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilephone"]) {
    id v2 = &dword_0 + 1;
  }
  else {
    id v2 = [v1 isEqualToString:@"com.apple.facetime"];
  }

  return v2;
}

uint64_t GAXSessionAppsContainMobilePhoneOrFacetime(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isEqualToString:", @"com.apple.mobilephone", (void)v9) & 1) != 0
          || ([v6 isEqualToString:@"com.apple.facetime"] & 1) != 0)
        {
          uint64_t v7 = 1;
          goto LABEL_13;
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v7 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

void extractGAXBackboardStateFromMessage(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 24) = 0;
  *(void *)(a2 + 16) = 0;
  id v3 = [a1 payload];
  id v4 = [v3 objectForKey:@"GAXIPCPayloadKeyGAXBackboardState"];

  [v4 getBytes:a2 length:28];
}

id serializeGAXBackboardState(uint64_t a1)
{
  return +[NSData dataWithBytes:a1 length:28];
}

id gaxDebugDescriptionForGAXBackboardState(unsigned int *a1)
{
  id v2 = +[NSMutableString stringWithString:@"GAXBackboardState:\n"];
  objc_msgSend(v2, "appendFormat:", @"  mode: %ld\n", *a1);
  objc_msgSend(v2, "appendFormat:", @"  passcodeWindowContextID: %ld\n", a1[1]);
  objc_msgSend(v2, "appendFormat:", @"  voiceOverItemChooserWindowContextID: %ld\n", a1[2]);
  objc_msgSend(v2, "appendFormat:", @"  tripleClickSheetWindowContextID: %ld\n", a1[3]);
  objc_msgSend(v2, "appendFormat:", @"  shouldBlockAllEvents: %ld\n", a1[6] & 1);
  objc_msgSend(v2, "appendFormat:", @"  restartingAndWasActiveBeforeRestart: %ld\n", ((unint64_t)a1[6] >> 1) & 1);
  objc_msgSend(v2, "appendFormat:", @"  verifyingDeviceUnlockInSAM: %ld\n", ((unint64_t)a1[6] >> 2) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isPasscodeViewVisible: %ld\n", ((unint64_t)a1[6] >> 3) & 1);
  objc_msgSend(v2, "appendFormat:", @"  isRestricted: %ld\n", ((unint64_t)a1[6] >> 4) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchSBMiniAlertIsShowing: %ld\n", ((unint64_t)a1[6] >> 5) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchCallStateIsChanging: %ld\n", ((unint64_t)a1[6] >> 6) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideAllowsAllTouchMakingEmergencyCall: %ld\n", ((unint64_t)a1[6] >> 7) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchAllowedAppNotFound: %ld\n", ((unint64_t)a1[6] >> 8) & 1);
  objc_msgSend(v2, "appendFormat:", @"  overrideIgnoresAllTouchVerifyingIntegrity: %ld\n", ((unint64_t)a1[6] >> 9) & 1);
  objc_msgSend(v2, "appendFormat:", @"  profileConfiguration: %ld\n", a1[5]);
  objc_msgSend(v2, "appendFormat:", @"  allowsTouch: %ld\n", ((unint64_t)a1[6] >> 10) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsLockButton: %ld\n", ((unint64_t)a1[6] >> 11) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAppExit: %ld\n", ((unint64_t)a1[6] >> 12) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsHomeButton: %ld\n", ((unint64_t)a1[6] >> 13) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsVolumeButtons: %ld\n", ((unint64_t)a1[6] >> 14) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsRingerSwitch: %ld\n", ((unint64_t)a1[6] >> 15) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsMotion: %ld\n", ((unint64_t)a1[6] >> 16) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsAutolock: %ld\n", ((unint64_t)a1[6] >> 17) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsKeyboardTextInput: %ld\n", ((unint64_t)a1[6] >> 18) & 1);
  objc_msgSend(v2, "appendFormat:", @"  allowsProximity: %ld\n", ((unint64_t)a1[6] >> 19) & 1);

  return v2;
}

BOOL GAXSecTaskHasBooleanEntitlement(__SecTask *a1, void *a2)
{
  id v3 = a2;
  CFErrorRef error = 0;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(a1, v3, &error);
  if (error)
  {
    id v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      long long v11 = a1;
      __int16 v12 = 2112;
      uint64_t v13 = v3;
      __int16 v14 = 2112;
      CFErrorRef v15 = error;
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Unable to check if task %@ has entitlement %@: %@", buf, 0x20u);
    }

    CFRelease(error);
  }
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

id GAXAllowedRemoteUIProcesses()
{
  if (qword_1BCD0 != -1) {
    dispatch_once(&qword_1BCD0, &stru_150F8);
  }
  v0 = (void *)qword_1BCC8;

  return v0;
}

void sub_A4B0(id a1)
{
  v3[0] = @"com.apple.MailCompositionService";
  v3[1] = @"com.apple.mobilesms.compose";
  v3[2] = @"com.apple.MessageCompositionService";
  v3[3] = @"com.apple.social.remoteui.SocialUIService";
  v3[4] = @"com.apple.quicklook.quicklookd";
  v3[5] = @"com.apple.SafariViewService";
  v3[6] = @"com.apple.CoreAuthUI";
  v3[7] = @"com.apple.InCallService";
  v3[8] = @"com.apple.datadetectors.DDActionsService";
  v3[9] = @"com.apple.shortcuts.runtime";
  v3[10] = @"com.apple.SleepLockScreen";
  v3[11] = @"com.apple.ContactlessUIService";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  id v2 = (void *)qword_1BCC8;
  qword_1BCC8 = v1;
}

id GAXURLSchemeIsPhoneRelated(void *a1)
{
  uint64_t v1 = [a1 scheme];
  if (([v1 isEqualToString:@"tel"] & 1) != 0
    || ([v1 isEqualToString:@"facetime"] & 1) != 0)
  {
    id v2 = &dword_0 + 1;
  }
  else
  {
    id v2 = [v1 isEqualToString:@"facetime-audio"];
  }

  return v2;
}

id GAXLocalizedStringForTimeDuration(double a1)
{
  id v2 = objc_opt_new();
  [v2 setZeroFormattingBehavior:1];
  [v2 setUnitsStyle:3];
  if (a1 >= 60.0)
  {
    if ((int)a1 % 60 > 30) {
      a1 = a1 + 60.0;
    }
    uint64_t v3 = 96;
  }
  else
  {
    uint64_t v3 = 128;
  }
  [v2 setAllowedUnits:v3];
  CFTypeRef v4 = [v2 stringFromTimeInterval:a1];

  return v4;
}

void sub_AF18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not find a Guided Access key to match the supplied UIAutonomousSingleAppModeConfiguration key: %@", (uint8_t *)&v2, 0xCu);
}

void sub_AF90(NSObject *a1)
{
  int v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  sub_4CB0();
  _os_log_debug_impl(&dword_0, a1, OS_LOG_TYPE_DEBUG, "GAX Client is finishing loading:(%{public}@). Will notify GAX now.", v4, 0xCu);
}

void sub_B044(id *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*a1 _messageServiceName];
  sub_4CDC();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Server (%@) could not start its message server: %@", v6, 0x16u);
}

void sub_B0EC()
{
  sub_4CB0();
  sub_4C94(&dword_0, v0, v1, "client could not shut down its message server gracefully: %@", v2, v3, v4, v5, v6);
}

void sub_B154()
{
  sub_4CB0();
  sub_4C94(&dword_0, v0, v1, "client could not disconnect from backboard: %@", v2, v3, v4, v5, v6);
}

void sub_B1BC()
{
  sub_4CB0();
  sub_4C94(&dword_0, v0, v1, "unable to determine if rect is in ignored region, assuming NO: %@", v2, v3, v4, v5, v6);
}

void sub_B224()
{
  sub_4CDC();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "could not send message to backboard: %@ (%@)", v2, 0x16u);
}

void sub_B2A0(const char *a1)
{
  sel_getName(a1);
  sub_4CB0();
  sub_4CBC(&dword_0, v1, v2, "unable to connect to backboardd for %s", v3, v4, v5, v6, v7);
}

void sub_B318(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "unknown style %d! using AAC with profile fallback to recover.", (uint8_t *)v2, 8u);
}

void sub_B390(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B400(int a1, NSObject *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error received from backboard requesting AX features enabled/disabled: %{public}d", (uint8_t *)v2, 8u);
}

void sub_B478()
{
  sub_4CB0();
  sub_4C94(&dword_0, v0, v1, "error requesting AX features reset: %{public}@", v2, v3, v4, v5, v6);
}

void sub_B4E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "client could not get path data from server message", v1, 2u);
}

void sub_B524(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B59C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_8B9C(&dword_0, a1, a3, "gax is enabled, current session = %@", a5, a6, a7, a8, 2u);
}

void sub_B614(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "nilling currently active session.", v1, 2u);
}

void sub_B658(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Unable to continue with context menu configuration: %@", (uint8_t *)&v2, 0xCu);
}

void sub_B6D0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unexpected format for context menu contents: isImage %@, isLink %@", (uint8_t *)&v3, 0x16u);
}

void sub_B758(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No fallback value was registered for profile key: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLogValidations()
{
  return _AXLogValidations();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return _AXPerformBlockSynchronouslyOnMainThread();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXProcessIsAXUIServer()
{
  return _AXProcessIsAXUIServer();
}

uint64_t AXUIConvertRectFromScreenToContextSpace()
{
  return _AXUIConvertRectFromScreenToContextSpace();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return _CGAffineTransformIsIdentity(t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

uint64_t GAXLogCommon()
{
  return _GAXLogCommon();
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return _SecTaskCreateFromSelf(allocator);
}

BOOL UIAccessibilityIsGuidedAccessEnabled(void)
{
  return _UIAccessibilityIsGuidedAccessEnabled();
}

uint64_t UIGuidedAccessSetConfigureAccessibilityFeaturesEnabledCallback()
{
  return _UIGuidedAccessSetConfigureAccessibilityFeaturesEnabledCallback();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return _UIKeyboardAutomaticIsOnScreen();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return __AXSGuidedAccessRequiresApplicationAccessibility();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIApplicationIsExtension()
{
  return __UIApplicationIsExtension();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return ___ax_verbose_encode_with_type_encoding_group_class();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__gaxBeginOverridingBackgroundColorToClear(void *a1, const char *a2, ...)
{
  return [a1 _gaxBeginOverridingBackgroundColorToClear];
}

id objc_msgSend__gaxEndOverridingBackgroundColorToClear(void *a1, const char *a2, ...)
{
  return [a1 _gaxEndOverridingBackgroundColorToClear];
}

id objc_msgSend__gaxIsInTestingScenario(void *a1, const char *a2, ...)
{
  return [a1 _gaxIsInTestingScenario];
}

id objc_msgSend__gaxOriginalBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _gaxOriginalBackgroundColor];
}

id objc_msgSend__gaxOverridingBackgroundColorToClearRequestsCount(void *a1, const char *a2, ...)
{
  return [a1 _gaxOverridingBackgroundColorToClearRequestsCount];
}

id objc_msgSend__guidedAccessDictionaryLookupAllowed(void *a1, const char *a2, ...)
{
  return [a1 _guidedAccessDictionaryLookupAllowed];
}

id objc_msgSend__guidedAccessRestrictionDelegate(void *a1, const char *a2, ...)
{
  return [a1 _guidedAccessRestrictionDelegate];
}

id objc_msgSend__initializeBackboardClient(void *a1, const char *a2, ...)
{
  return [a1 _initializeBackboardClient];
}

id objc_msgSend__isAnyWindowRotating(void *a1, const char *a2, ...)
{
  return [a1 _isAnyWindowRotating];
}

id objc_msgSend__messageServiceName(void *a1, const char *a2, ...)
{
  return [a1 _messageServiceName];
}

id objc_msgSend__notifyGuidedAccessClientDidLoad(void *a1, const char *a2, ...)
{
  return [a1 _notifyGuidedAccessClientDidLoad];
}

id objc_msgSend_activeInstance(void *a1, const char *a2, ...)
{
  return [a1 activeInstance];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_allowsKeyboardTextInput(void *a1, const char *a2, ...)
{
  return [a1 allowsKeyboardTextInput];
}

id objc_msgSend_allowsMotion(void *a1, const char *a2, ...)
{
  return [a1 allowsMotion];
}

id objc_msgSend_appServer(void *a1, const char *a2, ...)
{
  return [a1 appServer];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asynchronouslyPresentGuidedAccessActiveBanner(void *a1, const char *a2, ...)
{
  return [a1 asynchronouslyPresentGuidedAccessActiveBanner];
}

id objc_msgSend_backboardClient(void *a1, const char *a2, ...)
{
  return [a1 backboardClient];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentlyActiveSession(void *a1, const char *a2, ...)
{
  return [a1 currentlyActiveSession];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismissKeyboard(void *a1, const char *a2, ...)
{
  return [a1 dismissKeyboard];
}

id objc_msgSend_effectiveConfiguration(void *a1, const char *a2, ...)
{
  return [a1 effectiveConfiguration];
}

id objc_msgSend_evaluateExistingBinaries(void *a1, const char *a2, ...)
{
  return [a1 evaluateExistingBinaries];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_guidedAccessRestrictionIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessRestrictionIdentifiers];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInWorkspace(void *a1, const char *a2, ...)
{
  return [a1 isInWorkspace];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return [a1 isLoaded];
}

id objc_msgSend_isRotating(void *a1, const char *a2, ...)
{
  return [a1 isRotating];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 mainAccessQueue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_managedConfigurationSettings(void *a1, const char *a2, ...)
{
  return [a1 managedConfigurationSettings];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_propertiesAsDictionary(void *a1, const char *a2, ...)
{
  return [a1 propertiesAsDictionary];
}

id objc_msgSend_providesViewServices(void *a1, const char *a2, ...)
{
  return [a1 providesViewServices];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_replayer(void *a1, const char *a2, ...)
{
  return [a1 replayer];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serverMode(void *a1, const char *a2, ...)
{
  return [a1 serverMode];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldShowKeyboardsInViewServices(void *a1, const char *a2, ...)
{
  return [a1 shouldShowKeyboardsInViewServices];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_validateAndInstall(void *a1, const char *a2, ...)
{
  return [a1 validateAndInstall];
}

id objc_msgSend_verifyConnectionExists(void *a1, const char *a2, ...)
{
  return [a1 verifyConnectionExists];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowLevel(void *a1, const char *a2, ...)
{
  return [a1 windowLevel];
}