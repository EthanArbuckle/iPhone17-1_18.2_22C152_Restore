@interface HearingTestFlowManager
- (_TtC13HearingTestUI22HearingTestFlowManager)init;
- (void)fitNoiseCheckCancelled:(id)a3;
- (void)fitNoiseCheckCompleted:(id)a3 status:(unint64_t)a4;
@end

@implementation HearingTestFlowManager

- (void)fitNoiseCheckCompleted:(id)a3 status:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_2513F2F34(v6, a4);
}

- (void)fitNoiseCheckCancelled:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2513F34E4();
}

- (_TtC13HearingTestUI22HearingTestFlowManager)init
{
  result = (_TtC13HearingTestUI22HearingTestFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_interruptionViewControllerManager);
  swift_unknownObjectRelease();
  swift_release();

  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_articlePresenter);
  sub_2514132C4((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_hearingTestStartDate, (unint64_t *)&qword_26B21D4A0, MEMORY[0x263F07490]);
  sub_2514130D8((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI22HearingTestFlowManager_resultsProcessor, (uint64_t (*)(void))type metadata accessor for ResultsProcessor);

  swift_bridgeObjectRelease();
}

@end