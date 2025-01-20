@interface LaunchSyncResult
- (NSDateInterval)dateInterval;
- (NSError)error;
- (_TtC9appstored16LaunchSyncResult)init;
- (int64_t)updateCount;
@end

@implementation LaunchSyncResult

- (NSDateInterval)dateInterval
{
  v2.super.isa = DateInterval._bridgeToObjectiveC()().super.isa;
  return (NSDateInterval *)v2.super.isa;
}

- (int64_t)updateCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored16LaunchSyncResult_updateCount);
}

- (NSError)error
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored16LaunchSyncResult_error))
  {
    swift_errorRetain();
    NSDateInterval v2 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    NSDateInterval v2 = 0;
  }
  return (NSError *)v2;
}

- (_TtC9appstored16LaunchSyncResult)init
{
  result = (_TtC9appstored16LaunchSyncResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSDateInterval v2 = (char *)self + OBJC_IVAR____TtC9appstored16LaunchSyncResult_dateInterval;
  uint64_t v3 = type metadata accessor for DateInterval();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_errorRelease();
}

@end