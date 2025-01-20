@interface DRApplication
+ (BOOL)_isUIKitSystemProcess;
+ (BOOL)_suppressesTextEffectsWindow;
- (BOOL)_shouldAllowKeyboardArbiter;
- (BOOL)_supportsHomeAffordanceObservation;
- (BOOL)_supportsMenuActions;
- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6;
@end

@implementation DRApplication

+ (BOOL)_isUIKitSystemProcess
{
  return 1;
}

+ (BOOL)_suppressesTextEffectsWindow
{
  return 1;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

- (BOOL)_supportsMenuActions
{
  return 0;
}

- (BOOL)_supportsHomeAffordanceObservation
{
  return 0;
}

- (void)workspace:(id)a3 didCreateScene:(id)a4 withTransitionContext:(id)a5 completion:(id)a6
{
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DRApplication;
  [(DRApplication *)&v13 workspace:a3 didCreateScene:v10 withTransitionContext:a5 completion:a6];
  v11 = [v10 delegate];

  if (!v11)
  {
    v12 = [(DRApplication *)self delegate];
    [v10 setDelegate:v12];
  }
}

@end