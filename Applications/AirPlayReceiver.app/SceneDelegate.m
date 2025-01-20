@interface SceneDelegate
- (_TtC15AirPlayReceiver13SceneDelegate)init;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
- (void)didStartStreamingWithRenderer:(id)a3;
- (void)didStopStreamingWithRenderer:(id)a3;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)shouldAskPermissionWithRequestID:(id)a3 forClientWithName:(id)a4 withCompletionBlock:(id)a5;
- (void)shouldCancelPermissionRequestWithRequestID:(id)a3;
- (void)shouldHideGlobalPasscode;
- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100011824(v8, v10);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_1000076F8(0, &qword_1000228E8);
  sub_100012FE4();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100011584(v6);

  swift_bridgeObjectRelease();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100012068();
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100012534();
}

- (_TtC15AirPlayReceiver13SceneDelegate)init
{
  return (_TtC15AirPlayReceiver13SceneDelegate *)sub_10000EBF4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeExpirationTimer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer));
  swift_bridgeObjectRelease();
  sub_100009A10((uint64_t)self + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__notificationToken, &qword_100022308);
  sub_100009A10((uint64_t)self + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate_guestUserHandoverService, &qword_1000228D8);
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000127F4();
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v6 = qword_100022040;
  id v7 = a3;
  v13 = self;
  id v8 = a4;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100007B14(v9, (uint64_t)qword_1000238C0);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Runtime assertion did invalidate!", v12, 2u);
    swift_slowDealloc();
  }
}

- (void)didStartStreamingWithRenderer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000F30C(v4);
}

- (void)didStopStreamingWithRenderer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100012AB0("didStopStreaming", (uint64_t)&unk_10001D450, (uint64_t)sub_100012C30, (uint64_t)&unk_10001D468);
}

- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  os_log_type_t v11 = self;
  sub_10000F820(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)shouldHideGlobalPasscode
{
  v2 = self;
  sub_100012AB0("shouldHideGlobalPasscode", (uint64_t)&unk_10001D360, (uint64_t)sub_100011480, (uint64_t)&unk_10001D378);
}

- (void)shouldAskPermissionWithRequestID:(id)a3 forClientWithName:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v11;
  v16 = self;
  sub_10000FF9C((uint64_t)v10, v12, v14, (uint64_t)sub_10001129C, v15);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)shouldCancelPermissionRequestWithRequestID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1000105F0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end