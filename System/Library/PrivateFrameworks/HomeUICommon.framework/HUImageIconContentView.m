@interface HUImageIconContentView
- (HUImageIconContentView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (id)_imageForImageIconDescriptor:(id)a3;
- (id)_imageForVariableImageIconDescriptor:(id)a3;
- (id)description;
- (int64_t)iconContentMode;
- (int64_t)originalImageRenderingMode;
- (int64_t)renderingModeForSubview:(id)a3 suggestedRenderingMode:(int64_t)a4;
- (void)_updateIconImage;
- (void)layoutSubviews;
- (void)setIconContentMode:(int64_t)a3;
- (void)setIconSize:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setOriginalImageRenderingMode:(int64_t)a3;
- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HUImageIconContentView

- (void)_updateIconImage
{
  objc_opt_class();
  v3 = [(HUIconContentView *)self iconDescriptor];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v24 = v4;

  if (v24)
  {
    v5 = [(HUImageIconContentView *)self _imageForVariableImageIconDescriptor:v24];
    -[HUImageIconContentView setOriginalImageRenderingMode:](self, "setOriginalImageRenderingMode:", [v5 renderingMode]);
    v6 = [(HUImageIconContentView *)self imageView];
    v7 = objc_msgSend(v5, "imageWithRenderingMode:", -[HUImageIconContentView renderingModeForSubview:suggestedRenderingMode:](self, "renderingModeForSubview:suggestedRenderingMode:", v6, -[HUIconContentView renderingMode](self, "renderingMode")));
    v8 = [(HUImageIconContentView *)self imageView];
    [v8 setImage:v7];

    [v5 size];
    double v10 = v9;
    [v5 size];
    double v12 = v10 / v11;
LABEL_6:
    [(HUIconContentView *)self setAspectRatio:v12];
    goto LABEL_7;
  }
  objc_opt_class();
  v5 = [(HUIconContentView *)self iconDescriptor];
  if (objc_opt_isKindOfClass()) {
    v13 = v5;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    v15 = [v14 imageIdentifier];

    if (!v15)
    {
      v23 = [(HUImageIconContentView *)self imageView];
      [v23 setImage:0];

      double v12 = 1.0;
      goto LABEL_6;
    }
    v16 = [(HUImageIconContentView *)self _imageForImageIconDescriptor:v14];
    -[HUImageIconContentView setOriginalImageRenderingMode:](self, "setOriginalImageRenderingMode:", [v16 renderingMode]);
    v17 = [(HUImageIconContentView *)self imageView];
    v18 = objc_msgSend(v16, "imageWithRenderingMode:", -[HUImageIconContentView renderingModeForSubview:suggestedRenderingMode:](self, "renderingModeForSubview:suggestedRenderingMode:", v17, -[HUIconContentView renderingMode](self, "renderingMode")));
    v19 = [(HUImageIconContentView *)self imageView];
    [v19 setImage:v18];

    [v16 size];
    double v21 = v20;
    [v16 size];
    [(HUIconContentView *)self setAspectRatio:v21 / v22];
  }
  else
  {
    v5 = 0;
  }
LABEL_7:
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)HUImageIconContentView;
  [(HUImageIconContentView *)&v12 layoutSubviews];
  [(HUImageIconContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(HUImageIconContentView *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (int64_t)renderingModeForSubview:(id)a3 suggestedRenderingMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HUImageIconContentView *)self imageView];
  if (v7 == v6)
  {
    int64_t v9 = [(HUImageIconContentView *)self originalImageRenderingMode];

    if (v9)
    {
      id v8 = [(HUImageIconContentView *)self originalImageRenderingMode];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v12.receiver = self;
  v12.super_class = (Class)HUImageIconContentView;
  id v8 = [(HUIconContentView *)&v12 renderingModeForSubview:v6 suggestedRenderingMode:a4];
LABEL_6:
  int64_t v10 = (int64_t)v8;

  return v10;
}

- (int64_t)originalImageRenderingMode
{
  return self->_originalImageRenderingMode;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int64_t v9 = [(HUIconContentView *)self iconDescriptor];
  int v10 = [v8 isEqual:v9];

  unint64_t v11 = [(HUIconContentView *)self displayStyle];
  v12.receiver = self;
  v12.super_class = (Class)HUImageIconContentView;
  [(HUIconContentView *)&v12 updateWithIconDescriptor:v8 displayStyle:a4 animated:v5];

  if (!v10 || v11 != a4) {
    [(HUImageIconContentView *)self _updateIconImage];
  }
}

- (void)setOriginalImageRenderingMode:(int64_t)a3
{
  self->_originalImageRenderingMode = a3;
}

- (void)setIconSize:(unint64_t)a3
{
  unint64_t v5 = [(HUIconContentView *)self iconSize];
  v6.receiver = self;
  v6.super_class = (Class)HUImageIconContentView;
  [(HUIconContentView *)&v6 setIconSize:a3];
  if (v5 != a3) {
    [(HUImageIconContentView *)self _updateIconImage];
  }
}

- (void)setIconContentMode:(int64_t)a3
{
  self->_iconContentMode = a3;
  id v4 = [(HUImageIconContentView *)self imageView];
  [v4 setContentMode:a3];
}

- (HUImageIconContentView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUImageIconContentView;
  double v3 = -[HUIconContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(HUImageIconContentView *)v3 bounds];
    unint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    [(HUImageIconContentView *)v3 setImageView:v5];

    v3->_iconContentMode = 1;
    [(UIImageView *)v3->_imageView setContentMode:1];
    objc_super v6 = [(HUImageIconContentView *)v3 imageView];
    [(HUImageIconContentView *)v3 addSubview:v6];
  }
  return v3;
}

- (void)setImageView:(id)a3
{
}

- (id)_imageForImageIconDescriptor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 imageIdentifier];
  if ([v4 isDemoModeDescriptor])
  {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithContentsOfFile:v5];
    if (v6) {
      goto LABEL_10;
    }
  }
  else if ([v4 isSystemImage])
  {
    id v7 = [v4 imageSymbolConfiguration];
    if (v7) {
      [MEMORY[0x263F1C6B0] _systemImageNamed:v5 withConfiguration:v7];
    }
    else {
    objc_super v6 = [MEMORY[0x263F1C6B0] _systemImageNamed:v5];
    }

    if (v6) {
      goto LABEL_10;
    }
  }
  objc_super v6 = objc_msgSend((id)objc_opt_class(), "iconImageNamed:withSize:displayStyle:", v5, -[HUIconContentView iconSize](self, "iconSize"), -[HUIconContentView displayStyle](self, "displayStyle"));
LABEL_10:

  return v6;
}

- (id)_imageForVariableImageIconDescriptor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 imageIdentifier];
  objc_super v6 = [v4 imageSymbolConfiguration];
  id v7 = (void *)MEMORY[0x263F1C6B0];
  if (v6)
  {
    [v4 variableValue];
    objc_msgSend(v7, "_systemImageNamed:variableValue:withConfiguration:", v5, v6);
  }
  else
  {
    [MEMORY[0x263F1C6B0] _systemImageNamed:v5];
  objc_super v8 = };
  if (!v8)
  {
    objc_super v8 = objc_msgSend((id)objc_opt_class(), "iconImageNamed:withSize:displayStyle:", v5, -[HUIconContentView iconSize](self, "iconSize"), -[HUIconContentView displayStyle](self, "displayStyle"));
  }

  return v8;
}

- (id)description
{
  double v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (id)[v3 appendSuper];
  unint64_t v5 = [(HUImageIconContentView *)self imageView];
  id v6 = (id)[v3 appendObject:v5 withName:@"imageView"];

  id v7 = [(HUImageIconContentView *)self imageView];
  objc_super v8 = objc_msgSend(v7, "hu_contentModeString");
  id v9 = (id)[v3 appendObject:v8 withName:@"contentMode"];

  v20.width = HUDefaultSizeForIconSize([(HUIconContentView *)self iconSize]);
  int v10 = NSStringFromCGSize(v20);
  id v11 = (id)[v3 appendObject:v10 withName:@"iconSize"];

  objc_super v12 = [(HUImageIconContentView *)self imageView];
  v13 = [v12 image];
  [v13 size];
  id v14 = NSStringFromCGSize(v21);
  id v15 = (id)[v3 appendObject:v14 withName:@"imageSize"];

  [(HUIconContentView *)self aspectRatio];
  id v16 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"aspectRatio", 2);
  v17 = [v3 build];

  return v17;
}

- (int64_t)iconContentMode
{
  return self->_iconContentMode;
}

- (void).cxx_destruct
{
}

@end