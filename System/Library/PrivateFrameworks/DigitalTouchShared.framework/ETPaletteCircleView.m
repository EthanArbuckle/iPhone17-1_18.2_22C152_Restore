@interface ETPaletteCircleView
+ (double)paletteCircleDiameter;
+ (double)selectionMarkerDiameter;
+ (id)selectionMarkerColor;
- (BOOL)isSelected;
- (ETPaletteCircleView)initWithFrame:(CGRect)a3;
- (UIView)selectionMarker;
- (void)_updateSelectionMarkerFrame;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation ETPaletteCircleView

+ (double)paletteCircleDiameter
{
  if (SetupSpecValuesIfNeeded_onceToken_1 != -1) {
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_1, &__block_literal_global_2);
  }
  return 26.0;
}

+ (double)selectionMarkerDiameter
{
  if (SetupSpecValuesIfNeeded_onceToken_1 != -1) {
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_1, &__block_literal_global_2);
  }
  return 9.0;
}

+ (id)selectionMarkerColor
{
  return (id)[MEMORY[0x263F1C550] blackColor];
}

- (ETPaletteCircleView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ETPaletteCircleView;
  v3 = -[ETPaletteCircleView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3 && SetupSpecValuesIfNeeded_onceToken_1 != -1) {
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_1, &__block_literal_global_2);
  }
  return v3;
}

- (UIView)selectionMarker
{
  return self->_selectionMarker;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ETPaletteCircleView;
  [(ETPaletteCircleView *)&v4 layoutSubviews];
  v3 = [(ETPaletteCircleView *)self layer];
  [(ETPaletteCircleView *)self bounds];
  [v3 setCornerRadius:CGRectGetWidth(v5) * 0.5];

  [(ETPaletteCircleView *)self _updateSelectionMarkerFrame];
}

- (void)_updateSelectionMarkerFrame
{
  [(ETPaletteCircleView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(ETPaletteCircleView *)self bounds];
  CGFloat v11 = CGRectGetWidth(v17) * 0.34722;
  UIRoundToViewScale();
  double v13 = v12;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  CGFloat v14 = CGRectGetMidX(v18) - v13;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  -[UIView setFrame:](self->_selectionMarker, "setFrame:", v14, CGRectGetMidY(v19) - v13, v11, v11);
  id v15 = [(UIView *)self->_selectionMarker layer];
  [v15 setCornerRadius:v13];
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    if (a3)
    {
      CGFloat v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
      selectionMarker = self->_selectionMarker;
      self->_selectionMarker = v4;

      CGFloat v6 = self->_selectionMarker;
      double v7 = +[ETPaletteCircleView selectionMarkerColor];
      [(UIView *)v6 setBackgroundColor:v7];

      [(ETPaletteCircleView *)self addSubview:self->_selectionMarker];
      [(ETPaletteCircleView *)self _updateSelectionMarkerFrame];
    }
    else
    {
      [(UIView *)self->_selectionMarker removeFromSuperview];
      CGFloat v8 = self->_selectionMarker;
      self->_selectionMarker = 0;
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (v5)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke;
    v16[3] = &unk_264DEC6D0;
    v16[4] = self;
    double v9 = (void (**)(void))MEMORY[0x23ECC8210](v16);
    if (v6)
    {
      [(ETPaletteCircleView *)self setSelected:1];
      v9[2](v9);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_2;
      v15[3] = &unk_264DEC6D0;
      v15[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v15 animations:v8 completion:0.3];
    }
    else
    {
      [(ETPaletteCircleView *)self setSelected:0];
      [(ETPaletteCircleView *)self addSubview:self->_selectionMarker];
      CGFloat v10 = (void *)MEMORY[0x263F1CB60];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_3;
      v13[3] = &unk_264DECA18;
      CGFloat v14 = v9;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_4;
      v11[3] = &unk_264DEC7D8;
      v11[4] = self;
      id v12 = v8;
      [v10 animateWithDuration:v13 animations:v11 completion:0.3];
    }
  }
  else
  {
    [(ETPaletteCircleView *)self setSelected:v6];
  }
}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.01, 0.01);
  v2 = *(void **)(*(void *)(a1 + 32) + 408);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__ETPaletteCircleView_setSelected_animated_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end