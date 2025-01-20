@interface ActivityAwardsDateQueryListener
- (_TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener)init;
- (void)achievementStore:(void *)a1 didAddAchievements:;
@end

@implementation ActivityAwardsDateQueryListener

- (_TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener)init
{
  result = (_TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_endpoint));
  swift_unknownObjectRelease();
  sub_1DAE106B8((uint64_t)self + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_dateComponents, &qword_1EBE6FB60);

  swift_bridgeObjectRelease();
}

- (void)achievementStore:(void *)a1 didAddAchievements:
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_1DAE10B54();
  swift_unknownObjectRelease();
}

@end