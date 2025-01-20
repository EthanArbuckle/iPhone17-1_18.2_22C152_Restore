@interface RemoteAlertHandleObserver
- (_TtC13GameOverlayUI25RemoteAlertHandleObserver)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation RemoteAlertHandleObserver

- (_TtC13GameOverlayUI25RemoteAlertHandleObserver)init
{
  swift_defaultActor_initialize();
  *(void *)self->map = _swiftEmptyDictionarySingleton;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RemoteAlertHandleObserver();
  return [(RemoteAlertHandleObserver *)&v4 init];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v3 = qword_10013FBB0;
  id v8 = a3;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007D4C(v4, (uint64_t)qword_100156CF8);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "RemoteAlertHandle did activate.", v7, 2u);
    swift_slowDealloc();
  }
  swift_release();
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1000CE820(v3);

  swift_release();
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  swift_retain();
  id v6 = a4;
  sub_1000CEC14(v5, (uint64_t)a4);

  swift_release();
}

@end