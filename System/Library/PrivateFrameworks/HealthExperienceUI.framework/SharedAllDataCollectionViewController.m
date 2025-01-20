@interface SharedAllDataCollectionViewController
- (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C437SharedAllDataCollectionViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C437SharedAllDataCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation SharedAllDataCollectionViewController

- (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C437SharedAllDataCollectionViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C437SharedAllDataCollectionViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD3DE6D0();
}

- (void)viewControllerWillEnterAdaptiveModal
{
  v2 = self;
  sub_1AD3DE908();
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  v2 = self;
  id v3 = [(SharedAllDataCollectionViewController *)v2 navigationItem];
  objc_msgSend(v3, sel_setLeftBarButtonItem_, 0);
}

- (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C437SharedAllDataCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C437SharedAllDataCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end