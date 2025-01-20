@interface ASCredentialRequestImageSubPane
+ (id)_appIconViewWithImage:(id)a3;
+ (id)_customIconViewWithImage:(id)a3;
+ (id)_imageViewWithImage:(id)a3 imageStyle:(int64_t)a4;
- (ASCredentialRequestImageSubPane)initWithImage:(id)a3;
- (ASCredentialRequestImageSubPane)initWithImage:(id)a3 imageStyle:(int64_t)a4;
- (UIImageView)imageView;
- (int64_t)imageStyle;
- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5;
- (void)setImage:(id)a3;
@end

@implementation ASCredentialRequestImageSubPane

- (ASCredentialRequestImageSubPane)initWithImage:(id)a3 imageStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _imageViewWithImage:v6 imageStyle:a4];

  v12.receiver = self;
  v12.super_class = (Class)ASCredentialRequestImageSubPane;
  v8 = [(ASCredentialRequestSubPane *)&v12 initWithView:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_imageView, v7);
    v9->_imageStyle = a4;
    v10 = v9;
  }

  return v9;
}

- (ASCredentialRequestImageSubPane)initWithImage:(id)a3
{
  return [(ASCredentialRequestImageSubPane *)self initWithImage:a3 imageStyle:0];
}

- (void)setImage:(id)a3
{
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)ASCredentialRequestImageSubPane;
  [(ASCredentialRequestSubPane *)&v20 addToStackView:a3 withCustomSpacingAfter:a5 context:a4];
  if (!self->_imageStyle)
  {
    id v6 = [(UIImageView *)self->_imageView image];
    [v6 size];
    double v8 = v7;
    double v10 = v9;

    if (v10 == 0.0) {
      double v11 = 1.0;
    }
    else {
      double v11 = v8 / v10;
    }
    objc_super v12 = (void *)MEMORY[0x263F08938];
    v13 = [(UIImageView *)self->_imageView heightAnchor];
    +[ASViewServiceInterfaceUtilities headerIconSize];
    v15 = [v13 constraintEqualToConstant:v14];
    v21[0] = v15;
    v16 = [(UIImageView *)self->_imageView widthAnchor];
    v17 = [(UIImageView *)self->_imageView heightAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 multiplier:v11];
    v21[1] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    [v12 activateConstraints:v19];
  }
}

+ (id)_imageViewWithImage:(id)a3 imageStyle:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 2)
  {
    uint64_t v8 = [a1 _systemIconViewWithImage:v7];
  }
  else if (a4 == 1)
  {
    uint64_t v8 = [a1 _customIconViewWithImage:v7];
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    uint64_t v8 = [a1 _appIconViewWithImage:v7];
  }
  v4 = (void *)v8;
LABEL_8:

  return v4;
}

+ (id)_appIconViewWithImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F82828];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithImage:v4];

  +[ASViewServiceInterfaceUtilities headerIconCornerRadius];
  objc_msgSend(v5, "_setContinuousCornerRadius:");
  [v5 setClipsToBounds:1];
  id v6 = +[ASViewServiceInterfaceUtilities iconBorderColor];
  id v7 = [v5 layer];
  [v7 setBorderColor:v6];

  +[ASViewServiceInterfaceUtilities iconBorderWidth];
  double v9 = v8;
  double v10 = [v5 layer];
  [v10 setBorderWidth:v9];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v5;
}

+ (id)_customIconViewWithImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F82828];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithImage:v4];

  id v6 = [MEMORY[0x263F82818] configurationWithPointSize:60.0];
  [v5 setPreferredSymbolConfiguration:v6];

  id v7 = [MEMORY[0x263F825C8] systemBlueColor];
  [v5 setTintColor:v7];

  return v5;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (int64_t)imageStyle
{
  return self->_imageStyle;
}

- (void).cxx_destruct
{
}

@end