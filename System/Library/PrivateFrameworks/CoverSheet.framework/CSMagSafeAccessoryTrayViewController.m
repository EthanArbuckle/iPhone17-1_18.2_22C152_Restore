@interface CSMagSafeAccessoryTrayViewController
- (BOOL)isAnimatingPresentation;
- (CSMagSafeAccessoryTrayView)trayView;
- (CSMagSafeAccessoryTrayViewController)initWithAccessory:(id)a3;
- (double)animationDurationBeforeDismissal;
- (id)_trayColorForAccessory:(id)a3;
- (id)accessoryView;
- (void)setIsAnimatingPresentation:(BOOL)a3;
- (void)setTrayView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CSMagSafeAccessoryTrayViewController

- (CSMagSafeAccessoryTrayViewController)initWithAccessory:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSMagSafeAccessoryTrayViewController;
  v5 = [(CSMagSafeAccessoryViewController *)&v11 initWithAccessory:v4];
  if (v5)
  {
    v6 = [CSMagSafeAccessoryTrayView alloc];
    v7 = [(CSMagSafeAccessoryTrayViewController *)v5 _trayColorForAccessory:v4];
    uint64_t v8 = [(CSMagSafeAccessoryTrayView *)v6 initWithTrayColor:v7];
    trayView = v5->_trayView;
    v5->_trayView = (CSMagSafeAccessoryTrayView *)v8;
  }
  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CSMagSafeAccessoryTrayViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidLoad];
  v3 = [(CSMagSafeAccessoryTrayViewController *)self view];
  [v3 addSubview:self->_trayView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessoryTrayViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidAppear:a3];
  [(CSMagSafeAccessoryTrayViewController *)self setIsAnimatingPresentation:1];
  trayView = self->_trayView;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__CSMagSafeAccessoryTrayViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_1E6AD87F8;
  v5[4] = self;
  [(CSMagSafeAccessoryTrayView *)trayView performAnimation:0 completionHandler:v5];
}

uint64_t __54__CSMagSafeAccessoryTrayViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingPresentation:0];
}

- (id)_trayColorForAccessory:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 2 || objc_msgSend(v3, "type") == 4)
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] clearColor];
  }
  else
  {
    uint64_t v4 = [v3 primaryColor];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessoryView
{
  return self->_trayView;
}

- (double)animationDurationBeforeDismissal
{
  [(CSMagSafeAccessoryTrayView *)self->_trayView animationDurationBeforeDismissal];
  return result;
}

- (BOOL)isAnimatingPresentation
{
  return self->_isAnimatingPresentation;
}

- (void)setIsAnimatingPresentation:(BOOL)a3
{
  self->_isAnimatingPresentation = a3;
}

- (CSMagSafeAccessoryTrayView)trayView
{
  return self->_trayView;
}

- (void)setTrayView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end