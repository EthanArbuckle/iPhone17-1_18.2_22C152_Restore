@interface HKOnboardingBaseViewController
- (BOOL)isOnboarding;
- (HKOnboardingPageViewControllerDelegate)delegate;
- (NSLayoutConstraint)scrollViewBottomConstraint;
- (NSString)cancelWithConfirmAlertAbortActionTitle;
- (NSString)cancelWithConfirmAlertContinueActionTitle;
- (NSString)cancelWithConfirmAlertTitle;
- (UIScrollView)scrollView;
- (UIView)contentView;
- (UIView)footerView;
- (double)_titleTopToFirstBaselineLeading;
- (double)contentTop;
- (double)titleTopToFirstBaseline;
- (id)_buttonForButtonType:(int64_t)a3;
- (id)_cancelButton;
- (id)_cancelWithConfirmButton;
- (id)_closeButton;
- (id)_skipButton;
- (id)_titleFontTextStyle;
- (id)initForOnboarding:(BOOL)a3;
- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4;
- (id)titleFont;
- (int64_t)leftButtonType;
- (int64_t)rightButtonType;
- (int64_t)upgradingFromAlgorithmVersion;
- (void)_adjustScrollViewForFooterView;
- (void)_setUpNavigationBar;
- (void)cancelWithConfirmButtonTapped:(id)a3;
- (void)closeButtonTapped:(id)a3;
- (void)presentAlertWithMessage:(id)a3;
- (void)presentAlertWithMessage:(id)a3 title:(id)a4;
- (void)presentLearnMoreAlertWithMessage:(id)a3 learnMoreTapped:(id)a4;
- (void)removeFooterView;
- (void)setCancelWithConfirmAlertAbortActionTitle:(id)a3;
- (void)setCancelWithConfirmAlertContinueActionTitle:(id)a3;
- (void)setCancelWithConfirmAlertTitle:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterView:(id)a3 insets:(NSDirectionalEdgeInsets)a4;
- (void)setLeftButtonType:(int64_t)a3;
- (void)setRightButtonType:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewBottomConstraint:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)setUpgradingFromAlgorithmVersion:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKOnboardingBaseViewController

- (id)initForOnboarding:(BOOL)a3
{
  return [(HKOnboardingBaseViewController *)self initForOnboarding:a3 upgradingFromAlgorithmVersion:*MEMORY[0x1E4F2B9E0]];
}

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKOnboardingBaseViewController;
  id result = [(HKOnboardingBaseViewController *)&v7 initWithNibName:0 bundle:0];
  if (result)
  {
    *((unsigned char *)result + 976) = a3;
    *((void *)result + 123) = a4;
  }
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HKOnboardingBaseViewController;
  [(HKOnboardingBaseViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(HKOnboardingBaseViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(HKOnboardingBaseViewController *)self setUpUI];
  [(HKOnboardingBaseViewController *)self setUpConstraints];
  if ([(HKOnboardingBaseViewController *)self isOnboarding]) {
    [(HKOnboardingBaseViewController *)self _setUpNavigationBar];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKOnboardingBaseViewController;
  [(HKOnboardingBaseViewController *)&v5 viewWillAppear:a3];
  v4 = [(HKOnboardingBaseViewController *)self scrollView];
  [v4 flashScrollIndicators];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HKOnboardingBaseViewController;
  [(HKOnboardingBaseViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(HKOnboardingBaseViewController *)self traitCollection];
  -[HKOnboardingBaseViewController updateUserInterfaceForStyle:](self, "updateUserInterfaceForStyle:", [v3 userInterfaceStyle]);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKOnboardingBaseViewController;
  id v4 = a3;
  [(HKOnboardingBaseViewController *)&v8 traitCollectionDidChange:v4];
  objc_super v5 = [(HKOnboardingBaseViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  uint64_t v7 = [v4 userInterfaceStyle];
  if (v6 != v7) {
    [(HKOnboardingBaseViewController *)self updateUserInterfaceForStyle:v6];
  }
}

- (void)setUpUI
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  [(HKOnboardingBaseViewController *)self setScrollView:v3];

  id v4 = [(HKOnboardingBaseViewController *)self scrollView];
  [v4 setAlwaysBounceVertical:1];

  objc_super v5 = [(HKOnboardingBaseViewController *)self scrollView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v6 = [(HKOnboardingBaseViewController *)self view];
  uint64_t v7 = [(HKOnboardingBaseViewController *)self scrollView];
  [v6 addSubview:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(HKOnboardingBaseViewController *)self setContentView:v8];

  v9 = [(HKOnboardingBaseViewController *)self contentView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(HKOnboardingBaseViewController *)self scrollView];
  v10 = [(HKOnboardingBaseViewController *)self contentView];
  [v11 addSubview:v10];
}

- (void)setUpConstraints
{
  id v3 = [(HKOnboardingBaseViewController *)self scrollView];
  id v4 = [(HKOnboardingBaseViewController *)self view];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  objc_super v5 = [(HKOnboardingBaseViewController *)self scrollView];
  uint64_t v6 = [v5 topAnchor];
  uint64_t v7 = [(HKOnboardingBaseViewController *)self view];
  id v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [(HKOnboardingBaseViewController *)self scrollView];
  id v11 = [v10 bottomAnchor];
  v12 = [(HKOnboardingBaseViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [(HKOnboardingBaseViewController *)self setScrollViewBottomConstraint:v14];

  v15 = [(HKOnboardingBaseViewController *)self scrollViewBottomConstraint];
  [v15 setActive:1];

  v16 = [(HKOnboardingBaseViewController *)self contentView];
  v17 = [(HKOnboardingBaseViewController *)self scrollView];
  objc_msgSend(v16, "hk_alignHorizontalConstraintsWithView:margin:", v17, 0.0);

  v18 = [(HKOnboardingBaseViewController *)self contentView];
  v19 = [(HKOnboardingBaseViewController *)self scrollView];
  objc_msgSend(v18, "hk_alignVerticalConstraintsWithView:margin:", v19, 0.0);

  id v21 = [(HKOnboardingBaseViewController *)self contentView];
  v20 = [(HKOnboardingBaseViewController *)self view];
  objc_msgSend(v21, "hk_alignHorizontalConstraintsWithView:margin:", v20, 0.0);
}

- (void)setFooterView:(id)a3 insets:(NSDirectionalEdgeInsets)a4
{
  double trailing = a4.trailing;
  double leading = a4.leading;
  objc_storeStrong((id *)&self->_footerView, a3);
  id v8 = a3;
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(HKOnboardingBaseViewController *)self view];
  [v9 addSubview:v8];

  v10 = [v8 leadingAnchor];
  id v11 = [(HKOnboardingBaseViewController *)self view];
  v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:leading];
  [v13 setActive:1];

  v14 = [v8 trailingAnchor];
  v15 = [(HKOnboardingBaseViewController *)self view];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:-trailing];
  [v17 setActive:1];

  v18 = [v8 bottomAnchor];

  v19 = [(HKOnboardingBaseViewController *)self view];
  v20 = [v19 bottomAnchor];
  id v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  [(HKOnboardingBaseViewController *)self _adjustScrollViewForFooterView];
}

- (void)removeFooterView
{
  id v3 = [(HKOnboardingBaseViewController *)self footerView];
  [v3 removeFromSuperview];

  double v4 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  id v8 = [(HKOnboardingBaseViewController *)self scrollView];
  objc_msgSend(v8, "setContentInset:", v4, v5, v6, v7);

  id v9 = [(HKOnboardingBaseViewController *)self scrollView];
  objc_msgSend(v9, "setScrollIndicatorInsets:", v4, v5, v6, v7);
}

- (void)setLeftButtonType:(int64_t)a3
{
  self->_leftButtonType = a3;
  -[HKOnboardingBaseViewController _buttonForButtonType:](self, "_buttonForButtonType:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(HKOnboardingBaseViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v5];
}

- (void)setRightButtonType:(int64_t)a3
{
  self->_rightButtonType = a3;
  -[HKOnboardingBaseViewController _buttonForButtonType:](self, "_buttonForButtonType:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(HKOnboardingBaseViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v5];
}

- (void)cancelWithConfirmButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(HKOnboardingBaseViewController *)self cancelWithConfirmAlertTitle];
  if (![v5 length]) {
    goto LABEL_6;
  }
  double v6 = [(HKOnboardingBaseViewController *)self cancelWithConfirmAlertContinueActionTitle];
  if (![v6 length])
  {

LABEL_6:
    goto LABEL_7;
  }
  double v7 = [(HKOnboardingBaseViewController *)self cancelWithConfirmAlertAbortActionTitle];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
LABEL_7:
    [(HKOnboardingBaseViewController *)self closeButtonTapped:v4];
    goto LABEL_8;
  }
  id v9 = (void *)MEMORY[0x1E4FB1418];
  v10 = [(HKOnboardingBaseViewController *)self cancelWithConfirmAlertTitle];
  id v11 = [v9 alertControllerWithTitle:0 message:v10 preferredStyle:0];

  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = [(HKOnboardingBaseViewController *)self cancelWithConfirmAlertAbortActionTitle];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __64__HKOnboardingBaseViewController_cancelWithConfirmButtonTapped___block_invoke;
  id v21 = &unk_1E6D52790;
  v22 = self;
  id v23 = v4;
  v14 = [v12 actionWithTitle:v13 style:0 handler:&v18];

  v15 = (void *)MEMORY[0x1E4FB1410];
  v16 = [(HKOnboardingBaseViewController *)self cancelWithConfirmAlertContinueActionTitle];
  v17 = [v15 actionWithTitle:v16 style:1 handler:0];

  [v11 addAction:v14];
  [v11 addAction:v17];
  [(HKOnboardingBaseViewController *)self presentViewController:v11 animated:1 completion:0];

LABEL_8:
}

uint64_t __64__HKOnboardingBaseViewController_cancelWithConfirmButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeButtonTapped:*(void *)(a1 + 40)];
}

- (void)closeButtonTapped:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__HKOnboardingBaseViewController_closeButtonTapped___block_invoke;
  v3[3] = &unk_1E6D50ED8;
  v3[4] = self;
  [(HKOnboardingBaseViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

void __52__HKOnboardingBaseViewController_closeButtonTapped___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 onboardingCancelled];
  }
}

- (void)presentAlertWithMessage:(id)a3 title:(id)a4
{
  id v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a4 message:a3 preferredStyle:1];
  id v5 = (void *)MEMORY[0x1E4FB1410];
  double v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v7 = [v6 localizedStringForKey:@"ONBOARDING_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v8 = [v5 actionWithTitle:v7 style:1 handler:0];
  [v9 addAction:v8];

  [(HKOnboardingBaseViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)presentAlertWithMessage:(id)a3
{
}

- (void)presentLearnMoreAlertWithMessage:(id)a3 learnMoreTapped:(id)a4
{
  id v5 = a4;
  double v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:a3 preferredStyle:1];
  double v7 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v9 = [v8 localizedStringForKey:@"ONBOARDING_LEARN_MORE_WITH_ELLIPSES" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__HKOnboardingBaseViewController_presentLearnMoreAlertWithMessage_learnMoreTapped___block_invoke;
  v17[3] = &unk_1E6D53958;
  id v18 = v5;
  id v10 = v5;
  id v11 = [v7 actionWithTitle:v9 style:0 handler:v17];

  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"ONBOARDING_OK" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v15 = [v12 actionWithTitle:v14 style:0 handler:0];

  [v6 addAction:v11];
  [v6 addAction:v15];
  [v6 setPreferredAction:v15];
  [(HKOnboardingBaseViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __83__HKOnboardingBaseViewController_presentLearnMoreAlertWithMessage_learnMoreTapped___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_buttonForButtonType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v5 = [(HKOnboardingBaseViewController *)self _cancelWithConfirmButton];
      goto LABEL_9;
    case 2:
      id v5 = [(HKOnboardingBaseViewController *)self _cancelButton];
      goto LABEL_9;
    case 3:
      id v5 = [(HKOnboardingBaseViewController *)self _closeButton];
      goto LABEL_9;
    case 4:
      id v5 = [(HKOnboardingBaseViewController *)self _skipButton];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (id)_cancelWithConfirmButton
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelWithConfirmButtonTapped_];
  uint64_t v3 = [NSString healthAccessibilityIdentifier:0 suffix:@"Onboarding.cancelWithConfirmButton"];
  [v2 setAccessibilityIdentifier:v3];

  return v2;
}

- (id)_cancelButton
{
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"ONBOARDING_CANCEL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel_closeButtonTapped_];

  double v7 = [NSString healthAccessibilityIdentifier:0 suffix:@"Onboarding.cancelButton"];
  [v6 setAccessibilityIdentifier:v7];

  return v6;
}

- (id)_closeButton
{
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"ONBOARDING_CLOSE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel_closeButtonTapped_];

  double v7 = [NSString healthAccessibilityIdentifier:0 suffix:@"Onboarding.closeButton"];
  [v6 setAccessibilityIdentifier:v7];

  return v6;
}

- (id)_skipButton
{
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"ONBOARDING_SKIP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  double v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel_skipButtonTapped_];

  double v7 = [NSString healthAccessibilityIdentifier:0 suffix:@"Onboarding.skipButton"];
  [v6 setAccessibilityIdentifier:v7];

  return v6;
}

- (void)_setUpNavigationBar
{
  id v3 = [(HKOnboardingBaseViewController *)self navigationController];
  uint64_t v4 = [v3 navigationBar];
  [v4 _setHidesShadow:1];

  id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v5 = [(HKOnboardingBaseViewController *)self navigationController];
  double v6 = [v5 navigationBar];
  [v6 setBarTintColor:v7];
}

- (void)_adjustScrollViewForFooterView
{
  id v3 = [(HKOnboardingBaseViewController *)self scrollView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  id v10 = [(HKOnboardingBaseViewController *)self footerView];
  [v10 layoutIfNeeded];

  id v11 = [(HKOnboardingBaseViewController *)self footerView];
  [v11 frame];
  double Height = CGRectGetHeight(v19);
  v13 = [(UIViewController *)self hk_window];
  [v13 safeAreaInsets];
  double v15 = Height - v14;

  v16 = [(HKOnboardingBaseViewController *)self scrollView];
  objc_msgSend(v16, "setContentInset:", v5, v7, v15, v9);

  id v17 = [(HKOnboardingBaseViewController *)self scrollView];
  objc_msgSend(v17, "setScrollIndicatorInsets:", v5, v7, v15, v9);
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x1E4FB2928];
}

- (id)titleFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  id v3 = [(HKOnboardingBaseViewController *)self _titleFontTextStyle];
  double v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (double)_titleTopToFirstBaselineLeading
{
  BOOL v2 = [(HKOnboardingBaseViewController *)self isOnboarding];
  int v3 = objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas5Point8InchScreen");
  double result = 36.0;
  if (v3) {
    double result = 44.0;
  }
  double v5 = 40.0;
  if (v3) {
    double v5 = 48.0;
  }
  if (!v2) {
    return v5;
  }
  return result;
}

- (double)titleTopToFirstBaseline
{
  int v3 = [(HKOnboardingBaseViewController *)self titleFont];
  [(HKOnboardingBaseViewController *)self _titleTopToFirstBaselineLeading];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (double)contentTop
{
  int v3 = [(HKOnboardingBaseViewController *)self isViewLoaded];
  double result = 0.0;
  if (v3)
  {
    double v5 = [(HKOnboardingBaseViewController *)self view];
    [v5 frame];
    double Height = CGRectGetHeight(v10);
    double v7 = [(HKOnboardingBaseViewController *)self navigationController];
    double v8 = [v7 navigationBar];
    [v8 frame];
    double v9 = -(CGRectGetHeight(v11) - Height * 0.09);

    double result = 0.0;
    if (v9 >= 0.0) {
      return v9;
    }
  }
  return result;
}

- (BOOL)isOnboarding
{
  return self->_onboarding;
}

- (int64_t)upgradingFromAlgorithmVersion
{
  return self->_upgradingFromAlgorithmVersion;
}

- (void)setUpgradingFromAlgorithmVersion:(int64_t)a3
{
  self->_upgradingFromAlgorithmVersion = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (int64_t)leftButtonType
{
  return self->_leftButtonType;
}

- (int64_t)rightButtonType
{
  return self->_rightButtonType;
}

- (HKOnboardingPageViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)cancelWithConfirmAlertTitle
{
  return self->_cancelWithConfirmAlertTitle;
}

- (void)setCancelWithConfirmAlertTitle:(id)a3
{
}

- (NSString)cancelWithConfirmAlertContinueActionTitle
{
  return self->_cancelWithConfirmAlertContinueActionTitle;
}

- (void)setCancelWithConfirmAlertContinueActionTitle:(id)a3
{
}

- (NSString)cancelWithConfirmAlertAbortActionTitle
{
  return self->_cancelWithConfirmAlertAbortActionTitle;
}

- (void)setCancelWithConfirmAlertAbortActionTitle:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void)setScrollViewBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_cancelWithConfirmAlertAbortActionTitle, 0);
  objc_storeStrong((id *)&self->_cancelWithConfirmAlertContinueActionTitle, 0);
  objc_storeStrong((id *)&self->_cancelWithConfirmAlertTitle, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end