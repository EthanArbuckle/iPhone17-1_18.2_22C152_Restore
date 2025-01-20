@interface NotificationSystem
- (_TtC22ActivityAwardsServices18NotificationSystem)init;
- (uint64_t)achievementStore:(char *)a1 didAddAchievements:;
- (void)dealloc;
- (void)notificationSuppressionChanged;
@end

@implementation NotificationSystem

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NotificationSystem();
  [(NotificationSystem *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_earnedKeyValueStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_fitnessAppsStateObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_healthStore));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationPostingProvider);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationSuppresionProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_pauseRingsCoordinator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_unearnedKeyValueStore));

  swift_release();
}

- (void)notificationSuppressionChanged
{
  v2 = self;
  sub_1DAE19214();
}

- (_TtC22ActivityAwardsServices18NotificationSystem)init
{
  result = (_TtC22ActivityAwardsServices18NotificationSystem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)achievementStore:(char *)a1 didAddAchievements:
{
  sub_1DAE1D3AC(0, (unint64_t *)&qword_1EBE6FEA0);
  sub_1DAE11A38();
  uint64_t v2 = sub_1DAE304E0();
  uint64_t v3 = *(void *)&a1[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_lock];
  v4 = *(os_unfair_lock_s **)(v3 + 16);
  swift_unknownObjectRetain();
  id v5 = a1;
  os_unfair_lock_lock(v4);
  sub_1DAE19458(v5, v2);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 + 16));
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

@end