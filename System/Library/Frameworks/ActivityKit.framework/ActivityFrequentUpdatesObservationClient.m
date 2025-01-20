@interface ActivityFrequentUpdatesObservationClient
- (_TtC11ActivityKit40ActivityFrequentUpdatesObservationClient)init;
@end

@implementation ActivityFrequentUpdatesObservationClient

- (_TtC11ActivityKit40ActivityFrequentUpdatesObservationClient)init
{
  uint64_t v2 = qword_26B0B87B0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (void *)qword_26B0B8778;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC11ActivityKit40ActivityFrequentUpdatesObservationClient_singleton) = (Class)qword_26B0B8778;
  id v5 = v4;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for ActivityFrequentUpdatesObservationClient();
  return [(ActivityFrequentUpdatesObservationClient *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKit40ActivityFrequentUpdatesObservationClient_singleton));
}

@end