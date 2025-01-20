@interface ClarityOnboardingNavigationWrapperController
- (BOOL)shouldPresentWithAnimation;
- (ClarityOnboardingNavigationWrapperController)init;
- (ClarityOnboardingNavigationWrapperController)initWithController:(id)a3;
- (ClarityOnboardingNavigationWrapperController)initWithController:(id)a3 shouldPresentWithAnimation:(BOOL)a4;
- (OBNavigationController)setUpNavigationController;
- (UIViewController)controller;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateForController;
- (void)setController:(id)a3;
- (void)setSetUpNavigationController:(id)a3;
- (void)setShouldPresentWithAnimation:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ClarityOnboardingNavigationWrapperController

- (ClarityOnboardingNavigationWrapperController)init
{
  return [(ClarityOnboardingNavigationWrapperController *)self initWithController:0];
}

- (ClarityOnboardingNavigationWrapperController)initWithController:(id)a3
{
  return [(ClarityOnboardingNavigationWrapperController *)self initWithController:a3 shouldPresentWithAnimation:1];
}

- (ClarityOnboardingNavigationWrapperController)initWithController:(id)a3 shouldPresentWithAnimation:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ClarityOnboardingNavigationWrapperController;
  v8 = [(ClarityOnboardingNavigationWrapperController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controller, a3);
    v9->_shouldPresentWithAnimation = a4;
    [(ClarityOnboardingNavigationWrapperController *)v9 _updateForController];
  }

  return v9;
}

- (void)setController:(id)a3
{
  v5 = (UIViewController *)a3;
  p_controller = &self->_controller;
  if (self->_controller != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_controller, a3);
    p_controller = (UIViewController **)[(ClarityOnboardingNavigationWrapperController *)self _updateForController];
    v5 = v7;
  }

  _objc_release_x1(p_controller, v5);
}

- (void)_updateForController
{
  if (self->_controller)
  {
    id v3 = [objc_alloc((Class)OBNavigationController) initWithRootViewController:self->_controller];
    [v3 setModalInPresentation:1];
    [(ClarityOnboardingNavigationWrapperController *)self setSetUpNavigationController:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ClarityOnboardingNavigationWrapperController;
  [(ClarityOnboardingNavigationWrapperController *)&v5 viewWillAppear:a3];
  setUpNavigationController = self->_setUpNavigationController;
  if (setUpNavigationController) {
    [(ClarityOnboardingNavigationWrapperController *)self presentViewController:setUpNavigationController animated:[(ClarityOnboardingNavigationWrapperController *)self shouldPresentWithAnimation] completion:0];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 2;
  }
}

- (OBNavigationController)setUpNavigationController
{
  return self->_setUpNavigationController;
}

- (void)setSetUpNavigationController:(id)a3
{
}

- (UIViewController)controller
{
  return self->_controller;
}

- (BOOL)shouldPresentWithAnimation
{
  return self->_shouldPresentWithAnimation;
}

- (void)setShouldPresentWithAnimation:(BOOL)a3
{
  self->_shouldPresentWithAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_setUpNavigationController, 0);
}

@end