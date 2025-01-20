uint64_t sub_1000046C0()
{
  uint64_t vars8;

  qword_1000175B0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100005EAC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 communicateButtonPressWithButtonDisposition:1];
}

void sub_100005EF4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 communicateButtonPressWithButtonDisposition:2];
}

void sub_100005F3C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 communicateButtonPressWithButtonDisposition:3];
}

void sub_100006F30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000086C0();
    }
  }
  v6 = [*(id *)(a1 + 40) delegate];
  [v6 communicateButtonPressWithButtonDisposition:3];
}

void sub_10000719C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000071CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000071FC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id sub_1000072E4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007384;
  block[3] = &unk_100010328;
  block[4] = a1;
  if (qword_1000175C8 != -1) {
    dispatch_once(&qword_1000175C8, block);
  }
  id v1 = off_100017488;

  return v1;
}

uint64_t sub_100007384(uint64_t a1)
{
  off_100017488 = os_log_create(*(const char **)(a1 + 32), "app-deletion-ui-host-app");

  return _objc_release_x1();
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_1000076B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000072E4((uint64_t)off_100017300);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[AppDeletionUISceneDelegate connectToInvokerEndpoint:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Presenter connection event", (uint8_t *)&v12, 0xCu);
  }

  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v8 = xpc_dictionary_get_value(v3, "invalidate");
    if (v8)
    {
      uint64_t v9 = sub_1000072E4((uint64_t)off_100017300);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "-[AppDeletionUISceneDelegate connectToInvokerEndpoint:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Dismissing remote alert", (uint8_t *)&v12, 0xCu);
      }

      [*(id *)(a1 + 32) _dismissAlert:xpc_BOOL_get_value(v8)];
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    v10 = sub_1000072E4((uint64_t)off_100017300);
    v11 = v10;
    if (v3 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "-[AppDeletionUISceneDelegate connectToInvokerEndpoint:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: PresenterConnection invalidated", (uint8_t *)&v12, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_100008740((uint64_t)v3, v11);
    }
  }
  else
  {
    v6 = xpc_copy_description(v3);
    uint64_t v7 = sub_1000072E4((uint64_t)off_100017300);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000087CC((uint64_t)v6, v7);
    }

    free(v6);
  }
}

id sub_100007DA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationHeightForSheet];
}

void sub_100007FCC(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingVC];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008060;
  v3[3] = &unk_1000103F0;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

id sub_100008060(uint64_t a1)
{
  return [*(id *)(a1 + 32) _communicateAlertInvalidate];
}

void sub_100008214(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000828C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008304()
{
  sub_1000071E8();
  sub_1000071CC((void *)&_mh_execute_header, v0, v1, "%s: Did not receive the number of apps installed via %@!", v2, v3, v4, v5, 2u);
}

void sub_10000837C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000083F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000846C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000084E4()
{
  sub_1000071B8();
  sub_1000071CC((void *)&_mh_execute_header, v0, v1, "%s: Failed to initialize icon for bundleID %@", v2, v3, v4, v5, 2u);
}

void sub_100008558()
{
  int v2 = 136315650;
  sub_1000071B8();
  sub_1000071FC((void *)&_mh_execute_header, v0, v1, "%s: Failed to get CGImageRef from ISImage %@ for bundleID %@", v2);
}

void sub_1000085D4()
{
  sub_1000071B8();
  sub_1000071CC((void *)&_mh_execute_header, v0, v1, "%s: Failed to initialize UIImage for bundleID %@", v2, v3, v4, v5, 2u);
}

void sub_100008648(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000086C0()
{
  int v2 = 136315650;
  sub_1000071E8();
  sub_1000071FC((void *)&_mh_execute_header, v0, v1, "%s: Failed to open URL %@: %@", v2);
}

void sub_100008740(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[AppDeletionUISceneDelegate connectToInvokerEndpoint:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Got XPC error on listenerConnection handler: %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000087CC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[AppDeletionUISceneDelegate connectToInvokerEndpoint:]_block_invoke";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Got unknown XPC event on listenerConnection handler: %s", (uint8_t *)&v2, 0x16u);
}

void sub_100008858(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AppDeletionUISceneDelegate scene:willConnectToSession:options:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to retrieve daemon connection endpoint from remote alert", (uint8_t *)&v1, 0xCu);
}

void sub_1000088DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008954(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000089CC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AppDeletionUISceneDelegate scene:willConnectToSession:options:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Scene class is not of kind SBSUIRemoteAlertScene; failing!",
    (uint8_t *)&v1,
    0xCu);
}

void sub_100008A50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008AC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void exit(int a1)
{
}

void free(void *a1)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return _xpc_connection_create_from_endpoint(endpoint);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__communicateAlertInvalidate(void *a1, const char *a2, ...)
{
  return [a1 _communicateAlertInvalidate];
}

id objc_msgSend__headerImage(void *a1, const char *a2, ...)
{
  return [a1 _headerImage];
}

id objc_msgSend_appType(void *a1, const char *a2, ...)
{
  return [a1 appType];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_buttonViewBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 buttonViewBottomConstraint];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationContext(void *a1, const char *a2, ...)
{
  return [a1 configurationContext];
}

id objc_msgSend_configurationType(void *a1, const char *a2, ...)
{
  return [a1 configurationType];
}

id objc_msgSend_constructAppDeletionController(void *a1, const char *a2, ...)
{
  return [a1 constructAppDeletionController];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_customIconContainerView(void *a1, const char *a2, ...)
{
  return [a1 customIconContainerView];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deletionStringsBundle(void *a1, const char *a2, ...)
{
  return [a1 deletionStringsBundle];
}

id objc_msgSend_deletionStringsTableName(void *a1, const char *a2, ...)
{
  return [a1 deletionStringsTableName];
}

id objc_msgSend_detailLabel(void *a1, const char *a2, ...)
{
  return [a1 detailLabel];
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 filledButtonConfiguration];
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return [a1 firstAttribute];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return [a1 firstItem];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getState(void *a1, const char *a2, ...)
{
  return [a1 getState];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_homeScreenIconStyleConfiguration(void *a1, const char *a2, ...)
{
  return [a1 homeScreenIconStyleConfiguration];
}

id objc_msgSend_isICloudOn(void *a1, const char *a2, ...)
{
  return [a1 isICloudOn];
}

id objc_msgSend_isSOSAvailable(void *a1, const char *a2, ...)
{
  return [a1 isSOSAvailable];
}

id objc_msgSend_isWatchPaired(void *a1, const char *a2, ...)
{
  return [a1 isWatchPaired];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_numAppsInstalled(void *a1, const char *a2, ...)
{
  return [a1 numAppsInstalled];
}

id objc_msgSend_numMediaShared(void *a1, const char *a2, ...)
{
  return [a1 numMediaShared];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return [a1 numberOfLines];
}

id objc_msgSend_obViewController(void *a1, const char *a2, ...)
{
  return [a1 obViewController];
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return [a1 placeholder];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_presenterConnection(void *a1, const char *a2, ...)
{
  return [a1 presenterConnection];
}

id objc_msgSend_presentingVC(void *a1, const char *a2, ...)
{
  return [a1 presentingVC];
}

id objc_msgSend_relation(void *a1, const char *a2, ...)
{
  return [a1 relation];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_secondAttribute(void *a1, const char *a2, ...)
{
  return [a1 secondAttribute];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return [a1 secondItem];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 sheetPresentationController];
}

id objc_msgSend_showArchiveOption(void *a1, const char *a2, ...)
{
  return [a1 showArchiveOption];
}

id objc_msgSend_sosIsAvailable(void *a1, const char *a2, ...)
{
  return [a1 sosIsAvailable];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_textAlignment(void *a1, const char *a2, ...)
{
  return [a1 textAlignment];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return [a1 textContainer];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}