@interface ActivityAwardsDateQuery
- (_TtC18ActivityAwardsCore23ActivityAwardsDateQuery)init;
- (void)dealloc;
@end

@implementation ActivityAwardsDateQuery

- (void)dealloc
{
  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE48);
  sub_22313FFE8();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivityAwardsDateQuery();
  [(ActivityAwardsDateQuery *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  uint64_t v4 = sub_22313FF98();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection));
  swift_release();
}

- (_TtC18ActivityAwardsCore23ActivityAwardsDateQuery)init
{
  result = (_TtC18ActivityAwardsCore23ActivityAwardsDateQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end