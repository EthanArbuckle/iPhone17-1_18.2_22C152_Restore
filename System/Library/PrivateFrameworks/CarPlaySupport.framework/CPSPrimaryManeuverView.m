@interface CPSPrimaryManeuverView
+ (id)instructionsForManeuver:(id)a3;
+ (id)junctionImageForManeuver:(id)a3;
+ (id)symbolImageForManeuver:(id)a3;
- (BOOL)calculationViewIsSizing;
- (BOOL)centersManeuverInView;
- (BOOL)fitJunctionViewToHeight;
- (BOOL)hasJunctionImageBackground;
- (BOOL)usesCustomBackgroundColor;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CPManeuver)maneuver;
- (CPSAbridgableLabel)subtitleLabel;
- (CPSAbridgableLabel)titleLabel;
- (CPSAspectFitImageView)junctionImageView;
- (CPSPrimaryManeuverLayoutConfiguration)activeLayoutConfiguration;
- (CPSPrimaryManeuverLayoutConfiguration)layoutConfigurationForIntrinsicSizing;
- (CPSPrimaryManeuverView)initWithManeuver:(id)a3;
- (CPTravelEstimates)currentTravelEstimates;
- (NSArray)activeLayoutConstraints;
- (NSArray)layoutConfigurations;
- (UIImageView)symbolImageView;
- (UILayoutGuide)centeringLayoutGuide;
- (UILayoutGuide)labelCenteringLayoutGuide;
- (UILayoutGuide)yCenteringGuide;
- (UIView)junctionImageBackgroundView;
- (double)generatedWidth;
- (double)symbolImageHeight;
- (id)_formattedDistance;
- (id)_fullLayoutConstraints;
- (id)_fullLayoutNoJunctionViewConstraints;
- (id)_fullLayoutNoJunctionViewWideImageConstraints;
- (id)_fullLayoutWideImageConstraints;
- (id)_fullSubtitleNextToImageConstraints;
- (id)_init;
- (id)_junctionViewNoInstructionWideImageConstraints;
- (id)_junctionViewNoSubtitleConstraints;
- (id)_minimalLayoutConstraints;
- (id)_minimalLayoutWideImageConstraints;
- (id)_subtitleFont;
- (id)_titleFont;
- (id)junctionBackgroundColor;
- (id)layoutConfigurationForSize:(CGSize)a3;
- (id)shortestInstructionlayoutConfigurationForSize:(CGSize)a3;
- (id)shortestJunctionViewlayoutConfigurationForSize:(CGSize)a3;
- (int64_t)_compareInstruction:(id)a3 toInstruction:(id)a4;
- (void)_activateFullLayoutConstraints;
- (void)_activateFullLayoutWideImageConstraints;
- (void)_activateFullNoJunctionViewLayoutConstraints;
- (void)_activateFullNoJunctionViewWideImageLayoutConstraints;
- (void)_activateFullSubtitleNextToImageConstraints;
- (void)_activateJunctionViewNoInstructionConstraints;
- (void)_activateJunctionViewNoInstructionWideImageConstraints;
- (void)_activateMinimalLayoutConstraints;
- (void)_activateMinimalWideImageLayoutConstraints;
- (void)_generateLayoutConfigurationsForSizeIfNecessary:(CGSize)a3 force:(BOOL)a4;
- (void)_switchToLayoutConfiguration:(id)a3;
- (void)_updateJunctionBackgroundColor;
- (void)_updateSubtitleTextColor;
- (void)layoutSubviews;
- (void)setActiveLayoutConfiguration:(id)a3;
- (void)setActiveLayoutConstraints:(id)a3;
- (void)setCalculationViewIsSizing:(BOOL)a3;
- (void)setCenteringLayoutGuide:(id)a3;
- (void)setCurrentTravelEstimates:(id)a3;
- (void)setGeneratedWidth:(double)a3;
- (void)setJunctionImageBackgroundView:(id)a3;
- (void)setJunctionImageView:(id)a3;
- (void)setLabelCenteringLayoutGuide:(id)a3;
- (void)setLayoutConfigurationForIntrinsicSizing:(id)a3;
- (void)setLayoutConfigurations:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUsesCustomBackgroundColor:(BOOL)a3;
- (void)setYCenteringGuide:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSPrimaryManeuverView

- (double)symbolImageHeight
{
  return 50.0;
}

- (CPSPrimaryManeuverView)initWithManeuver:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v9 = [(CPSPrimaryManeuverView *)v3 _init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v9->_maneuver, location[0]);
    v4 = (CPTravelEstimates *)(id)[location[0] initialTravelEstimates];
    currentTravelEstimates = v9->_currentTravelEstimates;
    v9->_currentTravelEstimates = v4;
  }
  v7 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (BOOL)centersManeuverInView
{
  return 0;
}

- (id)_init
{
  v45[1] = *MEMORY[0x263EF8340];
  SEL v42 = a2;
  v43 = 0;
  v41.receiver = self;
  v41.super_class = (Class)CPSPrimaryManeuverView;
  v43 = [(CPSPrimaryManeuverView *)&v41 init];
  objc_storeStrong((id *)&v43, v43);
  if (v43)
  {
    [(CPSPrimaryManeuverView *)v43 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSPrimaryManeuverView *)v43 setClipsToBounds:1];
    v2 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    centeringLayoutGuide = v43->_centeringLayoutGuide;
    v43->_centeringLayoutGuide = v2;

    [(CPSPrimaryManeuverView *)v43 addLayoutGuide:v43->_centeringLayoutGuide];
    v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    labelCenteringLayoutGuide = v43->_labelCenteringLayoutGuide;
    v43->_labelCenteringLayoutGuide = v4;

    [(CPSPrimaryManeuverView *)v43 addLayoutGuide:v43->_labelCenteringLayoutGuide];
    v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    yCenteringGuide = v43->_yCenteringGuide;
    v43->_yCenteringGuide = v6;

    [(CPSPrimaryManeuverView *)v43 addLayoutGuide:v43->_yCenteringGuide];
    id v40 = objc_alloc_init(CPSAbridgableLabel);
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v40, "setNumberOfLines:");
    id v29 = (id)[MEMORY[0x263F1C550] labelColor];
    objc_msgSend(v40, "setTextColor:");

    id v30 = [(CPSPrimaryManeuverView *)v43 _titleFont];
    objc_msgSend(v40, "setFont:");

    objc_msgSend(v40, "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v8) = 1148846080;
    [v40 setContentCompressionResistancePriority:0 forAxis:v8];
    [(CPSPrimaryManeuverView *)v43 addSubview:v40];
    objc_storeStrong((id *)&v43->_titleLabel, v40);
    id v39 = objc_alloc_init(CPSAbridgableLabel);
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v39 setNumberOfLines:0];
    id v31 = [(CPSPrimaryManeuverView *)v43 _subtitleFont];
    objc_msgSend(v39, "setFont:");

    LODWORD(v9) = 1148846080;
    [v39 setContentCompressionResistancePriority:1 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [v39 setContentCompressionResistancePriority:0 forAxis:v10];
    [(CPSPrimaryManeuverView *)v43 addSubview:v39];
    objc_storeStrong((id *)&v43->_subtitleLabel, v39);
    id v38 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v38 setContentMode:1];
    LODWORD(v11) = 1148846080;
    [v38 setContentCompressionResistancePriority:1 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [v38 setContentCompressionResistancePriority:0 forAxis:v12];
    [(CPSPrimaryManeuverView *)v43 addSubview:v38];
    objc_storeStrong((id *)&v43->_symbolImageView, v38);
    id v37 = objc_alloc_init(CPSAspectFitImageView);
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSPrimaryManeuverView *)v43 addSubview:v37];
    objc_storeStrong((id *)&v43->_junctionImageView, v37);
    v32 = (void *)MEMORY[0x263F08938];
    id v35 = (id)[v37 heightAnchor];
    id v34 = (id)[v35 constraintLessThanOrEqualToConstant:154.0];
    v45[0] = v34;
    id v33 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
    objc_msgSend(v32, "activateConstraints:");

    if ([(CPSPrimaryManeuverView *)v43 hasJunctionImageBackground])
    {
      id v36 = objc_alloc_init(MEMORY[0x263F1CB60]);
      [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CPSPrimaryManeuverView *)v43 insertSubview:v36 belowSubview:v37];
      objc_storeStrong((id *)&v43->_junctionImageBackgroundView, v36);
      v15 = (void *)MEMORY[0x263F08938];
      id v28 = (id)[v36 topAnchor];
      id v27 = (id)[v37 topAnchor];
      id v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
      v44[0] = v26;
      id v25 = (id)[v36 bottomAnchor];
      id v24 = (id)[v37 bottomAnchor];
      id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
      v44[1] = v23;
      id v22 = (id)[v36 leadingAnchor];
      id v21 = (id)[(CPSPrimaryManeuverView *)v43 leadingAnchor];
      id v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
      v44[2] = v20;
      id v19 = (id)[v36 trailingAnchor];
      id v18 = (id)[(CPSPrimaryManeuverView *)v43 trailingAnchor];
      id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
      v44[3] = v17;
      id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
      objc_msgSend(v15, "activateConstraints:");

      [(CPSPrimaryManeuverView *)v43 _updateJunctionBackgroundColor];
      objc_storeStrong(&v36, 0);
    }
    [(CPSPrimaryManeuverView *)v43 _updateSubtitleTextColor];
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  v14 = v43;
  objc_storeStrong((id *)&v43, 0);
  return v14;
}

- (id)layoutConfigurationForSize:(CGSize)a3
{
  CGSize v17 = a3;
  id v16 = self;
  v15[2] = (id)a2;
  -[CPSPrimaryManeuverView _generateLayoutConfigurationsForSizeIfNecessary:force:](self, "_generateLayoutConfigurationsForSizeIfNecessary:force:", 0, a3.width, a3.height);
  v15[1] = *(id *)&v17.height;
  uint64_t v9 = 0;
  double v10 = &v9;
  int v11 = 838860800;
  int v12 = 48;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15[0] = 0;
  double v8 = [(CPSPrimaryManeuverView *)v16 maneuver];
  v7 = [(CPManeuver *)v8 junctionImage];

  if (v7)
  {
    v6 = [(CPSPrimaryManeuverView *)v16 layoutConfigurations];
    -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:");
  }
  if (!v10[5])
  {
    v5 = [(CPSPrimaryManeuverView *)v16 layoutConfigurations];
    -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:");
  }
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  objc_storeStrong(v15, 0);

  return v4;
}

void __53__CPSPrimaryManeuverView_layoutConfigurationForSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = (id)[location[0] junctionImage];

  if (v7)
  {
    [location[0] height];
    if (v4 <= *(double *)(a1 + 40))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), location[0]);
      *a4 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __53__CPSPrimaryManeuverView_layoutConfigurationForSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] height];
  if (v4 <= *(double *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)shortestInstructionlayoutConfigurationForSize:(CGSize)a3
{
  CGSize v14 = a3;
  v13 = self;
  v12[2] = (id)a2;
  -[CPSPrimaryManeuverView _generateLayoutConfigurationsForSizeIfNecessary:force:](self, "_generateLayoutConfigurationsForSizeIfNecessary:force:", 0, a3.width, a3.height);
  v12[1] = *(id *)&v14.height;
  uint64_t v6 = 0;
  id v7 = &v6;
  int v8 = 838860800;
  int v9 = 48;
  double v10 = __Block_byref_object_copy__1;
  int v11 = __Block_byref_object_dispose__1;
  v12[0] = 0;
  v5 = [(CPSPrimaryManeuverView *)v13 layoutConfigurations];
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:");

  id v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(v12, 0);

  return v4;
}

void __72__CPSPrimaryManeuverView_shortestInstructionlayoutConfigurationForSize___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = (id)[location[0] instruction];
  char v15 = 0;
  BOOL v10 = 1;
  if (!v9)
  {
    id v16 = (id)[location[0] attributedInstruction];
    char v15 = 1;
    BOOL v10 = v16 != 0;
  }
  if (v15) {

  }
  if (v10)
  {
    [location[0] height];
    if (v2 <= *(double *)(a1 + 40))
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
        goto LABEL_17;
      }
      [location[0] height];
      double v6 = v3;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) height];
      char v13 = 0;
      char v11 = 0;
      BOOL v7 = 0;
      if (v6 < v4)
      {
        id v14 = (id)objc_msgSend(location[0], "instruction", v6);
        char v13 = 1;
        BOOL v5 = 1;
        if (!v14)
        {
          id v12 = (id)[location[0] attributedInstruction];
          char v11 = 1;
          BOOL v5 = v12 != 0;
        }
        BOOL v7 = v5;
      }
      if (v11) {

      }
      if (v13) {
      if (v7)
      }
LABEL_17:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), location[0]);
    }
  }
  objc_storeStrong(location, 0);
}

- (id)shortestJunctionViewlayoutConfigurationForSize:(CGSize)a3
{
  CGSize v14 = a3;
  char v13 = self;
  v12[2] = (id)a2;
  -[CPSPrimaryManeuverView _generateLayoutConfigurationsForSizeIfNecessary:force:](self, "_generateLayoutConfigurationsForSizeIfNecessary:force:", 1, a3.width, a3.height);
  v12[1] = *(id *)&v14.height;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  int v8 = 838860800;
  int v9 = 48;
  BOOL v10 = __Block_byref_object_copy__1;
  char v11 = __Block_byref_object_dispose__1;
  v12[0] = 0;
  BOOL v5 = [(CPSPrimaryManeuverView *)v13 layoutConfigurations];
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:");

  id v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(v12, 0);

  return v4;
}

void __73__CPSPrimaryManeuverView_shortestJunctionViewlayoutConfigurationForSize___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = (id)[location[0] junctionImage];

  if (v7)
  {
    [location[0] height];
    if (v2 <= *(double *)(a1 + 40))
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
        || ([location[0] height],
            double v5 = v3,
            [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) height],
            v5 < v4))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), location[0]);
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (void)setCurrentTravelEstimates:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_currentTravelEstimates, location[0]);
  id v4 = [(CPSPrimaryManeuverView *)v6 _formattedDistance];
  double v3 = [(CPSPrimaryManeuverView *)v6 titleLabel];
  [(CPSAbridgableLabel *)v3 setText:v4];

  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (CGSize)intrinsicContentSize
{
  v32 = self;
  SEL v31 = a2;
  id v21 = [(CPSPrimaryManeuverView *)self activeLayoutConfiguration];

  if (v21)
  {
    [(CPSPrimaryManeuverView *)v32 bounds];
    uint64_t v27 = v2;
    uint64_t v28 = v3;
    uint64_t v29 = v4;
    uint64_t v30 = v5;
    id v20 = [(CPSPrimaryManeuverView *)v32 activeLayoutConfiguration];
    [(CPSPrimaryManeuverLayoutConfiguration *)v20 height];
    CGSizeMake_6();
    double v33 = v6;
    double v34 = v7;
  }
  else
  {
    id v19 = [(CPSPrimaryManeuverView *)v32 layoutConfigurationForIntrinsicSizing];

    if (v19)
    {
      [(CPSPrimaryManeuverView *)v32 bounds];
      uint64_t v23 = v8;
      uint64_t v24 = v9;
      uint64_t v25 = v10;
      uint64_t v26 = v11;
      id v18 = [(CPSPrimaryManeuverView *)v32 layoutConfigurationForIntrinsicSizing];
      [(CPSPrimaryManeuverLayoutConfiguration *)v18 height];
      CGSizeMake_6();
      double v33 = v12;
      double v34 = v13;
    }
    else
    {
      v22.receiver = v32;
      v22.super_class = (Class)CPSPrimaryManeuverView;
      [(CPSPrimaryManeuverView *)&v22 intrinsicContentSize];
      double v33 = v14;
      double v34 = v15;
    }
  }
  double v16 = v33;
  double v17 = v34;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setActiveLayoutConfiguration:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_activeLayoutConfiguration != location[0])
  {
    objc_storeStrong((id *)&v4->_activeLayoutConfiguration, location[0]);
    [(CPSPrimaryManeuverView *)v4 invalidateIntrinsicContentSize];
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  uint64_t v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)CPSPrimaryManeuverView;
  [(CPSPrimaryManeuverView *)&v8 layoutSubviews];
  if (![(CPSPrimaryManeuverView *)v10 calculationViewIsSizing])
  {
    double v6 = v10;
    [(CPSPrimaryManeuverView *)v10 bounds];
    id v7 = -[CPSPrimaryManeuverView layoutConfigurationForSize:](v6, "layoutConfigurationForSize:", v2, v3);
    if (!v7)
    {
      uint64_t v5 = [(CPSPrimaryManeuverView *)v10 layoutConfigurations];
      id v7 = [(NSArray *)v5 lastObject];
    }
    -[CPSPrimaryManeuverView _switchToLayoutConfiguration:](v10, "_switchToLayoutConfiguration:", v7, &v7);
    objc_storeStrong(location, 0);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGSize v13 = a3;
  double v12 = self;
  SEL v11 = a2;
  double v14 = 0.0;
  double v15 = 0.0;
  v10.receiver = self;
  v10.super_class = (Class)CPSPrimaryManeuverView;
  -[CPSPrimaryManeuverView sizeThatFits:](&v10, sel_sizeThatFits_, a3.width, a3.height);
  double v14 = v3;
  double v15 = v4;
  id location = -[CPSPrimaryManeuverView layoutConfigurationForSize:](v12, "layoutConfigurationForSize:", v13.width, v13.height);
  if (!location)
  {
    objc_super v8 = [(CPSPrimaryManeuverView *)v12 layoutConfigurations];
    id location = [(NSArray *)v8 lastObject];
  }
  if (location)
  {
    [location height];
    double v15 = v5;
  }
  else
  {
    double v15 = 0.0;
  }
  objc_storeStrong(&location, 0);
  double v6 = v14;
  double v7 = v15;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)CPSPrimaryManeuverView;
  [(CPSPrimaryManeuverView *)&v6 traitCollectionDidChange:location[0]];
  double v5 = v8;
  [(CPSPrimaryManeuverView *)v8 bounds];
  -[CPSPrimaryManeuverView _generateLayoutConfigurationsForSizeIfNecessary:force:](v5, "_generateLayoutConfigurationsForSizeIfNecessary:force:", 1, v3, v4);
  [(CPSPrimaryManeuverView *)v8 setNeedsLayout];
  objc_storeStrong(location, 0);
}

- (void)setActiveLayoutConstraints:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_activeLayoutConstraints) {
    [MEMORY[0x263F08938] deactivateConstraints:v4->_activeLayoutConstraints];
  }
  objc_storeStrong((id *)&v4->_activeLayoutConstraints, location[0]);
  [MEMORY[0x263F08938] activateConstraints:v4->_activeLayoutConstraints];
  objc_storeStrong(location, 0);
}

+ (id)instructionsForManeuver:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[location[0] attributedInstructionVariants];
  char v9 = 0;
  char v7 = 0;
  if ([v6 count])
  {
    id v10 = (id)[location[0] attributedInstructionVariants];
    char v9 = 1;
    id v3 = v10;
  }
  else
  {
    id v8 = (id)[location[0] instructionVariants];
    char v7 = 1;
    id v3 = v8;
  }
  id v12 = v3;
  if (v7) {

  }
  if (v9) {
  objc_storeStrong(location, 0);
  }
  double v4 = v12;

  return v4;
}

+ (id)symbolImageForManeuver:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] symbolImage];
  objc_storeStrong(location, 0);

  return v4;
}

+ (id)junctionImageForManeuver:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] junctionImage];
  objc_storeStrong(location, 0);

  return v4;
}

- (void)_generateLayoutConfigurationsForSizeIfNecessary:(CGSize)a3 force:(BOOL)a4
{
  v176[3] = *MEMORY[0x263EF8340];
  CGSize v170 = a3;
  id v169 = self;
  SEL v168 = a2;
  BOOL v167 = a4;
  id v101 = (id)[MEMORY[0x263F1CB00] currentTraitCollection];
  BOOL v102 = [v101 userInterfaceIdiom] == 3;

  BOOL v166 = v102;
  char v165 = BSFloatIsZero() & 1;
  [v169 generatedWidth];
  char v164 = BSFloatEqualToFloat() & 1;
  id v103 = (id)[v169 window];
  char v104 = 1;
  if (v103)
  {
    if (!v166 || (v165 & 1) != 0 || (char v100 = 0, (v164 & 1) != 0)) {
      char v100 = !v167;
    }
    char v104 = v100;
  }

  if ((v104 & 1) == 0)
  {
    id v84 = objc_alloc((Class)objc_opt_class());
    id v85 = (id)[v169 maneuver];
    id v163 = (id)objc_msgSend(v84, "initWithManeuver:");

    [v163 setCalculationViewIsSizing:1];
    id v86 = (id)[v169 window];
    [v86 addSubview:v163];

    [v169 setGeneratedWidth:v170.width];
    v87 = (void *)MEMORY[0x263F08938];
    id v98 = (id)[v163 widthAnchor];
    id v97 = (id)[v98 constraintEqualToConstant:v170.width];
    v176[0] = v97;
    id v96 = (id)[v163 topAnchor];
    id v95 = (id)[v169 window];
    id v94 = (id)[v95 topAnchor];
    id v93 = (id)objc_msgSend(v96, "constraintEqualToAnchor:");
    v176[1] = v93;
    id v92 = (id)[v163 trailingAnchor];
    id v91 = (id)[v169 window];
    id v90 = (id)[v91 leadingAnchor];
    id v89 = (id)objc_msgSend(v92, "constraintEqualToAnchor:");
    v176[2] = v89;
    id v88 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v176 count:3];
    objc_msgSend(v87, "activateConstraints:");

    id v162 = (id)[v169 maneuver];
    id v161 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v160 = (id)[(id)objc_opt_class() instructionsForManeuver:v162];
    id v159 = (id)[(id)objc_opt_class() symbolImageForManeuver:v162];
    id v158 = (id)[(id)objc_opt_class() junctionImageForManeuver:v162];
    id v99 = (id)[v163 symbolImageView];
    [v99 setImage:v159];

    id v157 = (id)[v169 _formattedDistance];
    id v156 = (id)[v163 subtitleLabel];
    if (v157)
    {
      id v83 = (id)[v163 titleLabel];
      [v83 setText:v157];
    }
    else
    {
      id v4 = (id)[v163 titleLabel];
      id v5 = v156;
      id v156 = v4;

      id v82 = (id)[v169 _subtitleFont];
      objc_msgSend(v156, "setFont:");
    }
    BOOL v155 = 0;
    BOOL v81 = 0;
    if (v159)
    {
      [v159 size];
      double v153 = v6;
      uint64_t v154 = v7;
      BOOL v81 = v6 > 50.0;
    }
    BOOL v155 = v81;
    uint64_t v152 = 0;
    if (v158)
    {
      id v79 = (id)[v163 junctionImageView];
      [v79 setImage:v158];

      id v80 = (id)[v163 heightAnchor];
      id v151 = (id)[v80 constraintEqualToConstant:v170.height - 2.0];

      if ([v169 fitJunctionViewToHeight])
      {
        v77 = (void *)MEMORY[0x263F08938];
        id v175 = v151;
        id v78 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v175 count:1];
        objc_msgSend(v77, "activateConstraints:");
      }
      if (v155)
      {
        uint64_t v152 = 2;
        [v163 _activateFullLayoutWideImageConstraints];
      }
      else
      {
        uint64_t v152 = 1;
        [v163 _activateFullLayoutConstraints];
      }
      memset(__b, 0, sizeof(__b));
      id obj = v160;
      uint64_t v76 = [obj countByEnumeratingWithState:__b objects:v174 count:16];
      if (v76)
      {
        uint64_t v72 = *(void *)__b[2];
        uint64_t v73 = 0;
        unint64_t v74 = v76;
        while (1)
        {
          uint64_t v71 = v73;
          if (*(void *)__b[2] != v72) {
            objc_enumerationMutation(obj);
          }
          uint64_t v150 = *(void *)(__b[1] + 8 * v73);
          id location = objc_alloc_init(CPSPrimaryManeuverLayoutConfiguration);
          [location setJunctionImage:v158];
          [location setLayout:v152];
          [location setSymbolImage:v159];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [location setAttributedInstruction:v150];
            [v156 setAttributedText:v150];
          }
          else
          {
            [location setInstruction:v150];
            [v156 setText:v150];
          }
          [v163 setNeedsLayout];
          [v163 layoutIfNeeded];
          id v70 = location;
          [v163 bounds];
          uint64_t v144 = v8;
          uint64_t v145 = v9;
          uint64_t v146 = v10;
          double v147 = v11;
          [v70 setHeight:v11];
          double v143 = 0.0;
          [v158 size];
          uint64_t v140 = v12;
          double v141 = v13;
          double v142 = v13;
          *(double *)&uint64_t v139 = 90.0;
          if (v13 >= 90.0) {
            double v69 = *(double *)&v139;
          }
          else {
            double v69 = v142;
          }
          v138[5] = *(id *)&v69;
          double v143 = v69;
          id v67 = (id)[v163 junctionImageView];
          [v67 frame];
          v138[1] = v14;
          v138[2] = v15;
          v138[3] = v16;
          v138[4] = v17;
          BOOL v68 = *(double *)&v17 < v69;

          if (!v68) {
            [v161 addObject:location];
          }
          objc_storeStrong(&location, 0);
          ++v73;
          if (v71 + 1 >= v74)
          {
            uint64_t v73 = 0;
            unint64_t v74 = [obj countByEnumeratingWithState:__b objects:v174 count:16];
            if (!v74) {
              break;
            }
          }
        }
      }

      if (v155)
      {
        uint64_t v152 = 4;
        [v163 _activateJunctionViewNoInstructionWideImageConstraints];
      }
      else
      {
        uint64_t v152 = 3;
        [v163 _activateJunctionViewNoInstructionConstraints];
      }
      v138[0] = objc_alloc_init(CPSPrimaryManeuverLayoutConfiguration);
      [v138[0] setLayout:v152];
      [v138[0] setSymbolImage:v159];
      [v138[0] setJunctionImage:v158];
      [v163 setNeedsLayout];
      [v163 layoutIfNeeded];
      [v163 bounds];
      uint64_t v134 = v18;
      uint64_t v135 = v19;
      uint64_t v136 = v20;
      double v137 = v21;
      [v138[0] setHeight:v21];
      double v133 = 0.0;
      [v158 size];
      uint64_t v130 = v22;
      double v131 = v23;
      double v132 = v23;
      *(double *)&uint64_t v129 = 90.0;
      if (v23 >= 90.0) {
        double v66 = *(double *)&v129;
      }
      else {
        double v66 = v132;
      }
      double v128 = v66;
      double v133 = v66;
      id v64 = (id)[v163 junctionImageView];
      [v64 frame];
      uint64_t v124 = v24;
      uint64_t v125 = v25;
      uint64_t v126 = v26;
      double v127 = v27;
      BOOL v65 = v27 < v66;

      if (!v65) {
        [v161 addObject:v138[0]];
      }
      if ([v169 fitJunctionViewToHeight])
      {
        v62 = (void *)MEMORY[0x263F08938];
        id v173 = v151;
        id v63 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v173 count:1];
        objc_msgSend(v62, "deactivateConstraints:");
      }
      objc_storeStrong(v138, 0);
      objc_storeStrong(&v151, 0);
    }
    if (v155)
    {
      uint64_t v152 = 6;
      [v163 _activateFullNoJunctionViewWideImageLayoutConstraints];
    }
    else
    {
      uint64_t v152 = 5;
      [v163 _activateFullNoJunctionViewLayoutConstraints];
    }
    memset(v122, 0, sizeof(v122));
    id v60 = v160;
    uint64_t v61 = [v60 countByEnumeratingWithState:v122 objects:v172 count:16];
    if (v61)
    {
      uint64_t v57 = *(void *)v122[2];
      uint64_t v58 = 0;
      unint64_t v59 = v61;
      while (1)
      {
        uint64_t v56 = v58;
        if (*(void *)v122[2] != v57) {
          objc_enumerationMutation(v60);
        }
        uint64_t v123 = *(void *)(v122[1] + 8 * v58);
        v121 = objc_alloc_init(CPSPrimaryManeuverLayoutConfiguration);
        [(CPSPrimaryManeuverLayoutConfiguration *)v121 setLayout:v152];
        [(CPSPrimaryManeuverLayoutConfiguration *)v121 setSymbolImage:v159];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CPSPrimaryManeuverLayoutConfiguration *)v121 setAttributedInstruction:v123];
          [v156 setAttributedText:v123];
        }
        else
        {
          [(CPSPrimaryManeuverLayoutConfiguration *)v121 setInstruction:v123];
          [v156 setText:v123];
        }
        [v163 setNeedsLayout];
        [v163 layoutIfNeeded];
        v55 = v121;
        [v163 bounds];
        uint64_t v117 = v28;
        uint64_t v118 = v29;
        uint64_t v119 = v30;
        double v120 = v31;
        [(CPSPrimaryManeuverLayoutConfiguration *)v55 setHeight:v31];
        [v161 addObject:v121];
        objc_storeStrong((id *)&v121, 0);
        ++v58;
        if (v56 + 1 >= v59)
        {
          uint64_t v58 = 0;
          unint64_t v59 = [v60 countByEnumeratingWithState:v122 objects:v172 count:16];
          if (!v59) {
            break;
          }
        }
      }
    }

    if (!v155)
    {
      [v163 _activateFullSubtitleNextToImageConstraints];
      memset(v115, 0, sizeof(v115));
      id v53 = v160;
      uint64_t v54 = [v53 countByEnumeratingWithState:v115 objects:v171 count:16];
      if (v54)
      {
        uint64_t v50 = *(void *)v115[2];
        uint64_t v51 = 0;
        unint64_t v52 = v54;
        while (1)
        {
          uint64_t v49 = v51;
          if (*(void *)v115[2] != v50) {
            objc_enumerationMutation(v53);
          }
          uint64_t v116 = *(void *)(v115[1] + 8 * v51);
          v114 = objc_alloc_init(CPSPrimaryManeuverLayoutConfiguration);
          [(CPSPrimaryManeuverLayoutConfiguration *)v114 setLayout:7];
          [(CPSPrimaryManeuverLayoutConfiguration *)v114 setSymbolImage:v159];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(CPSPrimaryManeuverLayoutConfiguration *)v114 setAttributedInstruction:v116];
            [v156 setAttributedText:v116];
          }
          else
          {
            [(CPSPrimaryManeuverLayoutConfiguration *)v114 setInstruction:v116];
            [v156 setText:v116];
          }
          [v163 setNeedsLayout];
          [v163 layoutIfNeeded];
          v48 = v114;
          [v163 bounds];
          v113[1] = v32;
          v113[2] = v33;
          v113[3] = v34;
          v113[4] = v35;
          [(CPSPrimaryManeuverLayoutConfiguration *)v48 setHeight:*(double *)&v35];
          [v161 addObject:v114];
          objc_storeStrong((id *)&v114, 0);
          ++v51;
          if (v49 + 1 >= v52)
          {
            uint64_t v51 = 0;
            unint64_t v52 = [v53 countByEnumeratingWithState:v115 objects:v171 count:16];
            if (!v52) {
              break;
            }
          }
        }
      }
    }
    if (v155)
    {
      uint64_t v152 = 8;
      [v163 _activateMinimalWideImageLayoutConstraints];
      v113[0] = objc_alloc_init(CPSPrimaryManeuverLayoutConfiguration);
      [v113[0] setLayout:v152];
      [v113[0] setSymbolImage:v159];
      [v163 setNeedsLayout];
      [v163 layoutIfNeeded];
      id v47 = v113[0];
      [v163 bounds];
      v112[1] = v36;
      v112[2] = v37;
      v112[3] = v38;
      v112[4] = v39;
      [v47 setHeight:*(double *)&v39];
      [v161 addObject:v113[0]];
      objc_storeStrong(v113, 0);
    }
    uint64_t v152 = 9;
    [v163 _activateMinimalLayoutConstraints];
    v112[0] = objc_alloc_init(CPSPrimaryManeuverLayoutConfiguration);
    [v112[0] setLayout:v152];
    [v112[0] setSymbolImage:v159];
    [v163 setNeedsLayout];
    [v163 layoutIfNeeded];
    id v44 = v112[0];
    [v163 bounds];
    v111[1] = v40;
    v111[2] = v41;
    v111[3] = v42;
    v111[4] = v43;
    [v44 setHeight:*(double *)&v43];
    [v161 addObject:v112[0]];
    [v163 removeFromSuperview];
    id v45 = v161;
    uint64_t v105 = MEMORY[0x263EF8330];
    int v106 = -1073741824;
    int v107 = 0;
    v108 = __80__CPSPrimaryManeuverView__generateLayoutConfigurationsForSizeIfNecessary_force___block_invoke;
    v109 = &unk_2648A4B40;
    id v110 = v169;
    v111[0] = (id)[v45 sortedArrayUsingComparator:&v105];
    id v46 = (id)[v111[0] copy];
    objc_msgSend(v169, "setLayoutConfigurations:");

    objc_storeStrong(v111, 0);
    objc_storeStrong(&v110, 0);
    objc_storeStrong(v112, 0);
    objc_storeStrong(&v156, 0);
    objc_storeStrong(&v157, 0);
    objc_storeStrong(&v158, 0);
    objc_storeStrong(&v159, 0);
    objc_storeStrong(&v160, 0);
    objc_storeStrong(&v161, 0);
    objc_storeStrong(&v162, 0);
    objc_storeStrong(&v163, 0);
  }
}

uint64_t __80__CPSPrimaryManeuverView__generateLayoutConfigurationsForSizeIfNecessary_force___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v25 = 0;
  objc_storeStrong(&v25, a3);
  v24[1] = a1;
  id v17 = (id)[location[0] attributedInstruction];
  char v22 = 0;
  if (v17)
  {
    id v3 = v17;
  }
  else
  {
    id v23 = (id)[location[0] instruction];
    char v22 = 1;
    id v3 = v23;
  }
  v24[0] = v3;
  if (v22) {

  }
  id v14 = (id)[v25 attributedInstruction];
  char v19 = 0;
  if (v14)
  {
    id v4 = v14;
  }
  else
  {
    id v20 = (id)[v25 instruction];
    char v19 = 1;
    id v4 = v20;
  }
  id v21 = v4;
  if (v19) {

  }
  uint64_t v18 = [a1[4] _compareInstruction:v24[0] toInstruction:v21];
  if (v18)
  {
    uint64_t v27 = v18;
  }
  else
  {
    unint64_t v13 = [location[0] layout];
    if (v13 >= [v25 layout])
    {
      unint64_t v12 = [location[0] layout];
      if (v12 <= [v25 layout])
      {
        [location[0] height];
        double v11 = v5;
        [v25 height];
        if (v11 <= v6)
        {
          objc_msgSend(location[0], "height", v11);
          double v10 = v7;
          [v25 height];
          uint64_t v27 = v10 < v8;
        }
        else
        {
          uint64_t v27 = -1;
        }
      }
      else
      {
        uint64_t v27 = 1;
      }
    }
    else
    {
      uint64_t v27 = -1;
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v27;
}

- (int64_t)_compareInstruction:(id)a3 toInstruction:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  if (location[0] && v8)
  {
    unint64_t v6 = [location[0] length];
    if (v6 <= [v8 length])
    {
      unint64_t v5 = [location[0] length];
      int64_t v10 = v5 < [v8 length];
    }
    else
    {
      int64_t v10 = -1;
    }
  }
  else if (location[0])
  {
    int64_t v10 = -1;
  }
  else
  {
    int64_t v10 = v8 != 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)_activateFullLayoutConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _fullLayoutConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateFullLayoutWideImageConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _fullLayoutWideImageConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateJunctionViewNoInstructionConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _junctionViewNoSubtitleConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateJunctionViewNoInstructionWideImageConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _junctionViewNoInstructionWideImageConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateFullNoJunctionViewLayoutConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _fullLayoutNoJunctionViewConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateFullNoJunctionViewWideImageLayoutConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _fullLayoutNoJunctionViewWideImageConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateMinimalLayoutConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _minimalLayoutConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateMinimalWideImageLayoutConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _minimalLayoutWideImageConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (void)_activateFullSubtitleNextToImageConstraints
{
  id v3 = [(CPSPrimaryManeuverView *)self _fullSubtitleNextToImageConstraints];
  [(CPSPrimaryManeuverView *)self setActiveLayoutConstraints:"setActiveLayoutConstraints:"];
}

- (id)_fullLayoutConstraints
{
  v186[21] = *MEMORY[0x263EF8340];
  v180 = objc_opt_class();
  v181 = [(CPSPrimaryManeuverView *)self maneuver];
  id v182 = (id)objc_msgSend(v180, "symbolImageForManeuver:");

  if (v182)
  {
    v179 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v178 = [(UILayoutGuide *)v179 centerYAnchor];
    v177 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    v176 = [(UILayoutGuide *)v177 centerYAnchor];
    id v175 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v178, "constraintEqualToAnchor:");
    v186[0] = v175;
    v174 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v173 = [(UILayoutGuide *)v174 leadingAnchor];
    id v172 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v171 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v173, "constraintEqualToAnchor:constant:", 13.0);
    v186[1] = v171;
    CGSize v170 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v169 = [(UILayoutGuide *)v170 trailingAnchor];
    id v168 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v167 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v169, "constraintEqualToAnchor:constant:", -13.0);
    v186[2] = v167;
    id v166 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    char v165 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    char v164 = [(UILayoutGuide *)v165 topAnchor];
    id v163 = (id)objc_msgSend(v166, "constraintLessThanOrEqualToAnchor:");
    v186[3] = v163;
    id v162 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v161 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    id v160 = [(UILayoutGuide *)v161 topAnchor];
    id v159 = (id)objc_msgSend(v162, "constraintEqualToAnchor:");
    v186[4] = v159;
    id v158 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    id v157 = [(UILayoutGuide *)v158 bottomAnchor];
    id v156 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v155 = (id)[(CPSAspectFitImageView *)v156 topAnchor];
    id v154 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v157, "constraintEqualToAnchor:");
    v186[5] = v154;
    double v153 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v152 = (id)[(UIImageView *)v153 topAnchor];
    id v151 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    uint64_t v150 = [(UILayoutGuide *)v151 topAnchor];
    id v149 = (id)objc_msgSend(v152, "constraintEqualToAnchor:constant:");
    v186[6] = v149;
    v148 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v147 = (id)[(UIImageView *)v148 leadingAnchor];
    uint64_t v146 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    uint64_t v145 = [(UILayoutGuide *)v146 leadingAnchor];
    id v144 = (id)objc_msgSend(v147, "constraintEqualToAnchor:constant:", 0.0);
    v186[7] = v144;
    double v143 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v142 = (id)[(UIImageView *)v143 heightAnchor];
    [(CPSPrimaryManeuverView *)self symbolImageHeight];
    id v141 = (id)objc_msgSend(v142, "constraintLessThanOrEqualToConstant:");
    v186[8] = v141;
    uint64_t v140 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v139 = (id)[(CPSAbridgableLabel *)v140 leadingAnchor];
    v138 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v137 = (id)[(UIImageView *)v138 trailingAnchor];
    id v136 = (id)objc_msgSend(v139, "constraintEqualToAnchor:constant:", 8.0);
    v186[9] = v136;
    uint64_t v135 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v134 = (id)[(CPSAbridgableLabel *)v135 centerYAnchor];
    double v133 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v132 = (id)[(UIImageView *)v133 centerYAnchor];
    id v131 = (id)objc_msgSend(v134, "constraintEqualToAnchor:constant:", 0.0);
    v186[10] = v131;
    uint64_t v130 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v129 = (id)[(CPSAbridgableLabel *)v130 trailingAnchor];
    double v128 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    double v127 = [(UILayoutGuide *)v128 trailingAnchor];
    id v126 = (id)objc_msgSend(v129, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v186[11] = v126;
    uint64_t v125 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v124 = (id)[(CPSAbridgableLabel *)v125 leadingAnchor];
    uint64_t v123 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v122 = [(UILayoutGuide *)v123 leadingAnchor];
    id v121 = (id)objc_msgSend(v124, "constraintEqualToAnchor:constant:", 0.0);
    v186[12] = v121;
    double v120 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v119 = (id)[(CPSAbridgableLabel *)v120 trailingAnchor];
    uint64_t v118 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    uint64_t v117 = [(UILayoutGuide *)v118 trailingAnchor];
    id v116 = (id)objc_msgSend(v119, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
    v186[13] = v116;
    v115 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v114 = (id)[(CPSAbridgableLabel *)v115 topAnchor];
    v113 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v112 = (id)[(UIImageView *)v113 bottomAnchor];
    id v111 = (id)objc_msgSend(v114, "constraintEqualToAnchor:constant:");
    v186[14] = v111;
    id v110 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v109 = (id)[(CPSAbridgableLabel *)v110 bottomAnchor];
    v108 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    int v107 = [(UILayoutGuide *)v108 bottomAnchor];
    id v106 = (id)objc_msgSend(v109, "constraintEqualToAnchor:constant:", 0.0);
    v186[15] = v106;
    uint64_t v105 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v104 = (id)[(CPSAspectFitImageView *)v105 topAnchor];
    id v103 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    BOOL v102 = [(UILayoutGuide *)v103 bottomAnchor];
    id v101 = (id)objc_msgSend(v104, "constraintGreaterThanOrEqualToAnchor:constant:", 4.0);
    v186[16] = v101;
    char v100 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v99 = (id)[(CPSAspectFitImageView *)v100 bottomAnchor];
    id v98 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
    id v97 = (id)objc_msgSend(v99, "constraintEqualToAnchor:constant:", 0.0);
    v186[17] = v97;
    id v96 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v95 = (id)[(CPSAspectFitImageView *)v96 centerXAnchor];
    id v94 = (id)[(CPSPrimaryManeuverView *)self centerXAnchor];
    id v93 = (id)objc_msgSend(v95, "constraintEqualToAnchor:");
    v186[18] = v93;
    id v92 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v91 = (id)[(CPSAspectFitImageView *)v92 leadingAnchor];
    id v90 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v89 = (id)objc_msgSend(v91, "constraintGreaterThanOrEqualToAnchor:");
    v186[19] = v89;
    id v88 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v87 = (id)[(CPSAspectFitImageView *)v88 trailingAnchor];
    id v86 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v85 = (id)objc_msgSend(v87, "constraintLessThanOrEqualToAnchor:");
    v186[20] = v85;
    id v184 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:21];
  }
  else
  {
    id v84 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v83 = [(UILayoutGuide *)v84 centerYAnchor];
    id v82 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    BOOL v81 = [(UILayoutGuide *)v82 centerYAnchor];
    id v80 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v83, "constraintEqualToAnchor:");
    v185[0] = v80;
    id v79 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v78 = [(UILayoutGuide *)v79 leadingAnchor];
    id v77 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v76 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v78, "constraintEqualToAnchor:constant:", 13.0);
    v185[1] = v76;
    v75 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    unint64_t v74 = [(UILayoutGuide *)v75 trailingAnchor];
    id v73 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v72 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v74, "constraintEqualToAnchor:constant:", -13.0);
    v185[2] = v72;
    id v71 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v70 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    double v69 = [(UILayoutGuide *)v70 topAnchor];
    id v68 = (id)objc_msgSend(v71, "constraintLessThanOrEqualToAnchor:");
    v185[3] = v68;
    id v67 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    double v66 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    BOOL v65 = [(UILayoutGuide *)v66 topAnchor];
    id v64 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
    v185[4] = v64;
    id v63 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    v62 = [(UILayoutGuide *)v63 bottomAnchor];
    uint64_t v61 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v60 = (id)[(CPSAspectFitImageView *)v61 topAnchor];
    id v59 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v62, "constraintEqualToAnchor:");
    v185[5] = v59;
    uint64_t v58 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v57 = (id)[(CPSAbridgableLabel *)v58 topAnchor];
    uint64_t v56 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v55 = [(UILayoutGuide *)v56 topAnchor];
    id v54 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:");
    v185[6] = v54;
    id v53 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v52 = (id)[(CPSAbridgableLabel *)v53 leadingAnchor];
    uint64_t v51 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    uint64_t v50 = [(UILayoutGuide *)v51 leadingAnchor];
    id v49 = (id)objc_msgSend(v52, "constraintEqualToAnchor:constant:");
    v185[7] = v49;
    v48 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v47 = (id)[(CPSAbridgableLabel *)v48 trailingAnchor];
    id v46 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v45 = [(UILayoutGuide *)v46 trailingAnchor];
    id v44 = (id)objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:constant:");
    v185[8] = v44;
    v43 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v42 = (id)[(CPSAbridgableLabel *)v43 leadingAnchor];
    objc_super v41 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v40 = [(UILayoutGuide *)v41 leadingAnchor];
    id v39 = (id)objc_msgSend(v42, "constraintEqualToAnchor:constant:", 8.0);
    v185[9] = v39;
    id v38 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v37 = (id)[(CPSAbridgableLabel *)v38 trailingAnchor];
    id v36 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v35 = [(UILayoutGuide *)v36 trailingAnchor];
    id v34 = (id)objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
    v185[10] = v34;
    double v33 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v32 = (id)[(CPSAbridgableLabel *)v33 topAnchor];
    double v31 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v30 = (id)[(CPSAbridgableLabel *)v31 bottomAnchor];
    id v29 = (id)objc_msgSend(v32, "constraintEqualToAnchor:constant:");
    v185[11] = v29;
    uint64_t v28 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v27 = (id)[(CPSAbridgableLabel *)v28 bottomAnchor];
    uint64_t v26 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v25 = [(UILayoutGuide *)v26 bottomAnchor];
    id v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:constant:", 0.0);
    v185[12] = v24;
    id v23 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v22 = (id)[(CPSAspectFitImageView *)v23 topAnchor];
    id v21 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v20 = [(UILayoutGuide *)v21 bottomAnchor];
    id v19 = (id)objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", 4.0);
    v185[13] = v19;
    uint64_t v18 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v17 = (id)[(CPSAspectFitImageView *)v18 bottomAnchor];
    id v16 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", 0.0);
    v185[14] = v15;
    id v14 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v13 = (id)[(CPSAspectFitImageView *)v14 centerXAnchor];
    id v12 = (id)[(CPSPrimaryManeuverView *)self centerXAnchor];
    id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v185[15] = v11;
    int64_t v10 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v9 = (id)[(CPSAspectFitImageView *)v10 leadingAnchor];
    id v8 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v7 = (id)objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:");
    v185[16] = v7;
    unint64_t v6 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v5 = (id)[(CPSAspectFitImageView *)v6 trailingAnchor];
    id v4 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v3 = (id)objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:");
    v185[17] = v3;
    id v184 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v185 count:18];
  }

  return v184;
}

- (id)_fullLayoutWideImageConstraints
{
  v129[3] = *MEMORY[0x263EF8340];
  id v126 = self;
  v125[1] = (id)a2;
  v125[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(CPSPrimaryManeuverView *)v126 centersManeuverInView])
  {
    id v124 = (id)[(CPSPrimaryManeuverView *)v126 topAnchor];
    uint64_t v123 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
    v122 = [(UILayoutGuide *)v123 topAnchor];
    id v121 = (id)objc_msgSend(v124, "constraintLessThanOrEqualToAnchor:constant:", -4.0);
    v129[0] = v121;
    double v120 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
    id v119 = [(UILayoutGuide *)v120 centerYAnchor];
    id v118 = (id)[(CPSPrimaryManeuverView *)v126 centerYAnchor];
    id v117 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v119, "constraintEqualToAnchor:");
    v129[1] = v117;
    id v116 = [(CPSPrimaryManeuverView *)v126 junctionImageView];
    id v115 = (id)[(CPSAspectFitImageView *)v116 topAnchor];
    id v114 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
    v113 = [(UILayoutGuide *)v114 bottomAnchor];
    id v112 = (id)objc_msgSend(v115, "constraintGreaterThanOrEqualToAnchor:constant:", 4.0);
    v129[2] = v112;
    id v111 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:3];
    objc_msgSend(v125[0], "addObjectsFromArray:");
  }
  else
  {
    id v110 = (id)[(CPSPrimaryManeuverView *)v126 topAnchor];
    id v109 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
    v108 = [(UILayoutGuide *)v109 topAnchor];
    id v107 = (id)objc_msgSend(v110, "constraintEqualToAnchor:constant:", -4.0);
    v128[0] = v107;
    id v106 = [(CPSPrimaryManeuverView *)v126 junctionImageView];
    id v105 = (id)[(CPSAspectFitImageView *)v106 topAnchor];
    id v104 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
    id v103 = [(UILayoutGuide *)v104 bottomAnchor];
    id v102 = (id)objc_msgSend(v105, "constraintEqualToAnchor:constant:", 4.0);
    v128[1] = v102;
    id v101 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:2];
    objc_msgSend(v125[0], "addObjectsFromArray:");
  }
  id v3 = v125[0];
  id v99 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v98 = [(UILayoutGuide *)v99 leadingAnchor];
  id v97 = (id)[(CPSPrimaryManeuverView *)v126 leadingAnchor];
  id v96 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v98, "constraintEqualToAnchor:constant:", 13.0);
  v127[0] = v96;
  id v95 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v94 = [(UILayoutGuide *)v95 trailingAnchor];
  id v93 = (id)[(CPSPrimaryManeuverView *)v126 trailingAnchor];
  id v92 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v94, "constraintEqualToAnchor:constant:", -13.0);
  v127[1] = v92;
  id v91 = (id)[(CPSPrimaryManeuverView *)v126 topAnchor];
  id v90 = [(CPSPrimaryManeuverView *)v126 yCenteringGuide];
  id v89 = [(UILayoutGuide *)v90 topAnchor];
  id v88 = (id)objc_msgSend(v91, "constraintEqualToAnchor:");
  v127[2] = v88;
  id v87 = [(CPSPrimaryManeuverView *)v126 yCenteringGuide];
  id v86 = [(UILayoutGuide *)v87 bottomAnchor];
  id v85 = [(CPSPrimaryManeuverView *)v126 junctionImageView];
  id v84 = (id)[(CPSAspectFitImageView *)v85 topAnchor];
  id v83 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v86, "constraintEqualToAnchor:");
  v127[3] = v83;
  id v82 = [(CPSPrimaryManeuverView *)v126 symbolImageView];
  id v81 = (id)[(UIImageView *)v82 topAnchor];
  id v80 = (id)[(CPSPrimaryManeuverView *)v126 topAnchor];
  id v79 = (id)objc_msgSend(v81, "constraintEqualToAnchor:constant:");
  v127[4] = v79;
  id v78 = [(CPSPrimaryManeuverView *)v126 symbolImageView];
  id v77 = (id)[(UIImageView *)v78 leadingAnchor];
  id v76 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  v75 = [(UILayoutGuide *)v76 leadingAnchor];
  id v74 = (id)objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
  v127[5] = v74;
  id v73 = [(CPSPrimaryManeuverView *)v126 symbolImageView];
  id v72 = (id)[(UIImageView *)v73 trailingAnchor];
  id v71 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v70 = [(UILayoutGuide *)v71 trailingAnchor];
  id v69 = (id)objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v127[6] = v69;
  id v68 = [(CPSPrimaryManeuverView *)v126 symbolImageView];
  id v67 = (id)[(UIImageView *)v68 centerXAnchor];
  double v66 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  BOOL v65 = [(UILayoutGuide *)v66 centerXAnchor];
  id v64 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
  v127[7] = v64;
  id v63 = [(CPSPrimaryManeuverView *)v126 symbolImageView];
  id v62 = (id)[(UIImageView *)v63 widthAnchor];
  uint64_t v61 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v60 = [(UILayoutGuide *)v61 widthAnchor];
  id v59 = (id)objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:");
  v127[8] = v59;
  uint64_t v58 = [(CPSPrimaryManeuverView *)v126 symbolImageView];
  id v57 = (id)[(UIImageView *)v58 heightAnchor];
  [(CPSPrimaryManeuverView *)v126 symbolImageHeight];
  id v56 = (id)objc_msgSend(v57, "constraintLessThanOrEqualToConstant:");
  v127[9] = v56;
  v55 = [(CPSPrimaryManeuverView *)v126 titleLabel];
  id v54 = (id)[(CPSAbridgableLabel *)v55 leadingAnchor];
  id v53 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v52 = [(UILayoutGuide *)v53 leadingAnchor];
  id v51 = (id)objc_msgSend(v54, "constraintEqualToAnchor:constant:", 0.0);
  v127[10] = v51;
  uint64_t v50 = [(CPSPrimaryManeuverView *)v126 titleLabel];
  id v49 = (id)[(CPSAbridgableLabel *)v50 topAnchor];
  v48 = [(CPSPrimaryManeuverView *)v126 symbolImageView];
  id v47 = (id)[(UIImageView *)v48 bottomAnchor];
  id v46 = (id)objc_msgSend(v49, "constraintEqualToAnchor:constant:", 0.0);
  v127[11] = v46;
  id v45 = [(CPSPrimaryManeuverView *)v126 titleLabel];
  id v44 = (id)[(CPSAbridgableLabel *)v45 trailingAnchor];
  v43 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v42 = [(UILayoutGuide *)v43 trailingAnchor];
  id v41 = (id)objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v127[12] = v41;
  id v40 = [(CPSPrimaryManeuverView *)v126 subtitleLabel];
  id v39 = (id)[(CPSAbridgableLabel *)v40 leadingAnchor];
  id v38 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v37 = [(UILayoutGuide *)v38 leadingAnchor];
  id v36 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:", 0.0);
  v127[13] = v36;
  id v35 = [(CPSPrimaryManeuverView *)v126 subtitleLabel];
  id v34 = (id)[(CPSAbridgableLabel *)v35 trailingAnchor];
  double v33 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v32 = [(UILayoutGuide *)v33 trailingAnchor];
  id v31 = (id)objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
  v127[14] = v31;
  id v30 = [(CPSPrimaryManeuverView *)v126 subtitleLabel];
  id v29 = (id)[(CPSAbridgableLabel *)v30 topAnchor];
  uint64_t v28 = [(CPSPrimaryManeuverView *)v126 titleLabel];
  id v27 = (id)[(CPSAbridgableLabel *)v28 bottomAnchor];
  id v26 = (id)objc_msgSend(v29, "constraintEqualToAnchor:constant:", 4.0);
  v127[15] = v26;
  id v25 = [(CPSPrimaryManeuverView *)v126 subtitleLabel];
  id v24 = (id)[(CPSAbridgableLabel *)v25 bottomAnchor];
  id v23 = [(CPSPrimaryManeuverView *)v126 centeringLayoutGuide];
  id v22 = [(UILayoutGuide *)v23 bottomAnchor];
  id v21 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:", 0.0);
  v127[16] = v21;
  id v20 = [(CPSPrimaryManeuverView *)v126 junctionImageView];
  id v19 = (id)[(CPSAspectFitImageView *)v20 bottomAnchor];
  id v18 = (id)[(CPSPrimaryManeuverView *)v126 bottomAnchor];
  id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 0.0);
  v127[17] = v17;
  id v16 = [(CPSPrimaryManeuverView *)v126 junctionImageView];
  id v15 = (id)[(CPSAspectFitImageView *)v16 centerXAnchor];
  id v14 = (id)[(CPSPrimaryManeuverView *)v126 centerXAnchor];
  id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v127[18] = v13;
  id v12 = [(CPSPrimaryManeuverView *)v126 junctionImageView];
  id v11 = (id)[(CPSAspectFitImageView *)v12 leadingAnchor];
  id v10 = (id)[(CPSPrimaryManeuverView *)v126 leadingAnchor];
  id v9 = (id)objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:");
  v127[19] = v9;
  id v8 = [(CPSPrimaryManeuverView *)v126 junctionImageView];
  id v7 = (id)[(CPSAspectFitImageView *)v8 trailingAnchor];
  id v6 = (id)[(CPSPrimaryManeuverView *)v126 trailingAnchor];
  id v5 = (id)objc_msgSend(v7, "constraintLessThanOrEqualToAnchor:");
  v127[20] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:21];
  objc_msgSend(v3, "addObjectsFromArray:");

  id v100 = v125[0];
  objc_storeStrong(v125, 0);

  return v100;
}

- (id)_junctionViewNoSubtitleConstraints
{
  v207[23] = *MEMORY[0x263EF8340];
  v201 = objc_opt_class();
  v202 = [(CPSPrimaryManeuverView *)self maneuver];
  id v203 = (id)objc_msgSend(v201, "symbolImageForManeuver:");

  if (v203)
  {
    v200 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    v199 = [(UILayoutGuide *)v200 topAnchor];
    id v198 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v197 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v199, "constraintEqualToAnchor:");
    v207[0] = v197;
    v196 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    v195 = [(UILayoutGuide *)v196 bottomAnchor];
    v194 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v193 = (id)[(CPSAspectFitImageView *)v194 topAnchor];
    id v192 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v195, "constraintEqualToAnchor:");
    v207[1] = v192;
    v191 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v190 = [(UILayoutGuide *)v191 topAnchor];
    id v189 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v188 = (id)-[NSLayoutYAxisAnchor constraintGreaterThanOrEqualToAnchor:](v190, "constraintGreaterThanOrEqualToAnchor:");
    v207[2] = v188;
    v187 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v186 = [(UILayoutGuide *)v187 centerYAnchor];
    v185 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    id v184 = [(UILayoutGuide *)v185 centerYAnchor];
    id v183 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v186, "constraintEqualToAnchor:");
    v207[3] = v183;
    id v182 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v181 = [(UILayoutGuide *)v182 bottomAnchor];
    v180 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v179 = (id)[(CPSAspectFitImageView *)v180 topAnchor];
    id v178 = (id)-[NSLayoutYAxisAnchor constraintLessThanOrEqualToAnchor:constant:](v181, "constraintLessThanOrEqualToAnchor:constant:", 10.0);
    v207[4] = v178;
    v177 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v176 = [(UILayoutGuide *)v177 leadingAnchor];
    id v175 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v174 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v176, "constraintEqualToAnchor:constant:", 13.0);
    v207[5] = v174;
    id v173 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v172 = [(UILayoutGuide *)v173 trailingAnchor];
    id v171 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v170 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v172, "constraintEqualToAnchor:constant:", -13.0);
    v207[6] = v170;
    id v169 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v168 = (id)[(UIImageView *)v169 topAnchor];
    id v167 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v166 = [(UILayoutGuide *)v167 topAnchor];
    id v165 = (id)objc_msgSend(v168, "constraintEqualToAnchor:constant:");
    v207[7] = v165;
    char v164 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v163 = (id)[(UIImageView *)v164 leadingAnchor];
    id v162 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v161 = [(UILayoutGuide *)v162 leadingAnchor];
    id v160 = (id)objc_msgSend(v163, "constraintEqualToAnchor:constant:", 0.0);
    v207[8] = v160;
    id v159 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v158 = (id)[(UIImageView *)v159 heightAnchor];
    [(CPSPrimaryManeuverView *)self symbolImageHeight];
    id v157 = (id)objc_msgSend(v158, "constraintLessThanOrEqualToConstant:");
    v207[9] = v157;
    id v156 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v155 = (id)[(UIImageView *)v156 bottomAnchor];
    id v154 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    double v153 = [(UILayoutGuide *)v154 bottomAnchor];
    id v152 = (id)objc_msgSend(v155, "constraintEqualToAnchor:constant:", 0.0);
    v207[10] = v152;
    id v151 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v150 = (id)[(CPSAbridgableLabel *)v151 leadingAnchor];
    id v149 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v148 = (id)[(UIImageView *)v149 trailingAnchor];
    id v147 = (id)objc_msgSend(v150, "constraintEqualToAnchor:constant:", 8.0);
    v207[11] = v147;
    uint64_t v146 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v145 = (id)[(CPSAbridgableLabel *)v146 centerYAnchor];
    id v144 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v143 = (id)[(UIImageView *)v144 centerYAnchor];
    id v142 = (id)objc_msgSend(v145, "constraintEqualToAnchor:constant:", 0.0);
    v207[12] = v142;
    id v141 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v140 = (id)[(CPSAbridgableLabel *)v141 trailingAnchor];
    id v139 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v138 = [(UILayoutGuide *)v139 trailingAnchor];
    id v137 = (id)objc_msgSend(v140, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v207[13] = v137;
    id v136 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v135 = (id)[(CPSAbridgableLabel *)v136 bottomAnchor];
    id v134 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    double v133 = [(UILayoutGuide *)v134 bottomAnchor];
    id v132 = (id)objc_msgSend(v135, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v207[14] = v132;
    id v131 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v130 = (id)[(CPSAbridgableLabel *)v131 leadingAnchor];
    id v129 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    double v128 = [(UILayoutGuide *)v129 leadingAnchor];
    id v127 = (id)objc_msgSend(v130, "constraintEqualToAnchor:constant:", 0.0);
    v207[15] = v127;
    id v126 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v125 = (id)[(CPSAbridgableLabel *)v126 trailingAnchor];
    id v124 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    uint64_t v123 = [(UILayoutGuide *)v124 trailingAnchor];
    id v122 = (id)objc_msgSend(v125, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
    v207[16] = v122;
    id v121 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v120 = (id)[(CPSAbridgableLabel *)v121 topAnchor];
    id v119 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v118 = (id)[(UIImageView *)v119 bottomAnchor];
    id v117 = (id)objc_msgSend(v120, "constraintEqualToAnchor:constant:", 4.0);
    v207[17] = v117;
    id v116 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v115 = (id)[(CPSAbridgableLabel *)v116 heightAnchor];
    id v114 = (id)[v115 constraintEqualToConstant:0.0];
    v207[18] = v114;
    v113 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v112 = (id)[(CPSAspectFitImageView *)v113 bottomAnchor];
    id v111 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
    id v110 = (id)objc_msgSend(v112, "constraintEqualToAnchor:constant:", 0.0);
    v207[19] = v110;
    id v109 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v108 = (id)[(CPSAspectFitImageView *)v109 centerXAnchor];
    id v107 = (id)[(CPSPrimaryManeuverView *)self centerXAnchor];
    id v106 = (id)objc_msgSend(v108, "constraintEqualToAnchor:");
    v207[20] = v106;
    id v105 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v104 = (id)[(CPSAspectFitImageView *)v105 leadingAnchor];
    id v103 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v102 = (id)objc_msgSend(v104, "constraintGreaterThanOrEqualToAnchor:");
    v207[21] = v102;
    id v101 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v100 = (id)[(CPSAspectFitImageView *)v101 trailingAnchor];
    id v99 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v98 = (id)objc_msgSend(v100, "constraintLessThanOrEqualToAnchor:");
    v207[22] = v98;
    id v205 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v207 count:23];
  }
  else
  {
    id v97 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v96 = [(UILayoutGuide *)v97 centerYAnchor];
    id v95 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    id v94 = [(UILayoutGuide *)v95 centerYAnchor];
    id v93 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v96, "constraintEqualToAnchor:");
    v206[0] = v93;
    id v92 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v91 = [(UILayoutGuide *)v92 leadingAnchor];
    id v90 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v89 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v91, "constraintEqualToAnchor:constant:", 13.0);
    v206[1] = v89;
    id v88 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v87 = [(UILayoutGuide *)v88 trailingAnchor];
    id v86 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v85 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v87, "constraintEqualToAnchor:constant:", -13.0);
    v206[2] = v85;
    id v84 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v83 = [(UILayoutGuide *)v84 bottomAnchor];
    id v82 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v81 = (id)[(CPSAspectFitImageView *)v82 topAnchor];
    id v80 = (id)-[NSLayoutYAxisAnchor constraintLessThanOrEqualToAnchor:constant:](v83, "constraintLessThanOrEqualToAnchor:constant:", 10.0);
    v206[3] = v80;
    id v79 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v78 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v77 = [(UILayoutGuide *)v78 topAnchor];
    id v76 = (id)objc_msgSend(v79, "constraintLessThanOrEqualToAnchor:");
    v206[4] = v76;
    id v75 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v74 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    id v73 = [(UILayoutGuide *)v74 topAnchor];
    id v72 = (id)objc_msgSend(v75, "constraintEqualToAnchor:");
    v206[5] = v72;
    id v71 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
    id v70 = [(UILayoutGuide *)v71 bottomAnchor];
    id v69 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v68 = (id)[(CPSAspectFitImageView *)v69 topAnchor];
    id v67 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v70, "constraintEqualToAnchor:");
    v206[6] = v67;
    double v66 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v65 = (id)[(CPSAbridgableLabel *)v66 topAnchor];
    id v64 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v63 = [(UILayoutGuide *)v64 topAnchor];
    id v62 = (id)objc_msgSend(v65, "constraintEqualToAnchor:constant:");
    v206[7] = v62;
    uint64_t v61 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v60 = (id)[(CPSAbridgableLabel *)v61 leadingAnchor];
    id v59 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    uint64_t v58 = [(UILayoutGuide *)v59 leadingAnchor];
    id v57 = (id)objc_msgSend(v60, "constraintEqualToAnchor:constant:");
    v206[8] = v57;
    id v56 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v55 = (id)[(CPSAbridgableLabel *)v56 trailingAnchor];
    id v54 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v53 = [(UILayoutGuide *)v54 trailingAnchor];
    id v52 = (id)objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:constant:");
    v206[9] = v52;
    id v51 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v50 = (id)[(CPSAbridgableLabel *)v51 bottomAnchor];
    id v49 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v48 = [(UILayoutGuide *)v49 bottomAnchor];
    id v47 = (id)objc_msgSend(v50, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v206[10] = v47;
    id v46 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v45 = (id)[(CPSAbridgableLabel *)v46 leadingAnchor];
    id v44 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v43 = [(UILayoutGuide *)v44 leadingAnchor];
    id v42 = (id)objc_msgSend(v45, "constraintEqualToAnchor:constant:", 8.0);
    v206[11] = v42;
    id v41 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v40 = (id)[(CPSAbridgableLabel *)v41 trailingAnchor];
    id v39 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v38 = [(UILayoutGuide *)v39 trailingAnchor];
    id v37 = (id)objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
    v206[12] = v37;
    id v36 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v35 = (id)[(CPSAbridgableLabel *)v36 topAnchor];
    id v34 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v33 = (id)[(CPSAbridgableLabel *)v34 bottomAnchor];
    id v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:constant:", 0.0);
    v206[13] = v32;
    id v31 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v30 = (id)[(CPSAbridgableLabel *)v31 bottomAnchor];
    id v29 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    uint64_t v28 = [(UILayoutGuide *)v29 bottomAnchor];
    id v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", 0.0);
    v206[14] = v27;
    id v26 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v25 = (id)[(CPSAbridgableLabel *)v26 heightAnchor];
    id v24 = (id)[v25 constraintEqualToConstant:0.0];
    v206[15] = v24;
    id v23 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v22 = (id)[(CPSAspectFitImageView *)v23 topAnchor];
    id v21 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v20 = [(UILayoutGuide *)v21 bottomAnchor];
    id v19 = (id)objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
    v206[16] = v19;
    id v18 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v17 = (id)[(CPSAspectFitImageView *)v18 bottomAnchor];
    id v16 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", 0.0);
    v206[17] = v15;
    id v14 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v13 = (id)[(CPSAspectFitImageView *)v14 centerXAnchor];
    id v12 = (id)[(CPSPrimaryManeuverView *)self centerXAnchor];
    id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v206[18] = v11;
    id v10 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v9 = (id)[(CPSAspectFitImageView *)v10 leadingAnchor];
    id v8 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v7 = (id)objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:");
    v206[19] = v7;
    id v6 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v5 = (id)[(CPSAspectFitImageView *)v6 trailingAnchor];
    id v4 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v3 = (id)objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:");
    v206[20] = v3;
    id v205 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v206 count:21];
  }

  return v205;
}

- (id)_junctionViewNoInstructionWideImageConstraints
{
  v118[25] = *MEMORY[0x263EF8340];
  id v116 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
  id v115 = [(UILayoutGuide *)v116 topAnchor];
  id v114 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
  id v113 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v115, "constraintEqualToAnchor:");
  v118[0] = v113;
  id v112 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
  id v111 = [(UILayoutGuide *)v112 bottomAnchor];
  id v110 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v109 = (id)[(CPSAspectFitImageView *)v110 topAnchor];
  id v108 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v111, "constraintEqualToAnchor:");
  v118[1] = v108;
  id v107 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v106 = [(UILayoutGuide *)v107 topAnchor];
  id v105 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
  id v104 = (id)-[NSLayoutYAxisAnchor constraintGreaterThanOrEqualToAnchor:](v106, "constraintGreaterThanOrEqualToAnchor:");
  v118[2] = v104;
  id v103 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v102 = [(UILayoutGuide *)v103 centerYAnchor];
  id v101 = [(CPSPrimaryManeuverView *)self yCenteringGuide];
  id v100 = [(UILayoutGuide *)v101 centerYAnchor];
  id v99 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v102, "constraintEqualToAnchor:");
  v118[3] = v99;
  id v98 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v97 = [(UILayoutGuide *)v98 bottomAnchor];
  id v96 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v95 = (id)[(CPSAspectFitImageView *)v96 topAnchor];
  id v94 = (id)-[NSLayoutYAxisAnchor constraintLessThanOrEqualToAnchor:constant:](v97, "constraintLessThanOrEqualToAnchor:constant:", 10.0);
  v118[4] = v94;
  id v93 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v92 = [(UILayoutGuide *)v93 leadingAnchor];
  id v91 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
  id v90 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v92, "constraintEqualToAnchor:constant:", 13.0);
  v118[5] = v90;
  id v89 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v88 = [(UILayoutGuide *)v89 trailingAnchor];
  id v87 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
  id v86 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v88, "constraintEqualToAnchor:constant:", -13.0);
  v118[6] = v86;
  id v85 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v84 = (id)[(UIImageView *)v85 topAnchor];
  id v83 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v82 = [(UILayoutGuide *)v83 topAnchor];
  id v81 = (id)objc_msgSend(v84, "constraintEqualToAnchor:constant:");
  v118[7] = v81;
  id v80 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v79 = (id)[(UIImageView *)v80 leadingAnchor];
  id v78 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v77 = [(UILayoutGuide *)v78 leadingAnchor];
  id v76 = (id)objc_msgSend(v79, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
  v118[8] = v76;
  id v75 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v74 = (id)[(UIImageView *)v75 trailingAnchor];
  id v73 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v72 = [(UILayoutGuide *)v73 trailingAnchor];
  id v71 = (id)objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v118[9] = v71;
  id v70 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v69 = (id)[(UIImageView *)v70 centerXAnchor];
  id v68 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v67 = [(UILayoutGuide *)v68 centerXAnchor];
  id v66 = (id)objc_msgSend(v69, "constraintEqualToAnchor:");
  v118[10] = v66;
  id v65 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v64 = (id)[(UIImageView *)v65 widthAnchor];
  id v63 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v62 = [(UILayoutGuide *)v63 widthAnchor];
  id v61 = (id)objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:");
  v118[11] = v61;
  id v60 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v59 = (id)[(UIImageView *)v60 heightAnchor];
  [(CPSPrimaryManeuverView *)self symbolImageHeight];
  id v58 = (id)objc_msgSend(v59, "constraintLessThanOrEqualToConstant:");
  v118[12] = v58;
  id v57 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v56 = (id)[(CPSAbridgableLabel *)v57 leadingAnchor];
  id v55 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v54 = [(UILayoutGuide *)v55 leadingAnchor];
  id v53 = (id)objc_msgSend(v56, "constraintEqualToAnchor:constant:", 8.0);
  v118[13] = v53;
  id v52 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v51 = (id)[(CPSAbridgableLabel *)v52 topAnchor];
  id v50 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v49 = (id)[(UIImageView *)v50 bottomAnchor];
  id v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:constant:", 0.0);
  v118[14] = v48;
  id v47 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v46 = (id)[(CPSAbridgableLabel *)v47 trailingAnchor];
  id v45 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v44 = [(UILayoutGuide *)v45 trailingAnchor];
  id v43 = (id)objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v118[15] = v43;
  id v42 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v41 = (id)[(CPSAbridgableLabel *)v42 bottomAnchor];
  id v40 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v39 = [(UILayoutGuide *)v40 bottomAnchor];
  id v38 = (id)objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v118[16] = v38;
  id v37 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v36 = (id)[(CPSAbridgableLabel *)v37 leadingAnchor];
  id v35 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v34 = [(UILayoutGuide *)v35 leadingAnchor];
  id v33 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", 0.0);
  v118[17] = v33;
  id v32 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v31 = (id)[(CPSAbridgableLabel *)v32 trailingAnchor];
  id v30 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v29 = [(UILayoutGuide *)v30 trailingAnchor];
  id v28 = (id)objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
  v118[18] = v28;
  id v27 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v26 = (id)[(CPSAbridgableLabel *)v27 topAnchor];
  id v25 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v24 = (id)[(UIImageView *)v25 bottomAnchor];
  id v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:constant:", 4.0);
  v118[19] = v23;
  id v22 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v21 = (id)[(CPSAbridgableLabel *)v22 heightAnchor];
  id v20 = (id)[v21 constraintEqualToConstant:0.0];
  v118[20] = v20;
  id v19 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v18 = (id)[(CPSAspectFitImageView *)v19 bottomAnchor];
  id v17 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
  id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:constant:", 0.0);
  v118[21] = v16;
  id v15 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v14 = (id)[(CPSAspectFitImageView *)v15 centerXAnchor];
  id v13 = (id)[(CPSPrimaryManeuverView *)self centerXAnchor];
  id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
  v118[22] = v12;
  id v11 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v10 = (id)[(CPSAspectFitImageView *)v11 leadingAnchor];
  id v9 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
  id v8 = (id)objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:");
  v118[23] = v8;
  id v7 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v6 = (id)[(CPSAspectFitImageView *)v7 trailingAnchor];
  id v5 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
  id v3 = (id)objc_msgSend(v6, "constraintLessThanOrEqualToAnchor:");
  v118[24] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:25];

  return v4;
}

- (id)_fullLayoutNoJunctionViewConstraints
{
  v141[2] = *MEMORY[0x263EF8340];
  id v137 = self;
  v136[1] = (id)a2;
  v136[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(CPSPrimaryManeuverView *)v137 centersManeuverInView])
  {
    id v135 = (id)[(CPSPrimaryManeuverView *)v137 topAnchor];
    id v134 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    double v133 = [(UILayoutGuide *)v134 topAnchor];
    id v132 = (id)objc_msgSend(v135, "constraintLessThanOrEqualToAnchor:constant:", -4.0);
    v141[0] = v132;
    id v131 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v130 = [(UILayoutGuide *)v131 centerYAnchor];
    id v129 = (id)[(CPSPrimaryManeuverView *)v137 centerYAnchor];
    id v128 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v130, "constraintEqualToAnchor:");
    v141[1] = v128;
    id v127 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:2];
    objc_msgSend(v136[0], "addObjectsFromArray:");
  }
  else
  {
    id v126 = (id)[(CPSPrimaryManeuverView *)v137 topAnchor];
    id v125 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v124 = [(UILayoutGuide *)v125 topAnchor];
    id v123 = (id)objc_msgSend(v126, "constraintEqualToAnchor:constant:", -4.0);
    id v140 = v123;
    id v122 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v140 count:1];
    objc_msgSend(v136[0], "addObjectsFromArray:");
  }
  id v119 = objc_opt_class();
  id v120 = [(CPSPrimaryManeuverView *)v137 maneuver];
  id v121 = (id)objc_msgSend(v119, "symbolImageForManeuver:");

  if (v121)
  {
    id v118 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v117 = [(UILayoutGuide *)v118 leadingAnchor];
    id v116 = (id)[(CPSPrimaryManeuverView *)v137 leadingAnchor];
    id v115 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v117, "constraintEqualToAnchor:constant:", 13.0);
    v139[0] = v115;
    id v114 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v113 = [(UILayoutGuide *)v114 trailingAnchor];
    id v112 = (id)[(CPSPrimaryManeuverView *)v137 trailingAnchor];
    id v111 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v113, "constraintEqualToAnchor:constant:", -13.0);
    v139[1] = v111;
    id v110 = (id)[(CPSPrimaryManeuverView *)v137 bottomAnchor];
    id v109 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v108 = [(UILayoutGuide *)v109 bottomAnchor];
    id v107 = (id)objc_msgSend(v110, "constraintGreaterThanOrEqualToAnchor:constant:");
    v139[2] = v107;
    id v106 = [(CPSPrimaryManeuverView *)v137 symbolImageView];
    id v105 = (id)[(UIImageView *)v106 topAnchor];
    id v104 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v103 = [(UILayoutGuide *)v104 topAnchor];
    id v102 = (id)objc_msgSend(v105, "constraintEqualToAnchor:constant:");
    v139[3] = v102;
    id v101 = [(CPSPrimaryManeuverView *)v137 symbolImageView];
    id v100 = (id)[(UIImageView *)v101 leadingAnchor];
    id v99 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v98 = [(UILayoutGuide *)v99 leadingAnchor];
    id v97 = (id)objc_msgSend(v100, "constraintEqualToAnchor:constant:", 0.0);
    v139[4] = v97;
    id v96 = [(CPSPrimaryManeuverView *)v137 symbolImageView];
    id v95 = (id)[(UIImageView *)v96 heightAnchor];
    [(CPSPrimaryManeuverView *)v137 symbolImageHeight];
    id v94 = (id)objc_msgSend(v95, "constraintLessThanOrEqualToConstant:");
    v139[5] = v94;
    id v93 = [(CPSPrimaryManeuverView *)v137 titleLabel];
    id v92 = (id)[(CPSAbridgableLabel *)v93 leadingAnchor];
    id v91 = [(CPSPrimaryManeuverView *)v137 symbolImageView];
    id v90 = (id)[(UIImageView *)v91 trailingAnchor];
    id v89 = (id)objc_msgSend(v92, "constraintEqualToAnchor:constant:", 8.0);
    v139[6] = v89;
    id v88 = [(CPSPrimaryManeuverView *)v137 titleLabel];
    id v87 = (id)[(CPSAbridgableLabel *)v88 centerYAnchor];
    id v86 = [(CPSPrimaryManeuverView *)v137 symbolImageView];
    id v85 = (id)[(UIImageView *)v86 centerYAnchor];
    id v84 = (id)objc_msgSend(v87, "constraintEqualToAnchor:constant:", 0.0);
    v139[7] = v84;
    id v83 = [(CPSPrimaryManeuverView *)v137 titleLabel];
    id v82 = (id)[(CPSAbridgableLabel *)v83 trailingAnchor];
    id v81 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v80 = [(UILayoutGuide *)v81 trailingAnchor];
    id v79 = (id)objc_msgSend(v82, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v139[8] = v79;
    id v78 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v77 = (id)[(CPSAbridgableLabel *)v78 leadingAnchor];
    id v76 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v75 = [(UILayoutGuide *)v76 leadingAnchor];
    id v74 = (id)objc_msgSend(v77, "constraintEqualToAnchor:constant:", 0.0);
    v139[9] = v74;
    id v73 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v72 = (id)[(CPSAbridgableLabel *)v73 trailingAnchor];
    id v71 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v70 = [(UILayoutGuide *)v71 trailingAnchor];
    id v69 = (id)objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
    v139[10] = v69;
    id v68 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v67 = (id)[(CPSAbridgableLabel *)v68 topAnchor];
    id v66 = [(CPSPrimaryManeuverView *)v137 symbolImageView];
    id v65 = (id)[(UIImageView *)v66 bottomAnchor];
    id v64 = (id)objc_msgSend(v67, "constraintEqualToAnchor:constant:", 4.0);
    v139[11] = v64;
    id v63 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v62 = (id)[(CPSAbridgableLabel *)v63 bottomAnchor];
    id v61 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v60 = [(UILayoutGuide *)v61 bottomAnchor];
    id v59 = (id)objc_msgSend(v62, "constraintEqualToAnchor:constant:", 0.0);
    v139[12] = v59;
    id v58 = [(CPSPrimaryManeuverView *)v137 junctionImageView];
    id v57 = (id)[(CPSAspectFitImageView *)v58 heightAnchor];
    id v56 = (id)[v57 constraintEqualToConstant:0.0];
    v139[13] = v56;
    id v55 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:14];
    objc_msgSend(v136[0], "addObjectsFromArray:");
  }
  else
  {
    id v54 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v53 = [(UILayoutGuide *)v54 leadingAnchor];
    id v52 = (id)[(CPSPrimaryManeuverView *)v137 leadingAnchor];
    id v51 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v53, "constraintEqualToAnchor:constant:", 13.0);
    v138[0] = v51;
    id v50 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v49 = [(UILayoutGuide *)v50 trailingAnchor];
    id v48 = (id)[(CPSPrimaryManeuverView *)v137 trailingAnchor];
    id v47 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v49, "constraintEqualToAnchor:constant:", -13.0);
    v138[1] = v47;
    id v46 = (id)[(CPSPrimaryManeuverView *)v137 bottomAnchor];
    id v45 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v44 = [(UILayoutGuide *)v45 bottomAnchor];
    id v43 = (id)objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:constant:", 4.0);
    v138[2] = v43;
    id v42 = [(CPSPrimaryManeuverView *)v137 titleLabel];
    id v41 = (id)[(CPSAbridgableLabel *)v42 topAnchor];
    id v40 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v39 = [(UILayoutGuide *)v40 topAnchor];
    id v38 = (id)objc_msgSend(v41, "constraintEqualToAnchor:constant:");
    v138[3] = v38;
    id v37 = [(CPSPrimaryManeuverView *)v137 titleLabel];
    id v36 = (id)[(CPSAbridgableLabel *)v37 leadingAnchor];
    id v35 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v34 = [(UILayoutGuide *)v35 leadingAnchor];
    id v33 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:");
    v138[4] = v33;
    id v32 = [(CPSPrimaryManeuverView *)v137 titleLabel];
    id v31 = (id)[(CPSAbridgableLabel *)v32 trailingAnchor];
    id v30 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v29 = [(UILayoutGuide *)v30 trailingAnchor];
    id v28 = (id)objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:");
    v138[5] = v28;
    id v27 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v26 = (id)[(CPSAbridgableLabel *)v27 leadingAnchor];
    id v25 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v24 = [(UILayoutGuide *)v25 leadingAnchor];
    id v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:constant:", 8.0);
    id v138[6] = v23;
    id v22 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v21 = (id)[(CPSAbridgableLabel *)v22 trailingAnchor];
    id v20 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v19 = [(UILayoutGuide *)v20 trailingAnchor];
    id v18 = (id)objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
    v138[7] = v18;
    id v17 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v16 = (id)[(CPSAbridgableLabel *)v17 topAnchor];
    id v15 = [(CPSPrimaryManeuverView *)v137 titleLabel];
    id v14 = (id)[(CPSAbridgableLabel *)v15 bottomAnchor];
    id v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 0.0);
    v138[8] = v13;
    id v12 = [(CPSPrimaryManeuverView *)v137 subtitleLabel];
    id v11 = (id)[(CPSAbridgableLabel *)v12 bottomAnchor];
    id v10 = [(CPSPrimaryManeuverView *)v137 centeringLayoutGuide];
    id v9 = [(UILayoutGuide *)v10 bottomAnchor];
    id v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:constant:", 0.0);
    v138[9] = v8;
    id v7 = [(CPSPrimaryManeuverView *)v137 junctionImageView];
    id v6 = (id)[(CPSAspectFitImageView *)v7 heightAnchor];
    id v5 = (id)[v6 constraintEqualToConstant:0.0];
    v138[10] = v5;
    id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:11];
    objc_msgSend(v136[0], "addObjectsFromArray:");
  }
  id v3 = v136[0];
  objc_storeStrong(v136, 0);

  return v3;
}

- (id)_fullLayoutNoJunctionViewWideImageConstraints
{
  v102[2] = *MEMORY[0x263EF8340];
  id v99 = self;
  v98[1] = (id)a2;
  v98[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(CPSPrimaryManeuverView *)v99 centersManeuverInView])
  {
    id v97 = (id)[(CPSPrimaryManeuverView *)v99 topAnchor];
    id v96 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
    id v95 = [(UILayoutGuide *)v96 topAnchor];
    id v94 = (id)objc_msgSend(v97, "constraintLessThanOrEqualToAnchor:constant:", -4.0);
    v102[0] = v94;
    id v93 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
    id v92 = [(UILayoutGuide *)v93 centerYAnchor];
    id v91 = (id)[(CPSPrimaryManeuverView *)v99 centerYAnchor];
    id v90 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v92, "constraintEqualToAnchor:");
    v102[1] = v90;
    id v89 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v102 count:2];
    objc_msgSend(v98[0], "addObjectsFromArray:");
  }
  else
  {
    id v88 = (id)[(CPSPrimaryManeuverView *)v99 topAnchor];
    id v87 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
    id v86 = [(UILayoutGuide *)v87 topAnchor];
    id v85 = (id)objc_msgSend(v88, "constraintEqualToAnchor:constant:", -4.0);
    id v101 = v85;
    id v84 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v101 count:1];
    objc_msgSend(v98[0], "addObjectsFromArray:");
  }
  id v3 = v98[0];
  id v82 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v81 = [(UILayoutGuide *)v82 leadingAnchor];
  id v80 = (id)[(CPSPrimaryManeuverView *)v99 leadingAnchor];
  id v79 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v81, "constraintEqualToAnchor:constant:", 13.0);
  v100[0] = v79;
  id v78 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v77 = [(UILayoutGuide *)v78 trailingAnchor];
  id v76 = (id)[(CPSPrimaryManeuverView *)v99 trailingAnchor];
  id v75 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v77, "constraintEqualToAnchor:constant:", -13.0);
  v100[1] = v75;
  id v74 = (id)[(CPSPrimaryManeuverView *)v99 bottomAnchor];
  id v73 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v72 = [(UILayoutGuide *)v73 bottomAnchor];
  id v71 = (id)objc_msgSend(v74, "constraintGreaterThanOrEqualToAnchor:constant:");
  v100[2] = v71;
  id v70 = [(CPSPrimaryManeuverView *)v99 symbolImageView];
  id v69 = (id)[(UIImageView *)v70 topAnchor];
  id v68 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v67 = [(UILayoutGuide *)v68 topAnchor];
  id v66 = (id)objc_msgSend(v69, "constraintEqualToAnchor:constant:");
  v100[3] = v66;
  id v65 = [(CPSPrimaryManeuverView *)v99 symbolImageView];
  id v64 = (id)[(UIImageView *)v65 leadingAnchor];
  id v63 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v62 = [(UILayoutGuide *)v63 leadingAnchor];
  id v61 = (id)objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
  v100[4] = v61;
  id v60 = [(CPSPrimaryManeuverView *)v99 symbolImageView];
  id v59 = (id)[(UIImageView *)v60 trailingAnchor];
  id v58 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v57 = [(UILayoutGuide *)v58 trailingAnchor];
  id v56 = (id)objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v100[5] = v56;
  id v55 = [(CPSPrimaryManeuverView *)v99 symbolImageView];
  id v54 = (id)[(UIImageView *)v55 centerXAnchor];
  id v53 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v52 = [(UILayoutGuide *)v53 centerXAnchor];
  id v51 = (id)objc_msgSend(v54, "constraintEqualToAnchor:");
  v100[6] = v51;
  id v50 = [(CPSPrimaryManeuverView *)v99 symbolImageView];
  id v49 = (id)[(UIImageView *)v50 widthAnchor];
  id v48 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v47 = [(UILayoutGuide *)v48 widthAnchor];
  id v46 = (id)objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:");
  v100[7] = v46;
  id v45 = [(CPSPrimaryManeuverView *)v99 symbolImageView];
  id v44 = (id)[(UIImageView *)v45 heightAnchor];
  [(CPSPrimaryManeuverView *)v99 symbolImageHeight];
  id v43 = (id)objc_msgSend(v44, "constraintLessThanOrEqualToConstant:");
  v100[8] = v43;
  id v42 = [(CPSPrimaryManeuverView *)v99 titleLabel];
  id v41 = (id)[(CPSAbridgableLabel *)v42 leadingAnchor];
  id v40 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v39 = [(UILayoutGuide *)v40 leadingAnchor];
  id v38 = (id)objc_msgSend(v41, "constraintEqualToAnchor:constant:", 0.0);
  v100[9] = v38;
  id v37 = [(CPSPrimaryManeuverView *)v99 titleLabel];
  id v36 = (id)[(CPSAbridgableLabel *)v37 topAnchor];
  id v35 = [(CPSPrimaryManeuverView *)v99 symbolImageView];
  id v34 = (id)[(UIImageView *)v35 bottomAnchor];
  id v33 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", 0.0);
  v100[10] = v33;
  id v32 = [(CPSPrimaryManeuverView *)v99 titleLabel];
  id v31 = (id)[(CPSAbridgableLabel *)v32 trailingAnchor];
  id v30 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v29 = [(UILayoutGuide *)v30 trailingAnchor];
  id v28 = (id)objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v100[11] = v28;
  id v27 = [(CPSPrimaryManeuverView *)v99 subtitleLabel];
  id v26 = (id)[(CPSAbridgableLabel *)v27 leadingAnchor];
  id v25 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v24 = [(UILayoutGuide *)v25 leadingAnchor];
  id v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:constant:", 0.0);
  v100[12] = v23;
  id v22 = [(CPSPrimaryManeuverView *)v99 subtitleLabel];
  id v21 = (id)[(CPSAbridgableLabel *)v22 trailingAnchor];
  id v20 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v19 = [(UILayoutGuide *)v20 trailingAnchor];
  id v18 = (id)objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
  v100[13] = v18;
  id v17 = [(CPSPrimaryManeuverView *)v99 subtitleLabel];
  id v16 = (id)[(CPSAbridgableLabel *)v17 topAnchor];
  id v15 = [(CPSPrimaryManeuverView *)v99 titleLabel];
  id v14 = (id)[(CPSAbridgableLabel *)v15 bottomAnchor];
  id v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 4.0);
  v100[14] = v13;
  id v12 = [(CPSPrimaryManeuverView *)v99 subtitleLabel];
  id v11 = (id)[(CPSAbridgableLabel *)v12 bottomAnchor];
  id v10 = [(CPSPrimaryManeuverView *)v99 centeringLayoutGuide];
  id v9 = [(UILayoutGuide *)v10 bottomAnchor];
  id v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:constant:", 0.0);
  v100[15] = v8;
  id v7 = [(CPSPrimaryManeuverView *)v99 junctionImageView];
  id v6 = (id)[(CPSAspectFitImageView *)v7 heightAnchor];
  id v5 = (id)[v6 constraintEqualToConstant:0.0];
  v100[16] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:17];
  objc_msgSend(v3, "addObjectsFromArray:");

  id v83 = v98[0];
  objc_storeStrong(v98, 0);

  return v83;
}

- (id)_fullSubtitleNextToImageConstraints
{
  v168[22] = *MEMORY[0x263EF8340];
  id v162 = objc_opt_class();
  id v163 = [(CPSPrimaryManeuverView *)self maneuver];
  id v164 = (id)objc_msgSend(v162, "symbolImageForManeuver:");

  if (v164)
  {
    id v161 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v160 = [(UILayoutGuide *)v161 centerYAnchor];
    id v159 = (id)[(CPSPrimaryManeuverView *)self centerYAnchor];
    id v158 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v160, "constraintEqualToAnchor:");
    v168[0] = v158;
    id v157 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v156 = [(UILayoutGuide *)v157 leadingAnchor];
    id v155 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v154 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v156, "constraintEqualToAnchor:constant:", 13.0);
    v168[1] = v154;
    double v153 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v152 = [(UILayoutGuide *)v153 trailingAnchor];
    id v151 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v150 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v152, "constraintEqualToAnchor:constant:", -13.0);
    v168[2] = v150;
    id v149 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v148 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v147 = [(UILayoutGuide *)v148 topAnchor];
    id v146 = (id)objc_msgSend(v149, "constraintLessThanOrEqualToAnchor:constant:", -4.0);
    v168[3] = v146;
    id v145 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
    id v144 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v143 = [(UILayoutGuide *)v144 bottomAnchor];
    id v142 = (id)objc_msgSend(v145, "constraintGreaterThanOrEqualToAnchor:constant:");
    v168[4] = v142;
    id v141 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v140 = (id)[(UIImageView *)v141 topAnchor];
    id v139 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    v138 = [(UILayoutGuide *)v139 topAnchor];
    id v137 = (id)objc_msgSend(v140, "constraintGreaterThanOrEqualToAnchor:constant:");
    v168[5] = v137;
    id v136 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v135 = (id)[(UIImageView *)v136 leadingAnchor];
    id v134 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    double v133 = [(UILayoutGuide *)v134 leadingAnchor];
    id v132 = (id)objc_msgSend(v135, "constraintEqualToAnchor:constant:", 0.0);
    v168[6] = v132;
    id v131 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v130 = (id)[(UIImageView *)v131 heightAnchor];
    [(CPSPrimaryManeuverView *)self symbolImageHeight];
    id v129 = (id)objc_msgSend(v130, "constraintLessThanOrEqualToConstant:");
    v168[7] = v129;
    id v128 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v127 = (id)[(UIImageView *)v128 bottomAnchor];
    id v126 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v125 = [(UILayoutGuide *)v126 bottomAnchor];
    id v124 = (id)objc_msgSend(v127, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v168[8] = v124;
    id v123 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v122 = [(UILayoutGuide *)v123 topAnchor];
    id v121 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v120 = [(UILayoutGuide *)v121 topAnchor];
    id v119 = (id)-[NSLayoutYAxisAnchor constraintGreaterThanOrEqualToAnchor:constant:](v122, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
    v168[9] = v119;
    id v118 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v117 = [(UILayoutGuide *)v118 centerYAnchor];
    id v116 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v115 = (id)[(UIImageView *)v116 centerYAnchor];
    id v114 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v117, "constraintEqualToAnchor:");
    v168[10] = v114;
    id v113 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v112 = [(UILayoutGuide *)v113 leadingAnchor];
    id v111 = [(CPSPrimaryManeuverView *)self symbolImageView];
    id v110 = (id)[(UIImageView *)v111 trailingAnchor];
    id v109 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v112, "constraintEqualToAnchor:constant:", 4.0);
    v168[11] = v109;
    id v108 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v107 = [(UILayoutGuide *)v108 trailingAnchor];
    id v106 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v105 = [(UILayoutGuide *)v106 trailingAnchor];
    id v104 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v107, "constraintEqualToAnchor:constant:", 0.0);
    v168[12] = v104;
    id v103 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v102 = [(UILayoutGuide *)v103 bottomAnchor];
    id v101 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v100 = [(UILayoutGuide *)v101 bottomAnchor];
    id v99 = (id)-[NSLayoutYAxisAnchor constraintLessThanOrEqualToAnchor:constant:](v102, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v168[13] = v99;
    id v98 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v97 = (id)[(CPSAbridgableLabel *)v98 leadingAnchor];
    id v96 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v95 = [(UILayoutGuide *)v96 leadingAnchor];
    id v94 = (id)objc_msgSend(v97, "constraintEqualToAnchor:");
    v168[14] = v94;
    id v93 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v92 = (id)[(CPSAbridgableLabel *)v93 topAnchor];
    id v91 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v90 = [(UILayoutGuide *)v91 topAnchor];
    id v89 = (id)objc_msgSend(v92, "constraintEqualToAnchor:");
    v168[15] = v89;
    id v88 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v87 = (id)[(CPSAbridgableLabel *)v88 trailingAnchor];
    id v86 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v85 = [(UILayoutGuide *)v86 trailingAnchor];
    id v84 = (id)objc_msgSend(v87, "constraintLessThanOrEqualToAnchor:");
    v168[16] = v84;
    id v83 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v82 = (id)[(CPSAbridgableLabel *)v83 bottomAnchor];
    id v81 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v80 = (id)[(CPSAbridgableLabel *)v81 topAnchor];
    id v79 = (id)objc_msgSend(v82, "constraintEqualToAnchor:constant:", -2.0);
    v168[17] = v79;
    id v78 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v77 = (id)[(CPSAbridgableLabel *)v78 leadingAnchor];
    id v76 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v75 = [(UILayoutGuide *)v76 leadingAnchor];
    id v74 = (id)objc_msgSend(v77, "constraintEqualToAnchor:");
    v168[18] = v74;
    id v73 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v72 = (id)[(CPSAbridgableLabel *)v73 trailingAnchor];
    id v71 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v70 = [(UILayoutGuide *)v71 trailingAnchor];
    id v69 = (id)objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:");
    v168[19] = v69;
    id v68 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v67 = (id)[(CPSAbridgableLabel *)v68 bottomAnchor];
    id v66 = [(CPSPrimaryManeuverView *)self labelCenteringLayoutGuide];
    id v65 = [(UILayoutGuide *)v66 bottomAnchor];
    id v64 = (id)objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:");
    v168[20] = v64;
    id v63 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v62 = (id)[(CPSAspectFitImageView *)v63 heightAnchor];
    id v61 = (id)[v62 constraintEqualToConstant:0.0];
    v168[21] = v61;
    id v166 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v168 count:22];
  }
  else
  {
    id v60 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v59 = [(UILayoutGuide *)v60 centerYAnchor];
    id v58 = (id)[(CPSPrimaryManeuverView *)self centerYAnchor];
    id v57 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v59, "constraintEqualToAnchor:");
    v167[0] = v57;
    id v56 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v55 = [(UILayoutGuide *)v56 leadingAnchor];
    id v54 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
    id v53 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v55, "constraintEqualToAnchor:constant:", 13.0);
    v167[1] = v53;
    id v52 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v51 = [(UILayoutGuide *)v52 trailingAnchor];
    id v50 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
    id v49 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v51, "constraintEqualToAnchor:constant:", -13.0);
    v167[2] = v49;
    id v48 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
    id v47 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v46 = [(UILayoutGuide *)v47 topAnchor];
    id v45 = (id)objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:constant:", -4.0);
    v167[3] = v45;
    id v44 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
    id v43 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v42 = [(UILayoutGuide *)v43 bottomAnchor];
    id v41 = (id)objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:constant:");
    v167[4] = v41;
    id v40 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v39 = (id)[(CPSAbridgableLabel *)v40 topAnchor];
    id v38 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v37 = [(UILayoutGuide *)v38 topAnchor];
    id v36 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:");
    v167[5] = v36;
    id v35 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v34 = (id)[(CPSAbridgableLabel *)v35 leadingAnchor];
    id v33 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v32 = [(UILayoutGuide *)v33 leadingAnchor];
    id v31 = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:");
    v167[6] = v31;
    id v30 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v29 = (id)[(CPSAbridgableLabel *)v30 trailingAnchor];
    id v28 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v27 = [(UILayoutGuide *)v28 trailingAnchor];
    id v26 = (id)objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:constant:");
    v167[7] = v26;
    id v25 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v24 = (id)[(CPSAbridgableLabel *)v25 leadingAnchor];
    id v23 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v22 = [(UILayoutGuide *)v23 leadingAnchor];
    id v21 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:", 8.0);
    v167[8] = v21;
    id v20 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v19 = (id)[(CPSAbridgableLabel *)v20 trailingAnchor];
    id v18 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v17 = [(UILayoutGuide *)v18 trailingAnchor];
    id v16 = (id)objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
    v167[9] = v16;
    id v15 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v14 = (id)[(CPSAbridgableLabel *)v15 topAnchor];
    id v13 = [(CPSPrimaryManeuverView *)self titleLabel];
    id v12 = (id)[(CPSAbridgableLabel *)v13 bottomAnchor];
    id v11 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:", 4.0);
    v167[10] = v11;
    id v10 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v9 = (id)[(CPSAbridgableLabel *)v10 bottomAnchor];
    id v8 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
    id v7 = [(UILayoutGuide *)v8 bottomAnchor];
    id v6 = (id)objc_msgSend(v9, "constraintEqualToAnchor:constant:", 0.0);
    v167[11] = v6;
    id v5 = [(CPSPrimaryManeuverView *)self junctionImageView];
    id v4 = (id)[(CPSAspectFitImageView *)v5 heightAnchor];
    id v3 = (id)[v4 constraintEqualToConstant:0.0];
    v167[12] = v3;
    id v166 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:13];
  }

  return v166;
}

- (id)_minimalLayoutConstraints
{
  v89[19] = *MEMORY[0x263EF8340];
  id v87 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v86 = [(UILayoutGuide *)v87 centerYAnchor];
  id v85 = (id)[(CPSPrimaryManeuverView *)self centerYAnchor];
  id v84 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v86, "constraintEqualToAnchor:");
  v89[0] = v84;
  id v83 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v82 = [(UILayoutGuide *)v83 leadingAnchor];
  id v81 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
  id v80 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v82, "constraintEqualToAnchor:constant:", 13.0);
  v89[1] = v80;
  id v79 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v78 = [(UILayoutGuide *)v79 trailingAnchor];
  id v77 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
  id v76 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v78, "constraintEqualToAnchor:constant:", -13.0);
  v89[2] = v76;
  id v75 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
  id v74 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v73 = [(UILayoutGuide *)v74 topAnchor];
  id v72 = (id)objc_msgSend(v75, "constraintLessThanOrEqualToAnchor:");
  v89[3] = v72;
  id v71 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
  id v70 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v69 = [(UILayoutGuide *)v70 bottomAnchor];
  id v68 = (id)objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:");
  v89[4] = v68;
  id v67 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v66 = (id)[(UIImageView *)v67 topAnchor];
  id v65 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v64 = [(UILayoutGuide *)v65 topAnchor];
  id v63 = (id)objc_msgSend(v66, "constraintEqualToAnchor:constant:");
  v89[5] = v63;
  id v62 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v61 = (id)[(UIImageView *)v62 leadingAnchor];
  id v60 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v59 = [(UILayoutGuide *)v60 leadingAnchor];
  id v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:constant:");
  v89[6] = v58;
  id v57 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v56 = (id)[(UIImageView *)v57 bottomAnchor];
  id v55 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v54 = [(UILayoutGuide *)v55 bottomAnchor];
  id v53 = (id)objc_msgSend(v56, "constraintEqualToAnchor:constant:", 0.0);
  v89[7] = v53;
  id v52 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v51 = (id)[(UIImageView *)v52 heightAnchor];
  [(CPSPrimaryManeuverView *)self symbolImageHeight];
  id v50 = (id)objc_msgSend(v51, "constraintLessThanOrEqualToConstant:");
  v89[8] = v50;
  id v49 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v48 = (id)[(CPSAbridgableLabel *)v49 leadingAnchor];
  id v47 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v46 = (id)[(UIImageView *)v47 trailingAnchor];
  id v45 = (id)objc_msgSend(v48, "constraintEqualToAnchor:constant:", 8.0);
  v89[9] = v45;
  id v44 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v43 = (id)[(CPSAbridgableLabel *)v44 centerYAnchor];
  id v42 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v41 = (id)[(UIImageView *)v42 centerYAnchor];
  id v40 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
  v89[10] = v40;
  id v39 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v38 = (id)[(CPSAbridgableLabel *)v39 trailingAnchor];
  id v37 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v36 = [(UILayoutGuide *)v37 trailingAnchor];
  id v35 = (id)objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:constant:");
  v89[11] = v35;
  id v34 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v33 = (id)[(CPSAbridgableLabel *)v34 bottomAnchor];
  id v32 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v31 = [(UILayoutGuide *)v32 bottomAnchor];
  id v30 = (id)objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:");
  v89[12] = v30;
  id v29 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v28 = (id)[(CPSAbridgableLabel *)v29 leadingAnchor];
  id v27 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v26 = [(UILayoutGuide *)v27 leadingAnchor];
  id v25 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:", 8.0);
  v89[13] = v25;
  id v24 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v23 = (id)[(CPSAbridgableLabel *)v24 topAnchor];
  id v22 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v21 = (id)[(CPSAbridgableLabel *)v22 bottomAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", 0.0);
  v89[14] = v20;
  id v19 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v18 = (id)[(CPSAbridgableLabel *)v19 bottomAnchor];
  id v17 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v16 = [(UILayoutGuide *)v17 bottomAnchor];
  id v15 = (id)objc_msgSend(v18, "constraintEqualToAnchor:constant:", 0.0);
  v89[15] = v15;
  id v14 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v13 = (id)[(CPSAbridgableLabel *)v14 trailingAnchor];
  id v12 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v11 = [(UILayoutGuide *)v12 trailingAnchor];
  id v10 = (id)objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
  v89[16] = v10;
  id v9 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v8 = (id)[(CPSAbridgableLabel *)v9 heightAnchor];
  id v7 = (id)[v8 constraintEqualToConstant:0.0];
  v89[17] = v7;
  id v6 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v5 = (id)[(CPSAspectFitImageView *)v6 heightAnchor];
  id v3 = (id)[v5 constraintEqualToConstant:0.0];
  v89[18] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:19];

  return v4;
}

- (id)_minimalLayoutWideImageConstraints
{
  v99[21] = *MEMORY[0x263EF8340];
  id v97 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v96 = [(UILayoutGuide *)v97 centerYAnchor];
  id v95 = (id)[(CPSPrimaryManeuverView *)self centerYAnchor];
  id v94 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v96, "constraintEqualToAnchor:");
  v99[0] = v94;
  id v93 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v92 = [(UILayoutGuide *)v93 leadingAnchor];
  id v91 = (id)[(CPSPrimaryManeuverView *)self leadingAnchor];
  id v90 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v92, "constraintEqualToAnchor:constant:", 13.0);
  v99[1] = v90;
  id v89 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v88 = [(UILayoutGuide *)v89 trailingAnchor];
  id v87 = (id)[(CPSPrimaryManeuverView *)self trailingAnchor];
  id v86 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v88, "constraintEqualToAnchor:constant:", -13.0);
  v99[2] = v86;
  id v85 = (id)[(CPSPrimaryManeuverView *)self topAnchor];
  id v84 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v83 = [(UILayoutGuide *)v84 topAnchor];
  id v82 = (id)objc_msgSend(v85, "constraintLessThanOrEqualToAnchor:");
  v99[3] = v82;
  id v81 = (id)[(CPSPrimaryManeuverView *)self bottomAnchor];
  id v80 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v79 = [(UILayoutGuide *)v80 bottomAnchor];
  id v78 = (id)objc_msgSend(v81, "constraintGreaterThanOrEqualToAnchor:");
  v99[4] = v78;
  id v77 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v76 = (id)[(UIImageView *)v77 topAnchor];
  id v75 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v74 = [(UILayoutGuide *)v75 topAnchor];
  id v73 = (id)objc_msgSend(v76, "constraintEqualToAnchor:constant:");
  v99[5] = v73;
  id v72 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v71 = (id)[(UIImageView *)v72 leadingAnchor];
  id v70 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v69 = [(UILayoutGuide *)v70 leadingAnchor];
  id v68 = (id)objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
  v99[6] = v68;
  id v67 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v66 = (id)[(UIImageView *)v67 trailingAnchor];
  id v65 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v64 = [(UILayoutGuide *)v65 trailingAnchor];
  id v63 = (id)objc_msgSend(v66, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
  v99[7] = v63;
  id v62 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v61 = (id)[(UIImageView *)v62 centerXAnchor];
  id v60 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v59 = [(UILayoutGuide *)v60 centerXAnchor];
  id v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
  v99[8] = v58;
  id v57 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v56 = (id)[(UIImageView *)v57 widthAnchor];
  id v55 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v54 = [(UILayoutGuide *)v55 widthAnchor];
  id v53 = (id)objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:");
  v99[9] = v53;
  id v52 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v51 = (id)[(UIImageView *)v52 heightAnchor];
  [(CPSPrimaryManeuverView *)self symbolImageHeight];
  id v50 = (id)objc_msgSend(v51, "constraintLessThanOrEqualToConstant:");
  v99[10] = v50;
  id v49 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v48 = (id)[(CPSAbridgableLabel *)v49 leadingAnchor];
  id v47 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v46 = [(UILayoutGuide *)v47 leadingAnchor];
  id v45 = (id)objc_msgSend(v48, "constraintEqualToAnchor:constant:");
  v99[11] = v45;
  id v44 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v43 = (id)[(CPSAbridgableLabel *)v44 topAnchor];
  id v42 = [(CPSPrimaryManeuverView *)self symbolImageView];
  id v41 = (id)[(UIImageView *)v42 bottomAnchor];
  id v40 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
  v99[12] = v40;
  id v39 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v38 = (id)[(CPSAbridgableLabel *)v39 trailingAnchor];
  id v37 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v36 = [(UILayoutGuide *)v37 trailingAnchor];
  id v35 = (id)objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:constant:");
  v99[13] = v35;
  id v34 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v33 = (id)[(CPSAbridgableLabel *)v34 bottomAnchor];
  id v32 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v31 = [(UILayoutGuide *)v32 bottomAnchor];
  id v30 = (id)objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:");
  v99[14] = v30;
  id v29 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v28 = (id)[(CPSAbridgableLabel *)v29 leadingAnchor];
  id v27 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v26 = [(UILayoutGuide *)v27 leadingAnchor];
  id v25 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:", 8.0);
  v99[15] = v25;
  id v24 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v23 = (id)[(CPSAbridgableLabel *)v24 topAnchor];
  id v22 = [(CPSPrimaryManeuverView *)self titleLabel];
  id v21 = (id)[(CPSAbridgableLabel *)v22 bottomAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", 0.0);
  v99[16] = v20;
  id v19 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v18 = (id)[(CPSAbridgableLabel *)v19 bottomAnchor];
  id v17 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v16 = [(UILayoutGuide *)v17 bottomAnchor];
  id v15 = (id)objc_msgSend(v18, "constraintEqualToAnchor:constant:", 0.0);
  v99[17] = v15;
  id v14 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v13 = (id)[(CPSAbridgableLabel *)v14 trailingAnchor];
  id v12 = [(CPSPrimaryManeuverView *)self centeringLayoutGuide];
  id v11 = [(UILayoutGuide *)v12 trailingAnchor];
  id v10 = (id)objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
  v99[18] = v10;
  id v9 = [(CPSPrimaryManeuverView *)self subtitleLabel];
  id v8 = (id)[(CPSAbridgableLabel *)v9 heightAnchor];
  id v7 = (id)[v8 constraintEqualToConstant:0.0];
  v99[19] = v7;
  id v6 = [(CPSPrimaryManeuverView *)self junctionImageView];
  id v5 = (id)[(CPSAspectFitImageView *)v6 heightAnchor];
  id v3 = (id)[v5 constraintEqualToConstant:0.0];
  v99[20] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:21];

  return v4;
}

- (void)_switchToLayoutConfiguration:(id)a3
{
  id v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = location[0];
  id v28 = [(CPSPrimaryManeuverView *)v36 activeLayoutConfiguration];
  BOOL v29 = 0;
  if (objc_msgSend(v27, "isEqual:")) {
    BOOL v29 = v36->_activeLayoutConstraints != 0;
  }

  if (v29)
  {
    id v34 = CarPlaySupportGeneralLogging();
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = v34;
      os_log_type_t v26 = v33;
      __os_log_helper_16_0_0(v32);
      _os_log_impl(&dword_22B689000, v25, v26, "Maneuver already using this layout, skipping", v32, 2u);
    }
    objc_storeStrong(&v34, 0);
    int v31 = 1;
  }
  else
  {
    [(CPSPrimaryManeuverView *)v36 setActiveLayoutConfiguration:location[0]];
    id v30 = [(CPSPrimaryManeuverView *)v36 _formattedDistance];
    if (v30)
    {
      id v22 = [(CPSPrimaryManeuverView *)v36 titleLabel];
      id v21 = [(CPSPrimaryManeuverView *)v36 _titleFont];
      -[CPSAbridgableLabel setFont:](v22, "setFont:");

      id v23 = [(CPSPrimaryManeuverView *)v36 titleLabel];
      [(CPSAbridgableLabel *)v23 setText:v30];

      id v24 = (id)[location[0] attributedInstruction];
      if (v24)
      {
        id v20 = [(CPSPrimaryManeuverView *)v36 subtitleLabel];
        id v19 = (id)[location[0] attributedInstruction];
        -[CPSAbridgableLabel setAttributedText:](v20, "setAttributedText:");
      }
      else
      {
        id v18 = [(CPSPrimaryManeuverView *)v36 subtitleLabel];
        id v17 = (id)[location[0] instruction];
        -[CPSAbridgableLabel setText:](v18, "setText:");
      }
    }
    else
    {
      id v15 = [(CPSPrimaryManeuverView *)v36 titleLabel];
      id v14 = [(CPSPrimaryManeuverView *)v36 _subtitleFont];
      -[CPSAbridgableLabel setFont:](v15, "setFont:");

      id v16 = (id)[location[0] attributedInstruction];
      if (v16)
      {
        id v13 = [(CPSPrimaryManeuverView *)v36 titleLabel];
        id v12 = (id)[location[0] attributedInstruction];
        -[CPSAbridgableLabel setAttributedText:](v13, "setAttributedText:");
      }
      else
      {
        id v11 = [(CPSPrimaryManeuverView *)v36 titleLabel];
        id v10 = (id)[location[0] instruction];
        -[CPSAbridgableLabel setText:](v11, "setText:");
      }
    }
    id v7 = [(CPSPrimaryManeuverView *)v36 symbolImageView];
    id v6 = (id)[location[0] symbolImage];
    -[UIImageView setImage:](v7, "setImage:");

    id v9 = (id)[location[0] junctionImage];
    id v8 = [(CPSPrimaryManeuverView *)v36 junctionImageView];
    [(CPSAspectFitImageView *)v8 setImage:v9];

    unint64_t v3 = [location[0] layout];
    if (v3 <= 1)
    {
      unint64_t v5 = v3 - 1;
      char v4 = 0;
    }
    else
    {
      unint64_t v5 = v3 - 1;
      char v4 = 1;
    }
    if ((v4 & 1) == 0)
    {
      switch(v5)
      {
        case 0uLL:
          [(CPSPrimaryManeuverView *)v36 _activateFullLayoutConstraints];
          break;
        case 1uLL:
          [(CPSPrimaryManeuverView *)v36 _activateFullLayoutWideImageConstraints];
          break;
        case 2uLL:
          [(CPSPrimaryManeuverView *)v36 _activateJunctionViewNoInstructionConstraints];
          break;
        case 3uLL:
          [(CPSPrimaryManeuverView *)v36 _activateJunctionViewNoInstructionWideImageConstraints];
          break;
        case 4uLL:
          [(CPSPrimaryManeuverView *)v36 _activateFullNoJunctionViewLayoutConstraints];
          break;
        case 5uLL:
          [(CPSPrimaryManeuverView *)v36 _activateFullNoJunctionViewWideImageLayoutConstraints];
          break;
        case 6uLL:
          [(CPSPrimaryManeuverView *)v36 _activateFullSubtitleNextToImageConstraints];
          break;
        case 7uLL:
          [(CPSPrimaryManeuverView *)v36 _activateMinimalWideImageLayoutConstraints];
          break;
        case 8uLL:
          [(CPSPrimaryManeuverView *)v36 _activateMinimalLayoutConstraints];
          break;
        default:
          JUMPOUT(0);
      }
    }
    objc_storeStrong(&v30, 0);
    int v31 = 0;
  }
  objc_storeStrong(location, 0);
}

- (id)_formattedDistance
{
  id v8 = self;
  location[1] = (id)a2;
  id v6 = [(CPSPrimaryManeuverView *)self currentTravelEstimates];
  location[0] = [(CPTravelEstimates *)v6 distanceRemaining];

  if (!location[0])
  {
    unint64_t v5 = [(CPSPrimaryManeuverView *)v8 maneuver];
    char v4 = [(CPManeuver *)v5 initialTravelEstimates];
    location[0] = [(CPTravelEstimates *)v4 distanceRemaining];
  }
  if (location[0]) {
    id v9 = CPSFormattedDistanceWithMediumUnit(location[0]);
  }
  else {
    id v9 = 0;
  }
  objc_storeStrong(location, 0);
  double v2 = v9;

  return v2;
}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 18.0, *MEMORY[0x263F1D318], a2, self);
}

- (id)_subtitleFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 14.0, *MEMORY[0x263F1D318], a2, self);
}

- (void)setUsesCustomBackgroundColor:(BOOL)a3
{
  if (self->_usesCustomBackgroundColor != a3)
  {
    self->_usesCustomBackgroundColor = a3;
    [(CPSPrimaryManeuverView *)self _updateSubtitleTextColor];
    [(CPSPrimaryManeuverView *)self _updateJunctionBackgroundColor];
  }
}

- (void)_updateSubtitleTextColor
{
  if ([(CPSPrimaryManeuverView *)self usesCustomBackgroundColor])
  {
    unint64_t v5 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v4 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v5, "setTextColor:");
  }
  else
  {
    unint64_t v3 = [(CPSPrimaryManeuverView *)self subtitleLabel];
    id v2 = (id)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_7];
    -[CPSAbridgableLabel setTextColor:](v3, "setTextColor:");
  }
}

id __50__CPSPrimaryManeuverView__updateSubtitleTextColor__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[MEMORY[0x263F1C550] labelColor];
  id v4 = (id)[v3 colorWithAlphaComponent:0.75];

  objc_storeStrong(location, 0);

  return v4;
}

- (void)_updateJunctionBackgroundColor
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = [(CPSPrimaryManeuverView *)self junctionBackgroundColor];
  id v2 = [(CPSPrimaryManeuverView *)v4 junctionImageBackgroundView];
  [(UIView *)v2 setBackgroundColor:v3[0]];

  objc_storeStrong(v3, 0);
}

- (BOOL)hasJunctionImageBackground
{
  return 0;
}

- (id)junctionBackgroundColor
{
  if ([(CPSPrimaryManeuverView *)self usesCustomBackgroundColor])
  {
    id v3 = (void *)MEMORY[0x263F1C550];
    id v5 = CPSFrameworkBundle();
    id v4 = (id)[(CPSPrimaryManeuverView *)self traitCollection];
    id v7 = (id)objc_msgSend(v3, "colorNamed:inBundle:compatibleWithTraitCollection:", @"GuidanceColor30AlphaLightWhiteDarkBlack", v5);
  }
  else
  {
    id v7 = (id)[MEMORY[0x263F1C550] colorWithWhite:0.247058824 alpha:1.0];
  }

  return v7;
}

- (BOOL)fitJunctionViewToHeight
{
  return 0;
}

- (CPSAbridgableLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (CPSAbridgableLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
}

- (CPSAspectFitImageView)junctionImageView
{
  return self->_junctionImageView;
}

- (void)setJunctionImageView:(id)a3
{
}

- (NSArray)activeLayoutConstraints
{
  return self->_activeLayoutConstraints;
}

- (UILayoutGuide)labelCenteringLayoutGuide
{
  return self->_labelCenteringLayoutGuide;
}

- (void)setLabelCenteringLayoutGuide:(id)a3
{
}

- (UILayoutGuide)yCenteringGuide
{
  return self->_yCenteringGuide;
}

- (void)setYCenteringGuide:(id)a3
{
}

- (UILayoutGuide)centeringLayoutGuide
{
  return self->_centeringLayoutGuide;
}

- (void)setCenteringLayoutGuide:(id)a3
{
}

- (CPSPrimaryManeuverLayoutConfiguration)activeLayoutConfiguration
{
  return self->_activeLayoutConfiguration;
}

- (CPSPrimaryManeuverLayoutConfiguration)layoutConfigurationForIntrinsicSizing
{
  return self->_layoutConfigurationForIntrinsicSizing;
}

- (void)setLayoutConfigurationForIntrinsicSizing:(id)a3
{
}

- (CPManeuver)maneuver
{
  return self->_maneuver;
}

- (CPTravelEstimates)currentTravelEstimates
{
  return self->_currentTravelEstimates;
}

- (NSArray)layoutConfigurations
{
  return self->_layoutConfigurations;
}

- (void)setLayoutConfigurations:(id)a3
{
}

- (BOOL)usesCustomBackgroundColor
{
  return self->_usesCustomBackgroundColor;
}

- (BOOL)calculationViewIsSizing
{
  return self->_calculationViewIsSizing;
}

- (void)setCalculationViewIsSizing:(BOOL)a3
{
  self->_calculationViewIsSizing = a3;
}

- (double)generatedWidth
{
  return self->_generatedWidth;
}

- (void)setGeneratedWidth:(double)a3
{
  self->_generatedWidth = a3;
}

- (UIView)junctionImageBackgroundView
{
  return self->_junctionImageBackgroundView;
}

- (void)setJunctionImageBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end