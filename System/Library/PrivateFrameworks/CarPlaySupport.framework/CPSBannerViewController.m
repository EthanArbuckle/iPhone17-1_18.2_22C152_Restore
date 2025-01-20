@interface CPSBannerViewController
- (BOOL)isTouchOutsideDismissalEnabled;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (CPSBannerItem)bannerItem;
- (CPSBannerViewController)initWithBannerItem:(id)a3;
- (CPSBannerViewControllerDelegate)delegate;
- (CPSGuidanceBannerView)bannerView;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (PLPlatterView)platterView;
- (UIViewController)viewController;
- (void)_bannerTapped:(id)a3;
- (void)_handleBackGesture:(id)a3;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setBannerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)updateBannerWithBannerItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation CPSBannerViewController

- (CPSBannerViewController)initWithBannerItem:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)CPSBannerViewController;
  v10 = [(CPSBannerViewController *)&v8 init];
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bannerItem, location[0]);
    CGSizeMake_16();
    -[CPSBannerViewController setPreferredContentSize:](v10, "setPreferredContentSize:", v4, v5);
  }
  v7 = v10;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (void)_wheelChangedWithEvent:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v5 = 0;
  if ([location[0] type] == 7
    && ([location[0] subtype] == 202
     || [location[0] subtype] == 200
     || [location[0] subtype] == 201))
  {
    v3 = [(CPSBannerViewController *)v7 delegate];
    [(CPSBannerViewControllerDelegate *)v3 bannerViewController:v7 requestsDismissalWithReason:@"KnobDismissed"];

    char v5 = 1;
  }
  if ((v5 & 1) == 0)
  {
    v4.receiver = v7;
    v4.super_class = (Class)CPSBannerViewController;
    [(CPSBannerViewController *)&v4 _wheelChangedWithEvent:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  v66[8] = *MEMORY[0x263EF8340];
  v65 = self;
  SEL v64 = a2;
  v63.receiver = self;
  v63.super_class = (Class)CPSBannerViewController;
  [(CPSBannerViewController *)&v63 viewDidLoad];
  id v5 = (id)[MEMORY[0x263F5E700] platterViewWithStyle:*MEMORY[0x263F5E708]];
  -[CPSBannerViewController setPlatterView:](v65, "setPlatterView:");

  v6 = [(CPSBannerViewController *)v65 platterView];
  [(PLPlatterView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = (id)[(CPSBannerViewController *)v65 view];
  v7 = [(CPSBannerViewController *)v65 platterView];
  objc_msgSend(v8, "addSubview:");

  v9 = [CPSGuidanceBannerView alloc];
  v11 = [(CPSBannerViewController *)v65 bannerItem];
  v10 = -[CPSGuidanceBannerView initWithBannerItem:](v9, "initWithBannerItem:");
  -[CPSBannerViewController setBannerView:](v65, "setBannerView:");

  v12 = [(CPSBannerViewController *)v65 bannerView];
  [(CPSGuidanceBannerView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v14 = (id)[(CPSBannerViewController *)v65 view];
  v13 = [(CPSBannerViewController *)v65 bannerView];
  objc_msgSend(v14, "addSubview:");

  v15 = (void *)MEMORY[0x263F08938];
  v56 = [(CPSBannerViewController *)v65 platterView];
  id v55 = (id)[(PLPlatterView *)v56 leadingAnchor];
  id v54 = (id)[(CPSBannerViewController *)v65 view];
  id v53 = (id)[v54 leadingAnchor];
  id v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
  v66[0] = v52;
  v51 = [(CPSBannerViewController *)v65 platterView];
  id v50 = (id)[(PLPlatterView *)v51 trailingAnchor];
  id v49 = (id)[(CPSBannerViewController *)v65 view];
  id v48 = (id)[v49 trailingAnchor];
  id v47 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v66[1] = v47;
  v46 = [(CPSBannerViewController *)v65 platterView];
  id v45 = (id)[(PLPlatterView *)v46 topAnchor];
  id v44 = (id)[(CPSBannerViewController *)v65 view];
  id v43 = (id)[v44 topAnchor];
  id v42 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
  v66[2] = v42;
  v41 = [(CPSBannerViewController *)v65 platterView];
  id v40 = (id)[(PLPlatterView *)v41 bottomAnchor];
  id v39 = (id)[(CPSBannerViewController *)v65 view];
  id v38 = (id)[v39 bottomAnchor];
  id v37 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  v66[3] = v37;
  v36 = [(CPSBannerViewController *)v65 bannerView];
  id v35 = (id)[(CPSGuidanceBannerView *)v36 leadingAnchor];
  id v34 = (id)[(CPSBannerViewController *)v65 view];
  id v33 = (id)[v34 leadingAnchor];
  id v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
  v66[4] = v32;
  v31 = [(CPSBannerViewController *)v65 bannerView];
  id v30 = (id)[(CPSGuidanceBannerView *)v31 trailingAnchor];
  id v29 = (id)[(CPSBannerViewController *)v65 view];
  id v28 = (id)[v29 trailingAnchor];
  id v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
  v66[5] = v27;
  v26 = [(CPSBannerViewController *)v65 bannerView];
  id v25 = (id)[(CPSGuidanceBannerView *)v26 topAnchor];
  id v24 = (id)[(CPSBannerViewController *)v65 view];
  id v23 = (id)[v24 topAnchor];
  id v22 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
  v66[6] = v22;
  v21 = [(CPSBannerViewController *)v65 bannerView];
  id v20 = (id)[(CPSGuidanceBannerView *)v21 bottomAnchor];
  id v19 = (id)[(CPSBannerViewController *)v65 view];
  id v18 = (id)[v19 bottomAnchor];
  id v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v66[7] = v17;
  id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:8];
  objc_msgSend(v15, "activateConstraints:");

  id v2 = objc_alloc(MEMORY[0x263F1CA70]);
  id v62 = (id)[v2 initWithTarget:v65 action:0x1F9D2EB52uLL];
  v57 = [(CPSBannerViewController *)v65 bannerView];
  [(CPSGuidanceBannerView *)v57 addGestureRecognizer:v62];

  id v3 = objc_alloc(MEMORY[0x263F1CA70]);
  id v61 = (id)[v3 initWithTarget:v65 action:0x1F9D2EB52uLL];
  [v61 setAllowedPressTypes:&unk_26DF06BB0];
  v58 = [(CPSBannerViewController *)v65 bannerView];
  [(CPSGuidanceBannerView *)v58 addGestureRecognizer:v61];

  id v4 = objc_alloc(MEMORY[0x263F1CA70]);
  id v60 = (id)[v4 initWithTarget:v65 action:sel__handleBackGesture_];
  [v60 setAllowedPressTypes:&unk_26DF06BC8];
  v59 = [(CPSBannerViewController *)v65 bannerView];
  [(CPSGuidanceBannerView *)v59 addGestureRecognizer:v60];

  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
}

- (void)updateBannerWithBannerItem:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_bannerItem, location[0]);
  id v3 = [(CPSBannerViewController *)v5 bannerView];
  [(CPSGuidanceBannerView *)v3 updateBannerWithBannerItem:location[0]];

  objc_storeStrong(location, 0);
}

- (NSString)requesterIdentifier
{
  id v4 = [(CPSBannerViewController *)self bannerItem];
  id v3 = [(CPSBannerItem *)v4 bundleIdentifier];
  id v5 = CPSRequesterIdentifierForBundleIdentifier(v3);

  return (NSString *)v5;
}

- (NSString)requestIdentifier
{
  if (!self->_requestIdentifier)
  {
    id v6 = (id)[MEMORY[0x263F08C38] UUID];
    id v2 = (NSString *)(id)[v6 UUIDString];
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v2;
  }
  id v4 = self->_requestIdentifier;

  return v4;
}

- (UIViewController)viewController
{
  return self;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return 1;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(MEMORY[0x263F1CCB0]);
  id v10 = (id)[v3 initWithEnvironment:v12];
  [v10 setAllowsDeferral:0];
  id v9 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v12];
  [v9 _requestFocusUpdate:v10];
  v7 = [(CPSBannerViewController *)v12 delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v6 = [(CPSBannerViewController *)v12 delegate];
    id v5 = [(CPSBannerViewController *)v12 bannerItem];
    id v4 = [(CPSBannerItem *)v5 identifier];
    -[CPSBannerViewControllerDelegate bannerViewControllerDidAppearWithIdentifier:](v6, "bannerViewControllerDidAppearWithIdentifier:");
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  char v8 = [(CPSBannerViewController *)v12 delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v6 = [(CPSBannerViewController *)v12 delegate];
    id v5 = [(CPSBannerViewController *)v12 bannerItem];
    id v4 = [(CPSBannerItem *)v5 identifier];
    -[CPSBannerViewControllerDelegate bannerViewControllerDidDisappearWithIdentifier:](v6, "bannerViewControllerDidDisappearWithIdentifier:");
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  [(CPSBannerViewController *)self preferredContentSize];
  CGSizeMake_16();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_bannerTapped:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v9 = [(CPSBannerViewController *)v12 delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v8 = [(CPSBannerViewController *)v12 delegate];
    v7 = [(CPSBannerViewController *)v12 bannerItem];
    id v6 = [(CPSBannerItem *)v7 identifier];
    -[CPSBannerViewControllerDelegate bannerViewControllerTappedWithIdentifier:](v8, "bannerViewControllerTappedWithIdentifier:");
  }
  id v5 = (id)[MEMORY[0x263F3F4A0] dashboardService];
  double v4 = [(CPSBannerViewController *)v12 bannerItem];
  id v3 = [(CPSBannerItem *)v4 bundleIdentifier];
  objc_msgSend(v5, "openApplication:withOptions:completion:");

  objc_storeStrong(location, 0);
}

- (void)_handleBackGesture:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSBannerViewController *)v5 delegate];
  [(CPSBannerViewControllerDelegate *)v3 bannerViewController:v5 requestsDismissalWithReason:@"BackButton"];

  objc_storeStrong(location, 0);
}

- (CPSBannerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSBannerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CPSBannerItem)bannerItem
{
  return self->_bannerItem;
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (CPSGuidanceBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end