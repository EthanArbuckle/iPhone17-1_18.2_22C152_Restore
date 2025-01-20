@interface CPUIRepeatButton
- (CPUIRepeatButton)initWithFrame:(CGRect)a3;
- (UIImage)repeatImage;
- (UIImage)repeatOneImage;
- (void)setRepeatImage:(id)a3;
- (void)setRepeatOneImage:(id)a3;
- (void)setRepeatType:(int64_t)a3;
@end

@implementation CPUIRepeatButton

- (CPUIRepeatButton)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CPUIRepeatButton;
  v3 = -[CPUIModernButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CPUIRepeatButton *)v3 traitCollection];
    uint64_t v6 = CPUIRepeatGlyph(v5);
    repeatImage = v4->_repeatImage;
    v4->_repeatImage = (UIImage *)v6;

    v8 = [(CPUIRepeatButton *)v4 traitCollection];
    uint64_t v9 = CPUIRepeatOneGlyph(v8);
    repeatOneImage = v4->_repeatOneImage;
    v4->_repeatOneImage = (UIImage *)v9;

    [(CPUIRepeatButton *)v4 setImage:v4->_repeatImage forState:0];
  }
  return v4;
}

- (void)setRepeatType:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = [(CPUIRepeatButton *)self repeatOneImage];
    [(CPUIRepeatButton *)self setImage:v4 forState:0];

    [(CPUIRepeatButton *)self repeatOneImage];
  }
  else
  {
    v5 = [(CPUIRepeatButton *)self repeatImage];
    [(CPUIRepeatButton *)self setImage:v5 forState:0];

    [(CPUIRepeatButton *)self repeatImage];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [MEMORY[0x263F825C8] labelColor];
  v7 = [v6 colorWithAlphaComponent:0.2];
  v8 = [v9 imageWithTintColor:v7];
  [(CPUIRepeatButton *)self setImage:v8 forState:1];
}

- (UIImage)repeatImage
{
  return self->_repeatImage;
}

- (void)setRepeatImage:(id)a3
{
}

- (UIImage)repeatOneImage
{
  return self->_repeatOneImage;
}

- (void)setRepeatOneImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatOneImage, 0);
  objc_storeStrong((id *)&self->_repeatImage, 0);
}

@end