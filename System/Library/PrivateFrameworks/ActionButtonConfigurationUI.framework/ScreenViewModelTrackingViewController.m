@interface ScreenViewModelTrackingViewController
- (_TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ScreenViewModelTrackingViewController

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_2473E9F90(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2473EA050(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_2473EA110(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_2473EA1D0(a3);
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  sub_2473EA7AC(a4, a5);

  swift_unknownObjectRelease();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2473E8F80(v4);
}

- (_TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_24740DCF0();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = 0;
    id v6 = a4;
    v7 = (void *)sub_24740DCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  v9 = [(ScreenViewModelTrackingViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  return [(ScreenViewModelTrackingViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end