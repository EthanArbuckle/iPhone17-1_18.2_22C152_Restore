@interface SettingsViewController
- (_TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController)initWithCoder:(id)a3;
- (_TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (id)useHeartRateWithSpecifier:(id)a3;
- (id)useWristTemperatureWithSpecifier:(id)a3;
- (uint64_t)openHeartRateLearnMore;
- (uint64_t)openWristTemperatureLearnMore;
- (void)openHealthAppOnboarding;
- (void)openHealthAppSettings;
- (void)setWithUseHeartRate:(id)a3 specifier:(id)a4;
- (void)setWithUseWristTemperature:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SettingsViewController

- (_TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_A0E8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController *)sub_6D00((uint64_t)a4, v6, a4);
}

- (_TtC36NanoMenstrualCyclesCompanionSettings22SettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9134();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SettingsViewController();
  id v4 = v5.receiver;
  [(SettingsViewController *)&v5 viewWillAppear:v3];
  objc_msgSend(v4, "reloadSpecifiers", v5.receiver, v5.super_class);
}

- (id)specifiers
{
  v2 = self;
  sub_7038();
  uint64_t v4 = v3;

  if (v4)
  {
    v5.super.isa = sub_A148().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return v5.super.isa;
}

- (void)setWithUseHeartRate:(id)a3 specifier:(id)a4
{
}

- (id)useHeartRateWithSpecifier:(id)a3
{
  return sub_8850(self, (uint64_t)a2, a3, (void (*)(void))sub_3FC0);
}

- (void)setWithUseWristTemperature:(id)a3 specifier:(id)a4
{
}

- (id)useWristTemperatureWithSpecifier:(id)a3
{
  return sub_8850(self, (uint64_t)a2, a3, (void (*)(void))sub_4264);
}

- (void)openHealthAppOnboarding
{
}

- (void)openHealthAppSettings
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (uint64_t)openHeartRateLearnMore
{
  sub_9F18();
  __chkstk_darwin();
  sub_A088();
  __chkstk_darwin();
  sub_9BC8(0, &qword_10720, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  v1 = (char *)&v12 - v0;
  sub_A098();
  type metadata accessor for SettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  sub_9F08();
  sub_A0F8();
  sub_9EE8();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_9EF8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v1, 1, v4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v7 = [self sharedApplication];
    sub_9ED8(v8);
    v10 = v9;
    sub_88C8((uint64_t)&_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_9E0C(&qword_106D8, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = sub_A058().super.isa;
    swift_bridgeObjectRelease();
    [v7 openURL:v10 options:isa completionHandler:0];

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v1, v4);
  }
  return result;
}

- (uint64_t)openWristTemperatureLearnMore
{
  sub_9F18();
  __chkstk_darwin();
  sub_A088();
  __chkstk_darwin();
  sub_9BC8(0, &qword_10720, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin();
  v1 = (char *)&v12 - v0;
  sub_A098();
  type metadata accessor for SettingsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  sub_9F08();
  sub_A0F8();
  sub_9EE8();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_9EF8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v1, 1, v4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v7 = [self sharedApplication];
    sub_9ED8(v8);
    v10 = v9;
    sub_88C8((uint64_t)&_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_9E0C(&qword_106D8, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = sub_A058().super.isa;
    swift_bridgeObjectRelease();
    [v7 openURL:v10 options:isa completionHandler:0];

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v1, v4);
  }
  return result;
}

@end