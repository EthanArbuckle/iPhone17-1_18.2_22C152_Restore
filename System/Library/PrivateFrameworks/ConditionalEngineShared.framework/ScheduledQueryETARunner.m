@interface ScheduledQueryETARunner
- (_TtC23ConditionalEngineShared23ScheduledQueryETARunner)init;
@end

@implementation ScheduledQueryETARunner

- (_TtC23ConditionalEngineShared23ScheduledQueryETARunner)init
{
  uint64_t v3 = OBJC_IVAR____TtC23ConditionalEngineShared23ScheduledQueryETARunner_dispatchGroup;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)dispatch_group_create();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC23ConditionalEngineShared23ScheduledQueryETARunner_currentLocation) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ScheduledQueryETARunner();
  return [(ScheduledQueryETARunner *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ConditionalEngineShared23ScheduledQueryETARunner_dispatchGroup));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23ConditionalEngineShared23ScheduledQueryETARunner_currentLocation);
}

@end