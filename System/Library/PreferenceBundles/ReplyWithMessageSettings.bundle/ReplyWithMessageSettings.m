id PHDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_83F8 != -1) {
    dispatch_once(&qword_83F8, &stru_41C8);
  }
  v0 = (void *)qword_83F0;

  return v0;
}

void sub_2E28(id a1)
{
  qword_83F0 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_8408 != -1) {
    dispatch_once(&qword_8408, &stru_41E8);
  }
  v0 = (void *)qword_8400;

  return v0;
}

void sub_2EC0(id a1)
{
  qword_8400 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_8418 != -1) {
    dispatch_once(&qword_8418, &stru_4208);
  }
  v0 = (void *)qword_8410;

  return v0;
}

void sub_2F58(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)qword_8410;
  qword_8410 = (uint64_t)v1;
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_customReplies(void *a1, const char *a2, ...)
{
  return [a1 customReplies];
}

id objc_msgSend_defaultReplies(void *a1, const char *a2, ...)
{
  return [a1 defaultReplies];
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return [a1 editableTextField];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_replyWithMessageStore(void *a1, const char *a2, ...)
{
  return [a1 replyWithMessageStore];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
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

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}