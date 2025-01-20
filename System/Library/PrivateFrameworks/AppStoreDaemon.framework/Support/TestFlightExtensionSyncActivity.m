@interface TestFlightExtensionSyncActivity
- (BOOL)isEnabled;
- (NSString)descriptiveName;
- (_TtC9appstored31TestFlightExtensionSyncActivity)init;
- (_TtC9appstored31TestFlightExtensionSyncActivity)initWithTestFlightServiceHost:(id)a3;
- (int64_t)deadline;
- (unint64_t)syncGracePeriodMinutes;
- (unint64_t)syncIntervalMinutes;
- (void)run;
- (void)setSyncGracePeriodMinutes:(unint64_t)a3;
- (void)setSyncIntervalMinutes:(unint64_t)a3;
@end

@implementation TestFlightExtensionSyncActivity

- (unint64_t)syncIntervalMinutes
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncIntervalMinutes);
}

- (void)setSyncIntervalMinutes:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncIntervalMinutes) = (Class)a3;
}

- (unint64_t)syncGracePeriodMinutes
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncGracePeriodMinutes);
}

- (void)setSyncGracePeriodMinutes:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_syncGracePeriodMinutes) = (Class)a3;
}

- (_TtC9appstored31TestFlightExtensionSyncActivity)initWithTestFlightServiceHost:(id)a3
{
  id v3 = a3;
  v4 = (_TtC9appstored31TestFlightExtensionSyncActivity *)sub_1000934DC(v3);

  return v4;
}

- (int64_t)deadline
{
  return 0;
}

- (NSString)descriptiveName
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isEnabled
{
  return sub_100403378(*(uint64_t *)((char *)&self->super.super.isa
                                  + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_serviceHost)) == 1;
}

- (void)run
{
  NSString v2 = self;
  sub_100092DBC();
}

- (_TtC9appstored31TestFlightExtensionSyncActivity)init
{
  result = (_TtC9appstored31TestFlightExtensionSyncActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_serviceHost));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9appstored31TestFlightExtensionSyncActivity_dispatchQueue));
  swift_bridgeObjectRelease();
}

@end