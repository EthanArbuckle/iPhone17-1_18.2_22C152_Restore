id sub_100004820()
{
  void *v0;
  uint64_t vars8;

  if (qword_100017490 != -1) {
    dispatch_once(&qword_100017490, &stru_100010378);
  }
  v0 = (void *)qword_100017498;

  return v0;
}

void sub_100004874(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) bannerSourceForPresentable:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 40) requestIdentifier];
  id v3 = [v4 revokePresentableWithRequestIdentifier:v2 reason:@"done" animated:1 userInfo:&__NSDictionary0__struct error:0];
}

void sub_100004904(id a1)
{
  qword_100017498 = (uint64_t)os_log_create(WFLogSubsystem, "ViewServiceApplication");

  _objc_release_x1();
}

void sub_100004F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004F8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100004820();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s XPC connection interrupted", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setActiveConnection:0];
}

void sub_100005050(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100004820();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s XPC connection invalidated", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setActiveConnection:0];
}

void sub_10000550C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) micaView];
  [v1 setAlpha:0.0];
}

void sub_100005554(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) micaView];
  [v1 setHidden:1];
}

id sub_10000559C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005620;
  v2[3] = &unk_1000105B0;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.4];
}

void sub_100005620(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) micaView];
  [v1 setAlpha:1.0];
}

id sub_1000057C0(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressSuppressionState:3];
  v2 = *(void **)(a1 + 32);

  return [v2 setProgressSuppressionTimer:0];
}

id sub_100005948(uint64_t a1)
{
  [*(id *)(a1 + 32) updateMicaViewState];
  BOOL v2 = *(void *)(a1 + 40) != 4;
  int v3 = [*(id *)(a1 + 32) cancelButton];
  [v3 setHidden:v2];

  id result = [*(id *)(a1 + 32) progressSuppressionState];
  if (result != (id)3)
  {
    id v5 = [*(id *)(a1 + 32) activeLayoutMode];
    v6 = *(void **)(a1 + 32);
    if (v5 == (id)4)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v7 = 1;
      uint64_t v8 = 0;
    }
    return [v6 setMicaViewHidden:v7 animated:v8];
  }
  return result;
}

id sub_100005B8C(uint64_t a1)
{
  [*(id *)(a1 + 32) setLastKnownProgressValue:*(double *)(a1 + 40)];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 updateMicaViewState];
}

id sub_100005F44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) CGColor];
  int v3 = *(void **)(a1 + 32);

  return [v3 setBackgroundColor:v2];
}

id sub_1000067C0()
{
  if (qword_1000174A0 != -1) {
    dispatch_once(&qword_1000174A0, &stru_100010458);
  }
  v0 = (void *)qword_1000174A8;

  return v0;
}

void sub_100006814(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compactViewController];
  [v2 dismissPersistentChromeWithSuccess:*(unsigned __int8 *)(a1 + 56) customAttribution:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void sub_10000686C(id a1)
{
  qword_1000174A8 = (uint64_t)os_log_create(WFLogSubsystem, "RemoteAlert");

  _objc_release_x1();
}

void sub_1000069DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compactViewController];
  [v2 dismissPresentedContentWithCompletionHandler:*(void *)(a1 + 40)];
}

void sub_100006B88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compactViewController];
  [v2 handleRequest:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void sub_100006D3C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compactViewController];
  [v2 preparePersistentChromeWithContext:*(void *)(a1 + 40) attribution:*(void *)(a1 + 48)];
}

id sub_100006F5C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006FCC;
  v3[3] = &unk_1000105B0;
  v3[4] = v1;
  return [v1 dismissPresentedContentWithCompletionHandler:v3];
}

id sub_100006FCC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007044;
  v3[3] = &unk_1000105B0;
  v3[4] = v1;
  return [v1 dismissPersistentChromeWithSuccess:0 customAttribution:0 completionHandler:v3];
}

void sub_100007044(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) xpcConnection];
  id v2 = [v1 remoteObjectProxy];

  [v2 requestDismissalWithReason:WFViewServiceDismissalReasonUserCancelledWithHomeButton];
}

void sub_100007594(id a1)
{
  id v1 = sub_1000067C0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    int v3 = "-[WFRemoteAlertViewController configureWithContext:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s XPC connection invalidated", (uint8_t *)&v2, 0xCu);
  }
}

void sub_10000763C(id a1)
{
  id v1 = sub_1000067C0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    int v3 = "-[WFRemoteAlertViewController configureWithContext:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s XPC connection interrupted", (uint8_t *)&v2, 0xCu);
  }
}

uint64_t start(int a1, char **a2)
{
  +[WFInitialization initializeProcessWithDatabase:0];
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = UIApplicationMain(a1, a2, v5, 0);

  return v6;
}

void sub_1000081A4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activeLayoutMode] == (id)4)
  {
    [*(id *)(a1 + 32) setOverrideLayoutMode:3];
    id v2 = [*(id *)(a1 + 32) systemApertureElementContext];
    [v2 requestTransitionToPreferredLayoutMode];
  }
}

void sub_1000082A4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) progressView];
  id v2 = [*(id *)(a1 + 32) progress];
  [v2 fractionCompleted];
  [v3 updateProgressWithValue:];
}

id sub_100008474(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_100008C80(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitialPresentationTransitioning:0];
  id v2 = [*(id *)(a1 + 32) pendingDelayedAttribution];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 pendingDelayedAttribution];
    [v3 setAttribution:v4];

    id v5 = *(void **)(a1 + 32);
    [v5 setPendingDelayedAttribution:0];
  }
}

void sub_100009064(uint64_t a1)
{
  [*(id *)(a1 + 32) setAwaitingIconOwnershipSwap:0];
  id v2 = [*(id *)(a1 + 32) systemApertureElementContext];
  [v2 setElementNeedsUpdate];
}

void sub_1000091BC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) systemApertureElementContext];
  [v1 setElementNeedsUpdate];
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t WFApertureStatusViewControllerIdentityFromRunningContext()
{
  return _WFApertureStatusViewControllerIdentityFromRunningContext();
}

uint64_t WFDialogXPCHostInterface()
{
  return _WFDialogXPCHostInterface();
}

uint64_t WFDialogXPCInterface()
{
  return _WFDialogXPCInterface();
}

uint64_t WFWorkflowStatusHostXPCInterface()
{
  return _WFWorkflowStatusHostXPCInterface();
}

uint64_t WFWorkflowStatusXPCInterface()
{
  return _WFWorkflowStatusXPCInterface();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t getWFDialogLogObject()
{
  return _getWFDialogLogObject();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__defaultAttributes(void *a1, const char *a2, ...)
{
  return [a1 _defaultAttributes];
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return [a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_actionInterface(void *a1, const char *a2, ...)
{
  return [a1 actionInterface];
}

id objc_msgSend_actionInterfaceListener(void *a1, const char *a2, ...)
{
  return [a1 actionInterfaceListener];
}

id objc_msgSend_activeConnection(void *a1, const char *a2, ...)
{
  return [a1 activeConnection];
}

id objc_msgSend_activeLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 activeLayoutMode];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_attribution(void *a1, const char *a2, ...)
{
  return [a1 attribution];
}

id objc_msgSend_awaitingIconOwnershipSwap(void *a1, const char *a2, ...)
{
  return [a1 awaitingIconOwnershipSwap];
}

id objc_msgSend_beginConnection(void *a1, const char *a2, ...)
{
  return [a1 beginConnection];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_collapseTimer(void *a1, const char *a2, ...)
{
  return [a1 collapseTimer];
}

id objc_msgSend_compactViewController(void *a1, const char *a2, ...)
{
  return [a1 compactViewController];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hasCompleted(void *a1, const char *a2, ...)
{
  return [a1 hasCompleted];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return [a1 iconView];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_initialPresentationTransitioning(void *a1, const char *a2, ...)
{
  return [a1 initialPresentationTransitioning];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isRunningFromActionButton(void *a1, const char *a2, ...)
{
  return [a1 isRunningFromActionButton];
}

id objc_msgSend_isTouchingDownButton(void *a1, const char *a2, ...)
{
  return [a1 isTouchingDownButton];
}

id objc_msgSend_lastKnownProgressValue(void *a1, const char *a2, ...)
{
  return [a1 lastKnownProgressValue];
}

id objc_msgSend_lastPresentedStatus(void *a1, const char *a2, ...)
{
  return [a1 lastPresentedStatus];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_leadingView(void *a1, const char *a2, ...)
{
  return [a1 leadingView];
}

id objc_msgSend_micaView(void *a1, const char *a2, ...)
{
  return [a1 micaView];
}

id objc_msgSend_overrideLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 overrideLayoutMode];
}

id objc_msgSend_pendingDelayedAttribution(void *a1, const char *a2, ...)
{
  return [a1 pendingDelayedAttribution];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_postOptions(void *a1, const char *a2, ...)
{
  return [a1 postOptions];
}

id objc_msgSend_previousLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 previousLayoutMode];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressSuppressionState(void *a1, const char *a2, ...)
{
  return [a1 progressSuppressionState];
}

id objc_msgSend_progressSuppressionTimer(void *a1, const char *a2, ...)
{
  return [a1 progressSuppressionTimer];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return [a1 progressView];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_requestTransitionToPreferredLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 requestTransitionToPreferredLayoutMode];
}

id objc_msgSend_requesterIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requesterIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_runKind(void *a1, const char *a2, ...)
{
  return [a1 runKind];
}

id objc_msgSend_runSource(void *a1, const char *a2, ...)
{
  return [a1 runSource];
}

id objc_msgSend_runningContext(void *a1, const char *a2, ...)
{
  return [a1 runningContext];
}

id objc_msgSend_setElementNeedsUpdate(void *a1, const char *a2, ...)
{
  return [a1 setElementNeedsUpdate];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_startCollapseTimerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 startCollapseTimerIfNecessary];
}

id objc_msgSend_strokeColor(void *a1, const char *a2, ...)
{
  return [a1 strokeColor];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return [a1 supportedInterfaceOrientations];
}

id objc_msgSend_systemApertureElementContext(void *a1, const char *a2, ...)
{
  return [a1 systemApertureElementContext];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return [a1 titleFont];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_trailingView(void *a1, const char *a2, ...)
{
  return [a1 trailingView];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_updateMicaViewState(void *a1, const char *a2, ...)
{
  return [a1 updateMicaViewState];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_workflowIdentifier(void *a1, const char *a2, ...)
{
  return [a1 workflowIdentifier];
}

id objc_msgSend_workflowStatusHostBeginConnection(void *a1, const char *a2, ...)
{
  return [a1 workflowStatusHostBeginConnection];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}