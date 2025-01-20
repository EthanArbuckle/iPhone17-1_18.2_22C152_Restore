@interface CPUIModernButton
- (BOOL)_supportsFocus;
- (BOOL)isTouchDown;
- (BOOL)prefersWhiteInDefaultState;
- (BOOL)shouldStaySelected;
- (BOOL)showButtonBackgroundShape;
- (CPUIModernButton)initWithFrame:(CGRect)a3;
- (NSUUID)identifier;
- (id)description;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setIsTouchDown:(BOOL)a3;
- (void)setPrefersWhiteInDefaultState:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldStaySelected:(BOOL)a3;
- (void)setShowButtonBackgroundShape:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CPUIModernButton

- (CPUIModernButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CPUIModernButton;
  v3 = -[CPUIModernButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CPUIModernButton *)v3 titleLabel];
    v6 = [MEMORY[0x263F81708] systemFontOfSize:16.0 weight:*MEMORY[0x263F81838]];
    [v5 setFont:v6];

    [(CPUIModernButton *)v4 setShowsTouchWhenHighlighted:0];
    [(CPUIModernButton *)v4 setAdjustsImageWhenDisabled:0];
    [(CPUIModernButton *)v4 setAdjustsImageWhenHighlighted:0];
    [(CPUIModernButton *)v4 _setContinuousCornerRadius:7.0];
    v7 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    v8 = [(CPUIModernButton *)v4 layer];
    [v8 setCompositingFilter:v7];

    v9 = [(CPUIModernButton *)v4 layer];
    [v9 setAllowsGroupBlending:1];
  }
  return v4;
}

- (BOOL)_supportsFocus
{
  v2 = [(CPUIModernButton *)self window];
  v3 = [v2 windowScene];
  v4 = [v3 focusSystem];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)CPUIModernButton;
  [(CPUIModernButton *)&v35 layoutSubviews];
  if (self->_isTouchDown && self->_shouldStaySelected && ([(CPUIModernButton *)self isSelected] & 1) == 0)
  {
    objc_super v11 = (void *)MEMORY[0x263F825C8];
    BOOL v12 = [(CPUIModernButton *)self _supportsFocus];
    double v13 = 0.400000006;
    if (!v12) {
      double v13 = 0.150000006;
    }
    v14 = [v11 colorWithWhite:1.0 alpha:v13];
    [(CPUIModernButton *)self setBackgroundColor:v14];

    v9 = (void *)MEMORY[0x263F825C8];
    v10 = [MEMORY[0x263F825C8] whiteColor];
    goto LABEL_12;
  }
  if (([(CPUIModernButton *)self isSelected] & 1) == 0
    && ![(CPUIModernButton *)self isHighlighted])
  {
    int v22 = [(CPUIModernButton *)self isFocused];
    BOOL v23 = [(CPUIModernButton *)self prefersWhiteInDefaultState];
    if (v22)
    {
      if (v23) {
        [MEMORY[0x263F825C8] whiteColor];
      }
      else {
      v24 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.600000024];
      }
      BOOL v25 = [(CPUIModernButton *)self showButtonBackgroundShape];
      double v26 = 0.400000006;
      if (!v25) {
        double v26 = 0.150000006;
      }
      double v27 = 1.0;
      v28 = (void *)MEMORY[0x263F825C8];
    }
    else
    {
      if (v23) {
        [MEMORY[0x263F825C8] whiteColor];
      }
      else {
      v24 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.600000024];
      }
      BOOL v29 = [(CPUIModernButton *)self showButtonBackgroundShape];
      v28 = (void *)MEMORY[0x263F825C8];
      if (!v29)
      {
        uint64_t v30 = [MEMORY[0x263F825C8] clearColor];
        goto LABEL_28;
      }
      double v26 = 0.150000006;
      double v27 = 1.0;
    }
    uint64_t v30 = [v28 colorWithWhite:v27 alpha:v26];
LABEL_28:
    v31 = (void *)v30;
    [(CPUIModernButton *)self setBackgroundColor:v30];

    v32 = (void *)MEMORY[0x263F825C8];
    id v19 = v24;
    v33 = objc_msgSend(v32, "colorWithCGColor:", objc_msgSend(v19, "CGColor"));
    v34 = [(CPUIModernButton *)self imageView];
    [v34 setTintColor:v33];

    v18 = (void *)MEMORY[0x263F825C8];
    goto LABEL_13;
  }
  v3 = [(CPUIModernButton *)self titleForState:0];
  BOOL v4 = [v3 length] == 0;

  BOOL v5 = (void *)MEMORY[0x263F825C8];
  int v6 = [(CPUIModernButton *)self isFocused];
  double v7 = 1.0;
  if ((v6 & v4) == 0) {
    double v7 = 0.400000006;
  }
  v8 = [v5 colorWithWhite:1.0 alpha:v7];
  [(CPUIModernButton *)self setBackgroundColor:v8];

  v9 = (void *)MEMORY[0x263F825C8];
  v10 = [MEMORY[0x263F825C8] blackColor];
LABEL_12:
  id v15 = v10;
  v16 = objc_msgSend(v9, "colorWithCGColor:", objc_msgSend(v15, "CGColor"));
  v17 = [(CPUIModernButton *)self imageView];
  [v17 setTintColor:v16];

  v18 = (void *)MEMORY[0x263F825C8];
  id v19 = [MEMORY[0x263F825C8] whiteColor];
LABEL_13:
  id v20 = v19;
  v21 = objc_msgSend(v18, "colorWithCGColor:", objc_msgSend(v20, "CGColor"));
  [(CPUIModernButton *)self setTitleColor:v21 forState:0];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CPUIModernButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CPUIModernButton;
    [(CPUIModernButton *)&v5 setSelected:v3];
    [(CPUIModernButton *)self setNeedsLayout];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CPUIModernButton;
  id v6 = a3;
  [(CPUIModernButton *)&v9 touchesBegan:v6 withEvent:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __CPUITouchesContainsTouchType_block_invoke;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  double v7 = [v6 objectsPassingTest:v10];

  uint64_t v8 = [v7 count];
  if (v8)
  {
    self->_isTouchDown = 1;
    [(CPUIModernButton *)self setNeedsLayout];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPUIModernButton;
  [(CPUIModernButton *)&v12 touchesEnded:v6 withEvent:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __CPUITouchesContainsTouchType_block_invoke;
  v13[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v13[4] = 0;
  uint64_t v8 = [v6 objectsPassingTest:v13];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    self->_isTouchDown = 0;
    if (self->_shouldStaySelected
      && ([v6 anyObject],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 locationInView:self],
          -[CPUIModernButton hitTest:withEvent:](self, "hitTest:withEvent:", v7),
          objc_super v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      [(CPUIModernButton *)self setSelected:[(CPUIModernButton *)self isSelected] ^ 1];
    }
    else
    {
      [(CPUIModernButton *)self setNeedsLayout];
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CPUIModernButton;
  id v6 = a3;
  [(CPUIModernButton *)&v9 touchesCancelled:v6 withEvent:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __CPUITouchesContainsTouchType_block_invoke;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  id v7 = [v6 objectsPassingTest:v10];

  uint64_t v8 = [v7 count];
  if (v8)
  {
    self->_isTouchDown = 0;
    [(CPUIModernButton *)self setNeedsLayout];
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPUIModernButton;
  [(CPUIModernButton *)&v13 pressesBegan:v6 withEvent:a4];
  id v7 = v6;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * v12) type] == 4)
        {

          [(CPUIModernButton *)self setHighlighted:1];
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPUIModernButton;
  [(CPUIModernButton *)&v13 pressesEnded:v6 withEvent:a4];
  id v7 = v6;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) type] == 4)
        {

          if (self->_shouldStaySelected) {
            [(CPUIModernButton *)self setSelected:[(CPUIModernButton *)self isSelected] ^ 1];
          }
          [(CPUIModernButton *)self setHighlighted:0];
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_13:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPUIModernButton;
  [(CPUIModernButton *)&v13 pressesCancelled:v6 withEvent:a4];
  id v7 = v6;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * v12) type] == 4)
        {

          [(CPUIModernButton *)self setHighlighted:0];
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPUIModernButton;
  BOOL v4 = [(CPUIModernButton *)&v8 description];
  objc_super v5 = [(CPUIModernButton *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@; identifier: %@;", v4, v5];

  return v6;
}

- (BOOL)showButtonBackgroundShape
{
  return self->_showButtonBackgroundShape;
}

- (void)setShowButtonBackgroundShape:(BOOL)a3
{
  self->_showButtonBackgroundShape = a3;
}

- (BOOL)prefersWhiteInDefaultState
{
  return self->_prefersWhiteInDefaultState;
}

- (void)setPrefersWhiteInDefaultState:(BOOL)a3
{
  self->_prefersWhiteInDefaultState = a3;
}

- (BOOL)shouldStaySelected
{
  return self->_shouldStaySelected;
}

- (void)setShouldStaySelected:(BOOL)a3
{
  self->_shouldStaySelected = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isTouchDown
{
  return self->_isTouchDown;
}

- (void)setIsTouchDown:(BOOL)a3
{
  self->_isTouchDown = a3;
}

- (void).cxx_destruct
{
}

@end