@interface DBNavigationInstructionWidgetViewController
- (DBNavigationInstructionWidgetViewController)initWithEnvironment:(id)a3 animationManager:(id)a4 widgetSizeManager:(id)a5;
- (id)sceneIdentifierSuffix;
- (void)prepareLoadingViewAnimated:(BOOL)a3;
@end

@implementation DBNavigationInstructionWidgetViewController

- (DBNavigationInstructionWidgetViewController)initWithEnvironment:(id)a3 animationManager:(id)a4 widgetSizeManager:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)DBNavigationInstructionWidgetViewController;
  v5 = [(DBNavigationWidgetViewController *)&v8 initWithEnvironment:a3 animationManager:a4 widgetSizeManager:a5];
  v6 = v5;
  if (v5) {
    [(DBNavigationWidgetViewController *)v5 setWidgetStyle:1];
  }
  return v6;
}

- (id)sceneIdentifierSuffix
{
  return @":widget";
}

- (void)prepareLoadingViewAnimated:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(DBWidgetViewController *)self contentView];
  [v6 addSubview:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F82828]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v8 = [(DBNavigationWidgetViewController *)self loadingIconImage];
  [v7 setImage:v8];
  [v5 addSubview:v7];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__DBNavigationInstructionWidgetViewController_prepareLoadingViewAnimated___block_invoke;
  aBlock[3] = &unk_2649B3ED8;
  id v9 = v5;
  id v17 = v9;
  v18 = self;
  id v10 = v7;
  id v19 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (a3)
  {
    (*((void (**)(void *))v11 + 2))(v11);
    [(DBNavigationWidgetViewController *)self replaceLoadingViewWithView:v9];
    [v9 setAlpha:0.0];
    v13 = (void *)MEMORY[0x263F82E00];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__DBNavigationInstructionWidgetViewController_prepareLoadingViewAnimated___block_invoke_2;
    v14[3] = &unk_2649B3E90;
    id v15 = v9;
    [v13 animateWithDuration:v14 animations:0.25];
  }
  else
  {
    [MEMORY[0x263F82E00] performWithoutAnimation:v11];
    [(DBNavigationWidgetViewController *)self replaceLoadingViewWithView:v9];
  }
}

void __74__DBNavigationInstructionWidgetViewController_prepareLoadingViewAnimated___block_invoke(id *a1)
{
  v32[8] = *MEMORY[0x263EF8340];
  id v19 = (void *)MEMORY[0x263F08938];
  v30 = [a1[4] topAnchor];
  v31 = [a1[5] contentView];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v32[0] = v28;
  v26 = [a1[4] bottomAnchor];
  v27 = [a1[5] contentView];
  v25 = [v27 bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v32[1] = v24;
  v22 = [a1[4] leftAnchor];
  v23 = [a1[5] contentView];
  v21 = [v23 leftAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v32[2] = v20;
  id v17 = [a1[4] rightAnchor];
  v18 = [a1[5] contentView];
  v16 = [v18 rightAnchor];
  id v15 = [v17 constraintEqualToAnchor:v16];
  v32[3] = v15;
  v13 = [a1[6] centerXAnchor];
  v14 = [a1[5] contentView];
  v12 = [v14 centerXAnchor];
  v2 = [v13 constraintEqualToAnchor:v12];
  v32[4] = v2;
  v3 = [a1[6] centerYAnchor];
  v4 = [a1[5] contentView];
  id v5 = [v4 centerYAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v32[5] = v6;
  id v7 = [a1[6] widthAnchor];
  objc_super v8 = [v7 constraintEqualToConstant:40.0];
  v32[6] = v8;
  id v9 = [a1[6] heightAnchor];
  id v10 = [v9 constraintEqualToConstant:40.0];
  v32[7] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:8];
  [v19 activateConstraints:v11];
}

uint64_t __74__DBNavigationInstructionWidgetViewController_prepareLoadingViewAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end