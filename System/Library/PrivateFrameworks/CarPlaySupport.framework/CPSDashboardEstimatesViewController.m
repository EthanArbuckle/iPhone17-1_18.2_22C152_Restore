@interface CPSDashboardEstimatesViewController
+ (NSEdgeInsets)edgeInsets;
+ (id)createEstimatesView;
+ (id)createPlatterView;
- (CPSCardPlatterView)cardPlatterView;
- (CPSDashboardEstimatesView)estimatesView;
- (CPSDashboardEstimatesViewController)init;
- (CPSSafeAreaDelegate)safeAreaDelegate;
- (NSEdgeInsets)edgeInsets;
- (NSLayoutConstraint)platterBottomConstraint;
- (UIEdgeInsets)safeAreaInsets;
- (void)navigator:(id)a3 didEndTrip:(BOOL)a4;
- (void)setCardPlatterView:(id)a3;
- (void)setEdgeInsets:(NSEdgeInsets)a3;
- (void)setEstimatesView:(id)a3;
- (void)setPlatterBottomConstraint:(id)a3;
- (void)setSafeAreaDelegate:(id)a3;
- (void)updateTripEstimates:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CPSDashboardEstimatesViewController

- (CPSDashboardEstimatesViewController)init
{
  SEL v13 = a2;
  v14 = 0;
  v12.receiver = self;
  v12.super_class = (Class)CPSDashboardEstimatesViewController;
  v14 = [(CPSDashboardEstimatesViewController *)&v12 init];
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    p_top = (_OWORD *)&v14->_edgeInsets.top;
    [(id)objc_opt_class() edgeInsets];
    *(void *)&long long v10 = v2;
    *((void *)&v10 + 1) = v3;
    *(void *)&long long v11 = v4;
    *((void *)&v11 + 1) = v5;
    _OWORD *p_top = v10;
    p_top[1] = v11;
    id obj = (id)[(id)objc_opt_class() createPlatterView];
    objc_storeStrong((id *)&v14->_cardPlatterView, obj);
    [(CPSCardPlatterView *)v14->_cardPlatterView setHidden:1];
    objc_storeStrong(&obj, 0);
  }
  v7 = v14;
  objc_storeStrong((id *)&v14, 0);
  return v7;
}

- (void)viewDidLoad
{
  v40[4] = *MEMORY[0x263EF8340];
  v38 = self;
  SEL v37 = a2;
  v36.receiver = self;
  v36.super_class = (Class)CPSDashboardEstimatesViewController;
  [(CPSDashboardEstimatesViewController *)&v36 viewDidLoad];
  id v4 = (id)[(CPSDashboardEstimatesViewController *)v38 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(CPSCardPlatterView *)v38->_cardPlatterView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = (id)[(CPSDashboardEstimatesViewController *)v38 view];
  [v5 addSubview:v38->_cardPlatterView];

  id v8 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView bottomAnchor];
  id v7 = (id)[(CPSDashboardEstimatesViewController *)v38 view];
  id v6 = (id)[v7 bottomAnchor];
  uint64_t v2 = (NSLayoutConstraint *)(id)objc_msgSend(v8, "constraintEqualToAnchor:constant:", -v38->_edgeInsets.bottom);
  platterBottomConstraint = v38->_platterBottomConstraint;
  v38->_platterBottomConstraint = v2;

  v9 = (void *)MEMORY[0x263F08938];
  id v20 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView heightAnchor];
  id v19 = (id)[v20 constraintEqualToConstant:30.0];
  v40[0] = v19;
  id v18 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView trailingAnchor];
  id v17 = (id)[(CPSDashboardEstimatesViewController *)v38 view];
  id v16 = (id)[v17 trailingAnchor];
  id v15 = (id)objc_msgSend(v18, "constraintEqualToAnchor:constant:", -v38->_edgeInsets.right);
  v40[1] = v15;
  id v14 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView leadingAnchor];
  id v13 = (id)[(CPSDashboardEstimatesViewController *)v38 view];
  id v12 = (id)[v13 leadingAnchor];
  id v11 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:", v38->_edgeInsets.left);
  v40[2] = v11;
  v40[3] = v38->_platterBottomConstraint;
  id v10 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v40);
  objc_msgSend(v9, "activateConstraints:");

  id v35 = (id)[(id)objc_opt_class() createEstimatesView];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeStrong((id *)&v38->_estimatesView, v35);
  [(CPSCardPlatterView *)v38->_cardPlatterView addSubview:v35];
  v21 = (void *)MEMORY[0x263F08938];
  id v34 = (id)[v35 topAnchor];
  id v33 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView topAnchor];
  id v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
  v39[0] = v32;
  id v31 = (id)[v35 bottomAnchor];
  id v30 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView bottomAnchor];
  id v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
  v39[1] = v29;
  id v28 = (id)[v35 trailingAnchor];
  id v27 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView trailingAnchor];
  id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
  v39[2] = v26;
  id v25 = (id)[v35 leadingAnchor];
  id v24 = (id)[(CPSCardPlatterView *)v38->_cardPlatterView leadingAnchor];
  id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
  v39[3] = v23;
  id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
  objc_msgSend(v21, "activateConstraints:");

  objc_storeStrong(&v35, 0);
}

- (UIEdgeInsets)safeAreaInsets
{
  long long v11 = *MEMORY[0x263F1D1C0];
  long long v12 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  if (([(CPSCardPlatterView *)self->_cardPlatterView isHidden] & 1) == 0)
  {
    id v8 = (id)[(CPSDashboardEstimatesViewController *)self view];
    [v8 bounds];
    double v9 = v2;
    [(CPSCardPlatterView *)self->_cardPlatterView frame];
    *(double *)&long long v12 = v9 - v3;
  }
  double v5 = *((double *)&v11 + 1);
  double v4 = *(double *)&v11;
  double v7 = *((double *)&v12 + 1);
  double v6 = *(double *)&v12;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)viewDidLayoutSubviews
{
  id v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)CPSDashboardEstimatesViewController;
  [(CPSDashboardEstimatesViewController *)&v8 viewDidLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_safeAreaDelegate);
  double v6 = v10;
  [(CPSDashboardEstimatesViewController *)v10 safeAreaInsets];
  objc_msgSend(WeakRetained, "viewController:didUpdateSafeAreaInsets:", v6, v2, v3, v4, v5);
}

- (void)setSafeAreaDelegate:(id)a3
{
  long long v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v12->_safeAreaDelegate);
  BOOL v10 = WeakRetained == location[0];

  if (!v10)
  {
    objc_storeWeak((id *)&v12->_safeAreaDelegate, location[0]);
    id v9 = objc_loadWeakRetained((id *)&v12->_safeAreaDelegate);
    objc_super v8 = v12;
    [(CPSDashboardEstimatesViewController *)v12 safeAreaInsets];
    objc_msgSend(v9, "viewController:didUpdateSafeAreaInsets:", v8, v4, v5, v6, v7);
  }
  objc_storeStrong(location, 0);
}

- (void)updateTripEstimates:(id)a3
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v8 = [(CPSDashboardEstimatesViewController *)v24 estimatesView];
  [(CPSDashboardEstimatesView *)v8 updateTripEstimates:location[0]];

  id v9 = [(CPSDashboardEstimatesViewController *)v24 cardPlatterView];
  char v10 = [(CPSCardPlatterView *)v9 isHidden];

  if (v10)
  {
    double v3 = [(CPSDashboardEstimatesViewController *)v24 cardPlatterView];
    [(CPSCardPlatterView *)v3 setHidden:0];

    double v4 = [(CPSDashboardEstimatesViewController *)v24 platterBottomConstraint];
    [(NSLayoutConstraint *)v4 setConstant:30.0];

    id v5 = (id)[(CPSDashboardEstimatesViewController *)v24 view];
    [v5 layoutIfNeeded];

    double v6 = [(CPSDashboardEstimatesViewController *)v24 platterBottomConstraint];
    [(NSLayoutConstraint *)v6 setConstant:-v24->_edgeInsets.bottom];

    double v7 = (void *)MEMORY[0x263F1CB60];
    uint64_t v17 = MEMORY[0x263EF8330];
    int v18 = -1073741824;
    int v19 = 0;
    id v20 = __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke;
    v21 = &unk_2648A3BE0;
    id v22 = v24;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke_2;
    id v15 = &unk_2648A3B90;
    id v16 = v24;
    objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v17, &v11, 0.3, 0.0, 0.8);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong((id *)&v22, 0);
  }
  objc_storeStrong(location, 0);
}

void __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke_2(uint64_t a1)
{
  id v7 = (id)[*(id *)(a1 + 32) safeAreaDelegate];
  double v6 = *(void **)(a1 + 32);
  [v6 safeAreaInsets];
  objc_msgSend(v7, "viewController:didUpdateSafeAreaInsets:", v6, v1, v2, v3, v4);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v21 = a4;
  id v7 = [(CPSDashboardEstimatesViewController *)v23 cardPlatterView];
  char v8 = [(CPSCardPlatterView *)v7 isHidden];

  if ((v8 & 1) == 0)
  {
    double v4 = [(CPSDashboardEstimatesViewController *)v23 platterBottomConstraint];
    [(NSLayoutConstraint *)v4 setConstant:30.0];

    id v5 = (void *)MEMORY[0x263F1CB60];
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    int v18 = __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke;
    int v19 = &unk_2648A3BE0;
    id v20 = v23;
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    int v12 = __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke_2;
    int v13 = &unk_2648A3B90;
    id v14 = v23;
    objc_msgSend(v5, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v15, &v9, 0.3, 0.0, 0.8);
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong((id *)&v20, 0);
  }
  objc_storeStrong(location, 0);
}

void __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke_2(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) cardPlatterView];
  [v5 setHidden:1];

  id v8 = (id)[*(id *)(a1 + 32) safeAreaDelegate];
  id v7 = *(void **)(a1 + 32);
  [v7 safeAreaInsets];
  objc_msgSend(v8, "viewController:didUpdateSafeAreaInsets:", v7, v1, v2, v3, v4);
}

+ (id)createPlatterView
{
  v7[2] = a1;
  v7[1] = (id)a2;
  double v3 = [CPSCardPlatterView alloc];
  id v5 = (id)objc_msgSend(MEMORY[0x263F1CB98], "crsui_consoleTurnCardETATrayBackgroundMaterial");
  id v4 = (id)objc_msgSend(MEMORY[0x263F1C550], "crsui_consoleTurnCardETATrayBackgroundColor");
  v7[0] = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:](v3, "initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:", 15, v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), 5.0);

  [v7[0] setShadowWithRadius:10.0 opacity:0.25];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);

  return v6;
}

+ (NSEdgeInsets)edgeInsets
{
  double v2 = 0.0;
  double v3 = 5.0;
  double v4 = 5.0;
  double v5 = 5.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (id)createEstimatesView
{
  double v2 = [CPSDashboardEstimatesView alloc];
  double v3 = -[CPSDashboardEstimatesView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v3;
}

- (CPSCardPlatterView)cardPlatterView
{
  return self->_cardPlatterView;
}

- (void)setCardPlatterView:(id)a3
{
}

- (CPSSafeAreaDelegate)safeAreaDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safeAreaDelegate);

  return (CPSSafeAreaDelegate *)WeakRetained;
}

- (CPSDashboardEstimatesView)estimatesView
{
  return self->_estimatesView;
}

- (void)setEstimatesView:(id)a3
{
}

- (NSLayoutConstraint)platterBottomConstraint
{
  return self->_platterBottomConstraint;
}

- (void)setPlatterBottomConstraint:(id)a3
{
}

- (NSEdgeInsets)edgeInsets
{
  double left = self->_edgeInsets.left;
  double top = self->_edgeInsets.top;
  double right = self->_edgeInsets.right;
  double bottom = self->_edgeInsets.bottom;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(NSEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void).cxx_destruct
{
}

@end