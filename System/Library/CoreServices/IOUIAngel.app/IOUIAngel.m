void sub_1000021F4(id a1)
{
  uint64_t vars8;

  qword_1000130E0 = objc_alloc_init(IOUIAngelServer);

  _objc_release_x1();
}

void sub_100002308(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.IOUIAngel"];
  [v3 setService:@"com.apple.IOUIAngel.LDCM-service"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

void sub_1000024A8(id a1)
{
  id v4 = +[BSMutableServiceInterface interfaceWithIdentifier:@"com.apple.IOUIAngel.LDCM-service"];
  v1 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___IOUIAngelServiceServerInterface];
  [v4 setServer:v1];

  [v4 setClientMessagingExpectation:0];
  id v2 = [v4 copy];
  id v3 = (void *)qword_1000130F0;
  qword_1000130F0 = (uint64_t)v2;
}

void sub_100002734(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v5, "setUserInfo:");
  }
  id v3 = +[IOUIAngelServer serviceInterface];
  [v5 setInterface:v3];

  [v5 setInterfaceTarget:*(void *)(a1 + 40)];
  id v4 = +[BSServiceQuality userInitiated];
  [v5 setServiceQuality:v4];

  [v5 setInvalidationHandler:&stru_10000C3F0];
}

void sub_100002A38(uint64_t a1)
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100002BD0;
  v15 = sub_100002BE0;
  id v16 = 0;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 20))
  {
    id v2 = objc_opt_new();
    id v3 = [v2 uiSceneSessionRole];
    id v4 = +[UISceneSessionActivationRequest requestWithRole:v3];

    id v5 = +[UIApplication sharedApplication];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100002BE8;
    v8[3] = &unk_10000C440;
    id v6 = v4;
    id v9 = v6;
    v10 = &v11;
    [v5 activateSceneSessionForRequest:v6 errorHandler:v8];

    *(unsigned char *)(*(void *)(a1 + 32) + 20) = 1;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v12[5]);
  }
  _Block_object_dispose(&v11, 8);
}

void sub_100002BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002BD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002BE0(uint64_t a1)
{
}

void sub_100002BE8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000065B8(a1, (uint64_t)v4);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Activated scene! (request: %@)", (uint8_t *)&v6, 0xCu);
  }
}

void sub_100002E28(uint64_t a1)
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100002BD0;
  v30 = sub_100002BE0;
  id v31 = 0;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 20))
  {
    v1 = +[UIApplication sharedApplication];
    id v2 = [v1 connectedScenes];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v2;
    id v3 = [obj countByEnumeratingWithState:&v22 objects:v36 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v23;
      *(void *)&long long v4 = 138412546;
      long long v18 = v4;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v23 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v8 = objc_msgSend(v7, "session", v18);
          id v9 = [v8 role];
          v10 = objc_opt_new();
          uint64_t v11 = [v10 uiSceneSessionRole];
          unsigned int v12 = [v9 isEqual:v11];

          if (v12)
          {
            id v13 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v14 = [v7 session];
              *(_DWORD *)buf = v18;
              v33 = v7;
              __int16 v34 = 2112;
              v35 = v14;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Destroying scene session... (scene: %@, scene.session: %@)", buf, 0x16u);
            }
            v15 = +[UIApplication sharedApplication];
            id v16 = [v7 session];
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100003188;
            v21[3] = &unk_10000C490;
            v21[4] = v7;
            v21[5] = &v26;
            [v15 requestSceneSessionDestruction:v16 options:0 errorHandler:v21];

            *(unsigned char *)(*(void *)(a1 + 32) + 20) = 0;
          }
        }
        id v3 = [obj countByEnumeratingWithState:&v22 objects:v36 count:16];
      }
      while (v3);
    }
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, v27[5]);
  }
  _Block_object_dispose(&v26, 8);
}

void sub_100003154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100003188(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006648((uint64_t)v4);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) session];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Destroyed scene session! (scene.session: %@)", (uint8_t *)&v6, 0xCu);
  }
}

void sub_100003A04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100003D04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 handleButtonAction:*(void *)(a1 + 32)];
  }
}

id sub_100003DFC(void *a1, void *a2)
{
  uint64_t v3 = qword_100013108;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&qword_100013108, &stru_10000C4D8);
  }
  int v6 = +[UITraitCollection currentTraitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];

  id v8 = [(id)qword_100013100 indexOfObject:v7];
  id v9 = [(id)qword_100013100 indexOfObject:v4];

  if (v9 >= v8) {
    id v10 = v8;
  }
  else {
    id v10 = v9;
  }
  uint64_t v11 = [(id)qword_100013100 objectAtIndexedSubscript:v10];
  unsigned int v12 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v11];
  id v13 = +[UIFont preferredFontForTextStyle:v5 compatibleWithTraitCollection:v12];

  return v13;
}

void sub_100003F24(id a1)
{
  v3[0] = UIContentSizeCategoryExtraSmall;
  v3[1] = UIContentSizeCategorySmall;
  v3[2] = UIContentSizeCategoryMedium;
  v3[3] = UIContentSizeCategoryLarge;
  v3[4] = UIContentSizeCategoryExtraLarge;
  v3[5] = UIContentSizeCategoryExtraExtraLarge;
  v3[6] = UIContentSizeCategoryExtraExtraExtraLarge;
  v3[7] = UIContentSizeCategoryAccessibilityMedium;
  v3[8] = UIContentSizeCategoryAccessibilityLarge;
  v3[9] = UIContentSizeCategoryAccessibilityExtraLarge;
  v3[10] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  v3[11] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  v3[12] = UIContentSizeCategoryUnspecified;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:13];
  id v2 = (void *)qword_100013100;
  qword_100013100 = v1;
}

void sub_100004A68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_1000069B0((uint64_t)v3);
    if (v3) {
      goto LABEL_3;
    }
  }
  else if (v3)
  {
LABEL_3:
    [v3 setDelegate:*(void *)(a1 + 32)];
    [v3 setModalPresentationStyle:0];
    [v3 setModalTransitionStyle:2];
    [*(id *)(a1 + 32) setEmergencyCallHostVC:v3];
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 emergencyCallHostVC];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004B90;
    v6[3] = &unk_10000C500;
    v6[4] = *(void *)(a1 + 32);
    [v4 presentViewController:v5 animated:1 completion:v6];

    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006968();
  }
LABEL_7:
}

void sub_100004B90(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Presented emergency call view controller!", v5, 2u);
  }
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 emergencyDialerWasPresented:*(void *)(a1 + 32)];
  }
}

void sub_100004CF4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dismissed emergency call view controller!", v5, 2u);
  }
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 emergencyDialerWasDismissed:*(void *)(a1 + 32)];
  }
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = +[IOUIAngelServer sharedServer];
  [v7 activate];

  uint64_t v8 = UIApplicationMain(a1, a2, 0, v6);

  return v8;
}

uint64_t sub_10000650C()
{
  return _AnalyticsSendEvent(@"com.apple.CoreIO.CriticalUI.displayed", 0);
}

void sub_10000651C(uint64_t a1, uint64_t a2)
{
  int v2 = 136315650;
  char v3 = "-[IOUIAngelServer listener:didReceiveConnection:withContext:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Rejecting connection: %@ (process does not have entitlement: %@)", (uint8_t *)&v2, 0x20u);
}

void sub_1000065B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error activating scene! (request: %@, error: %@)", (uint8_t *)&v3, 0x16u);
}

void sub_100006648(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error destroying scene session: %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000066C8()
{
  sub_100003A20();
  sub_100003A04((void *)&_mh_execute_header, &_os_log_default, v0, "sceneDidDisconnect... (scene: %@)", v1, v2, v3, v4, v5);
}

void sub_100006738()
{
  sub_100003A20();
  sub_100003A04((void *)&_mh_execute_header, &_os_log_default, v0, "sceneDidBecomeActive... (scene: %@)", v1, v2, v3, v4, v5);
}

void sub_1000067A8()
{
  sub_100003A20();
  sub_100003A04((void *)&_mh_execute_header, &_os_log_default, v0, "sceneWillResignActive... (scene: %@)", v1, v2, v3, v4, v5);
}

void sub_100006818()
{
  sub_100003A20();
  sub_100003A04((void *)&_mh_execute_header, &_os_log_default, v0, "sceneWillEnterForeground... (scene: %@)", v1, v2, v3, v4, v5);
}

void sub_100006888()
{
  sub_100003A20();
  sub_100003A04((void *)&_mh_execute_header, &_os_log_default, v0, "sceneDidEnterBackground... (scene: %@)", v1, v2, v3, v4, v5);
}

void sub_1000068F8()
{
  sub_100003A20();
  sub_100003A04((void *)&_mh_execute_header, &_os_log_default, v0, "playOptions: %@", v1, v2, v3, v4, v5);
}

void sub_100006968()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create emergency call view controller!", v0, 2u);
}

void sub_1000069B0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "requestEmergencyCallControllerWithCompletion: (emergencyCallController: %@)", (uint8_t *)&v1, 0xCu);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return _AudioServicesPlaySystemSoundWithOptions();
}

uint64_t AudioServicesStopSystemSound()
{
  return _AudioServicesStopSystemSound();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__createBackdropView(void *a1, const char *a2, ...)
{
  return [a1 _createBackdropView];
}

id objc_msgSend__createHeaderLabel(void *a1, const char *a2, ...)
{
  return [a1 _createHeaderLabel];
}

id objc_msgSend__createMessageLabel(void *a1, const char *a2, ...)
{
  return [a1 _createMessageLabel];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return [a1 alphaComponent];
}

id objc_msgSend_backdropView(void *a1, const char *a2, ...)
{
  return [a1 backdropView];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return [a1 blueColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return [a1 button];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_configurationPreferringMulticolor(void *a1, const char *a2, ...)
{
  return [a1 configurationPreferringMulticolor];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return [a1 connectedScenes];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_criticalUIView(void *a1, const char *a2, ...)
{
  return [a1 criticalUIView];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return [a1 currentContext];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_debugViews(void *a1, const char *a2, ...)
{
  return [a1 debugViews];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dismissEmergencyDialer(void *a1, const char *a2, ...)
{
  return [a1 dismissEmergencyDialer];
}

id objc_msgSend_emergencyCallHostVC(void *a1, const char *a2, ...)
{
  return [a1 emergencyCallHostVC];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return [a1 greenColor];
}

id objc_msgSend_headerLabel(void *a1, const char *a2, ...)
{
  return [a1 headerLabel];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_inputSettings(void *a1, const char *a2, ...)
{
  return [a1 inputSettings];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_messageLabel(void *a1, const char *a2, ...)
{
  return [a1 messageLabel];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_playSound(void *a1, const char *a2, ...)
{
  return [a1 playSound];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentEmergencyDialer(void *a1, const char *a2, ...)
{
  return [a1 presentEmergencyDialer];
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return [a1 readableContentGuide];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return [a1 remoteProcess];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_serviceInterface(void *a1, const char *a2, ...)
{
  return [a1 serviceInterface];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_soundPlaying(void *a1, const char *a2, ...)
{
  return [a1 soundPlaying];
}

id objc_msgSend_stopSound(void *a1, const char *a2, ...)
{
  return [a1 stopSound];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
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

id objc_msgSend_uiSceneSessionRole(void *a1, const char *a2, ...)
{
  return [a1 uiSceneSessionRole];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return [a1 userInitiated];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}