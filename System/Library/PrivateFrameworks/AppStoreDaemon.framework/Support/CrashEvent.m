@interface CrashEvent
- (BOOL)isBeta;
- (BOOL)isSystem;
- (NSDate)date;
- (NSString)appVersion;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)incidentID;
- (_TtC9appstored10CrashEvent)init;
@end

@implementation CrashEvent

- (NSString)appVersion
{
  return (NSString *)sub_10008EF68((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9appstored10CrashEvent_appVersion);
}

- (NSString)bundleID
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)bundleVersion
{
  return (NSString *)sub_10008EF68((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9appstored10CrashEvent_bundleVersion);
}

- (NSDate)date
{
  v2.super.isa = Date._bridgeToObjectiveC()().super.isa;
  return (NSDate *)v2.super.isa;
}

- (NSString)incidentID
{
  return (NSString *)sub_10008EF68((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9appstored10CrashEvent_incidentID);
}

- (BOOL)isBeta
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored10CrashEvent_isBeta);
}

- (BOOL)isSystem
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored10CrashEvent_isSystem);
}

- (_TtC9appstored10CrashEvent)init
{
  result = (_TtC9appstored10CrashEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9appstored10CrashEvent_date;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end