@interface DefaultUserActivityReportCoordinator
- (_TtC13HomeKitDaemon36DefaultUserActivityReportCoordinator)init;
- (void)configureWithDetectors:(id)a3;
- (void)handleBackgroundTaskManagerTimerFiredWithNotification:(id)a3;
- (void)handleStateChangeForDetectorOfType:(unint64_t)a3 withReason:(unint64_t)a4;
- (void)sendCoordinatedReportsForReason:(unint64_t)a3;
@end

@implementation DefaultUserActivityReportCoordinator

- (void)configureWithDetectors:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F54F4F8(0, &qword_2686DA4B8);
  uint64_t v7 = sub_2302DDD80();
  uint64_t v8 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = v7;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_22F54F824((uint64_t)v6, (uint64_t)&unk_2686DA4C8, (uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)sendCoordinatedReportsForReason:(unint64_t)a3
{
  swift_retain();
  sub_22F68F4B0(a3);
  swift_release();
}

- (_TtC13HomeKitDaemon36DefaultUserActivityReportCoordinator)init
{
  swift_defaultActor_initialize();
  result = (_TtC13HomeKitDaemon36DefaultUserActivityReportCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)handleBackgroundTaskManagerTimerFiredWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_22F694BA8(v3);

  swift_release();
}

- (void)handleStateChangeForDetectorOfType:(unint64_t)a3 withReason:(unint64_t)a4
{
  swift_retain();
  sub_22F696ED8(a3, a4);
  swift_release();
}

@end