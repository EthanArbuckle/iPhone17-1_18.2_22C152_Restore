void sub_100003DF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003ED4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004058(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000051D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000C9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

int main(int argc, const char **argv, const char **envp)
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, v7);

  return (int)argv;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_actionButtons(void *a1, const char *a2, ...)
{
  return [a1 actionButtons];
}

id objc_msgSend_animatedStrokeLayer(void *a1, const char *a2, ...)
{
  return [a1 animatedStrokeLayer];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authenticationAttempt(void *a1, const char *a2, ...)
{
  return [a1 authenticationAttempt];
}

id objc_msgSend_backToMenuButton(void *a1, const char *a2, ...)
{
  return [a1 backToMenuButton];
}

id objc_msgSend_backgroundPercentageLayer(void *a1, const char *a2, ...)
{
  return [a1 backgroundPercentageLayer];
}

id objc_msgSend_backgroundStrokeLayer(void *a1, const char *a2, ...)
{
  return [a1 backgroundStrokeLayer];
}

id objc_msgSend_basicConfig(void *a1, const char *a2, ...)
{
  return [a1 basicConfig];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return [a1 blueColor];
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

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_cleanupOldRecoveredDevices(void *a1, const char *a2, ...)
{
  return [a1 cleanupOldRecoveredDevices];
}

id objc_msgSend_clearConfiguration(void *a1, const char *a2, ...)
{
  return [a1 clearConfiguration];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return [a1 defaultMetrics];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceKey(void *a1, const char *a2, ...)
{
  return [a1 deviceKey];
}

id objc_msgSend_deviceObj(void *a1, const char *a2, ...)
{
  return [a1 deviceObj];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doneWaitingForServerResponse(void *a1, const char *a2, ...)
{
  return [a1 doneWaitingForServerResponse];
}

id objc_msgSend_eacsApprovalCard(void *a1, const char *a2, ...)
{
  return [a1 eacsApprovalCard];
}

id objc_msgSend_eacsCard(void *a1, const char *a2, ...)
{
  return [a1 eacsCard];
}

id objc_msgSend_enterCodeCard(void *a1, const char *a2, ...)
{
  return [a1 enterCodeCard];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_extendedMode(void *a1, const char *a2, ...)
{
  return [a1 extendedMode];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreAdditionalCodes(void *a1, const char *a2, ...)
{
  return [a1 ignoreAdditionalCodes];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelectedRow];
}

id objc_msgSend_indexPathsForSelectedRows(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForSelectedRows];
}

id objc_msgSend_initialCard(void *a1, const char *a2, ...)
{
  return [a1 initialCard];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCompanionSameDevice(void *a1, const char *a2, ...)
{
  return [a1 isCompanionSameDevice];
}

id objc_msgSend_kLocalizedDeviceType(void *a1, const char *a2, ...)
{
  return [a1 kLocalizedDeviceType];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_learnMoreButtonAction(void *a1, const char *a2, ...)
{
  return [a1 learnMoreButtonAction];
}

id objc_msgSend_learnMoreCard(void *a1, const char *a2, ...)
{
  return [a1 learnMoreCard];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return [a1 mainContentGuide];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_matchesRecentlyRecoveredDevice(void *a1, const char *a2, ...)
{
  return [a1 matchesRecentlyRecoveredDevice];
}

id objc_msgSend_menuCard(void *a1, const char *a2, ...)
{
  return [a1 menuCard];
}

id objc_msgSend_menuViewController(void *a1, const char *a2, ...)
{
  return [a1 menuViewController];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nearbyActionDeviceClass(void *a1, const char *a2, ...)
{
  return [a1 nearbyActionDeviceClass];
}

id objc_msgSend_nearbyActionFlags(void *a1, const char *a2, ...)
{
  return [a1 nearbyActionFlags];
}

id objc_msgSend_nearbyActionType(void *a1, const char *a2, ...)
{
  return [a1 nearbyActionType];
}

id objc_msgSend_nearbyAuthTag(void *a1, const char *a2, ...)
{
  return [a1 nearbyAuthTag];
}

id objc_msgSend_notNowButtonAction(void *a1, const char *a2, ...)
{
  return [a1 notNowButtonAction];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return [a1 oslog];
}

id objc_msgSend_overallResultCard(void *a1, const char *a2, ...)
{
  return [a1 overallResultCard];
}

id objc_msgSend_overallResultOKButtonAction(void *a1, const char *a2, ...)
{
  return [a1 overallResultOKButtonAction];
}

id objc_msgSend_overallResultSUButtonAction(void *a1, const char *a2, ...)
{
  return [a1 overallResultSUButtonAction];
}

id objc_msgSend_pairingFlags(void *a1, const char *a2, ...)
{
  return [a1 pairingFlags];
}

id objc_msgSend_passcodeEntryView(void *a1, const char *a2, ...)
{
  return [a1 passcodeEntryView];
}

id objc_msgSend_passwordType(void *a1, const char *a2, ...)
{
  return [a1 passwordType];
}

id objc_msgSend_performingEACS(void *a1, const char *a2, ...)
{
  return [a1 performingEACS];
}

id objc_msgSend_persistRecoveringDevice(void *a1, const char *a2, ...)
{
  return [a1 persistRecoveringDevice];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_progressCard(void *a1, const char *a2, ...)
{
  return [a1 progressCard];
}

id objc_msgSend_progressDismissButtonAction(void *a1, const char *a2, ...)
{
  return [a1 progressDismissButtonAction];
}

id objc_msgSend_progressText(void *a1, const char *a2, ...)
{
  return [a1 progressText];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return [a1 progressView];
}

id objc_msgSend_proxCardNavController(void *a1, const char *a2, ...)
{
  return [a1 proxCardNavController];
}

id objc_msgSend_recoverButtonAction(void *a1, const char *a2, ...)
{
  return [a1 recoverButtonAction];
}

id objc_msgSend_recoverButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 recoverButtonPressed];
}

id objc_msgSend_recoverDeviceOperationsQueue(void *a1, const char *a2, ...)
{
  return [a1 recoverDeviceOperationsQueue];
}

id objc_msgSend_recoveryCard(void *a1, const char *a2, ...)
{
  return [a1 recoveryCard];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return [a1 rssi];
}

id objc_msgSend_runningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 runningInStoreDemoMode];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return [a1 secondaryTextProperties];
}

id objc_msgSend_selectedOption(void *a1, const char *a2, ...)
{
  return [a1 selectedOption];
}

id objc_msgSend_serverConfig(void *a1, const char *a2, ...)
{
  return [a1 serverConfig];
}

id objc_msgSend_setInitialCardForResume(void *a1, const char *a2, ...)
{
  return [a1 setInitialCardForResume];
}

id objc_msgSend_setInitialCardForSetup(void *a1, const char *a2, ...)
{
  return [a1 setInitialCardForSetup];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupCompleted(void *a1, const char *a2, ...)
{
  return [a1 setupCompleted];
}

id objc_msgSend_setupStop(void *a1, const char *a2, ...)
{
  return [a1 setupStop];
}

id objc_msgSend_setupTimer(void *a1, const char *a2, ...)
{
  return [a1 setupTimer];
}

id objc_msgSend_setupkitClient(void *a1, const char *a2, ...)
{
  return [a1 setupkitClient];
}

id objc_msgSend_setupkitDevice(void *a1, const char *a2, ...)
{
  return [a1 setupkitDevice];
}

id objc_msgSend_showEACSApprovalCard(void *a1, const char *a2, ...)
{
  return [a1 showEACSApprovalCard];
}

id objc_msgSend_showEACSCard(void *a1, const char *a2, ...)
{
  return [a1 showEACSCard];
}

id objc_msgSend_showLearnMoreCard(void *a1, const char *a2, ...)
{
  return [a1 showLearnMoreCard];
}

id objc_msgSend_showMenuCard(void *a1, const char *a2, ...)
{
  return [a1 showMenuCard];
}

id objc_msgSend_showRecoveryCard(void *a1, const char *a2, ...)
{
  return [a1 showRecoveryCard];
}

id objc_msgSend_showingProgress(void *a1, const char *a2, ...)
{
  return [a1 showingProgress];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_skipWifi(void *a1, const char *a2, ...)
{
  return [a1 skipWifi];
}

id objc_msgSend_smallSystemFontSize(void *a1, const char *a2, ...)
{
  return [a1 smallSystemFontSize];
}

id objc_msgSend_stableIdentifier(void *a1, const char *a2, ...)
{
  return [a1 stableIdentifier];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_strokeEnd(void *a1, const char *a2, ...)
{
  return [a1 strokeEnd];
}

id objc_msgSend_subtitleCellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 subtitleCellConfiguration];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray3Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_throttleSeconds(void *a1, const char *a2, ...)
{
  return [a1 throttleSeconds];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_uiImage(void *a1, const char *a2, ...)
{
  return [a1 uiImage];
}

id objc_msgSend_uiImageEACS(void *a1, const char *a2, ...)
{
  return [a1 uiImageEACS];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateCodeCardToSettingUpState(void *a1, const char *a2, ...)
{
  return [a1 updateCodeCardToSettingUpState];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_useAlternateStringForWiFI(void *a1, const char *a2, ...)
{
  return [a1 useAlternateStringForWiFI];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return [a1 visibleViewController];
}

id objc_msgSend_waitForServerResponse(void *a1, const char *a2, ...)
{
  return [a1 waitForServerResponse];
}