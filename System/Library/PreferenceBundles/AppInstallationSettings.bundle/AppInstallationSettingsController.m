@interface AppInstallationSettingsController
- (_TtC23AppInstallationSettings33AppInstallationSettingsController)initWithCoder:(id)a3;
- (_TtC23AppInstallationSettings33AppInstallationSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)getAppUpdatesSpecifier;
- (id)getBackgroundAssetsSpecifier;
- (id)getCellularDataAppDownloadsSpecifier;
- (id)getCellularDataAutomaticDownloadsSpecifier;
- (id)getOffloadUnusedAppsSpecifier;
- (id)specifiers;
- (void)appWillEnterForeground;
- (void)dealloc;
- (void)distributorsOrDevelopersChanged:(id)a3;
- (void)lowPowerModeChangedNotification:(id)a3;
- (void)restoreAppStore;
- (void)setAppUpdatesSpecifierWithValue:(id)a3 specifier:(id)a4;
- (void)setBackgroundAssetsSpecifierWithValue:(id)a3 specifier:(id)a4;
- (void)setCellularDataAutomaticDownloadsSpecifierWithValue:(id)a3 specifier:(id)a4;
- (void)setOffloadUnusedAppsSpecifierWithValue:(id)a3 specifier:(id)a4;
- (void)viewApprovedDeveloperPageWithSpecifier:(id)a3;
- (void)viewDidLoad;
- (void)viewMarketplacePageWithSpecifier:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AppInstallationSettingsController

- (_TtC23AppInstallationSettings33AppInstallationSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    sub_1C3B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (_TtC23AppInstallationSettings33AppInstallationSettingsController *)sub_C7D8((uint64_t)a4, v7, a4);
  swift_release();
  return v8;
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AppInstallationSettingsController();
  [(AppInstallationSettingsController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = &self->PSListController_opaque[OBJC_IVAR____TtC23AppInstallationSettings33AppInstallationSettingsController_logger];
  uint64_t v4 = sub_1C2D0();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

- (_TtC23AppInstallationSettings33AppInstallationSettingsController)initWithCoder:(id)a3
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  sub_16E08();
}

- (void)viewDidLoad
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = self;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for AppInstallationSettingsController();
  [(AppInstallationSettingsController *)&v6 viewWillAppear:v3];
  sub_D3B8();
  swift_release();

  swift_release();
}

- (id)specifiers
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v3 = self;
  sub_DC48();

  v4.super.isa = sub_1C410().super.isa;
  swift_bridgeObjectRelease();
  swift_release();

  return v4.super.isa;
}

- (id)getAppUpdatesSpecifier
{
  return sub_11A7C(self, (uint64_t)a2, 357, (uint64_t (*)(void))sub_10C64);
}

- (void)setAppUpdatesSpecifierWithValue:(id)a3 specifier:(id)a4
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_16F54(v7);
  swift_release();
}

- (id)getBackgroundAssetsSpecifier
{
  return sub_11A7C(self, (uint64_t)a2, 374, (uint64_t (*)(void))sub_10F1C);
}

- (void)setBackgroundAssetsSpecifierWithValue:(id)a3 specifier:(id)a4
{
}

- (id)getCellularDataAutomaticDownloadsSpecifier
{
  return sub_11A7C(self, (uint64_t)a2, 389, (uint64_t (*)(void))sub_112C0);
}

- (void)setCellularDataAutomaticDownloadsSpecifierWithValue:(id)a3 specifier:(id)a4
{
}

- (id)getCellularDataAppDownloadsSpecifier
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v3 = self;
  sub_11410();
  uint64_t v5 = v4;

  if (v5)
  {
    NSString v6 = sub_1C3A0();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    NSString v6 = 0;
  }

  return v6;
}

- (id)getOffloadUnusedAppsSpecifier
{
  return sub_11A7C(self, (uint64_t)a2, 412, (uint64_t (*)(void))sub_118AC);
}

- (void)setOffloadUnusedAppsSpecifierWithValue:(id)a3 specifier:(id)a4
{
}

- (void)viewMarketplacePageWithSpecifier:(id)a3
{
}

- (void)viewApprovedDeveloperPageWithSpecifier:(id)a3
{
}

- (void)restoreAppStore
{
}

- (void)distributorsOrDevelopersChanged:(id)a3
{
}

- (void)lowPowerModeChangedNotification:(id)a3
{
}

- (void)appWillEnterForeground
{
  uint64_t v3 = sub_9178(&qword_24DC8);
  __chkstk_darwin(v3 - 8, v4);
  NSString v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = self;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = sub_1C4F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = v7;
  uint64_t v10 = sub_1C4C0();
  v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  sub_176C0((uint64_t)v6, (uint64_t)&unk_24F58, (uint64_t)v11);
  swift_release();
  swift_release();

  swift_release();
}

@end