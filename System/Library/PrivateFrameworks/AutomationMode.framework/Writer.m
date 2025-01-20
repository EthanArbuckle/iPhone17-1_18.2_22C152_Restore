@interface Writer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21automationmode_writer6Writer)init;
- (void)createNoAuthenticationRequiredCookieWithCompletion:(id)a3;
- (void)dealloc;
- (void)disableAutomationModeWithCompletion:(id)a3;
- (void)enableAutomationModeWithAuthorization:(id)a3 completion:(id)a4;
- (void)enableAutomationModeWithCompletion:(id)a3;
- (void)removeNoAuthenticationRequiredCookieWithCompletion:(id)a3;
@end

@implementation Writer

- (void)dealloc
{
  uint64_t v2 = qword_100014A58;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006498(v4, (uint64_t)qword_100014C20);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Tearing down Writer", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for Writer();
  [(Writer *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006690((uint64_t)self + OBJC_IVAR____TtC21automationmode_writer6Writer_authorizationManager);
  sub_10000D330((uint64_t)self + OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID, (uint64_t *)&unk_100014BB0);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21automationmode_writer6Writer_userPreferencesScope);
}

- (_TtC21automationmode_writer6Writer)init
{
  result = (_TtC21automationmode_writer6Writer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  char v9 = sub_10000BD74(v7);

  return v9 & 1;
}

- (void)disableAutomationModeWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void *, void))_Block_copy(a3);
  v5 = self;
  sub_1000070B8(0);
  v4[2](v4, 0);
  _Block_release(v4);
}

- (void)enableAutomationModeWithCompletion:(id)a3
{
}

- (void)enableAutomationModeWithAuthorization:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_10000C28C(v8, v10, v11, v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_10000D0A4(v8, v10);
}

- (void)createNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
}

- (void)removeNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
}

@end