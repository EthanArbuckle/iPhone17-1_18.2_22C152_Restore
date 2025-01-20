@interface CNUIToolbar
+ (double)defaultToolBarHeight;
- (BOOL)isAnimating;
- (BOOL)isEnabledForItem:(id)a3;
- (CNUIToolbar)initWithItems:(id)a3;
- (NSArray)buttons;
- (NSArray)items;
- (UIView)border;
- (UIVisualEffectView)visualEffectView;
- (double)borderWidth;
- (id)buttonForItem:(id)a3;
- (void)buttonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setBorder:(id)a3;
- (void)setButtons:(id)a3;
- (void)setEnabled:(BOOL)a3 forItem:(id)a4;
- (void)setIsAnimating:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
- (void)setupBorder;
- (void)setupView;
@end

@implementation CNUIToolbar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_border, 0);
  objc_storeStrong((id *)&self->_buttons, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setBorder:(id)a3
{
}

- (UIView)border
{
  return self->_border;
}

- (void)setButtons:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIToolbar *)self buttons];
  uint64_t v6 = [v5 indexOfObject:v4];

  v7 = [(CNUIToolbar *)self items];
  id v9 = [v7 objectAtIndexedSubscript:v6];

  v8 = [v9 actionBlock];
  ((void (**)(void, id))v8)[2](v8, v9);
}

- (void)setEnabled:(BOOL)a3 forItem:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CNUIToolbar *)self items];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(CNUIToolbar *)self buttons];
    id v11 = [v9 objectAtIndexedSubscript:v8];

    [v11 setEnabled:v4];
    double v10 = 0.7;
    if (v4) {
      double v10 = 1.0;
    }
    [v11 setAlpha:v10];
  }
}

- (BOOL)isEnabledForItem:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIToolbar *)self items];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v8 = [(CNUIToolbar *)self buttons];
  id v9 = [v8 objectAtIndexedSubscript:v6];

  LOBYTE(v8) = [v9 isEnabled];
  return (char)v8;
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    BOOL v3 = a3;
    self->_isAnimating = a3;
    v5 = [(CNUIToolbar *)self visualEffectView];
    [v5 setHidden:v3];

    if (v3) {
      [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    }
    else {
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    }
    [(CNUIToolbar *)self setBackgroundColor:v6];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CNUIToolbar;
  [(CNUIToolbar *)&v8 layoutSubviews];
  [(CNUIToolbar *)self bounds];
  double v4 = v3;
  [(CNUIToolbar *)self borderWidth];
  double v6 = v5;
  v7 = [(CNUIToolbar *)self border];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);
}

- (double)borderWidth
{
  v2 = [(CNUIToolbar *)self _screen];
  [v2 scale];
  if (v3 == 0.0)
  {
    if (RoundToScale_onceToken != -1) {
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
    }
    double v3 = *(double *)&RoundToScale___s;
  }
  double v4 = 1.0;
  if (v3 != 1.0) {
    double v4 = round(v3) / v3;
  }

  return v4;
}

- (void)setupView
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v19 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v19];
  [(CNUIToolbar *)self bounds];
  objc_msgSend(v18, "setFrame:");
  [v18 setAutoresizingMask:18];
  [(CNUIToolbar *)self addSubview:v18];
  [(CNUIToolbar *)self setVisualEffectView:v18];
  double v3 = (objc_class *)MEMORY[0x1E4FB1C60];
  double v4 = self;
  id v5 = [v3 alloc];
  double v6 = [(CNUIToolbar *)v4 buttons];
  v7 = (void *)[v5 initWithArrangedSubviews:v6];

  [v7 setAlignment:3];
  [v7 setDistribution:4];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setSpacing:8.0];
  [(CNUIToolbar *)v4 addSubview:v7];
  v17 = [v7 topAnchor];
  v16 = [(CNUIToolbar *)v4 topAnchor];
  objc_super v8 = [v17 constraintEqualToAnchor:v16];
  v20[0] = v8;
  id v9 = [v7 bottomAnchor];
  double v10 = [(CNUIToolbar *)v4 bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v20[1] = v11;
  v12 = [v7 trailingAnchor];
  v13 = [(CNUIToolbar *)v4 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:-20.0];
  v20[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [(CNUIToolbar *)v4 addConstraints:v15];
}

- (void)setupBorder
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(CNUIToolbar *)self bounds];
  double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
  border = self->_border;
  self->_border = v4;

  double v6 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  [(UIView *)self->_border setBackgroundColor:v6];

  [(UIView *)self->_border setAutoresizingMask:34];
  v7 = self->_border;

  [(CNUIToolbar *)self addSubview:v7];
}

- (id)buttonForItem:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB14D0] buttonWithType:127];
  if ([v4 isDefault])
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (![v4 isCancel]) {
      goto LABEL_6;
    }
    uint64_t v6 = 2;
  }
  [v5 setRole:v6];
LABEL_6:
  v7 = [v4 title];
  [v5 setTitle:v7 forState:0];

  [v5 addTarget:self action:sel_buttonPressed_ forControlEvents:64];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v8 = [v5 widthAnchor];
  id v9 = [v8 constraintGreaterThanOrEqualToConstant:90.0];
  [v9 setActive:1];

  return v5;
}

- (CNUIToolbar)initWithItems:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUIToolbar;
  uint64_t v6 = -[CNUIToolbar initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_items, a3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __29__CNUIToolbar_initWithItems___block_invoke;
    v12[3] = &unk_1E54971B8;
    objc_super v8 = v7;
    v13 = v8;
    uint64_t v9 = objc_msgSend(v5, "_cn_map:", v12);
    buttons = v8->_buttons;
    v8->_buttons = (NSArray *)v9;

    [(CNUIToolbar *)v8 setupView];
    [(CNUIToolbar *)v8 setupBorder];
  }
  return v7;
}

uint64_t __29__CNUIToolbar_initWithItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) buttonForItem:a2];
}

+ (double)defaultToolBarHeight
{
  return 60.0;
}

@end