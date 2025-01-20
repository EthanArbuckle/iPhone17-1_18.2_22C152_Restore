@interface MindfulnessSessionViewModel
- (NSDictionary)metadata;
- (NSString)description;
- (_TtC9FitnessUI27MindfulnessSessionViewModel)init;
@end

@implementation MindfulnessSessionViewModel

- (NSDictionary)metadata
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_metadata))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_21E4D0A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSString)description
{
  v2 = self;
  sub_21E4B9D50();

  v3 = (void *)sub_21E4D0AB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9FitnessUI27MindfulnessSessionViewModel)init
{
  result = (_TtC9FitnessUI27MindfulnessSessionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_uuid;
  uint64_t v4 = sub_21E4CFE50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_startDate;
  uint64_t v6 = sub_21E4CFE10();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC9FitnessUI27MindfulnessSessionViewModel_endDate, v6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end