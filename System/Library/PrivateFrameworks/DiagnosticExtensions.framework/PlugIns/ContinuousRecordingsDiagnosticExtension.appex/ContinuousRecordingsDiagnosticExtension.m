uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_forceFlushHIDContinuousRecorder(void *a1, const char *a2, ...)
{
  return [a1 forceFlushHIDContinuousRecorder];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}
AutoreleasedReturnValue();
  v14 = v38;

  if (v14)
  {
    v15 = v30;
  }
  else
  {
    v26 = 0;
    v27 = v13;
    v28 = v8;
    v29 = v5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = v13;
    v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v17)
    {
      v18 = v17;
      v19 = self;
      v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v33 = 0;
          objc_msgSend(v22, "getResourceValue:forKey:error:", &v33, NSURLIsDirectoryKey, 0, v26, v27, v28, v29);
          v23 = v33;
          if ([v23 BOOLValue])
          {
            v24 = [(ContinuousRecordingsDiagnosticExtension *)v19 filesInDir:v22 matchingPattern:v32 excludingPattern:v9];

            [v31 addObjectsFromArray:v24];
            v10 = (void *)v24;
          }
        }
        v18 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v18);
    }

    v5 = v29;
    v15 = v30;
    v13 = v27;
    v8 = v28;
    v14 = v26;
  }

  return v31;
}

- (void)forceFlushHIDContinuousRecorder
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to force flush HID continuous recording session filter", v1, 2u);
}

void __74__ContinuousRecordingsDiagnosticExtension_forceFlushHIDContinuousRecorder__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

@end