@interface SceneSessionManager
- (void)didReceiveMemoryWarning:(id)a3;
@end

@implementation SceneSessionManager

- (void)didReceiveMemoryWarning:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = qword_100042E30;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007F84(v8, (uint64_t)qword_100045D18);
  v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "didReceiveMemoryWarning", v11, 2u);
    swift_slowDealloc();
  }

  sub_1000139E4(0);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end