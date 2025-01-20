@interface CCUIGameModeActivityDataProvider
- (BOOL)gameModeAAA;
- (NSSet)activityData;
- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)init;
- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)initWithDelegate:(id)a3;
- (int64_t)stateForBundleIdentifier:(id)a3;
- (unint64_t)gameModeState;
- (void)setActivityData:(id)a3;
- (void)setGameModeAAA:(BOOL)a3;
- (void)setGameModeState:(unint64_t)a3;
- (void)setWithState:(int64_t)a3 forBundleIdentifier:(id)a4 callback:(id)a5;
@end

@implementation CCUIGameModeActivityDataProvider

- (NSSet)activityData
{
  swift_beginAccess();
  sub_1D7B2170C(0, &qword_1EBDFF990);
  sub_1D7B21748();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D7BB7398();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (unint64_t)gameModeState
{
  v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState);
  swift_beginAccess();
  return *v2;
}

- (void)setActivityData:(id)a3
{
  sub_1D7B2170C(0, &qword_1EBDFF990);
  sub_1D7B21748();
  uint64_t v4 = sub_1D7BB73A8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (void)setGameModeState:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)gameModeAAA
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA;
  swift_beginAccess();
  return *v2;
}

- (void)setGameModeAAA:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)initWithDelegate:(id)a3
{
  return (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)CCUIGameModeActivityDataProvider.init(delegate:)();
}

- (int64_t)stateForBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_1D7BB7258();
  uint64_t v6 = v5;
  v7 = self;
  int64_t v8 = sub_1D7B6A31C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setWithState:(int64_t)a3 forBundleIdentifier:(id)a4 callback:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_1D7BB7258();
  uint64_t v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_1D7B6E080(a3, v8, v10, (uint64_t)v11, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)init
{
  result = (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7B63530((uint64_t)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end