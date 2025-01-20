@interface DBInCallWidgetMultiwayTitleButton
- (CPSMultilineLabel)multilineTitleLabel;
- (DBInCallWidgetMultiwayTitleButton)initWithFrame:(CGRect)a3;
- (UIView)focusView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setFocusView:(id)a3;
- (void)setMultilineTitleLabel:(id)a3;
- (void)setupConstraints;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBInCallWidgetMultiwayTitleButton

- (DBInCallWidgetMultiwayTitleButton)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)DBInCallWidgetMultiwayTitleButton;
  v3 = -[DBInCallWidgetMultiwayTitleButton initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v9 setUserInteractionEnabled:0];
    v10 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [(UIView *)v9 setBackgroundColor:v10];

    v11 = [(UIView *)v9 layer];
    [v11 setCornerRadius:8.0];

    [(UIView *)v9 setHidden:1];
    [(DBInCallWidgetMultiwayTitleButton *)v3 addSubview:v9];
    focusView = v3->_focusView;
    v3->_focusView = v9;
    v13 = v9;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F31320]), "initWithFrame:", v5, v6, v7, v8);
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setUserInteractionEnabled:0];
    v15 = [MEMORY[0x263F825C8] labelColor];
    [v14 setTextColor:v15];

    [v14 setTextAlignment:1];
    v16 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1280];
    [v14 setFont:v16];

    [v14 setNumberOfLines:3];
    [(DBInCallWidgetMultiwayTitleButton *)v3 addSubview:v14];
    multilineTitleLabel = v3->_multilineTitleLabel;
    v3->_multilineTitleLabel = (CPSMultilineLabel *)v14;

    [(DBInCallWidgetMultiwayTitleButton *)v3 setupConstraints];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBInCallWidgetMultiwayTitleButton;
  [(DBInCallWidgetMultiwayTitleButton *)&v6 traitCollectionDidChange:a3];
  id v4 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1280];
  double v5 = [(DBInCallWidgetMultiwayTitleButton *)self multilineTitleLabel];
  [v5 setFont:v4];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)DBInCallWidgetMultiwayTitleButton;
  id v6 = a3;
  [(DBInCallWidgetMultiwayTitleButton *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  objc_msgSend(v6, "nextFocusedItem", v11.receiver, v11.super_class);
  double v7 = (DBInCallWidgetMultiwayTitleButton *)objc_claimAutoreleasedReturnValue();

  double v8 = [(DBInCallWidgetMultiwayTitleButton *)self focusView];
  [v8 setHidden:v7 != self];

  if (v7 == self) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  v9 = [MEMORY[0x263F825C8] labelColor];
  }
  v10 = [(DBInCallWidgetMultiwayTitleButton *)self multilineTitleLabel];
  [v10 setTextColor:v9];
}

- (void)setupConstraints
{
  v40[8] = *MEMORY[0x263EF8340];
  v3 = [(DBInCallWidgetMultiwayTitleButton *)self multilineTitleLabel];
  id v4 = [v3 textLayoutGuide];

  v26 = (void *)MEMORY[0x263F08938];
  v39 = [(DBInCallWidgetMultiwayTitleButton *)self multilineTitleLabel];
  v38 = [v39 leadingAnchor];
  v37 = [(DBInCallWidgetMultiwayTitleButton *)self leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v40[0] = v36;
  v35 = [(DBInCallWidgetMultiwayTitleButton *)self multilineTitleLabel];
  v34 = [v35 trailingAnchor];
  v33 = [(DBInCallWidgetMultiwayTitleButton *)self trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v40[1] = v32;
  v31 = [(DBInCallWidgetMultiwayTitleButton *)self multilineTitleLabel];
  v30 = [v31 topAnchor];
  v29 = [(DBInCallWidgetMultiwayTitleButton *)self topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v40[2] = v28;
  v27 = [(DBInCallWidgetMultiwayTitleButton *)self multilineTitleLabel];
  v25 = [v27 bottomAnchor];
  v24 = [(DBInCallWidgetMultiwayTitleButton *)self bottomAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v40[3] = v23;
  v22 = [(DBInCallWidgetMultiwayTitleButton *)self focusView];
  v20 = [v22 leadingAnchor];
  objc_super v19 = [v4 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:-2.0];
  v40[4] = v18;
  v17 = [(DBInCallWidgetMultiwayTitleButton *)self focusView];
  v16 = [v17 trailingAnchor];
  v15 = [v4 trailingAnchor];
  double v5 = [v16 constraintEqualToAnchor:v15 constant:2.0];
  v40[5] = v5;
  id v6 = [(DBInCallWidgetMultiwayTitleButton *)self focusView];
  double v7 = [v6 topAnchor];
  v21 = v4;
  double v8 = [v4 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v40[6] = v9;
  v10 = [(DBInCallWidgetMultiwayTitleButton *)self focusView];
  objc_super v11 = [v10 bottomAnchor];
  v12 = [v4 bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v40[7] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:8];
  [v26 activateConstraints:v14];
}

- (CPSMultilineLabel)multilineTitleLabel
{
  return self->_multilineTitleLabel;
}

- (void)setMultilineTitleLabel:(id)a3
{
}

- (UIView)focusView
{
  return self->_focusView;
}

- (void)setFocusView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusView, 0);
  objc_storeStrong((id *)&self->_multilineTitleLabel, 0);
}

@end