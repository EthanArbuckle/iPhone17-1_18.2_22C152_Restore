@interface MKPlaceSectionItemView
- (BOOL)isHairlineFullWidth;
- (MKPlaceSectionItemView)initWithFrame:(CGRect)a3;
- (void)_updateHairlineInsets;
- (void)didMoveToWindow;
- (void)infoCardThemeChanged;
- (void)layoutMarginsDidChange;
- (void)setFullWidthHairline:(BOOL)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKPlaceSectionItemView

- (MKPlaceSectionItemView)initWithFrame:(CGRect)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MKPlaceSectionItemView;
  v3 = -[MKViewWithHairline initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 mk_theme];
    v6 = [v5 separatorLineColor];
    [(MKViewWithHairline *)v4 setHairlineColor:v6];

    [(MKViewWithHairline *)v4 setTopHairlineHidden:1];
    [(MKViewWithHairline *)v4 setBottomHairlineHidden:1];
    v11[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v8 = (id)[(MKPlaceSectionItemView *)v4 registerForTraitChanges:v7 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v4;
}

- (void)infoCardThemeChanged
{
  v5.receiver = self;
  v5.super_class = (Class)MKPlaceSectionItemView;
  [(UIView *)&v5 infoCardThemeChanged];
  v3 = [(UIView *)self mk_theme];
  v4 = [v3 separatorLineColor];
  [(MKViewWithHairline *)self setHairlineColor:v4];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = [(MKPlaceSectionItemView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(MKPlaceSectionItemView *)self infoCardThemeChanged];
  }
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionItemView;
  [(MKPlaceSectionItemView *)&v3 layoutMarginsDidChange];
  [(MKPlaceSectionItemView *)self _updateHairlineInsets];
}

- (void)_updateHairlineInsets
{
  if (!self->_fullWidthHairline)
  {
    int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
    [(MKPlaceSectionItemView *)self layoutMargins];
    if (IsRightToLeft) {
      double v6 = v5;
    }
    else {
      double v6 = v4;
    }
    if (IsRightToLeft) {
      double v7 = v4;
    }
    else {
      double v7 = v5;
    }
    [(MKViewWithHairline *)self setLeftHairlineInset:v6];
    [(MKViewWithHairline *)self setRightHairlineInset:v7];
  }
}

- (void)setFullWidthHairline:(BOOL)a3
{
  self->_fullWidthHairline = a3;
  if (a3)
  {
    [(MKViewWithHairline *)self setLeftHairlineInset:0.0];
    [(MKViewWithHairline *)self setRightHairlineInset:0.0];
  }
  else
  {
    [(MKPlaceSectionItemView *)self _updateHairlineInsets];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MKPlaceSectionItemView;
  [(MKPlaceSectionItemView *)&v4 didMoveToWindow];
  [(MKPlaceSectionItemView *)self _updateHairlineInsets];
  objc_super v3 = [(MKPlaceSectionItemView *)self window];

  if (v3) {
    [(MKPlaceSectionItemView *)self infoCardThemeChanged];
  }
}

- (BOOL)isHairlineFullWidth
{
  return self->_fullWidthHairline;
}

@end