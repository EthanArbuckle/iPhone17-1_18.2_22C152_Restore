@interface APSServerTimeTracker
- (APSServerTimeTracker)init;
- (NSString)aps_prettyDescription;
- (unint64_t)serverTimeInNanoSeconds;
- (void)updateServerTimeWithTimeInMilliseconds:(unint64_t)a3;
@end

@implementation APSServerTimeTracker

- (unint64_t)serverTimeInNanoSeconds
{
  v2 = self;
  unint64_t v3 = sub_1000B5BF4();

  return v3;
}

- (void)updateServerTimeWithTimeInMilliseconds:(unint64_t)a3
{
  v4 = self;
  sub_1000B61A0(a3);
}

- (NSString)aps_prettyDescription
{
  v2 = self;
  sub_1000B64A8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (APSServerTimeTracker)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSServerTimeTracker__mostRecentServerTimeInNanoSeconds) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSServerTimeTracker__alignedMonotonicTimeInNanoSeconds) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServerTimeTracker();
  return [(APSServerTimeTracker *)&v3 init];
}

@end