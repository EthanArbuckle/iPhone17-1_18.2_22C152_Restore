@interface DebugInfoState
- (_TtC12CheckerBoard14DebugInfoState)init;
- (void)dealloc;
- (void)disksAppeared:(id)a3;
- (void)disksChanged:(id)a3;
- (void)disksDisappeared:(id)a3;
- (void)initialPopulateComplete;
@end

@implementation DebugInfoState

- (_TtC12CheckerBoard14DebugInfoState)init
{
  return (_TtC12CheckerBoard14DebugInfoState *)sub_100043A34();
}

- (void)dealloc
{
  swift_getKeyPath();
  v5 = self;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  v3 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  [*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer) invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DebugInfoState(0);
  [(DebugInfoState *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)initialPopulateComplete
{
  v2 = self;
  sub_100045564();
}

- (void)disksAppeared:(id)a3
{
}

- (void)disksChanged:(id)a3
{
}

- (void)disksDisappeared:(id)a3
{
}

@end