@interface PRXCardContentViewController(CARSetupPrompts)
- (id)carSetup_carPlayIconView;
- (void)carSetup_addCarPlayIconCenteredInMainContent;
- (void)carSetup_addMainContentCenteredView:()CARSetupPrompts size:;
@end

@implementation PRXCardContentViewController(CARSetupPrompts)

- (id)carSetup_carPlayIconView
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  v2 = objc_msgSend(v0, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.CarPlayApp", 2);

  v3 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v2];
  return v3;
}

- (void)carSetup_addCarPlayIconCenteredInMainContent
{
  objc_msgSend(a1, "carSetup_carPlayIconView");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "carSetup_addMainContentCenteredView:size:", v2, 98.0, 98.0);
}

- (void)carSetup_addMainContentCenteredView:()CARSetupPrompts size:
{
  v34[4] = *MEMORY[0x263EF8340];
  id v8 = a5;
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [a1 contentView];
  [v9 addSubview:v8];

  v10 = [a1 contentView];
  v11 = [v10 mainContentGuide];

  v27 = (void *)MEMORY[0x263F08938];
  v31 = [v8 topAnchor];
  v30 = [v11 topAnchor];
  v29 = [v31 constraintGreaterThanOrEqualToAnchor:v30];
  v34[0] = v29;
  v28 = [v8 bottomAnchor];
  v12 = [v11 bottomAnchor];
  v13 = [v28 constraintLessThanOrEqualToAnchor:v12];
  v34[1] = v13;
  v14 = [v8 centerYAnchor];
  v15 = [v11 centerYAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v34[2] = v16;
  v17 = [v8 centerXAnchor];
  v32 = v11;
  v18 = [v11 centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v34[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  [v27 activateConstraints:v20];

  if (a2 != *MEMORY[0x263F001B0] || a3 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v21 = (void *)MEMORY[0x263F08938];
    v22 = [v8 widthAnchor];
    v23 = [v22 constraintEqualToConstant:a2];
    v33[0] = v23;
    v24 = [v8 heightAnchor];
    v25 = [v24 constraintEqualToConstant:a3];
    v33[1] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    [v21 activateConstraints:v26];
  }
}

@end