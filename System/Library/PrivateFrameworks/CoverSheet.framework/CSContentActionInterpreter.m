@interface CSContentActionInterpreter
- (UIViewController)digestOnboardingSuggestionViewController;
- (UIViewController)nowPlayingViewController;
- (void)_viewControllerFromAction:(id)a3 completion:(id)a4;
- (void)setDigestOnboardingSuggestionViewController:(id)a3;
- (void)setNowPlayingViewController:(id)a3;
@end

@implementation CSContentActionInterpreter

- (void)_viewControllerFromAction:(id)a3 completion:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(id, void *, void))a4;
  if ([v12 type] == 1)
  {
    v7 = [v12 identifier];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4FA6D18]];

    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_nowPlayingViewController);
      v6[2](v6, WeakRetained, 0);
    }
    else
    {
      v10 = [v12 identifier];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4FA6D10]];

      if (v11)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_digestOnboardingSuggestionViewController);
        v6[2](v6, WeakRetained, 0);
      }
      else
      {
        WeakRetained = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA7020] code:2 userInfo:0];
        ((void (**)(id, void *, void *))v6)[2](v6, 0, WeakRetained);
      }
    }
  }
  else
  {
    WeakRetained = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA7020] code:2 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, WeakRetained);
  }
}

- (UIViewController)nowPlayingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nowPlayingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setNowPlayingViewController:(id)a3
{
}

- (UIViewController)digestOnboardingSuggestionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_digestOnboardingSuggestionViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setDigestOnboardingSuggestionViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_digestOnboardingSuggestionViewController);

  objc_destroyWeak((id *)&self->_nowPlayingViewController);
}

@end