@interface IntelligenceAvailabilityProvider
- (_TtC13BuddyMigrator32IntelligenceAvailabilityProvider)init;
- (void)fetchLatestAvailabilityWithCompletionHandler:(id)a3;
- (void)isDeviceEligibleForIntelligenceWithCompletionHandler:(id)a3;
@end

@implementation IntelligenceAvailabilityProvider

- (void)isDeviceEligibleForIntelligenceWithCompletionHandler:(id)a3
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
  v12[4] = &unk_26FC8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26FD0;
  v13[5] = v12;
  v14 = self;
  sub_154BC((uint64_t)v8, (uint64_t)&unk_26FD8, (uint64_t)v13);
  swift_release();
}

- (void)fetchLatestAvailabilityWithCompletionHandler:(id)a3
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
  v12[4] = &unk_26FB8;
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

- (_TtC13BuddyMigrator32IntelligenceAvailabilityProvider)init
{
  result = (_TtC13BuddyMigrator32IntelligenceAvailabilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13BuddyMigrator32IntelligenceAvailabilityProvider_preferences);
}

@end