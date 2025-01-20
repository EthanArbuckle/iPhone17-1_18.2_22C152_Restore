@interface Reader
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21automationmode_writer6Reader)init;
- (void)dealloc;
- (void)requestAutomationModeEnabledStateWithReply:(id)a3;
- (void)requestAutomationModeRequiresAuthenticationWithReply:(id)a3;
@end

@implementation Reader

- (void)dealloc
{
  uint64_t v2 = qword_100014A30;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006498(v4, (uint64_t)qword_100014A38);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Tearing down Reader", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for Reader();
  [(Reader *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC21automationmode_writer6Reader_bootSessionUUID;
  sub_1000065E0((uint64_t)v3);
}

- (void)requestAutomationModeEnabledStateWithReply:(id)a3
{
}

- (void)requestAutomationModeRequiresAuthenticationWithReply:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  char v9 = sub_10000598C(v7);

  return v9 & 1;
}

- (_TtC21automationmode_writer6Reader)init
{
  result = (_TtC21automationmode_writer6Reader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end