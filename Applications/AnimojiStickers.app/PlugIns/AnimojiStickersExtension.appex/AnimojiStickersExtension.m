void sub_10000363C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void v6[5];
  uint64_t vars8;

  if ([*(id *)(a1 + 32) needsLandscapeOverlayUpdate])
  {
    if ([*(id *)(a1 + 32) isLandscapeMode])
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100003750;
      v6[3] = &unk_10000C360;
      v6[4] = *(void *)(a1 + 32);
      +[UIView performWithoutAnimation:v6];
      v2 = [*(id *)(a1 + 32) landscapeTrapOverlay];
      v3 = [v2 label];
      [v3 setAlpha:1.0];
    }
    else
    {
      v5 = [*(id *)(a1 + 32) landscapeTrapOverlay];
      v4 = [v5 label];
      [v4 setAlpha:0.0];
    }
  }
}

void sub_100003750(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLandscapeOverlayImmediately];
  id v3 = [*(id *)(a1 + 32) landscapeTrapOverlay];
  v2 = [v3 label];
  [v2 setAlpha:0.0];
}

id sub_1000037BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLandscapeOverlayImmediately];
}

void sub_100003D18(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if ([WeakRetained snapshottingEnabledUpdateIdentifier] == a1[6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[4];
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updating snapshottingEnabled applying futureValue: %@", (uint8_t *)&v4, 0xCu);
    }
    [WeakRetained setSnapshottingEnabled:[a1[4] BOOLValue]];
  }
}

void sub_100004E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004E60(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained layoutMonitorDidUpdateDisplayLayout:v7 withContext:v6];
}

void sub_100005158(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) strongPopoverCurrentlyPresented])
  {
    [*(id *)(a1 + 32) setStrongPopoverCurrentlyPresented:*(unsigned __int8 *)(a1 + 40)];
    CFStringRef v6 = @"BaseMessagesViewControllerStrongPopupPresentedKey";
    id v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    id v7 = v3;
    int v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"BaseMessagesViewControllerStrongPopupPresentationNotification" object:*(void *)(a1 + 32) userInfo:v4];
  }
}

id sub_100005800(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000582C(uint64_t a1)
{
}

void sub_100005834(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained waitingOnPresentationStyleChange])
  {
    [WeakRetained requestPresentationStyle:1];
    dispatch_time_t v2 = dispatch_time(0, 500000000);
    dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
  else
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void sub_10000667C(uint64_t a1, void *a2)
{
  CGFloat v3 = *(double *)(a1 + 48);
  CGFloat v4 = *(double *)(a1 + 56);
  id v5 = a2;
  v14.width = v3;
  v14.height = v4;
  UIGraphicsBeginImageContextWithOptions(v14, 1, 0.0);
  CFStringRef v6 = [*(id *)(a1 + 32) view];
  id v7 = [v6 backgroundColor];
  v8 = [*(id *)(a1 + 32) traitCollection];
  v9 = [v7 resolvedColorWithTraitCollection:v8];
  [v9 setFill];

  v10 = [*(id *)(a1 + 32) view];
  [v10 bounds];
  UIRectFill(v15);

  v11 = [*(id *)(a1 + 32) view];
  [v11 bounds];
  [v5 drawViewHierarchyInRect:1];

  UIGraphicsGetImageFromCurrentImageContext();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100006964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006984(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldShowDisclosureWarning:0];
}

uint64_t AVTUIStickersShowDisclosureWarning()
{
  return _AVTUIStickersShowDisclosureWarning();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
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

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend__configure(void *a1, const char *a2, ...)
{
  return [a1 _configure];
}

id objc_msgSend_addStickerViewToHiearchyIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 addStickerViewToHiearchyIfNeeded];
}

id objc_msgSend_allowsEditing(void *a1, const char *a2, ...)
{
  return [a1 allowsEditing];
}

id objc_msgSend_appBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 appBackgroundColor];
}

id objc_msgSend_automaticallyDisplaysLandscapeRotationOverlay(void *a1, const char *a2, ...)
{
  return [a1 automaticallyDisplaysLandscapeRotationOverlay];
}

id objc_msgSend_avatarStore(void *a1, const char *a2, ...)
{
  return [a1 avatarStore];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_baseMessagesViewController(void *a1, const char *a2, ...)
{
  return [a1 baseMessagesViewController];
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

id objc_msgSend_childConstraints(void *a1, const char *a2, ...)
{
  return [a1 childConstraints];
}

id objc_msgSend_childStickersMessagesViewController(void *a1, const char *a2, ...)
{
  return [a1 childStickersMessagesViewController];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_currentControllerPresentation(void *a1, const char *a2, ...)
{
  return [a1 currentControllerPresentation];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentOrientation];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_didPresentEditorViewController(void *a1, const char *a2, ...)
{
  return [a1 didPresentEditorViewController];
}

id objc_msgSend_didShowExpandedMode(void *a1, const char *a2, ...)
{
  return [a1 didShowExpandedMode];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_displayLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 displayLayoutMonitor];
}

id objc_msgSend_editorViewController(void *a1, const char *a2, ...)
{
  return [a1 editorViewController];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_emptySnapshotImage(void *a1, const char *a2, ...)
{
  return [a1 emptySnapshotImage];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFromKeyboard(void *a1, const char *a2, ...)
{
  return [a1 isFromKeyboard];
}

id objc_msgSend_isLandscapeMode(void *a1, const char *a2, ...)
{
  return [a1 isLandscapeMode];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return [a1 isLoaded];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isOverlayShown(void *a1, const char *a2, ...)
{
  return [a1 isOverlayShown];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_landscapeOverlayMessage(void *a1, const char *a2, ...)
{
  return [a1 landscapeOverlayMessage];
}

id objc_msgSend_landscapeTrapOverlay(void *a1, const char *a2, ...)
{
  return [a1 landscapeTrapOverlay];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_modalBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 modalBackgroundColor];
}

id objc_msgSend_modalMessagesController(void *a1, const char *a2, ...)
{
  return [a1 modalMessagesController];
}

id objc_msgSend_needsLandscapeOverlayUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsLandscapeOverlayUpdate];
}

id objc_msgSend_overlayMessageBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 overlayMessageBackgroundColor];
}

id objc_msgSend_overlayMessageTextColor(void *a1, const char *a2, ...)
{
  return [a1 overlayMessageTextColor];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_pendingChildViewController(void *a1, const char *a2, ...)
{
  return [a1 pendingChildViewController];
}

id objc_msgSend_pendingGlobalPresentation(void *a1, const char *a2, ...)
{
  return [a1 pendingGlobalPresentation];
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return [a1 presentationContext];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setupDisplayLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 setupDisplayLayoutMonitor];
}

id objc_msgSend_setupStickerView(void *a1, const char *a2, ...)
{
  return [a1 setupStickerView];
}

id objc_msgSend_shouldPresentEditorFromKeyboardSplashScreen(void *a1, const char *a2, ...)
{
  return [a1 shouldPresentEditorFromKeyboardSplashScreen];
}

id objc_msgSend_shouldShowDisclosureWarning(void *a1, const char *a2, ...)
{
  return [a1 shouldShowDisclosureWarning];
}

id objc_msgSend_showEditorViewControllerFromKeyboardSplashScreen(void *a1, const char *a2, ...)
{
  return [a1 showEditorViewControllerFromKeyboardSplashScreen];
}

id objc_msgSend_snapshottingEnabled(void *a1, const char *a2, ...)
{
  return [a1 snapshottingEnabled];
}

id objc_msgSend_snapshottingEnabledUpdateIdentifier(void *a1, const char *a2, ...)
{
  return [a1 snapshottingEnabledUpdateIdentifier];
}

id objc_msgSend_stickerController(void *a1, const char *a2, ...)
{
  return [a1 stickerController];
}

id objc_msgSend_stickerControllerDidEnterBackground(void *a1, const char *a2, ...)
{
  return [a1 stickerControllerDidEnterBackground];
}

id objc_msgSend_stickerControllerWillEnterForeground(void *a1, const char *a2, ...)
{
  return [a1 stickerControllerWillEnterForeground];
}

id objc_msgSend_strongPopoverCurrentlyPresented(void *a1, const char *a2, ...)
{
  return [a1 strongPopoverCurrentlyPresented];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
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

id objc_msgSend_updateHiddenSubviewsForAnyOverlays(void *a1, const char *a2, ...)
{
  return [a1 updateHiddenSubviewsForAnyOverlays];
}

id objc_msgSend_updateLandscapeOverlayImmediately(void *a1, const char *a2, ...)
{
  return [a1 updateLandscapeOverlayImmediately];
}

id objc_msgSend_usageTrackingSession(void *a1, const char *a2, ...)
{
  return [a1 usageTrackingSession];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewWillBeObstructed(void *a1, const char *a2, ...)
{
  return [a1 viewWillBeObstructed];
}

id objc_msgSend_waitingOnPresentationStyleChange(void *a1, const char *a2, ...)
{
  return [a1 waitingOnPresentationStyleChange];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}