@interface SVSBaseViewController
- (BOOL)_canShowWhileLocked;
- (NSLayoutConstraint)bottomMarginConstraint;
- (SVSBaseViewController)initWithMainController:(id)a3;
- (SVSCardContainerView)containerView;
- (id)mainController;
- (void)cancelProxCardDraggingWithCompletion:(id)a3;
- (void)setBottomMarginConstraint:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setMainController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SVSBaseViewController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mainController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
}

- (void)setMainController:(id)a3
{
}

- (id)mainController
{
  return self->_mainController;
}

- (void)setContainerView:(id)a3
{
}

- (SVSCardContainerView)containerView
{
  return self->_containerView;
}

- (void)setBottomMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomMarginConstraint
{
  return self->_bottomMarginConstraint;
}

- (void)viewDidLayoutSubviews
{
  if (!self->_didReactivateContainerViewAfterLayingOut)
  {
    self->_didReactivateContainerViewAfterLayingOut = 1;
    [(SVSCardContainerView *)self->_containerView reactivate];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SVSBaseViewController;
  [(SVSBaseViewController *)&v12 viewDidAppear:a3];
  v4 = [(SVSBaseViewController *)self navigationController];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id location = 0;
    objc_initWeak(&location, self);
    [(SVSCardContainerView *)self->_containerView setNeedsLayout];
    [(SVSCardContainerView *)self->_containerView layoutIfNeeded];
    containerView = self->_containerView;
    v7 = [v5 dimmingView];
    bottomMarginConstraint = self->_bottomMarginConstraint;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001361F0;
    v9[3] = &unk_1001A17F8;
    objc_copyWeak(&v10, &location);
    [(SVSCardContainerView *)containerView activateWithDimmingView:v7 bottomMarginConstraint:bottomMarginConstraint dismissHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SVSBaseViewController;
  [(SVSBaseViewController *)&v5 viewWillAppear:a3];
  v4 = [(SVSBaseViewController *)self navigationController];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [(SVSBaseViewController *)self setOverrideUserInterfaceStyle:1];
  }
}

- (void)cancelProxCardDraggingWithCompletion:(id)a3
{
  containerView = self->_containerView;
  if (containerView) {
    [(SVSCardContainerView *)containerView cancelProxCardDraggingWithCompletion:a3];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (SVSBaseViewController)initWithMainController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SVSBaseViewController;
  objc_super v5 = [(SVSBaseViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(SVSBaseViewController *)v5 setMainController:v4];
  }

  return v6;
}

@end