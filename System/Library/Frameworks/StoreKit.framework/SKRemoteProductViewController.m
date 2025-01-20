@interface SKRemoteProductViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (SKStoreProductViewController)productViewController;
- (void)didFinish;
- (void)didFinishDismissal;
- (void)didFinishWithResult:(id)a3;
- (void)didReceiveTitle:(id)a3;
- (void)loadDidFinishWithResult:(id)a3 error:(id)a4;
- (void)presentPageWithRequest:(id)a3 animated:(id)a4;
- (void)promptForStarRating;
- (void)setProductViewController:(id)a3;
- (void)setStatusBarHidden:(id)a3 withAnimation:(id)a4;
- (void)setStatusBarStyle:(id)a3 animated:(id)a4;
- (void)userDidInteractWithProduct:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SKRemoteProductViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  LOBYTE(a3) = [WeakRetained shouldAutorotateToInterfaceOrientation:a3];

  return a3;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E6760];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F1728];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  [WeakRetained _resetRemoteViewController];
}

- (void)didFinish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  [WeakRetained _didFinish];
}

- (void)didFinishDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  [WeakRetained _didFinishDismissal];
}

- (void)didFinishWithResult:(id)a3
{
  p_productViewController = &self->_productViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  uint64_t v5 = [v4 integerValue];

  [WeakRetained _didFinishWithResult:v5];
}

- (void)userDidInteractWithProduct:(id)a3
{
  p_productViewController = &self->_productViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  uint64_t v5 = [v4 integerValue];

  [WeakRetained _userDidInteractWithProduct:v5];
}

- (void)didReceiveTitle:(id)a3
{
  p_productViewController = &self->_productViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  [WeakRetained setTitle:v4];
}

- (void)loadDidFinishWithResult:(id)a3 error:(id)a4
{
  p_productViewController = &self->_productViewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_productViewController);
  uint64_t v8 = [v7 BOOLValue];

  [WeakRetained _loadDidFinishWithResult:v8 error:v6];
}

- (void)presentPageWithRequest:(id)a3 animated:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10 = [[SKStorePageRequest alloc] initWithXPCEncoding:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);
  uint64_t v9 = [v6 BOOLValue];

  [WeakRetained _presentPageWithRequest:v10 animated:v9];
}

- (void)promptForStarRating
{
  objc_initWeak(&location, self);
  v3 = +[SKStarRatingAlertController starRatingAlertController];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __52__SKRemoteProductViewController_promptForStarRating__block_invoke;
  id v7 = &unk_1E5FAA700;
  objc_copyWeak(&v8, &location);
  [v3 setCompletion:&v4];
  -[SKRemoteProductViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __52__SKRemoteProductViewController_promptForStarRating__block_invoke(uint64_t a1, char a2, float a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained serviceViewControllerProxy];
  id v7 = v5;
  if (a2)
  {
    *(float *)&double v6 = a3;
    id v8 = [NSNumber numberWithFloat:v6];
    [v7 finishStarRatingPromptWithRating:v8];
  }
  else
  {
    [v5 finishStarRatingPromptWithRating:0];
  }
}

- (void)setStatusBarHidden:(id)a3 withAnimation:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB1438];
  id v6 = a4;
  id v7 = a3;
  id v10 = [v5 sharedApplication];
  uint64_t v8 = [v7 BOOLValue];

  uint64_t v9 = [v6 integerValue];
  [v10 setStatusBarHidden:v8 withAnimation:v9];
}

- (void)setStatusBarStyle:(id)a3 animated:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB1438];
  id v6 = a4;
  id v7 = a3;
  id v10 = [v5 sharedApplication];
  uint64_t v8 = [v7 integerValue];

  uint64_t v9 = [v6 BOOLValue];
  [v10 setStatusBarStyle:v8 animated:v9];
}

- (SKStoreProductViewController)productViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_productViewController);

  return (SKStoreProductViewController *)WeakRetained;
}

- (void)setProductViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end