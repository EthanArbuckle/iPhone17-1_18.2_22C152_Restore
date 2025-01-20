@interface QLVCFItemViewController
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canEnterFullScreen;
- (BOOL)canSwipeToDismiss;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
@end

@implementation QLVCFItemViewController

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)QLVCFItemViewController;
  -[QLVCFItemViewController setAppearance:animated:](&v9, "setAppearance:animated:", a3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008910;
  v8[3] = &unk_100024A30;
  v8[4] = self;
  v6 = objc_retainBlock(v8);
  v7 = v6;
  if (v4) {
    +[UIView animateWithDuration:v6 animations:0.2];
  }
  else {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v7 = (void (**)(id, void))a5;
  v8 = +[CNContactViewController viewControllerForUnknownContact:a3];
  [v8 setActions:32];
  [v8 setDisplayMode:1];
  [(QLVCFItemViewController *)self addChildViewController:v8];
  objc_super v9 = [(QLVCFItemViewController *)self view];
  v10 = [v8 view];
  [v9 addSubview:v10];

  [v8 didMoveToParentViewController:self];
  v11 = [v8 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [v8 view];
  v13 = [v12 topAnchor];
  v14 = [(QLVCFItemViewController *)self view];
  v15 = [v14 topAnchor];
  v16 = [(QLVCFItemViewController *)self appearance];
  [v16 topInset];
  v17 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  objc_msgSend(v17, "ql_activatedConstraint");
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topConstraint = self->_topConstraint;
  self->_topConstraint = v18;

  v20 = [(QLVCFItemViewController *)self view];
  v21 = [v20 bottomAnchor];
  v22 = [v8 view];
  v23 = [v22 bottomAnchor];
  v24 = [(QLVCFItemViewController *)self appearance];
  [v24 bottomInset];
  v25 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  objc_msgSend(v25, "ql_activatedConstraint");
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v26;

  v28 = [(QLVCFItemViewController *)self view];
  CFStringRef v32 = @"personView";
  v29 = [v8 view];
  v33 = v29;
  v30 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v31 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[personView]|" options:0 metrics:0 views:v30];
  [v28 addConstraints:v31];

  if (v7) {
    v7[2](v7, 0);
  }
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);

  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end