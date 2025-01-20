@interface IntelligenceManager
- (BOOL)canEnableIntelligence;
- (BOOL)didShowIntelligencePaneThisBuddyRun;
- (_TtC5Setup19IntelligenceManager)init;
- (_TtC5Setup19IntelligenceManager)initWithFeatureFlags:(id)a3 availabilityProvider:(id)a4 stateProvider:(id)a5 preferences:(id)a6;
- (_TtC5Setup19IntelligenceManager)initWithFeatureFlags:(id)a3 preferences:(id)a4;
- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3;
- (void)setDidShowIntelligencePaneInCurrentSession;
- (void)setDidShowIntelligencePaneThisBuddyRun:(BOOL)a3;
- (void)shouldShowIntelligenceWithServerCheck:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation IntelligenceManager

- (BOOL)didShowIntelligencePaneThisBuddyRun
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_didShowIntelligencePaneThisBuddyRun);
}

- (void)setDidShowIntelligencePaneThisBuddyRun:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) = a3;
}

- (BOOL)canEnableIntelligence
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_stateProvider) canEnableIntelligence];
}

- (_TtC5Setup19IntelligenceManager)initWithFeatureFlags:(id)a3 availabilityProvider:(id)a4 stateProvider:(id)a5 preferences:(id)a6
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_didShowIntelligencePaneThisBuddyRun) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_featureFlags) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_availabilityProvider) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_stateProvider) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_preferences) = (Class)a6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for IntelligenceManager();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v7 = a6;
  return [(IntelligenceManager *)&v9 init];
}

- (_TtC5Setup19IntelligenceManager)initWithFeatureFlags:(id)a3 preferences:(id)a4
{
  return (_TtC5Setup19IntelligenceManager *)IntelligenceManager.init(featureFlags:preferences:)((uint64_t)a3, a4);
}

- (void)shouldShowIntelligenceWithServerCheck:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v7 - 8);
  objc_super v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031D860;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10031D868;
  v14[5] = v13;
  v15 = self;
  sub_10003F8F8((uint64_t)v9, (uint64_t)&unk_10031D870, (uint64_t)v14);
  swift_release();
}

- (void)setDidShowIntelligencePaneInCurrentSession
{
  v2 = self;
  sub_10001CB58();
}

- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10031D840;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10031E190;
  v12[5] = v11;
  v13 = self;
  sub_10003F8F8((uint64_t)v7, (uint64_t)&unk_10031D850, (uint64_t)v12);
  swift_release();
}

- (_TtC5Setup19IntelligenceManager)init
{
  result = (_TtC5Setup19IntelligenceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19IntelligenceManager_preferences);
}

@end