@interface SourcesViewController
- (_TtC18HealthExperienceUI21SourcesViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI21SourcesViewController)initWithCollectionViewLayout:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation SourcesViewController

- (_TtC18HealthExperienceUI21SourcesViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI21SourcesViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD33DD68();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  sub_1AD33EAC4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18HealthExperienceUI21SourcesViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI21SourcesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)viewControllerWillEnterAdaptiveModal
{
  v2 = self;
  SourcesViewController.viewControllerWillEnterAdaptiveModal()();
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  v2 = self;
  id v3 = [(SourcesViewController *)v2 navigationItem];
  objc_msgSend(v3, sel_setLeftBarButtonItem_, 0);
}

@end