@interface AnalyticsDailyMultiEventManager
- (_TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager)init;
- (void)daemonReady:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
@end

@implementation AnalyticsDailyMultiEventManager

- (void)daemonReady:(id)a3
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    swift_unknownObjectRetain_n();
    v6 = self;
    id v7 = objc_msgSend(v5, sel_analyticsSubmissionCoordinator);
    objc_msgSend(v7, sel_addObserver_queue_, v6, 0);

    v8 = *(void (**)(void))((char *)&v6->super.isa
                          + OBJC_IVAR____TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager_unitTest_didObserveAnalyticsSubmissionCoordinator);
    if (v8) {
      v8();
    }

    swift_unknownObjectRelease_n();
  }
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_250EDDF24((void (*)(void, uint64_t, void *))sub_250EDDF1C, v7);

  swift_release();
}

- (_TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager)init
{
  result = (_TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager_eventSubmissionManager));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager_unitTest_didObserveAnalyticsSubmissionCoordinator);
  sub_250EAB9CC(v3);
}

@end