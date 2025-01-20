@interface AAUIActivityAwardsDateQuery
- (BOOL)activateAndReturnError:(id *)a3;
- (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery)init;
- (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery)initWithDateComponents:(id)a3 initialAwardsHandler:(id)a4 updateHandler:(id)a5;
- (void)deactivate;
@end

@implementation AAUIActivityAwardsDateQuery

- (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery)initWithDateComponents:(id)a3 initialAwardsHandler:(id)a4 updateHandler:(id)a5
{
  uint64_t v8 = sub_2292CC0A8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v21 - v13;
  v15 = _Block_copy(a4);
  v16 = _Block_copy(a5);
  sub_2292CC098();
  *(void *)(swift_allocObject() + 16) = v15;
  *(void *)(swift_allocObject() + 16) = v16;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  objc_allocWithZone((Class)sub_2292CC228());
  v17 = self;
  swift_retain();
  swift_retain();
  *(Class *)((char *)&v17->super.isa + OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query) = (Class)sub_2292CC208();

  v18 = (objc_class *)type metadata accessor for AAUIActivityAwardsDateQuery();
  v21.receiver = v17;
  v21.super_class = v18;
  v19 = [(AAUIActivityAwardsDateQuery *)&v21 init];
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v19;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  v3 = self;
  sub_2292CC218();

  return 1;
}

- (void)deactivate
{
  v2 = self;
  sub_2292CC1F8();
}

- (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery)init
{
  result = (_TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query));
}

@end