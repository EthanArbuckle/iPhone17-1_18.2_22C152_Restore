@interface CloudSyncEventPublisherObserver
- (_TtC16HealthExperience31CloudSyncEventPublisherObserver)init;
- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4;
- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4;
- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4;
- (void)cloudSyncObserverSyncCompleted:(id)a3;
@end

@implementation CloudSyncEventPublisherObserver

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
}

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1C28CD160();
}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C28CD160();
}

- (_TtC16HealthExperience31CloudSyncEventPublisherObserver)init
{
  result = (_TtC16HealthExperience31CloudSyncEventPublisherObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience31CloudSyncEventPublisherObserver_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience31CloudSyncEventPublisherObserver_observer));
  swift_release();

  swift_release();
}

@end