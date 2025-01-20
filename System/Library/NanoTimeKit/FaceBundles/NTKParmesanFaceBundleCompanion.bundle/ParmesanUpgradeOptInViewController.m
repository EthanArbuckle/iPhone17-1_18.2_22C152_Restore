@interface ParmesanUpgradeOptInViewController
- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController)init;
- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)detailString;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)cancelTapped:(id)a3;
- (void)loadView;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ParmesanUpgradeOptInViewController

- (id)titleString
{
  return sub_246C1EF20(self);
}

- (id)detailString
{
  return sub_246C1EF20(self);
}

- (id)suggestedButtonTitle
{
  return sub_246C1EF20(self);
}

- (void)loadView
{
  v2 = self;
  sub_246C1F050();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_246C1F2E4(a3);
}

- (void)cancelTapped:(id)a3
{
}

- (void)suggestedButtonPressed:(id)a3
{
}

- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController)init
{
  result = (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_sourceFace));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_device));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_upgradeManager));
  sub_246B98F78((uint64_t)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_upgradeDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_indicatorView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_frameContentView);
}

@end