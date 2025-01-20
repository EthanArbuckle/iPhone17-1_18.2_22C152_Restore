@interface AMUIOnboardingViewController
- (AMAmbientDefaults)ambientDefaults;
- (AMUIOnboardingViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (void)loadView;
- (void)onboardingContainerView:(id)a3 requestsDismissalWithUserIntent:(BOOL)a4;
- (void)performDismissalAnimation;
- (void)performPresentationAnimation;
- (void)setAmbientDefaults:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMUIOnboardingViewController

- (void)performPresentationAnimation
{
}

- (void)performDismissalAnimation
{
}

- (void)loadView
{
  v3 = objc_alloc_init(AMUIOnboardingContainerView);
  onboardingContainerView = self->_onboardingContainerView;
  self->_onboardingContainerView = v3;

  [(AMUIOnboardingContainerView *)self->_onboardingContainerView setDelegate:self];
  v5 = self->_onboardingContainerView;
  v6 = [(AMUIOnboardingViewController *)self ambientDefaults];
  [(AMUIOnboardingContainerView *)v5 setAmbientDefaults:v6];

  v7 = self->_onboardingContainerView;

  [(AMUIOnboardingViewController *)self setView:v7];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)onboardingContainerView:(id)a3 requestsDismissalWithUserIntent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIOnboardingViewController *)self delegate];
  [v6 onboardingViewController:self requestsDismissalWithUserIntent:v4];
}

- (AMUIOnboardingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIOnboardingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMAmbientDefaults)ambientDefaults
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientDefaults);

  return (AMAmbientDefaults *)WeakRetained;
}

- (void)setAmbientDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientDefaults);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_onboardingContainerView, 0);
}

@end