@interface CSMagSafeAccessoryWalletViewController
- (BOOL)isAnimatingPresentation;
- (CSMagSafeAccessoryWalletView)walletView;
- (CSMagSafeAccessoryWalletViewController)initWithAccessory:(id)a3;
- (double)animationDurationBeforeDismissal;
- (id)accessoryView;
- (void)setIsAnimatingPresentation:(BOOL)a3;
- (void)setWalletView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CSMagSafeAccessoryWalletViewController

- (CSMagSafeAccessoryWalletViewController)initWithAccessory:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CSMagSafeAccessoryWalletViewController;
  v3 = [(CSMagSafeAccessoryViewController *)&v8 initWithAccessory:a3];
  if (v3)
  {
    v4 = [CSMagSafeAccessoryWalletView alloc];
    uint64_t v5 = -[CSMagSafeAccessoryWalletView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    walletView = v3->_walletView;
    v3->_walletView = (CSMagSafeAccessoryWalletView *)v5;
  }
  return v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CSMagSafeAccessoryWalletViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidLoad];
  v3 = [(CSMagSafeAccessoryWalletViewController *)self view];
  [v3 addSubview:self->_walletView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessoryWalletViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidAppear:a3];
  [(CSMagSafeAccessoryWalletViewController *)self setIsAnimatingPresentation:1];
  walletView = self->_walletView;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CSMagSafeAccessoryWalletViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_1E6AD87F8;
  v5[4] = self;
  [(CSMagSafeAccessoryWalletView *)walletView performAnimation:0 completionHandler:v5];
}

uint64_t __56__CSMagSafeAccessoryWalletViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAnimatingPresentation:0];
}

- (id)accessoryView
{
  return self->_walletView;
}

- (double)animationDurationBeforeDismissal
{
  [(CSMagSafeAccessoryWalletView *)self->_walletView animationDurationBeforeDismissal];
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

- (CSMagSafeAccessoryWalletView)walletView
{
  return self->_walletView;
}

- (void)setWalletView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end