@interface VPNCiscoImageHeader
- (UIImageView)imageView;
- (VPNCiscoImageHeader)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setImageHidden:(BOOL)a3;
- (void)setImageView:(id)a3;
@end

@implementation VPNCiscoImageHeader

- (VPNCiscoImageHeader)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VPNCiscoImageHeader;
  v5 = -[VPNCiscoImageHeader initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5 == self)
  {
    v7 = (void *)MEMORY[0x263F1C6B0];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v7 imageNamed:@"Cisco.png" inBundle:v8];

    v10 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v9];
    [(VPNCiscoImageHeader *)self setImageView:v10];

    v11 = [(VPNCiscoImageHeader *)self imageView];
    [(VPNCiscoImageHeader *)self addSubview:v11];

    v12 = [v4 propertyForKey:@"VisibleOnInit"];
    v13 = v12;
    if (v12) {
      uint64_t v14 = [v12 BOOLValue] ^ 1;
    }
    else {
      uint64_t v14 = 1;
    }
    v15 = [(VPNCiscoImageHeader *)self imageView];
    [v15 setHidden:v14];

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)preferredHeightForWidth:(double)a3
{
  id v4 = [(VPNCiscoImageHeader *)self imageView];
  double v5 = 0.0;
  if (([v4 isHidden] & 1) == 0)
  {
    v6 = [(VPNCiscoImageHeader *)self imageView];
    v7 = [v6 image];
    [v7 size];
    double v5 = v8 + 0.0;
  }
  return v5;
}

- (void)setImageHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VPNCiscoImageHeader *)self imageView];
  [v4 setHidden:v3];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)VPNCiscoImageHeader;
  [(VPNCiscoImageHeader *)&v18 layoutSubviews];
  BOOL v3 = [(VPNCiscoImageHeader *)self imageView];
  [v3 frame];
  double v5 = v4;

  v6 = [(VPNCiscoImageHeader *)self imageView];
  v7 = [v6 superview];
  [v7 frame];
  double v9 = v8;

  double v10 = floor(v9 * 0.5) - floor(v5 * 0.5);
  v11 = [(VPNCiscoImageHeader *)self imageView];
  v12 = [v11 image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  objc_super v17 = [(VPNCiscoImageHeader *)self imageView];
  objc_msgSend(v17, "setFrame:", v10, -10.0, v14, v16);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 408, 1);
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end