@interface PBAPasscodeEntryViewController
- (BOOL)_canShowWhileLocked;
- (NSString)subtitleText;
- (NSString)titleText;
- (PBAPasscodeEntryViewController)initWithLightBackground:(BOOL)a3;
- (PBAPasscodeEntryViewControllerDelegate)delegate;
- (void)_homeButtonPressed:(id)a3;
- (void)_updatePasscodeStatusTextAnimated:(BOOL)a3;
- (void)_userCancelledEntry;
- (void)_userRequestedDismissal;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)passcodeLockViewCancelButtonPressed:(id)a3;
- (void)passcodeLockViewPasscodeDidChange:(id)a3;
- (void)passcodeLockViewPasscodeEntered:(id)a3;
- (void)resetPasscodeEntryFieldForFailure:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleText:(id)a3 subtitleText:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation PBAPasscodeEntryViewController

- (PBAPasscodeEntryViewController)initWithLightBackground:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBAPasscodeEntryViewController;
  result = [(PBAPasscodeEntryViewController *)&v5 initWithNibName:0 bundle:0];
  if (result) {
    result->_useLightBackground = a3;
  }
  return result;
}

- (void)setTitleText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    titleText = self->_titleText;
    self->_titleText = v4;

    [(PBAPasscodeEntryViewController *)self _updatePasscodeStatusTextAnimated:1];
  }
}

- (void)setSubtitleText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleText, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    subtitleText = self->_subtitleText;
    self->_subtitleText = v4;

    [(PBAPasscodeEntryViewController *)self _updatePasscodeStatusTextAnimated:1];
  }
}

- (void)setTitleText:(id)a3 subtitleText:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = (NSString *)[a3 copy];
  titleText = self->_titleText;
  self->_titleText = v9;

  v11 = (NSString *)[v8 copy];
  subtitleText = self->_subtitleText;
  self->_subtitleText = v11;

  [(PBAPasscodeEntryViewController *)self _updatePasscodeStatusTextAnimated:v5];
}

- (void)resetPasscodeEntryFieldForFailure:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(PBAPasscodeEntryViewController *)self passcodeLockView];
  id v5 = v4;
  if (v3) {
    [v4 resetForFailedPasscode];
  }
  else {
    [v4 resetForSuccess];
  }
}

- (void)loadView
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    BOOL v3 = +[SBUIPasscodeLockViewFactory lightPasscodeLockViewForUsersCurrentStyle];
    passcodeLockView = self->_passcodeLockView;
    self->_passcodeLockView = v3;

    id v5 = self->_passcodeLockView;
    id v6 = +[UIColor colorWithWhite:0.65 alpha:1.0];
    [(SBUIPasscodeLockView *)v5 setCustomBackgroundColor:v6];

    v7 = self->_passcodeLockView;
    uint64_t v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    v13 = v10;

    v12 = [(SBUIPasscodeLockView *)v13 _numberPad];

    v14 = +[UIColor whiteColor];
    [v12 setReduceTransparencyButtonColor:v14];
  }
  else if (self->_useLightBackground)
  {
    v11 = +[SBUIPasscodeLockViewFactory lightPasscodeLockViewForUsersCurrentStyle];
    v12 = self->_passcodeLockView;
    self->_passcodeLockView = v11;
  }
  else
  {
    v15 = +[SBUIPasscodeLockViewFactory passcodeLockViewForUsersCurrentStyle];
    v16 = self->_passcodeLockView;
    self->_passcodeLockView = v15;

    v17 = self->_passcodeLockView;
    v12 = +[_UIBackdropViewSettings settingsForPrivateStyle:2030];
    v18 = [v12 combinedTintColor];
    [(SBUIPasscodeLockView *)v17 setCustomBackgroundColor:v18];
  }
  [(SBUIPasscodeLockView *)self->_passcodeLockView setDelegate:self];
  [(SBUIPasscodeLockView *)self->_passcodeLockView setShowsEmergencyCallButton:0];
  [(SBUIPasscodeLockView *)self->_passcodeLockView setBiometricAuthenticationAllowed:0];
  v19 = self->_passcodeLockView;

  [(PBAPasscodeEntryViewController *)self setView:v19];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PBAPasscodeEntryViewController;
  [(PBAPasscodeEntryViewController *)&v5 viewDidLoad];
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_homeButtonPressed:"];
  [v3 setAllowedTouchTypes:&__NSArray0__struct];
  [v3 setAllowedPressTypes:&off_10001D4F8];
  [v3 setNumberOfTapsRequired:1];
  [v3 setCancelsTouchesInView:0];
  v4 = [(PBAPasscodeEntryViewController *)self view];
  [v4 addGestureRecognizer:v3];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)PBAPasscodeEntryViewController;
  [(PBAPasscodeEntryViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PBAPasscodeEntryViewController;
  [(PBAPasscodeEntryViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  objc_super v5 = [(PBAPasscodeEntryViewController *)self view];
  [v5 becomeFirstResponder];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updatePasscodeStatusTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PBAPasscodeEntryViewController *)self passcodeLockView];
  [v5 updateStatusText:self->_titleText subtitle:self->_subtitleText animated:v3];
}

- (void)_homeButtonPressed:(id)a3
{
}

- (void)_userCancelledEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passcodeEntryViewControllerEntryCancelled:self];
  }
}

- (void)_userRequestedDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [(SBUIPasscodeLockView *)self->_passcodeLockView passcode];
  id v4 = [v3 length];

  if (v4) {
    [(PBAPasscodeEntryViewController *)self _userCancelledEntry];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passcodeEntryViewControllerCancelButtonPressed:self];
  }
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_super v6 = [v5 passcode];

  id v7 = [v6 length];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained passcodeEntryViewControllerEntryBegan:self];
    }
  }
  else
  {
    [(PBAPasscodeEntryViewController *)self _userCancelledEntry];
  }
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v7 passcode];
    objc_super v6 = [v5 dataUsingEncoding:4];
    [WeakRetained passcodeEntryViewControllerEntryCompleted:self passcode:v6];
  }
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
}

- (PBAPasscodeEntryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PBAPasscodeEntryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeLockView, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end