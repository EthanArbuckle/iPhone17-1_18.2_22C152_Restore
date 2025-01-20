@interface ServiceManager
- (_TtC7Sidecar14ServiceManager)init;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)_handleHomeButtonPressedWithNote:(id)a3;
- (void)_handleVolumeDownButtonPressedWithNote:(id)a3;
- (void)_handleVolumeUpButtonPressedWithNote:(id)a3;
- (void)_screenDidConnectWithNote:(id)a3;
- (void)_screenDidDisconnectWithNote:(id)a3;
- (void)dealloc;
@end

@implementation ServiceManager

- (_TtC7Sidecar14ServiceManager)init
{
  return (_TtC7Sidecar14ServiceManager *)sub_1000081B8();
}

- (void)dealloc
{
  v2 = self;
  sub_100008578();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig);
  uint64_t v4 = *(void *)&self->window[OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig];

  sub_100012640(v3, v4);
}

- (void)_screenDidConnectWithNote:(id)a3
{
}

- (void)_screenDidDisconnectWithNote:(id)a3
{
}

- (void)_handleHomeButtonPressedWithNote:(id)a3
{
  uint64_t v5 = sub_10000646C((uint64_t *)&unk_100026D18);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for Notification();
    uint64_t v9 = 1;
  }
  sub_1000126C8((uint64_t)v7, v9, 1, v8);
  v10 = self;
  sub_10000FC40();

  sub_100014EB0((uint64_t)v7, (uint64_t *)&unk_100026D18);
}

- (void)_handleVolumeDownButtonPressedWithNote:(id)a3
{
}

- (void)_handleVolumeUpButtonPressedWithNote:(id)a3
{
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  id v14 = sub_100010AA8((uint64_t)v13, a4);

  return v14;
}

@end