@interface PBAStackViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)viewControllers;
- (PBAStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBAStackViewController)initWithRootViewController:(id)a3;
- (UIViewController)topViewController;
- (UIViewController)visibleViewController;
- (void)_setViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)popToRootViewControllerAnimated:(BOOL)a3;
- (void)popToViewController:(id)a3 animated:(BOOL)a4;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeViewController:(id)a3 animated:(BOOL)a4;
- (void)replaceViewController:(id)a3 withViewController:(id)a4 animated:(BOOL)a5;
- (void)setViewControllers:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)viewDidLoad;
@end

@implementation PBAStackViewController

- (PBAStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PBAStackViewController;
  v4 = [(PBAStackViewController *)&v8 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    viewControllers = v4->_viewControllers;
    v4->_viewControllers = (NSArray *)&__NSArray0__struct;
  }
  return v5;
}

- (PBAStackViewController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v5 = [(PBAStackViewController *)self initWithNibName:0 bundle:0];
  [(PBAStackViewController *)v5 pushViewController:v4 animated:0 completion:0];

  return v5;
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  v5 = [v3 initWithFrame:];
  containerView = self->_containerView;
  self->_containerView = v5;

  v7 = self->_containerView;

  [(PBAStackViewController *)self setView:v7];
}

- (void)setViewControllers:(id)a3
{
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v35 = a4;
  id v7 = a3;
  v40 = (void (**)(void))a5;
  objc_super v8 = self->_viewControllers;
  id v9 = [v7 copy];
  v10 = [(PBAStackViewController *)self topViewController];
  v39 = v7;
  v11 = [v7 lastObject];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v36 = v9;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v13)
  {
    id v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v72;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v72 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (![(NSArray *)v8 containsObject:v18])
        {
          [(PBAStackViewController *)self addChildViewController:v18];
          if (v18 == v11) {
            char v15 = 1;
          }
          else {
            [v18 didMoveToParentViewController:self];
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v14);
  }
  else
  {
    char v15 = 0;
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v19 = v8;
  id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v68;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v68 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
        if (([v12 containsObject:v24] & 1) == 0)
        {
          [v24 willMoveToParentViewController:0];
          if (v24 != v10) {
            [v24 removeFromParentViewController];
          }
        }
      }
      id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v21);
  }

  objc_storeStrong((id *)&self->_viewControllers, v36);
  if (v10 != v11)
  {
    v25 = [v11 view];
    [(UIView *)self->_containerView bounds];
    [v25 setFrame:];
    [v10 view];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10000A16C;
    v65[3] = &unk_10001C748;
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v66 = v32;
    v34 = objc_retainBlock(v65);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10000A178;
    v63[3] = &unk_10001C748;
    id v37 = v25;
    id v64 = v37;
    v33 = objc_retainBlock(v63);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10000A184;
    v60[3] = &unk_10001CAD0;
    char v62 = 0;
    id v26 = v10;
    id v61 = v26;
    v38 = objc_retainBlock(v60);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10000A198;
    v56[3] = &unk_10001CAF8;
    char v59 = v15 & 1;
    id v27 = v11;
    id v57 = v27;
    v58 = self;
    v28 = objc_retainBlock(v56);
    if (!v35)
    {
      v29 = v32;
      if (v26)
      {
        ((void (*)(void))v38[2])();
        [v32 removeFromSuperview];
        if (v40) {
          v40[2]();
        }
      }
      if (v27)
      {
        [(UIView *)self->_containerView addSubview:v37];
        ((void (*)(void *))v28[2])(v28);
        if (v40) {
          v40[2]();
        }
      }
      goto LABEL_42;
    }
    if (v26 && v27)
    {
      [v37 setAlpha:1.0];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10000A1B4;
      v52[3] = &unk_10001CB40;
      v53 = v38;
      v54 = v28;
      v55 = v40;
      [(PBAStackViewController *)self transitionFromViewController:v26 toViewController:v27 duration:5242880 options:&stru_10001CB18 animations:v52 completion:0.5];

      v29 = v32;
    }
    else
    {
      v29 = v32;
      if (!v26 || v27)
      {
        if (v26 || !v27) {
          goto LABEL_42;
        }
        v31 = [(PBAStackViewController *)self view];
        [v31 addSubview:v37];

        [v37 setAlpha:0.0];
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10000A294;
        v44[3] = &unk_10001CB68;
        v45 = v33;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10000A2A4;
        v41[3] = &unk_10001CBB8;
        v42 = v28;
        v43 = v40;
        +[UIView animateWithDuration:v44 animations:v41 completion:0.5];

        v30 = v45;
      }
      else
      {
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10000A220;
        v50[3] = &unk_10001CB68;
        v51 = v34;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10000A230;
        v46[3] = &unk_10001CB90;
        v48 = v38;
        id v47 = v32;
        v49 = v40;
        +[UIView animateWithDuration:v50 animations:v46 completion:0.5];

        v30 = v51;
      }
    }
LABEL_42:
  }
}

- (UIViewController)topViewController
{
  return (UIViewController *)[(NSArray *)self->_viewControllers lastObject];
}

- (UIViewController)visibleViewController
{
  v2 = [(PBAStackViewController *)self topViewController];
  uint64_t v3 = [v2 presentedViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      id v5 = v4;

      id v4 = [v5 presentedViewController];

      v2 = v5;
    }
    while (v4);
  }
  else
  {
    id v5 = v2;
  }

  return (UIViewController *)v5;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  viewControllers = self->_viewControllers;
  id v9 = a5;
  id v10 = [(NSArray *)viewControllers arrayByAddingObject:a3];
  [(PBAStackViewController *)self _setViewControllers:v10 animated:v5 completion:v9];
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  NSUInteger v5 = [(NSArray *)self->_viewControllers count];
  if (v5) {
    NSUInteger v6 = v5 - 1;
  }
  else {
    NSUInteger v6 = 0;
  }
  -[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PBAStackViewController *)self setViewControllers:v7 animated:v3];
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PBAStackViewController *)self setViewControllers:v5 animated:v3];
}

- (void)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  NSUInteger v7 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PBAStackViewController.m", 204, @"attempt to pop to view controller %@ not in view controller stack", v10 object file lineNumber description];
  }
  objc_super v8 = -[NSArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, v7 + 1);
  [(PBAStackViewController *)self setViewControllers:v8 animated:v4];
}

- (void)removeViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  viewControllers = self->_viewControllers;
  id v7 = a3;
  id v8 = [(NSArray *)viewControllers mutableCopy];
  [v8 removeObject:v7];

  [(PBAStackViewController *)self setViewControllers:v8 animated:v4];
}

- (void)replaceViewController:(id)a3 withViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v9 = a4;
  id v10 = [(NSArray *)self->_viewControllers mutableCopy];
  id v11 = [v10 indexOfObject:v13];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PBAStackViewController.m", 221, @"attempt to replace view controller %@ not in view controller stack", v13 object file lineNumber description];
  }
  [v10 replaceObjectAtIndex:v11 withObject:v9];
  [(PBAStackViewController *)self setViewControllers:v10 animated:v5];
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v5 = a3;
  [(PBAStackViewController *)self pushViewController:v5 animated:+[UIView areAnimationsEnabled] completion:0];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PBAStackViewController;
  [(PBAStackViewController *)&v8 viewDidLoad];
  BOOL v3 = [(PBAStackViewController *)self topViewController];
  BOOL v4 = [v3 parentViewController];

  if (!v4) {
    [(PBAStackViewController *)self addChildViewController:v3];
  }
  id v5 = [v3 view];
  [(UIView *)self->_containerView bounds];
  [v5 setFrame:];

  containerView = self->_containerView;
  id v7 = [v3 view];
  [(UIView *)containerView addSubview:v7];

  if (!v4) {
    [v3 didMoveToParentViewController:self];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)PBAStackViewController;
  [(PBAStackViewController *)&v2 didReceiveMemoryWarning];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end