@interface APSFilterChange
- (APSFilterChange)init;
- (APSFilterChange)initWithChange:(int64_t)a3 triggeringTopic:(id)a4;
- (NSString)triggeringTopic;
- (int64_t)topicGroupChange;
- (unint64_t)reason;
- (void)setReason:(unint64_t)a3;
- (void)setTopicGroupChange:(int64_t)a3;
- (void)setTriggeringTopic:(id)a3;
@end

@implementation APSFilterChange

- (NSString)triggeringTopic
{
  v2 = (char *)self + OBJC_IVAR___APSFilterChange_triggeringTopic;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTriggeringTopic:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APSFilterChange_triggeringTopic);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)topicGroupChange
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___APSFilterChange_topicGroupChange);
  swift_beginAccess();
  return *v2;
}

- (void)setTopicGroupChange:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___APSFilterChange_topicGroupChange);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (unint64_t)reason
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___APSFilterChange_reason);
  swift_beginAccess();
  return *v2;
}

- (void)setReason:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___APSFilterChange_reason);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (APSFilterChange)initWithChange:(int64_t)a3 triggeringTopic:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (APSFilterChange *)sub_1000BC180(a3, v5, v6);
}

- (APSFilterChange)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterChange_triggeringTopic);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterChange_topicGroupChange) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterChange_reason) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FilterChange();
  return [(APSFilterChange *)&v4 init];
}

- (void).cxx_destruct
{
}

@end