@interface SKRemoteDismissingTransition
- (SKRemoteDismissingTransition)initWithViewController:(id)a3;
- (SKRemoteDismissingViewController)viewController;
- (double)transitionDuration:(id)a3;
- (void)dismissRemoteViewController:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SKRemoteDismissingTransition

- (SKRemoteDismissingTransition)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRemoteDismissingTransition;
  v5 = [(SKRemoteDismissingTransition *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SKRemoteDismissingTransition *)v5 setViewController:v4];
  }

  return v6;
}

- (void)dismissRemoteViewController:(id)a3
{
  id v4 = a3;
  v5 = [(SKRemoteDismissingTransition *)self viewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SKRemoteDismissingTransition_dismissRemoteViewController___block_invoke;
  v7[3] = &unk_1E5FA9A08;
  id v6 = v4;
  id v8 = v6;
  LOBYTE(v4) = [v5 dismissRemoteViewControllerWithCompletion:v7];

  if ((v4 & 1) == 0) {
    [v6 completeTransition:1];
  }
}

uint64_t __60__SKRemoteDismissingTransition_dismissRemoteViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (SKRemoteDismissingViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (SKRemoteDismissingViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end