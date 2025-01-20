@interface PBADataRecoveryProgressViewController
- (BOOL)_canShowWhileLocked;
- (NSString)statusText;
- (double)progress;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)setProgress:(double)a3;
- (void)setStatusText:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBADataRecoveryProgressViewController

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  v8 = [objc_alloc((Class)SBUIAppleLogoView) initWithFrame:CGRectZero.origin.x, y, width, height];
  appleLogoView = self->_appleLogoView;
  self->_appleLogoView = v8;

  [(SBUIAppleLogoView *)self->_appleLogoView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:self->_appleLogoView];
  v22 = [v7 leadingAnchor];
  v21 = [(SBUIAppleLogoView *)self->_appleLogoView leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  v19 = [v7 trailingAnchor];
  v18 = [(SBUIAppleLogoView *)self->_appleLogoView trailingAnchor];
  v10 = [v19 constraintEqualToAnchor:v18];
  v23[1] = v10;
  v11 = [v7 topAnchor];
  v12 = [(SBUIAppleLogoView *)self->_appleLogoView topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v23[2] = v13;
  v14 = [v7 bottomAnchor];
  v15 = [(SBUIAppleLogoView *)self->_appleLogoView bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v23[3] = v16;
  v17 = +[NSArray arrayWithObjects:v23 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  [(PBADataRecoveryProgressViewController *)self setView:v7];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PBADataRecoveryProgressViewController;
  [(PBADataRecoveryProgressViewController *)&v4 viewDidLoad];
  double progress = self->_progress;
  *(float *)&double progress = progress;
  [(SBUIAppleLogoView *)self->_appleLogoView setProgress:progress];
  [(SBUIAppleLogoView *)self->_appleLogoView setStatusText:self->_statusText];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)PBADataRecoveryProgressViewController;
  [(PBADataRecoveryProgressViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setProgress:(double)a3
{
  self->_double progress = a3;
  *(float *)&a3 = a3;
  [(SBUIAppleLogoView *)self->_appleLogoView setProgress:a3];
}

- (void)setStatusText:(id)a3
{
  objc_storeStrong((id *)&self->_statusText, a3);
  id v5 = a3;
  [(SBUIAppleLogoView *)self->_appleLogoView setStatusText:v5];
}

- (double)progress
{
  return self->_progress;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);

  objc_storeStrong((id *)&self->_appleLogoView, 0);
}

@end