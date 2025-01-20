@interface CPSInstrumentClusterViewController
- (CPSAbridgableLabel)inactiveLabel;
- (CPSClusterPausedCardView)pausedCardView;
- (CPSDashboardManeuversCardView)maneuversCardView;
- (NSArray)attributedInactiveVariants;
- (NSArray)inactiveVariants;
- (int64_t)guidanceStyle;
- (void)_transitionFromViews:(id)a3 inView:(id)a4 animated:(BOOL)a5;
- (void)_updateGuidanceStyle;
- (void)loadView;
- (void)navigator:(id)a3 didEndTrip:(BOOL)a4;
- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6;
- (void)setAttributedInactiveVariants:(id)a3;
- (void)setGuidanceStyle:(int64_t)a3;
- (void)setInactiveLabel:(id)a3;
- (void)setInactiveVariants:(id)a3;
- (void)setManeuversCardView:(id)a3;
- (void)setPausedCardView:(id)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
@end

@implementation CPSInstrumentClusterViewController

- (void)loadView
{
  v42[4] = *MEMORY[0x263EF8340];
  v41 = self;
  SEL v40 = a2;
  v39.receiver = self;
  v39.super_class = (Class)CPSInstrumentClusterViewController;
  [(CPSInstrumentClusterViewController *)&v39 loadView];
  id v31 = (id)[(CPSInstrumentClusterViewController *)v41 view];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v33 = (id)[(CPSInstrumentClusterViewController *)v41 view];
  id v32 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  objc_msgSend(v33, "setBackgroundColor:");

  v38 = objc_alloc_init(CPSAbridgableLabel);
  [(CPSInstrumentClusterViewController *)v41 setInactiveLabel:v38];
  id v34 = (id)[MEMORY[0x263F1C658] systemFontOfSize:16.0 weight:*MEMORY[0x263F1D338]];
  -[CPSAbridgableLabel setFont:](v38, "setFont:");

  -[CPSAbridgableLabel setTextAlignment:](v38, "setTextAlignment:");
  [(CPSAbridgableLabel *)v38 setNumberOfLines:1];
  id v35 = (id)[MEMORY[0x263F1C550] labelColor];
  -[CPSAbridgableLabel setTextColor:](v38, "setTextColor:");

  [(CPSAbridgableLabel *)v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = [(CPSInstrumentClusterViewController *)v41 attributedInactiveVariants];
  BOOL v37 = [(NSArray *)v36 count] == 0;

  if (v37)
  {
    v27 = [(CPSInstrumentClusterViewController *)v41 inactiveVariants];
    BOOL v28 = [(NSArray *)v27 count] == 0;

    if (!v28)
    {
      id v26 = self;
      id v25 = (id)[v26 inactiveVariants];
      -[CPSAbridgableLabel setTextVariants:](v38, "setTextVariants:");
    }
  }
  else
  {
    id v30 = self;
    id v29 = (id)[v30 attributedInactiveVariants];
    -[CPSAbridgableLabel setAttributedTextVariants:](v38, "setAttributedTextVariants:");
  }
  id v2 = (id)[(CPSInstrumentClusterViewController *)v41 view];
  [v2 addSubview:v38];

  v3 = (void *)MEMORY[0x263F08938];
  id v24 = (id)[(CPSInstrumentClusterViewController *)v41 view];
  id v23 = (id)[v24 safeAreaLayoutGuide];
  id v22 = (id)[v23 leadingAnchor];
  id v21 = (id)[(CPSAbridgableLabel *)v38 leadingAnchor];
  id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", -8.0);
  v42[0] = v20;
  id v19 = (id)[(CPSInstrumentClusterViewController *)v41 view];
  id v18 = (id)[v19 safeAreaLayoutGuide];
  id v17 = (id)[v18 trailingAnchor];
  id v16 = (id)[(CPSAbridgableLabel *)v38 trailingAnchor];
  id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", 8.0);
  v42[1] = v15;
  id v14 = (id)[(CPSInstrumentClusterViewController *)v41 view];
  id v13 = (id)[v14 safeAreaLayoutGuide];
  id v12 = (id)[v13 centerYAnchor];
  id v11 = (id)[(CPSAbridgableLabel *)v38 centerYAnchor];
  id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:constant:");
  v42[2] = v10;
  id v9 = (id)[(CPSInstrumentClusterViewController *)v41 view];
  id v8 = (id)[v9 safeAreaLayoutGuide];
  id v7 = (id)[v8 centerXAnchor];
  id v6 = (id)[(CPSAbridgableLabel *)v38 centerXAnchor];
  id v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:constant:", 0.0);
  v42[3] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  objc_msgSend(v3, "activateConstraints:");

  objc_storeStrong((id *)&v38, 0);
}

- (void)setGuidanceStyle:(int64_t)a3
{
  if (self->_guidanceStyle != a3)
  {
    self->_guidanceStyle = a3;
    [(CPSInstrumentClusterViewController *)self _updateGuidanceStyle];
  }
}

- (void)_updateGuidanceStyle
{
}

- (void)setInactiveVariants:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  inactiveVariants = v7->_inactiveVariants;
  v7->_inactiveVariants = (NSArray *)v3;

  id v5 = [(CPSInstrumentClusterViewController *)v7 inactiveLabel];
  [(CPSAbridgableLabel *)v5 setTextVariants:v7->_inactiveVariants];

  objc_storeStrong(location, 0);
}

- (void)setAttributedInactiveVariants:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  attributedInactiveVariants = v7->_attributedInactiveVariants;
  v7->_attributedInactiveVariants = (NSArray *)v3;

  id v5 = [(CPSInstrumentClusterViewController *)v7 inactiveLabel];
  [(CPSAbridgableLabel *)v5 setAttributedTextVariants:v7->_attributedInactiveVariants];

  objc_storeStrong(location, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  v33[2] = *MEMORY[0x263EF8340];
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v25 = [(CPSInstrumentClusterViewController *)v32 inactiveLabel];
  [(CPSAbridgableLabel *)v25 setHidden:1];

  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v26 = [(CPSInstrumentClusterViewController *)v32 maneuversCardView];

  if (v26)
  {
    id v23 = [(CPSInstrumentClusterViewController *)v32 maneuversCardView];
    objc_msgSend(v29, "addObject:");
  }
  id v22 = [(CPSInstrumentClusterViewController *)v32 pausedCardView];

  if (v22)
  {
    id v21 = [(CPSInstrumentClusterViewController *)v32 pausedCardView];
    objc_msgSend(v29, "addObject:");
  }
  BOOL v28 = [v29 count] != 0;
  -[CPSInstrumentClusterViewController setManeuversCardView:](v32, "setManeuversCardView:");
  [(CPSInstrumentClusterViewController *)v32 setPausedCardView:0];
  v27 = 0;
  if ([location[0] count])
  {
    id v4 = objc_alloc_init(CPSDashboardManeuversCardView);
    id v5 = v27;
    v27 = v4;

    id v6 = (id)[MEMORY[0x263F1C550] clearColor];
    -[CPSDashboardManeuversCardView setBackgroundColor:](v27, "setBackgroundColor:");

    [(CPSDashboardManeuversCardView *)v27 setAllowsCustomBackgroundColorForManeuver:1];
    [(CPSDashboardManeuversCardView *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = (id)[(CPSInstrumentClusterViewController *)v32 view];
    [v7 addSubview:v27];

    objc_storeStrong((id *)&v32->_maneuversCardView, v27);
    [(CPSDashboardManeuversCardView *)v27 showManeuvers:location[0] usingDisplayStyles:v30];
    id v8 = (void *)MEMORY[0x263F08938];
    id v19 = (id)[(CPSInstrumentClusterViewController *)v32 view];
    id v18 = (id)[v19 safeAreaLayoutGuide];
    id v17 = (id)[v18 topAnchor];
    id v16 = (id)[(CPSDashboardManeuversCardView *)v27 topAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v33[0] = v15;
    id v14 = (id)[(CPSInstrumentClusterViewController *)v32 view];
    id v13 = (id)[v14 safeAreaLayoutGuide];
    id v12 = (id)[v13 bottomAnchor];
    id v11 = (id)[(CPSDashboardManeuversCardView *)v27 bottomAnchor];
    id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v33[1] = v10;
    id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    objc_msgSend(v8, "activateConstraints:");

    id v20 = [(CPSInstrumentClusterViewController *)v32 maneuversCardView];
    [(CPSDashboardManeuversCardView *)v20 setHidden:0];
  }
  [(CPSInstrumentClusterViewController *)v32 _transitionFromViews:v29 inView:v27 animated:v28];
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = [(CPSInstrumentClusterViewController *)v8 maneuversCardView];
  [(CPSDashboardManeuversCardView *)v5 updateEstimates:location[0] forManeuver:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  v35[2] = *MEMORY[0x263EF8340];
  id v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v32 = a4;
  id v31 = 0;
  objc_storeStrong(&v31, a5);
  id v30 = 0;
  objc_storeStrong(&v30, a6);
  id v26 = [(CPSInstrumentClusterViewController *)v34 inactiveLabel];
  [(CPSAbridgableLabel *)v26 setHidden:1];

  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  v27 = [(CPSInstrumentClusterViewController *)v34 maneuversCardView];

  if (v27)
  {
    id v22 = [(CPSInstrumentClusterViewController *)v34 maneuversCardView];
    objc_msgSend(v29, "addObject:");
  }
  id v21 = [(CPSInstrumentClusterViewController *)v34 pausedCardView];

  if (v21)
  {
    id v20 = [(CPSInstrumentClusterViewController *)v34 pausedCardView];
    objc_msgSend(v29, "addObject:");
  }
  -[CPSInstrumentClusterViewController setManeuversCardView:](v34, "setManeuversCardView:");
  [(CPSInstrumentClusterViewController *)v34 setPausedCardView:0];
  id v6 = [CPSClusterPausedCardView alloc];
  BOOL v28 = [(CPSPausedCardView *)v6 initWithReason:v32 title:v31 backgroundColor:v30];
  id v7 = (id)[(CPSInstrumentClusterViewController *)v34 view];
  [v7 addSubview:v28];

  objc_storeStrong((id *)&v34->_pausedCardView, v28);
  id v8 = (void *)MEMORY[0x263F08938];
  id v19 = (id)[(CPSInstrumentClusterViewController *)v34 view];
  id v18 = (id)[v19 safeAreaLayoutGuide];
  id v17 = (id)[v18 topAnchor];
  id v16 = (id)[(CPSClusterPausedCardView *)v28 topAnchor];
  id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v35[0] = v15;
  id v14 = (id)[(CPSInstrumentClusterViewController *)v34 view];
  id v13 = (id)[v14 safeAreaLayoutGuide];
  id v12 = (id)[v13 bottomAnchor];
  id v11 = (id)[(CPSClusterPausedCardView *)v28 bottomAnchor];
  id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v35[1] = v10;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  objc_msgSend(v8, "activateConstraints:");

  [(CPSInstrumentClusterViewController *)v34 _transitionFromViews:v29 inView:v28 animated:1];
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = [(CPSInstrumentClusterViewController *)v13 maneuversCardView];

  if (v9)
  {
    id v7 = [(CPSInstrumentClusterViewController *)v13 maneuversCardView];
    objc_msgSend(v10, "addObject:");
  }
  id v6 = [(CPSInstrumentClusterViewController *)v13 pausedCardView];

  if (v6)
  {
    id v5 = [(CPSInstrumentClusterViewController *)v13 pausedCardView];
    objc_msgSend(v10, "addObject:");
  }
  -[CPSInstrumentClusterViewController setManeuversCardView:](v13, "setManeuversCardView:");
  [(CPSInstrumentClusterViewController *)v13 setPausedCardView:0];
  [(CPSInstrumentClusterViewController *)v13 _transitionFromViews:v10 inView:0 animated:1];
  id v4 = [(CPSInstrumentClusterViewController *)v13 inactiveLabel];
  [(CPSAbridgableLabel *)v4 setHidden:0];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4 animated:(BOOL)a5
{
  v61[2] = *MEMORY[0x263EF8340];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v57 = 0;
  objc_storeStrong(&v57, a4);
  BOOL v56 = a5;
  if (a5)
  {
    id v39 = location[0];
    uint64_t v50 = MEMORY[0x263EF8330];
    int v51 = -1073741824;
    int v52 = 0;
    v53 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke;
    v54 = &unk_2648A3BB8;
    v55 = v59;
    [v39 enumerateObjectsUsingBlock:&v50];
    if (v57)
    {
      id v29 = (id)[v57 leadingAnchor];
      id v28 = (id)[(CPSInstrumentClusterViewController *)v59 view];
      id v27 = (id)[v28 safeAreaLayoutGuide];
      id v26 = (id)[v27 leadingAnchor];
      id v25 = (id)[(CPSInstrumentClusterViewController *)v59 view];
      [v25 frame];
      v48[1] = v5;
      v48[2] = v6;
      v48[3] = v7;
      v48[4] = v8;
      id v49 = (id)[v29 constraintEqualToAnchor:v26 constant:*(double *)&v7];

      id v34 = (id)[v57 trailingAnchor];
      id v33 = (id)[(CPSInstrumentClusterViewController *)v59 view];
      id v32 = (id)[v33 safeAreaLayoutGuide];
      id v31 = (id)[v32 trailingAnchor];
      id v30 = (id)[(CPSInstrumentClusterViewController *)v59 view];
      [v30 frame];
      v47[1] = v9;
      v47[2] = v10;
      v47[3] = v11;
      v47[4] = v12;
      v48[0] = (id)[v34 constraintEqualToAnchor:v31 constant:*(double *)&v11];

      id v35 = (void *)MEMORY[0x263F08938];
      v61[0] = v49;
      v61[1] = v48[0];
      id v36 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
      objc_msgSend(v35, "activateConstraints:");

      id v37 = (id)[(CPSInstrumentClusterViewController *)v59 view];
      [v37 layoutIfNeeded];

      [v57 layoutIfNeeded];
      objc_msgSend(v49, "setConstant:");
      [v48[0] setConstant:0.0];
      v38 = (void *)MEMORY[0x263F1CB60];
      uint64_t v42 = MEMORY[0x263EF8330];
      int v43 = -1073741824;
      int v44 = 0;
      v45 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_4;
      v46 = &unk_2648A3BE0;
      v47[0] = v59;
      [v38 animateWithDuration:0 delay:&v42 options:&__block_literal_global_16 animations:0.35 completion:0.0];
      objc_storeStrong(v47, 0);
      objc_storeStrong(v48, 0);
      objc_storeStrong(&v49, 0);
    }
    objc_storeStrong((id *)&v55, 0);
  }
  else if (v57)
  {
    id v13 = (void *)MEMORY[0x263F08938];
    id v24 = (id)[v57 leadingAnchor];
    id v23 = (id)[(CPSInstrumentClusterViewController *)v59 view];
    id v22 = (id)[v23 safeAreaLayoutGuide];
    id v21 = (id)[v22 leadingAnchor];
    id v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:");
    v60[0] = v20;
    id v19 = (id)[v57 trailingAnchor];
    id v18 = (id)[(CPSInstrumentClusterViewController *)v59 view];
    id v17 = (id)[v18 safeAreaLayoutGuide];
    id v16 = (id)[v17 trailingAnchor];
    id v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 0.0);
    v60[1] = v15;
    id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
    objc_msgSend(v13, "activateConstraints:");
  }
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v38[3] = a3;
  v38[2] = a4;
  v38[1] = a1;
  v38[0] = (id)[location[0] snapshotViewAfterScreenUpdates:0];
  id v15 = (id)[a1[4] view];
  [v15 addSubview:v38[0]];

  id v16 = v38[0];
  [location[0] frame];
  double v34 = v4;
  double v35 = v5;
  double v36 = v6;
  double v37 = v7;
  objc_msgSend(v16, "setFrame:", v4, v5, v6, v7);
  [location[0] removeFromSuperview];
  [v38[0] frame];
  *((void *)&v32 + 1) = v8;
  *(double *)&long long v33 = v9;
  *((void *)&v33 + 1) = v10;
  *(double *)&long long v32 = v11 - v9;
  id v17 = (void *)MEMORY[0x263F1CB60];
  uint64_t v24 = MEMORY[0x263EF8330];
  int v25 = -1073741824;
  int v26 = 0;
  id v27 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_2;
  id v28 = &unk_2648A3B68;
  id v29 = v38[0];
  long long v30 = v32;
  long long v31 = v33;
  uint64_t v18 = MEMORY[0x263EF8330];
  int v19 = -1073741824;
  int v20 = 0;
  id v21 = __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_3;
  id v22 = &unk_2648A3B90;
  id v23 = v38[0];
  objc_msgSend(v17, "animateWithDuration:animations:completion:", &v24, 0.35);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(v38, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __75__CPSInstrumentClusterViewController__transitionFromViews_inView_animated___block_invoke_4(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (int64_t)guidanceStyle
{
  return self->_guidanceStyle;
}

- (NSArray)inactiveVariants
{
  return self->_inactiveVariants;
}

- (NSArray)attributedInactiveVariants
{
  return self->_attributedInactiveVariants;
}

- (CPSDashboardManeuversCardView)maneuversCardView
{
  return self->_maneuversCardView;
}

- (void)setManeuversCardView:(id)a3
{
}

- (CPSClusterPausedCardView)pausedCardView
{
  return self->_pausedCardView;
}

- (void)setPausedCardView:(id)a3
{
}

- (CPSAbridgableLabel)inactiveLabel
{
  return self->_inactiveLabel;
}

- (void)setInactiveLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end