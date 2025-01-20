@interface ADInterstitialAd
- (BOOL)isActionInProgress;
- (BOOL)isLoaded;
- (BOOL)presentInView:(id)a3;
- (id)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation ADInterstitialAd

- (BOOL)presentInView:(id)a3
{
  return 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (BOOL)isActionInProgress
{
  return self->_actionInProgress;
}

- (void).cxx_destruct
{
}

@end