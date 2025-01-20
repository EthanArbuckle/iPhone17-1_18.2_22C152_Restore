@interface SKRemoteComposeReviewViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (SKComposeReviewViewController)composeReviewViewController;
- (SKRemoteComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_keyboardVisibilityDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)didFinishWithResult:(id)a3 error:(id)a4;
- (void)didPrepareWithResult:(id)a3 error:(id)a4;
- (void)promptForStarRating;
- (void)setComposeReviewViewController:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SKRemoteComposeReviewViewController

- (SKRemoteComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKRemoteComposeReviewViewController;
  v4 = [(SKRemoteComposeReviewViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__keyboardVisibilityDidChangeNotification_ name:*MEMORY[0x1E4FB2BC0] object:0];
    [v5 addObserver:v4 selector:sel__keyboardVisibilityDidChangeNotification_ name:*MEMORY[0x1E4FB2BC8] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2BC0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2BC8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKRemoteComposeReviewViewController;
  [(_UIRemoteViewController *)&v4 dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeReviewViewController);
  LOBYTE(a3) = [WeakRetained shouldAutorotateToInterfaceOrientation:a3];

  return a3;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E7E48];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F17E8];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  p_composeReviewViewController = &self->_composeReviewViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_composeReviewViewController);
  [WeakRetained _tearDownAfterError:v4];
}

- (void)_keyboardVisibilityDidChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v25 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  if (v25)
  {
    v5 = [(SKRemoteComposeReviewViewController *)self view];
    [v25 CGRectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [MEMORY[0x1E4FB1438] sharedApplication];
    v15 = [v14 keyWindow];
    objc_msgSend(v5, "convertRect:fromView:", v15, v7, v9, v11, v13);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB28];
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v24 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v24, "clientKeyboardFrameChanged:", v17, v19, v21, v23);
}

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  p_composeReviewViewController = &self->_composeReviewViewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_composeReviewViewController);
  uint64_t v8 = [v7 BOOLValue];

  [WeakRetained _didFinishWithResult:v8 error:v6];
}

- (void)didPrepareWithResult:(id)a3 error:(id)a4
{
  p_composeReviewViewController = &self->_composeReviewViewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_composeReviewViewController);
  uint64_t v8 = [v7 BOOLValue];

  [WeakRetained _didPrepareWithResult:v8 error:v6];
}

- (void)promptForStarRating
{
  objc_initWeak(&location, self);
  v3 = +[SKStarRatingAlertController starRatingAlertController];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __58__SKRemoteComposeReviewViewController_promptForStarRating__block_invoke;
  id v7 = &unk_1E5FAA700;
  objc_copyWeak(&v8, &location);
  [v3 setCompletion:&v4];
  -[SKRemoteComposeReviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __58__SKRemoteComposeReviewViewController_promptForStarRating__block_invoke(uint64_t a1, char a2, float a3)
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

- (SKComposeReviewViewController)composeReviewViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeReviewViewController);

  return (SKComposeReviewViewController *)WeakRetained;
}

- (void)setComposeReviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end