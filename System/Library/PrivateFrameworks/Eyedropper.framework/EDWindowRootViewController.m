@interface EDWindowRootViewController
- (BOOL)_canShowWhileLocked;
- (EDLensView)lensView;
- (EDWindowRootViewController)initWithScreenBounds:(CGRect)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)setLensView:(id)a3;
- (void)viewDidLoad;
@end

@implementation EDWindowRootViewController

- (EDWindowRootViewController)initWithScreenBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)EDWindowRootViewController;
  v7 = [(EDWindowRootViewController *)&v14 initWithNibName:0 bundle:0];
  [(EDWindowRootViewController *)v7 _setIgnoreAppSupportedOrientations:1];
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v16);
  v10 = -[EDLensView initWithFrame:]([EDLensView alloc], "initWithFrame:", MidX, MidY, 288.0, 288.0);
  lensView = v7->_lensView;
  v7->_lensView = v10;

  -[EDLensView setLastPosition:](v7->_lensView, "setLastPosition:", MidX, MidY);
  v12 = [(EDWindowRootViewController *)v7 view];
  [v12 addSubview:v7->_lensView];

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)EDWindowRootViewController;
  [(EDWindowRootViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  v4 = [(EDWindowRootViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  a3->var6 = 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (EDLensView)lensView
{
  return self->_lensView;
}

- (void)setLensView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end