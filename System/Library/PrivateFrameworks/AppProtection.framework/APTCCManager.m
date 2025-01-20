@interface APTCCManager
+ (id)sharedManager;
- (APTCCManager)init;
- (id)TCCServicesForBundleIdentifier:(id)a3;
- (void)accessingRecordsForTCCService:(id)a3 completion:(id)a4;
- (void)fetchUsersForRecord:(id)a3 completion:(id)a4;
@end

@implementation APTCCManager

+ (id)sharedManager
{
  if (qword_2692CA258 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2692CAC00;
  return v2;
}

- (id)TCCServicesForBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_247DD2C20();
  uint64_t v6 = v5;
  v7 = self;
  sub_247D59868(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_247DD2D20();
  swift_bridgeObjectRelease();
  return v8;
}

- (void)accessingRecordsForTCCService:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_247DD2C20();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = qword_2692C94A0;
  v11 = self;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_2692CF160;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_247D5A0D4;
  *(void *)(v13 + 24) = v9;
  swift_retain();
  sub_247D550E0(v6, v8, (uint64_t)sub_247D5A0DC, v13, v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)fetchUsersForRecord:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_247D59920(v8, (uint64_t)sub_247D59860, v7);

  swift_release();
}

- (APTCCManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)APTCCManager;
  return [(APTCCManager *)&v3 init];
}

@end