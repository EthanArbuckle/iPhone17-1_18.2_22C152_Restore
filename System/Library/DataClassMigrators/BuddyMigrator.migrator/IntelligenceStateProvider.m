@interface IntelligenceStateProvider
- (BOOL)canEnableIntelligence;
- (BOOL)shouldShowForSummarization;
- (_TtC13BuddyMigrator25IntelligenceStateProvider)init;
- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3;
@end

@implementation IntelligenceStateProvider

- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_EC40(&qword_26F00);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_16520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26E58;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26E60;
  v13[5] = v12;
  v14 = self;
  sub_154BC((uint64_t)v8, (uint64_t)&unk_26F20, (uint64_t)v13);
  swift_release();
}

- (BOOL)shouldShowForSummarization
{
  v2 = self;

  return [v2 shouldShowExperience:0 forClient:0];
}

- (BOOL)canEnableIntelligence
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC13BuddyMigrator25IntelligenceStateProvider_generativeModelProvider);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_EBFC(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v7 = self;
  uint64_t v8 = v6(v4, v5);
  sub_EC40(&qword_26E20);
  uint64_t v9 = sub_163B0();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_19370;
  (*(void (**)(unint64_t, void, uint64_t))(v10 + 104))(v12 + v11, enum case for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason.notOptedIn(_:), v9);
  v13 = sub_DF18(v12, v8);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v14 = v13[2];

  swift_release();
  return v14 == 0;
}

- (_TtC13BuddyMigrator25IntelligenceStateProvider)init
{
  result = (_TtC13BuddyMigrator25IntelligenceStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end