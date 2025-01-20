@interface DBNavigationMapWidgetViewController
- (id)sceneIdentifierSuffix;
- (unint64_t)widgetStyle;
- (void)prepareLoadingViewAnimated:(BOOL)a3;
@end

@implementation DBNavigationMapWidgetViewController

- (unint64_t)widgetStyle
{
  return 3;
}

- (id)sceneIdentifierSuffix
{
  return @":dashboard";
}

- (void)prepareLoadingViewAnimated:(BOOL)a3
{
  BOOL v72 = a3;
  v79[3] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(DBWidgetViewController *)self contentView];
  [v5 addSubview:v4];

  v6 = [(DBNavigationWidgetViewController *)self targetBundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.Maps"];

  v73 = self;
  v74 = v4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F82828]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = (void *)MEMORY[0x263F827E8];
    v10 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    v11 = [(DBWidgetViewController *)self contentView];
    v12 = [v11 traitCollection];
    v13 = [v9 imageNamed:@"MapsNavigationWidgetBackgroundImage" inBundle:v10 compatibleWithTraitCollection:v12];
    [v8 setImage:v13];

    [v8 setContentMode:2];
    [v4 addSubview:v8];
    v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
    [v14 setName:@"multiplyColor"];
    id v15 = [MEMORY[0x263F825C8] colorWithRed:0.654901961 green:0.654901961 blue:0.654901961 alpha:1.0];
    v70 = v14;
    objc_msgSend(v14, "setValue:forKey:", objc_msgSend(v15, "CGColor"), @"inputColor");

    v16 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
    [v16 setName:@"saturation"];
    v17 = v16;
    v68 = v16;
    [v16 setValue:&unk_26E17F140 forKey:@"inputAmount"];
    v18 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v18 setName:@"gaussianBlur"];
    [v18 setValue:&unk_26E17F150 forKey:@"inputRadius"];
    uint64_t v19 = MEMORY[0x263EFFA88];
    [v18 setValue:MEMORY[0x263EFFA88] forKey:@"inputHardEdges"];
    [v18 setValue:v19 forKey:@"inputNormalizeEdges"];
    [v18 setValue:v19 forKey:@"inputDither"];
    v20 = [v8 layer];
    v79[0] = v14;
    v79[1] = v17;
    v79[2] = v18;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:3];
    [v20 setFilters:v21];

    v56 = (void *)MEMORY[0x263F08938];
    v66 = [v4 topAnchor];
    v64 = [v8 topAnchor];
    v62 = [v66 constraintEqualToAnchor:v64];
    v78[0] = v62;
    v60 = [v4 bottomAnchor];
    v58 = [v8 bottomAnchor];
    v22 = [v60 constraintEqualToAnchor:v58];
    v78[1] = v22;
    v23 = [v4 leftAnchor];
    v24 = [v8 leftAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v78[2] = v25;
    v26 = [v4 rightAnchor];
    v27 = [v8 rightAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v78[3] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:4];
    [v56 activateConstraints:v29];

    self = v73;
    id v4 = v74;
  }
  id v30 = objc_alloc_init(MEMORY[0x263F82828]);
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = [(DBNavigationWidgetViewController *)self loadingIconImage];
  [v30 setImage:v31];

  [v4 addSubview:v30];
  v50 = (void *)MEMORY[0x263F08938];
  v67 = [v4 topAnchor];
  v69 = [(DBWidgetViewController *)self contentView];
  v65 = [v69 topAnchor];
  v63 = [v67 constraintEqualToAnchor:v65];
  v77[0] = v63;
  v59 = [v4 bottomAnchor];
  v61 = [(DBWidgetViewController *)self contentView];
  v57 = [v61 bottomAnchor];
  v55 = [v59 constraintEqualToAnchor:v57];
  v77[1] = v55;
  v53 = [v4 leftAnchor];
  v54 = [(DBWidgetViewController *)self contentView];
  v52 = [v54 leftAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v77[2] = v51;
  v48 = [v4 rightAnchor];
  v49 = [(DBWidgetViewController *)self contentView];
  v47 = [v49 rightAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v77[3] = v46;
  v44 = [v30 centerXAnchor];
  v45 = [(DBWidgetViewController *)self contentView];
  v43 = [v45 centerXAnchor];
  v32 = [v44 constraintEqualToAnchor:v43];
  v77[4] = v32;
  v33 = [v30 centerYAnchor];
  v34 = [(DBWidgetViewController *)self contentView];
  v35 = [v34 centerYAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v77[5] = v36;
  v37 = [v30 widthAnchor];
  v38 = [v37 constraintEqualToConstant:40.0];
  v77[6] = v38;
  v71 = v30;
  v39 = [v30 heightAnchor];
  v40 = [v39 constraintEqualToConstant:40.0];
  v77[7] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:8];
  [v50 activateConstraints:v41];

  [(DBNavigationWidgetViewController *)v73 replaceLoadingViewWithView:v74];
  if (v72)
  {
    [v74 setAlpha:0.0];
    v42 = (void *)MEMORY[0x263F82E00];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __66__DBNavigationMapWidgetViewController_prepareLoadingViewAnimated___block_invoke;
    v75[3] = &unk_2649B3E90;
    id v76 = v74;
    [v42 animateWithDuration:v75 animations:0.25];
  }
}

uint64_t __66__DBNavigationMapWidgetViewController_prepareLoadingViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end