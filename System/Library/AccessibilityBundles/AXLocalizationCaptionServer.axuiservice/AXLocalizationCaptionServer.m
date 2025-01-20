void sub_14F0(id a1)
{
  uint64_t vars8;

  qword_D650 = objc_alloc_init(AXLocalizationCaptionMonitor);

  _objc_release_x1();
}

void sub_17A4(id a1)
{
  id v1 = +[AXElement systemWideElement];
  [v1 performAction:5007];
}

void sub_1944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1964(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained handlingQueue];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1B34;
  v21 = &unk_82F8;
  objc_copyWeak(&v23, (id *)(a1 + 32));
  id v6 = v3;
  id v22 = v6;
  dispatch_async(v5, &v18);

  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = objc_msgSend(v7, "lockUI", v18, v19, v20, v21);

  if (v8
    && ([v6 handInfo],
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 eventType],
        v9,
        v10 == 1))
  {
    v11 = [v6 denormalizedEventRepresentation:1 descale:1];

    id v12 = objc_loadWeakRetained((id *)(a1 + 32));
    v13 = [v12 pointInsideCallback];
    v14 = [v11 handInfo];
    v15 = [v14 paths];
    v16 = [v15 firstPath];
    [v16 pathLocation];
    v13[2](v13);
  }
  else
  {
    v11 = v6;
  }

  objc_destroyWeak(&v23);
  return v8;
}

void sub_1B20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleTouchEvent:*(void *)(a1 + 32)];
}

id sub_220C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideRootViewController];
}

void sub_2378(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 application];
  uint64_t v4 = [v3 label];

  v21 = (void *)v4;
  if (!v4)
  {
    v5 = [v2 application];
    v21 = [v5 bundleId];
  }
  id v6 = [v2 label];
  id v7 = [v2 value];
  id v8 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v6, v7);

  v9 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
        if (v16)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_268C;
          v23[3] = &unk_8370;
          id v24 = v21;
          v25 = v15;
          id v26 = v9;
          id v17 = v16;
          [v17 enumerateAttributesUsingBlock:v23];

          id v18 = v24;
        }
        else
        {
          id v18 = 0;
          id v17 = (id)objc_opt_new();
          [v17 setText:v15];
          [v9 addObject:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  id v22 = v9;
  id v19 = v9;
  AXPerformBlockAsynchronouslyOnMainThread();
  [*(id *)(a1 + 32) logPackages:v19];
}

void sub_268C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v13 = (id)objc_opt_new();
  [v13 setAppName:*(void *)(a1 + 32)];
  id v8 = [v7 objectForKey:@"UIAccessibilityTokenLocalizationBundlePath"];
  [v13 setBundle:v8];

  v9 = [v7 objectForKey:@"UIAccessibilityTokenLocalizedStringTableName"];
  [v13 setFile:v9];

  id v10 = [v7 objectForKey:@"UIAccessibilityTokenLocalizedStringKey"];
  [v13 setKey:v10];

  id v11 = [v7 objectForKey:@"UIAccessibilityTokenLocalizedStringEnglishVersion"];

  [v13 setEnglishText:v11];
  id v12 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
  [v13 setText:v12];

  [*(id *)(a1 + 48) addObject:v13];
}

void sub_27DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rootViewController];
  [v2 updateText:*(void *)(a1 + 40)];
}

uint64_t sub_2830()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_28A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rootViewController];
  id v3 = [v2 view];
  uint64_t v4 = [v3 window];
  v5 = [*(id *)(a1 + 32) rootViewController];
  id v6 = [v5 backgroundView];
  objc_msgSend(v4, "convertPoint:toView:", v6, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v8 = v7;
  double v10 = v9;

  id v11 = [*(id *)(a1 + 32) rootViewController];
  id v12 = [v11 backgroundView];
  LODWORD(v4) = objc_msgSend(v12, "pointInside:withEvent:", 0, v8, v10);

  if (v4)
  {
    id v13 = [*(id *)(a1 + 32) rootViewController];
    [v13 uiLockPressed:0];
  }
}

void sub_29D8(uint64_t a1)
{
  [*(id *)(a1 + 32) _showRootViewControllerIfNeeded:0];
  id v2 = [*(id *)(a1 + 32) rootViewController];
  [v2 showString:@"Loc Caption Panel"];
}

id sub_2D44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideRootViewController];
}

void sub_3430(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_345C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained view];
  [v1 setNeedsLayout];
}

void sub_34B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained view];
  [v1 setNeedsLayout];
}

void sub_350C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained view];
  [v1 setNeedsLayout];
}

id sub_4434(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTextDisplay];
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__initializeAccessibility(void *a1, const char *a2, ...)
{
  return [a1 _initializeAccessibility];
}

id objc_msgSend__processNextTextDisplayTimer(void *a1, const char *a2, ...)
{
  return [a1 _processNextTextDisplayTimer];
}

id objc_msgSend__startService(void *a1, const char *a2, ...)
{
  return [a1 _startService];
}

id objc_msgSend__stopService(void *a1, const char *a2, ...)
{
  return [a1 _stopService];
}

id objc_msgSend__updateNumeratorDenominator(void *a1, const char *a2, ...)
{
  return [a1 _updateNumeratorDenominator];
}

id objc_msgSend__updateTextDisplay(void *a1, const char *a2, ...)
{
  return [a1 _updateTextDisplay];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return [a1 appName];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_captionPanelText(void *a1, const char *a2, ...)
{
  return [a1 captionPanelText];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createRootViewController(void *a1, const char *a2, ...)
{
  return [a1 createRootViewController];
}

id objc_msgSend_cyanColor(void *a1, const char *a2, ...)
{
  return [a1 cyanColor];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_elementCallback(void *a1, const char *a2, ...)
{
  return [a1 elementCallback];
}

id objc_msgSend_englishText(void *a1, const char *a2, ...)
{
  return [a1 englishText];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return [a1 file];
}

id objc_msgSend_fileLogDescription(void *a1, const char *a2, ...)
{
  return [a1 fileLogDescription];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_firstPath(void *a1, const char *a2, ...)
{
  return [a1 firstPath];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return [a1 greenColor];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return [a1 handInfo];
}

id objc_msgSend_handlingQueue(void *a1, const char *a2, ...)
{
  return [a1 handlingQueue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_isCancel(void *a1, const char *a2, ...)
{
  return [a1 isCancel];
}

id objc_msgSend_isHandlingHIDEvents(void *a1, const char *a2, ...)
{
  return [a1 isHandlingHIDEvents];
}

id objc_msgSend_isInRangeLift(void *a1, const char *a2, ...)
{
  return [a1 isInRangeLift];
}

id objc_msgSend_isLift(void *a1, const char *a2, ...)
{
  return [a1 isLift];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineView(void *a1, const char *a2, ...)
{
  return [a1 lineView];
}

id objc_msgSend_localizationQACaptionShowFilePath(void *a1, const char *a2, ...)
{
  return [a1 localizationQACaptionShowFilePath];
}

id objc_msgSend_localizationQACaptionShowLocalizedString(void *a1, const char *a2, ...)
{
  return [a1 localizationQACaptionShowLocalizedString];
}

id objc_msgSend_localizationQACaptionShowUSString(void *a1, const char *a2, ...)
{
  return [a1 localizationQACaptionShowUSString];
}

id objc_msgSend_lockUI(void *a1, const char *a2, ...)
{
  return [a1 lockUI];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return [a1 pathLocation];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_pointInsideCallback(void *a1, const char *a2, ...)
{
  return [a1 pointInsideCallback];
}

id objc_msgSend_processor(void *a1, const char *a2, ...)
{
  return [a1 processor];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return [a1 stroke];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideElement];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
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

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return [a1 yellowColor];
}