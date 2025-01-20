@interface MUCirclePlatterView
+ (id)defaultPlatterView;
- (BOOL)isHighlighted;
- (BOOL)showPlatterBackground;
- (MUCirclePlatterView)initWithFrame:(CGRect)a3;
- (NSString)glyph;
- (UIColor)glyphColor;
- (UIFont)glyphFont;
- (void)infoCardThemeChanged;
- (void)layoutSubviews;
- (void)setGlyph:(id)a3;
- (void)setGlyphColor:(id)a3;
- (void)setGlyphFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setShowPlatterBackground:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateGlyph;
@end

@implementation MUCirclePlatterView

- (MUCirclePlatterView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MUCirclePlatterView;
  v3 = -[MUCirclePlatterView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F310B0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    platterView = v3->_platterView;
    v3->_platterView = (MKVibrantView *)v5;

    [(MKVibrantView *)v3->_platterView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(MUCirclePlatterView *)v3 bounds];
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:");
    glyphImageView = v3->_glyphImageView;
    v3->_glyphImageView = (UIImageView *)v8;

    [(UIImageView *)v3->_glyphImageView setContentMode:4];
    v10 = [MEMORY[0x1E4FB1830] configurationWithPointSize:16.0];
    [(UIImageView *)v3->_glyphImageView setPreferredSymbolConfiguration:v10];

    [(MUCirclePlatterView *)v3 addSubview:v3->_platterView];
    [(MUCirclePlatterView *)v3 addSubview:v3->_glyphImageView];
    [(MUCirclePlatterView *)v3 infoCardThemeChanged];
  }
  return v3;
}

+ (id)defaultPlatterView
{
  v2 = [MUCirclePlatterView alloc];
  v3 = -[MUCirclePlatterView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (MapKitIdiomIsMacCatalyst()) {
    [(MUCirclePlatterView *)v3 setShowPlatterBackground:0];
  }
  return v3;
}

- (void)setGlyphFont:(id)a3
{
  v6 = (UIFont *)a3;
  if (self->_glyphFont != v6)
  {
    objc_storeStrong((id *)&self->_glyphFont, a3);
    uint64_t v5 = [MEMORY[0x1E4FB1830] configurationWithFont:v6];
    [(UIImageView *)self->_glyphImageView setPreferredSymbolConfiguration:v5];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUCirclePlatterView;
  [(MUCirclePlatterView *)&v4 layoutSubviews];
  [(MUCirclePlatterView *)self bounds];
  -[MKVibrantView setFrame:](self->_platterView, "setFrame:");
  [(MUCirclePlatterView *)self bounds];
  -[UIImageView setFrame:](self->_glyphImageView, "setFrame:");
  [(MUCirclePlatterView *)self bounds];
  CGFloat v3 = CGRectGetWidth(v5) * 0.5;
  [(MKVibrantView *)self->_platterView _setCornerRadius:v3];
  [(MUCirclePlatterView *)self _setCornerRadius:v3];
}

- (void)updateGlyph
{
  CGFloat v3 = self->_glyphColor;
  if (!v3)
  {
    objc_super v4 = [(MUCirclePlatterView *)self mk_theme];
    CGRect v5 = [v4 tintColor];

    CGFloat v3 = v5;
  }
  v6 = v3;
  [(UIImageView *)self->_glyphImageView setTintColor:v3];
}

- (void)setGlyph:(id)a3
{
  id v7 = a3;
  if ((-[NSString isEqual:](self->_glyph, "isEqual:") & 1) == 0)
  {
    objc_super v4 = (NSString *)[v7 copy];
    glyph = self->_glyph;
    self->_glyph = v4;

    v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:self->_glyph];
    [(UIImageView *)self->_glyphImageView setImage:v6];
  }
}

- (void)setGlyphColor:(id)a3
{
  CGRect v5 = (UIColor *)a3;
  p_glyphColor = &self->_glyphColor;
  if (self->_glyphColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_glyphColor, a3);
    p_glyphColor = (UIColor **)[(MUCirclePlatterView *)self updateGlyph];
    CGRect v5 = v7;
  }
  MEMORY[0x1F41817F8](p_glyphColor, v5);
}

- (void)infoCardThemeChanged
{
  v8.receiver = self;
  v8.super_class = (Class)MUCirclePlatterView;
  [(MUCirclePlatterView *)&v8 infoCardThemeChanged];
  [(MUCirclePlatterView *)self updateGlyph];
  BOOL highlighted = self->_highlighted;
  objc_super v4 = [(MUCirclePlatterView *)self mk_theme];
  CGRect v5 = v4;
  if (highlighted) {
    [v4 buttonHighlightedColor];
  }
  else {
  v6 = [v4 buttonNormalColor];
  }

  id v7 = [(MKVibrantView *)self->_platterView contentView];
  [v7 setBackgroundColor:v6];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_BOOL highlighted = a3;
    [(MUCirclePlatterView *)self infoCardThemeChanged];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUCirclePlatterView;
  [(MUCirclePlatterView *)&v5 touchesBegan:a3 withEvent:a4];
  [(MUCirclePlatterView *)self setHighlighted:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUCirclePlatterView;
  [(MUCirclePlatterView *)&v5 touchesEnded:a3 withEvent:a4];
  [(MUCirclePlatterView *)self setHighlighted:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUCirclePlatterView;
  [(MUCirclePlatterView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(MUCirclePlatterView *)self setHighlighted:0];
}

- (void)setShowPlatterBackground:(BOOL)a3
{
}

- (BOOL)showPlatterBackground
{
  return [(MKVibrantView *)self->_platterView isHidden] ^ 1;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (NSString)glyph
{
  return self->_glyph;
}

- (UIFont)glyphFont
{
  return self->_glyphFont;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_glyphFont, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end