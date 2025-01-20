void start()
{
  void *v0;
  NSObject *v1;
  int v2;
  const char *v3;
  int v4;
  char *v5;
  int v6;
  void *v7;
  NSObject *v8;
  dispatch_workloop_t inactive;
  void *v10;
  dispatch_workloop_t v11;
  void *v12;
  int v13;
  int v14;
  uint8_t buf[1032];

  bzero(buf, 0x400uLL);
  if (_set_user_dir_suffix())
  {
    if (confstr(65537, (char *)buf, 0x400uLL))
    {
      v5 = realpath_DARWIN_EXTSN((const char *)buf, 0);
      if (v5)
      {
        free(v5);
        +[NSError _setFileNameLocalizationEnabled:0];
        v7 = (void *)os_transaction_create();
        v8 = __biome_log_for_category();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Launching biomed...", buf, 2u);
        }

        +[BMDaemonLibraryLoader loadRootLibrary];
        +[BMDaemon runLaunchTasks];
        inactive = dispatch_workloop_create_inactive("com.apple.biome.access-workloop");
        v10 = (void *)qword_1000081A0;
        qword_1000081A0 = (uint64_t)inactive;

        dispatch_set_qos_class_fallback();
        dispatch_activate((dispatch_object_t)qword_1000081A0);
        dispatch_async_and_wait((dispatch_queue_t)qword_1000081A0, &stru_1000041A0);
        v11 = dispatch_workloop_create_inactive("com.apple.biomed.compute-workloop");
        v12 = (void *)qword_1000081B0;
        qword_1000081B0 = (uint64_t)v11;

        dispatch_set_qos_class_fallback();
        dispatch_activate((dispatch_object_t)qword_1000081B0);
        dispatch_async_and_wait((dispatch_queue_t)qword_1000081B0, &stru_1000041C0);
        [(id)qword_1000081B8 setUpNotificationHandler];
        +[BMDaemon registerXPCActivities];
        +[CCDaemon resetRootDirectoryIfNecessary];
        +[CCDaemon registerXPCActivities];

        dispatch_main();
      }
      v1 = __biome_log_for_category();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        exit(1);
      }
      v6 = *__error();
      v13 = 67109120;
      v14 = v6;
      v3 = "failed to resolve temporary directory: %{darwin.errno}d";
    }
    else
    {
      v1 = __biome_log_for_category();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      v2 = *__error();
      v13 = 67109120;
      v14 = v2;
      v3 = "failed to initialize temporary directory: %{darwin.errno}d";
    }
  }
  else
  {
    v1 = __biome_log_for_category();
    if (!os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    v4 = *__error();
    v13 = 67109120;
    v14 = v4;
    v3 = "failed to set user dir suffix: %{darwin.errno}d";
  }
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v13, 8u);
  goto LABEL_8;
}

void sub_100003030(id a1)
{
  v1 = __biome_log_for_category();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Launching access service...", v10, 2u);
  }

  id v2 = objc_alloc((Class)BMAccessDelegate);
  v11[0] = &off_100004278;
  v3 = objc_opt_new();
  v11[1] = &off_100004290;
  v12[0] = v3;
  v4 = objc_opt_new();
  v12[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v6 = [v2 initWithDelegates:v5];

  id v7 = objc_alloc((Class)BMAccessDaemon);
  id v8 = [v7 initWithQueue:qword_1000081A0 delegate:v6];
  v9 = (void *)qword_1000081A8;
  qword_1000081A8 = (uint64_t)v8;
}

void sub_100003188(id a1)
{
  v1 = __biome_log_for_category();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Launching compute services...", v9, 2u);
  }

  +[BMDaemon donateLaunchEventsWithQueue:qword_1000081B0];
  id v2 = +[GDComputeOrchestration start];
  id v3 = objc_alloc((Class)BMDaemon);
  id v4 = [v3 initWithQueue:qword_1000081B0 eventReporter:v2];
  v5 = (void *)qword_1000081B8;
  qword_1000081B8 = (uint64_t)v4;

  id v6 = objc_alloc((Class)CCDaemon);
  id v7 = [v6 initWithQueue:qword_1000081B0];
  id v8 = (void *)qword_1000081C0;
  qword_1000081C0 = (uint64_t)v7;
}

uint64_t static BMDaemonLibraryLoader.loadRootLibrary()()
{
  uint64_t v0 = type metadata accessor for Library();
  unint64_t v1 = sub_1000032B4();

  return static UnifiedLibrary.add(library:)(v0, v1);
}

unint64_t sub_1000032B4()
{
  unint64_t result = qword_100008170;
  if (!qword_100008170)
  {
    type metadata accessor for Library();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008170);
  }
  return result;
}

id BMDaemonLibraryLoader.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id BMDaemonLibraryLoader.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for BMDaemonLibraryLoader()
{
  return self;
}

id BMDaemonLibraryLoader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for Library()
{
  return type metadata accessor for Library();
}

uint64_t __biome_log_for_category()
{
  return ___biome_log_for_category();
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_donateLaunchEventsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateLaunchEventsWithQueue:");
}

id objc_msgSend_initWithDelegates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegates:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:delegate:");
}

id objc_msgSend_initWithQueue_eventReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:eventReporter:");
}

id objc_msgSend_loadRootLibrary(void *a1, const char *a2, ...)
{
  return _[a1 loadRootLibrary];
}

id objc_msgSend_registerXPCActivities(void *a1, const char *a2, ...)
{
  return _[a1 registerXPCActivities];
}

id objc_msgSend_resetRootDirectoryIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 resetRootDirectoryIfNecessary];
}

id objc_msgSend_runLaunchTasks(void *a1, const char *a2, ...)
{
  return _[a1 runLaunchTasks];
}

id objc_msgSend_setUpNotificationHandler(void *a1, const char *a2, ...)
{
  return _[a1 setUpNotificationHandler];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}