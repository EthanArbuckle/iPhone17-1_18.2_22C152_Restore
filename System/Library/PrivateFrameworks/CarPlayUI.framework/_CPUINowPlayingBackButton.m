@interface _CPUINowPlayingBackButton
- (CPUIFocusRingView)focusRing;
- (_CPUINowPlayingBackButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setFocusRing:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _CPUINowPlayingBackButton

- (_CPUINowPlayingBackButton)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  v3 = -[_CPUINowPlayingBackButton initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, 160.0, 44.0);
  v4 = v3;
  if (v3)
  {
    [(_CPUINowPlayingBackButton *)v3 setShowsTouchWhenHighlighted:0];
    [(_CPUINowPlayingBackButton *)v4 setAdjustsImageWhenDisabled:0];
    [(_CPUINowPlayingBackButton *)v4 setAdjustsImageWhenHighlighted:0];
    v5 = [(_CPUINowPlayingBackButton *)v4 traitCollection];
    v6 = CPUIImageNamedWithTraitCollection(@"BackButtonChevron", v5);
    v7 = [v6 imageFlippedForRightToLeftLayoutDirection];
    v8 = [v7 imageWithRenderingMode:2];

    [(_CPUINowPlayingBackButton *)v4 setImage:v8 forState:0];
    v9 = CPUILocalizedStringForKey(@"BACK");
    v14[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [(_CPUINowPlayingBackButton *)v4 setAccessibilityUserInputLabels:v10];

    v11 = [(_CPUINowPlayingBackButton *)v4 layer];
    [v11 setMasksToBounds:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v52[4] = *MEMORY[0x263EF8340];
  v51.receiver = self;
  v51.super_class = (Class)_CPUINowPlayingBackButton;
  [(_CPUINowPlayingBackButton *)&v51 layoutSubviews];
  int v3 = [(_CPUINowPlayingBackButton *)self isFocused];
  v4 = [(_CPUINowPlayingBackButton *)self focusRing];
  v5 = v4;
  if (v3)
  {

    if (v5)
    {
      v5 = [(_CPUINowPlayingBackButton *)self focusRing];
      [v5 setHidden:0];
      double v6 = 1.0;
    }
    else
    {
      v7 = [CPUIFocusRingView alloc];
      v8 = -[CPUIFocusRingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      focusRing = self->_focusRing;
      self->_focusRing = v8;

      v10 = [(_CPUINowPlayingBackButton *)self focusRing];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v6 = 1.0;
      v11 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.600000024];
      v12 = [(_CPUINowPlayingBackButton *)self focusRing];
      [v12 setRingColor:v11];

      objc_super v13 = [(_CPUINowPlayingBackButton *)self focusRing];
      [v13 setCornerRadius:14.0];

      v14 = [(_CPUINowPlayingBackButton *)self focusRing];
      [(_CPUINowPlayingBackButton *)self addSubview:v14];

      v43 = (void *)MEMORY[0x263F08938];
      v5 = [(_CPUINowPlayingBackButton *)self focusRing];
      v49 = [v5 centerXAnchor];
      v50 = [(_CPUINowPlayingBackButton *)self imageView];
      v48 = [v50 centerXAnchor];
      v47 = [v49 constraintEqualToAnchor:v48];
      v52[0] = v47;
      v46 = [(_CPUINowPlayingBackButton *)self focusRing];
      v44 = [v46 centerYAnchor];
      v45 = [(_CPUINowPlayingBackButton *)self imageView];
      v42 = [v45 centerYAnchor];
      v41 = [v44 constraintEqualToAnchor:v42];
      v52[1] = v41;
      v40 = [(_CPUINowPlayingBackButton *)self focusRing];
      v39 = [v40 heightAnchor];
      v15 = [v39 constraintEqualToConstant:28.0];
      v52[2] = v15;
      v16 = [(_CPUINowPlayingBackButton *)self focusRing];
      v17 = [v16 widthAnchor];
      v18 = [(_CPUINowPlayingBackButton *)self focusRing];
      v19 = [v18 heightAnchor];
      v20 = [v17 constraintEqualToAnchor:v19];
      v52[3] = v20;
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:4];
      [v43 activateConstraints:v21];
    }
  }
  else
  {
    [v4 setHidden:1];
    double v6 = 0.600000024;
  }

  if ([(_CPUINowPlayingBackButton *)self isHighlighted])
  {
    v22 = [(_CPUINowPlayingBackButton *)self focusRing];
    [v22 setAlpha:0.600000024];

    double v23 = 1.0;
  }
  else if ([(_CPUINowPlayingBackButton *)self isFocused])
  {
    double v23 = v6;
  }
  else
  {
    double v23 = 0.600000024;
  }
  v24 = (void *)MEMORY[0x263F825C8];
  id v25 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:v23];
  v26 = objc_msgSend(v24, "colorWithCGColor:", objc_msgSend(v25, "CGColor"));
  v27 = [(_CPUINowPlayingBackButton *)self imageView];
  [v27 setTintColor:v26];

  v28 = [(_CPUINowPlayingBackButton *)self traitCollection];
  uint64_t v29 = [v28 layoutDirection];

  v30 = [(_CPUINowPlayingBackButton *)self imageView];
  [v30 frame];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  if (v29) {
    double v37 = 132.0;
  }
  else {
    double v37 = 0.0;
  }
  v38 = [(_CPUINowPlayingBackButton *)self imageView];
  objc_msgSend(v38, "setFrame:", v37, v32, v34, v36);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_CPUINowPlayingBackButton;
  id v6 = a3;
  [(_CPUINowPlayingBackButton *)&v9 touchesEnded:v6 withEvent:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __CPUITouchesContainsTouchType_block_invoke_0;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  v7 = [v6 objectsPassingTest:v10];

  uint64_t v8 = [v7 count];
  if (v8)
  {
    if ([(_CPUINowPlayingBackButton *)self isFocused]) {
      [(_CPUINowPlayingBackButton *)self sendActionsForControlEvents:64];
    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  [(_CPUINowPlayingBackButton *)&v13 pressesBegan:v6 withEvent:a4];
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

          [(_CPUINowPlayingBackButton *)self setHighlighted:1];
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
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  [(_CPUINowPlayingBackButton *)&v13 pressesEnded:v6 withEvent:a4];
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

          [(_CPUINowPlayingBackButton *)self setHighlighted:0];
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

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CPUINowPlayingBackButton;
  [(_CPUINowPlayingBackButton *)&v13 pressesCancelled:v6 withEvent:a4];
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

          [(_CPUINowPlayingBackButton *)self setHighlighted:0];
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

- (CPUIFocusRingView)focusRing
{
  return self->_focusRing;
}

- (void)setFocusRing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end