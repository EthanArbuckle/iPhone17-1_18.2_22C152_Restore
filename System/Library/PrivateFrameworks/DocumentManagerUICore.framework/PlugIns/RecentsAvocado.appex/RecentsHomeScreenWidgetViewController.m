@interface RecentsHomeScreenWidgetViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)applicationIconDidChange:(id)a3;
- (void)applicationInstallsDidUpdateIcon:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)updateForBundleIdentifier:(id)a3;
- (void)updateForWidgetConfiguration:(id)a3;
- (void)updateLockedStateWithDeviceIsLocked:(BOOL)a3;
- (void)updateQueryFiltersForNewApps;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RecentsHomeScreenWidgetViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001C764C();
}

- (void)updateLockedStateWithDeviceIsLocked:(BOOL)a3
{
  v4 = self;
  sub_1001C7AC4(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1001C7FFC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001C8374(a3);
}

- (_TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1004CDB50();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController *)sub_1001C89D8(v5, v7, a4);
}

- (_TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController)initWithCoder:(id)a3
{
  return (_TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController *)sub_1001C8E90(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController_itemCollectionObservationQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController_itemPersistenceQueue));
  sub_100049B74((uint64_t)self+ OBJC_IVAR____TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController____lazy_storage___itemCollectionConfiguation, &qword_10062E838);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController____lazy_storage___configuration));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController_collection));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado37RecentsHomeScreenWidgetViewController____lazy_storage___recentItemsView);
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001D10E4(v4, (uint64_t)&unk_1005C18B0, (uint64_t)sub_1001D16D0, (uint64_t)&unk_1005C18C8);
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  id v8 = self;
  sub_1001D10E4(v7, (uint64_t)&unk_1005C1860, (uint64_t)sub_1001D1630, (uint64_t)&unk_1005C1878);
  _Block_release(v6);
}

- (void)updateForBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1004CDB50();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = self;
  sub_1001D13CC(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)updateForWidgetConfiguration:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1001CF110(a3);
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)applicationIconDidChange:(id)a3
{
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
}

- (void)updateQueryFiltersForNewApps
{
  v2 = self;
  sub_1001D0508();
}

@end