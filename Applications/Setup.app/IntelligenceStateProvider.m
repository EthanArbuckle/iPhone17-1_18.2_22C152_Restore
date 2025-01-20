@interface IntelligenceStateProvider
- (BOOL)canEnableIntelligence;
- (BOOL)shouldShowForSummarization;
- (_TtC5Setup25IntelligenceStateProvider)init;
- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3;
@end

@implementation IntelligenceStateProvider

- (void)isIntelligenceEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10031D3A0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10031E190;
  v12[5] = v11;
  v13 = self;
  sub_10003F8F8((uint64_t)v7, (uint64_t)&unk_10031D850, (uint64_t)v12);
  swift_release();
}

- (BOOL)shouldShowForSummarization
{
  v2 = self;

  return [v2 shouldShowExperience:0 forClient:0];
}

- (BOOL)canEnableIntelligence
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup25IntelligenceStateProvider_generativeModelProvider);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_100012054(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  uint64_t v8 = v6(v4, v5);
  sub_10000A84C(&qword_10031D368);
  uint64_t v9 = type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100236520;
  (*(void (**)(unint64_t, void, uint64_t))(v10 + 104))(v12 + v11, enum case for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason.notOptedIn(_:), v9);
  v13 = sub_100011370(v12, v8);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v14 = v13[2];

  swift_release();
  return v14 == 0;
}

- (_TtC5Setup25IntelligenceStateProvider)init
{
  result = (_TtC5Setup25IntelligenceStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end