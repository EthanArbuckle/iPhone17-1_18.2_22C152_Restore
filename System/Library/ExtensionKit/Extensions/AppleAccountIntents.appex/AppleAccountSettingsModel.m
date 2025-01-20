@interface AppleAccountSettingsModel
- (_TtC19AppleAccountIntents25AppleAccountSettingsModel)init;
- (id)accountsForAccountManager:(id)a3;
@end

@implementation AppleAccountSettingsModel

- (_TtC19AppleAccountIntents25AppleAccountSettingsModel)init
{
  return (_TtC19AppleAccountIntents25AppleAccountSettingsModel *)AppleAccountSettingsModel.init()();
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s19AppleAccountIntents0aB13SettingsModelC8accounts3forSDySo15AIDAServiceTypeaSo9ACAccountCGSo18AIDAAccountManagerC_tF_0();

  type metadata accessor for AIDAServiceType(0);
  sub_10001121C();
  sub_100012478(&qword_10001C8A0);
  v6.super.isa = sub_100012DC0().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__fullname;
  uint64_t v4 = sub_100005340(&qword_10001C870);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__formattedUsername, v4);
  v5((char *)self + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__accountDescription, v4);
  NSDictionary v6 = (char *)self + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel__account;
  uint64_t v7 = sub_100005340(&qword_10001C880);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_serviceOwnersManager));
  v8 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19AppleAccountIntents25AppleAccountSettingsModel_accountManager);
}

@end