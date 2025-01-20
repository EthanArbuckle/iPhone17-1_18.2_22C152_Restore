@interface IntelligenceAvailabilityProvider
- (_TtC5Setup32IntelligenceAvailabilityProvider)init;
- (void)fetchLatestAvailabilityWithCompletionHandler:(id)a3;
- (void)isDeviceEligibleForIntelligenceWithCompletionHandler:(id)a3;
@end

@implementation IntelligenceAvailabilityProvider

- (void)isDeviceEligibleForIntelligenceWithCompletionHandler:(id)a3
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
  v11[4] = &unk_10031D9E8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10031D9F0;
  v12[5] = v11;
  v13 = self;
  sub_10003F8F8((uint64_t)v7, (uint64_t)&unk_10031D9F8, (uint64_t)v12);
  swift_release();
}

- (void)fetchLatestAvailabilityWithCompletionHandler:(id)a3
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
  v11[4] = &unk_10031D9D8;
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

- (_TtC5Setup32IntelligenceAvailabilityProvider)init
{
  result = (_TtC5Setup32IntelligenceAvailabilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup32IntelligenceAvailabilityProvider_preferences);
}

@end