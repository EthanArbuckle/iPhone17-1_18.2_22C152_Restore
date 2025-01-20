@interface SDSignalHandler
+ (void)addMemoryHandler;
+ (void)addSignalHandler;
+ (void)setDelegate:(id)a3 memoryStatusFlags:(unint64_t)a4;
+ (void)setupHandlers;
@end

@implementation SDSignalHandler

+ (void)setDelegate:(id)a3 memoryStatusFlags:(unint64_t)a4
{
  qword_1000F9230 = a4;
}

+ (void)setupHandlers
{
  +[SDSignalHandler addSignalHandler];

  +[SDSignalHandler addMemoryHandler];
}

+ (void)addSignalHandler
{
  signal(2, (void (__cdecl *)(int))1);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v2, &stru_1000DC950);
  if (!v2) {
    sub_1000A383C();
  }
  dispatch_resume(v2);
  uint64_t v3 = dword_1000F9288++;
  v4 = (void *)qword_1000F9238[v3];
  qword_1000F9238[v3] = v2;

  signal(15, (void (__cdecl *)(int))1);
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);

  dispatch_source_set_event_handler(v5, &stru_1000DC970);
  if (!v5) {
    sub_1000A3868();
  }
  dispatch_resume(v5);
  uint64_t v6 = dword_1000F9288++;
  v7 = (void *)qword_1000F9238[v6];
  qword_1000F9238[v6] = v5;

  signal(1, (void (__cdecl *)(int))1);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);

  dispatch_source_set_event_handler(v8, &stru_1000DC990);
  if (!v8) {
    sub_1000A3894();
  }
  dispatch_resume(v8);
  uint64_t v9 = dword_1000F9288++;
  v10 = (void *)qword_1000F9238[v9];
  qword_1000F9238[v9] = v8;

  signal(30, (void (__cdecl *)(int))1);
  v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);

  dispatch_source_set_event_handler(v11, &stru_1000DC9B0);
  if (!v11) {
    sub_1000A38C0();
  }
  dispatch_resume(v11);
  uint64_t v12 = dword_1000F9288++;
  v13 = (void *)qword_1000F9238[v12];
  qword_1000F9238[v12] = v11;

  signal(31, (void (__cdecl *)(int))1);
  v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, (dispatch_queue_t)&_dispatch_main_q);

  dispatch_source_set_event_handler(v14, &stru_1000DC9D0);
  if (!v14) {
    sub_1000A38EC();
  }
  dispatch_resume(v14);
  uint64_t v15 = dword_1000F9288++;
  v16 = (void *)qword_1000F9238[v15];
  qword_1000F9238[v15] = v14;
}

+ (void)addMemoryHandler
{
  uintptr_t v2 = qword_1000F9230;
  uint64_t v3 = dispatch_get_global_queue(2, 2uLL);
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, v2, v3);
  v5 = (void *)qword_1000F9290;
  qword_1000F9290 = (uint64_t)v4;

  if (qword_1000F9290)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_1000F9290, &stru_1000DC9F0);
    uint64_t v6 = qword_1000F9290;
    dispatch_activate(v6);
  }
  else
  {
    v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating memory pressure handler failed", v8, 2u);
    }
  }
}

@end