@interface AXLocalizationCaptionBackgroundControllerViewController
- (BOOL)_canShowWhileLocked;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AXLocalizationCaptionBackgroundControllerViewController

- (void)loadView
{
  id v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(AXLocalizationCaptionBackgroundControllerViewController *)self setView:v4];
  v3 = +[UIColor clearColor];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)AXLocalizationCaptionBackgroundControllerViewController;
  [(AXLocalizationCaptionBackgroundControllerViewController *)&v7 viewDidLoad];
  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  overlayLockView = self->_overlayLockView;
  self->_overlayLockView = v3;

  [(UIView *)self->_overlayLockView setUserInteractionEnabled:0];
  v5 = +[UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.25];
  [(UIView *)self->_overlayLockView setBackgroundColor:v5];

  v6 = [(AXLocalizationCaptionBackgroundControllerViewController *)self view];
  [v6 insertSubview:self->_overlayLockView atIndex:0];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(AXLocalizationCaptionBackgroundControllerViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  overlayLockView = self->_overlayLockView;

  -[UIView setFrame:](overlayLockView, "setFrame:", v5, v7, v9, v11);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end