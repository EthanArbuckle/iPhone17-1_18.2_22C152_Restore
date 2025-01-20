void sub_10000394C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003974(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateDevices];
}

int64_t sub_1000039E4(id a1, NSString *a2, NSString *a3)
{
  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 == @"local")
  {
    int64_t v7 = -1;
  }
  else if (v5 == @"local")
  {
    int64_t v7 = 1;
  }
  else
  {
    int64_t v7 = (int64_t)[(__CFString *)v4 localizedCaseInsensitiveCompare:v5];
  }

  return v7;
}

id sub_100003C44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardownBlockDidFireWithBackgroundTask:*(void *)(a1 + 40)];
}

id sub_100003D44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardownBlockDidFireWithBackgroundTask:*(void *)(a1 + 40)];
}

void sub_100003E78(uint64_t a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v2 = *(void *)(a1 + 32);
  double v4 = v3 - *(double *)(v2 + 48);
  if (v4 >= 1.0)
  {
    [(id)v2 updateDevices];
  }
  else if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    uint64_t v5 = 1000000000 * (uint64_t)(1.0 - v4);
    v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    dispatch_time_t v7 = dispatch_time(0, v5);
    dispatch_source_set_timer(v6, v7, v5, 0x3B9ACA00uLL);
    v8 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    dispatch_resume(v8);
  }
}

void sub_1000042B8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  double v3 = [*(id *)(a1 + 40) device];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004384;
  v4[3] = &unk_100008330;
  id v5 = *(id *)(a1 + 40);
  [v2 setOutputDevice:v3 options:&__NSDictionary0__struct completionHandler:v4];

  [*(id *)(a1 + 32) scheduleTeardownEndingBackgroundTask:*(void *)(a1 + 48)];
}

void sub_100004384(uint64_t a1, void *a2)
{
  if ([a2 status] == (id)2)
  {
    id v3 = [*(id *)(a1 + 32) device];
    [v3 setSecondDisplayEnabled:1];
  }
}

void sub_100004B78(uint64_t a1)
{
  uint64_t v2 = [[_UIScreenRouteArrayController alloc] initWithDelegate:0];
  [(_UIScreenRouteArrayController *)v2 selectRoute:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004CA4(uint64_t a1)
{
  id v3 = +[AVOutputContext outputContext];
  objc_msgSend(v3, "setApplicationProcessID:", objc_msgSend(*(id *)(a1 + 32), "_hostProcessIdentifier"));
  uint64_t v2 = [v3 outputDevice];
  [v2 setSecondDisplayEnabled:*(unsigned __int8 *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100004F90(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSearchResults:*(void *)(a1 + 40) changes:*(void *)(a1 + 48)];
}

void sub_1000051E8(uint64_t a1, void *a2, void *a3)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 tableView];
  [v7 moveRowAtIndexPath:v6 toIndexPath:v5];
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__dismissViewController(void *a1, const char *a2, ...)
{
  return [a1 _dismissViewController];
}

id objc_msgSend__hostProcessIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostProcessIdentifier];
}

id objc_msgSend_armTimer(void *a1, const char *a2, ...)
{
  return [a1 armTimer];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_availableOutputDevices(void *a1, const char *a2, ...)
{
  return [a1 availableOutputDevices];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
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

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_deviceSubType(void *a1, const char *a2, ...)
{
  return [a1 deviceSubType];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hostingViewController(void *a1, const char *a2, ...)
{
  return [a1 hostingViewController];
}

id objc_msgSend_identifierForVendor(void *a1, const char *a2, ...)
{
  return [a1 identifierForVendor];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_outputContext(void *a1, const char *a2, ...)
{
  return [a1 outputContext];
}

id objc_msgSend_outputDevice(void *a1, const char *a2, ...)
{
  return [a1 outputDevice];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_rowHeight(void *a1, const char *a2, ...)
{
  return [a1 rowHeight];
}

id objc_msgSend_sharedLocalDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedLocalDevice];
}

id objc_msgSend_sortTitle(void *a1, const char *a2, ...)
{
  return [a1 sortTitle];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_updateDevices(void *a1, const char *a2, ...)
{
  return [a1 updateDevices];
}

id objc_msgSend_updatePreferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 updatePreferredContentSize];
}