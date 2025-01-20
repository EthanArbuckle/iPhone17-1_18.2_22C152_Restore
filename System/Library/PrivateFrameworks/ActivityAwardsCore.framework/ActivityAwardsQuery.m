@interface ActivityAwardsQuery
- (_TtC18ActivityAwardsCore19ActivityAwardsQuery)init;
- (void)dealloc;
@end

@implementation ActivityAwardsQuery

- (void)dealloc
{
  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE48);
  sub_22313FFE8();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivityAwardsQuery();
  [(ActivityAwardsQuery *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC18ActivityAwardsCore19ActivityAwardsQuery)init
{
  result = (_TtC18ActivityAwardsCore19ActivityAwardsQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end