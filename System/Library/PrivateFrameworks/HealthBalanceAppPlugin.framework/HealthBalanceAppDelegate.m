@interface HealthBalanceAppDelegate
- (_TtC22HealthBalanceAppPlugin24HealthBalanceAppDelegate)init;
- (void)open:(id)a3;
- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5;
@end

@implementation HealthBalanceAppDelegate

- (_TtC22HealthBalanceAppPlugin24HealthBalanceAppDelegate)init
{
  sub_250E79A08();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HealthBalanceAppDelegate();
  return [(HealthBalanceAppDelegate *)&v4 init];
}

- (void)open:(id)a3
{
  uint64_t v3 = sub_250E79908();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E798E8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin24HealthBalanceAppDelegate_urlBuilder;
  uint64_t v3 = sub_250E79A18();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5
{
  sub_250E67954(0, &qword_269B0C9C0, MEMORY[0x263F8F520]);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - v10;
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_250E7ACF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269B0CCF8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269B0CD08;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_250E66F64((uint64_t)v11, (uint64_t)&unk_269B0CD18, (uint64_t)v16);
  swift_release();
}

@end