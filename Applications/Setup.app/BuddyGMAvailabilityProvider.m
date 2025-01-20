@interface BuddyGMAvailabilityProvider
- (BOOL)isAvailable;
- (_TtC5Setup27BuddyGMAvailabilityProvider)init;
- (void)fetchLatestAvailabilityStatusWithCompletionHandler:(id)a3;
@end

@implementation BuddyGMAvailabilityProvider

- (BOOL)isAvailable
{
  return _s5Setup27BuddyGMAvailabilityProviderC11isAvailableSbyF_0() & 1;
}

- (void)fetchLatestAvailabilityStatusWithCompletionHandler:(id)a3
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
  v11[4] = &unk_10031D968;
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

- (_TtC5Setup27BuddyGMAvailabilityProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyGMAvailabilityProvider();
  return [(BuddyGMAvailabilityProvider *)&v3 init];
}

@end