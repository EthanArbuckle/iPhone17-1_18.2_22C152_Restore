@interface TKApplicationViewController
+ (id)applicationViewController:(id)a3;
- (BOOL)handleApplicationControllerError;
- (NSString)viewName;
- (NSURL)bundleURL;
- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4;
- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4 withData:(id)a5;
- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4 withDataRequest:(id)a5;
- (TKApplicationViewController)initWithBundleURL:(id)a3 viewName:(id)a4 delegate:(id)a5;
- (TKApplicationViewControllerDelegate)delegate;
- (UIViewController)childViewController;
- (UIViewController)loadingViewController;
- (void)didLoadViewController:(id)a3;
- (void)dismissApplicationControllerAnimated:(BOOL)a3;
- (void)setChildViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoadingViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TKApplicationViewController

- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  v8 = v18;
  id v6 = location[0];
  id v7 = v16;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  v13 = __58__TKApplicationViewController_initWithBundleURL_loadPage___block_invoke;
  v14 = &unk_26485A900;
  id v15 = v16;
  v18 = 0;
  v18 = -[TKApplicationViewController initWithBundleURL:viewName:delegate:](v8, "initWithBundleURL:viewName:delegate:", v6, v7);
  v9 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v9;
}

id __58__TKApplicationViewController_initWithBundleURL_loadPage___block_invoke(uint64_t a1)
{
  id v3 = +[TKApplication shared];
  id v4 = (id)[v3 loadPage:*(void *)(a1 + 32)];

  return v4;
}

- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4 withData:(id)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  uint64_t v10 = v22;
  id v8 = location[0];
  id v9 = v20;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __67__TKApplicationViewController_initWithBundleURL_loadPage_withData___block_invoke;
  id v16 = &unk_26485A928;
  id v17 = v20;
  id v18 = v19;
  v22 = 0;
  v22 = -[TKApplicationViewController initWithBundleURL:viewName:delegate:](v10, "initWithBundleURL:viewName:delegate:", v8, v9);
  int v11 = v22;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v11;
}

id __67__TKApplicationViewController_initWithBundleURL_loadPage_withData___block_invoke(uint64_t a1)
{
  id v3 = +[TKApplication shared];
  id v4 = (id)[v3 loadPage:*(void *)(a1 + 32) withData:*(void *)(a1 + 40)];

  return v4;
}

- (TKApplicationViewController)initWithBundleURL:(id)a3 loadPage:(id)a4 withDataRequest:(id)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  uint64_t v10 = v22;
  id v8 = location[0];
  id v9 = v20;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __74__TKApplicationViewController_initWithBundleURL_loadPage_withDataRequest___block_invoke;
  id v16 = &unk_26485A928;
  id v17 = v20;
  id v18 = v19;
  v22 = 0;
  v22 = -[TKApplicationViewController initWithBundleURL:viewName:delegate:](v10, "initWithBundleURL:viewName:delegate:", v8, v9);
  int v11 = v22;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v11;
}

id __74__TKApplicationViewController_initWithBundleURL_loadPage_withDataRequest___block_invoke(uint64_t a1)
{
  id v3 = +[TKApplication shared];
  id v4 = (id)[v3 loadPage:*(void *)(a1 + 32) withDataRequest:*(void *)(a1 + 40)];

  return v4;
}

- (TKApplicationViewController)initWithBundleURL:(id)a3 viewName:(id)a4 delegate:(id)a5
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  v5 = v25;
  v25 = 0;
  v21.receiver = v5;
  v21.super_class = (Class)TKApplicationViewController;
  v25 = -[TKApplicationViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0);
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    objc_initWeak(&from, v25);
    id v9 = +[TKApplication shared];
    id v8 = location[0];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke;
    id v16 = &unk_26485A978;
    objc_copyWeak(&v19, &from);
    id v17 = v23;
    id v18 = v22;
    [v9 loadBundle:v8 completion:&v12];

    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);
  }
  id v7 = v25;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v7;
}

void __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[1] = a1;
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke_2;
  id v8 = &unk_26485A950;
  objc_copyWeak(v12, a1 + 6);
  id v9 = location[0];
  id v10 = a1[4];
  id v11 = a1[5];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(v12);
  objc_storeStrong(location, 0);
}

void __67__TKApplicationViewController_initWithBundleURL_viewName_delegate___block_invoke_2(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (location[0])
  {
    if (*(void *)(a1 + 32))
    {
      if (([location[0] handleApplicationControllerError] & 1) == 0)
      {
        id v8 = +[TKApplication shared];
        id v7 = (id)[*(id *)(a1 + 32) localizedDescription];
        id v6 = (id)objc_msgSend(v8, "newErrorViewController:");
        objc_msgSend(location[0], "setChildViewController:");
      }
    }
    else
    {
      id v4 = +[TKApplication shared];
      id v3 = (id)[v4 repository];
      id v1 = (id)[v3 tmlPathForName:*(void *)(a1 + 40)];
      BOOL v5 = v1 != 0;

      if (v5 || ([location[0] handleApplicationControllerError] & 1) == 0)
      {
        id v2 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        objc_msgSend(location[0], "didLoadViewController:");
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)handleApplicationControllerError
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  [(TKApplicationViewController *)self setLoadingViewController:0];
  id v3 = objc_loadWeakRetained((id *)&self->_delegate);
  [v3 applicationControllerError:self];

  return 1;
}

- (void)didLoadViewController:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(TKApplicationViewController *)v8 setChildViewController:location[0]];
  char v5 = 0;
  char v4 = 0;
  if (location[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_delegate);
    char v5 = 1;
    char v4 = objc_opt_respondsToSelector();
  }
  if (v5) {

  }
  if (v4)
  {
    id v3 = objc_loadWeakRetained((id *)&v8->_delegate);
    [v3 applicationController:v8 didLoadViewController:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  id v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)TKApplicationViewController;
  [(TKApplicationViewController *)&v6 viewDidLoad];
  id v5 = (id)[MEMORY[0x263F825C8] whiteColor];
  id v4 = (id)[(TKApplicationViewController *)v8 view];
  [v4 setBackgroundColor:v5];

  if (!v8->_loadingViewController)
  {
    id v3 = +[TKApplication shared];
    id v2 = (id)[v3 newLoadingViewController];
    -[TKApplicationViewController setLoadingViewController:](v8, "setLoadingViewController:");
  }
}

- (void)setChildViewController:(id)a3
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v36->_childViewController == location[0])
  {
    int v34 = 1;
  }
  else
  {
    if (v36->_childViewController)
    {
      [(UIViewController *)v36->_childViewController willMoveToParentViewController:0];
      uint64_t v12 = [(UIViewController *)v36->_childViewController view];
      [(UIView *)v12 removeFromSuperview];

      [(UIViewController *)v36->_childViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&v36->_childViewController, location[0]);
    if (location[0])
    {
      id v33 = (id)[(TKApplicationViewController *)v36 view];
      [(TKApplicationViewController *)v36 addChildViewController:location[0]];
      -[UIViewController willMoveToParentViewController:](v36->_loadingViewController, "willMoveToParentViewController:");
      id v32 = (id)[location[0] view];
      [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v33 bounds];
      *(double *)&long long v30 = v3;
      *((double *)&v30 + 1) = v4;
      *(double *)&long long v31 = v5;
      *((double *)&v31 + 1) = v6;
      long long v28 = v30;
      long long v29 = v31;
      objc_msgSend(v32, "setFrame:", v3, v4, v5, v6);
      id v8 = (id)[MEMORY[0x263F82438] sharedApplication];
      [v8 statusBarOrientationAnimationDuration];
      double v9 = v7 / 2.0;

      v27[1] = *(id *)&v9;
      id v10 = (void *)MEMORY[0x263F82E00];
      id v11 = (id)[(TKApplicationViewController *)v36 view];
      uint64_t v20 = MEMORY[0x263EF8330];
      int v21 = -1073741824;
      int v22 = 0;
      id v23 = __54__TKApplicationViewController_setChildViewController___block_invoke;
      v24 = &unk_26485A9A0;
      v25 = v36;
      id v26 = v33;
      v27[0] = v32;
      uint64_t v13 = MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = __54__TKApplicationViewController_setChildViewController___block_invoke_2;
      id v17 = &unk_26485A9C8;
      id v18 = location[0];
      id v19 = v36;
      [v10 transitionWithView:v11 duration:5243008 options:&v20 animations:&v13 completion:v9];

      objc_storeStrong((id *)&v19, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(v27, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      int v34 = 0;
    }
    else
    {
      int v34 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __54__TKApplicationViewController_setChildViewController___block_invoke(uint64_t a1)
{
  v17[4] = *MEMORY[0x263EF8340];
  id v1 = (id)[*(id *)(*(void *)(a1 + 32) + 1000) view];
  [v1 removeFromSuperview];

  [*(id *)(a1 + 40) insertSubview:*(void *)(a1 + 48) atIndex:0];
  double v3 = (void *)MEMORY[0x263F08938];
  id v16 = (id)[*(id *)(a1 + 48) leftAnchor];
  id v15 = (id)[*(id *)(a1 + 40) leftAnchor];
  id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v17[0] = v14;
  id v13 = (id)[*(id *)(a1 + 48) rightAnchor];
  id v12 = (id)[*(id *)(a1 + 40) rightAnchor];
  id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v17[1] = v11;
  id v10 = (id)[*(id *)(a1 + 48) topAnchor];
  id v9 = (id)[*(id *)(a1 + 40) topAnchor];
  id v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v17[2] = v8;
  id v7 = (id)[*(id *)(a1 + 48) bottomAnchor];
  id v6 = (id)[*(id *)(a1 + 40) bottomAnchor];
  id v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:");
  v17[3] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  objc_msgSend(v3, "activateConstraints:");
}

void __54__TKApplicationViewController_setChildViewController___block_invoke_2(uint64_t a1)
{
}

- (void)setLoadingViewController:(id)a3
{
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v51->_loadingViewController == location[0])
  {
    int v49 = 1;
  }
  else
  {
    id v14 = (id)[MEMORY[0x263F82438] sharedApplication];
    [v14 statusBarOrientationAnimationDuration];
    double v15 = v3 / 2.0;

    double v48 = v15;
    if (v51->_loadingViewController)
    {
      -[UIViewController willMoveToParentViewController:](v51->_loadingViewController, "willMoveToParentViewController:");
      id v12 = (void *)MEMORY[0x263F82E00];
      id v13 = (id)[(TKApplicationViewController *)v51 view];
      double v11 = v48;
      uint64_t v42 = MEMORY[0x263EF8330];
      int v43 = -1073741824;
      int v44 = 0;
      v45 = __56__TKApplicationViewController_setLoadingViewController___block_invoke;
      v46 = &unk_26485A9F0;
      v47 = v51;
      uint64_t v36 = MEMORY[0x263EF8330];
      int v37 = -1073741824;
      int v38 = 0;
      v39 = __56__TKApplicationViewController_setLoadingViewController___block_invoke_2;
      v40 = &unk_26485AA18;
      v41 = v51;
      [v12 transitionWithView:v13 duration:5243008 options:&v42 animations:&v36 completion:v11];

      objc_storeStrong((id *)&v41, 0);
      objc_storeStrong((id *)&v47, 0);
    }
    objc_storeStrong((id *)&v51->_loadingViewController, location[0]);
    if (location[0])
    {
      id v35 = (id)[(TKApplicationViewController *)v51 view];
      [(TKApplicationViewController *)v51 addChildViewController:location[0]];
      id v34 = (id)[location[0] view];
      [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v35 bounds];
      *(void *)&long long v32 = v4;
      *((void *)&v32 + 1) = v5;
      *(void *)&long long v33 = v6;
      *((void *)&v33 + 1) = v7;
      long long v30 = v32;
      long long v31 = v33;
      objc_msgSend(v34, "setFrame:", v32, v33);
      id v10 = (void *)MEMORY[0x263F82E00];
      id v8 = v35;
      double v9 = v48;
      uint64_t v23 = MEMORY[0x263EF8330];
      int v24 = -1073741824;
      int v25 = 0;
      id v26 = __56__TKApplicationViewController_setLoadingViewController___block_invoke_3;
      v27 = &unk_26485AA40;
      id v28 = v35;
      id v29 = v34;
      uint64_t v16 = MEMORY[0x263EF8330];
      int v17 = -1073741824;
      int v18 = 0;
      id v19 = __56__TKApplicationViewController_setLoadingViewController___block_invoke_4;
      uint64_t v20 = &unk_26485A9C8;
      id v21 = location[0];
      int v22 = v51;
      [v10 transitionWithView:v8 duration:5243008 options:&v23 animations:&v16 completion:v9];
      objc_storeStrong((id *)&v22, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
      int v49 = 0;
    }
    else
    {
      int v49 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __56__TKApplicationViewController_setLoadingViewController___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(*(void *)(a1 + 32) + 1000) view];
  [v1 removeFromSuperview];
}

uint64_t __56__TKApplicationViewController_setLoadingViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) removeFromParentViewController];
}

void __56__TKApplicationViewController_setLoadingViewController___block_invoke_3(uint64_t a1)
{
  v16[4] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  id v2 = (void *)MEMORY[0x263F08938];
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

uint64_t __56__TKApplicationViewController_setLoadingViewController___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
}

- (void)dismissApplicationControllerAnimated:(BOOL)a3
{
  BOOL v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 dismissApplicationController:self animated:v12];
  }
  else
  {
    id v3 = (id)[(TKApplicationViewController *)self presentingViewController];
    BOOL v8 = v3 == 0;

    if (v8)
    {
      id v4 = (id)[(TKApplicationViewController *)self navigationController];
      BOOL v7 = v4 == 0;

      if (!v7)
      {
        id v6 = (id)[(TKApplicationViewController *)self navigationController];
        id v5 = (id)[v6 popViewControllerAnimated:v12];
      }
    }
    else
    {
      [(TKApplicationViewController *)self dismissViewControllerAnimated:v12 completion:0];
    }
  }
}

+ (id)applicationViewController:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = location[0];
  while (1)
  {
    LOBYTE(v7) = 0;
    if (v8)
    {
      objc_opt_class();
      int v7 = objc_opt_isKindOfClass() ^ 1;
    }
    if ((v7 & 1) == 0) {
      break;
    }
    id v3 = (id)[v8 parentViewController];
    id v4 = v8;
    id v8 = v3;
  }
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)viewName
{
  return self->_viewName;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (UIViewController)loadingViewController
{
  return self->_loadingViewController;
}

- (TKApplicationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TKApplicationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end