@interface SettingsViewController
- (_TtC31NanoHealthBalanceBridgeSettings22SettingsViewController)initWithCoder:(id)a3;
- (_TtC31NanoHealthBalanceBridgeSettings22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)notificationsEnabledWithSpecifier:(id)a3;
- (id)specifiers;
- (void)launchHealthAppOnboardingWithSpecifier:;
- (void)setWithNotificationsEnabled:(id)a3 specifier:(id)a4;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation SettingsViewController

- (_TtC31NanoHealthBalanceBridgeSettings22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_6EC8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC31NanoHealthBalanceBridgeSettings22SettingsViewController *)sub_37D0((uint64_t)a4, v6, a4);
}

- (_TtC31NanoHealthBalanceBridgeSettings22SettingsViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC31NanoHealthBalanceBridgeSettings22SettingsViewController_settings;
  sub_6E08();
  id v6 = objc_allocWithZone((Class)HKHealthStore);
  id v7 = a3;
  [v6 init];
  *(void *)&self->BPSListController_opaque[v5] = sub_6DA8();

  result = (_TtC31NanoHealthBalanceBridgeSettings22SettingsViewController *)sub_7008();
  __break(1u);
  return result;
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SettingsViewController();
  id v4 = v5.receiver;
  [(SettingsViewController *)&v5 viewIsAppearing:v3];
  objc_msgSend(v4, "reloadSpecifiers", v5.receiver, v5.super_class);
}

- (id)notificationsEnabledWithSpecifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  id v6 = [objc_allocWithZone((Class)NSNumber) initWithBool:sub_6DE8() & 1];

  return v6;
}

- (void)setWithNotificationsEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  [v6 BOOLValue];
  sub_6DF8();
}

- (id)specifiers
{
  sub_518C();
  BOOL v3 = self;
  sub_6D38();
  sub_45BC(v7);
  Class isa = sub_6F08().super.isa;
  swift_bridgeObjectRelease();
  [(SettingsViewController *)v3 setSpecifiers:isa];

  sub_45BC(v7);
  swift_bridgeObjectRelease();
  v5.super.Class isa = sub_6F08().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (void).cxx_destruct
{
}

- (void)launchHealthAppOnboardingWithSpecifier:
{
  uint64_t v24 = sub_6D68();
  uint64_t v0 = *(void *)(v24 - 8);
  __chkstk_darwin();
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5F10(0, &qword_C460, (uint64_t (*)(uint64_t))&type metadata accessor for BalanceURLBuilder.Route, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  id v4 = (char *)&v21 - v3;
  uint64_t v5 = sub_6D88();
  uint64_t v22 = *(void *)(v5 - 8);
  uint64_t v23 = v5;
  __chkstk_darwin();
  unint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_6D08();
  uint64_t v8 = *(void *)(v21 - 8);
  __chkstk_darwin();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [self defaultWorkspace];
  if (v11)
  {
    v12 = v11;
    sub_6D78();
    uint64_t v13 = enum case for BalanceURLBuilder.Route.balanceOnboarding(_:);
    uint64_t v14 = sub_6D58();
    uint64_t v15 = *(void *)(v14 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 104))(v4, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v4, 0, 1, v14);
    uint64_t v16 = v24;
    (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for BalanceURLBuilder.Source.watchApp(_:), v24);
    sub_6D48();
    (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v16);
    sub_6A18((uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
    sub_6CF8(v17);
    v19 = v18;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v21);
    sub_3CF4((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_6E88().super.isa;
    swift_bridgeObjectRelease();
    [v12 openSensitiveURL:v19 withOptions:isa];
  }
  else
  {
    __break(1u);
  }
}

@end