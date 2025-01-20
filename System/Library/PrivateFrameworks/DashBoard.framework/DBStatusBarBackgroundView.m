@interface DBStatusBarBackgroundView
- (BOOL)isDualStatusBar;
- (DBEnvironment)environment;
- (DBStatusBarBackgroundView)initWithEnvironment:(id)a3;
- (UIVisualEffectView)darkMaterial;
- (UIVisualEffectView)darkSiriMaterial;
- (UIVisualEffectView)lightMaterial;
- (UIVisualEffectView)lightSiriMaterial;
- (id)_backgroundColorForStyle:(int64_t)a3;
- (int64_t)colorVariantOverride;
- (void)setColorVariantOverride:(int64_t)a3;
- (void)setDarkMaterial:(id)a3;
- (void)setDarkSiriMaterial:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLightMaterial:(id)a3;
- (void)setLightSiriMaterial:(id)a3;
- (void)setupMaterialBackground;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMaterialForStyle:(int64_t)a3;
@end

@implementation DBStatusBarBackgroundView

- (DBStatusBarBackgroundView)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBStatusBarBackgroundView;
  v5 = -[DBStatusBarBackgroundView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    [(DBStatusBarBackgroundView *)v5 setEnvironment:v4];
    v6->_colorVariantOverride = -1;
    [(DBStatusBarBackgroundView *)v6 setupMaterialBackground];
    v7 = [(DBStatusBarBackgroundView *)v6 layer];
    [v7 setAllowsHitTesting:0];
  }
  return v6;
}

- (BOOL)isDualStatusBar
{
  v2 = [(DBStatusBarBackgroundView *)self environment];
  v3 = [v2 environmentConfiguration];
  char v4 = [v3 hasDualStatusBar];

  return v4;
}

- (void)setupMaterialBackground
{
  v118[2] = *MEMORY[0x263EF8340];
  if ([(DBStatusBarBackgroundView *)self isDualStatusBar])
  {
    v3 = [MEMORY[0x263F824D8] effectWithStyle:1102];
    char v4 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v3];
    [(DBStatusBarBackgroundView *)self setLightMaterial:v4];
  }
  else
  {
    v3 = [MEMORY[0x263F825D8] colorEffectSaturate:2.0];
    char v4 = [MEMORY[0x263F824D8] effectWithBlurRadius:20.0];
    id v5 = objc_alloc_init(MEMORY[0x263F82E50]);
    [(DBStatusBarBackgroundView *)self setLightMaterial:v5];

    v118[0] = v3;
    v118[1] = v4;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:2];
    v7 = [(DBStatusBarBackgroundView *)self lightMaterial];
    [v7 setBackgroundEffects:v6];
  }
  v8 = [(DBStatusBarBackgroundView *)self lightMaterial];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(DBStatusBarBackgroundView *)self lightMaterial];
  v10 = [v9 layer];
  [v10 setAllowsHitTesting:0];

  v11 = [(DBStatusBarBackgroundView *)self lightMaterial];
  [(DBStatusBarBackgroundView *)self addSubview:v11];

  if ([(DBStatusBarBackgroundView *)self isDualStatusBar])
  {
    v12 = [MEMORY[0x263F824D8] effectWithStyle:1102];
    v13 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v12];
    [(DBStatusBarBackgroundView *)self setDarkMaterial:v13];
  }
  else
  {
    v12 = [MEMORY[0x263F825D8] colorEffectSaturate:3.0];
    v13 = [MEMORY[0x263F824D8] effectWithBlurRadius:20.0];
    v14 = (void *)MEMORY[0x263F82E48];
    v15 = [MEMORY[0x263F825C8] systemBlackColor];
    v16 = [v14 effectCompositingColor:v15 withMode:7 alpha:0.6];

    id v17 = objc_alloc_init(MEMORY[0x263F82E50]);
    [(DBStatusBarBackgroundView *)self setDarkMaterial:v17];

    v117[0] = v12;
    v117[1] = v13;
    v117[2] = v16;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:3];
    v19 = [(DBStatusBarBackgroundView *)self darkMaterial];
    [v19 setBackgroundEffects:v18];
  }
  v20 = [(DBStatusBarBackgroundView *)self darkMaterial];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(DBStatusBarBackgroundView *)self darkMaterial];
  v22 = [v21 layer];
  [v22 setAllowsHitTesting:0];

  v23 = [(DBStatusBarBackgroundView *)self darkMaterial];
  [(DBStatusBarBackgroundView *)self addSubview:v23];

  v85 = (void *)MEMORY[0x263F08938];
  v111 = [(DBStatusBarBackgroundView *)self lightMaterial];
  v109 = [v111 leadingAnchor];
  v107 = [(DBStatusBarBackgroundView *)self leadingAnchor];
  v105 = [v109 constraintEqualToAnchor:v107];
  v116[0] = v105;
  v103 = [(DBStatusBarBackgroundView *)self lightMaterial];
  v101 = [v103 topAnchor];
  v99 = [(DBStatusBarBackgroundView *)self topAnchor];
  v97 = [v101 constraintEqualToAnchor:v99];
  v116[1] = v97;
  v95 = [(DBStatusBarBackgroundView *)self lightMaterial];
  v93 = [v95 bottomAnchor];
  v91 = [(DBStatusBarBackgroundView *)self bottomAnchor];
  v89 = [v93 constraintEqualToAnchor:v91];
  v116[2] = v89;
  v87 = [(DBStatusBarBackgroundView *)self lightMaterial];
  v83 = [v87 trailingAnchor];
  v81 = [(DBStatusBarBackgroundView *)self trailingAnchor];
  v79 = [v83 constraintEqualToAnchor:v81];
  v116[3] = v79;
  v77 = [(DBStatusBarBackgroundView *)self darkMaterial];
  v75 = [v77 leadingAnchor];
  v73 = [(DBStatusBarBackgroundView *)self leadingAnchor];
  v71 = [v75 constraintEqualToAnchor:v73];
  v116[4] = v71;
  v69 = [(DBStatusBarBackgroundView *)self darkMaterial];
  v67 = [v69 topAnchor];
  v65 = [(DBStatusBarBackgroundView *)self topAnchor];
  v63 = [v67 constraintEqualToAnchor:v65];
  v116[5] = v63;
  v24 = [(DBStatusBarBackgroundView *)self darkMaterial];
  v25 = [v24 bottomAnchor];
  v26 = [(DBStatusBarBackgroundView *)self bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v116[6] = v27;
  v28 = [(DBStatusBarBackgroundView *)self darkMaterial];
  v29 = [v28 trailingAnchor];
  v30 = [(DBStatusBarBackgroundView *)self trailingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v116[7] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:8];
  [v85 activateConstraints:v32];

  v33 = (void *)MEMORY[0x263F82E48];
  v34 = [MEMORY[0x263F825C8] systemBlackColor];
  v112 = [v33 effectCompositingColor:v34 withMode:1006 alpha:0.07];

  id v35 = objc_alloc_init(MEMORY[0x263F82E50]);
  [(DBStatusBarBackgroundView *)self setLightSiriMaterial:v35];

  v115 = v112;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
  v37 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  [v37 setBackgroundEffects:v36];

  v38 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  v40 = [v39 layer];
  [v40 setAllowsHitTesting:0];

  v41 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  [(DBStatusBarBackgroundView *)self addSubview:v41];

  v42 = (void *)MEMORY[0x263F82E48];
  v43 = [MEMORY[0x263F825C8] systemWhiteColor];
  v110 = [v42 effectCompositingColor:v43 withMode:1007 alpha:0.15];

  id v44 = objc_alloc_init(MEMORY[0x263F82E50]);
  [(DBStatusBarBackgroundView *)self setDarkSiriMaterial:v44];

  v114 = v110;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
  v46 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  [v46 setBackgroundEffects:v45];

  v47 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];

  v48 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  v49 = [v48 layer];
  [v49 setAllowsHitTesting:0];

  v50 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  [(DBStatusBarBackgroundView *)self addSubview:v50];

  v82 = (void *)MEMORY[0x263F08938];
  v108 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  v106 = [v108 leadingAnchor];
  v104 = [(DBStatusBarBackgroundView *)self leadingAnchor];
  v102 = [v106 constraintEqualToAnchor:v104];
  v113[0] = v102;
  v100 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  v98 = [v100 topAnchor];
  v96 = [(DBStatusBarBackgroundView *)self topAnchor];
  v94 = [v98 constraintEqualToAnchor:v96];
  v113[1] = v94;
  v92 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  v90 = [v92 bottomAnchor];
  v88 = [(DBStatusBarBackgroundView *)self bottomAnchor];
  v86 = [v90 constraintEqualToAnchor:v88];
  v113[2] = v86;
  v84 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  v80 = [v84 trailingAnchor];
  v78 = [(DBStatusBarBackgroundView *)self trailingAnchor];
  v76 = [v80 constraintEqualToAnchor:v78];
  v113[3] = v76;
  v74 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  v72 = [v74 leadingAnchor];
  v70 = [(DBStatusBarBackgroundView *)self leadingAnchor];
  v68 = [v72 constraintEqualToAnchor:v70];
  v113[4] = v68;
  v66 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  v64 = [v66 topAnchor];
  v62 = [(DBStatusBarBackgroundView *)self topAnchor];
  v61 = [v64 constraintEqualToAnchor:v62];
  v113[5] = v61;
  v51 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  v52 = [v51 bottomAnchor];
  v53 = [(DBStatusBarBackgroundView *)self bottomAnchor];
  v54 = [v52 constraintEqualToAnchor:v53];
  v113[6] = v54;
  v55 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  v56 = [v55 trailingAnchor];
  v57 = [(DBStatusBarBackgroundView *)self trailingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  v113[7] = v58;
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:8];
  [v82 activateConstraints:v59];

  v60 = [(DBStatusBarBackgroundView *)self traitCollection];
  -[DBStatusBarBackgroundView updateMaterialForStyle:](self, "updateMaterialForStyle:", [v60 userInterfaceStyle]);
}

- (void)updateMaterialForStyle:(int64_t)a3
{
  id v5 = [(DBStatusBarBackgroundView *)self environment];
  id v26 = [v5 environmentConfiguration];

  v6 = [v26 wallpaperPreferences];
  v7 = [v6 currentWallpaper];

  int64_t v8 = [(DBStatusBarBackgroundView *)self colorVariantOverride];
  int64_t v9 = [(DBStatusBarBackgroundView *)self colorVariantOverride];
  v10 = [(DBStatusBarBackgroundView *)self environment];
  v11 = [v10 environmentConfiguration];
  char v12 = [v11 currentViewAreaSupportsUIOutsideSafeArea];

  if (v9
    && (!v7
     || (([v7 traits],
          v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isBlack],
          a3 == 2)
       ? (char v15 = v14)
       : (char v15 = 0),
         (v13, (v15 & 1) != 0) || v8 == 1)))
  {
    if (v12) {
      objc_msgSend(MEMORY[0x263F825C8], "crsui_dashboardWidgetBackgroundColor");
    }
    else {
    v22 = [MEMORY[0x263F825C8] blackColor];
    }
    [(DBStatusBarBackgroundView *)self setBackgroundColor:v22];

    v23 = [(DBStatusBarBackgroundView *)self darkMaterial];
    [v23 setAlpha:0.0];
  }
  else
  {
    if (![(DBStatusBarBackgroundView *)self isDualStatusBar])
    {
      v16 = [(DBStatusBarBackgroundView *)self _backgroundColorForStyle:a3];
      [(DBStatusBarBackgroundView *)self setBackgroundColor:v16];
    }
    id v17 = [(DBStatusBarBackgroundView *)self darkMaterial];
    v18 = v17;
    if (a3 == 1)
    {
      [v17 setAlpha:0.0];

      v19 = [(DBStatusBarBackgroundView *)self lightMaterial];
      v20 = v19;
      double v21 = 1.0;
      goto LABEL_18;
    }
    [v17 setAlpha:1.0];
  }
  v19 = [(DBStatusBarBackgroundView *)self lightMaterial];
  v20 = v19;
  double v21 = 0.0;
LABEL_18:
  [v19 setAlpha:v21];

  v24 = [(DBStatusBarBackgroundView *)self darkSiriMaterial];
  [v24 setAlpha:0.0];

  v25 = [(DBStatusBarBackgroundView *)self lightSiriMaterial];
  [v25 setAlpha:0.0];
}

- (id)_backgroundColorForStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = 0.847058824;
    double v4 = 0.862745098;
    double v5 = 0.7;
    double v6 = 0.847058824;
  }
  else
  {
    double v3 = 0.93;
    double v5 = 0.6;
    double v6 = 0.93;
    double v4 = 0.93;
  }
  v7 = [MEMORY[0x263F825C8] colorWithRed:v3 green:v6 blue:v4 alpha:v5];
  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(DBStatusBarBackgroundView *)self traitCollection];
  -[DBStatusBarBackgroundView updateMaterialForStyle:](self, "updateMaterialForStyle:", [v4 userInterfaceStyle]);
}

- (int64_t)colorVariantOverride
{
  return self->_colorVariantOverride;
}

- (void)setColorVariantOverride:(int64_t)a3
{
  self->_colorVariantOverride = a3;
}

- (UIVisualEffectView)darkMaterial
{
  return self->_darkMaterial;
}

- (void)setDarkMaterial:(id)a3
{
}

- (UIVisualEffectView)lightMaterial
{
  return self->_lightMaterial;
}

- (void)setLightMaterial:(id)a3
{
}

- (UIVisualEffectView)darkSiriMaterial
{
  return self->_darkSiriMaterial;
}

- (void)setDarkSiriMaterial:(id)a3
{
}

- (UIVisualEffectView)lightSiriMaterial
{
  return self->_lightSiriMaterial;
}

- (void)setLightSiriMaterial:(id)a3
{
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_lightSiriMaterial, 0);
  objc_storeStrong((id *)&self->_darkSiriMaterial, 0);
  objc_storeStrong((id *)&self->_lightMaterial, 0);
  objc_storeStrong((id *)&self->_darkMaterial, 0);
}

@end