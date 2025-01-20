@interface AVTAvatarColorSliderContainerView
- (AVTAvatarAttributeEditorSectionColorItem)sectionItem;
- (AVTAvatarColorSliderContainerView)initWithFrame:(CGRect)a3 userInterfaceLayoutDirection:(int64_t)a4;
- (AVTAvatarColorSliderContainerViewDelegate)delegate;
- (AVTColorSlider)slider;
- (NSArray)layoutConstraints;
- (void)colorSlider:(id)a3 didFinishSelectingValue:(double)a4;
- (void)colorSlider:(id)a3 valueChanged:(double)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setSectionItem:(id)a3;
- (void)setSectionItem:(id)a3 animated:(BOOL)a4;
- (void)setSlider:(id)a3;
- (void)updateSliderTrackLayerAnimated:(BOOL)a3;
- (void)updateSliderWithColorPreset:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTAvatarColorSliderContainerView

- (AVTAvatarColorSliderContainerView)initWithFrame:(CGRect)a3 userInterfaceLayoutDirection:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVTAvatarColorSliderContainerView;
  v5 = -[AVTAvatarColorSliderContainerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [MEMORY[0x263F1C550] clearColor];
    [(AVTAvatarColorSliderContainerView *)v5 setBackgroundColor:v6];

    v7 = [[AVTColorSlider alloc] initWithUserInterfaceLayoutDirection:a4];
    slider = v5->_slider;
    v5->_slider = v7;

    [(AVTColorSlider *)v5->_slider setAutoresizingMask:34];
    [(AVTColorSlider *)v5->_slider setDelegate:v5];
    [(AVTAvatarColorSliderContainerView *)v5 setClipsToBounds:0];
    [(AVTAvatarColorSliderContainerView *)v5 addSubview:v5->_slider];
  }
  return v5;
}

- (void)setSectionItem:(id)a3
{
}

- (void)setSectionItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (AVTAvatarAttributeEditorSectionColorItem *)a3;
  p_sectionItem = &self->_sectionItem;
  if (self->_sectionItem != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)p_sectionItem, a3);
    p_sectionItem = (AVTAvatarAttributeEditorSectionColorItem **)[(AVTAvatarColorSliderContainerView *)self updateSliderTrackLayerAnimated:v4];
    v7 = v9;
  }
  MEMORY[0x270F9A758](p_sectionItem, v7);
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarColorSliderContainerView;
  [(AVTAvatarColorSliderContainerView *)&v8 layoutSubviews];
  [(AVTAvatarColorSliderContainerView *)self bounds];
  double v4 = v3 + -40.0;
  [(AVTAvatarColorSliderContainerView *)self bounds];
  double v6 = v5;
  v7 = [(AVTAvatarColorSliderContainerView *)self slider];
  objc_msgSend(v7, "setFrame:", 20.0, 0.0, v4, v6);
}

- (void)updateSliderTrackLayerAnimated:(BOOL)a3
{
  double v5 = [(AVTAvatarColorSliderContainerView *)self sectionItem];

  if (v5)
  {
    double v6 = [(AVTAvatarColorSliderContainerView *)self sectionItem];
    v7 = [v6 gradientProvider];
    objc_super v8 = [(AVTAvatarColorSliderContainerView *)self sectionItem];
    v9 = [v8 color];
    objc_super v10 = [(AVTAvatarColorSliderContainerView *)self sectionItem];
    v11 = [v10 skinColor];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__AVTAvatarColorSliderContainerView_updateSliderTrackLayerAnimated___block_invoke;
    v12[3] = &unk_263FF3140;
    v12[4] = self;
    BOOL v13 = a3;
    ((void (**)(void, void *, void *, void *))v7)[2](v7, v9, v11, v12);
  }
}

void __68__AVTAvatarColorSliderContainerView_updateSliderTrackLayerAnimated___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 slider];
  [v5 setTrackLayer:v4 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateSliderWithColorPreset:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(AVTAvatarColorSliderContainerView *)self slider];
  [v7 value];
  float v9 = v8;
  [v6 variation];
  float v11 = v10;

  if (v9 != v11)
  {
    v12 = (void *)MEMORY[0x263F1CB60];
    if (v4) {
      double v13 = 0.2;
    }
    else {
      double v13 = 0.0;
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__AVTAvatarColorSliderContainerView_updateSliderWithColorPreset_animated___block_invoke;
    v20[3] = &unk_263FF3168;
    v20[4] = self;
    id v21 = v6;
    BOOL v22 = v4;
    [v12 animateWithDuration:v20 animations:v13];
  }
  v14 = [(AVTAvatarColorSliderContainerView *)self sectionItem];
  v15 = [v14 layerContentProvider];
  v16 = [(AVTAvatarColorSliderContainerView *)self sectionItem];
  v17 = [v16 skinColor];
  v18 = [(AVTAvatarColorSliderContainerView *)self slider];
  v19 = [v18 thumbLayer];
  ((void (**)(void, id, void *, void *))v15)[2](v15, v6, v17, v19);
}

void __74__AVTAvatarColorSliderContainerView_updateSliderWithColorPreset_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) slider];
  [*(id *)(a1 + 40) variation];
  objc_msgSend(v2, "setValue:animated:", *(unsigned __int8 *)(a1 + 48));
}

- (void)colorSlider:(id)a3 valueChanged:(double)a4
{
  id v7 = [(AVTAvatarColorSliderContainerView *)self delegate];
  id v6 = [(AVTAvatarColorSliderContainerView *)self sectionItem];
  [v7 colorSliderVariationChanged:v6 forItem:a4];
}

- (void)colorSlider:(id)a3 didFinishSelectingValue:(double)a4
{
  id v7 = [(AVTAvatarColorSliderContainerView *)self delegate];
  id v6 = [(AVTAvatarColorSliderContainerView *)self sectionItem];
  [v7 colorSliderDidFinishChangingVariation:v6 forItem:a4];
}

- (AVTAvatarAttributeEditorSectionColorItem)sectionItem
{
  return self->_sectionItem;
}

- (AVTAvatarColorSliderContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarColorSliderContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTColorSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionItem, 0);
}

@end