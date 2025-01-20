@interface MKPlaceSectionRowView
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (void)_updateBackgroundColor:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MKPlaceSectionRowView

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (*(&self->super._fullWidthHairline + 1) != a3)
  {
    *(&self->super._fullWidthHairline + 1) = a3;
    [(MKPlaceSectionRowView *)self _updateBackgroundColor:a4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (*(&self->super._fullWidthHairline + 2) != a3)
  {
    *(&self->super._fullWidthHairline + 2) = a3;
    [(MKPlaceSectionRowView *)self _updateBackgroundColor:a4];
  }
}

- (void)_updateBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  if (*(&self->super._fullWidthHairline + 1) || *(&self->super._fullWidthHairline + 2))
  {
    v5 = [(UIView *)self mk_theme];
    uint64_t v6 = [v5 selectedRowColor];
  }
  else
  {
    v5 = [(UIView *)self mk_theme];
    uint64_t v6 = [v5 rowColor];
  }
  v7 = (void *)v6;

  if (v3)
  {
    v8 = (void *)MEMORY[0x1E4F42FF0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__MKPlaceSectionRowView__updateBackgroundColor___block_invoke;
    v9[3] = &unk_1E54B8248;
    v9[4] = self;
    id v10 = v7;
    objc_msgSend(v8, "_mapkit_animateWithDuration:animations:completion:", v9, 0, 0.200000003);
  }
  else
  {
    [(UIView *)self _mapkit_setBackgroundColor:v7];
  }
}

uint64_t __48__MKPlaceSectionRowView__updateBackgroundColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_setBackgroundColor:", *(void *)(a1 + 40));
}

- (BOOL)isSelected
{
  return *(&self->super._fullWidthHairline + 1);
}

- (BOOL)isHighlighted
{
  return *(&self->super._fullWidthHairline + 2);
}

@end