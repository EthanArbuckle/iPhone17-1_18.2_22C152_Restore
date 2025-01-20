@interface AERoundedCornerButton
+ (id)roundedCornerButtonWithStyle:(int64_t)a3 buttonType:(int64_t)a4;
- (UIImageView)_imageView;
- (UILabel)_label;
- (double)_interpolatedGlyphHorizontalInset;
- (double)_interpolatedGlyphTopInset;
- (int64_t)_buttonType;
- (int64_t)_layoutStyle;
- (void)_commonAERoundedCornerButtonInitializationWithStyle:(int64_t)a3 buttonType:(int64_t)a4;
- (void)_setImageView:(id)a3;
- (void)_setLabel:(id)a3;
- (void)_setLayoutStyle:(int64_t)a3;
- (void)layoutSubviews;
@end

@implementation AERoundedCornerButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__label, 0);
}

- (void)_setImageView:(id)a3
{
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)_setLabel:(id)a3
{
}

- (UILabel)_label
{
  return self->__label;
}

- (int64_t)_buttonType
{
  return self->__buttonType;
}

- (void)_setLayoutStyle:(int64_t)a3
{
  self->__layoutStyle = a3;
}

- (int64_t)_layoutStyle
{
  return self->__layoutStyle;
}

- (double)_interpolatedGlyphTopInset
{
  [(AERoundedCornerButton *)self bounds];
  double v4 = v3;
  v5 = [(AERoundedCornerButton *)self _imageView];
  v6 = [v5 image];
  [v6 size];
  double v8 = v7;

  v9 = [(AERoundedCornerButton *)self _label];
  [v9 bounds];
  double v11 = v10;

  return (v4 - (v8 + v11)) * 0.5;
}

- (double)_interpolatedGlyphHorizontalInset
{
  [(AERoundedCornerButton *)self bounds];
  int64_t v3 = [(AERoundedCornerButton *)self _layoutStyle];
  if ((unint64_t)(v3 - 1) < 2) {
    return 34.0;
  }
  if (v3 == 3 || (double result = 0.0, !v3))
  {
    UIRoundToViewScale();
  }
  return result;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)AERoundedCornerButton;
  [(AERoundedCornerButton *)&v31 layoutSubviews];
  [(AERoundedCornerButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(AERoundedCornerButton *)self _imageView];
  double v8 = [(AERoundedCornerButton *)self _label];
  v9 = [v7 image];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  v14 = [v8 text];
  uint64_t v15 = [v14 rangeOfString:@" "];

  unint64_t v16 = [(AERoundedCornerButton *)self _layoutStyle];
  unint64_t v17 = v16;
  if (v4 <= v6)
  {
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v20 = 1.79769313e308;
    }
    else
    {
      double v21 = 0.0;
      if (v16 == 3) {
        double v21 = v4;
      }
      double v20 = 1.79769313e308;
      if (v16 >= 3) {
        double v4 = v21;
      }
      else {
        double v4 = v4 + -25.0;
      }
    }
  }
  else
  {
    v18 = [v8 font];
    [v18 pointSize];
    double v20 = v19;
  }
  objc_msgSend(v8, "sizeThatFits:", v4, v20);
  double v23 = v22;
  double v24 = 0.0;
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v25, v22);
  [(AERoundedCornerButton *)self _interpolatedGlyphHorizontalInset];
  double v27 = v26;
  [(AERoundedCornerButton *)self _interpolatedGlyphTopInset];
  double v28 = v11 * 0.5 + v27;
  double v30 = v13 * 0.5 + v29;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v11, v13);
  objc_msgSend(v7, "setCenter:", v28, v30);
  if (v17 <= 3) {
    double v24 = dbl_22B548140[v17];
  }
  objc_msgSend(v8, "setCenter:", v28, v23 * 0.5 + v13 * 0.5 + v30 + v24);
}

- (void)_commonAERoundedCornerButtonInitializationWithStyle:(int64_t)a3 buttonType:(int64_t)a4
{
  [(AERoundedCornerButton *)self _setLayoutStyle:"_setLayoutStyle:"];
  self->__buttonType = a4;
  double v7 = [MEMORY[0x263F825C8] whiteColor];
  [(AERoundedCornerButton *)self setBackgroundColor:v7];

  id v8 = objc_alloc(MEMORY[0x263F82828]);
  [(AERoundedCornerButton *)self bounds];
  id v26 = (id)objc_msgSend(v8, "initWithFrame:");
  [v26 setContentMode:1];
  [(AERoundedCornerButton *)self _setImageView:v26];
  [(AERoundedCornerButton *)self addSubview:v26];
  id v9 = objc_alloc_init(MEMORY[0x263F828E0]);
  switch(a3)
  {
    case 0:
      double v10 = [(AERoundedCornerButton *)self layer];
      double v11 = v10;
      double v12 = 12.5;
      goto LABEL_6;
    case 1:
      double v11 = [(AERoundedCornerButton *)self layer];
      [v11 setCornerRadius:12.5];
      double v13 = 15.0;
      goto LABEL_7;
    case 2:
      double v11 = [(AERoundedCornerButton *)self layer];
      [v11 setCornerRadius:12.5];
      double v13 = 17.0;
      goto LABEL_7;
    case 3:
      double v10 = [(AERoundedCornerButton *)self layer];
      double v11 = v10;
      double v12 = 2.0;
LABEL_6:
      [v10 setCornerRadius:v12];
      double v13 = 12.0;
LABEL_7:

      v14 = [MEMORY[0x263F81708] systemFontOfSize:v13];
      [v9 setFont:v14];

      break;
    default:
      break;
  }
  uint64_t v15 = [MEMORY[0x263F825C8] blackColor];
  [v9 setTextColor:v15];

  [v9 setTextAlignment:1];
  [v9 setNumberOfLines:0];
  [(AERoundedCornerButton *)self _setLabel:v9];
  [(AERoundedCornerButton *)self addSubview:v9];
  if (a4 == 1)
  {
    double v21 = (void *)MEMORY[0x263F827E8];
    double v19 = AssetExplorerBundle();
    unint64_t v16 = [v21 imageNamed:@"albums" inBundle:v19];
    double v20 = @"OPEN_PHOTO_LIBRARY_BUTTON_LABEL";
  }
  else
  {
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    if (a4) {
      goto LABEL_13;
    }
    v18 = (void *)MEMORY[0x263F827E8];
    double v19 = AssetExplorerBundle();
    unint64_t v16 = [v18 imageNamed:@"camera" inBundle:v19];
    double v20 = @"OPEN_CAMERA_BUTTON_LABEL";
  }

  double v22 = v20;
  double v23 = AssetExplorerBundle();
  unint64_t v17 = [v23 localizedStringForKey:v22 value:&stru_26DEB7A80 table:@"AssetExplorer"];

LABEL_13:
  [v26 setImage:v16];
  double v24 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v17];
  id v25 = objc_alloc_init(MEMORY[0x263F81650]);
  [v25 setParagraphSpacingBefore:0.0];
  [v25 setAlignment:1];
  [v25 setLineBreakMode:0];
  objc_msgSend(v24, "addAttribute:value:range:", *MEMORY[0x263F81540], v25, 0, objc_msgSend(v17, "length"));
  [v9 setAttributedText:v24];
}

+ (id)roundedCornerButtonWithStyle:(int64_t)a3 buttonType:(int64_t)a4
{
  double v6 = objc_alloc_init(AERoundedCornerButton);
  [(AERoundedCornerButton *)v6 _commonAERoundedCornerButtonInitializationWithStyle:a3 buttonType:a4];
  return v6;
}

@end