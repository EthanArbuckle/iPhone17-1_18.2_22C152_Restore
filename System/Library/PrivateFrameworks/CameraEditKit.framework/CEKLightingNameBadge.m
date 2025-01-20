@interface CEKLightingNameBadge
- (BOOL)isHighlighted;
- (CEKLightingNameBadge)initWithFrame:(CGRect)a3;
- (UIView)_snapshotView;
- (int64_t)lightingType;
- (void)_setSnapshotView:(id)a3;
- (void)_updateColorsAnimated:(BOOL)a3;
- (void)_updateText;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLightingType:(int64_t)a3;
- (void)tintColorDidChange;
@end

@implementation CEKLightingNameBadge

- (CEKLightingNameBadge)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CEKLightingNameBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(CEKLightingNameBadge *)v3 setTintColor:v4];

    v3->_lightingType = 1;
    [(CEKLightingNameBadge *)v3 _updateText];
    [(CEKLightingNameBadge *)v3 _updateColorsAnimated:0];
  }
  return v3;
}

- (void)setLightingType:(int64_t)a3
{
  if (self->_lightingType != a3)
  {
    self->_lightingType = a3;
    [(CEKLightingNameBadge *)self _updateText];
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(CEKLightingNameBadge *)self _updateColorsAnimated:a4];
  }
}

- (void)_updateText
{
  id v3 = +[CEKLightingEffectManager displayNameForLightingType:[(CEKLightingNameBadge *)self lightingType]];
  [(CEKBadgeTextView *)self _setText:v3];
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CEKLightingNameBadge *)self isHighlighted])
  {
    v5 = [(CEKLightingNameBadge *)self tintColor];
    objc_super v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  }
  else
  {
    v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v5 = [v7 colorWithAlphaComponent:0.3];

    v8 = [MEMORY[0x1E4FB1618] labelColor];
    objc_super v6 = [v8 colorWithAlphaComponent:0.3];
  }
  [(CEKBadgeView *)self _setContentColor:v6];
  [(CEKBadgeView *)self _setFillColor:v5];
  if (v3)
  {
    v9 = [(CEKLightingNameBadge *)self snapshotViewAfterScreenUpdates:0];
    [(CEKLightingNameBadge *)self bounds];
    objc_msgSend(v9, "setFrame:");
    [(CEKLightingNameBadge *)self addSubview:v9];
    [(CEKLightingNameBadge *)self _setSnapshotView:v9];
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke;
    v16[3] = &unk_1E63CD380;
    id v17 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke_2;
    v13[3] = &unk_1E63CD438;
    id v14 = v17;
    v15 = self;
    id v11 = v17;
    [v10 animateWithDuration:v16 animations:v13 completion:0.17];
  }
  else
  {
    v12 = [(CEKLightingNameBadge *)self _snapshotView];
    [v12 removeFromSuperview];

    [(CEKLightingNameBadge *)self _setSnapshotView:0];
  }
}

uint64_t __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __46__CEKLightingNameBadge__updateColorsAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = [*(id *)(a1 + 40) _snapshotView];
  BOOL v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    v4 = *(void **)(a1 + 40);
    [v4 _setSnapshotView:0];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CEKLightingNameBadge;
  [(CEKLightingNameBadge *)&v3 tintColorDidChange];
  [(CEKLightingNameBadge *)self _updateColorsAnimated:0];
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)_snapshotView
{
  return self->__snapshotView;
}

- (void)_setSnapshotView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end