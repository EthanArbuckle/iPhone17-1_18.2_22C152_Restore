@interface SettingsViewController
- (_TtC24OxygenSaturationSettings22SettingsViewController)initWithCoder:(id)a3;
- (_TtC24OxygenSaturationSettings22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)backgroundRecordingDisabledTextWithSpecifier:(id)a3;
- (id)backgroundRecordingsDuringSleepValueWithSpecifier:(id)a3;
- (id)backgroundRecordingsDuringTheaterModeWithSpecifier:(id)a3;
- (id)recordingsEnabledValueWithSpecifier:(id)a3;
- (id)specifiers;
- (void)dealloc;
- (void)enablePressedWithAppropriateRegion:(BOOL)a3;
- (void)onboardingScrollViewDidScroll:(id)a3;
- (void)openArticle;
- (void)openPasscodeSettings;
- (void)oxygenSaturationSettingsDidChange:(id)a3;
- (void)setWithDuringSleepEnabledValue:(id)a3 specifier:(id)a4;
- (void)setWithDuringTheaterModeValue:(id)a3 specifier:(id)a4;
- (void)setWithRecordingsEnabledValue:(id)a3 specifier:(id)a4;
- (void)setupLaterPressed;
- (void)showStartingControllerIfNeeded;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SettingsViewController

- (_TtC24OxygenSaturationSettings22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_6140();
  }
  return (_TtC24OxygenSaturationSettings22SettingsViewController *)sub_5D94();
}

- (_TtC24OxygenSaturationSettings22SettingsViewController)initWithCoder:(id)a3
{
  *(void *)&self->PSListController_opaque[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController] = 0;
  self->PSListController_opaque[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden] = 0;
  *(void *)&self->PSListController_opaque[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___healthStore] = 0;
  *(void *)&self->PSListController_opaque[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___featureAvailabilityStore] = 0;
  self->PSListController_opaque[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_isRegionSupported] = 0;
  id v4 = a3;

  result = (_TtC24OxygenSaturationSettings22SettingsViewController *)sub_6270();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = self;
  id v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SettingsViewController();
  [(SettingsViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___featureAvailabilityStore];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SettingsViewController();
  id v2 = v4.receiver;
  [(SettingsViewController *)&v4 viewDidLoad];
  id v3 = objc_msgSend(self, "defaultCenter", v4.receiver, v4.super_class);
  [v3 addObserver:v2 selector:"showStartingControllerIfNeeded" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)showStartingControllerIfNeeded
{
  id v2 = self;
  sub_29C0();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_2B58(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4 = self;
  sub_2CB0(a3);
}

- (id)specifiers
{
  id v2 = self;
  sub_3468();
  uint64_t v4 = v3;

  if (v4)
  {
    v5.super.isa = sub_6180().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return v5.super.isa;
}

- (id)backgroundRecordingDisabledTextWithSpecifier:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  NSString v6 = sub_6120();
  id v7 = (id)HKRPLocalizedString();

  sub_6140();
  NSString v8 = sub_6120();
  swift_bridgeObjectRelease();

  return v8;
}

- (void)setWithDuringSleepEnabledValue:(id)a3 specifier:(id)a4
{
}

- (id)backgroundRecordingsDuringSleepValueWithSpecifier:(id)a3
{
  return sub_47FC((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_backgroundRecordingsDuringSleepMode);
}

- (void)setWithDuringTheaterModeValue:(id)a3 specifier:(id)a4
{
}

- (id)backgroundRecordingsDuringTheaterModeWithSpecifier:(id)a3
{
  return sub_47FC((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_backgroundRecordingsDuringTheaterMode);
}

- (void)setWithRecordingsEnabledValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSString v8 = self;
  sub_5E94();
}

- (id)recordingsEnabledValueWithSpecifier:(id)a3
{
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings];
  id v5 = a3;
  id v6 = self;
  BOOL v7 = [v4 backgroundRecordingsEnabled]
    && ([v4 oxygenSaturationDisabled] & 1) == 0
    && !sub_2444();
  sub_5FB8(0, &qword_CCF0);
  v8.super.super.isa = sub_6220(v7).super.super.isa;

  return v8.super.super.isa;
}

- (void)openArticle
{
  id v2 = self;
  sub_49B0();
}

- (void)enablePressedWithAppropriateRegion:(BOOL)a3
{
  id v4 = self;
  sub_4C30(a3);
}

- (void)setupLaterPressed
{
  BOOL v7 = self;
  id v2 = [(SettingsViewController *)v7 navigationController];
  if (v2
    && (v3 = v2, id v4 = [v2 navigationController], v3, v4))
  {
    id v5 = (_TtC24OxygenSaturationSettings22SettingsViewController *)[v4 popViewControllerAnimated:1];

    id v6 = v5;
  }
  else
  {
    id v6 = v7;
  }
}

- (void)onboardingScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(SettingsViewController *)v5 table];
  if (v6)
  {
    [v4 contentOffset];
    objc_msgSend(v6, "setContentOffset:");
  }
  else
  {
    __break(1u);
  }
}

- (void)openPasscodeSettings
{
  uint64_t v3 = sub_60D0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ExternalDeepLink.watchPasscodeSettings(_:), v3);
  BOOL v7 = self;
  sub_60C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)oxygenSaturationSettingsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_61E0();
  if (qword_CB00 != -1) {
    swift_once();
  }
  sub_5930();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_6E40;
  swift_getObjectType();
  sub_5998();
  uint64_t v7 = sub_6160();
  uint64_t v9 = v8;
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_59D0();
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  sub_60F0();
  swift_bridgeObjectRelease();
  [(SettingsViewController *)v5 reloadSpecifiers];
}

@end