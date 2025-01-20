@interface ArcadeDownloadPackCategoriesViewController
- (void)didTapContinueButton;
- (void)didTapSkipButton;
- (void)viewDidLoad;
@end

@implementation ArcadeDownloadPackCategoriesViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ArcadeDownloadPackViewController *)&v5 viewDidLoad];
  objc_msgSend(v2, "setModalInPresentation:", 1, v5.receiver, v5.super_class);
  id v3 = [v2 navigationItem];
  [v3 setHidesBackButton:1];

  id v4 = [v2 navigationItem];
  [v4 setBackButtonDisplayMode:1];
}

- (void)didTapContinueButton
{
  id v2 = self;
  sub_100762E10();
}

- (void)didTapSkipButton
{
  id v2 = self;
  sub_100762E00();
  [(ArcadeDownloadPackCategoriesViewController *)v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension42ArcadeDownloadPackCategoriesViewController_skipButton];
}

@end