@interface TKContainerViewController
- (UIViewController)childViewController;
- (unint64_t)edgesForExtendedLayout;
- (void)dealloc;
- (void)observeChild;
- (void)setChildViewController:(id)a3;
- (void)updateInternals:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TKContainerViewController

- (void)viewDidLoad
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)TKContainerViewController;
  [(TKContainerViewController *)&v4 viewDidLoad];
  id v3 = (id)[MEMORY[0x263F825C8] whiteColor];
  id v2 = (id)[(TKContainerViewController *)v6 view];
  [v2 setBackgroundColor:v3];
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  [(TKKeyPathObserver *)self->_observer stopObserving];
  v2.receiver = v4;
  v2.super_class = (Class)TKContainerViewController;
  [(TKContainerViewController *)&v2 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)TKContainerViewController;
  [(TKContainerViewController *)&v3 viewWillAppear:a3];
  v6->_appearing = 1;
  [(TKContainerViewController *)v6 observeChild];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)TKContainerViewController;
  [(TKContainerViewController *)&v3 viewDidAppear:a3];
  v6->_appearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  [(TKKeyPathObserver *)self->_observer stopObserving];
  v3.receiver = v6;
  v3.super_class = (Class)TKContainerViewController;
  [(TKContainerViewController *)&v3 viewWillDisappear:v4];
}

- (unint64_t)edgesForExtendedLayout
{
  SEL v5 = self;
  SEL v4 = a2;
  if (self->_childViewController) {
    return [(UIViewController *)v5->_childViewController edgesForExtendedLayout];
  }
  v3.receiver = v5;
  v3.super_class = (Class)TKContainerViewController;
  return [(TKContainerViewController *)&v3 edgesForExtendedLayout];
}

- (void)setChildViewController:(id)a3
{
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v56->_childViewController == location[0])
  {
    int v54 = 1;
  }
  else
  {
    [(TKKeyPathObserver *)v56->_observer stopObserving];
    objc_storeStrong((id *)&v56->_childNavigationItem, 0);
    if (v56->_childViewController)
    {
      [(UIViewController *)v56->_childViewController willMoveToParentViewController:0];
      v23 = [(UIViewController *)v56->_childViewController view];
      [(UIView *)v23 removeFromSuperview];

      [(UIViewController *)v56->_childViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&v56->_childViewController, location[0]);
    if (location[0])
    {
      id v53 = (id)[(TKContainerViewController *)v56 view];
      [(TKContainerViewController *)v56 addChildViewController:location[0]];
      id v52 = (id)[location[0] view];
      [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v53 bounds];
      *(double *)&long long v50 = v3;
      *((double *)&v50 + 1) = v4;
      *(double *)&long long v51 = v5;
      *((double *)&v51 + 1) = v6;
      long long v48 = v50;
      long long v49 = v51;
      objc_msgSend(v52, "setFrame:", v3, v4, v5, v6);
      [v52 setAutoresizingMask:18];
      id v19 = (id)[MEMORY[0x263F82438] sharedApplication];
      [v19 statusBarOrientationAnimationDuration];
      double v20 = v7 / 2.0;

      v47[1] = *(id *)&v20;
      v22 = (void *)MEMORY[0x263F82E00];
      id v21 = v53;
      uint64_t v41 = MEMORY[0x263EF8330];
      int v42 = -1073741824;
      int v43 = 0;
      v44 = __52__TKContainerViewController_setChildViewController___block_invoke;
      v45 = &unk_26485AA40;
      id v46 = v53;
      v47[0] = v52;
      uint64_t v34 = MEMORY[0x263EF8330];
      int v35 = -1073741824;
      int v36 = 0;
      v37 = __52__TKContainerViewController_setChildViewController___block_invoke_2;
      v38 = &unk_26485A9C8;
      id v39 = location[0];
      v40 = v56;
      [v22 transitionWithView:v21 duration:5243008 options:&v41 animations:&v34 completion:v20];
      v8 = (UINavigationItem *)(id)[location[0] navigationItem];
      childNavigationItem = v56->_childNavigationItem;
      v56->_childNavigationItem = v8;

      id v33 = [(UINavigationItem *)v56->_childNavigationItem rightBarButtonItems];
      if (v33)
      {
        id v18 = (id)[(TKContainerViewController *)v56 navigationItem];
        [v18 setRightBarButtonItems:v33];
      }
      v10 = [(UINavigationItem *)v56->_childNavigationItem leftBarButtonItems];
      id v11 = v33;
      id v33 = v10;

      if (v33)
      {
        id v17 = (id)[(TKContainerViewController *)v56 navigationItem];
        [v17 setLeftBarButtonItems:v33];
      }
      id v32 = [(UINavigationItem *)v56->_childNavigationItem title];
      if (v32)
      {
        id v16 = (id)[(TKContainerViewController *)v56 navigationItem];
        [v16 setTitle:v32];
      }
      id v31 = [(UINavigationItem *)v56->_childNavigationItem titleView];
      if (v31)
      {
        id v15 = (id)[(TKContainerViewController *)v56 navigationItem];
        [v15 setTitleView:v31];
      }
      if (!v56->_observer)
      {
        objc_initWeak(&from, v56);
        v14 = [TKKeyPathObserver alloc];
        uint64_t v24 = MEMORY[0x263EF8330];
        int v25 = -1073741824;
        int v26 = 0;
        v27 = __52__TKContainerViewController_setChildViewController___block_invoke_3;
        v28 = &unk_26485AFF0;
        objc_copyWeak(&v29, &from);
        uint64_t v13 = [(TKKeyPathObserver *)v14 initWithBlock:&v24];
        observer = v56->_observer;
        v56->_observer = (TKKeyPathObserver *)v13;

        objc_destroyWeak(&v29);
        objc_destroyWeak(&from);
      }
      [(TKContainerViewController *)v56 observeChild];
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong((id *)&v40, 0);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(v47, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v52, 0);
      objc_storeStrong(&v53, 0);
      int v54 = 0;
    }
    else
    {
      int v54 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __52__TKContainerViewController_setChildViewController___block_invoke(uint64_t a1)
{
  v16[4] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) insertSubview:*(void *)(a1 + 40) atIndex:0];
  objc_super v2 = (void *)MEMORY[0x263F08938];
  id v15 = (id)[*(id *)(a1 + 40) leftAnchor];
  id v14 = (id)[*(id *)(a1 + 32) leftAnchor];
  id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v16[0] = v13;
  id v12 = (id)[*(id *)(a1 + 40) rightAnchor];
  id v11 = (id)[*(id *)(a1 + 32) rightAnchor];
  id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v16[1] = v10;
  id v9 = (id)[*(id *)(a1 + 40) topAnchor];
  id v8 = (id)[*(id *)(a1 + 32) topAnchor];
  id v7 = (id)objc_msgSend(v9, "constraintEqualToAnchor:");
  v16[2] = v7;
  id v6 = (id)[*(id *)(a1 + 40) bottomAnchor];
  id v5 = (id)[*(id *)(a1 + 32) bottomAnchor];
  id v4 = (id)objc_msgSend(v6, "constraintEqualToAnchor:");
  v16[3] = v4;
  id v3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];
  objc_msgSend(v2, "activateConstraints:");
}

void __52__TKContainerViewController_setChildViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  if ([MEMORY[0x263F829B8] instancesRespondToSelector:sel__computeAndApplyScrollContentInsetDeltaForViewController_])
  {
    id v3 = (id)[*(id *)(a1 + 40) navigationController];
    [v3 _computeAndApplyScrollContentInsetDeltaForViewController:*(void *)(a1 + 32)];
  }
  else
  {
    id v2 = (id)[*(id *)(a1 + 40) navigationController];
    id v1 = (id)[v2 view];
    [v1 setNeedsLayout];
  }
}

void __52__TKContainerViewController_setChildViewController___block_invoke_3(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained updateInternals:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)observeChild
{
  if (self->_childViewController)
  {
    if (self->_childNavigationItem)
    {
      [(TKKeyPathObserver *)self->_observer observe:self->_childViewController keyPath:@"navigationItem"];
      [(TKKeyPathObserver *)self->_observer observe:self->_childNavigationItem keyPath:@"rightBarButtonItems"];
      [(TKKeyPathObserver *)self->_observer observe:self->_childNavigationItem keyPath:@"leftBarButtonItems"];
      [(TKKeyPathObserver *)self->_observer observe:self->_childNavigationItem keyPath:@"title"];
      [(TKKeyPathObserver *)self->_observer observe:self->_childNavigationItem keyPath:@"titleView"];
    }
  }
}

- (void)updateInternals:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"navigationItem"])
  {
    [(TKKeyPathObserver *)v12->_observer stopObserving];
  }
  else if ([location[0] isEqualToString:@"rightBarButtonItems"])
  {
    id v10 = [(UINavigationItem *)v12->_childNavigationItem rightBarButtonItems];
    id v9 = (id)[(TKContainerViewController *)v12 navigationItem];
    [v9 setRightBarButtonItems:v10];
  }
  else if ([location[0] isEqualToString:@"leftBarButtonItems"])
  {
    id v8 = [(UINavigationItem *)v12->_childNavigationItem leftBarButtonItems];
    id v7 = (id)[(TKContainerViewController *)v12 navigationItem];
    [v7 setLeftBarButtonItems:v8];
  }
  else if ([location[0] isEqualToString:@"title"])
  {
    id v6 = [(UINavigationItem *)v12->_childNavigationItem title];
    id v5 = (id)[(TKContainerViewController *)v12 navigationItem];
    [v5 setTitle:v6];
  }
  else if ([location[0] isEqualToString:@"titleView"])
  {
    id v4 = [(UINavigationItem *)v12->_childNavigationItem titleView];
    id v3 = (id)[(TKContainerViewController *)v12 navigationItem];
    [v3 setTitleView:v4];
  }
  objc_storeStrong(location, 0);
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void).cxx_destruct
{
}

@end