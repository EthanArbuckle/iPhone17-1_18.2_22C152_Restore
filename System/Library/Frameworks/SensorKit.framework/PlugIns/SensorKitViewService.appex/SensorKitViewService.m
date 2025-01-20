NSBundle *sub_100003264(uint64_t a1, _OWORD *a2)
{
  long long v3;
  NSBundle *result;
  NSBundle *v5;
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  _OWORD v12[2];

  self;
  v3 = a2[1];
  v12[0] = *a2;
  v12[1] = v3;
  result = (NSBundle *)sub_100003418((uint64_t)NSURL, v12);
  if (result)
  {
    v5 = result;
    v6 = (id)_CFBundleCopyBundleURLForExecutableURL();
    if (v6)
    {
      v7 = v6;
      result = +[NSBundle bundleWithURL:v6];
      if (result) {
        return result;
      }
      if (qword_1000161C8 != -1) {
        dispatch_once(&qword_1000161C8, &stru_100010398);
      }
      v8 = qword_1000161C0;
      if (!os_log_type_enabled((os_log_t)qword_1000161C0, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      LODWORD(v12[0]) = 138543362;
      *(void *)((char *)v12 + 4) = v7;
      v9 = "Could not create bundle for bundle URL %{public}@";
      v10 = v8;
    }
    else
    {
      if (qword_1000161C8 != -1) {
        dispatch_once(&qword_1000161C8, &stru_100010398);
      }
      v11 = qword_1000161C0;
      if (!os_log_type_enabled((os_log_t)qword_1000161C0, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      LODWORD(v12[0]) = 138543362;
      *(void *)((char *)v12 + 4) = v5;
      v9 = "Could not get bundle URL for executable URL %{public}@";
      v10 = v11;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)v12, 0xCu);
    return 0;
  }
  return result;
}

void sub_1000033E8(id a1)
{
  qword_1000161C0 = (uint64_t)os_log_create("com.apple.SensorKit", "NSBundleSKInternal");
}

NSURL *sub_100003418(uint64_t a1, _OWORD *a2)
{
  self;
  bzero(buffer, 0x400uLL);
  long long v3 = a2[1];
  *(_OWORD *)v10.val = *a2;
  *(_OWORD *)&v10.val[4] = v3;
  if (proc_pidpath_audittoken(&v10, buffer, 0x400u) <= 0)
  {
    if (qword_1000161D8 != -1) {
      dispatch_once(&qword_1000161D8, &stru_1000103B8);
    }
    uint64_t v9 = qword_1000161D0;
    if (!os_log_type_enabled((os_log_t)qword_1000161D0, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 68157954;
    LODWORD(v12[0]) = 32;
    WORD2(v12[0]) = 2096;
    *(void *)((char *)v12 + 6) = a2;
    v6 = "Cannot determine path for audit token %.*P";
    v7 = v9;
    uint32_t v8 = 18;
    goto LABEL_13;
  }
  result = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithUTF8String:buffer]);
  if (result) {
    return result;
  }
  if (qword_1000161D8 != -1) {
    dispatch_once(&qword_1000161D8, &stru_1000103B8);
  }
  uint64_t v5 = qword_1000161D0;
  if (os_log_type_enabled((os_log_t)qword_1000161D0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v12[0] = buffer;
    v6 = "Could not create URL for path %{public}s";
    v7 = v5;
    uint32_t v8 = 12;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
  }
  return 0;
}

NSURL *sub_1000035D0()
{
  self;

  return +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/ALMANAC"];
}

NSURL *sub_100003608()
{
  self;

  return +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/ALMANAC#OPEN_ENABLE_SENSORKIT"];
}

void sub_100003640(id a1)
{
  qword_1000161D0 = (uint64_t)os_log_create("com.apple.SensorKit", "NSURLSK");
}

id sub_100003B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "authState"), "objectAtIndexedSubscript:", a3), "BOOLValue");
  id v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "services"), "objectAtIndexedSubscript:", a3);
  uint64_t v7 = 48;
  if (v5) {
    uint64_t v7 = 40;
  }
  uint32_t v8 = *(void **)(a1 + v7);

  return [v8 addObject:v6];
}

id sub_100003C0C(uint64_t a1, void *a2)
{
  uint64_t v18 = 0;
  v4 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:"), @"%@", &v18, objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "appBundle"), "sk_studyName"));
  if (!v4)
  {
    unsigned int v5 = qword_1000161E0;
    if (os_log_type_enabled((os_log_t)qword_1000161E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 32) addHeaderToStackView:*(void *)(a1 + 40) withSpacing:v4 text:16.0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = a2;
  id result = [a2 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        v12 = [[SRBulletedListItem alloc] initWithTitle:[+[SRAuthorizationGroup authorizationGroupWithServiceName:v10] localizedDisplayName] description:0 image:*(void *)(a1 + 48) textStyle:UIFontTextStyleBody];
        [*(id *)(a1 + 40) addArrangedSubview:v12];
        objc_msgSend(*(id *)(a1 + 40), "setCustomSpacing:afterView:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "arrangedSubviews"), "lastObject"), 16.0);

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
      id v7 = result;
    }
    while (result);
  }
  return result;
}

id sub_100003FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "services"), "objectAtIndexedSubscript:", a3);
  if (result)
  {
    id v6 = result;
    id v7 = [*(id *)(a1 + 32) authStore];
    id v8 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "appBundle"), "bundleIdentifier");
    id v9 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "authState"), "objectAtIndexedSubscript:", a3), "BOOLValue");
    return [v7 setAuthorizationForBundleId:v8 service:v6 value:v9];
  }
  return result;
}

UIButton *sub_100004528()
{
  v0 = +[UIButton buttonWithType:1];
  [(UILabel *)[(UIButton *)v0 titleLabel] setAdjustsFontSizeToFitWidth:1];
  [(UIButton *)v0 setBackgroundImage:sub_1000046C0(+[UIColor tertiarySystemFillColor]) forState:0];
  [(UIButton *)v0 setBackgroundImage:sub_1000046C0(+[UIColor tertiarySystemFillColor]) forState:2];
  [(UIButton *)v0 setBackgroundImage:sub_1000046C0(+[UIColor tertiarySystemFillColor]) forState:1];
  [(UIButton *)v0 setClipsToBounds:1];
  objc_msgSend(-[UIButton layer](v0, "layer"), "setCornerRadius:", 14.0);
  [(UILabel *)[(UIButton *)v0 titleLabel] setFont:+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", [+[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody] fontDescriptorWithSymbolicTraits:2], 0.0)];
  [(UILabel *)[(UIButton *)v0 titleLabel] setTextColor:+[UIColor systemBlueColor]];
  return v0;
}

UIImage *sub_1000046C0(void *a1)
{
  v4.width = 1.0;
  v4.height = 1.0;
  UIGraphicsBeginImageContext(v4);
  [a1 set];
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 1.0;
  v5.size.height = 1.0;
  UIRectFill(v5);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

void sub_100005150(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000051C8;
  block[3] = &unk_100010458;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000051C8(uint64_t a1)
{
  id v2 = +[OBBoldTrayButton boldButton];
  objc_msgSend(objc_msgSend(v2, "titleLabel"), "setLineBreakMode:", 0);
  objc_msgSend(objc_msgSend(v2, "titleLabel"), "setNumberOfLines:", 0);
  objc_msgSend(v2, "setTitle:forState:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 67), 0);
  [v2 addTarget:*(void *)(a1 + 32) action:"openSettings:" forControlEvents:64];
  id v3 = [*(id *)(a1 + 32) buttonTray];

  return [v3 addButton:v2];
}

uint64_t sub_1000054A4(uint64_t a1, int a2, uint64_t a3)
{
  CGSize v4 = qword_1000161E8;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Follow up item posted successfully", (uint8_t *)&v7, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000161E8, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    uint64_t v8 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to post follow up item because %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000058E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100005910(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak prerequesiteNotificationReceived];
}

id sub_1000064A4(id result)
{
  v1 = (void *)*((void *)result + 4);
  if (v1)
  {
    id v2 = +[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", [*((id *)result + 4) requestedServices]);
    id v3 = objc_msgSend(objc_msgSend(objc_msgSend(v1, "authorizationStore"), "readerAuthorizationValues"), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(v1, "appBundle"), "bundleIdentifier"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v31;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v31 != v6) {
            objc_enumerationMutation(v3);
          }
          [(NSMutableSet *)v2 removeObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        id v5 = [v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v5);
    }
    v25 = v1;
    id v8 = +[NSMutableSet set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v2);
          }
          uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v12);
          id v15 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v13), "authorizationService");
          if (v15)
          {
            [v8 addObject:v15];
          }
          else
          {
            long long v16 = qword_1000161F0;
            if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v38 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Don't know how to request authorization for sensor %{public}@", buf, 0xCu);
            }
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v10);
    }
    if ([v8 count])
    {
      if ([+[SRAuthorizationClient sharedInstance] dataCollectionEnabled])
      {
        long long v17 = -[SRAuthorizationTable initWithServices:appBundle:authStore:migrationMode:]([SRAuthorizationTable alloc], "initWithServices:appBundle:authStore:migrationMode:", +[NSArray skui_sortedServices:](NSArray, "skui_sortedServices:", [v8 allObjects]), objc_msgSend(v25, "appBundle"), objc_msgSend(v25, "authorizationStore"), objc_msgSend(v25, "migrationMode"));
        [(SRAuthorizationTable *)v17 setDelegate:v25];
        sub_100006BEC(v25, (uint64_t)v17);
      }
      else
      {
        id v19 = +[NSString srui_localizedStringForCode:80];
        id v20 = objc_msgSend(objc_msgSend(v25, "appBundle"), "sk_appName");
        id v21 = +[NSString srui_localizedStringForCode:81];
        uint64_t v34 = 0;
        v22 = +[NSString stringWithValidatedFormat:v21, @"%@", &v34, v20 validFormatSpecifiers error];
        if (!v22)
        {
          v23 = qword_1000161F0;
          if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v38 = v34;
            _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
          }
        }
        v24 = [[SREnableSensorKitController alloc] initWithTitle:v19 detailText:v22 icon:+[UIImage skui_imageNamed:bundle:imageDescriptor:](UIImage, "skui_imageNamed:bundle:imageDescriptor:", @"SensorKit", +[NSBundle skui_bundle](NSBundle, "skui_bundle"), +[ISImageDescriptor skui_imageDescriptorForAuthorization])];
        -[SREnableSensorKitController setAppBundle:](v24, "setAppBundle:", [v25 appBundle]);
        -[SREnableSensorKitController setServices:](v24, "setServices:", +[NSArray skui_sortedServices:](NSArray, "skui_sortedServices:", [v8 allObjects]));
        [(SREnableSensorKitController *)v24 setDelegate:v25];
        -[SREnableSensorKitController setAuthStore:](v24, "setAuthStore:", [v25 authorizationStore]);
        -[SREnableSensorKitController setMigrationMode:](v24, "setMigrationMode:", [v25 migrationMode]);
        sub_100006BEC(v25, (uint64_t)v24);
      }
      return [v25 setAuthorizationStore:0];
    }
    else
    {
      uint64_t v18 = qword_1000161F0;
      if (os_log_type_enabled((os_log_t)qword_1000161F0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No new auth groups request. Exiting prompt", buf, 2u);
      }
      objc_msgSend(v25, "setError:", +[SRError errorWithCode:](SRError, "errorWithCode:", 8201));
      return -[SRAuthorizationPromptViewController authorizationTableCompletedPromptSuccessfully:]_0(v25);
    }
  }
  return result;
}

id sub_100006BEC(void *a1, uint64_t a2)
{
  if ([a1 error])
  {
    id v4 = [a1 _remoteViewControllerProxy];
    id v5 = [a1 error];
    return [v4 authorizationRequestFailedWithError:v5];
  }
  else
  {
    [a1 pushViewController:a2 animated:0];
    objc_msgSend(objc_msgSend(a1, "navigationBar"), "setPrefersLargeTitles:", 0);
    id v7 = [a1 _remoteViewControllerProxy];
    return [v7 authorizationUIReadyForDisplayModally:1];
  }
}

void sub_100006EF4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = [[SRFirstRunOnboardingController alloc] initWithTitle:+[NSString srui_localizedStringForCode:79] detailText:0 icon:0];
    [(SRFirstRunOnboardingController *)v2 setDelegate:v1];
    sub_100006BEC(v1, (uint64_t)v2);
  }
}

void sub_10000800C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100008034(uint64_t a1)
{
  v1 = (uint64_t (*)(void))*((void *)[objc_loadWeak((id *)(a1 + 32)) cancelHandler] + 2);

  return v1();
}

void sub_10000905C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_100009080(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak completePrompt];
}

id sub_1000090AC(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak cancelPrompt];
}

void sub_100009364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000093A0(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak completePrompt];
}

id sub_1000093CC(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak cancelPrompt];
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void UIRectFill(CGRect rect)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__updateImageViewLayout(void *a1, const char *a2, ...)
{
  return [a1 _updateImageViewLayout];
}

id objc_msgSend_addNextButton(void *a1, const char *a2, ...)
{
  return [a1 addNextButton];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appBundle(void *a1, const char *a2, ...)
{
  return [a1 appBundle];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviews];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authIndex(void *a1, const char *a2, ...)
{
  return [a1 authIndex];
}

id objc_msgSend_authState(void *a1, const char *a2, ...)
{
  return [a1 authState];
}

id objc_msgSend_authStore(void *a1, const char *a2, ...)
{
  return [a1 authStore];
}

id objc_msgSend_authorizationRequestCompleted(void *a1, const char *a2, ...)
{
  return [a1 authorizationRequestCompleted];
}

id objc_msgSend_authorizationService(void *a1, const char *a2, ...)
{
  return [a1 authorizationService];
}

id objc_msgSend_authorizationStore(void *a1, const char *a2, ...)
{
  return [a1 authorizationStore];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_cancelHandler(void *a1, const char *a2, ...)
{
  return [a1 cancelHandler];
}

id objc_msgSend_categorySubTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 categorySubTitleLabel];
}

id objc_msgSend_categoryTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 categoryTitleLabel];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAuthGroup(void *a1, const char *a2, ...)
{
  return [a1 currentAuthGroup];
}

id objc_msgSend_dataCollectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 dataCollectionEnabled];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptionLabel(void *a1, const char *a2, ...)
{
  return [a1 descriptionLabel];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstButton(void *a1, const char *a2, ...)
{
  return [a1 firstButton];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageContainer(void *a1, const char *a2, ...)
{
  return [a1 imageContainer];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_legacyName(void *a1, const char *a2, ...)
{
  return [a1 legacyName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_loadPrivacy(void *a1, const char *a2, ...)
{
  return [a1 loadPrivacy];
}

id objc_msgSend_loadTurnOn(void *a1, const char *a2, ...)
{
  return [a1 loadTurnOn];
}

id objc_msgSend_loadWelcome(void *a1, const char *a2, ...)
{
  return [a1 loadWelcome];
}

id objc_msgSend_localizedDisplayName(void *a1, const char *a2, ...)
{
  return [a1 localizedDisplayName];
}

id objc_msgSend_localizedPlatforms(void *a1, const char *a2, ...)
{
  return [a1 localizedPlatforms];
}

id objc_msgSend_migrationMode(void *a1, const char *a2, ...)
{
  return [a1 migrationMode];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_prepareContentView(void *a1, const char *a2, ...)
{
  return [a1 prepareContentView];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_publicEntitlementValue(void *a1, const char *a2, ...)
{
  return [a1 publicEntitlementValue];
}

id objc_msgSend_readerAuthorizationValues(void *a1, const char *a2, ...)
{
  return [a1 readerAuthorizationValues];
}

id objc_msgSend_registerForPrerequisitesUpdated(void *a1, const char *a2, ...)
{
  return [a1 registerForPrerequisitesUpdated];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requestedServices(void *a1, const char *a2, ...)
{
  return [a1 requestedServices];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_secondButton(void *a1, const char *a2, ...)
{
  return [a1 secondButton];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return [a1 semanticContentAttribute];
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return [a1 separatorInset];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return [a1 stackView];
}

id objc_msgSend_stackViewLeadingConstraintHorizontal(void *a1, const char *a2, ...)
{
  return [a1 stackViewLeadingConstraintHorizontal];
}

id objc_msgSend_stackViewLeadingConstraintVertical(void *a1, const char *a2, ...)
{
  return [a1 stackViewLeadingConstraintVertical];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tertiarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 tertiarySystemFillColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unregisterForPrerequisitesUpdated(void *a1, const char *a2, ...)
{
  return [a1 unregisterForPrerequisitesUpdated];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}