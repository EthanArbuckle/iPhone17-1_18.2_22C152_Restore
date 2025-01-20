@interface CloudSyncStatusInputSignal
- (_TtC14HealthPlatform26CloudSyncStatusInputSignal)init;
- (void)cloudSyncObserver:(id)a3 syncCompletedForRequest:(id)a4;
- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4;
- (void)cloudSyncObserver:(id)a3 syncFailedForRequest:(id)a4 error:(id)a5;
- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4;
- (void)cloudSyncObserver:(id)a3 syncStartedForRequest:(id)a4 withProgress:(id)a5;
- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4;
- (void)cloudSyncObserverSyncCompleted:(id)a3;
@end

@implementation CloudSyncStatusInputSignal

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C275A890(v7);
}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_1C275AB78(a4);
}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s14HealthPlatform26CloudSyncStatusInputSignalC05cloudd8ObserverD9CompletedyySo07HKClouddI0CF_0();
}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1C275B118(v7);
}

- (void)cloudSyncObserver:(id)a3 syncStartedForRequest:(id)a4 withProgress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1C275B360(v9, v10);
}

- (void)cloudSyncObserver:(id)a3 syncFailedForRequest:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_1C275B6F4(v9, a5);
}

- (void)cloudSyncObserver:(id)a3 syncCompletedForRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1C275BAF8(v7);
}

- (_TtC14HealthPlatform26CloudSyncStatusInputSignal)init
{
  result = (_TtC14HealthPlatform26CloudSyncStatusInputSignal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end