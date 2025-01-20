@interface AAUIAwardsQuery
- (BOOL)activateAndReturnError:(id *)a3;
- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)init;
- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)initWithInitialAwardsHandler:(id)a3 addedAwardsHandler:(id)a4 removedAwardsHandler:(id)a5 updatedAwardsHandler:(id)a6;
- (void)deactivate;
@end

@implementation AAUIAwardsQuery

- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)initWithInitialAwardsHandler:(id)a3 addedAwardsHandler:(id)a4 removedAwardsHandler:(id)a5 updatedAwardsHandler:(id)a6
{
  v10 = _Block_copy(a3);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  v13 = _Block_copy(a6);
  *(void *)(swift_allocObject() + 16) = v10;
  *(void *)(swift_allocObject() + 16) = v11;
  *(void *)(swift_allocObject() + 16) = v12;
  *(void *)(swift_allocObject() + 16) = v13;
  objc_allocWithZone((Class)sub_2292CC1E8());
  v14 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(Class *)((char *)&v14->super.isa + OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query) = (Class)sub_2292CC1B8();

  v17.receiver = v14;
  v17.super_class = (Class)type metadata accessor for AAUIAwardsQuery();
  v15 = [(AAUIAwardsQuery *)&v17 init];
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v15;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  v3 = self;
  sub_2292CC1D8();

  return 1;
}

- (void)deactivate
{
  v2 = self;
  sub_2292CC1C8();
}

- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)init
{
  result = (_TtC22ActivityAchievementsUI15AAUIAwardsQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end