@interface TouchEventMonitor
+ (TouchEventInfo)copyCurrentTouchPositions;
+ (id)sharedTouchEventMonitor;
+ (void)removeAllTouchPositions;
+ (void)startMonitoringTouchEvents;
+ (void)stopMonitoringTouchEvents;
- (BOOL)monitoringEvents;
- (NSLock)touchInfoLock;
- (OS_dispatch_source)touchEventTimer;
- (TouchEventMonitor)init;
- (__IOHIDEventSystemClient)hidEventClient;
- (int64_t)monitorCount;
- (void)dealloc;
- (void)setHidEventClient:(__IOHIDEventSystemClient *)a3;
- (void)setMonitorCount:(int64_t)a3;
- (void)setMonitoringEvents:(BOOL)a3;
- (void)setTouchEventTimer:(id)a3;
- (void)setTouchInfoLock:(id)a3;
@end

@implementation TouchEventMonitor

+ (id)sharedTouchEventMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007000;
  block[3] = &unk_100054AF0;
  block[4] = a1;
  if (qword_10005C658 != -1) {
    dispatch_once(&qword_10005C658, block);
  }
  v2 = (void *)qword_10005C650;

  return v2;
}

- (TouchEventMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)TouchEventMonitor;
  v2 = [(TouchEventMonitor *)&v5 init];
  if (v2)
  {
    v2->_hidEventClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    v3 = objc_opt_new();
    [(TouchEventMonitor *)v2 setTouchInfoLock:v3];
  }
  return v2;
}

- (void)dealloc
{
  +[TouchEventMonitor stopMonitoringTouchEvents];
  hidEventClient = self->_hidEventClient;
  if (hidEventClient)
  {
    CFRelease(hidEventClient);
    self->_hidEventClient = 0;
  }
  [(TouchEventMonitor *)self setTouchInfoLock:0];
  v4.receiver = self;
  v4.super_class = (Class)TouchEventMonitor;
  [(TouchEventMonitor *)&v4 dealloc];
}

+ (void)stopMonitoringTouchEvents
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stopMonitoringTouchEvents", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 67, "+[TouchEventMonitor stopMonitoringTouchEvents]", 7, 0, "stopMonitoringTouchEvents");
  v2 = +[TouchEventMonitor sharedTouchEventMonitor];
  v3 = [v2 touchInfoLock];
  [v3 lock];

  objc_super v4 = +[TouchEventMonitor sharedTouchEventMonitor];
  uint64_t v5 = (uint64_t)[v4 monitorCount];

  if (v5 < 1)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stopMonitoringTouchEvents called when not monitoring", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 99, "+[TouchEventMonitor stopMonitoringTouchEvents]", 7, 0, "stopMonitoringTouchEvents called when not monitoring");
  }
  else
  {
    v6 = +[TouchEventMonitor sharedTouchEventMonitor];
    objc_msgSend(v6, "setMonitorCount:", (char *)objc_msgSend(v6, "monitorCount") - 1);

    v7 = +[TouchEventMonitor sharedTouchEventMonitor];
    id v8 = [v7 monitorCount];

    if (v8)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v9 = +[TouchEventMonitor sharedTouchEventMonitor];
        id v10 = [v9 monitorCount];
        *(_DWORD *)buf = 134217984;
        id v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "monitorCount %ld", buf, 0xCu);
      }
      v11 = +[TouchEventMonitor sharedTouchEventMonitor];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 96, "+[TouchEventMonitor stopMonitoringTouchEvents]", 7, 0, "monitorCount %ld", [v11 monitorCount]);
LABEL_19:

      goto LABEL_20;
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100054B30);
    v12 = +[TouchEventMonitor sharedTouchEventMonitor];
    v13 = [v12 touchEventTimer];

    if (v13)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stop timer", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 90, "+[TouchEventMonitor stopMonitoringTouchEvents]", 7, 0, "stop timer");
      v14 = +[TouchEventMonitor sharedTouchEventMonitor];
      v15 = [v14 touchEventTimer];
      dispatch_source_cancel(v15);

      v11 = +[TouchEventMonitor sharedTouchEventMonitor];
      [v11 setTouchEventTimer:0];
      goto LABEL_19;
    }
  }
LABEL_20:
  v16 = +[TouchEventMonitor sharedTouchEventMonitor];
  v17 = [v16 touchInfoLock];
  [v17 unlock];
}

+ (void)startMonitoringTouchEvents
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "startMonitoringTouchEvents", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 105, "+[TouchEventMonitor startMonitoringTouchEvents]", 7, 0, "startMonitoringTouchEvents");
  v2 = +[TouchEventMonitor sharedTouchEventMonitor];
  v3 = [v2 touchInfoLock];
  [v3 lock];

  objc_super v4 = +[TouchEventMonitor sharedTouchEventMonitor];
  id v5 = [v4 monitorCount];

  if (v5)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = +[TouchEventMonitor sharedTouchEventMonitor];
      id v7 = [v6 monitorCount];
      *(_DWORD *)buf = 134217984;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[TouchEventMonitor sharedTouchEventMonitor].monitorCoun %ld", buf, 0xCu);
    }
    id v8 = +[TouchEventMonitor sharedTouchEventMonitor];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 149, "+[TouchEventMonitor startMonitoringTouchEvents]", 7, 0, "[TouchEventMonitor sharedTouchEventMonitor].monitorCoun %ld", [v8 monitorCount]);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100054B50);
    id v8 = dispatch_get_global_queue(2, 0);
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
    id v10 = +[TouchEventMonitor sharedTouchEventMonitor];
    [v10 setTouchEventTimer:v9];

    dispatch_time_t v11 = dispatch_walltime(0, 0);
    v12 = +[TouchEventMonitor sharedTouchEventMonitor];
    v13 = [v12 touchEventTimer];
    dispatch_source_set_timer(v13, v11, 0x2FAF080uLL, 0x3D0900uLL);

    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = +[TouchEventMonitor sharedTouchEventMonitor];
      v15 = [v14 touchEventTimer];
      *(_DWORD *)buf = 134217984;
      id v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[TouchEventMonitor sharedTouchEventMonitor].touchEventTimer %p", buf, 0xCu);
    }
    v16 = +[TouchEventMonitor sharedTouchEventMonitor];
    v17 = [v16 touchEventTimer];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/TouchEventMonitor.m", 110, 136, "+[TouchEventMonitor startMonitoringTouchEvents]", 7, 0, "[TouchEventMonitor sharedTouchEventMonitor].touchEventTimer %p", v17);

    v18 = +[TouchEventMonitor sharedTouchEventMonitor];
    id v19 = [v18 touchEventTimer];
    dispatch_source_set_event_handler(v19, &stru_100054B70);

    v20 = +[TouchEventMonitor sharedTouchEventMonitor];
    v21 = [v20 touchEventTimer];
    dispatch_resume(v21);
  }
  v22 = +[TouchEventMonitor sharedTouchEventMonitor];
  objc_msgSend(v22, "setMonitorCount:", (char *)objc_msgSend(v22, "monitorCount") + 1);

  v23 = +[TouchEventMonitor sharedTouchEventMonitor];
  v24 = [v23 touchInfoLock];
  [v24 unlock];
}

+ (TouchEventInfo)copyCurrentTouchPositions
{
  v2 = +[TouchEventMonitor sharedTouchEventMonitor];
  v3 = [v2 touchInfoLock];
  [v3 lock];

  if (byte_10005C660 == 1)
  {
    objc_super v4 = (TouchEventInfo *)malloc_type_malloc(0x280uLL, 0x1000040F6D918ACuLL);
    memcpy(v4, dword_10005C668, 0x280uLL);
    byte_10005C660 = 0;
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = +[TouchEventMonitor sharedTouchEventMonitor];
  v6 = [v5 touchInfoLock];
  [v6 unlock];

  return v4;
}

+ (void)removeAllTouchPositions
{
  v2 = +[TouchEventMonitor sharedTouchEventMonitor];
  v3 = [v2 touchInfoLock];
  [v3 lock];

  byte_10005C660 = 0;
  id v5 = +[TouchEventMonitor sharedTouchEventMonitor];
  objc_super v4 = [v5 touchInfoLock];
  [v4 unlock];
}

- (__IOHIDEventSystemClient)hidEventClient
{
  return self->_hidEventClient;
}

- (void)setHidEventClient:(__IOHIDEventSystemClient *)a3
{
  self->_hidEventClient = a3;
}

- (BOOL)monitoringEvents
{
  return self->_monitoringEvents;
}

- (void)setMonitoringEvents:(BOOL)a3
{
  self->_monitoringEvents = a3;
}

- (int64_t)monitorCount
{
  return self->_monitorCount;
}

- (void)setMonitorCount:(int64_t)a3
{
  self->_monitorCount = a3;
}

- (NSLock)touchInfoLock
{
  return (NSLock *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTouchInfoLock:(id)a3
{
}

- (OS_dispatch_source)touchEventTimer
{
  return self->_touchEventTimer;
}

- (void)setTouchEventTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchEventTimer, 0);

  objc_storeStrong((id *)&self->_touchInfoLock, 0);
}

@end