int main(int argc, const char **argv, const char **envp)
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = sub_1000029F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "IVRConversationAssistantXPC bring up", v10, 2u);
  }

  v4 = objc_opt_new();
  v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);

  v8 = dispatch_queue_create("com.apple.IVRConversationAssistantXPC.ServicesQueue", v7);
  dispatch_async(v8, &stru_100004138);

  return 0;
}

id sub_1000029F4()
{
  if (qword_100008A18 != -1) {
    dispatch_once(&qword_100008A18, &stru_100004158);
  }
  v0 = (void *)qword_100008A10;
  return v0;
}

void sub_100002A48(id a1)
{
  v1 = sub_1000029F4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "IVRConversationAssistantXPC launching shared services", v3, 2u);
  }

  id v2 = +[Transcriber sharedInstance];
}

void sub_100002AC4(id a1)
{
  qword_100008A10 = (uint64_t)os_log_create("com.apple.ivrconversationassistant", "IVRCADefaultLog");
  _objc_release_x1();
}

void sub_100002D6C(id a1)
{
  qword_100008A20 = objc_alloc_init(Transcriber);
  _objc_release_x1();
}

void sub_100002F48(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_100008A38 != -1) {
    dispatch_once(&qword_100008A38, &stru_1000041C0);
  }
  v4 = (void *)qword_100008A30;
  if (os_log_type_enabled((os_log_t)qword_100008A30, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = [v3 transcribedText];
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Transcribed data: %@", (uint8_t *)&v8, 0xCu);
  }
  v7 = [v3 transcribedText];
  [*(id *)(a1 + 32) setTranscription:v7];
}

void sub_10000316C(id a1)
{
  qword_100008A30 = (uint64_t)os_log_create("com.apple.ivrconversationassistant", "IVRCADefaultLog");
  _objc_release_x1();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
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

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_startTranscribing(void *a1, const char *a2, ...)
{
  return [a1 startTranscribing];
}

id objc_msgSend_stopTranscribing(void *a1, const char *a2, ...)
{
  return [a1 stopTranscribing];
}

id objc_msgSend_tapType(void *a1, const char *a2, ...)
{
  return [a1 tapType];
}

id objc_msgSend_transcribedText(void *a1, const char *a2, ...)
{
  return [a1 transcribedText];
}

id objc_msgSend_transcriber(void *a1, const char *a2, ...)
{
  return [a1 transcriber];
}

id objc_msgSend_transcriberHandle(void *a1, const char *a2, ...)
{
  return [a1 transcriberHandle];
}

id objc_msgSend_transcription(void *a1, const char *a2, ...)
{
  return [a1 transcription];
}