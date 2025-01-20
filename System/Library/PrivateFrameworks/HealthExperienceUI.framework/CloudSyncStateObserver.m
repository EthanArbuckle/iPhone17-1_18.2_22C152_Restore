@interface CloudSyncStateObserver
- (_TtC18HealthExperienceUI22CloudSyncStateObserver)init;
- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4;
- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4;
- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4;
- (void)cloudSyncObserverSyncCompleted:(id)a3;
@end

@implementation CloudSyncStateObserver

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  CloudSyncStateObserver.cloudSyncObserver(_:syncFailedWithError:)(v6, a4);
}

- (_TtC18HealthExperienceUI22CloudSyncStateObserver)init
{
  result = (_TtC18HealthExperienceUI22CloudSyncStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1AD1E4514(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_firstRestoreStateChangeHandler));
  sub_1AD1E4514(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_stateChangeHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_cloudSyncObserver));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_store;
  sub_1AD1CC61C((uint64_t)v3);
}

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1AD6543B0(0xD000000000000026, 0x80000001AD794BB0, MEMORY[0x1E4F65FC0], (uint64_t)sub_1AD654EF0);
}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD6543B0(0xD000000000000022, 0x80000001AD794B80, MEMORY[0x1E4F65FD0], (uint64_t)sub_1AD654EF0);
}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1AD6547CC(v7);
}

@end