@interface MKVibrantView
- (MKVibrantView)init;
- (MKVibrantView)initWithCoder:(id)a3;
- (MKVibrantView)initWithEffect:(id)a3;
- (MKVibrantView)initWithFrame:(CGRect)a3;
- (int64_t)style;
- (void)didMoveToWindow;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation MKVibrantView

- (void)didMoveToWindow
{
  v3 = [(MKVibrantView *)self window];

  if (v3)
  {
    uint64_t v4 = [(MKVibrantView *)self superview];
    if (v4)
    {
      while (1)
      {
        id v7 = (id)v4;
        if (objc_opt_respondsToSelector()) {
          break;
        }
        uint64_t v5 = [v7 superview];

        uint64_t v4 = v5;
        if (!v5) {
          return;
        }
      }
      v6 = [v7 vibrancyGroupName];
      [(MKVibrantView *)self _setGroupName:v6];
    }
  }
}

- (MKVibrantView)initWithEffect:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKVibrantView;
  v3 = [(MKVibrantView *)&v7 initWithEffect:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
    uint64_t v5 = [(MKVibrantView *)v3 contentView];
    [v5 setBackgroundColor:v4];

    [(MKVibrantView *)v3 setStyle:6];
  }
  return v3;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F427D8];
    uint64_t v5 = [(MKVibrantView *)self traitCollection];
    id v7 = [v4 effectWithStyle:1100];

    v6 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v7 style:self->_style];
    [(MKVibrantView *)self setEffect:v6];
  }
}

- (MKVibrantView)initWithFrame:(CGRect)a3
{
  return -[MKVibrantView initWithEffect:](self, "initWithEffect:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MKVibrantView)init
{
  return [(MKVibrantView *)self initWithEffect:0];
}

- (MKVibrantView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKVibrantView;
  v3 = [(MKVibrantView *)&v7 initWithCoder:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
    uint64_t v5 = [(MKVibrantView *)v3 contentView];
    [v5 setBackgroundColor:v4];

    [(MKVibrantView *)v3 setStyle:6];
  }
  return v3;
}

- (void)setContinuousCornerRadius:(double)a3
{
}

- (int64_t)style
{
  return self->_style;
}

@end