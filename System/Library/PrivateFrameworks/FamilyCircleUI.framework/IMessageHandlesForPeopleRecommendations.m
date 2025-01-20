@interface IMessageHandlesForPeopleRecommendations
- (IMessageHandlesForPeopleRecommendations)init;
- (IMessageHandlesForPeopleRecommendations)initWithProvider:(id)a3;
- (void)getRecommendationsWith:(id)a3 completion:(id)a4;
@end

@implementation IMessageHandlesForPeopleRecommendations

- (IMessageHandlesForPeopleRecommendations)initWithProvider:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMessageHandlesForPeopleRecommendations_provider) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IMessageHandleForPeopleRecommendations();
  swift_unknownObjectRetain();
  return [(IMessageHandlesForPeopleRecommendations *)&v4 init];
}

- (void)getRecommendationsWith:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_218A50F00(0, &qword_267BEC598);
  unint64_t v6 = sub_218CAF018();
  _Block_copy(v5);
  v7 = self;
  sub_218C0162C(v6, v7, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (IMessageHandlesForPeopleRecommendations)init
{
  result = (IMessageHandlesForPeopleRecommendations *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end