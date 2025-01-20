void sub_1000033AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1000033FC(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained buttonEventMonitor];
  id v3 = objc_loadWeakRetained(v1);
  [v2 addTarget:v3 action:"handleButtonEvent:" forButtonEvents:0xFFFFFFFFLL propagate:0];
}

void sub_1000036B0(uint64_t a1)
{
  v2 = objc_opt_new();
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100003A34;
  v31[3] = &unk_10000C2C8;
  id v3 = *(void **)(a1 + 40);
  v31[4] = *(void *)(a1 + 32);
  id v32 = v3;
  [v2 preflight:0 withReply:v31];
  v4 = *(NSObject **)(a1 + 40);
  dispatch_time_t v5 = dispatch_time(0, 240000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    uint64_t v6 = CRErrorDomain;
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"Preflight time out";
    v7 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v8 = +[NSError errorWithDomain:v6 code:-80 userInfo:v7];

    v9 = [*(id *)(a1 + 32) uiNeededKnownSemaphore];
    dispatch_semaphore_signal(v9);

    v10 = *(void **)(a1 + 32);
LABEL_13:
    uint64_t v20 = -80;
    goto LABEL_14;
  }
  if ([*(id *)(a1 + 32) preflightSuccess])
  {
    uint64_t v11 = [*(id *)(a1 + 32) preflightResults];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [*(id *)(a1 + 32) preflightError];

      if (!v13)
      {
        [*(id *)(a1 + 32) setRepairSummaryNeeded:1];
        v29 = [*(id *)(a1 + 32) uiNeededKnownSemaphore];
        dispatch_semaphore_signal(v29);

        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100003BDC;
        v30[3] = &unk_10000C2F0;
        v30[4] = *(void *)(a1 + 32);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
        goto LABEL_15;
      }
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) preflightError];
  if (v14
    && (v15 = (void *)v14,
        [*(id *)(a1 + 32) preflightError],
        v16 = objc_claimAutoreleasedReturnValue(),
        id v17 = [v16 code],
        v16,
        v15,
        v17 == (id)-92))
  {
    v18 = [*(id *)(a1 + 32) uiNeededKnownSemaphore];
    dispatch_semaphore_signal(v18);

    v19 = *(void **)(a1 + 32);
    v8 = [v19 preflightError];
    v10 = v19;
    uint64_t v20 = -92;
  }
  else
  {
    uint64_t v21 = [*(id *)(a1 + 32) preflightError];
    if (!v21
      || (v22 = (void *)v21,
          [*(id *)(a1 + 32) preflightError],
          v23 = objc_claimAutoreleasedReturnValue(),
          id v24 = [v23 code],
          v23,
          v22,
          v24 != (id)-93))
    {
      v27 = [*(id *)(a1 + 32) uiNeededKnownSemaphore];
      dispatch_semaphore_signal(v27);

      v28 = *(void **)(a1 + 32);
      v8 = [v28 preflightError];
      v10 = v28;
      goto LABEL_13;
    }
    v25 = [*(id *)(a1 + 32) uiNeededKnownSemaphore];
    dispatch_semaphore_signal(v25);

    v26 = *(void **)(a1 + 32);
    v8 = [v26 preflightError];
    v10 = v26;
    uint64_t v20 = -93;
  }
LABEL_14:
  [v10 endTestWithStatusCode:v20 error:v8];

LABEL_15:
}

void sub_100003A34(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109120;
    LODWORD(v13) = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight success: %d", (uint8_t *)&v12, 8u);
  }

  v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preflight results: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preflight error: %@", (uint8_t *)&v12, 0xCu);
  }

  [*(id *)(a1 + 32) setPreflightSuccess:a2];
  [*(id *)(a1 + 32) setPreflightResults:v7];
  [*(id *)(a1 + 32) setPreflightError:v8];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100003BDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateViewWithRepairSummary];
}

void sub_100003DB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonEventMonitor];
  [v2 removeTarget:*(void *)(a1 + 32)];
}

uint64_t sub_100007084()
{
  if (!qword_100011DA8) {
    qword_100011DA8 = _sl_dlopen();
  }
  return qword_100011DA8;
}

uint64_t sub_100007154()
{
  uint64_t result = _sl_dlopen();
  qword_100011DA8 = result;
  return result;
}

Class sub_1000071C8(uint64_t a1)
{
  if (!sub_100007084())
  {
    id v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("DSHardwareButtonEventMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100007358();
  }
  qword_100011DB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100007258(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007288()
{
  sub_100007274();
  sub_100007258((void *)&_mh_execute_header, v0, v1, "ButtonEventMonitor not available", v2, v3, v4, v5, v6);
}

void sub_1000072BC()
{
  sub_100007274();
  sub_100007258((void *)&_mh_execute_header, v0, v1, "DiagnosticsSupport not available", v2, v3, v4, v5, v6);
}

void sub_1000072F0()
{
  sub_100007274();
  sub_100007258((void *)&_mh_execute_header, v0, v1, "Missing partSPCs", v2, v3, v4, v5, v6);
}

void sub_100007324()
{
  sub_100007274();
  sub_100007258((void *)&_mh_execute_header, v0, v1, "Missing preflight RIK", v2, v3, v4, v5, v6);
}

void sub_100007358()
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
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

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return [a1 buttonEventMonitor];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return [a1 coordinator];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultContentConfiguration];
}

id objc_msgSend_deniedSPCs(void *a1, const char *a2, ...)
{
  return [a1 deniedSPCs];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_failSPCs(void *a1, const char *a2, ...)
{
  return [a1 failSPCs];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_imageProperties(void *a1, const char *a2, ...)
{
  return [a1 imageProperties];
}

id objc_msgSend_initRepairSummaryTable(void *a1, const char *a2, ...)
{
  return [a1 initRepairSummaryTable];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_lockSPCs(void *a1, const char *a2, ...)
{
  return [a1 lockSPCs];
}

id objc_msgSend_lostSPCs(void *a1, const char *a2, ...)
{
  return [a1 lostSPCs];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_moveToNextViewController(void *a1, const char *a2, ...)
{
  return [a1 moveToNextViewController];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_passSPCs(void *a1, const char *a2, ...)
{
  return [a1 passSPCs];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_preflightError(void *a1, const char *a2, ...)
{
  return [a1 preflightError];
}

id objc_msgSend_preflightRIK(void *a1, const char *a2, ...)
{
  return [a1 preflightRIK];
}

id objc_msgSend_preflightResults(void *a1, const char *a2, ...)
{
  return [a1 preflightResults];
}

id objc_msgSend_preflightSuccess(void *a1, const char *a2, ...)
{
  return [a1 preflightSuccess];
}

id objc_msgSend_repairSummaryNeeded(void *a1, const char *a2, ...)
{
  return [a1 repairSummaryNeeded];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_sealedSPCs(void *a1, const char *a2, ...)
{
  return [a1 sealedSPCs];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_tableDataText(void *a1, const char *a2, ...)
{
  return [a1 tableDataText];
}

id objc_msgSend_tableDataText2(void *a1, const char *a2, ...)
{
  return [a1 tableDataText2];
}

id objc_msgSend_tableImage(void *a1, const char *a2, ...)
{
  return [a1 tableImage];
}

id objc_msgSend_tableImageColor(void *a1, const char *a2, ...)
{
  return [a1 tableImageColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_uiNeededKnownSemaphore(void *a1, const char *a2, ...)
{
  return [a1 uiNeededKnownSemaphore];
}

id objc_msgSend_unauthSPCs(void *a1, const char *a2, ...)
{
  return [a1 unauthSPCs];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}