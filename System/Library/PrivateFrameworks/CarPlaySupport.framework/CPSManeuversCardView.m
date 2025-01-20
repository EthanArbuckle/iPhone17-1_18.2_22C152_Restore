@interface CPSManeuversCardView
+ (id)createPlatterView;
+ (id)maneuverViewWithManeuver:(id)a3;
- (BOOL)canFitSize:(CGSize)a3;
- (BOOL)showSecondaryManeuverView;
- (BOOL)usesCustomBackgroundColor;
- (CGSize)intrinsicContentSize;
- (CPSCardPlatterView)cardPlatterView;
- (CPSHairlineView)hairlineView;
- (CPSManeuversCardView)initWithManeuvers:(id)a3;
- (CPSPrimaryManeuverView)primaryManeuverView;
- (CPSSecondaryManeuverView)secondaryManeuverView;
- (NSArray)maneuvers;
- (NSMutableArray)activeConstraints;
- (void)_updateConstraints;
- (void)_updateHairlineBackgroundColor;
- (void)_updateSecondaryManeuverBackgroundColor;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setActiveConstraints:(id)a3;
- (void)setCardPlatterView:(id)a3;
- (void)setHairlineView:(id)a3;
- (void)setManeuvers:(id)a3;
- (void)setPrimaryManeuverView:(id)a3;
- (void)setSecondaryManeuverView:(id)a3;
- (void)setShowSecondaryManeuverView:(BOOL)a3;
- (void)setUsesCustomBackgroundColor:(BOOL)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
@end

@implementation CPSManeuversCardView

- (CPSManeuversCardView)initWithManeuvers:(id)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v22;
  v22 = 0;
  v20.receiver = v3;
  v20.super_class = (Class)CPSManeuversCardView;
  v22 = [(CPSManeuversCardView *)&v20 init];
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    objc_storeStrong((id *)&v22->_maneuvers, location[0]);
    [(CPSManeuversCardView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v19 = (id)[(id)objc_opt_class() createPlatterView];
    objc_storeStrong((id *)&v22->_cardPlatterView, v19);
    [(CPSManeuversCardView *)v22 addSubview:v19];
    v8 = (void *)MEMORY[0x263F08938];
    id v18 = (id)[v19 leadingAnchor];
    id v17 = (id)[(CPSManeuversCardView *)v22 leadingAnchor];
    id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v23[0] = v16;
    id v15 = (id)[v19 topAnchor];
    id v14 = (id)[(CPSManeuversCardView *)v22 topAnchor];
    id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v23[1] = v13;
    id v12 = (id)[v19 trailingAnchor];
    id v11 = (id)[(CPSManeuversCardView *)v22 trailingAnchor];
    id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v23[2] = v10;
    id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
    objc_msgSend(v8, "activateConstraints:");

    uint64_t v4 = objc_opt_new();
    activeConstraints = v22->_activeConstraints;
    v22->_activeConstraints = (NSMutableArray *)v4;

    objc_storeStrong(&v19, 0);
  }
  v7 = v22;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v7;
}

- (CGSize)intrinsicContentSize
{
  [(CPSManeuversCardView *)self bounds];
  CGRectGetWidth(v18);
  CGSizeMake_13();
  double v13 = v2;
  double v14 = v3;
  id v9 = [(CPSManeuversCardView *)self primaryManeuverView];
  [(CPSPrimaryManeuverView *)v9 intrinsicContentSize];
  double v15 = v14 + v4;

  char v10 = 0;
  if ([(CPSManeuversCardView *)self showSecondaryManeuverView])
  {
    id v11 = [(CPSManeuversCardView *)self secondaryManeuverView];
    char v10 = 1;
    [(CPSSecondaryManeuverView *)v11 bounds];
    double v8 = v5;
  }
  else
  {
    double v8 = 0.0;
  }
  double v16 = v15 + v8;
  if (v10) {

  }
  double v6 = v13;
  double v7 = v16;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_updateConstraints
{
  v81[3] = *MEMORY[0x263EF8340];
  v77 = self;
  v76[1] = (id)a2;
  v73 = [(CPSManeuversCardView *)self primaryManeuverView];

  if (v73)
  {
    v76[0] = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([(NSMutableArray *)v77->_activeConstraints count])
    {
      [MEMORY[0x263F08938] deactivateConstraints:v77->_activeConstraints];
      [(NSMutableArray *)v77->_activeConstraints removeAllObjects];
    }
    v71 = [(CPSManeuversCardView *)v77 primaryManeuverView];
    id v70 = (id)[(CPSPrimaryManeuverView *)v71 topAnchor];
    id v69 = (id)[(CPSManeuversCardView *)v77 topAnchor];
    id v68 = (id)objc_msgSend(v70, "constraintEqualToAnchor:constant:", 0.0);
    v81[0] = v68;
    v67 = [(CPSManeuversCardView *)v77 primaryManeuverView];
    id v66 = (id)[(CPSPrimaryManeuverView *)v67 leadingAnchor];
    id v65 = (id)[(CPSManeuversCardView *)v77 leadingAnchor];
    id v64 = (id)objc_msgSend(v66, "constraintEqualToAnchor:");
    v81[1] = v64;
    v63 = [(CPSManeuversCardView *)v77 primaryManeuverView];
    id v62 = (id)[(CPSPrimaryManeuverView *)v63 trailingAnchor];
    id v61 = (id)[(CPSManeuversCardView *)v77 trailingAnchor];
    id v60 = (id)objc_msgSend(v62, "constraintEqualToAnchor:");
    v81[2] = v60;
    id v59 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:3];
    objc_msgSend(v76[0], "addObjectsFromArray:");

    id v75 = 0;
    v72 = [(CPSManeuversCardView *)v77 secondaryManeuverView];

    if (v72)
    {
      id location = 0;
      v27 = [(CPSManeuversCardView *)v77 cardPlatterView];
      id v26 = (id)[(CPSCardPlatterView *)v27 bottomAnchor];
      v25 = [(CPSManeuversCardView *)v77 secondaryManeuverView];
      id v24 = (id)[(CPSSecondaryManeuverView *)v25 bottomAnchor];
      id v2 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
      id v3 = v75;
      id v75 = v2;

      v58 = [(CPSManeuversCardView *)v77 primaryManeuverView];
      id v57 = (id)[(CPSPrimaryManeuverView *)v58 bottomAnchor];
      v56 = [(CPSManeuversCardView *)v77 hairlineView];
      id v55 = (id)[(CPSHairlineView *)v56 topAnchor];
      id v54 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:");
      v80[0] = v54;
      v53 = [(CPSManeuversCardView *)v77 hairlineView];
      id v52 = (id)[(CPSHairlineView *)v53 bottomAnchor];
      v51 = [(CPSManeuversCardView *)v77 secondaryManeuverView];
      id v50 = (id)[(CPSSecondaryManeuverView *)v51 topAnchor];
      id v49 = (id)objc_msgSend(v52, "constraintEqualToAnchor:constant:", 0.0);
      v80[1] = v49;
      v48 = [(CPSManeuversCardView *)v77 secondaryManeuverView];
      id v47 = (id)[(CPSSecondaryManeuverView *)v48 leadingAnchor];
      id v46 = (id)[(CPSManeuversCardView *)v77 leadingAnchor];
      id v45 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
      v80[2] = v45;
      v44 = [(CPSManeuversCardView *)v77 secondaryManeuverView];
      id v43 = (id)[(CPSSecondaryManeuverView *)v44 trailingAnchor];
      id v42 = (id)[(CPSManeuversCardView *)v77 trailingAnchor];
      id v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
      v80[3] = v41;
      v40 = [(CPSManeuversCardView *)v77 hairlineView];
      id v39 = (id)[(CPSHairlineView *)v40 leadingAnchor];
      id v38 = (id)[(CPSManeuversCardView *)v77 leadingAnchor];
      id v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:");
      v80[4] = v37;
      v36 = [(CPSManeuversCardView *)v77 hairlineView];
      id v35 = (id)[(CPSHairlineView *)v36 trailingAnchor];
      id v34 = (id)[(CPSManeuversCardView *)v77 trailingAnchor];
      id v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
      v80[5] = v33;
      v32 = [(CPSManeuversCardView *)v77 secondaryManeuverView];
      id v31 = (id)[(CPSSecondaryManeuverView *)v32 bottomAnchor];
      id v30 = (id)[(CPSManeuversCardView *)v77 bottomAnchor];
      id v29 = (id)objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:");
      v80[6] = v29;
      v80[7] = v75;
      id v28 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:8];
      objc_msgSend(v76[0], "addObjectsFromArray:");

      if (![(CPSManeuversCardView *)v77 showSecondaryManeuverView])
      {
        v23 = [(CPSManeuversCardView *)v77 secondaryManeuverView];
        id v22 = (id)[(CPSSecondaryManeuverView *)v23 heightAnchor];
        id v21 = (id)objc_msgSend(v22, "constraintEqualToConstant:");
        v79[0] = v21;
        objc_super v20 = [(CPSManeuversCardView *)v77 hairlineView];
        id v19 = (id)[(CPSHairlineView *)v20 heightAnchor];
        id v18 = (id)[v19 constraintEqualToConstant:0.0];
        v79[1] = v18;
        id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
        id v5 = location;
        id location = v4;

        [v76[0] addObjectsFromArray:location];
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      id v12 = [(CPSManeuversCardView *)v77 cardPlatterView];
      id v11 = (id)[(CPSCardPlatterView *)v12 bottomAnchor];
      char v10 = [(CPSManeuversCardView *)v77 primaryManeuverView];
      id v9 = (id)[(CPSPrimaryManeuverView *)v10 bottomAnchor];
      id v6 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
      id v7 = v75;
      id v75 = v6;

      id v17 = [(CPSManeuversCardView *)v77 primaryManeuverView];
      id v16 = (id)[(CPSPrimaryManeuverView *)v17 bottomAnchor];
      id v15 = (id)[(CPSManeuversCardView *)v77 bottomAnchor];
      id v14 = (id)objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v78[0] = v14;
      v78[1] = v75;
      id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:2];
      objc_msgSend(v76[0], "addObjectsFromArray:");
    }
    objc_msgSend(MEMORY[0x263F08938], "activateConstraints:", v76[0], v76);
    [(NSMutableArray *)v77->_activeConstraints addObjectsFromArray:v76[0]];
    objc_storeStrong(&v75, 0);
    objc_storeStrong(v8, 0);
  }
}

- (void)layoutSubviews
{
  v72 = self;
  SEL v71 = a2;
  v70.receiver = self;
  v70.super_class = (Class)CPSManeuversCardView;
  [(CPSManeuversCardView *)&v70 layoutSubviews];
  id v50 = [(CPSManeuversCardView *)v72 primaryManeuverView];
  char v68 = 0;
  BOOL v51 = 0;
  if (!v50)
  {
    id v69 = [(CPSManeuversCardView *)v72 maneuvers];
    char v68 = 1;
    BOOL v51 = [(NSArray *)v69 count] != 0;
  }
  if (v68) {

  }
  if (v51)
  {
    id v46 = objc_opt_class();
    v48 = [(CPSManeuversCardView *)v72 maneuvers];
    id v47 = [(NSArray *)v48 firstObject];
    id v67 = (id)objc_msgSend(v46, "maneuverViewWithManeuver:");

    objc_msgSend(v67, "setUsesCustomBackgroundColor:", -[CPSManeuversCardView usesCustomBackgroundColor](v72, "usesCustomBackgroundColor"));
    id v49 = [(CPSManeuversCardView *)v72 cardPlatterView];
    [(CPSCardPlatterView *)v49 addSubview:v67];

    [(CPSManeuversCardView *)v72 setPrimaryManeuverView:v67];
    objc_storeStrong(&v67, 0);
  }
  v44 = [(CPSManeuversCardView *)v72 secondaryManeuverView];
  char v65 = 0;
  BOOL v45 = 0;
  if (!v44)
  {
    id v66 = [(CPSManeuversCardView *)v72 maneuvers];
    char v65 = 1;
    BOOL v45 = [(NSArray *)v66 count] > 1;
  }
  if (v65) {

  }
  if (v45)
  {
    v40 = [CPSSecondaryManeuverView alloc];
    id v41 = [(NSArray *)v72->_maneuvers objectAtIndex:1];
    id v64 = -[CPSSecondaryManeuverView initWithManeuver:](v40, "initWithManeuver:");

    id v42 = [(CPSManeuversCardView *)v72 cardPlatterView];
    [(CPSCardPlatterView *)v42 addSubview:v64];

    [(CPSManeuversCardView *)v72 setSecondaryManeuverView:v64];
    id v63 = +[CPSHairlineView grayHairlineViewAlongAxis:0];
    id v43 = [(CPSManeuversCardView *)v72 cardPlatterView];
    [(CPSCardPlatterView *)v43 addSubview:v63];

    [(CPSManeuversCardView *)v72 setHairlineView:v63];
    [(CPSManeuversCardView *)v72 _updateSecondaryManeuverBackgroundColor];
    [(CPSManeuversCardView *)v72 _updateHairlineBackgroundColor];
    objc_storeStrong(&v63, 0);
    objc_storeStrong((id *)&v64, 0);
  }
  [(CPSManeuversCardView *)v72 bounds];
  v60[1] = v2;
  v60[2] = v3;
  *(void *)&long long v61 = v4;
  *((void *)&v61 + 1) = v5;
  long long v62 = v61;
  id v38 = [(CPSManeuversCardView *)v72 primaryManeuverView];
  v60[0] = -[CPSPrimaryManeuverView layoutConfigurationForSize:](v38, "layoutConfigurationForSize:", *(double *)&v61, *((double *)&v61 + 1));

  double v59 = 0.0;
  id v39 = [(CPSManeuversCardView *)v72 secondaryManeuverView];

  if (v39)
  {
    v36 = [(CPSManeuversCardView *)v72 secondaryManeuverView];
    [(CPSManeuversCardView *)v72 bounds];
    v56[5] = v6;
    v56[6] = v7;
    *(double *)&long long v57 = v8;
    *((double *)&v57 + 1) = v9;
    long long v58 = v57;
    -[CPSSecondaryManeuverView generateLayoutConfigurationsForSizeIfNecessary:force:](v36, "generateLayoutConfigurationsForSizeIfNecessary:force:", 0, v8, v9);

    id v37 = [(CPSManeuversCardView *)v72 secondaryManeuverView];
    [(CPSSecondaryManeuverView *)v37 generatedHeight];
    double v59 = v10 + 1.0;
  }
  [v60[0] height];
  double v35 = v11 + v59;
  [(CPSManeuversCardView *)v72 bounds];
  v56[1] = v12;
  v56[2] = v13;
  v56[3] = v14;
  v56[4] = v15;
  if (v35 <= *(double *)&v15)
  {
    id v24 = [(CPSManeuversCardView *)v72 secondaryManeuverView];
    [(CPSManeuversCardView *)v72 setShowSecondaryManeuverView:v24 != 0];
  }
  else
  {
    id v34 = [(CPSManeuversCardView *)v72 secondaryManeuverView];

    if (v34)
    {
      v56[0] = 0;
      v32 = [(CPSManeuversCardView *)v72 maneuvers];
      id v31 = [(NSArray *)v32 firstObject];
      id v33 = (id)[v31 junctionImage];

      if (v33)
      {
        id v30 = [(CPSManeuversCardView *)v72 primaryManeuverView];
        id v16 = -[CPSPrimaryManeuverView shortestJunctionViewlayoutConfigurationForSize:](v30, "shortestJunctionViewlayoutConfigurationForSize:", *(double *)&v62, *((double *)&v62 + 1));
        id v17 = v56[0];
        v56[0] = v16;
      }
      char v54 = 0;
      char v52 = 0;
      BOOL v29 = 0;
      if (!v56[0])
      {
        id v55 = (id)[v60[0] instruction];
        char v54 = 1;
        BOOL v28 = 1;
        if (!v55)
        {
          id v53 = (id)[v60[0] attributedInstruction];
          char v52 = 1;
          BOOL v28 = v53 != 0;
        }
        BOOL v29 = v28;
      }
      if (v52) {

      }
      if (v54) {
      if (v29)
      }
      {
        v27 = [(CPSManeuversCardView *)v72 primaryManeuverView];
        id v18 = -[CPSPrimaryManeuverView shortestInstructionlayoutConfigurationForSize:](v27, "shortestInstructionlayoutConfigurationForSize:", *(double *)&v62, *((double *)&v62 + 1));
        id v19 = v56[0];
        v56[0] = v18;
      }
      if (v56[0]
        && ([v56[0] height], double v26 = v20 + v59, -[CPSManeuversCardView bounds](v72, "bounds"), v26 <= v21))
      {
        objc_storeStrong(v60, v56[0]);
        [(CPSManeuversCardView *)v72 setShowSecondaryManeuverView:1];
      }
      else
      {
        [(CPSManeuversCardView *)v72 setShowSecondaryManeuverView:0];
      }
      v25 = [(CPSManeuversCardView *)v72 secondaryManeuverView];
      [(CPSSecondaryManeuverView *)v25 setHidden:![(CPSManeuversCardView *)v72 showSecondaryManeuverView]];

      objc_storeStrong(v56, 0);
    }
  }
  id v22 = [(CPSManeuversCardView *)v72 primaryManeuverView];
  [(CPSPrimaryManeuverView *)v22 setLayoutConfigurationForIntrinsicSizing:v60[0]];

  v23 = [(CPSManeuversCardView *)v72 primaryManeuverView];
  [(CPSPrimaryManeuverView *)v23 invalidateIntrinsicContentSize];

  [(CPSManeuversCardView *)v72 _updateConstraints];
  objc_storeStrong(v60, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)location[0], (uint64_t)v6);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "showManeuvers: %@ usingDisplayStyles: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong((id *)&v8->_maneuvers, location[0]);
  [(CPSManeuversCardView *)v8 setNeedsLayout];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  double v9 = [(CPSManeuversCardView *)v13 primaryManeuverView];
  double v8 = [(CPSPrimaryManeuverView *)v9 maneuver];
  id v7 = (id)[(CPManeuver *)v8 identifier];
  id v6 = (id)[v11 identifier];
  char v10 = objc_msgSend(v7, "isEqual:");

  if (v10)
  {
    uint64_t v4 = [(CPSManeuversCardView *)v13 primaryManeuverView];
    [(CPSPrimaryManeuverView *)v4 setCurrentTravelEstimates:location[0]];

    [(CPSManeuversCardView *)v13 setNeedsLayout];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)canFitSize:(CGSize)a3
{
  CGSize v7 = a3;
  v6[2] = self;
  v6[1] = (id)a2;
  uint64_t v4 = [(CPSManeuversCardView *)self primaryManeuverView];
  v6[0] = -[CPSPrimaryManeuverView layoutConfigurationForSize:](v4, "layoutConfigurationForSize:", v7.width, v7.height);

  BOOL v5 = v6[0] != 0;
  objc_storeStrong(v6, 0);
  return v5;
}

- (void)setUsesCustomBackgroundColor:(BOOL)a3
{
  BOOL v4 = a3;
  if (self->_usesCustomBackgroundColor != a3)
  {
    self->_usesCustomBackgroundColor = a3;
    id v3 = [(CPSManeuversCardView *)self primaryManeuverView];
    [(CPSPrimaryManeuverView *)v3 setUsesCustomBackgroundColor:v4];

    [(CPSManeuversCardView *)self _updateHairlineBackgroundColor];
    [(CPSManeuversCardView *)self _updateSecondaryManeuverBackgroundColor];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSManeuversCardView;
  [(CPSManeuversCardView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSManeuversCardView *)v5 _updateHairlineBackgroundColor];
  [(CPSManeuversCardView *)v5 _updateSecondaryManeuverBackgroundColor];
  objc_storeStrong(location, 0);
}

- (void)_updateHairlineBackgroundColor
{
  if ([(CPSManeuversCardView *)self usesCustomBackgroundColor])
  {
    double v8 = [(CPSManeuversCardView *)self hairlineView];
    BOOL v4 = (void *)MEMORY[0x263F1C550];
    id v7 = CPSFrameworkBundle();
    id v6 = (id)[(CPSManeuversCardView *)self traitCollection];
    id v5 = (id)objc_msgSend(v4, "colorNamed:inBundle:compatibleWithTraitCollection:", @"GuidanceColor30AlphaLightBlackDarkWhite", v7);
    -[CPSHairlineView setBackgroundColor:](v8, "setBackgroundColor:");
  }
  else
  {
    objc_super v3 = [(CPSManeuversCardView *)self hairlineView];
    id v2 = (id)[MEMORY[0x263F1C550] colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
    -[CPSHairlineView setBackgroundColor:](v3, "setBackgroundColor:");
  }
}

- (void)_updateSecondaryManeuverBackgroundColor
{
  if ([(CPSManeuversCardView *)self usesCustomBackgroundColor])
  {
    double v8 = [(CPSManeuversCardView *)self secondaryManeuverView];
    BOOL v4 = (void *)MEMORY[0x263F1C550];
    id v7 = CPSFrameworkBundle();
    id v6 = (id)[(CPSManeuversCardView *)self traitCollection];
    id v5 = (id)objc_msgSend(v4, "colorNamed:inBundle:compatibleWithTraitCollection:", @"GuidanceColor30AlphaLightWhiteDarkBlack", v7);
    -[CPSSecondaryManeuverView setBackgroundColor:](v8, "setBackgroundColor:");
  }
  else
  {
    objc_super v3 = [(CPSManeuversCardView *)self secondaryManeuverView];
    id v2 = (id)[MEMORY[0x263F1C550] colorWithWhite:0.247058824 alpha:1.0];
    -[CPSSecondaryManeuverView setBackgroundColor:](v3, "setBackgroundColor:");
  }
}

- (void)invalidate
{
  id v2 = [(CPSManeuversCardView *)self primaryManeuverView];
  [(CPSPrimaryManeuverView *)v2 setActiveLayoutConfiguration:"setActiveLayoutConfiguration:"];

  objc_super v3 = [(CPSManeuversCardView *)self primaryManeuverView];
  [(CPSPrimaryManeuverView *)v3 setLayoutConfigurationForIntrinsicSizing:0];

  BOOL v4 = [(CPSManeuversCardView *)self primaryManeuverView];
  [(CPSPrimaryManeuverView *)v4 invalidateIntrinsicContentSize];
}

+ (id)maneuverViewWithManeuver:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = [CPSPrimaryManeuverView alloc];
  id v5 = [(CPSPrimaryManeuverView *)v3 initWithManeuver:location[0]];
  objc_storeStrong(location, 0);

  return v5;
}

+ (id)createPlatterView
{
  v5[2] = a1;
  v5[1] = (id)a2;
  id v2 = [CPSCardPlatterView alloc];
  v5[0] = -[CPSCardPlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5[0] setClipsToBounds:1];
  id v4 = v5[0];
  objc_storeStrong(v5, 0);

  return v4;
}

- (CPSCardPlatterView)cardPlatterView
{
  return self->_cardPlatterView;
}

- (void)setCardPlatterView:(id)a3
{
}

- (BOOL)usesCustomBackgroundColor
{
  return self->_usesCustomBackgroundColor;
}

- (NSArray)maneuvers
{
  return self->_maneuvers;
}

- (void)setManeuvers:(id)a3
{
}

- (CPSPrimaryManeuverView)primaryManeuverView
{
  return self->_primaryManeuverView;
}

- (void)setPrimaryManeuverView:(id)a3
{
}

- (CPSSecondaryManeuverView)secondaryManeuverView
{
  return self->_secondaryManeuverView;
}

- (void)setSecondaryManeuverView:(id)a3
{
}

- (NSMutableArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (BOOL)showSecondaryManeuverView
{
  return self->_showSecondaryManeuverView;
}

- (void)setShowSecondaryManeuverView:(BOOL)a3
{
  self->_showSecondaryManeuverView = a3;
}

- (CPSHairlineView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end