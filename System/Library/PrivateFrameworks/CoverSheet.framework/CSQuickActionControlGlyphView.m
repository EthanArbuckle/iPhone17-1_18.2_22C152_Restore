@interface CSQuickActionControlGlyphView
- (BOOL)isSelected;
- (CSQuickActionControlGlyphView)initWithControlInstance:(id)a3 symbolScaleValue:(double)a4;
- (int64_t)appearance;
- (void)_updateAppearance;
- (void)layoutSubviews;
- (void)setAppearance:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CSQuickActionControlGlyphView

- (CSQuickActionControlGlyphView)initWithControlInstance:(id)a3 symbolScaleValue:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSQuickActionControlGlyphView;
  v8 = [(CSQuickActionControlGlyphView *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlInstance, a3);
    uint64_t v10 = [(CHUISControlInstance *)v9->_controlInstance iconView];
    iconView = v9->_iconView;
    v9->_iconView = (CHUISControlIconView *)v10;

    [(CHUISControlIconView *)v9->_iconView setOverrideUserInterfaceStyle:1];
    [(CSQuickActionControlGlyphView *)v9 addSubview:v9->_iconView];
    [(CSQuickActionControlGlyphView *)v9 _updateAppearance];
    v9->_symbolScaleValue = a4;
  }

  return v9;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(CSQuickActionControlGlyphView *)self _updateAppearance];
  }
}

- (void)setAppearance:(int64_t)a3
{
  if (self->_appearance != a3)
  {
    self->_appearance = a3;
    [(CSQuickActionControlGlyphView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  int64_t appearance = self->_appearance;
  double v3 = 1.0;
  if (appearance == 1) {
    double v3 = 0.5;
  }
  if (appearance == 2) {
    double v3 = 0.25;
  }
  [(CHUISControlIconView *)self->_iconView setAlpha:v3];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CSQuickActionControlGlyphView;
  [(CSQuickActionControlGlyphView *)&v6 layoutSubviews];
  [(CSQuickActionControlGlyphView *)self bounds];
  double v4 = v3;
  -[CHUISControlIconView setFrame:](self->_iconView, "setFrame:");
  v5 = [MEMORY[0x1E4F42A30] systemFontOfSize:v4 * self->_symbolScaleValue weight:*MEMORY[0x1E4F43930]];
  [(CHUISControlIconView *)self->_iconView setFont:v5];
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_controlInstance, 0);
}

@end