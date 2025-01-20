@interface AXCACCorrectionsServiceViewController
- (AXCACCorrectionsServiceViewController)init;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (CACCorrectionsCollectionViewController)collectionViewController;
- (CACPopoverPresentingViewController)popoverPresentingViewController;
- (void)_dismiss;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)correctionsCollectionViewController:(id)a3 didSelectItemWithText:(id)a4;
- (void)loadView;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setCollectionViewController:(id)a3;
- (void)setPopoverPresentingViewController:(id)a3;
@end

@implementation AXCACCorrectionsServiceViewController

- (AXCACCorrectionsServiceViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)AXCACCorrectionsServiceViewController;
  v2 = [(AXCACCorrectionsServiceViewController *)&v14 init];
  if (v2)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v3 = (void *)qword_10002E770;
    uint64_t v23 = qword_10002E770;
    if (!qword_10002E770)
    {
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_100004D64;
      v18 = &unk_100024770;
      v19 = &v20;
      sub_100004D64((uint64_t)&v15);
      v3 = (void *)v21[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v20, 8);
    v5 = objc_opt_new();
    [v5 setDelegate:v2];
    id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v7 = (void *)qword_10002E780;
    uint64_t v23 = qword_10002E780;
    if (!qword_10002E780)
    {
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_100004F2C;
      v18 = &unk_100024770;
      v19 = &v20;
      sub_100004F2C((uint64_t)&v15);
      v7 = (void *)v21[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v20, 8);
    v9 = objc_opt_new();
    [v9 setViewControllerInPopover:v6];
    [v9 setPopoverPresentationDelegate:v2];
    [(AXCACCorrectionsServiceViewController *)v2 addChildViewController:v9];
    collectionViewController = v2->_collectionViewController;
    v2->_collectionViewController = (CACCorrectionsCollectionViewController *)v5;
    id v11 = v5;

    popoverPresentingViewController = v2->_popoverPresentingViewController;
    v2->_popoverPresentingViewController = (CACPopoverPresentingViewController *)v9;
  }
  return v2;
}

- (void)loadView
{
  v3 = objc_opt_new();
  [(AXCACCorrectionsServiceViewController *)self setView:v3];
  id v4 = [(AXCACCorrectionsServiceViewController *)self popoverPresentingViewController];
  v5 = [v4 view];

  [v3 addSubview:v5];
  [v3 bounds];
  [v5 setFrame:];
  [v5 setAutoresizingMask:18];
  [v5 setAlpha:0.0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000489C;
  v7[3] = &unk_1000247D0;
  id v8 = v5;
  v9 = self;
  id v6 = v5;
  +[UIView animateWithDuration:v7 animations:0.3];
}

- (void)_dismiss
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000049C0;
  v3[3] = &unk_100024748;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004A34;
  v2[3] = &unk_1000247F8;
  v2[4] = self;
  +[UIView animateWithDuration:v3 animations:v2 completion:0.3];
}

- (void)correctionsCollectionViewController:(id)a3 didSelectItemWithText:(id)a4
{
  UIAccessibilityPostNotification(0x7EDu, a4);

  [(AXCACCorrectionsServiceViewController *)self _dismiss];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v24 = a4;
  id v6 = a3;
  v7 = [v6 userInfo];
  id v8 = [v7 objectForKeyedSubscript:AXCACCorrectionsTextKey];
  v9 = [(AXCACCorrectionsServiceViewController *)self collectionViewController];
  [v9 setText:v8];

  v10 = [v6 userInfo];
  id v11 = [v10 objectForKeyedSubscript:AXCACCorrectionsAlternativesKey];
  v12 = [(AXCACCorrectionsServiceViewController *)self collectionViewController];
  [v12 setAlternatives:v11];

  v13 = [v6 userInfo];
  objc_super v14 = [v13 objectForKeyedSubscript:AXCACCorrectionsEmojisKey];
  v15 = [(AXCACCorrectionsServiceViewController *)self collectionViewController];
  [v15 setEmojis:v14];

  uint64_t v16 = [v6 userInfo];

  v17 = [v16 objectForKeyedSubscript:AXCACCorrectionsRectKey];
  CGRect v26 = CGRectFromString(v17);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  uint64_t v22 = [(AXCACCorrectionsServiceViewController *)self popoverPresentingViewController];
  [v22 setPortraitUpSourceRect:x, y, width, height];

  uint64_t v23 = v24;
  if (v24)
  {
    (*((void (**)(id))v24 + 2))(v24);
    uint64_t v23 = v24;
  }
}

- (CACCorrectionsCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
}

- (CACPopoverPresentingViewController)popoverPresentingViewController
{
  return self->_popoverPresentingViewController;
}

- (void)setPopoverPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverPresentingViewController, 0);

  objc_storeStrong((id *)&self->_collectionViewController, 0);
}

@end