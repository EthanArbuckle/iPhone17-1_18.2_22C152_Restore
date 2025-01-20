@interface CPSNavigationCardViewController
- (BOOL)_shouldAnimate;
- (BOOL)navigationCardHidden;
- (BOOL)passesLinkCheck;
- (CGRect)adjustedShadowConstraintsWithFrame:(CGRect)a3;
- (CPSCardPlatterView)shadowCardView;
- (CPSLayoutHelperView)layoutHelperView;
- (CPSManeuversCardView)currentManeuversCardView;
- (CPSPausedCardView)currentPausedCardView;
- (NSArray)layoutHelperVerticalConstraints;
- (NSLayoutConstraint)containerViewHeightConstraint;
- (NSLayoutConstraint)containerViewTopConstraint;
- (NSLayoutConstraint)sizingViewBottomConstraint;
- (NSMutableSet)navigationCardHiddenRequesters;
- (NSString)navigatingBundleIdentifier;
- (UIColor)guidanceBackgroundColor;
- (UIView)containerView;
- (id)createShadowViewWithFrame:(CGRect)a3;
- (void)_showPausedViewForReason:(unint64_t)a3 description:(id)a4 pauseCardColor:(id)a5;
- (void)_transitionFromViews:(id)a3 inView:(id)a4;
- (void)_updateCardBackgroundColors;
- (void)_updateHelperConstraints;
- (void)_updateLinkedCheck;
- (void)_updateNavigationCardHidden;
- (void)_updateSizingViewConstraintsForView:(id)a3;
- (void)availableHeightChangedTo:(double)a3;
- (void)navigator:(id)a3 didEndTrip:(BOOL)a4;
- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6;
- (void)setContainerView:(id)a3;
- (void)setContainerViewHeightConstraint:(id)a3;
- (void)setContainerViewTopConstraint:(id)a3;
- (void)setCurrentManeuversCardView:(id)a3;
- (void)setCurrentPausedCardView:(id)a3;
- (void)setGuidanceBackgroundColor:(id)a3;
- (void)setLayoutHelperVerticalConstraints:(id)a3;
- (void)setNavigatingBundleIdentifier:(id)a3;
- (void)setNavigationCardHidden:(BOOL)a3;
- (void)setNavigationCardHidden:(BOOL)a3 forRequester:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setNavigationCardHiddenRequesters:(id)a3;
- (void)setPassesLinkCheck:(BOOL)a3;
- (void)setShadowCardView:(id)a3;
- (void)setSizingViewBottomConstraint:(id)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
- (void)updateTripEstimates:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CPSNavigationCardViewController

- (void)_updateHelperConstraints
{
  v50[2] = *MEMORY[0x263EF8340];
  v47 = self;
  v46[1] = a2;
  v45 = [(CPSNavigationCardViewController *)self layoutHelperVerticalConstraints];

  if (v45)
  {
    v43 = (void *)MEMORY[0x263F08938];
    v44 = [(CPSNavigationCardViewController *)v47 layoutHelperVerticalConstraints];
    objc_msgSend(v43, "deactivateConstraints:");
  }
  v46[0] = 0;
  v42 = [(CPSNavigationCardViewController *)v47 currentManeuversCardView];

  if (v42)
  {
    v41 = [(CPSNavigationCardViewController *)v47 layoutHelperView];
    id v40 = (id)[(CPSLayoutHelperView *)v41 topAnchor];
    v39 = [(CPSNavigationCardViewController *)v47 currentManeuversCardView];
    v38 = [(CPSManeuversCardView *)v39 cardPlatterView];
    id v37 = (id)[(CPSCardPlatterView *)v38 topAnchor];
    id v36 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v50[0] = v36;
    v35 = [(CPSNavigationCardViewController *)v47 layoutHelperView];
    id v34 = (id)[(CPSLayoutHelperView *)v35 bottomAnchor];
    v33 = [(CPSNavigationCardViewController *)v47 currentManeuversCardView];
    v32 = [(CPSManeuversCardView *)v33 cardPlatterView];
    id v31 = (id)[(CPSCardPlatterView *)v32 bottomAnchor];
    id v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
    v50[1] = v30;
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
    v3 = (void *)v46[0];
    v46[0] = v2;
  }
  else
  {
    v29 = [(CPSNavigationCardViewController *)v47 currentPausedCardView];

    if (v29)
    {
      v28 = [(CPSNavigationCardViewController *)v47 layoutHelperView];
      id v27 = (id)[(CPSLayoutHelperView *)v28 topAnchor];
      v26 = [(CPSNavigationCardViewController *)v47 currentPausedCardView];
      v25 = [(CPSPausedCardView *)v26 cardPlatterView];
      id v24 = (id)[(CPSCardPlatterView *)v25 topAnchor];
      id v23 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
      v49[0] = v23;
      v22 = [(CPSNavigationCardViewController *)v47 layoutHelperView];
      id v21 = (id)[(CPSLayoutHelperView *)v22 bottomAnchor];
      v20 = [(CPSNavigationCardViewController *)v47 currentPausedCardView];
      v19 = [(CPSPausedCardView *)v20 cardPlatterView];
      id v18 = (id)[(CPSCardPlatterView *)v19 bottomAnchor];
      id v17 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
      v49[1] = v17;
      id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
      v5 = (void *)v46[0];
      v46[0] = v4;
    }
    else
    {
      v16 = [(CPSNavigationCardViewController *)v47 layoutHelperView];
      id v15 = (id)[(CPSLayoutHelperView *)v16 topAnchor];
      id v14 = (id)[(CPSNavigationCardViewController *)v47 view];
      id v13 = (id)[v14 topAnchor];
      id v12 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
      v48[0] = v12;
      v11 = [(CPSNavigationCardViewController *)v47 layoutHelperView];
      id v10 = (id)[(CPSLayoutHelperView *)v11 heightAnchor];
      id v9 = (id)[v10 constraintEqualToConstant:0.0];
      v48[1] = v9;
      id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
      v7 = (void *)v46[0];
      v46[0] = v6;
    }
  }
  objc_msgSend(MEMORY[0x263F08938], "activateConstraints:", v46[0], v46);
  [(CPSNavigationCardViewController *)v47 setLayoutHelperVerticalConstraints:v46[0]];
  objc_storeStrong(location, 0);
}

- (void)viewWillLayoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSNavigationCardViewController;
  [(CPSNavigationCardViewController *)&v2 viewWillLayoutSubviews];
}

- (void)viewDidLoad
{
  v31[6] = *MEMORY[0x263EF8340];
  id v30 = self;
  SEL v29 = a2;
  v28.receiver = self;
  v28.super_class = (Class)CPSNavigationCardViewController;
  [(CPSNavigationCardViewController *)&v28 viewDidLoad];
  id v27 = (id)[(CPSNavigationCardViewController *)v30 view];
  [v27 setUserInteractionEnabled:0];
  id v26 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v26 setClipsToBounds:1];
  id v3 = (id)[(CPSNavigationCardViewController *)v30 view];
  [v3 addSubview:v26];

  [(CPSNavigationCardViewController *)v30 setContainerView:v26];
  v25 = objc_alloc_init(CPSLayoutHelperView);
  [(CPSLayoutHelperView *)v25 setClipsToBounds:1];
  id v4 = (id)[(CPSNavigationCardViewController *)v30 view];
  [v4 addSubview:v25];

  objc_storeStrong((id *)&v30->_layoutHelperView, v25);
  LODWORD(v2) = 1112014848;
  [(CPSLayoutHelperView *)v25 setContentHuggingPriority:1 forAxis:v2];
  id v7 = (id)[v26 topAnchor];
  id v6 = (id)[v27 topAnchor];
  id v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:");
  -[CPSNavigationCardViewController setContainerViewTopConstraint:](v30, "setContainerViewTopConstraint:");

  id v9 = (id)[v26 heightAnchor];
  id v8 = (id)[v9 constraintEqualToConstant:0.0];
  -[CPSNavigationCardViewController setContainerViewHeightConstraint:](v30, "setContainerViewHeightConstraint:");

  id v10 = (void *)MEMORY[0x263F08938];
  id v24 = [(CPSNavigationCardViewController *)v30 containerViewTopConstraint];
  v31[0] = v24;
  id v23 = [(CPSNavigationCardViewController *)v30 containerViewHeightConstraint];
  v31[1] = v23;
  id v22 = (id)[v26 leftAnchor];
  id v21 = (id)[v27 leftAnchor];
  id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  v31[2] = v20;
  id v19 = (id)[v26 rightAnchor];
  id v18 = (id)[v27 rightAnchor];
  id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
  v31[3] = v17;
  id v16 = (id)[(CPSLayoutHelperView *)v25 leadingAnchor];
  id v15 = (id)[v27 leadingAnchor];
  id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v31[4] = v14;
  id v13 = (id)[(CPSLayoutHelperView *)v25 widthAnchor];
  id v12 = (id)[v13 constraintEqualToConstant:1.0];
  v31[5] = v12;
  id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:6];
  objc_msgSend(v10, "activateConstraints:");

  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
}

- (void)availableHeightChangedTo:(double)a3
{
  id v26 = [(CPSNavigationCardViewController *)self currentManeuversCardView];

  if (v26)
  {
    id v24 = [(CPSNavigationCardViewController *)self currentManeuversCardView];
    id v23 = [(CPSManeuversCardView *)v24 cardPlatterView];
    [(CPSCardPlatterView *)v23 frame];
    BOOL v25 = v3 > a3;

    if (v25)
    {
      id v19 = [(CPSNavigationCardViewController *)self currentManeuversCardView];
      id v18 = [(CPSNavigationCardViewController *)self containerView];
      [(UIView *)v18 bounds];
      CGSizeMake_8();
      BOOL v20 = -[CPSManeuversCardView canFitSize:](v19, "canFitSize:", v4, v5);

      if (v20)
      {
        id v16 = [(CPSNavigationCardViewController *)self currentManeuversCardView];
        [(CPSManeuversCardView *)v16 invalidate];

        id v17 = [(CPSNavigationCardViewController *)self containerViewHeightConstraint];
        [(NSLayoutConstraint *)v17 setConstant:a3];

        [(CPSNavigationCardViewController *)self setNavigationCardHidden:0 forRequester:@"Sizing" animated:1 completion:0];
      }
      else
      {
        [(CPSNavigationCardViewController *)self setNavigationCardHidden:1 forRequester:@"Sizing" animated:1 completion:0];
      }
    }
    else
    {
      id v21 = [(CPSNavigationCardViewController *)self currentManeuversCardView];
      [(CPSManeuversCardView *)v21 invalidate];

      id v22 = [(CPSNavigationCardViewController *)self containerViewHeightConstraint];
      [(NSLayoutConstraint *)v22 setConstant:a3];

      [(CPSNavigationCardViewController *)self setNavigationCardHidden:0 forRequester:@"Sizing" animated:1 completion:0];
    }
  }
  else
  {
    id v15 = [(CPSNavigationCardViewController *)self currentPausedCardView];

    if (v15)
    {
      id v13 = [(CPSNavigationCardViewController *)self currentPausedCardView];
      id v12 = [(CPSPausedCardView *)v13 cardPlatterView];
      [(CPSCardPlatterView *)v12 frame];
      BOOL v14 = v6 > a3;

      if (v14)
      {
        [(CPSNavigationCardViewController *)self setNavigationCardHidden:1 forRequester:@"Sizing" animated:1 completion:0];
        id v10 = [(CPSNavigationCardViewController *)self containerViewTopConstraint];
        id v9 = [(CPSNavigationCardViewController *)self currentPausedCardView];
        [(CPSPausedCardView *)v9 frame];
        [(NSLayoutConstraint *)v10 setConstant:-(v7 + 8.0 + 44.0)];
      }
      else
      {
        id v11 = [(CPSNavigationCardViewController *)self containerViewHeightConstraint];
        [(NSLayoutConstraint *)v11 setConstant:a3];

        [(CPSNavigationCardViewController *)self setNavigationCardHidden:0 forRequester:@"Sizing" animated:1 completion:0];
      }
    }
    else
    {
      id v8 = [(CPSNavigationCardViewController *)self containerViewHeightConstraint];
      [(NSLayoutConstraint *)v8 setConstant:a3];

      [(CPSNavigationCardViewController *)self setNavigationCardHidden:0 forRequester:@"Sizing" animated:1 completion:0];
    }
  }
}

- (void)setNavigationCardHidden:(BOOL)a3 forRequester:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v30 = self;
  SEL v29 = a2;
  BOOL v28 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v26 = a5;
  id v25 = 0;
  objc_storeStrong(&v25, a6);
  if (v28)
  {
    if (!v30->_navigationCardHiddenRequesters)
    {
      double v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      navigationCardHiddenRequesters = v30->_navigationCardHiddenRequesters;
      v30->_navigationCardHiddenRequesters = v6;
    }
    id v10 = [(CPSNavigationCardViewController *)v30 navigationCardHiddenRequesters];
    [(NSMutableSet *)v10 addObject:location];
  }
  else
  {
    id v9 = [(CPSNavigationCardViewController *)v30 navigationCardHiddenRequesters];
    [(NSMutableSet *)v9 removeObject:location];
  }
  [(CPSNavigationCardViewController *)v30 _updateNavigationCardHidden];
  if (v26)
  {
    id v8 = (void *)MEMORY[0x263F1CB60];
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    id v22 = __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke;
    id v23 = &unk_2648A3BE0;
    id v24 = v30;
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke_2;
    id v17 = &unk_2648A4F08;
    id v18 = v25;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 512, &v19, &v13, 0.4, 0.0, 10.0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v24, 0);
  }
  else if (v25)
  {
    (*((void (**)(void))v25 + 2))();
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&location, 0);
}

void __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke(uint64_t a1)
{
  id v14 = (id)[*(id *)(a1 + 32) view];
  [v14 layoutIfNeeded];

  id v16 = (id)[*(id *)(a1 + 32) currentManeuversCardView];
  char v29 = 0;
  char v27 = 0;
  char v25 = 0;
  char v23 = 0;
  char v21 = 0;
  if (v16)
  {
    id v30 = (id)[*(id *)(a1 + 32) currentManeuversCardView];
    char v29 = 1;
    id v28 = (id)[v30 cardPlatterView];
    char v27 = 1;
    [v28 frame];
    *(void *)&long long v31 = v1;
    *((void *)&v31 + 1) = v2;
    *(void *)&long long v32 = v3;
    *((void *)&v32 + 1) = v4;
  }
  else
  {
    id v26 = (id)[*(id *)(a1 + 32) currentPausedCardView];
    char v25 = 1;
    if (v26)
    {
      id v24 = (id)[*(id *)(a1 + 32) currentPausedCardView];
      char v23 = 1;
      id v22 = (id)[v24 cardPlatterView];
      char v21 = 1;
      [v22 frame];
      *(void *)&long long v31 = v5;
      *((void *)&v31 + 1) = v6;
      *(void *)&long long v32 = v7;
      *((void *)&v32 + 1) = v8;
    }
    else
    {
      long long v31 = *MEMORY[0x263F001A8];
      long long v32 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    }
  }
  if (v21) {

  }
  if (v23) {
  if (v25)
  }

  if (v27) {
  if (v29)
  }

  objc_msgSend(*(id *)(a1 + 32), "adjustedShadowConstraintsWithFrame:", v31, v32);
  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  id v13 = (id)[*(id *)(a1 + 32) shadowCardView];
  objc_msgSend(v13, "setFrame:", v17, v18, v19, v20);
}

uint64_t __92__CPSNavigationCardViewController_setNavigationCardHidden_forRequester_animated_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_updateNavigationCardHidden
{
  double v11 = [(CPSNavigationCardViewController *)self navigationCardHiddenRequesters];
  BOOL v12 = [(NSMutableSet *)v11 count] == 0;

  if (v12)
  {
    if ([(CPSNavigationCardViewController *)self navigationCardHidden])
    {
      [(CPSNavigationCardViewController *)self setNavigationCardHidden:0];
      uint64_t v4 = [(CPSNavigationCardViewController *)self containerViewTopConstraint];
      [(NSLayoutConstraint *)v4 setConstant:0.0];
    }
  }
  else if (![(CPSNavigationCardViewController *)self navigationCardHidden])
  {
    [(CPSNavigationCardViewController *)self setNavigationCardHidden:1];
    double v10 = [(CPSNavigationCardViewController *)self currentManeuversCardView];

    if (v10)
    {
      double v9 = [(CPSNavigationCardViewController *)self containerViewTopConstraint];
      uint64_t v8 = [(CPSNavigationCardViewController *)self currentManeuversCardView];
      [(CPSManeuversCardView *)v8 frame];
      [(NSLayoutConstraint *)v9 setConstant:-(v2 + 8.0)];
    }
    else
    {
      uint64_t v7 = [(CPSNavigationCardViewController *)self currentPausedCardView];

      if (v7)
      {
        uint64_t v6 = [(CPSNavigationCardViewController *)self containerViewTopConstraint];
        uint64_t v5 = [(CPSNavigationCardViewController *)self currentPausedCardView];
        [(CPSPausedCardView *)v5 frame];
        [(NSLayoutConstraint *)v6 setConstant:-(v3 + 8.0)];
      }
    }
  }
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  v33[2] = *MEMORY[0x263EF8340];
  long long v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  char v29 = 0;
  double v19 = [(CPSNavigationCardViewController *)v32 currentManeuversCardView];
  char v27 = 0;
  char v25 = 0;
  char v20 = 0;
  if (v19)
  {
    id v28 = [(CPSNavigationCardViewController *)v32 currentManeuversCardView];
    char v27 = 1;
    id v26 = [(CPSManeuversCardView *)v28 maneuvers];
    char v25 = 1;
    char v20 = BSEqualObjects();
  }
  if (v25) {

  }
  if (v27) {
  char v29 = v20 & 1;
  }
  if (v20)
  {
    double v17 = [(CPSNavigationCardViewController *)v32 currentManeuversCardView];
    [(CPSManeuversCardView *)v17 showManeuvers:location[0] usingDisplayStyles:MEMORY[0x263EFFA68]];

    int v24 = 1;
  }
  else
  {
    id v23 = [(CPSNavigationCardViewController *)v32 containerView];
    id v16 = [(CPSNavigationCardViewController *)v32 containerView];
    int v15 = [(UIView *)v16 subviews];
    id v22 = (id)[(NSArray *)v15 copy];

    char v21 = 0;
    -[CPSNavigationCardViewController setCurrentManeuversCardView:](v32, "setCurrentManeuversCardView:");
    [(CPSNavigationCardViewController *)v32 setCurrentPausedCardView:0];
    if ([location[0] count])
    {
      uint64_t v4 = [CPSManeuversCardView alloc];
      uint64_t v5 = [(CPSManeuversCardView *)v4 initWithManeuvers:location[0]];
      uint64_t v6 = v21;
      char v21 = v5;

      [v23 addSubview:v21];
      [(CPSNavigationCardViewController *)v32 setCurrentManeuversCardView:v21];
      [(CPSNavigationCardViewController *)v32 _updateCardBackgroundColors];
      uint64_t v7 = (void *)MEMORY[0x263F08938];
      id v14 = (id)[(CPSManeuversCardView *)v21 topAnchor];
      id v13 = (id)[v23 topAnchor];
      id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
      v33[0] = v12;
      id v11 = (id)[(CPSManeuversCardView *)v21 bottomAnchor];
      id v10 = (id)[v23 bottomAnchor];
      id v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
      v33[1] = v9;
      id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
      objc_msgSend(v7, "activateConstraints:");
    }
    [(CPSNavigationCardViewController *)v32 _updateHelperConstraints];
    [(CPSNavigationCardViewController *)v32 _transitionFromViews:v22 inView:v21];
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    int v24 = 0;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  uint64_t v6 = [(CPSNavigationCardViewController *)v9 currentManeuversCardView];

  if (v6)
  {
    uint64_t v4 = [(CPSNavigationCardViewController *)v9 currentManeuversCardView];
    [(CPSManeuversCardView *)v4 updateEstimates:location[0] forManeuver:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v11 = a4;
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  id v9 = 0;
  objc_storeStrong(&v9, a6);
  [(CPSNavigationCardViewController *)v13 _showPausedViewForReason:v11 description:v10 pauseCardColor:v9];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_showPausedViewForReason:(unint64_t)a3 description:(id)a4 pauseCardColor:(id)a5
{
  v27[2] = *MEMORY[0x263EF8340];
  id v26 = self;
  SEL v25 = a2;
  unint64_t v24 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v8 = [(CPSNavigationCardViewController *)v26 containerView];
  id v7 = [(UIView *)v8 subviews];
  id v21 = (id)[(NSArray *)v7 copy];

  [(CPSNavigationCardViewController *)v26 setCurrentManeuversCardView:0];
  [(CPSNavigationCardViewController *)v26 setCurrentPausedCardView:0];
  uint64_t v5 = [CPSPausedCardView alloc];
  char v20 = [(CPSPausedCardView *)v5 initWithReason:v24 title:location backgroundColor:v22];
  [(CPSNavigationCardViewController *)v26 setCurrentPausedCardView:v20];
  [(CPSNavigationCardViewController *)v26 _updateCardBackgroundColors];
  id v9 = [(CPSNavigationCardViewController *)v26 containerView];
  [(UIView *)v9 addSubview:v20];

  id v10 = (void *)MEMORY[0x263F08938];
  id v19 = (id)[(CPSPausedCardView *)v20 topAnchor];
  double v18 = [(CPSNavigationCardViewController *)v26 containerView];
  double v17 = [(UIView *)v18 topAnchor];
  id v16 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
  v27[0] = v16;
  id v15 = (id)[(CPSPausedCardView *)v20 bottomAnchor];
  id v14 = [(CPSNavigationCardViewController *)v26 containerView];
  id v13 = [(UIView *)v14 bottomAnchor];
  id v12 = (id)objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:");
  v27[1] = v12;
  id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  objc_msgSend(v10, "activateConstraints:");

  [(CPSNavigationCardViewController *)v26 _updateHelperConstraints];
  [(CPSNavigationCardViewController *)v26 _transitionFromViews:v21 inView:v20];
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4
{
  v115[2] = *MEMORY[0x263EF8340];
  v113 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v111 = 0;
  objc_storeStrong(&v111, a4);
  if ([location[0] count])
  {
    BOOL v110 = v111 == 0;
    v72 = [(CPSNavigationCardViewController *)v113 shadowCardView];
    [(CPSCardPlatterView *)v72 removeFromSuperview];

    id v73 = location[0];
    uint64_t v103 = MEMORY[0x263EF8330];
    int v104 = -1073741824;
    int v105 = 0;
    v106 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke;
    v107 = &unk_2648A4F80;
    v108 = v113;
    BOOL v109 = v110;
    [v73 enumerateObjectsUsingBlock:&v103];
    if (v111)
    {
      id v58 = (id)[v111 leadingAnchor];
      v57 = [(CPSNavigationCardViewController *)v113 containerView];
      v56 = [(UIView *)v57 leadingAnchor];
      v55 = [(CPSNavigationCardViewController *)v113 containerView];
      [(UIView *)v55 frame];
      v101[1] = v4;
      v101[2] = v5;
      v101[3] = v6;
      v101[4] = v7;
      id v102 = (id)[v58 constraintEqualToAnchor:v56 constant:*(double *)&v6 + 8.0];

      id v62 = (id)[v111 trailingAnchor];
      v61 = [(CPSNavigationCardViewController *)v113 containerView];
      v60 = [(UIView *)v61 trailingAnchor];
      v59 = [(CPSNavigationCardViewController *)v113 containerView];
      [(UIView *)v59 frame];
      uint64_t v97 = v8;
      uint64_t v98 = v9;
      double v99 = v10;
      uint64_t v100 = v11;
      v101[0] = (id)[v62 constraintEqualToAnchor:v60 constant:v10 + 8.0];

      v63 = (void *)MEMORY[0x263F08938];
      v115[0] = v102;
      v115[1] = v101[0];
      id v64 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:2];
      objc_msgSend(v63, "activateConstraints:");

      id v65 = (id)[(CPSNavigationCardViewController *)v113 view];
      [v65 layoutIfNeeded];

      [v111 layoutIfNeeded];
      objc_msgSend(v102, "setConstant:");
      [v101[0] setConstant:0.0];
      v66 = v113;
      id v67 = (id)[v111 cardPlatterView];
      [v67 frame];
      v94[1] = v12;
      v94[2] = v13;
      v94[3] = v14;
      v94[4] = v15;
      -[CPSNavigationCardViewController adjustedShadowConstraintsWithFrame:](v66, "adjustedShadowConstraintsWithFrame:", *(double *)&v12, *(double *)&v13, *(double *)&v14, *(double *)&v15);
      *(void *)&long long v95 = v16;
      *((void *)&v95 + 1) = v17;
      *(void *)&long long v96 = v18;
      *((void *)&v96 + 1) = v19;

      id v68 = -[CPSNavigationCardViewController createShadowViewWithFrame:](v113, "createShadowViewWithFrame:", v95, v96);
      -[CPSNavigationCardViewController setShadowCardView:](v113, "setShadowCardView:");

      id v71 = (id)[(CPSNavigationCardViewController *)v113 view];
      v70 = [(CPSNavigationCardViewController *)v113 shadowCardView];
      v69 = [(CPSNavigationCardViewController *)v113 containerView];
      objc_msgSend(v71, "insertSubview:belowSubview:", v70);

      if ([(CPSNavigationCardViewController *)v113 _shouldAnimate])
      {
        v54 = (void *)MEMORY[0x263F1CB60];
        uint64_t v88 = MEMORY[0x263EF8330];
        int v89 = -1073741824;
        int v90 = 0;
        v91 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_4;
        v92 = &unk_2648A3990;
        v93 = v113;
        v94[0] = v111;
        [v54 animateWithDuration:0 delay:&v88 options:&__block_literal_global_8 animations:0.4 completion:0.0];
        objc_storeStrong(v94, 0);
        objc_storeStrong((id *)&v93, 0);
      }
      else
      {
        id v53 = (id)[(CPSNavigationCardViewController *)v113 view];
        [v53 layoutIfNeeded];

        [v111 layoutIfNeeded];
      }
      objc_storeStrong(v101, 0);
      objc_storeStrong(&v102, 0);
    }
    objc_storeStrong((id *)&v108, 0);
  }
  else if (v111)
  {
    long long v32 = (void *)MEMORY[0x263F08938];
    id v41 = (id)[v111 leadingAnchor];
    id v40 = [(CPSNavigationCardViewController *)v113 containerView];
    v39 = [(UIView *)v40 leadingAnchor];
    id v38 = (id)objc_msgSend(v41, "constraintEqualToAnchor:constant:");
    v114[0] = v38;
    id v37 = (id)[v111 trailingAnchor];
    id v36 = [(CPSNavigationCardViewController *)v113 containerView];
    v35 = [(UIView *)v36 trailingAnchor];
    id v34 = (id)objc_msgSend(v37, "constraintEqualToAnchor:constant:", 0.0);
    v114[1] = v34;
    id v33 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:2];
    objc_msgSend(v32, "activateConstraints:");

    v43 = [(CPSNavigationCardViewController *)v113 containerViewTopConstraint];
    v42 = [(CPSNavigationCardViewController *)v113 containerView];
    [(UIView *)v42 frame];
    uint64_t v84 = v20;
    uint64_t v85 = v21;
    uint64_t v86 = v22;
    double v87 = v23;
    [(NSLayoutConstraint *)v43 setConstant:-v23];

    v44 = v113;
    id v45 = (id)[v111 cardPlatterView];
    [v45 frame];
    v81[1] = v24;
    v81[2] = v25;
    v81[3] = v26;
    v81[4] = v27;
    -[CPSNavigationCardViewController adjustedShadowConstraintsWithFrame:](v44, "adjustedShadowConstraintsWithFrame:", *(double *)&v24, *(double *)&v25, *(double *)&v26, *(double *)&v27);
    *(void *)&long long v82 = v28;
    *((void *)&v82 + 1) = v29;
    *(void *)&long long v83 = v30;
    *((void *)&v83 + 1) = v31;

    id v46 = -[CPSNavigationCardViewController createShadowViewWithFrame:](v113, "createShadowViewWithFrame:", v82, v83);
    -[CPSNavigationCardViewController setShadowCardView:](v113, "setShadowCardView:");

    id v47 = (id)[(CPSNavigationCardViewController *)v113 view];
    [v47 layoutIfNeeded];

    v48 = [(CPSNavigationCardViewController *)v113 containerViewTopConstraint];
    [(NSLayoutConstraint *)v48 setConstant:0.0];

    id v51 = (id)[(CPSNavigationCardViewController *)v113 view];
    v50 = [(CPSNavigationCardViewController *)v113 shadowCardView];
    v49 = [(CPSNavigationCardViewController *)v113 containerView];
    objc_msgSend(v51, "insertSubview:belowSubview:", v50);

    v52 = (void *)MEMORY[0x263F1CB60];
    uint64_t v75 = MEMORY[0x263EF8330];
    int v76 = -1073741824;
    int v77 = 0;
    v78 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_6;
    v79 = &unk_2648A3990;
    v80 = v113;
    v81[0] = v111;
    objc_msgSend(v52, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v75, &__block_literal_global_82, 0.35, 0.0, 0.8);
    objc_storeStrong(v81, 0);
    objc_storeStrong((id *)&v80, 0);
  }
  objc_storeStrong(&v111, 0);
  objc_storeStrong(location, 0);
}

void __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v60[3] = a3;
  v60[2] = a4;
  v60[1] = (id)a1;
  v60[0] = (id)[location[0] snapshotViewAfterScreenUpdates:0];
  id v29 = (id)[*(id *)(a1 + 32) containerView];
  [v29 addSubview:v60[0]];

  [location[0] frame];
  double v56 = v4;
  double v57 = v5;
  double v58 = v6;
  double v59 = v7;
  objc_msgSend(v60[0], "setFrame:", v4, v5, v6, v7);
  [v60[0] frame];
  *(void *)&long long v54 = v8;
  *((void *)&v54 + 1) = v9;
  *(void *)&long long v55 = v10;
  *((void *)&v55 + 1) = v11;
  id v53 = 0;
  if ([location[0] conformsToProtocol:&unk_26DF1A740])
  {
    id v23 = (id)[location[0] cardPlatterView];
    [v23 frame];
    double v49 = v12;
    double v50 = v13;
    double v51 = v14;
    double v52 = v15;

    long long v47 = 0u;
    long long v48 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "adjustedShadowConstraintsWithFrame:", v49, v50, v51, v52);
    *(double *)&long long v47 = v16;
    *((double *)&v47 + 1) = v17;
    *(double *)&long long v48 = v18;
    *((double *)&v48 + 1) = v19;
    id v20 = (id)objc_msgSend(*(id *)(a1 + 32), "createShadowViewWithFrame:", v16, v17, v18, v19);
    id v21 = v53;
    id v53 = v20;

    [v53 setShadowWithRadius:20.0 opacity:0.18];
    id v25 = (id)[*(id *)(a1 + 32) view];
    id v24 = (id)[*(id *)(a1 + 32) containerView];
    objc_msgSend(v25, "insertSubview:belowSubview:", v53);
  }
  [location[0] removeFromSuperview];
  if (*(unsigned char *)(a1 + 40)) {
    *((double *)&v54 + 1) = *((double *)&v54 + 1) - *((double *)&v55 + 1) - 8.0;
  }
  else {
    *(double *)&long long v54 = *(double *)&v54 - *(double *)&v55 - 8.0;
  }
  if ([*(id *)(a1 + 32) _shouldAnimate])
  {
    uint64_t v22 = (void *)MEMORY[0x263F1CB60];
    uint64_t v37 = MEMORY[0x263EF8330];
    int v38 = -1073741824;
    int v39 = 0;
    id v40 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_2;
    id v41 = &unk_2648A4F30;
    id v42 = v60[0];
    long long v45 = v54;
    long long v46 = v55;
    id v43 = v53;
    id v44 = *(id *)(a1 + 32);
    uint64_t v30 = MEMORY[0x263EF8330];
    int v31 = -1073741824;
    int v32 = 0;
    id v33 = __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_3;
    id v34 = &unk_2648A4F58;
    id v35 = v60[0];
    id v36 = v53;
    [v22 animateWithDuration:&v37 animations:&v30 completion:0.35];
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v42, 0);
  }
  else
  {
    [v60[0] removeFromSuperview];
    [v53 removeFromSuperview];
  }
  objc_storeStrong(&v53, 0);
  objc_storeStrong(v60, 0);
  objc_storeStrong(location, 0);
}

uint64_t __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v6 = *(void **)(a1 + 40);
  id v7 = (id)[*(id *)(a1 + 48) containerViewTopConstraint];
  [v7 constant];
  [*(id *)(a1 + 40) frame];
  [*(id *)(a1 + 40) frame];
  CGRectMake_3();
  objc_msgSend(v6, "setFrame:", v1, v2, v3, v4);

  return [*(id *)(a1 + 40) setShadowWithRadius:20.0 opacity:0.0];
}

uint64_t __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 40) removeFromSuperview];
}

void __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_4(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];

  [*(id *)(a1 + 40) layoutIfNeeded];
  id v3 = (id)[*(id *)(a1 + 32) shadowCardView];
  [v3 setShadowWithRadius:20.0 opacity:0.18];
}

void __63__CPSNavigationCardViewController__transitionFromViews_inView___block_invoke_6(uint64_t a1)
{
  id v9 = (id)[*(id *)(a1 + 32) view];
  [v9 layoutIfNeeded];

  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = (id)[*(id *)(a1 + 40) cardPlatterView];
  [v11 frame];
  objc_msgSend(v10, "adjustedShadowConstraintsWithFrame:", v1, v2, v3, v4);
  double v15 = v5;
  double v16 = v6;
  double v17 = v7;
  double v18 = v8;

  id v12 = (id)[*(id *)(a1 + 32) shadowCardView];
  objc_msgSend(v12, "setFrame:", v15, v16, v17, v18);

  id v14 = (id)[*(id *)(a1 + 32) shadowCardView];
  [v14 setShadowWithRadius:20.0 opacity:0.18];
}

- (CGRect)adjustedShadowConstraintsWithFrame:(CGRect)a3
{
  id v11 = [(CPSNavigationCardViewController *)self containerViewTopConstraint];
  [(NSLayoutConstraint *)v11 constant];
  CGRectMake_3();
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;

  double v7 = v12;
  double v8 = v13;
  double v9 = v14;
  double v10 = v15;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)createShadowViewWithFrame:(CGRect)a3
{
  CGRect v10 = a3;
  double v9 = self;
  v8[1] = (id)a2;
  double v4 = [CPSCardPlatterView alloc];
  id v5 = (id)[MEMORY[0x263F1C550] clearColor];
  v8[0] = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:](v4, "initWithFrame:cornerRadius:maskedCorners:backgroundMaterial:backgroundColor:", 15, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height, 10.0);

  double v6 = [(CPSNavigationCardViewController *)v9 shadowCardView];
  [(CPSCardPlatterView *)v6 setShadowWithRadius:20.0 opacity:0.0];

  id v7 = v8[0];
  objc_storeStrong(v8, 0);

  return v7;
}

- (void)updateTripEstimates:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_updateSizingViewConstraintsForView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v4 = [(CPSNavigationCardViewController *)v7 currentManeuversCardView];
  [(CPSManeuversCardView *)v4 removeFromSuperview];

  id v5 = [(CPSNavigationCardViewController *)v7 currentPausedCardView];
  [(CPSPausedCardView *)v5 removeFromSuperview];

  [(CPSNavigationCardViewController *)v7 setCurrentPausedCardView:0];
  [(CPSNavigationCardViewController *)v7 setCurrentManeuversCardView:0];
  [(CPSNavigationCardViewController *)v7 _updateHelperConstraints];
  objc_storeStrong(location, 0);
}

- (void)setGuidanceBackgroundColor:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_guidanceBackgroundColor != location[0])
  {
    objc_storeStrong((id *)&v4->_guidanceBackgroundColor, location[0]);
    [(CPSNavigationCardViewController *)v4 _updateCardBackgroundColors];
  }
  objc_storeStrong(location, 0);
}

- (void)_updateCardBackgroundColors
{
  id v33 = self;
  v32[1] = (id)a2;
  double v18 = [(CPSNavigationCardViewController *)self currentPausedCardView];
  double v17 = [(CPSPausedCardView *)v18 cardPlatterView];
  v32[0] = (id)[(CPSCardPlatterView *)v17 backgroundColor];

  id v21 = [(CPSNavigationCardViewController *)v33 currentManeuversCardView];
  id v20 = [(CPSManeuversCardView *)v21 maneuvers];
  id v19 = [(NSArray *)v20 firstObject];
  id location = (id)[v19 cardBackgroundColor];

  double v2 = [(CPSNavigationCardViewController *)v33 guidanceBackgroundColor];
  BOOL v22 = v2 != 0;

  if (v22)
  {
    double v8 = [(CPSNavigationCardViewController *)v33 currentPausedCardView];
    double v9 = [(CPSPausedCardView *)v8 cardPlatterView];
    char v25 = 0;
    if (v32[0])
    {
      id v7 = (UIColor *)v32[0];
    }
    else
    {
      id v26 = [(CPSNavigationCardViewController *)v33 guidanceBackgroundColor];
      char v25 = 1;
      id v7 = v26;
    }
    [(CPSCardPlatterView *)v9 setBackgroundColor:v7];
    if (v25) {

    }
    id v5 = [(CPSNavigationCardViewController *)v33 currentManeuversCardView];
    double v6 = [(CPSManeuversCardView *)v5 cardPlatterView];
    char v23 = 0;
    if (location)
    {
      id v4 = location;
    }
    else
    {
      id v24 = [(CPSNavigationCardViewController *)v33 guidanceBackgroundColor];
      char v23 = 1;
      id v4 = v24;
    }
    [(CPSCardPlatterView *)v6 setBackgroundColor:v4];
    if (v23) {

    }
    double v3 = [(CPSNavigationCardViewController *)v33 currentManeuversCardView];
    [(CPSManeuversCardView *)v3 setUsesCustomBackgroundColor:1];
  }
  else
  {
    double v15 = [(CPSNavigationCardViewController *)v33 currentPausedCardView];
    double v16 = [(CPSPausedCardView *)v15 cardPlatterView];
    char v29 = 0;
    if (v32[0])
    {
      id v14 = v32[0];
    }
    else
    {
      id v30 = (id)objc_msgSend(MEMORY[0x263F1C550], "crsui_consoleTurnCardETATrayBackgroundColor");
      char v29 = 1;
      id v14 = v30;
    }
    [(CPSCardPlatterView *)v16 setBackgroundColor:v14];
    if (v29) {

    }
    double v12 = [(CPSNavigationCardViewController *)v33 currentManeuversCardView];
    double v13 = [(CPSManeuversCardView *)v12 cardPlatterView];
    char v27 = 0;
    if (location)
    {
      id v11 = location;
    }
    else
    {
      id v28 = (id)objc_msgSend(MEMORY[0x263F1C550], "crsui_consoleTurnCardETATrayBackgroundColor");
      char v27 = 1;
      id v11 = v28;
    }
    [(CPSCardPlatterView *)v13 setBackgroundColor:v11];
    if (v27) {

    }
    CGRect v10 = [(CPSNavigationCardViewController *)v33 currentManeuversCardView];
    [(CPSManeuversCardView *)v10 setUsesCustomBackgroundColor:location != 0];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v32, 0);
}

- (BOOL)_shouldAnimate
{
  return [(CPSNavigationCardViewController *)self passesLinkCheck];
}

- (void)_updateLinkedCheck
{
  double v8 = self;
  location[1] = (id)a2;
  double v2 = (void *)MEMORY[0x263F01888];
  double v3 = [(CPSNavigationCardViewController *)self navigatingBundleIdentifier];
  location[0] = (id)objc_msgSend(v2, "bundleProxyForIdentifier:");

  id v4 = (id)[location[0] sdkVersion];
  uint64_t v5 = [v4 compare:@"13.4" options:64];

  BOOL v6 = 1;
  if (v5) {
    BOOL v6 = v5 == 1;
  }
  [(CPSNavigationCardViewController *)v8 setPassesLinkCheck:v6];
  objc_storeStrong(location, 0);
}

- (void)setNavigatingBundleIdentifier:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (![(NSString *)v6->_navigatingBundleIdentifier isEqualToString:location[0]])
  {
    uint64_t v3 = [location[0] copy];
    navigatingBundleIdentifier = v6->_navigatingBundleIdentifier;
    v6->_navigatingBundleIdentifier = (NSString *)v3;

    [(CPSNavigationCardViewController *)v6 _updateLinkedCheck];
  }
  objc_storeStrong(location, 0);
}

- (CPSLayoutHelperView)layoutHelperView
{
  return self->_layoutHelperView;
}

- (UIColor)guidanceBackgroundColor
{
  return self->_guidanceBackgroundColor;
}

- (BOOL)navigationCardHidden
{
  return self->_navigationCardHidden;
}

- (void)setNavigationCardHidden:(BOOL)a3
{
  self->_navigationCardHidden = a3;
}

- (NSString)navigatingBundleIdentifier
{
  return self->_navigatingBundleIdentifier;
}

- (NSLayoutConstraint)containerViewHeightConstraint
{
  return self->_containerViewHeightConstraint;
}

- (void)setContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)containerViewTopConstraint
{
  return self->_containerViewTopConstraint;
}

- (void)setContainerViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)sizingViewBottomConstraint
{
  return self->_sizingViewBottomConstraint;
}

- (void)setSizingViewBottomConstraint:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (CPSManeuversCardView)currentManeuversCardView
{
  return self->_currentManeuversCardView;
}

- (void)setCurrentManeuversCardView:(id)a3
{
}

- (CPSPausedCardView)currentPausedCardView
{
  return self->_currentPausedCardView;
}

- (void)setCurrentPausedCardView:(id)a3
{
}

- (NSMutableSet)navigationCardHiddenRequesters
{
  return self->_navigationCardHiddenRequesters;
}

- (void)setNavigationCardHiddenRequesters:(id)a3
{
}

- (BOOL)passesLinkCheck
{
  return self->_passesLinkCheck;
}

- (void)setPassesLinkCheck:(BOOL)a3
{
  self->_passesLinkCheck = a3;
}

- (NSArray)layoutHelperVerticalConstraints
{
  return self->_layoutHelperVerticalConstraints;
}

- (void)setLayoutHelperVerticalConstraints:(id)a3
{
}

- (CPSCardPlatterView)shadowCardView
{
  return self->_shadowCardView;
}

- (void)setShadowCardView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end