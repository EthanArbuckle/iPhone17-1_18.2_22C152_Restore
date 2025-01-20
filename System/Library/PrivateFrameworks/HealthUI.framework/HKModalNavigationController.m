@interface HKModalNavigationController
- (HKModalNavigationController)initWithRootViewController:(id)a3;
- (id)completion;
- (void)dismissWithAnimation:(id)a3;
- (void)setCompletion:(id)a3;
@end

@implementation HKModalNavigationController

- (HKModalNavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKModalNavigationController;
  v5 = [(HKModalNavigationController *)&v14 initWithRootViewController:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v8 = [v7 localizedStringForKey:@"MODAL_NAVIGATION_DONE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v9 = (void *)[v6 initWithTitle:v8 style:2 target:v5 action:sel_dismissWithAnimation_];

    v10 = [@"UIA.Health" stringByAppendingString:@".ModalNavigationItem.Done"];
    [v9 setAccessibilityIdentifier:v10];

    v11 = [v4 navigationItem];
    [v11 setRightBarButtonItem:v9];

    v12 = [v4 title];
    [(HKModalNavigationController *)v5 setTitle:v12];

    [(HKModalNavigationController *)v5 setCompletion:0];
  }

  return v5;
}

- (void)dismissWithAnimation:(id)a3
{
  id v4 = [(HKModalNavigationController *)self completion];
  [(HKModalNavigationController *)self dismissViewControllerAnimated:1 completion:v4];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end