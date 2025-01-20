@interface HDSwimTracker
- (_TtC12HealthDaemon13HDSwimTracker)init;
- (_TtC12HealthDaemon13HDSwimTracker)initWithProfile:(id)a3;
- (_TtP12HealthDaemon20HDCMSwimTrackerProxy_)tracker;
- (id)makeSwimTracker;
- (void)registerObserver:(id)a3;
- (void)setTracker:(id)a3;
- (void)startWith:(id)a3;
- (void)stop;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDSwimTracker

- (_TtP12HealthDaemon20HDCMSwimTrackerProxy_)tracker
{
  v2 = self;
  v3 = (void *)sub_1BCBD4570();

  return (_TtP12HealthDaemon20HDCMSwimTrackerProxy_ *)v3;
}

- (void)setTracker:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon13HDSwimTracker____lazy_storage___tracker) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (_TtC12HealthDaemon13HDSwimTracker)initWithProfile:(id)a3
{
  return (_TtC12HealthDaemon13HDSwimTracker *)HDSwimTracker.init(profile:)(a3);
}

- (id)makeSwimTracker
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4F222A8]);
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  v6 = (objc_class *)type metadata accessor for HDCMSwimTracker();
  v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  id v8 = v5;
  v9 = [(HDSwimTracker *)&v11 init];

  return v9;
}

- (void)startWith:(id)a3
{
  uint64_t v4 = sub_1BD2E46A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD2E4690();
  id v8 = self;
  sub_1BCBD4A94();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)stop
{
  v2 = self;
  sub_1BCBD5324();
}

- (void)registerObserver:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1BCBD6528((uint64_t)a3, (uint64_t)v5);
  swift_unknownObjectRelease();
}

- (void)unregisterObserver:(id)a3
{
}

- (_TtC12HealthDaemon13HDSwimTracker)init
{
  result = (_TtC12HealthDaemon13HDSwimTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon13HDSwimTracker_dataCollector);
}

@end