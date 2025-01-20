void sub_1364(_Unwind_Exception *exception_object, int a2)
{
  void *v2;
  id v3;
  NSObject *v4;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    v4 = [v2 _phoneBuddyFlowPanelLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2568((uint64_t)v3, v4);
    }

    objc_end_catch();
    JUMPOUT(0x12E8);
  }
  _Unwind_Resume(exception_object);
}

id sub_1FEC(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareUIForVideoReadyToPlay];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return objc_msgSend(v2, "removeObserver:forKeyPath:");
}

id sub_203C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeFromSuperview];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return objc_msgSend(v2, "removeObserver:forKeyPath:");
}

void sub_225C(id a1)
{
  qword_8A78 = (uint64_t)os_log_create("com.apple.WatchGestures", "EltonPhoneBuddyFlowPanelLog");

  _objc_release_x1();
}

void sub_2568(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "While trying to remove obervers caught exception: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BPSDeviceHasCapabilityForString()
{
  return _BPSDeviceHasCapabilityForString();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_msgSend__phoneBuddyFlowPanelLog(void *a1, const char *a2, ...)
{
  return [a1 _phoneBuddyFlowPanelLog];
}

id objc_msgSend__prepareUIForVideoReadyToPlay(void *a1, const char *a2, ...)
{
  return [a1 _prepareUIForVideoReadyToPlay];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_miniFlowDelegate(void *a1, const char *a2, ...)
{
  return [a1 miniFlowDelegate];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_timeControlStatus(void *a1, const char *a2, ...)
{
  return [a1 timeControlStatus];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}