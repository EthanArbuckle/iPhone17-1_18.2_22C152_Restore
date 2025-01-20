@interface ASVBlurredBackgroundView
+ (id)disabledEffectsForARStyle;
+ (id)disabledEffectsForStudioStyle;
+ (id)disabledSelectedEffects;
+ (id)highlightedEffectsForARStyle;
+ (id)highlightedEffectsForStudioStyle;
+ (id)normalEffectsForARDarkStyle;
+ (id)normalEffectsForARStyle;
+ (id)normalEffectsForDarkModeStyle;
+ (id)normalEffectsForStudioStyle;
+ (id)selectedEffects;
+ (id)selectedEffectsForARDarkStyle;
+ (id)selectedEffectsForDarkModeStyle;
- (ASVBlurredBackgroundView)initWithFrame:(CGRect)a3 backgroundStyle:(int64_t)a4 controlStyle:(int64_t)a5;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (int64_t)backgroundStyle;
- (int64_t)controlStyle;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setControlStyle:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateBackgroundEffects;
@end

@implementation ASVBlurredBackgroundView

- (ASVBlurredBackgroundView)initWithFrame:(CGRect)a3 backgroundStyle:(int64_t)a4 controlStyle:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)ASVBlurredBackgroundView;
  v7 = -[ASVBlurredBackgroundView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_enabled = 1;
    v7->_selected = 0;
    v7->_highlighted = 0;
    v7->_backgroundStyle = a4;
    v7->_controlStyle = a5;
    [(ASVBlurredBackgroundView *)v7 updateBackgroundEffects];
  }
  return v8;
}

- (void)updateBackgroundEffects
{
  if ([(ASVBlurredBackgroundView *)self controlStyle] == 2)
  {
    if ([(ASVBlurredBackgroundView *)self isHighlighted]
      || [(ASVBlurredBackgroundView *)self isSelected])
    {
      uint64_t v3 = [(id)objc_opt_class() selectedEffectsForARDarkStyle];
    }
    else
    {
      uint64_t v3 = [(id)objc_opt_class() normalEffectsForARDarkStyle];
    }
  }
  else if ([(ASVBlurredBackgroundView *)self controlStyle] == 3)
  {
    if ([(ASVBlurredBackgroundView *)self isHighlighted]
      || [(ASVBlurredBackgroundView *)self isSelected])
    {
      uint64_t v3 = [(id)objc_opt_class() selectedEffectsForDarkModeStyle];
    }
    else
    {
      uint64_t v3 = [(id)objc_opt_class() normalEffectsForDarkModeStyle];
    }
  }
  else
  {
    if ([(ASVBlurredBackgroundView *)self isSelected]
      || [(ASVBlurredBackgroundView *)self backgroundStyle] == 1)
    {
      BOOL v4 = [(ASVBlurredBackgroundView *)self isEnabled];
      v5 = objc_opt_class();
      if (v4) {
        [v5 selectedEffects];
      }
      else {
        [v5 disabledSelectedEffects];
      }
    }
    else if ([(ASVBlurredBackgroundView *)self isEnabled])
    {
      BOOL v6 = [(ASVBlurredBackgroundView *)self isHighlighted];
      int64_t v7 = [(ASVBlurredBackgroundView *)self controlStyle];
      v8 = objc_opt_class();
      if (v6)
      {
        if (v7) {
          [v8 highlightedEffectsForARStyle];
        }
        else {
          [v8 highlightedEffectsForStudioStyle];
        }
      }
      else if (v7)
      {
        [v8 normalEffectsForARStyle];
      }
      else
      {
        [v8 normalEffectsForStudioStyle];
      }
    }
    else
    {
      int64_t v9 = [(ASVBlurredBackgroundView *)self controlStyle];
      objc_super v10 = objc_opt_class();
      if (v9) {
        [v10 disabledEffectsForARStyle];
      }
      else {
        [v10 disabledEffectsForStudioStyle];
      }
    uint64_t v3 = };
  }
  id v11 = (id)v3;
  [(ASVBlurredBackgroundView *)self setBackgroundEffects:v3];
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

+ (id)normalEffectsForARStyle
{
  if (normalEffectsForARStyle_onceToken != -1) {
    dispatch_once(&normalEffectsForARStyle_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)normalEffectsForARStyle_normalEffectsForARStyle;
  return v2;
}

+ (id)disabledEffectsForARStyle
{
  if (disabledEffectsForARStyle_onceToken != -1) {
    dispatch_once(&disabledEffectsForARStyle_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)disabledEffectsForARStyle_disabledEffectsForARStyle;
  return v2;
}

void __53__ASVBlurredBackgroundView_disabledEffectsForARStyle__block_invoke()
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.375];
  v12[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EF8];
  BOOL v4 = [MEMORY[0x1E4FB1618] blackColor];
  v5 = [v3 effectCompositingColor:v4 withMode:1010 alpha:0.26];
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4FB14C8];
  int64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v8 = objc_msgSend(v6, "effectWithBlurRadius:");
  v12[2] = v8;
  int64_t v9 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v11 = (void *)disabledEffectsForARStyle_disabledEffectsForARStyle;
  disabledEffectsForARStyle_disabledEffectsForARStyle = v10;
}

+ (id)disabledEffectsForStudioStyle
{
  if (disabledEffectsForStudioStyle_onceToken != -1) {
    dispatch_once(&disabledEffectsForStudioStyle_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)disabledEffectsForStudioStyle_disabledEffectsForStudioStyle;
  return v2;
}

void __57__ASVBlurredBackgroundView_disabledEffectsForStudioStyle__block_invoke()
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.425];
  v12[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EF8];
  BOOL v4 = [MEMORY[0x1E4FB1618] blackColor];
  v5 = [v3 effectCompositingColor:v4 withMode:1010 alpha:0.27];
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4FB14C8];
  int64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v8 = objc_msgSend(v6, "effectWithBlurRadius:");
  v12[2] = v8;
  int64_t v9 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v11 = (void *)disabledEffectsForStudioStyle_disabledEffectsForStudioStyle;
  disabledEffectsForStudioStyle_disabledEffectsForStudioStyle = v10;
}

void __51__ASVBlurredBackgroundView_normalEffectsForARStyle__block_invoke()
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.75];
  v12[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EF8];
  BOOL v4 = [MEMORY[0x1E4FB1618] blackColor];
  v5 = [v3 effectCompositingColor:v4 withMode:1010 alpha:0.26];
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4FB14C8];
  int64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v8 = objc_msgSend(v6, "effectWithBlurRadius:");
  v12[2] = v8;
  int64_t v9 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v11 = (void *)normalEffectsForARStyle_normalEffectsForARStyle;
  normalEffectsForARStyle_normalEffectsForARStyle = v10;
}

+ (id)normalEffectsForStudioStyle
{
  if (normalEffectsForStudioStyle_onceToken != -1) {
    dispatch_once(&normalEffectsForStudioStyle_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)normalEffectsForStudioStyle_normalEffectsForStudioStyle;
  return v2;
}

void __55__ASVBlurredBackgroundView_normalEffectsForStudioStyle__block_invoke()
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.85];
  v12[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EF8];
  BOOL v4 = [MEMORY[0x1E4FB1618] blackColor];
  v5 = [v3 effectCompositingColor:v4 withMode:1010 alpha:0.27];
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4FB14C8];
  int64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v8 = objc_msgSend(v6, "effectWithBlurRadius:");
  v12[2] = v8;
  int64_t v9 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v11 = (void *)normalEffectsForStudioStyle_normalEffectsForStudioStyle;
  normalEffectsForStudioStyle_normalEffectsForStudioStyle = v10;
}

+ (id)highlightedEffectsForARStyle
{
  if (highlightedEffectsForARStyle_onceToken != -1) {
    dispatch_once(&highlightedEffectsForARStyle_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)highlightedEffectsForARStyle_highlightedEffectsForARStyle;
  return v2;
}

void __56__ASVBlurredBackgroundView_highlightedEffectsForARStyle__block_invoke()
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.8];
  v12[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EF8];
  BOOL v4 = [MEMORY[0x1E4FB1618] blackColor];
  v5 = [v3 effectCompositingColor:v4 withMode:1010 alpha:0.15];
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4FB14C8];
  int64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v8 = objc_msgSend(v6, "effectWithBlurRadius:");
  v12[2] = v8;
  int64_t v9 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v11 = (void *)highlightedEffectsForARStyle_highlightedEffectsForARStyle;
  highlightedEffectsForARStyle_highlightedEffectsForARStyle = v10;
}

+ (id)highlightedEffectsForStudioStyle
{
  if (highlightedEffectsForStudioStyle_onceToken != -1) {
    dispatch_once(&highlightedEffectsForStudioStyle_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)highlightedEffectsForStudioStyle_highlightedEffectsForStudioStyle;
  return v2;
}

void __60__ASVBlurredBackgroundView_highlightedEffectsForStudioStyle__block_invoke()
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.85];
  v12[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EF8];
  BOOL v4 = [MEMORY[0x1E4FB1618] blackColor];
  v5 = [v3 effectCompositingColor:v4 withMode:1010 alpha:0.23];
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4FB14C8];
  int64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v8 = objc_msgSend(v6, "effectWithBlurRadius:");
  v12[2] = v8;
  int64_t v9 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v11 = (void *)highlightedEffectsForStudioStyle_highlightedEffectsForStudioStyle;
  highlightedEffectsForStudioStyle_highlightedEffectsForStudioStyle = v10;
}

+ (id)disabledSelectedEffects
{
  if (disabledSelectedEffects_onceToken != -1) {
    dispatch_once(&disabledSelectedEffects_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)disabledSelectedEffects_disabledSelectedEffects;
  return v2;
}

void __51__ASVBlurredBackgroundView_disabledSelectedEffects__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.5];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  BOOL v4 = (void *)disabledSelectedEffects_disabledSelectedEffects;
  disabledSelectedEffects_disabledSelectedEffects = v3;
}

+ (id)selectedEffects
{
  if (selectedEffects_onceToken != -1) {
    dispatch_once(&selectedEffects_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)selectedEffects_selectedEffects;
  return v2;
}

void __43__ASVBlurredBackgroundView_selectedEffects__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:1.0];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  BOOL v4 = (void *)selectedEffects_selectedEffects;
  selectedEffects_selectedEffects = v3;
}

+ (id)normalEffectsForARDarkStyle
{
  if (normalEffectsForARDarkStyle_onceToken != -1) {
    dispatch_once(&normalEffectsForARDarkStyle_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)normalEffectsForARDarkStyle_normalEffectsForARDarkStyle;
  return v2;
}

void __55__ASVBlurredBackgroundView_normalEffectsForARDarkStyle__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.15];
  uint64_t v3 = (void *)MEMORY[0x1E4FB14C8];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v2);
  UIRoundToScreenScale();
  v5 = objc_msgSend(v3, "effectWithBlurRadius:");
  v9[1] = v5;
  BOOL v6 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v9[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v8 = (void *)normalEffectsForARDarkStyle_normalEffectsForARDarkStyle;
  normalEffectsForARDarkStyle_normalEffectsForARDarkStyle = v7;
}

+ (id)selectedEffectsForARDarkStyle
{
  if (selectedEffectsForARDarkStyle_onceToken != -1) {
    dispatch_once(&selectedEffectsForARDarkStyle_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)selectedEffectsForARDarkStyle_selectedEffectsForARDarkStyle;
  return v2;
}

void __57__ASVBlurredBackgroundView_selectedEffectsForARDarkStyle__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  v2 = [v0 effectCompositingColor:v1 withMode:24 alpha:0.3];
  uint64_t v3 = (void *)MEMORY[0x1E4FB14C8];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v2);
  UIRoundToScreenScale();
  v5 = objc_msgSend(v3, "effectWithBlurRadius:");
  v9[1] = v5;
  BOOL v6 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.5];
  v9[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v8 = (void *)selectedEffectsForARDarkStyle_selectedEffectsForARDarkStyle;
  selectedEffectsForARDarkStyle_selectedEffectsForARDarkStyle = v7;
}

+ (id)normalEffectsForDarkModeStyle
{
  if (normalEffectsForDarkModeStyle_onceToken != -1) {
    dispatch_once(&normalEffectsForDarkModeStyle_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)normalEffectsForDarkModeStyle_normalEffectsForDarkModeStyle;
  return v2;
}

void __57__ASVBlurredBackgroundView_normalEffectsForDarkModeStyle__block_invoke()
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] blackColor];
  v2 = [v0 effectCompositingColor:v1 withMode:0 alpha:0.55];
  v12[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EF8];
  BOOL v4 = [MEMORY[0x1E4FB1618] whiteColor];
  v5 = [v3 effectCompositingColor:v4 withMode:0 alpha:0.14];
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4FB14C8];
  uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v8 = objc_msgSend(v6, "effectWithBlurRadius:");
  v12[2] = v8;
  int64_t v9 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.8];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v11 = (void *)normalEffectsForDarkModeStyle_normalEffectsForDarkModeStyle;
  normalEffectsForDarkModeStyle_normalEffectsForDarkModeStyle = v10;
}

+ (id)selectedEffectsForDarkModeStyle
{
  if (selectedEffectsForDarkModeStyle_onceToken != -1) {
    dispatch_once(&selectedEffectsForDarkModeStyle_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)selectedEffectsForDarkModeStyle_selectedEffectsForDarkModeStyle;
  return v2;
}

void __59__ASVBlurredBackgroundView_selectedEffectsForDarkModeStyle__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1EF8];
  v1 = [MEMORY[0x1E4FB1618] blackColor];
  v2 = [v0 effectCompositingColor:v1 withMode:23 alpha:0.6];
  v8[0] = v2;
  uint64_t v3 = (void *)MEMORY[0x1E4FB14C8];
  BOOL v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  UIRoundToScreenScale();
  v5 = objc_msgSend(v3, "effectWithBlurRadius:");
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v7 = (void *)selectedEffectsForDarkModeStyle_selectedEffectsForDarkModeStyle;
  selectedEffectsForDarkModeStyle_selectedEffectsForDarkModeStyle = v6;
}

- (void)setControlStyle:(int64_t)a3
{
  if (self->_controlStyle != a3)
  {
    self->_controlStyle = a3;
    [(ASVBlurredBackgroundView *)self updateBackgroundEffects];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(ASVBlurredBackgroundView *)self updateBackgroundEffects];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(ASVBlurredBackgroundView *)self updateBackgroundEffects];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(ASVBlurredBackgroundView *)self updateBackgroundEffects];
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

@end