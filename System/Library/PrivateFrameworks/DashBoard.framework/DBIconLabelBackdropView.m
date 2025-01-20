@interface DBIconLabelBackdropView
- (BOOL)isHighlighted;
- (CRSUIWallpaper)wallpaper;
- (DBIconLabelBackdropView)initWithWallpaper:(id)a3;
- (UIView)highlightView;
- (_TtC9DashBoard22DBDashboardPlatterView)platterView;
- (void)_updateHighlight;
- (void)_updatePlatter;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPlatterView:(id)a3;
- (void)setWallpaper:(id)a3;
@end

@implementation DBIconLabelBackdropView

- (DBIconLabelBackdropView)initWithWallpaper:(id)a3
{
  v49[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)DBIconLabelBackdropView;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = -[DBIconLabelBackdropView initWithFrame:](&v47, sel_initWithFrame_, *MEMORY[0x263F001A8], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    v11 = [(DBIconLabelBackdropView *)v9 layer];
    [v11 setAllowsGroupBlending:0];

    v12 = objc_alloc_init(_TtC9DashBoard22DBDashboardPlatterView);
    [(DBDashboardPlatterView *)v12 setPlatterCornerRadius:4.0];
    [(DBDashboardPlatterView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBIconLabelBackdropView *)v10 addSubview:v12];
    v33 = (void *)MEMORY[0x263F08938];
    v43 = [(DBIconLabelBackdropView *)v10 topAnchor];
    v41 = [(DBDashboardPlatterView *)v12 topAnchor];
    v39 = [v43 constraintEqualToAnchor:v41];
    v49[0] = v39;
    v37 = [(DBIconLabelBackdropView *)v10 bottomAnchor];
    v35 = [(DBDashboardPlatterView *)v12 bottomAnchor];
    v13 = [v37 constraintEqualToAnchor:v35];
    v49[1] = v13;
    v14 = [(DBIconLabelBackdropView *)v10 leftAnchor];
    v15 = [(DBDashboardPlatterView *)v12 leftAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v49[2] = v16;
    v17 = [(DBIconLabelBackdropView *)v10 rightAnchor];
    v45 = v12;
    v18 = [(DBDashboardPlatterView *)v12 rightAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v49[3] = v19;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
    v20 = id v46 = v4;
    [v33 activateConstraints:v20];

    [(DBIconLabelBackdropView *)v10 setPlatterView:v12];
    v21 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v5, v6, v7, v8);
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [MEMORY[0x263F825C8] labelColor];
    [v21 setBackgroundColor:v22];

    v44 = [v21 layer];
    [v44 setCornerRadius:4.0];
    [v44 setCornerCurve:*MEMORY[0x263F15A20]];
    [(DBIconLabelBackdropView *)v10 setHighlightView:v21];
    [(DBIconLabelBackdropView *)v10 addSubview:v21];
    v32 = (void *)MEMORY[0x263F08938];
    v42 = [(DBIconLabelBackdropView *)v10 topAnchor];
    v40 = [v21 topAnchor];
    v38 = [v42 constraintEqualToAnchor:v40];
    v48[0] = v38;
    v36 = [(DBIconLabelBackdropView *)v10 bottomAnchor];
    v34 = [v21 bottomAnchor];
    v23 = [v36 constraintEqualToAnchor:v34];
    v48[1] = v23;
    v24 = [(DBIconLabelBackdropView *)v10 leftAnchor];
    v25 = [v21 leftAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v48[2] = v26;
    v27 = [(DBIconLabelBackdropView *)v10 rightAnchor];
    v28 = [v21 rightAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v48[3] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
    [v32 activateConstraints:v30];

    id v4 = v46;
    [(DBIconLabelBackdropView *)v10 setWallpaper:v46];
  }
  return v10;
}

- (void)setWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaper, a3);
  [(DBIconLabelBackdropView *)self _updateHighlight];
  [(DBIconLabelBackdropView *)self _updatePlatter];
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  [(DBIconLabelBackdropView *)self _updateHighlight];
}

- (void)_updateHighlight
{
  if ([(DBIconLabelBackdropView *)self isHighlighted]
    && ([(DBIconLabelBackdropView *)self wallpaper],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 traits],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 iconLabelsRequireBackground],
        v4,
        v3,
        v5))
  {
    double v6 = [(DBIconLabelBackdropView *)self highlightView];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  else
  {
    double v6 = [(DBIconLabelBackdropView *)self highlightView];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  [v6 setHidden:v7];
}

- (void)_updatePlatter
{
  id v6 = [(DBIconLabelBackdropView *)self wallpaper];
  v3 = [v6 traits];
  uint64_t v4 = [v3 iconLabelsRequireBackground] ^ 1;
  int v5 = [(DBIconLabelBackdropView *)self platterView];
  [v5 setHidden:v4];
}

- (CRSUIWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (_TtC9DashBoard22DBDashboardPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end