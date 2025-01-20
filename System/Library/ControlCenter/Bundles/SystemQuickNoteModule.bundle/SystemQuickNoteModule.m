void sub_10FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void block[5];

  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_22C0((uint64_t)v4, v5);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11CC;
    block[3] = &unk_4250;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_11CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateSystemPaper];
}

id sub_11D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateSystemPaper];
}

void sub_16E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1710(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIconGlyph];
}

void sub_1B44(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Updating QuickNote icon glyph", v5, 2u);
  }

  v3 = [*(id *)(a1 + 32) moduleViewController];
  v4 = [*(id *)(a1 + 32) iconGlyph];
  [v3 setGlyphImage:v4];
}

id sub_1E98(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  if (v2) {
    return objc_msgSend(v3, "drawAtPoint:blendMode:alpha:", 17, v4, v5, 0.4);
  }
  else {
    return objc_msgSend(v3, "drawAtPoint:blendMode:alpha:", 0, v4, v5, 1.0);
  }
}

void sub_2154(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) remoteAlertHandle];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    [*(id *)(a1 + 32) invalidate];
    [*(id *)(a1 + 32) unregisterObserver:*(void *)(a1 + 40)];
    double v4 = *(void **)(a1 + 40);
    [v4 setRemoteAlertHandle:0];
  }
}

void sub_22C0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to open primary app: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2338(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "-[ICSystemPaperControlCenterModule remoteAlertHandleDidActivate:]", v1, 2u);
}

void sub_237C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "-[ICSystemPaperControlCenterModule remoteAlertHandleDidDeactivate:]", v1, 2u);
}

void sub_23C0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "-[ICSystemPaperControlCenterModule remoteAlertHandle:didInvalidateWithError:] - error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2438(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "-[ICSystemPaperControlCenterModule remoteAlertHandle:didInvalidateWithError:] - error: %@", (uint8_t *)&v2, 0xCu);
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

uint64_t ICDynamicCast()
{
  return _ICDynamicCast();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__primaryApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _primaryApplicationBundleIdentifier];
}

id objc_msgSend__updateIconGlyph(void *a1, const char *a2, ...)
{
  return [a1 _updateIconGlyph];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_alignmentRectInsets(void *a1, const char *a2, ...)
{
  return [a1 alignmentRectInsets];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_contentModuleContext(void *a1, const char *a2, ...)
{
  return [a1 contentModuleContext];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_dismissControlCenter(void *a1, const char *a2, ...)
{
  return [a1 dismissControlCenter];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_iconGlyph(void *a1, const char *a2, ...)
{
  return [a1 iconGlyph];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageWithHorizontallyFlippedOrientation(void *a1, const char *a2, ...)
{
  return [a1 imageWithHorizontallyFlippedOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isOnCoverSheetOrAppSwitcher(void *a1, const char *a2, ...)
{
  return [a1 isOnCoverSheetOrAppSwitcher];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return [a1 isUIApplicationElement];
}

id objc_msgSend_layoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 layoutMonitor];
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return [a1 layoutRole];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_moduleViewController(void *a1, const char *a2, ...)
{
  return [a1 moduleViewController];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_remoteAlertHandle(void *a1, const char *a2, ...)
{
  return [a1 remoteAlertHandle];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}