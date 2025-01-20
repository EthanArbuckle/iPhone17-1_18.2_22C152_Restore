@interface IntelligenceManager
- (BOOL)canEnableIntelligence;
- (BOOL)didShowIntelligencePaneThisBuddyRun;
- (_TtC13BuddyMigrator19IntelligenceManager)init;
- (_TtC13BuddyMigrator19IntelligenceManager)initWithFeatureFlags:(id)a3 availabilityProvider:(id)a4 stateProvider:(id)a5 preferences:(id)a6;
- (_TtC13BuddyMigrator19IntelligenceManager)initWithFeatureFlags:(id)a3 preferences:(id)a4;
- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3;
- (void)setDidShowIntelligencePaneInCurrentSession;
- (void)setDidShowIntelligencePaneThisBuddyRun:(BOOL)a3;
- (void)shouldShowIntelligenceWithServerCheck:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation IntelligenceManager

- (BOOL)didShowIntelligencePaneThisBuddyRun
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_didShowIntelligencePaneThisBuddyRun);
}

- (void)setDidShowIntelligencePaneThisBuddyRun:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) = a3;
}

- (BOOL)canEnableIntelligence
{
  return [*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_stateProvider) canEnableIntelligence];
}

- (_TtC13BuddyMigrator19IntelligenceManager)initWithFeatureFlags:(id)a3 availabilityProvider:(id)a4 stateProvider:(id)a5 preferences:(id)a6
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_featureFlags) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_availabilityProvider) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_stateProvider) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_preferences) = (Class)a6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IntelligenceManager();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v7 = a6;
  return [(IntelligenceManager *)&v9 init];
}

- (_TtC13BuddyMigrator19IntelligenceManager)initWithFeatureFlags:(id)a3 preferences:(id)a4
{
  return (_TtC13BuddyMigrator19IntelligenceManager *)IntelligenceManager.init(featureFlags:preferences:)((uint64_t)a3, a4);
}

- (void)shouldShowIntelligenceWithServerCheck:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_EC40(&qword_26F00);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = v11;
  *(void *)(v12 + 32) = self;
  uint64_t v13 = sub_16520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26F30;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26F38;
  v15[5] = v14;
  v16 = self;
  sub_154BC((uint64_t)v10, (uint64_t)&unk_26F40, (uint64_t)v15);
  swift_release();
}

- (void)setDidShowIntelligencePaneInCurrentSession
{
  v2 = self;
  sub_FEF4();
}

- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_EC40(&qword_26F00);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_16520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26F10;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26E60;
  v13[5] = v12;
  v14 = self;
  sub_154BC((uint64_t)v8, (uint64_t)&unk_26F20, (uint64_t)v13);
  swift_release();
}

- (_TtC13BuddyMigrator19IntelligenceManager)init
{
  result = (_TtC13BuddyMigrator19IntelligenceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BuddyMigrator19IntelligenceManager_preferences);
}

@end