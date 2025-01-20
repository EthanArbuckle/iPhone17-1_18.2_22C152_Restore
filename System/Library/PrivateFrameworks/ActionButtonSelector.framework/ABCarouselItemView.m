@interface ABCarouselItemView
- (ABCarouselItem)item;
- (ABCarouselItemView)initWithItem:(id)a3;
- (void)_setupImageView;
- (void)_updateForLayoutDirection;
- (void)setItem:(id)a3;
@end

@implementation ABCarouselItemView

- (ABCarouselItemView)initWithItem:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ABCarouselItemView;
  v5 = -[ABCarouselItemView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263F15D58];
    v8 = [(ABCarouselItemView *)v5 layer];
    [v8 setCompositingFilter:v7];

    v9 = [(ABCarouselItemView *)v6 layer];
    [v9 setAllowsGroupOpacity:0];

    v10 = [(ABCarouselItemView *)v6 layer];
    [v10 setAllowsGroupBlending:0];

    v16[0] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    uint64_t v12 = [(ABCarouselItemView *)v6 registerForTraitChanges:v11 withAction:sel__updateForLayoutDirection];
    traitRegistration = v6->_traitRegistration;
    v6->_traitRegistration = (UITraitChangeRegistration *)v12;

    [(ABCarouselItemView *)v6 setItem:v4];
  }

  return v6;
}

- (void)setItem:(id)a3
{
  v5 = (ABCarouselItem *)a3;
  p_item = &self->_item;
  if (self->_item != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)p_item, a3);
    if (!self->_imageView) {
      [(ABCarouselItemView *)self _setupImageView];
    }
    if (v10)
    {
      [(UIImageView *)self->_imageView setImage:v10->_image];
      image = v10->_image;
    }
    else
    {
      [(UIImageView *)self->_imageView setImage:0];
      image = 0;
    }
    v8 = image;
    v9 = [(UIImage *)v8 accessibilityLabel];
    [(UIImageView *)self->_imageView setAccessibilityLabel:v9];

    v5 = v10;
  }

  MEMORY[0x270F9A758](p_item, v5);
}

- (void)_setupImageView
{
  v3 = [ABAntialiasedImageView alloc];
  [(ABCarouselItemView *)self bounds];
  id v4 = -[ABAntialiasedImageView initWithFrame:](v3, "initWithFrame:");
  imageView = self->_imageView;
  self->_imageView = v4;

  [(ABCarouselItemView *)self addSubview:self->_imageView];
  v6 = [MEMORY[0x263F1C550] whiteColor];
  [(UIImageView *)self->_imageView setTintColor:v6];

  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setAutoresizingMask:18];

  [(ABCarouselItemView *)self _updateForLayoutDirection];
}

- (void)_updateForLayoutDirection
{
  imageView = self->_imageView;
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(UIImageView *)imageView setTransform:v4];
}

- (ABCarouselItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_traitRegistration, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end