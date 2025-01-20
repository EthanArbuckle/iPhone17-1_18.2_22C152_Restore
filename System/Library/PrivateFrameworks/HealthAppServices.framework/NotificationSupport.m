@interface NotificationSupport
+ (UNNotificationSound)defaultHealthAppNotificationSound;
+ (id)createNotificationUserInfoFor:(int64_t)a3 with:(id)a4;
- (_TtC17HealthAppServices19NotificationSupport)init;
@end

@implementation NotificationSupport

+ (UNNotificationSound)defaultHealthAppNotificationSound
{
  if (qword_1EACE1808 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EACE1960;
  return (UNNotificationSound *)v2;
}

+ (id)createNotificationUserInfoFor:(int64_t)a3 with:(id)a4
{
  sub_1E0130E38();
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1E0138050();
    uint64_t v9 = sub_1E01380B0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1E01380B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  _s17HealthAppServices19NotificationSupportC06createD8UserInfo3for4withSDys11AnyHashableVypGSo20HKNotificationDomainV_10Foundation3URLVSgtFZ_0(a3, (uint64_t)v8);
  sub_1E0130EF4((uint64_t)v8, (uint64_t (*)(void))sub_1E0130E38);
  v11 = (void *)sub_1E0138150();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC17HealthAppServices19NotificationSupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NotificationSupport();
  return [(NotificationSupport *)&v3 init];
}

@end