@interface CPSRouteRowView
- (BOOL)isSelected;
- (CPRouteChoice)representedRouteChoice;
- (CPSAbridgableLabel)detail;
- (CPSAbridgableLabel)title;
- (CPSInvisibleButton)rowButton;
- (CPSRouteRowInteracting)interactionDelegate;
- (CPSRouteRowView)initWithFrame:(CGRect)a3;
- (UIImageView)checkmarkView;
- (UIStackView)labelStackView;
- (UIView)focusBackground;
- (void)_updateAppearance;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handleRowSelection:(id)a3;
- (void)setFocusBackground:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setRepresentedRouteChoice:(id)a3;
- (void)setRowButton:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSRouteRowView

- (CPSRouteRowView)initWithFrame:(CGRect)a3
{
  v78[16] = *MEMORY[0x263EF8340];
  CGRect v77 = a3;
  SEL v75 = a2;
  v76 = 0;
  v74.receiver = self;
  v74.super_class = (Class)CPSRouteRowView;
  v76 = -[CPSRouteRowView initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v76, v76);
  if (v76)
  {
    [(CPSRouteRowView *)v76 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSRouteRowView *)v76 setClipsToBounds:1];
    id v3 = objc_alloc(MEMORY[0x263F1CB60]);
    id v73 = (id)objc_msgSend(v3, "initWithFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    [v73 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = v73;
    id v10 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    objc_msgSend(v9, "setBackgroundColor:");

    [(CPSRouteRowView *)v76 addSubview:v73];
    [v73 setHidden:1];
    objc_storeStrong((id *)&v76->_focusBackground, v73);
    v72 = +[CPSInvisibleButton buttonWithType:](CPSInvisibleButton, "buttonWithType:");
    [(CPSInvisibleButton *)v72 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSInvisibleButton *)v72 addTarget:v76 action:sel_handleRowSelection_ forControlEvents:0x2000];
    objc_storeStrong((id *)&v76->_rowButton, v72);
    id v71 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [v71 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v76->_checkmarkView, v71);
    [v71 setUserInteractionEnabled:0];
    id v11 = (id)[v71 layer];
    [v11 setCornerRadius:11.0];

    objc_msgSend(v71, "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v4) = 1148846080;
    [v71 setContentCompressionResistancePriority:0 forAxis:v4];
    objc_msgSend(v71, "setContentMode:");
    [(CPSInvisibleButton *)v72 addSubview:v71];
    id v5 = objc_alloc(MEMORY[0x263F1C9B8]);
    id v70 = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v70 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v70 setAxis:1];
    [v70 setSpacing:-1.0];
    [v70 setAlignment:1];
    [(CPSInvisibleButton *)v72 addSubview:v70];
    objc_storeStrong((id *)&v76->_labelStackView, v70);
    v69 = objc_alloc_init(CPSAbridgableLabel);
    v12 = v69;
    id v13 = (id)[MEMORY[0x263F1C658] systemFontOfSize:16.0 weight:*MEMORY[0x263F1D330]];
    -[CPSAbridgableLabel setFont:](v12, "setFont:");

    [(CPSAbridgableLabel *)v69 setTextAlignment:4];
    v14 = v69;
    id v15 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v14, "setTextColor:");

    [(CPSAbridgableLabel *)v69 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(CPSAbridgableLabel *)v69 setContentCompressionResistancePriority:1 forAxis:v6];
    objc_storeStrong((id *)&v76->_title, v69);
    [v70 addArrangedSubview:v76->_title];
    id obj = objc_alloc_init(CPSAbridgableLabel);
    id v16 = obj;
    id v17 = (id)[MEMORY[0x263F1C658] systemFontOfSize:12.0 weight:*MEMORY[0x263F1D338]];
    objc_msgSend(v16, "setFont:");

    [obj setTextAlignment:4];
    id v18 = obj;
    id v19 = (id)[MEMORY[0x263F1C550] labelColor];
    objc_msgSend(v18, "setTextColor:");

    [obj setTranslatesAutoresizingMaskIntoConstraints:0];
    [obj setNumberOfLines:0];
    objc_storeStrong((id *)&v76->_detail, obj);
    [v70 addArrangedSubview:v76->_detail];
    [(CPSRouteRowView *)v76 addSubview:v72];
    v20 = (void *)MEMORY[0x263F08938];
    id v67 = (id)[(CPSInvisibleButton *)v72 leadingAnchor];
    id v66 = (id)[(CPSRouteRowView *)v76 leadingAnchor];
    id v65 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
    v78[0] = v65;
    id v64 = (id)[(CPSInvisibleButton *)v72 trailingAnchor];
    id v63 = (id)[(CPSRouteRowView *)v76 trailingAnchor];
    id v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
    v78[1] = v62;
    id v61 = (id)[(CPSInvisibleButton *)v72 topAnchor];
    id v60 = (id)[(CPSRouteRowView *)v76 topAnchor];
    id v59 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v78[2] = v59;
    id v58 = (id)[(CPSInvisibleButton *)v72 bottomAnchor];
    id v57 = (id)[(CPSRouteRowView *)v76 bottomAnchor];
    id v56 = (id)objc_msgSend(v58, "constraintEqualToAnchor:");
    v78[3] = v56;
    id v55 = (id)[v71 trailingAnchor];
    id v54 = (id)[(CPSInvisibleButton *)v72 trailingAnchor];
    id v53 = (id)objc_msgSend(v55, "constraintEqualToAnchor:constant:");
    v78[4] = v53;
    id v52 = (id)[v71 centerYAnchor];
    id v51 = (id)[(CPSInvisibleButton *)v72 centerYAnchor];
    id v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
    v78[5] = v50;
    id v49 = (id)[v71 heightAnchor];
    id v48 = (id)objc_msgSend(v49, "constraintEqualToConstant:");
    v78[6] = v48;
    id v47 = (id)[v71 widthAnchor];
    id v46 = (id)[v47 constraintEqualToConstant:22.0];
    v78[7] = v46;
    id v45 = (id)[v70 centerYAnchor];
    id v44 = (id)[(CPSRouteRowView *)v76 centerYAnchor];
    id v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
    v78[8] = v43;
    id v42 = (id)[v70 trailingAnchor];
    id v41 = (id)[v71 leadingAnchor];
    id v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:constant:", -8.0);
    v78[9] = v40;
    id v39 = (id)[v70 leadingAnchor];
    id v38 = (id)[(CPSRouteRowView *)v76 leadingAnchor];
    id v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:", 8.0);
    v78[10] = v37;
    id v36 = (id)[v70 heightAnchor];
    id v35 = (id)[(CPSRouteRowView *)v76 heightAnchor];
    id v34 = (id)objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:multiplier:", 1.0);
    v78[11] = v34;
    id v33 = (id)[v73 topAnchor];
    id v32 = (id)[(CPSRouteRowView *)v76 topAnchor];
    id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v78[12] = v31;
    id v30 = (id)[v73 bottomAnchor];
    id v29 = (id)[(CPSRouteRowView *)v76 bottomAnchor];
    id v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
    v78[13] = v28;
    id v27 = (id)[v73 leftAnchor];
    id v26 = (id)[(CPSRouteRowView *)v76 leftAnchor];
    id v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
    v78[14] = v25;
    id v24 = (id)[v73 rightAnchor];
    id v23 = (id)[(CPSRouteRowView *)v76 rightAnchor];
    id v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v78[15] = v22;
    id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:16];
    objc_msgSend(v20, "activateConstraints:");

    objc_storeStrong(&obj, 0);
    objc_storeStrong((id *)&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
    objc_storeStrong((id *)&v72, 0);
    objc_storeStrong(&v73, 0);
  }
  [(CPSRouteRowView *)v76 _updateAppearance];
  v8 = v76;
  objc_storeStrong((id *)&v76, 0);
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSRouteRowView *)v4 _updateAppearance];
  objc_storeStrong(location, 0);
}

- (void)handleRowSelection:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(CPSRouteRowView *)v7 interactionDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = v7;
    double v4 = [(CPSRouteRowView *)v7 representedRouteChoice];
    objc_msgSend(v5, "didSelectRow:representingRouteChoice:", v3);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setRepresentedRouteChoice:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v18->_representedRouteChoice, location[0]);
  id v10 = [(CPSRouteRowView *)v18 title];
  id v9 = (id)[location[0] summaryVariants];
  -[CPSAbridgableLabel setTextVariants:](v10, "setTextVariants:");

  id v11 = (id)[location[0] selectionSummaryVariants];
  char v15 = 0;
  BOOL v12 = 0;
  if (v11)
  {
    id v16 = (id)[location[0] selectionSummaryVariants];
    char v15 = 1;
    BOOL v12 = [v16 count] != 0;
  }
  if (v15) {

  }
  if (v12)
  {
    v8 = [(CPSRouteRowView *)v18 detail];
    id v7 = (id)[location[0] selectionSummaryVariants];
    -[CPSAbridgableLabel setTextVariants:](v8, "setTextVariants:");
  }
  else
  {
    id v5 = (id)[location[0] additionalInformationVariants];
    char v13 = 0;
    BOOL v6 = 0;
    if (v5)
    {
      id v14 = (id)[location[0] additionalInformationVariants];
      char v13 = 1;
      BOOL v6 = [v14 count] != 0;
    }
    if (v13) {

    }
    if (v6)
    {
      double v4 = [(CPSRouteRowView *)v18 detail];
      id v3 = (id)[location[0] additionalInformationVariants];
      -[CPSAbridgableLabel setTextVariants:](v4, "setTextVariants:");
    }
  }
  objc_storeStrong(location, 0);
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(CPSRouteRowView *)self _updateAppearance];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(CPSRouteRowView *)v7 _updateAppearance];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateAppearance
{
  id v38 = self;
  SEL v37 = a2;
  id v22 = [(CPSRouteRowView *)self rowButton];
  char v23 = [(CPSInvisibleButton *)v22 isFocused];

  char v36 = v23 & 1;
  if (v23)
  {
    id v17 = [(CPSRouteRowView *)v38 focusBackground];
    [(UIView *)v17 setHidden:0];

    id v19 = [(CPSRouteRowView *)v38 title];
    id v18 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    -[CPSAbridgableLabel setTextColor:](v19, "setTextColor:");

    id v21 = [(CPSRouteRowView *)v38 detail];
    id v20 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    -[CPSAbridgableLabel setTextColor:](v21, "setTextColor:");
  }
  else
  {
    BOOL v12 = [(CPSRouteRowView *)v38 focusBackground];
    [(UIView *)v12 setHidden:1];

    id v14 = [(CPSRouteRowView *)v38 title];
    id v13 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v14, "setTextColor:");

    id v16 = [(CPSRouteRowView *)v38 detail];
    id v15 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v16, "setTextColor:");
  }
  if ([(CPSRouteRowView *)v38 isSelected])
  {
    id location = (id)[MEMORY[0x263F1C6C8] configurationWithPointSize:4 weight:22.0];
    id v10 = (id)[MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark.circle.fill" withConfiguration:location];
    id v9 = [(CPSRouteRowView *)v38 checkmarkView];
    [(UIImageView *)v9 setImage:v10];

    id v11 = [(CPSRouteRowView *)v38 checkmarkView];
    char v33 = 0;
    char v31 = 0;
    if (v36)
    {
      id v34 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
      char v33 = 1;
      id v8 = v34;
    }
    else
    {
      id v32 = (id)[MEMORY[0x263F1C550] systemCyanColor];
      char v31 = 1;
      id v8 = v32;
    }
    [(UIImageView *)v11 setTintColor:v8];
    if (v31) {

    }
    if (v33) {
    id v7 = [(CPSRouteRowView *)v38 checkmarkView];
    }
    id v6 = (id)[(UIImageView *)v7 layer];
    [v6 setBorderWidth:0.0];

    objc_storeStrong(&location, 0);
  }
  else
  {
    id v30 = (id)[MEMORY[0x263F1C6C8] configurationWithPointSize:4 weight:22.0];
    id v4 = (id)[MEMORY[0x263F1C6B0] systemImageNamed:@"circle" withConfiguration:v30];
    id v3 = [(CPSRouteRowView *)v38 checkmarkView];
    [(UIImageView *)v3 setImage:v4];

    id v5 = [(CPSRouteRowView *)v38 checkmarkView];
    char v28 = 0;
    char v26 = 0;
    char v24 = 0;
    if (v36)
    {
      id v29 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
      char v28 = 1;
      id v2 = v29;
    }
    else
    {
      id v27 = (id)[MEMORY[0x263F1C550] _carSystemSecondaryColor];
      char v26 = 1;
      id v25 = (id)[v27 colorWithAlphaComponent:0.3];
      char v24 = 1;
      id v2 = v25;
    }
    [(UIImageView *)v5 setTintColor:v2];
    if (v24) {

    }
    if (v26) {
    if (v28)
    }

    objc_storeStrong(&v30, 0);
  }
}

- (CPRouteChoice)representedRouteChoice
{
  return self->_representedRouteChoice;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (CPSAbridgableLabel)title
{
  return self->_title;
}

- (CPSAbridgableLabel)detail
{
  return self->_detail;
}

- (UIView)focusBackground
{
  return self->_focusBackground;
}

- (void)setFocusBackground:(id)a3
{
}

- (CPSInvisibleButton)rowButton
{
  return self->_rowButton;
}

- (void)setRowButton:(id)a3
{
}

- (CPSRouteRowInteracting)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CPSRouteRowInteracting *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end