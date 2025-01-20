@interface CPUIShadowImageView
- (BOOL)_isDarkMode;
- (CPUIShadowImageView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIImageView)imageView;
- (UIImageView)placeholderView;
- (int64_t)contentMode;
- (void)setContentMode:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setNeedsDisplay;
- (void)setPlaceholderImage:(id)a3;
- (void)setupVisibleEffects:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPUIShadowImageView

- (CPUIShadowImageView)initWithFrame:(CGRect)a3
{
  v50[8] = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)CPUIShadowImageView;
  v3 = -[CPUIShadowImageView initWithFrame:](&v49, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(CPUIShadowImageView *)v3 setBackgroundColor:v4];

    v5 = [(CPUIShadowImageView *)v3 layer];
    [v5 setShadowPathIsBounds:1];

    uint64_t v6 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(UIImageView *)v3->_imageView layer];
    [v8 setCornerRadius:6.0];

    v9 = [(UIImageView *)v3->_imageView layer];
    [v9 setMasksToBounds:1];

    v10 = [MEMORY[0x263F825C8] clearColor];
    [(UIImageView *)v3->_imageView setBackgroundColor:v10];

    uint64_t v11 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    placeholderView = v3->_placeholderView;
    v3->_placeholderView = (UIImageView *)v11;

    [(UIImageView *)v3->_placeholderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_placeholderView _setContinuousCornerRadius:6.0];
    [(UIImageView *)v3->_placeholderView setClipsToBounds:1];
    v13 = [MEMORY[0x263F825C8] clearColor];
    [(UIImageView *)v3->_placeholderView setBackgroundColor:v13];

    [(CPUIShadowImageView *)v3 addSubview:v3->_placeholderView];
    [(CPUIShadowImageView *)v3 addSubview:v3->_imageView];
    v35 = (void *)MEMORY[0x263F08938];
    v48 = [(CPUIShadowImageView *)v3 placeholderView];
    v47 = [v48 topAnchor];
    v46 = [(CPUIShadowImageView *)v3 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v50[0] = v45;
    v44 = [(CPUIShadowImageView *)v3 placeholderView];
    v43 = [v44 bottomAnchor];
    v42 = [(CPUIShadowImageView *)v3 bottomAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v50[1] = v41;
    v40 = [(CPUIShadowImageView *)v3 placeholderView];
    v39 = [v40 leadingAnchor];
    v38 = [(CPUIShadowImageView *)v3 leadingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v50[2] = v37;
    v36 = [(CPUIShadowImageView *)v3 placeholderView];
    v34 = [v36 trailingAnchor];
    v33 = [(CPUIShadowImageView *)v3 trailingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v50[3] = v32;
    v31 = [(CPUIShadowImageView *)v3 imageView];
    v30 = [v31 topAnchor];
    v29 = [(CPUIShadowImageView *)v3 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v50[4] = v28;
    v27 = [(CPUIShadowImageView *)v3 imageView];
    v26 = [v27 bottomAnchor];
    v25 = [(CPUIShadowImageView *)v3 bottomAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v50[5] = v24;
    v14 = [(CPUIShadowImageView *)v3 imageView];
    v15 = [v14 leadingAnchor];
    v16 = [(CPUIShadowImageView *)v3 leadingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v50[6] = v17;
    v18 = [(CPUIShadowImageView *)v3 imageView];
    v19 = [v18 trailingAnchor];
    v20 = [(CPUIShadowImageView *)v3 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v50[7] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:8];
    [v35 activateConstraints:v22];

    [(CPUIShadowImageView *)v3 setupVisibleEffects:1];
    [(CPUIShadowImageView *)v3 setImage:0];
  }
  return v3;
}

- (BOOL)_isDarkMode
{
  v2 = [(CPUIShadowImageView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == 2;

  return v3;
}

- (void)setImage:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  v5 = [(CPUIShadowImageView *)self imageView];
  [v5 setImage:v15];

  if (v15)
  {
    uint64_t v6 = [(CPUIShadowImageView *)self layer];
    v7 = v6;
    uint64_t v8 = 0;
  }
  else
  {
    BOOL v9 = [(CPUIShadowImageView *)self _isDarkMode];
    v10 = (uint64_t *)MEMORY[0x263F15D70];
    if (!v9) {
      v10 = (uint64_t *)MEMORY[0x263F15D18];
    }
    uint64_t v11 = *v10;
    uint64_t v6 = [(CPUIShadowImageView *)self layer];
    v7 = v6;
    uint64_t v8 = v11;
  }
  [v6 setCompositingFilter:v8];
  BOOL v12 = v15 != 0;

  v13 = [(CPUIShadowImageView *)self layer];
  [v13 setAllowsGroupOpacity:v12];

  v14 = [(CPUIShadowImageView *)self layer];
  [v14 setAllowsGroupBlending:v12];

  -[CPUIShadowImageView setupVisibleEffects:](self, "setupVisibleEffects:", [v15 isSquared]);
  [(CPUIShadowImageView *)self setNeedsDisplay];
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
  id v5 = a3;
  uint64_t v6 = [(CPUIShadowImageView *)self placeholderView];
  [v6 setImage:v5];

  [(CPUIShadowImageView *)self setNeedsDisplay];
}

- (int64_t)contentMode
{
  return [(UIImageView *)self->_imageView contentMode];
}

- (void)setContentMode:(int64_t)a3
{
  if ([(UIImageView *)self->_imageView contentMode] != a3)
  {
    imageView = self->_imageView;
    [(UIImageView *)imageView setContentMode:a3];
  }
}

- (void)setupVisibleEffects:(BOOL)a3
{
  id v6 = [(CPUIShadowImageView *)self layer];
  if (a3)
  {
    id v4 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v4, "CGColor"));

    LODWORD(v5) = 1036831949;
    [v6 setShadowOpacity:v5];
    [v6 setShadowRadius:4.0];
    objc_msgSend(v6, "setShadowOffset:", 0.0, 2.0);
  }
  else
  {
    [v6 setShadowOpacity:0.0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPUIShadowImageView;
  [(CPUIShadowImageView *)&v6 traitCollectionDidChange:a3];
  id v4 = [(CPUIShadowImageView *)self imageView];
  double v5 = [v4 image];
  [(CPUIShadowImageView *)self setImage:v5];
}

- (void)setNeedsDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)CPUIShadowImageView;
  [(CPUIShadowImageView *)&v4 setNeedsDisplay];
  BOOL v3 = [(UIImageView *)self->_imageView image];

  [(UIImageView *)self->_placeholderView setHidden:v3 != 0];
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)placeholderView
{
  return self->_placeholderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end