@interface MKCatalystButton
+ (CGColor)extraShadowLayerBackgroundColorWithDarkMode:(BOOL)a3 isbuttonEnabled:(BOOL)a4;
+ (id)buttonWithType:(int64_t)a3;
+ (id)catalystButton;
+ (id)titleFont;
- (BOOL)isPrimaryButton;
- (CAGradientLayer)gradientLayer;
- (CALayer)extraShadowLayer;
- (CGSize)_maps_intrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (NSAttributedString)subTitle;
- (NSAttributedString)title;
- (_MKPlaceActionButtonController)buttonController;
- (double)shortHeight;
- (double)tallHeight;
- (id)_attributedStringForSubTitle:(id)a3 controlState:(unint64_t)a4;
- (id)_attributedStringForTitle:(id)a3 controlState:(unint64_t)a4;
- (id)_attributedStringWithTitle:(id)a3 subtitle:(id)a4 controlState:(unint64_t)a5;
- (void)_updateColors;
- (void)applyBorder:(BOOL)a3;
- (void)buttonSelected:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)placeActionButtonControllerTextDidChange:(id)a3;
- (void)setButtonController:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExtraShadowLayer:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsPrimaryButton:(BOOL)a3;
- (void)setPrimaryTitle:(id)a3;
- (void)setPrimaryTitle:(id)a3 subtitle:(id)a4;
- (void)setShortHeight:(double)a3;
- (void)setSubTitle:(id)a3;
- (void)setTallHeight:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation MKCatalystButton

+ (id)buttonWithType:(int64_t)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MKCatalystButton;
  v3 = objc_msgSendSuper2(&v6, sel_buttonWithType_, a3);
  v4 = v3;
  if (v3)
  {
    [v3 setTallHeight:42.0];
    [v4 setShortHeight:22.0];
  }

  return v4;
}

+ (id)catalystButton
{
  v2 = +[MKCatalystButton buttonWithType:0];
  [v2 setContentHorizontalAlignment:4];
  objc_msgSend(v2, "setContentEdgeInsets:", 5.0, 10.0, 7.0, 10.0);
  v3 = [v2 titleLabel];
  [v3 setLineBreakMode:0];

  v4 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
  id v5 = (id)[v2 registerForTraitChanges:v4 withAction:sel_traitEnvironment_didChangeTraitCollection_];

  return v2;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MKCatalystButton;
  [(MKCatalystButton *)&v3 didMoveToSuperview];
  [(MKCatalystButton *)self _updateColors];
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = [(MKCatalystButton *)self subTitle];

  double v4 = *MEMORY[0x1E4F43ED8];
  if (v3) {
    [(MKCatalystButton *)self tallHeight];
  }
  else {
    [(MKCatalystButton *)self shortHeight];
  }
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)_maps_intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)MKCatalystButton;
  [(MKCatalystButton *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v5 = [(MKCatalystButton *)self subTitle];
  if (v5) {
    [(MKCatalystButton *)self tallHeight];
  }
  else {
    [(MKCatalystButton *)self shortHeight];
  }
  double v7 = v6;

  double v8 = v4;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)MKCatalystButton;
  [(MKCatalystButton *)&v33 layoutSubviews];
  uint64_t v3 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(MKCatalystButton *)self bounds];
  double v4 = round(CGRectGetHeight(v34) * 0.189999998);
  double v5 = [(MKCatalystButton *)self layer];
  [v5 setMasksToBounds:0];

  double v6 = [(MKCatalystButton *)self layer];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(MKCatalystButton *)self extraShadowLayer];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16 = [(MKCatalystButton *)self extraShadowLayer];
  [v16 setMasksToBounds:0];

  v17 = [(MKCatalystButton *)self extraShadowLayer];
  [v17 setCornerRadius:v4];

  uint64_t v18 = *MEMORY[0x1E4F39EA8];
  v19 = [(MKCatalystButton *)self extraShadowLayer];
  [v19 setCornerCurve:v18];

  v20 = [(MKCatalystButton *)self layer];
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(MKCatalystButton *)self gradientLayer];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  v30 = [(MKCatalystButton *)self gradientLayer];
  [v30 setCornerRadius:v4];

  v31 = [(MKCatalystButton *)self gradientLayer];
  [v31 setCornerCurve:v18];

  v32 = [(MKCatalystButton *)self gradientLayer];
  [v32 setMasksToBounds:1];

  [MEMORY[0x1E4F39CF8] setDisableActions:v3];
}

- (void)buttonSelected:(id)a3
{
  id v8 = a3;
  double v4 = [(MKCatalystButton *)self buttonController];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    double v6 = [WeakRetained buttonSelectedBlock];

    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v8;
      }
      else {
        id v7 = 0;
      }
      ((void (**)(void, id))v6)[2](v6, v7);
    }
  }
}

- (void)applyBorder:(BOOL)a3
{
  BOOL v5 = a3;
  if (a3)
  {
    uint64_t v3 = [(MKCatalystButton *)self titleLabel];
    id v4 = [v3 textColor];
    uint64_t v7 = [v4 CGColor];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [(MKCatalystButton *)self extraShadowLayer];
  [v8 setBorderColor:v7];

  double v9 = 0.0;
  if (v5)
  {

    double v9 = 1.0;
  }
  double v10 = [(MKCatalystButton *)self extraShadowLayer];
  [v10 setBorderWidth:v9];

  if (v5)
  {
    double v10 = [(MKCatalystButton *)self titleLabel];
    id v4 = [v10 textColor];
    uint64_t v11 = [v4 CGColor];
  }
  else
  {
    uint64_t v11 = 0;
  }
  double v12 = [(MKCatalystButton *)self gradientLayer];
  [v12 setBorderColor:v11];

  if (v5)
  {
  }
  id v13 = [(MKCatalystButton *)self gradientLayer];
  [v13 setBorderWidth:v9];
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E4F43870], *MEMORY[0x1E4F43930]);
}

- (void)setButtonController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_buttonController, obj);
    [obj setDelegate:self];

    id v6 = objc_loadWeakRetained((id *)&self->_buttonController);
    uint64_t v7 = [v6 buttonTitle];
    id v8 = objc_loadWeakRetained((id *)&self->_buttonController);
    double v9 = [v8 buttonSubTitle];
    [(MKCatalystButton *)self setPrimaryTitle:v7 subtitle:v9];

    [(MKCatalystButton *)self addTarget:self action:sel_buttonSelected_ forControlEvents:64];
    id v10 = objc_loadWeakRetained((id *)&self->_buttonController);
    -[MKCatalystButton setEnabled:](self, "setEnabled:", [v10 disabled] ^ 1);
  }
}

- (CALayer)extraShadowLayer
{
  extraShadowLayer = self->_extraShadowLayer;
  if (!extraShadowLayer)
  {
    id v4 = [MEMORY[0x1E4F39BE8] layer];
    id v5 = self->_extraShadowLayer;
    self->_extraShadowLayer = v4;

    id v6 = [(MKCatalystButton *)self layer];
    [v6 insertSublayer:self->_extraShadowLayer atIndex:0];

    [(CALayer *)self->_extraShadowLayer setActions:0];
    extraShadowLayer = self->_extraShadowLayer;
  }

  return extraShadowLayer;
}

- (CAGradientLayer)gradientLayer
{
  gradientLayer = self->_gradientLayer;
  if (!gradientLayer)
  {
    id v4 = [MEMORY[0x1E4F39BD0] layer];
    id v5 = self->_gradientLayer;
    self->_gradientLayer = v4;

    [(CAGradientLayer *)self->_gradientLayer setHidden:1];
    id v6 = [(MKCatalystButton *)self layer];
    uint64_t v7 = self->_gradientLayer;
    id v8 = [(MKCatalystButton *)self extraShadowLayer];
    [v6 insertSublayer:v7 above:v8];

    [(CAGradientLayer *)self->_gradientLayer setActions:0];
    gradientLayer = self->_gradientLayer;
  }

  return gradientLayer;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKCatalystButton;
  [(MKCatalystButton *)&v4 setHighlighted:a3];
  [(MKCatalystButton *)self _updateColors];
}

- (void)setIsPrimaryButton:(BOOL)a3
{
  self->_isPrimaryButton = a3;
  [(MKCatalystButton *)self _updateColors];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKCatalystButton;
  [(MKCatalystButton *)&v4 setEnabled:a3];
  [(MKCatalystButton *)self _updateColors];
}

- (void)setPrimaryTitle:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v20 = self;
    id v6 = [v4 string];
    uint64_t v7 = [v6 componentsSeparatedByString:@"\n"];

    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) length];
          v16 = objc_msgSend(v5, "attributedSubstringFromRange:", v12, v15);
          [v8 addObject:v16];
          v12 += v15 + [@"\n" length];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    if ([v9 count])
    {
      v17 = [v8 objectAtIndexedSubscript:0];
      uint64_t v18 = 0;
      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v18 = [v8 objectAtIndexedSubscript:1];
      }
      self = v20;
      if (![v18 length])
      {
        uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];

        uint64_t v18 = (void *)v19;
      }
    }
    else
    {
      uint64_t v18 = 0;
      v17 = 0;
      self = v20;
    }
  }
  else
  {
    uint64_t v18 = 0;
    v17 = 0;
  }
  [(MKCatalystButton *)self setTitle:v17];
  [(MKCatalystButton *)self setSubTitle:v18];
  [(MKCatalystButton *)self _updateColors];
}

- (void)setPrimaryTitle:(id)a3 subtitle:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
    [(MKCatalystButton *)self setTitle:v7];

    if (v6)
    {
LABEL_3:
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
      [(MKCatalystButton *)self setSubTitle:v8];

      goto LABEL_6;
    }
  }
  else
  {
    [(MKCatalystButton *)self setTitle:0];
    if (v6) {
      goto LABEL_3;
    }
  }
  [(MKCatalystButton *)self setSubTitle:0];
LABEL_6:
  [(MKCatalystButton *)self _updateColors];
}

- (void)placeActionButtonControllerTextDidChange:(id)a3
{
  p_buttonController = &self->_buttonController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_buttonController);

  if (WeakRetained == v5)
  {
    id v10 = objc_loadWeakRetained((id *)p_buttonController);
    uint64_t v7 = [v10 buttonTitle];
    id v8 = objc_loadWeakRetained((id *)p_buttonController);
    id v9 = [v8 buttonSubTitle];
    [(MKCatalystButton *)self setPrimaryTitle:v7 subtitle:v9];
  }
}

- (id)_attributedStringWithTitle:(id)a3 subtitle:(id)a4 controlState:(unint64_t)a5
{
  id v8 = a4;
  if (v8)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F28E48];
    id v10 = a3;
    id v11 = objc_alloc_init(v9);
    uint64_t v12 = [(MKCatalystButton *)self _attributedStringForTitle:v10 controlState:a5];

    [v11 appendAttributedString:v12];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v11 appendAttributedString:v13];

    double v14 = [(MKCatalystButton *)self _attributedStringForSubTitle:v8 controlState:a5];
    [v11 appendAttributedString:v14];

    uint64_t v15 = [v11 copy];
  }
  else
  {
    id v11 = a3;
    uint64_t v15 = [(MKCatalystButton *)self _attributedStringForTitle:v11 controlState:a5];
  }
  v16 = (void *)v15;

  return v16;
}

- (id)_attributedStringForTitle:(id)a3 controlState:(unint64_t)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v11 = 0;
    goto LABEL_17;
  }
  id v6 = (void *)MEMORY[0x1E4F428B8];
  id v7 = a3;
  id v8 = [v6 labelColor];
  id v9 = v8;
  if ((uint64_t)a4 <= 3)
  {
    if (a4 != 1)
    {
      if (a4 != 2) {
        goto LABEL_12;
      }
      uint64_t v10 = [v8 colorWithAlphaComponent:0.3];
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a4 == 4)
  {
LABEL_10:
    uint64_t v10 = [MEMORY[0x1E4F428B8] whiteColor];
    goto LABEL_11;
  }
  if (a4 != 16711680) {
    goto LABEL_12;
  }
  uint64_t v10 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
LABEL_11:
  uint64_t v12 = (void *)v10;

  id v9 = v12;
LABEL_12:
  uint64_t v13 = [(MKCatalystButton *)self traitCollection];
  if (![v13 activeAppearance])
  {
LABEL_15:

    goto LABEL_16;
  }
  BOOL v14 = [(MKCatalystButton *)self isPrimaryButton];

  if (v14)
  {
    [MEMORY[0x1E4F428B8] whiteColor];
    id v9 = v13 = v9;
    goto LABEL_15;
  }
LABEL_16:
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v7];

  objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E4F42540], 0, objc_msgSend(v11, "length"));
  v18[0] = *MEMORY[0x1E4F42508];
  uint64_t v15 = [(id)objc_opt_class() titleFont];
  v18[1] = *MEMORY[0x1E4F42510];
  v19[0] = v15;
  v19[1] = v9;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  objc_msgSend(v11, "addAttributes:range:", v16, 0, objc_msgSend(v11, "length"));

LABEL_17:

  return v11;
}

- (id)_attributedStringForSubTitle:(id)a3 controlState:(unint64_t)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F428B8];
  id v7 = a3;
  id v8 = [v6 secondaryLabelColor];
  id v9 = v8;
  switch(a4)
  {
    case 0uLL:
      id v11 = [(MKCatalystButton *)self traitCollection];
      if (![v11 activeAppearance]) {
        goto LABEL_10;
      }
      BOOL v12 = [(MKCatalystButton *)self isPrimaryButton];

      if (v12)
      {
        uint64_t v10 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.850000024];
        goto LABEL_9;
      }
      goto LABEL_11;
    case 1uLL:
    case 4uLL:
      uint64_t v10 = [MEMORY[0x1E4F428B8] whiteColor];
      goto LABEL_9;
    case 2uLL:
      uint64_t v10 = [v8 colorWithAlphaComponent:0.3];
      goto LABEL_9;
    case 3uLL:
      goto LABEL_11;
    default:
      if (a4 != 16711680) {
        goto LABEL_11;
      }
      uint64_t v10 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
LABEL_9:
      id v11 = v9;
      id v9 = (void *)v10;
LABEL_10:

LABEL_11:
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v7];

      objc_msgSend(v13, "removeAttribute:range:", *MEMORY[0x1E4F42540], 0, objc_msgSend(v13, "length"));
      uint64_t v14 = *MEMORY[0x1E4F42510];
      v24[0] = v9;
      uint64_t v15 = *MEMORY[0x1E4F42508];
      v23[0] = v14;
      v23[1] = v15;
      v16 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F43870]);
      v24[1] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      objc_msgSend(v13, "addAttributes:range:", v17, 0, objc_msgSend(v13, "length"));

      if (-[MKCatalystButton isPrimaryButton](self, "isPrimaryButton") && [v13 length])
      {
        uint64_t v21 = v15;
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F43878]);
        long long v22 = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        objc_msgSend(v13, "addAttributes:range:", v19, 0, 1);
      }
      return v13;
  }
}

- (void)_updateColors
{
  v49[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v4 = [MEMORY[0x1E4F428B8] systemRedColor];
  if ([(MKCatalystButton *)self isHighlighted])
  {
    id v5 = v4;
    v48[0] = [v5 CGColor];
    v48[1] = [v5 CGColor];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    id v7 = [(MKCatalystButton *)self gradientLayer];
    [v7 setColors:v6];
  }
  else
  {
    double v45 = 0.0;
    double v46 = 0.0;
    uint64_t v43 = 0;
    double v44 = 0.0;
    [v4 getHue:&v46 saturation:&v45 brightness:&v44 alpha:&v43];
    id v6 = [MEMORY[0x1E4F428B8] colorWithHue:v46 saturation:v45 brightness:v44 + 0.1 alpha:1.0];
    v49[0] = [v6 CGColor];
    v49[1] = [v4 CGColor];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    id v8 = [(MKCatalystButton *)self gradientLayer];
    [v8 setColors:v7];
  }
  id v9 = [(MKCatalystButton *)self traitCollection];
  if ([v9 activeAppearance])
  {
    if ([(MKCatalystButton *)self isPrimaryButton]) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = [(MKCatalystButton *)self isHighlighted] ^ 1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  id v11 = [(MKCatalystButton *)self gradientLayer];
  [v11 setHidden:v10];

  BOOL v12 = objc_opt_class();
  uint64_t v13 = [(MKCatalystButton *)self traitCollection];
  uint64_t v14 = objc_msgSend(v12, "extraShadowLayerBackgroundColorWithDarkMode:isbuttonEnabled:", objc_msgSend(v13, "userInterfaceStyle") == 2, -[MKCatalystButton isEnabled](self, "isEnabled"));
  uint64_t v15 = [(MKCatalystButton *)self extraShadowLayer];
  [v15 setBackgroundColor:v14];

  [MEMORY[0x1E4F39CF8] setDisableActions:v3];
  v16 = [MEMORY[0x1E4F428B8] labelColor];
  id v17 = [v16 colorWithAlphaComponent:0.07];
  uint64_t v18 = [v17 CGColor];
  uint64_t v19 = [(MKCatalystButton *)self extraShadowLayer];
  [v19 setBorderColor:v18];

  id v20 = [MEMORY[0x1E4F428B8] blackColor];
  uint64_t v21 = [v20 CGColor];
  long long v22 = [(MKCatalystButton *)self extraShadowLayer];
  [v22 setShadowColor:v21];

  id v23 = [MEMORY[0x1E4F428B8] blackColor];
  uint64_t v24 = [v23 CGColor];
  double v25 = [(MKCatalystButton *)self layer];
  [v25 setShadowColor:v24];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v26 = [&unk_1ED97F560 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(&unk_1ED97F560);
        }
        uint64_t v30 = [*(id *)(*((void *)&v39 + 1) + 8 * i) unsignedIntegerValue];
        v31 = [(MKCatalystButton *)self title];
        v32 = [(MKCatalystButton *)self subTitle];
        objc_super v33 = [(MKCatalystButton *)self _attributedStringWithTitle:v31 subtitle:v32 controlState:v30];
        [(MKCatalystButton *)self setAttributedTitle:v33 forState:v30];
      }
      uint64_t v27 = [&unk_1ED97F560 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v27);
  }
  CGRect v34 = [(MKCatalystButton *)self subTitle];
  v35 = [(MKCatalystButton *)self titleLabel];
  [v35 setLineBreakMode:4 * (v34 == 0)];

  v36 = [(MKCatalystButton *)self subTitle];
  if (v36) {
    uint64_t v37 = 2;
  }
  else {
    uint64_t v37 = 1;
  }
  v38 = [(MKCatalystButton *)self titleLabel];
  [v38 setNumberOfLines:v37];
}

+ (CGColor)extraShadowLayerBackgroundColorWithDarkMode:(BOOL)a3 isbuttonEnabled:(BOOL)a4
{
  if (a3)
  {
    if (a4) {
      double v4 = 0.2;
    }
    else {
      double v4 = 0.02;
    }
    double v5 = 1.0;
  }
  else if (a4)
  {
    double v5 = 1.0;
    double v4 = 0.5;
  }
  else
  {
    double v4 = 0.02;
    double v5 = 0.0;
  }
  id v6 = [MEMORY[0x1E4F428B8] colorWithWhite:v5 alpha:v4];
  id v7 = (CGColor *)[v6 CGColor];

  return v7;
}

- (_MKPlaceActionButtonController)buttonController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  return (_MKPlaceActionButtonController *)WeakRetained;
}

- (BOOL)isPrimaryButton
{
  return self->_isPrimaryButton;
}

- (double)tallHeight
{
  return self->_tallHeight;
}

- (void)setTallHeight:(double)a3
{
  self->_tallHeight = a3;
}

- (double)shortHeight
{
  return self->_shortHeight;
}

- (void)setShortHeight:(double)a3
{
  self->_shortHeight = a3;
}

- (void)setExtraShadowLayer:(id)a3
{
}

- (void)setGradientLayer:(id)a3
{
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_extraShadowLayer, 0);

  objc_destroyWeak((id *)&self->_buttonController);
}

@end