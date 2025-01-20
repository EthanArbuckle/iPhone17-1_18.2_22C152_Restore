@interface ZWFakeLaserViewController
- (AXPIFingerController)fingerController;
- (BOOL)_canShowWhileLocked;
- (ZWFakeLaserViewController)initWithZoomRootVC:(id)a3;
- (ZWPointerAppearance)appearance;
- (void)setAppearance:(id)a3;
- (void)setFingerController:(id)a3;
- (void)viewDidLoad;
@end

@implementation ZWFakeLaserViewController

- (ZWFakeLaserViewController)initWithZoomRootVC:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ZWFakeLaserViewController;
  v5 = [(ZWFakeLaserViewController *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)AXPIFingerController);
    [(ZWFakeLaserViewController *)v5 setFingerController:v6];

    v7 = [[ZWPointerAppearance alloc] initWithZoomRootVC:v4];
    [(ZWFakeLaserViewController *)v5 setAppearance:v7];

    v8 = [(ZWFakeLaserViewController *)v5 appearance];
    v9 = [(ZWFakeLaserViewController *)v5 fingerController];
    [v9 setAppearanceDelegate:v8];
  }
  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)ZWFakeLaserViewController;
  [(ZWFakeLaserViewController *)&v7 viewDidLoad];
  v3 = [(ZWFakeLaserViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [(ZWFakeLaserViewController *)self view];
  v5 = [(ZWFakeLaserViewController *)self fingerController];
  id v6 = [v5 fingerContainerView];
  [v4 addSubview:v6];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXPIFingerController)fingerController
{
  return self->_fingerController;
}

- (void)setFingerController:(id)a3
{
}

- (ZWPointerAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearance, 0);

  objc_storeStrong((id *)&self->_fingerController, 0);
}

@end