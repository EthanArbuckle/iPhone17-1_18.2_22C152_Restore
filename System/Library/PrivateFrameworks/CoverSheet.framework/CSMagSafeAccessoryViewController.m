@interface CSMagSafeAccessoryViewController
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasChargingAnimation;
- (BOOL)isAnimatingPresentation;
- (BOOL)isStatic;
- (BOOL)showingChargingAnimation;
- (CSMagSafeAccessory)accessory;
- (CSMagSafeAccessoryView)accessoryView;
- (CSMagSafeAccessoryViewController)initWithAccessory:(id)a3;
- (double)animationDurationBeforeDismissal;
- (double)chargingAnimationDuration;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationType;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)performDismissalAnimationWithCompletionHandler:(id)a3;
- (void)setAccessory:(id)a3;
@end

@implementation CSMagSafeAccessoryViewController

- (CSMagSafeAccessoryViewController)initWithAccessory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSMagSafeAccessoryViewController;
  v6 = [(CSMagSafeAccessoryViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessory, a3);
  }

  return v7;
}

- (void)performDismissalAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CSMagSafeAccessoryViewController *)self accessoryView];
  [v5 performAnimation:1 completionHandler:v4];
}

- (CSMagSafeAccessory)accessory
{
  return self->_accessory;
}

- (BOOL)isStatic
{
  return 0;
}

- (BOOL)hasChargingAnimation
{
  return 0;
}

- (BOOL)showingChargingAnimation
{
  return 0;
}

- (double)chargingAnimationDuration
{
  return 0.0;
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  id v5 = +[CSComponent statusBar];
  v6 = [v5 priority:40];
  v7 = [v6 hidden:1];
  [v4 addComponent:v7];

  v8 = +[CSComponent dateView];
  objc_super v9 = [v8 priority:40];
  v10 = [v9 hidden:1];
  [v4 addComponent:v10];

  v11 = +[CSComponent backgroundContent];
  v12 = [v11 priority:40];
  v13 = [v12 hidden:1];
  [v4 addComponent:v13];

  v14 = +[CSComponent pageContent];
  v15 = [v14 priority:40];
  v16 = [v15 hidden:1];
  [v4 addComponent:v16];

  v17 = +[CSComponent pageControl];
  v18 = [v17 priority:40];
  v19 = [v18 hidden:1];
  [v4 addComponent:v19];

  v20 = +[CSComponent proudLock];
  v21 = [v20 priority:40];
  v22 = [v21 hidden:1];
  [v4 addComponent:v22];

  v23 = +[CSComponent quickActions];
  v24 = [v23 priority:40];
  v25 = [v24 hidden:1];
  [v4 addComponent:v25];

  v26 = +[CSComponent controlCenterGrabber];
  v27 = [v26 priority:40];
  v28 = [v27 hidden:1];
  [v4 addComponent:v28];

  v29 = +[CSComponent homeAffordance];
  v30 = [v29 priority:40];
  v31 = [v30 hidden:1];
  [v4 addComponent:v31];

  v32 = +[CSComponent complicationContainer];
  v33 = [v32 priority:40];
  v34 = [v33 hidden:1];
  [v4 addComponent:v34];

  v35.receiver = self;
  v35.super_class = (Class)CSMagSafeAccessoryViewController;
  [(CSCoverSheetViewControllerBase *)&v35 aggregateAppearance:v4];
}

- (void)aggregateBehavior:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CSMagSafeAccessoryViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v10 aggregateBehavior:v4];
  objc_msgSend(v4, "addRestrictedCapabilities:", 4348, v10.receiver, v10.super_class);
  [v4 setScrollingStrategy:3];
  id v5 = +[CSLockScreenDomain rootSettings];
  v6 = [v5 chargingSettings];
  int v7 = [v6 warnForIdleDim];

  if (([(CSMagSafeAccessoryViewController *)self isStatic] & (v7 ^ 1)) != 0) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v4 setIdleWarnMode:v8];
  [v4 setIdleTimerMode:1];
  if ([(CSMagSafeAccessoryViewController *)self isStatic]) {
    uint64_t v9 = 11;
  }
  else {
    uint64_t v9 = 0;
  }
  [v4 setIdleTimerDuration:v9];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSMagSafeAccessoryViewController;
  if ([(CSCoverSheetViewControllerBase *)&v8 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    goto LABEL_11;
  }
  uint64_t v5 = [v4 type];
  if (v5 == 28)
  {
    if (![(CSMagSafeAccessoryViewController *)self isStatic]
      && ![(CSMagSafeAccessoryViewController *)self isAnimatingPresentation])
    {
      goto LABEL_10;
    }
  }
  else if (v5 == 25 && ![(CSMagSafeAccessoryViewController *)self isStatic])
  {
LABEL_10:
    [(CSCoverSheetViewControllerBase *)self dismiss];
LABEL_11:
    char v6 = [v4 isConsumable];
    goto LABEL_12;
  }
  char v6 = 0;
LABEL_12:

  return v6;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 500;
}

- (int64_t)presentationStyle
{
  return 2;
}

- (CSMagSafeAccessoryView)accessoryView
{
  return 0;
}

- (double)animationDurationBeforeDismissal
{
  return 0.0;
}

- (void)setAccessory:(id)a3
{
}

- (BOOL)isAnimatingPresentation
{
  return self->_isAnimatingPresentation;
}

- (void).cxx_destruct
{
}

@end