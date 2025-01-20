@interface HearingTestInterruptionViewControllerManager
- (_TtC13HearingTestUI44HearingTestInterruptionViewControllerManager)init;
- (void)fitNoiseCheckCancelled:(id)a3;
- (void)fitNoiseCheckCompleted:(id)a3 status:(unint64_t)a4;
@end

@implementation HearingTestInterruptionViewControllerManager

- (_TtC13HearingTestUI44HearingTestInterruptionViewControllerManager)init
{
  result = (_TtC13HearingTestUI44HearingTestInterruptionViewControllerManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2513A810C((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI44HearingTestInterruptionViewControllerManager_interruptionListener);
  sub_2513A810C((uint64_t)self+ OBJC_IVAR____TtC13HearingTestUI44HearingTestInterruptionViewControllerManager_interruptionViewControllerDelegate);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  sub_251437E00(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC13HearingTestUI44HearingTestInterruptionViewControllerManager_activeInterruption), *(void **)&self->interruptionListener[OBJC_IVAR____TtC13HearingTestUI44HearingTestInterruptionViewControllerManager_activeInterruption]);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13HearingTestUI44HearingTestInterruptionViewControllerManager_interruptionManager);
}

- (void)fitNoiseCheckCompleted:(id)a3 status:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_2514385C4(a4);
}

- (void)fitNoiseCheckCancelled:(id)a3
{
  v4 = a3;
  v5 = self;
  sub_251437720(v4);
}

@end