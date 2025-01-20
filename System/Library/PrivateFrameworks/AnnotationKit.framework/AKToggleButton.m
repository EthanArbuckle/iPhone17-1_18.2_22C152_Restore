@interface AKToggleButton
+ (id)colorImage:(id)a3 withColor:(id)a4;
- (AKToggleButton)initWithFrame:(CGRect)a3 templateImage:(id)a4 autoUpdatesColor:(BOOL)a5;
- (BOOL)shouldTintNormalImage;
- (BOOL)showsBackgroundColor;
- (UIColor)selectedColor;
- (UIImage)templateImage;
- (void)_setDeselectedStateColorImage;
- (void)_setSelectedStateColorImage;
- (void)_touchCommitted:(id)a3;
- (void)_updateSelectionColorsAnimated:(BOOL)a3;
- (void)_updateStateColors;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShouldTintNormalImage:(BOOL)a3;
- (void)setShowsBackgroundColor:(BOOL)a3;
- (void)setTemplateImage:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AKToggleButton

- (AKToggleButton)initWithFrame:(CGRect)a3 templateImage:(id)a4 autoUpdatesColor:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AKToggleButton;
  v12 = -[AKToggleButton initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_showsBackgroundColor = 1;
    v12->_shouldTintNormalImage = 0;
    uint64_t v14 = [MEMORY[0x263F1C550] whiteColor];
    selectedColor = v13->_selectedColor;
    v13->_selectedColor = (UIColor *)v14;

    uint64_t v16 = [v11 imageWithRenderingMode:2];
    templateImage = v13->_templateImage;
    v13->_templateImage = (UIImage *)v16;

    if (v5) {
      [(AKToggleButton *)v13 addTarget:v13 action:sel__touchCommitted_ forControlEvents:64];
    }
  }

  return v13;
}

- (void)_touchCommitted:(id)a3
{
  uint64_t v4 = [(AKToggleButton *)self isSelected] ^ 1;

  [(AKToggleButton *)self setSelected:v4];
}

- (void)setSelected:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKToggleButton;
  [(AKToggleButton *)&v5 setSelected:a3];
  uint64_t v4 = [(AKToggleButton *)self imageForState:4];
  if (!v4) {
    NSLog(&cfstr_CreateASelecte.isa);
  }
  if ([(AKToggleButton *)self showsBackgroundColor]) {
    [(AKToggleButton *)self _updateSelectionColorsAnimated:1];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKToggleButton;
  [(AKToggleButton *)&v4 setHighlighted:a3];
  if ([(AKToggleButton *)self showsBackgroundColor]) {
    [(AKToggleButton *)self _updateSelectionColorsAnimated:1];
  }
}

- (void)_updateSelectionColorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(AKToggleButton *)self showsBackgroundColor])
  {
LABEL_13:
    v10 = [MEMORY[0x263F1C550] clearColor];
    goto LABEL_14;
  }
  if (v3) {
    double v5 = 0.2;
  }
  else {
    double v5 = 0.0;
  }
  if ([(AKToggleButton *)self isSelected])
  {
    v6 = (void *)MEMORY[0x263F1CB60];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_23762B79C;
    v15[3] = &unk_264CDAE40;
    v15[4] = self;
    v7 = v15;
LABEL_12:
    [v6 animateWithDuration:v7 animations:v5];
    return;
  }
  if (![(AKToggleButton *)self isHighlighted])
  {
    if (([(AKToggleButton *)self isSelected] & 1) != 0
      || ([(AKToggleButton *)self isHighlighted] & 1) != 0)
    {
      v6 = (void *)MEMORY[0x263F1CB60];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23762B810;
      v14[3] = &unk_264CDAE40;
      v14[4] = self;
      v7 = v14;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v8 = [(AKToggleButton *)self tintColor];
  uint64_t v9 = [v8 colorWithAlphaComponent:0.35];

  v10 = (void *)v9;
LABEL_14:
  id v13 = v10;
  uint64_t v11 = [v13 CGColor];
  v12 = [(AKToggleButton *)self layer];
  [v12 setBackgroundColor:v11];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v11.receiver = self;
    v11.super_class = (Class)AKToggleButton;
    [(AKToggleButton *)&v11 setImage:v6 forState:a4];
  }
  else
  {
    if ([(AKToggleButton *)self shouldTintNormalImage])
    {
      v7 = objc_opt_class();
      v8 = [(AKToggleButton *)self templateImage];
      uint64_t v9 = [(AKToggleButton *)self tintColor];
      v10 = [v7 colorImage:v8 withColor:v9];

      v13.receiver = self;
      v13.super_class = (Class)AKToggleButton;
      [(AKToggleButton *)&v13 setImage:v10 forState:0];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)AKToggleButton;
      [(AKToggleButton *)&v12 setImage:v6 forState:0];
    }
    [(AKToggleButton *)self _setSelectedStateColorImage];
  }
}

- (void)_setSelectedStateColorImage
{
  if ([(AKToggleButton *)self shouldTintNormalImage])
  {
    if ([(AKToggleButton *)self tintAdjustmentMode] == 2) {
      [(AKToggleButton *)self tintColor];
    }
    else {
    BOOL v3 = [(AKToggleButton *)self selectedColor];
    }
    objc_super v4 = objc_opt_class();
    double v5 = [(AKToggleButton *)self templateImage];
    id v6 = [v4 colorImage:v5 withColor:v3];

    v7.receiver = self;
    v7.super_class = (Class)AKToggleButton;
    [(AKToggleButton *)&v7 setImage:v6 forState:4];
  }
}

- (void)_setDeselectedStateColorImage
{
  if ([(AKToggleButton *)self shouldTintNormalImage])
  {
    BOOL v3 = [(AKToggleButton *)self tintColor];
    objc_super v4 = objc_opt_class();
    double v5 = [(AKToggleButton *)self templateImage];
    id v6 = [v4 colorImage:v5 withColor:v3];

    v7.receiver = self;
    v7.super_class = (Class)AKToggleButton;
    [(AKToggleButton *)&v7 setImage:v6 forState:0];
  }
}

- (void)_updateStateColors
{
  BOOL v3 = [(AKToggleButton *)self traitCollection];
  BOOL v4 = sub_237671860(v3);

  if (!v4) {
    [(AKToggleButton *)self _setSelectedStateColorImage];
  }
  [(AKToggleButton *)self _setDeselectedStateColorImage];

  [(AKToggleButton *)self _updateSelectionColorsAnimated:0];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AKToggleButton;
  [(AKToggleButton *)&v3 tintColorDidChange];
  [(AKToggleButton *)self _updateStateColors];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AKToggleButton;
  id v4 = a3;
  [(AKToggleButton *)&v7 traitCollectionDidChange:v4];
  double v5 = [(AKToggleButton *)self traitCollection];
  BOOL v6 = sub_2376718B0(v5, v4);

  if (!v6) {
    [(AKToggleButton *)self _updateStateColors];
  }
}

+ (id)colorImage:(id)a3 withColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 size];
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  [v6 size];
  CGFloat v8 = v7;
  [v6 size];
  CGFloat v10 = v9;
  CurrentContext = UIGraphicsGetCurrentContext();
  [v6 size];
  v19.b = 0.0;
  v19.c = 0.0;
  v19.a = 1.0;
  *(_OWORD *)&v19.d = xmmword_2376F4600;
  v19.tdouble y = v12;
  CGContextConcatCTM(CurrentContext, &v19);
  id v13 = v6;
  uint64_t v14 = (CGImage *)[v13 CGImage];

  v22.origin.double x = 0.0;
  v22.origin.double y = 0.0;
  v22.size.double width = v8;
  v22.size.double height = v10;
  CGContextClipToMask(CurrentContext, v22, v14);
  id v15 = v5;
  uint64_t v16 = (CGColor *)[v15 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v16);
  v23.origin.double x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double width = v8;
  v23.size.double height = v10;
  CGContextFillRect(CurrentContext, v23);
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

- (BOOL)showsBackgroundColor
{
  return self->_showsBackgroundColor;
}

- (void)setShowsBackgroundColor:(BOOL)a3
{
  self->_showsBackgroundColor = a3;
}

- (BOOL)shouldTintNormalImage
{
  return self->_shouldTintNormalImage;
}

- (void)setShouldTintNormalImage:(BOOL)a3
{
  self->_shouldTintNormalImage = a3;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
}

- (UIImage)templateImage
{
  return self->_templateImage;
}

- (void)setTemplateImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateImage, 0);

  objc_storeStrong((id *)&self->_selectedColor, 0);
}

@end