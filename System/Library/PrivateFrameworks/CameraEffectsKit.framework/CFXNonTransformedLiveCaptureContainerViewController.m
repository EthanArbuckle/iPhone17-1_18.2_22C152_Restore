@interface CFXNonTransformedLiveCaptureContainerViewController
- (CFXLiveCaptureViewController)liveCaptureViewController;
- (UIView)liveCaptureContainer;
- (UIView)liveCaptureContainerContainer;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setLiveCaptureContainer:(id)a3;
- (void)setLiveCaptureContainerContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation CFXNonTransformedLiveCaptureContainerViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CFXNonTransformedLiveCaptureContainerViewController;
  [(CFXNonTransformedLiveCaptureContainerViewController *)&v2 viewDidLoad];
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v9 = a3;
  v5 = [v9 destinationViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v9 destinationViewController];
    liveCaptureViewController = self->_liveCaptureViewController;
    self->_liveCaptureViewController = v7;
  }
}

- (UIView)liveCaptureContainer
{
  return self->_liveCaptureContainer;
}

- (void)setLiveCaptureContainer:(id)a3
{
}

- (UIView)liveCaptureContainerContainer
{
  return self->_liveCaptureContainerContainer;
}

- (void)setLiveCaptureContainerContainer:(id)a3
{
}

- (CFXLiveCaptureViewController)liveCaptureViewController
{
  return self->_liveCaptureViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveCaptureViewController, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainerContainer, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainer, 0);
}

@end