id PHDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_114D0 != -1) {
    dispatch_once(&qword_114D0, &stru_C360);
  }
  v0 = (void *)qword_114C8;

  return v0;
}

void sub_3E04(id a1)
{
  qword_114C8 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_114E0 != -1) {
    dispatch_once(&qword_114E0, &stru_C380);
  }
  v0 = (void *)qword_114D8;

  return v0;
}

void sub_3E9C(id a1)
{
  qword_114D8 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_114F0 != -1) {
    dispatch_once(&qword_114F0, &stru_C3A0);
  }
  v0 = (void *)qword_114E8;

  return v0;
}

void sub_3F34(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)qword_114E8;
  qword_114E8 = (uint64_t)v1;
}

void sub_4164(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalPresentationStyle:2];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4208;
  v6[3] = &unk_C3C8;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 presentViewController:v4 animated:1 completion:v6];
}

uint64_t sub_4208(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reloading specifiers because the presented view controller was a UIAlertController: %@", (uint8_t *)&v5, 0xCu);
    }

    return (uint64_t)[*(id *)(a1 + 40) reloadSpecifiers];
  }
  return result;
}

void sub_4B4C(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_7B68();
    }

    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    int v5 = [*(id *)(a1 + 32) genericErrorAlertController];
    [v4 presentOrUpdateViewController:v5];
  }
}

void sub_4BD8(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 2) >= 2)
  {
    if (!a2)
    {
      uint64_t v6 = PHDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Successfully loaded web view URL", v7, 2u);
      }

      [*(id *)(a1 + 32) webSheetCompletion];
    }
  }
  else
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_7B68();
    }

    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    int v5 = [*(id *)(a1 + 32) genericErrorAlertController];
    [v4 presentOrUpdateViewController:v5];
  }
}

void sub_4F88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_6244(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_64C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void *sub_6BC8(void *result)
{
  dispatch_queue_t v1 = result;
  uint64_t v2 = result[4];
  if (!*(void *)(v2 + 40) || !*(void *)(v2 + 48))
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[WARN] Timed out trying to load carrier URL", v4, 2u);
    }

    return [(id)v1[4] doWebViewTimedOut];
  }
  return result;
}

uint64_t sub_7168(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t sub_728C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_7394(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  }
  return result;
}

uint64_t sub_74B8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

JSValueRef sub_7704(JSContextRef ctx, int a2, JSValueRef value)
{
  if (!value) {
    goto LABEL_6;
  }
  int v5 = (OpaqueJSClass *)qword_114F8;
  if (!qword_114F8)
  {
    int v5 = JSClassCreate((const JSClassDefinition *)&unk_11448);
    qword_114F8 = (uint64_t)v5;
  }
  if (JSValueIsObjectOfClass(ctx, value, v5))
  {
    uint64_t v6 = JSObjectGetPrivate(value);
    id v7 = WebThreadMakeNSInvocation();
    WebThreadCallDelegate();

    JSValueRef Undefined = JSValueMakeUndefined(ctx);
    return Undefined;
  }
  else
  {
LABEL_6:
    return JSValueMakeUndefined(ctx);
  }
}

JSValueRef sub_77C8(JSContextRef ctx, int a2, JSValueRef value)
{
  if (!value) {
    goto LABEL_6;
  }
  int v5 = (OpaqueJSClass *)qword_114F8;
  if (!qword_114F8)
  {
    int v5 = JSClassCreate((const JSClassDefinition *)&unk_11448);
    qword_114F8 = (uint64_t)v5;
  }
  if (JSValueIsObjectOfClass(ctx, value, v5))
  {
    uint64_t v6 = JSObjectGetPrivate(value);
    id v7 = WebThreadMakeNSInvocation();
    WebThreadCallDelegate();

    JSValueRef Undefined = JSValueMakeUndefined(ctx);
    return Undefined;
  }
  else
  {
LABEL_6:
    return JSValueMakeUndefined(ctx);
  }
}

void sub_7B34()
{
  sub_4FA4();
  sub_4F88(&dword_0, v0, v1, "Did not receive a non-nil provisioning URL after refreshing CT settings. Presenting generic error alert controller", v2, v3, v4, v5, v6);
}

void sub_7B68()
{
  sub_4FA4();
  sub_4F88(&dword_0, v0, v1, "Error loading web view. Presenting generic error alert controller", v2, v3, v4, v5, v6);
}

void sub_7B9C()
{
  sub_4FA4();
  sub_4F88(&dword_0, v0, v1, "Asked for requestCarrierController when provisioning status is not-allowed. Returning generic error alert controller", v2, v3, v4, v5, v6);
}

void sub_7BD0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "didFailLoadWithError: %@", (uint8_t *)&v2, 0xCu);
}

void sub_7C48(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "doProvisioningFailed", v1, 2u);
}

void sub_7C8C()
{
}

void sub_7CB8()
{
}

void sub_7CE4()
{
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return _JSClassCreate(definition);
}

void *__cdecl JSObjectGetPrivate(JSObjectRef object)
{
  return _JSObjectGetPrivate(object);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return _JSObjectMake(ctx, jsClass, data);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return _JSStringCreateWithCFString(string);
}

BOOL JSValueIsObjectOfClass(JSContextRef ctx, JSValueRef value, JSClassRef jsClass)
{
  return _JSValueIsObjectOfClass(ctx, value, jsClass);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return _JSValueMakeUndefined(ctx);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t TUStringKeyForNetwork()
{
  return _TUStringKeyForNetwork();
}

uint64_t TUStringKeyForNetworkAndProduct()
{
  return _TUStringKeyForNetworkAndProduct();
}

uint64_t TUThumperCarrierName()
{
  return _TUThumperCarrierName();
}

uint64_t WebThreadCallDelegate()
{
  return _WebThreadCallDelegate();
}

uint64_t WebThreadMakeNSInvocation()
{
  return _WebThreadMakeNSInvocation();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

id objc_msgSend_JSObject(void *a1, const char *a2, ...)
{
  return [a1 JSObject];
}

id objc_msgSend_accountsSupportSecondaryCalling(void *a1, const char *a2, ...)
{
  return [a1 accountsSupportSecondaryCalling];
}

id objc_msgSend_appleAccountRebrandEnabled(void *a1, const char *a2, ...)
{
  return [a1 appleAccountRebrandEnabled];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleDescriptor(void *a1, const char *a2, ...)
{
  return [a1 bundleDescriptor];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_callingCapabilityInfo(void *a1, const char *a2, ...)
{
  return [a1 callingCapabilityInfo];
}

id objc_msgSend_cancelWebView(void *a1, const char *a2, ...)
{
  return [a1 cancelWebView];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_doProvisioningCanceled(void *a1, const char *a2, ...)
{
  return [a1 doProvisioningCanceled];
}

id objc_msgSend_doProvisioningFailed(void *a1, const char *a2, ...)
{
  return [a1 doProvisioningFailed];
}

id objc_msgSend_doWebViewTimedOut(void *a1, const char *a2, ...)
{
  return [a1 doWebViewTimedOut];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_enableCapability(void *a1, const char *a2, ...)
{
  return [a1 enableCapability];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flow(void *a1, const char *a2, ...)
{
  return [a1 flow];
}

id objc_msgSend_genericErrorAlertController(void *a1, const char *a2, ...)
{
  return [a1 genericErrorAlertController];
}

id objc_msgSend_globalContext(void *a1, const char *a2, ...)
{
  return [a1 globalContext];
}

id objc_msgSend_invalidateAndRefreshThumperCallingProvisioningURL(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndRefreshThumperCallingProvisioningURL];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isPresentingURL(void *a1, const char *a2, ...)
{
  return [a1 isPresentingURL];
}

id objc_msgSend_isProvisioningURLInvalid(void *a1, const char *a2, ...)
{
  return [a1 isProvisioningURLInvalid];
}

id objc_msgSend_isRelayCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRelayCallingEnabled];
}

id objc_msgSend_isThumperCallingAllowedForCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 isThumperCallingAllowedForCurrentDevice];
}

id objc_msgSend_isThumperCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isThumperCallingEnabled];
}

id objc_msgSend_isThumperProvisioningInProcess(void *a1, const char *a2, ...)
{
  return [a1 isThumperProvisioningInProcess];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadWebViewController(void *a1, const char *a2, ...)
{
  return [a1 loadWebViewController];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainSwitchFooterText(void *a1, const char *a2, ...)
{
  return [a1 mainSwitchFooterText];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_provisionCapabilityController(void *a1, const char *a2, ...)
{
  return [a1 provisionCapabilityController];
}

id objc_msgSend_provisioningPostData(void *a1, const char *a2, ...)
{
  return [a1 provisioningPostData];
}

id objc_msgSend_provisioningStatus(void *a1, const char *a2, ...)
{
  return [a1 provisioningStatus];
}

id objc_msgSend_provisioningURL(void *a1, const char *a2, ...)
{
  return [a1 provisioningURL];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requestPinFromPrimaryDevice(void *a1, const char *a2, ...)
{
  return [a1 requestPinFromPrimaryDevice];
}

id objc_msgSend_shouldEnableCapability(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableCapability];
}

id objc_msgSend_shouldShowEmergencyAddress(void *a1, const char *a2, ...)
{
  return [a1 shouldShowEmergencyAddress];
}

id objc_msgSend_shouldShowUpgradeToThumperButton(void *a1, const char *a2, ...)
{
  return [a1 shouldShowUpgradeToThumperButton];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return [a1 specifierID];
}

id objc_msgSend_specifiersArray(void *a1, const char *a2, ...)
{
  return [a1 specifiersArray];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsPrimaryCalling];
}

id objc_msgSend_supportsTelephonyCalls(void *a1, const char *a2, ...)
{
  return [a1 supportsTelephonyCalls];
}

id objc_msgSend_supportsThumperCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsThumperCalling];
}

id objc_msgSend_supportsThumperCallingOverCellularData(void *a1, const char *a2, ...)
{
  return [a1 supportsThumperCallingOverCellularData];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_thumperCallingCapabilityInfo(void *a1, const char *a2, ...)
{
  return [a1 thumperCallingCapabilityInfo];
}

id objc_msgSend_thumperProvisioningController(void *a1, const char *a2, ...)
{
  return [a1 thumperProvisioningController];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateEmergencyAddressController(void *a1, const char *a2, ...)
{
  return [a1 updateEmergencyAddressController];
}

id objc_msgSend_upgradeToThumperSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 upgradeToThumperSpecifiers];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webSheetCompletion(void *a1, const char *a2, ...)
{
  return [a1 webSheetCompletion];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return [a1 webView];
}

id objc_msgSend_webViewController(void *a1, const char *a2, ...)
{
  return [a1 webViewController];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_windowObject(void *a1, const char *a2, ...)
{
  return [a1 windowObject];
}