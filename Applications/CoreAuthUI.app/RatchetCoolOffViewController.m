@interface RatchetCoolOffViewController
- (BOOL)isFullScreenController;
- (BOOL)processHomeButtonPressed;
- (BOOL)shouldPresentWithAnimation;
- (int64_t)modalPresentationStyle;
- (void)loadView;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)ratchetCoolOffContentDidTapOnBeginDelay:(id)a3;
- (void)ratchetCoolOffContentDidTapOnContinue:(id)a3;
- (void)ratchetCoolOffContentDidTapOnCustomCancel:(id)a3;
- (void)ratchetCoolOffContentDidTapOnLearnMore:(id)a3;
- (void)viewDidLoad;
@end

@implementation RatchetCoolOffViewController

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(RatchetCoolOffViewController *)self setView:v3];

  v4 = [(TransitionViewController *)self internalInfo];
  v5 = +[RatchetCoolOffFactory makeViewControllerWith:v4 delegate:self];
  contentVC = self->_contentVC;
  self->_contentVC = v5;

  [(RatchetCoolOffContentViewControllerType *)self->_contentVC willMoveToParent:self];
  v7 = [(RatchetCoolOffViewController *)self view];
  v8 = [(RatchetCoolOffContentViewControllerType *)self->_contentVC view];
  [v7 addSubview:v8];

  v9 = [(RatchetCoolOffContentViewControllerType *)self->_contentVC view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(RatchetCoolOffContentViewControllerType *)self->_contentVC view];
  v11 = [v10 topAnchor];
  v12 = [(RatchetCoolOffViewController *)self view];
  v13 = [v12 topAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [(RatchetCoolOffContentViewControllerType *)self->_contentVC view];
  v16 = [v15 bottomAnchor];
  v17 = [(RatchetCoolOffViewController *)self view];
  v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(RatchetCoolOffContentViewControllerType *)self->_contentVC view];
  v21 = [v20 leadingAnchor];
  v22 = [(RatchetCoolOffViewController *)self view];
  v23 = [v22 leadingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [(RatchetCoolOffContentViewControllerType *)self->_contentVC view];
  v26 = [v25 trailingAnchor];
  v27 = [(RatchetCoolOffViewController *)self view];
  v28 = [v27 trailingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  v30 = self->_contentVC;

  [(RatchetCoolOffContentViewControllerType *)v30 didMoveToParent:self];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RatchetCoolOffViewController;
  [(TransitionViewController *)&v4 viewDidLoad];
  id v3 = [(RatchetCoolOffViewController *)self presentationController];
  [v3 setDelegate:self];
}

- (BOOL)isFullScreenController
{
  return 1;
}

- (BOOL)shouldPresentWithAnimation
{
  return 1;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  if (a3 == 19)
  {
    contentVC = self->_contentVC;
    double v10 = 0.0;
  }
  else
  {
    if (a3 != 18) {
      goto LABEL_6;
    }
    v9 = self->_contentVC;
    [v12 doubleValue];
    contentVC = v9;
  }
  [(RatchetCoolOffContentViewControllerType *)contentVC setCoolOffDuration:v10];
LABEL_6:
}

- (BOOL)processHomeButtonPressed
{
  return 1;
}

- (void)ratchetCoolOffContentDidTapOnBeginDelay:(id)a3
{
}

- (void)ratchetCoolOffContentDidTapOnCustomCancel:(id)a3
{
  id v4 = +[LAErrorHelper errorWithCode:-1025 message:@"Custom canceled by user."];
  [(TransitionViewController *)self uiCancelWithError:v4];
}

- (void)ratchetCoolOffContentDidTapOnContinue:(id)a3
{
}

- (void)ratchetCoolOffContentDidTapOnLearnMore:(id)a3
{
  [(TransitionViewController *)self uiDismissed];
  id v4 = +[LACUIDTOUtilities dtoLearnMoreLinkURL];
  [(TransitionViewController *)self uiOpenURL:v4];
}

- (void)presentationControllerWillDismiss:(id)a3
{
}

- (void).cxx_destruct
{
}

@end