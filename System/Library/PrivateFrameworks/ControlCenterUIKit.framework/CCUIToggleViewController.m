@interface CCUIToggleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldFinishTransitionToExpandedContentModule;
- (CCUIToggleModule)module;
- (double)preferredExpandedContentHeight;
- (void)_reconfigureView;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)reconfigureView;
- (void)refreshStateAnimated:(BOOL)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setModule:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CCUIToggleViewController

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  p_module = &self->_module;
  id v6 = objc_loadWeakRetained((id *)&self->_module);
  objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "isSelected") ^ 1);

  id WeakRetained = objc_loadWeakRetained((id *)p_module);
  -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", [WeakRetained isSelected]);
}

- (void)refreshStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CCUIToggleViewController_refreshStateAnimated___block_invoke;
  aBlock[3] = &unk_1E6AD41E8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  if (v3)
  {
    id v6 = [(CCUIToggleViewController *)self viewIfLoaded];
    v7 = [v6 window];
    +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:v7 actions:v5];
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
}

void __49__CCUIToggleViewController_refreshStateAnimated___block_invoke(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2 + 128);
  objc_msgSend(v2, "setSelected:", objc_msgSend(WeakRetained, "isSelected"));

  v4 = *(id **)(a1 + 32);
  id v6 = objc_loadWeakRetained(v4 + 128);
  v5 = [v6 glyphState];
  [v4 setGlyphState:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIToggleViewController;
  [(CCUIButtonModuleViewController *)&v3 viewDidLoad];
  [(CCUIToggleViewController *)self reconfigureView];
  [(CCUIToggleViewController *)self refreshStateAnimated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIToggleViewController;
  [(CCUIToggleViewController *)&v4 viewWillAppear:a3];
  [(CCUIToggleViewController *)self refreshStateAnimated:0];
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (void)reconfigureView
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__CCUIToggleViewController_reconfigureView__block_invoke;
  v2[3] = &unk_1E6AD41E8;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __43__CCUIToggleViewController_reconfigureView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconfigureView];
}

- (void)_reconfigureView
{
  p_module = &self->_module;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  v5 = [WeakRetained title];
  [(CCUIButtonModuleViewController *)self setTitle:v5];

  id v6 = objc_loadWeakRetained((id *)p_module);
  v7 = [v6 valueText];
  [(CCUIButtonModuleViewController *)self setValueText:v7];

  id v8 = objc_loadWeakRetained((id *)p_module);
  v9 = [v8 selectedValueText];
  [(CCUIButtonModuleViewController *)self setSelectedValueText:v9];

  id v10 = objc_loadWeakRetained((id *)p_module);
  v11 = [v10 iconGlyph];
  [(CCUIButtonModuleViewController *)self setGlyphImage:v11];

  id v12 = objc_loadWeakRetained((id *)p_module);
  v13 = [v12 selectedIconGlyph];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphImage:v13];

  id v14 = objc_loadWeakRetained((id *)p_module);
  v15 = [v14 selectedColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v15];

  id v16 = objc_loadWeakRetained((id *)p_module);
  v17 = [v16 glyphPackageDescription];
  [(CCUIButtonModuleViewController *)self setGlyphPackageDescription:v17];

  id v18 = objc_loadWeakRetained((id *)p_module);
  [v18 glyphScale];
  -[CCUIButtonModuleViewController setGlyphScale:](self, "setGlyphScale:");
}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (BOOL)shouldFinishTransitionToExpandedContentModule
{
  return 0;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIToggleViewController;
  if ([(CCUIButtonModuleViewController *)&v6 contentRenderingMode] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUIToggleViewController;
    [(CCUIButtonModuleViewController *)&v5 setContentRenderingMode:a3];
    [(CCUIToggleViewController *)self refreshStateAnimated:0];
  }
}

- (CCUIToggleModule)module
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  return (CCUIToggleModule *)WeakRetained;
}

- (void)setModule:(id)a3
{
}

- (void).cxx_destruct
{
}

@end