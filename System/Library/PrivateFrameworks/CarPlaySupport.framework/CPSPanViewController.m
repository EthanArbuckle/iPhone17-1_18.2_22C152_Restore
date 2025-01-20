@interface CPSPanViewController
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CPSPanEventDelegate)panDelegate;
- (CPSPanView)panView;
- (CPSPanViewController)initWithEnvironment:(id)a3;
- (CPSTemplateEnvironment)environment;
- (NSArray)nudgeGestureRecognizers;
- (double)sideButtonTopInset;
- (id)_linearFocusItems;
- (id)_linearFocusItemsWithPresentedMapButtons:(id)a3;
- (id)preferredFocusEnvironments;
- (void)_handleNudgeLongPress:(id)a3;
- (void)_handleNudgeTapped:(id)a3;
- (void)loadView;
- (void)panView:(id)a3 panBeganWithDirection:(int64_t)a4;
- (void)panView:(id)a3 panEndedWithDirection:(int64_t)a4;
- (void)panView:(id)a3 panWithDirection:(int64_t)a4;
- (void)setNudgeGestureRecognizers:(id)a3;
- (void)setPanDelegate:(id)a3;
- (void)setPanView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSPanViewController

- (CPSPanViewController)initWithEnvironment:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)CPSPanViewController;
  v6 = [(CPSPanViewController *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6) {
    objc_storeWeak((id *)&v9->_environment, location[0]);
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)loadView
{
  id v2 = objc_alloc(MEMORY[0x263F313B0]);
  id v3 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  -[CPSPanViewController setView:](self, "setView:");
}

- (void)viewDidLoad
{
  v29[4] = *MEMORY[0x263EF8340];
  v28 = self;
  SEL v27 = a2;
  v26.receiver = self;
  v26.super_class = (Class)CPSPanViewController;
  [(CPSPanViewController *)&v26 viewDidLoad];
  v4 = [(CPSPanViewController *)v28 environment];
  BOOL v2 = [(CPSTemplateEnvironment *)v4 rightHandDrive];
  v28->_rightHandDrive = v2;

  id v25 = (id)[(CPSPanViewController *)v28 view];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [CPSPanView alloc];
  v24 = -[CPSPanView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CPSPanView *)v24 setDelegate:v28];
  [v25 addSubview:v24];
  id v5 = v25;
  id v18 = (id)[(CPSPanView *)v24 leftAnchor];
  id v17 = (id)[v25 leftAnchor];
  id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
  v29[0] = v16;
  id v15 = (id)[(CPSPanView *)v24 topAnchor];
  id v14 = (id)[v25 topAnchor];
  id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v29[1] = v13;
  id v12 = (id)[(CPSPanView *)v24 rightAnchor];
  id v11 = (id)[v25 rightAnchor];
  id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v29[2] = v10;
  id v9 = (id)[(CPSPanView *)v24 bottomAnchor];
  id v8 = (id)[v25 bottomAnchor];
  id v7 = (id)objc_msgSend(v9, "constraintEqualToAnchor:");
  v29[3] = v7;
  id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  objc_msgSend(v5, "addConstraints:");

  [(CPSPanViewController *)v28 setPanView:v24];
  id v23 = &unk_26DF06B68;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v19 = v23;
  v20 = v28;
  id v21 = v22;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:");
  objc_storeStrong((id *)&v28->_nudgeGestureRecognizers, v22);
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&v25, 0);
}

void __35__CPSPanViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v15[1] = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[3] = a3;
  v12[2] = a4;
  v12[1] = (id)a1;
  v12[0] = [[_CPSNudgeLongPressGestureRecognizer alloc] initWithTarget:*(void *)(a1 + 32) action:sel__handleNudgeLongPress_];
  id v6 = v12[0];
  v15[0] = location[0];
  id v7 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v15);
  objc_msgSend(v6, "setAllowedPressTypes:");

  objc_msgSend(v12[0], "setDirection:", _CPPanDirectionForPressType(objc_msgSend(location[0], "unsignedIntegerValue")));
  [v12[0] setMinimumPressDuration:0.25];
  [*(id *)(a1 + 40) addObject:v12[0]];
  id v11 = [[_CPSNudgeTapGestureRecognizer alloc] initWithTarget:*(void *)(a1 + 32) action:sel__handleNudgeTapped_];
  id v8 = v11;
  id v14 = location[0];
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  -[_CPSNudgeTapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:");

  -[_CPSNudgeTapGestureRecognizer setDirection:](v11, "setDirection:", _CPPanDirectionForPressType([location[0] unsignedIntegerValue]));
  [(_CPSNudgeTapGestureRecognizer *)v11 requireGestureRecognizerToFail:v12[0]];
  [(_CPSNudgeTapGestureRecognizer *)v11 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v11];
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSPanViewController;
  [(CPSPanViewController *)&v10 viewDidAppear:a3];
  id v3 = [(CPSPanViewController *)v13 nudgeGestureRecognizers];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __38__CPSPanViewController_viewDidAppear___block_invoke;
  id v8 = &unk_2648A45C8;
  id v9 = v13;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  [(CPSPanViewController *)v13 setNeedsFocusUpdate];
  objc_storeStrong((id *)&v9, 0);
}

void __38__CPSPanViewController_viewDidAppear___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] view];
  id v3 = (id)[v4 _window];
  [v3 addGestureRecognizer:location[0]];

  objc_storeStrong(location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSPanViewController;
  [(CPSPanViewController *)&v10 viewWillDisappear:a3];
  id v3 = [(CPSPanViewController *)v13 nudgeGestureRecognizers];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __42__CPSPanViewController_viewWillDisappear___block_invoke;
  id v8 = &unk_2648A45C8;
  id v9 = v13;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  objc_storeStrong((id *)&v9, 0);
}

void __42__CPSPanViewController_viewWillDisappear___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[a1[4] view];
  id v3 = (id)[v4 _window];
  [v3 removeGestureRecognizer:location[0]];

  objc_storeStrong(location, 0);
}

- (void)_handleNudgeTapped:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSPanViewController *)v5 panDelegate];
  -[CPSPanEventDelegate panWithDirection:](v3, "panWithDirection:", [location[0] direction]);

  objc_storeStrong(location, 0);
}

- (void)_handleNudgeLongPress:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v5 = [location[0] state];
  if (v5 == 1)
  {
    id v4 = [(CPSPanViewController *)v7 panDelegate];
    -[CPSPanEventDelegate panBeganWithDirection:](v4, "panBeganWithDirection:", [location[0] direction]);
  }
  else if (v5 == 3)
  {
    id v3 = [(CPSPanViewController *)v7 panDelegate];
    -[CPSPanEventDelegate panEndedWithDirection:](v3, "panEndedWithDirection:", [location[0] direction]);
  }
  objc_storeStrong(location, 0);
}

- (void)panView:(id)a3 panBeganWithDirection:(int64_t)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v5 = [(CPSPanViewController *)v7 panDelegate];
  [(CPSPanEventDelegate *)v5 panBeganWithDirection:a4];

  objc_storeStrong(location, 0);
}

- (void)panView:(id)a3 panEndedWithDirection:(int64_t)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v5 = [(CPSPanViewController *)v7 panDelegate];
  [(CPSPanEventDelegate *)v5 panEndedWithDirection:a4];

  objc_storeStrong(location, 0);
}

- (void)panView:(id)a3 panWithDirection:(int64_t)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v5 = [(CPSPanViewController *)v7 panDelegate];
  [(CPSPanEventDelegate *)v5 panWithDirection:a4];

  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x263EF8340];
  if (self->_rightHandDrive)
  {
    int v6 = [(CPSPanViewController *)self panView];
    uint64_t v5 = [(CPSPanView *)v6 panLeftButton];
    v9[0] = v5;
    id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v4 = [(CPSPanViewController *)self panView];
    id v3 = [(CPSPanView *)v4 panUpButton];
    id v8 = v3;
    id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  }

  return v7;
}

- (id)_linearFocusItemsWithPresentedMapButtons:(id)a3
{
  v29[3] = *MEMORY[0x263EF8340];
  objc_super v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v26->_rightHandDrive)
  {
    v20 = [(CPSPanViewController *)v26 panView];
    id v19 = [(CPSPanView *)v20 panLeftButton];
    v29[0] = v19;
    id v18 = [(CPSPanViewController *)v26 panView];
    id v17 = [(CPSPanView *)v18 panUpButton];
    v29[1] = v17;
    id v16 = [(CPSPanViewController *)v26 panView];
    id v15 = [(CPSPanView *)v16 panRightButton];
    v29[2] = v15;
    id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
    objc_msgSend(v24, "addObjectsFromArray:");

    [v24 addObjectsFromArray:location[0]];
    id v23 = [(CPSPanViewController *)v26 panView];
    id v22 = [(CPSPanView *)v23 panDownButton];
    v28 = v22;
    id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    objc_msgSend(v24, "addObjectsFromArray:");
  }
  else
  {
    int v6 = [(CPSPanViewController *)v26 panView];
    uint64_t v5 = [(CPSPanView *)v6 panRightButton];
    objc_msgSend(v24, "addObject:");

    [v24 addObjectsFromArray:location[0]];
    id v13 = [(CPSPanViewController *)v26 panView];
    SEL v12 = [(CPSPanView *)v13 panDownButton];
    v27[0] = v12;
    BOOL v11 = [(CPSPanViewController *)v26 panView];
    objc_super v10 = [(CPSPanView *)v11 panLeftButton];
    v27[1] = v10;
    id v9 = [(CPSPanViewController *)v26 panView];
    id v8 = [(CPSPanView *)v9 panUpButton];
    v27[2] = v8;
    id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    objc_msgSend(v24, "addObjectsFromArray:");
  }
  id v4 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_linearFocusItems
{
  v22[4] = *MEMORY[0x263EF8340];
  if (self->_rightHandDrive)
  {
    id v18 = [(CPSPanViewController *)self panView];
    id v17 = [(CPSPanView *)v18 panLeftButton];
    v22[0] = v17;
    id v16 = [(CPSPanViewController *)self panView];
    id v15 = [(CPSPanView *)v16 panUpButton];
    v22[1] = v15;
    id v14 = [(CPSPanViewController *)self panView];
    id v13 = [(CPSPanView *)v14 panRightButton];
    v22[2] = v13;
    SEL v12 = [(CPSPanViewController *)self panView];
    BOOL v11 = [(CPSPanView *)v12 panDownButton];
    v22[3] = v11;
    id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  }
  else
  {
    objc_super v10 = [(CPSPanViewController *)self panView];
    id v9 = [(CPSPanView *)v10 panRightButton];
    v21[0] = v9;
    id v8 = [(CPSPanViewController *)self panView];
    id v7 = [(CPSPanView *)v8 panDownButton];
    v21[1] = v7;
    int v6 = [(CPSPanViewController *)self panView];
    uint64_t v5 = [(CPSPanView *)v6 panLeftButton];
    v21[2] = v5;
    id v4 = [(CPSPanViewController *)self panView];
    id v3 = [(CPSPanView *)v4 panUpButton];
    v21[3] = v3;
    id v20 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  }

  return v20;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v5 = (CPSPanButton *)(id)[location[0] previouslyFocusedItem];
  id v4 = [(CPSPanViewController *)v15 panView];
  int v6 = [(CPSPanView *)v4 panUpButton];
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  BOOL v7 = 0;
  if (v5 == v6)
  {
    id v13 = (CPSPanButton *)(id)[location[0] nextFocusedItem];
    char v12 = 1;
    BOOL v11 = [(CPSPanViewController *)v15 panView];
    char v10 = 1;
    id v9 = [(CPSPanView *)v11 panLeftButton];
    char v8 = 1;
    BOOL v7 = 0;
    if (v13 == v9) {
      BOOL v7 = [location[0] focusHeading] == 16;
    }
  }
  if (v8) {

  }
  if (v10) {
  if (v12)
  }

  BOOL v16 = !v7;
  objc_storeStrong(location, 0);
  return v16;
}

- (double)sideButtonTopInset
{
  id v4 = [(CPSPanViewController *)self panView];
  [(CPSPanView *)v4 sideButtonTopInset];
  double v5 = v2;

  return v5;
}

- (CPSTemplateEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (CPSTemplateEnvironment *)WeakRetained;
}

- (CPSPanView)panView
{
  return self->_panView;
}

- (void)setPanView:(id)a3
{
}

- (CPSPanEventDelegate)panDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panDelegate);

  return (CPSPanEventDelegate *)WeakRetained;
}

- (void)setPanDelegate:(id)a3
{
}

- (NSArray)nudgeGestureRecognizers
{
  return self->_nudgeGestureRecognizers;
}

- (void)setNudgeGestureRecognizers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end