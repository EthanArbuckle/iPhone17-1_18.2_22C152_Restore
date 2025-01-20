@interface BCConfigurationViewController
- (BCConfigurationViewController)initWithCoder:(id)a3;
- (BCConfigurationViewController)initWithMode:(int64_t)a3 dismissHandler:(id)a4;
- (BCConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)actionSelectorViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BCConfigurationViewController

- (BCConfigurationViewController)initWithMode:(int64_t)a3 dismissHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (BCConfigurationViewController *)ConfigurationViewController.init(mode:dismissHandler:)(a3, (uint64_t)sub_2473D8250, v6);
}

- (BCConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2473D7634();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2473D3994();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2473D3B34(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_2473D3CD4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2473D3E20(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2473D3FAC();
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)actionSelectorViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_2473D7718(a4);
}

- (BCConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BCConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BCConfigurationViewController_selectorViewController));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BCConfigurationViewController_actionDetailsView));
  sub_2473D5EA4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor);
}

@end