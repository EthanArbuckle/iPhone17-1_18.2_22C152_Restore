@interface CPSDashboardManeuversCardView
- (BOOL)allowsCustomBackgroundColorForManeuver;
- (BOOL)showSecondaryManeuverView;
- (BOOL)wantsLargeSize;
- (CGSize)intrinsicContentSize;
- (CPSDashboardManeuversCardView)initWithFrame:(CGRect)a3;
- (CPSDashboardSecondaryManeuverView)secondaryManeuverView;
- (CPSPrimaryManeuverView)primaryManeuverView;
- (NSArray)maneuvers;
- (NSArray)secondaryManeveuverConstraints;
- (void)_updateConstraints;
- (void)_updateStyleOverridesForSubviews;
- (void)layoutSubviews;
- (void)setAllowsCustomBackgroundColorForManeuver:(BOOL)a3;
- (void)setManeuvers:(id)a3;
- (void)setPrimaryManeuverView:(id)a3;
- (void)setSecondaryManeuverView:(id)a3;
- (void)setSecondaryManeveuverConstraints:(id)a3;
- (void)setShowSecondaryManeuverView:(BOOL)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)updateEstimates:(id)a3 forManeuver:(id)a4;
@end

@implementation CPSDashboardManeuversCardView

- (CPSDashboardManeuversCardView)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSDashboardManeuversCardView;
  v7 = -[CPSDashboardManeuversCardView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  if (v7) {
    [(CPSDashboardManeuversCardView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  [(CPSDashboardManeuversCardView *)self bounds];
  CGRectGetWidth(v18);
  CGSizeMake_4();
  double v13 = v2;
  double v14 = v3;
  v9 = [(CPSDashboardManeuversCardView *)self primaryManeuverView];
  [(CPSPrimaryManeuverView *)v9 bounds];
  double v15 = v14 + v4;

  char v10 = 0;
  if ([(CPSDashboardManeuversCardView *)self showSecondaryManeuverView])
  {
    v11 = [(CPSDashboardManeuversCardView *)self secondaryManeuverView];
    char v10 = 1;
    [(CPSDashboardSecondaryManeuverView *)v11 bounds];
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
  v56[3] = *MEMORY[0x263EF8340];
  v52 = self;
  v51[1] = (id)a2;
  v49 = [(CPSDashboardManeuversCardView *)self primaryManeuverView];

  if (v49)
  {
    v51[0] = objc_alloc_init(MEMORY[0x263EFF980]);
    v47 = [(CPSDashboardManeuversCardView *)v52 primaryManeuverView];
    id v46 = (id)[(CPSPrimaryManeuverView *)v47 topAnchor];
    id v45 = (id)[(CPSDashboardManeuversCardView *)v52 topAnchor];
    id v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:constant:", 0.0);
    v56[0] = v44;
    v43 = [(CPSDashboardManeuversCardView *)v52 primaryManeuverView];
    id v42 = (id)[(CPSPrimaryManeuverView *)v43 leadingAnchor];
    id v41 = (id)[(CPSDashboardManeuversCardView *)v52 leadingAnchor];
    id v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:");
    v56[1] = v40;
    v39 = [(CPSDashboardManeuversCardView *)v52 primaryManeuverView];
    id v38 = (id)[(CPSPrimaryManeuverView *)v39 trailingAnchor];
    id v37 = (id)[(CPSDashboardManeuversCardView *)v52 trailingAnchor];
    id v36 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
    v56[2] = v36;
    id v35 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
    objc_msgSend(v51[0], "addObjectsFromArray:");

    v48 = [(CPSDashboardManeuversCardView *)v52 secondaryManeuverView];
    if (v48)
    {
      v34 = [(CPSDashboardManeuversCardView *)v52 secondaryManeveuverConstraints];

      if (v34)
      {
        v32 = (void *)MEMORY[0x263F08938];
        v33 = [(CPSDashboardManeuversCardView *)v52 secondaryManeveuverConstraints];
        objc_msgSend(v32, "deactivateConstraints:");

        [(CPSDashboardManeuversCardView *)v52 setSecondaryManeveuverConstraints:0];
      }
      id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
      v31 = [(CPSDashboardManeuversCardView *)v52 primaryManeuverView];
      id v30 = (id)[(CPSPrimaryManeuverView *)v31 bottomAnchor];
      v29 = [(CPSDashboardManeuversCardView *)v52 secondaryManeuverView];
      id v28 = (id)[(CPSDashboardSecondaryManeuverView *)v29 topAnchor];
      id v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", 0.0);
      v55[0] = v27;
      v26 = [(CPSDashboardManeuversCardView *)v52 secondaryManeuverView];
      id v25 = (id)[(CPSDashboardSecondaryManeuverView *)v26 leadingAnchor];
      id v24 = (id)[(CPSDashboardManeuversCardView *)v52 leadingAnchor];
      id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
      v55[1] = v23;
      v22 = [(CPSDashboardManeuversCardView *)v52 secondaryManeuverView];
      id v21 = (id)[(CPSDashboardSecondaryManeuverView *)v22 trailingAnchor];
      id v20 = (id)[(CPSDashboardManeuversCardView *)v52 trailingAnchor];
      id v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
      v55[2] = v19;
      CGRect v18 = [(CPSDashboardManeuversCardView *)v52 secondaryManeuverView];
      id v17 = (id)[(CPSDashboardSecondaryManeuverView *)v18 bottomAnchor];
      id v16 = (id)[(CPSDashboardManeuversCardView *)v52 bottomAnchor];
      id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
      v55[3] = v15;
      id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
      objc_msgSend(v50, "addObjectsFromArray:");

      if (![(CPSDashboardManeuversCardView *)v52 showSecondaryManeuverView])
      {
        double v13 = [(CPSDashboardManeuversCardView *)v52 secondaryManeuverView];
        id v12 = (id)[(CPSDashboardSecondaryManeuverView *)v13 heightAnchor];
        id v11 = (id)[v12 constraintEqualToConstant:0.0];
        id v54 = v11;
        id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
        objc_msgSend(v50, "addObjectsFromArray:");
      }
      [(CPSDashboardManeuversCardView *)v52 setSecondaryManeveuverConstraints:v50];
      id v8 = v51[0];
      v9 = [(CPSDashboardManeuversCardView *)v52 secondaryManeveuverConstraints];
      objc_msgSend(v8, "addObjectsFromArray:");

      objc_storeStrong(&v50, 0);
    }
    else
    {
      double v7 = [(CPSDashboardManeuversCardView *)v52 primaryManeuverView];
      id v6 = (id)[(CPSPrimaryManeuverView *)v7 bottomAnchor];
      id v5 = (id)[(CPSDashboardManeuversCardView *)v52 bottomAnchor];
      id v4 = (id)objc_msgSend(v6, "constraintEqualToAnchor:constant:", 0.0);
      id v53 = v4;
      id v3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
      objc_msgSend(v51[0], "addObjectsFromArray:");
    }
    objc_msgSend(MEMORY[0x263F08938], "activateConstraints:", v51[0], v51);
    objc_storeStrong(v2, 0);
  }
}

- (void)_updateStyleOverridesForSubviews
{
  id v20 = self;
  location[1] = (id)a2;
  id v15 = [(CPSDashboardManeuversCardView *)self primaryManeuverView];
  id v16 = [(CPSPrimaryManeuverView *)v15 maneuver];
  id v17 = [(CPManeuver *)v16 cardBackgroundColor];
  BOOL allowsCustomBackgroundColorForManeuver = 0;
  if (v17) {
    BOOL allowsCustomBackgroundColorForManeuver = v20->_allowsCustomBackgroundColorForManeuver;
  }

  if (allowsCustomBackgroundColorForManeuver)
  {
    id v5 = [(CPSDashboardManeuversCardView *)v20 primaryManeuverView];
    id v4 = [(CPSPrimaryManeuverView *)v5 maneuver];
    id v3 = [(CPManeuver *)v4 cardBackgroundColor];
    -[CPSDashboardManeuversCardView setBackgroundColor:](v20, "setBackgroundColor:");

    id v10 = [(CPSDashboardManeuversCardView *)v20 secondaryManeuverView];
    id v6 = (void *)MEMORY[0x263F1C550];
    id v9 = CPSFrameworkBundle();
    id v8 = (id)[(CPSDashboardManeuversCardView *)v20 traitCollection];
    id v7 = (id)objc_msgSend(v6, "colorNamed:inBundle:compatibleWithTraitCollection:", @"GuidanceColor30AlphaLightWhiteDarkBlack", v9);
    -[CPSDashboardSecondaryManeuverView setBackgroundColor:](v10, "setBackgroundColor:");

    id v12 = (id)[(CPSDashboardManeuversCardView *)v20 backgroundColor];
    id v11 = (id)[(CPSDashboardManeuversCardView *)v20 traitCollection];
    location[0] = (id)objc_msgSend(v12, "resolvedColorWithTraitCollection:");

    id v14 = (id)CPContrastingColorForColor();
    id v13 = (id)[MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v14, "isEqual:");

    id v2 = (id)[(CPSDashboardManeuversCardView *)v20 subviews];
    objc_msgSend(v2, "enumerateObjectsUsingBlock:");

    objc_storeStrong(location, 0);
  }
}

void __65__CPSDashboardManeuversCardView__updateStyleOverridesForSubviews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setOverrideUserInterfaceStyle:a1[4]];
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  v75 = self;
  SEL v74 = a2;
  v73.receiver = self;
  v73.super_class = (Class)CPSDashboardManeuversCardView;
  [(CPSDashboardManeuversCardView *)&v73 layoutSubviews];
  v52 = [(CPSDashboardManeuversCardView *)v75 primaryManeuverView];
  char v71 = 0;
  BOOL v53 = 0;
  if (!v52)
  {
    v72 = [(CPSDashboardManeuversCardView *)v75 maneuvers];
    char v71 = 1;
    BOOL v53 = [(NSArray *)v72 count] != 0;
  }
  if (v71) {

  }
  if (v53)
  {
    v49 = [CPSDashboardPrimaryManeuverView alloc];
    v51 = [(CPSDashboardManeuversCardView *)v75 maneuvers];
    id v50 = [(NSArray *)v51 firstObject];
    v70 = -[CPSPrimaryManeuverView initWithManeuver:](v49, "initWithManeuver:");

    [(CPSDashboardManeuversCardView *)v75 addSubview:v70];
    [(CPSDashboardManeuversCardView *)v75 setPrimaryManeuverView:v70];
    objc_storeStrong((id *)&v70, 0);
  }
  v47 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];
  char v68 = 0;
  BOOL v48 = 0;
  if (!v47)
  {
    v69 = [(CPSDashboardManeuversCardView *)v75 maneuvers];
    char v68 = 1;
    BOOL v48 = [(NSArray *)v69 count] > 1;
  }
  if (v68) {

  }
  if (v48)
  {
    id v45 = [CPSDashboardSecondaryManeuverView alloc];
    id v46 = [(NSArray *)v75->_maneuvers objectAtIndex:1];
    v67 = -[CPSDashboardSecondaryManeuverView initWithManeuver:](v45, "initWithManeuver:");

    [(CPSDashboardManeuversCardView *)v75 addSubview:v67];
    [(CPSDashboardManeuversCardView *)v75 setSecondaryManeuverView:v67];
    objc_storeStrong((id *)&v67, 0);
  }
  [(CPSDashboardManeuversCardView *)v75 _updateStyleOverridesForSubviews];
  [(CPSDashboardManeuversCardView *)v75 bounds];
  v64[1] = v2;
  v64[2] = v3;
  *(void *)&long long v65 = v4;
  *((void *)&v65 + 1) = v5;
  long long v66 = v65;
  v64[0] = 0;
  v43 = [(CPSDashboardManeuversCardView *)v75 maneuvers];
  id v42 = [(NSArray *)v43 firstObject];
  id v44 = (id)[v42 junctionImage];

  if (v44)
  {
    id v41 = [(CPSDashboardManeuversCardView *)v75 primaryManeuverView];
    id v6 = [(CPSPrimaryManeuverView *)v41 shortestJunctionViewlayoutConfigurationForSize:v66];
    id v7 = v64[0];
    v64[0] = v6;
  }
  if (!v64[0])
  {
    id v40 = [(CPSDashboardManeuversCardView *)v75 primaryManeuverView];
    v64[0] = [(CPSPrimaryManeuverView *)v40 layoutConfigurationForSize:v66];
  }
  double v63 = 0.0;
  v39 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];

  if (v39)
  {
    id v37 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];
    [(CPSDashboardManeuversCardView *)v75 bounds];
    v60[5] = v8;
    v60[6] = v9;
    *(double *)&long long v61 = v10;
    *((double *)&v61 + 1) = v11;
    long long v62 = v61;
    -[CPSSecondaryManeuverView generateLayoutConfigurationsForSizeIfNecessary:force:](v37, "generateLayoutConfigurationsForSizeIfNecessary:force:", 0, v10, v11);

    id v38 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];
    [(CPSSecondaryManeuverView *)v38 generatedHeight];
    double v63 = v12;
  }
  [v64[0] height];
  double v36 = v13 + v63;
  [(CPSDashboardManeuversCardView *)v75 bounds];
  v60[1] = v14;
  v60[2] = v15;
  v60[3] = v16;
  v60[4] = v17;
  if (v36 <= *(double *)&v17)
  {
    v26 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];
    [(CPSDashboardManeuversCardView *)v75 setShowSecondaryManeuverView:v26 != 0];
  }
  else
  {
    id v35 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];

    if (v35)
    {
      v60[0] = 0;
      v33 = [(CPSDashboardManeuversCardView *)v75 maneuvers];
      id v32 = [(NSArray *)v33 firstObject];
      id v34 = (id)[v32 junctionImage];

      if (v34)
      {
        v31 = [(CPSDashboardManeuversCardView *)v75 primaryManeuverView];
        id v18 = [(CPSPrimaryManeuverView *)v31 shortestJunctionViewlayoutConfigurationForSize:v66];
        id v19 = v60[0];
        v60[0] = v18;
      }
      if (!v60[0])
      {
        id v30 = [(CPSDashboardManeuversCardView *)v75 primaryManeuverView];
        v60[0] = [(CPSPrimaryManeuverView *)v30 shortestInstructionlayoutConfigurationForSize:v66];
      }
      if (v60[0]
        && ([v60[0] height],
            double v29 = v20 + v63,
            [(CPSDashboardManeuversCardView *)v75 bounds],
            v59[1] = v21,
            v59[2] = v22,
            v59[3] = v23,
            v59[4] = v24,
            v29 <= *(double *)&v24))
      {
        -[CPSDashboardManeuversCardView setShowSecondaryManeuverView:](v75, "setShowSecondaryManeuverView:", 1, v29);
        id v27 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];
        [(CPSDashboardSecondaryManeuverView *)v27 setHidden:0];
      }
      else
      {
        [(CPSDashboardManeuversCardView *)v75 setShowSecondaryManeuverView:0];
        id v28 = [(CPSDashboardManeuversCardView *)v75 secondaryManeuverView];
        [(CPSDashboardSecondaryManeuverView *)v28 setHidden:1];
      }
      objc_storeStrong(v60, 0);
    }
  }
  id v25 = (void *)MEMORY[0x263F1CB60];
  uint64_t v54 = MEMORY[0x263EF8330];
  int v55 = -1073741824;
  int v56 = 0;
  v57 = __47__CPSDashboardManeuversCardView_layoutSubviews__block_invoke;
  v58 = &unk_2648A3BE0;
  v59[0] = v75;
  [v25 performWithoutAnimation:&v54];
  objc_storeStrong(v59, 0);
  objc_storeStrong(v64, 0);
}

uint64_t __47__CPSDashboardManeuversCardView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v8 = self;
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
  [(CPSDashboardManeuversCardView *)v8 setNeedsLayout];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  double v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v9 = [(CPSDashboardManeuversCardView *)v13 primaryManeuverView];
  id v8 = [(CPSPrimaryManeuverView *)v9 maneuver];
  id v7 = (id)[(CPManeuver *)v8 identifier];
  id v6 = (id)[v11 identifier];
  char v10 = objc_msgSend(v7, "isEqual:");

  if (v10)
  {
    uint64_t v4 = [(CPSDashboardManeuversCardView *)v13 primaryManeuverView];
    [(CPSPrimaryManeuverView *)v4 setCurrentTravelEstimates:location[0]];

    [(CPSDashboardManeuversCardView *)v13 setNeedsLayout];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)wantsLargeSize
{
  id v18 = self;
  v17[1] = (id)a2;
  id v11 = [(CPSDashboardManeuversCardView *)self maneuvers];
  id v10 = [(NSArray *)v11 firstObject];
  id v12 = (id)[v10 junctionImage];

  if (v12)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = (id)[(CPSDashboardManeuversCardView *)v18 window];
    v17[0] = CPSSafeCast_8(v5, v6);

    id v8 = (id)[v17[0] widgetSizes];
    id v7 = (id)[v8 lastObject];
    [v7 CGSizeValue];
    uint64_t v15 = v2;
    double v16 = v3;

    *(void *)&long long v14 = v15;
    *((double *)&v14 + 1) = v16 - 12.0;
    id v9 = [(CPSDashboardManeuversCardView *)v18 primaryManeuverView];
    id v13 = [(CPSPrimaryManeuverView *)v9 shortestJunctionViewlayoutConfigurationForSize:v14];

    BOOL v19 = v13 != 0;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v17, 0);
  }
  else
  {
    return 0;
  }
  return v19;
}

- (BOOL)allowsCustomBackgroundColorForManeuver
{
  return self->_allowsCustomBackgroundColorForManeuver;
}

- (void)setAllowsCustomBackgroundColorForManeuver:(BOOL)a3
{
  self->_BOOL allowsCustomBackgroundColorForManeuver = a3;
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

- (CPSDashboardSecondaryManeuverView)secondaryManeuverView
{
  return self->_secondaryManeuverView;
}

- (void)setSecondaryManeuverView:(id)a3
{
}

- (NSArray)secondaryManeveuverConstraints
{
  return self->_secondaryManeveuverConstraints;
}

- (void)setSecondaryManeveuverConstraints:(id)a3
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

- (void).cxx_destruct
{
}

@end