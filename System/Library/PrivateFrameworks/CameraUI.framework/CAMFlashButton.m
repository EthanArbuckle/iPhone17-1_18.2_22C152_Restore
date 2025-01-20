@interface CAMFlashButton
- (BOOL)allowsAutomaticFlash;
- (BOOL)isUnavailable;
- (BOOL)shouldIgnoreMenuInteraction;
- (BOOL)wantsSelectedItemToBeVisible;
- (CAMFlashButton)initWithFrame:(CGRect)a3;
- (CAMFlashButton)initWithLayoutStyle:(int64_t)a3;
- (UIImageView)_glyphView;
- (UIImageView)_warningIndicatorView;
- (double)collapsedSelectedLabelHorizontalMargin;
- (double)padHeaderViewContentInsetLeft;
- (id)_currentGlyphImageForAccessibilityHUD:(BOOL)a3;
- (id)headerView;
- (id)imageForAccessibilityHUD;
- (id)titleForMenuItemAtIndex:(int64_t)a3;
- (int64_t)flashMode;
- (int64_t)indexForMode:(int64_t)a3;
- (int64_t)modeForIndex:(int64_t)a3;
- (int64_t)numberOfMenuItems;
- (void)_commonCAMFlashButtonInitialization;
- (void)_updateCurrentGlyphImage;
- (void)reloadData;
- (void)setAllowsAutomaticFlash:(BOOL)a3;
- (void)setAllowsAutomaticFlash:(BOOL)a3 needsReloadData:(BOOL)a4;
- (void)setFlashMode:(int64_t)a3;
- (void)setUnavailable:(BOOL)a3;
@end

@implementation CAMFlashButton

- (CAMFlashButton)initWithLayoutStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFlashButton;
  v3 = [(CAMExpandableMenuButton *)&v7 initWithLayoutStyle:a3];
  v4 = v3;
  if (v3)
  {
    [(CAMFlashButton *)v3 _commonCAMFlashButtonInitialization];
    v5 = v4;
  }

  return v4;
}

- (BOOL)wantsSelectedItemToBeVisible
{
  if ([(CAMFlashButton *)self isUnavailable]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMFlashButton;
  return [(CAMExpandableMenuButton *)&v4 wantsSelectedItemToBeVisible];
}

- (BOOL)isUnavailable
{
  return self->_unavailable;
}

- (void)_commonCAMFlashButtonInitialization
{
  id v5 = [(CAMFlashButton *)self _currentGlyphImageForAccessibilityHUD:0];
  v3 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
  glyphView = self->__glyphView;
  self->__glyphView = v3;

  [(UIImageView *)self->__glyphView _setAnimatesContents:1];
}

- (id)_currentGlyphImageForAccessibilityHUD:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMFlashButton *)self modeForIndex:[(CAMExpandableMenuButton *)self selectedIndex]];
  int v6 = [(CAMExpandableMenuButton *)self isExpanded];
  int v7 = (v5 == 0) & ~v6 & ![(CAMFlashButton *)self wantsSelectedItemToBeVisible];
  switch([(CAMExpandableMenuButton *)self layoutStyle])
  {
    case 0:
    case 2:
    case 4:
      v8 = @"CAMFlashButton";
      v9 = @"CAMFlashButtonOff";
      goto LABEL_4;
    case 1:
      v8 = @"CAMFlashButtonPad";
      v9 = @"CAMFlashButtonOffPad";
LABEL_4:
      if (v7) {
        v8 = v9;
      }
      v10 = v8;
      if (v3) {
        goto LABEL_9;
      }
      v11 = (void *)MEMORY[0x263F827E8];
      v12 = CAMCameraUIFrameworkBundle();
      v13 = [v11 imageNamed:v10 inBundle:v12];
      v14 = [v13 imageWithRenderingMode:2];

      break;
    default:
      v10 = 0;
      v14 = 0;
      if (v3)
      {
LABEL_9:
        v15 = @"bolt.fill";
        if (v7) {
          v15 = @"bolt.slash.fill";
        }
        v16 = v15;

        v14 = [MEMORY[0x263F827E8] systemImageNamed:v16];
        v10 = v16;
      }
      break;
  }

  return v14;
}

- (int64_t)modeForIndex:(int64_t)a3
{
  LODWORD(result) = [(CAMFlashButton *)self allowsAutomaticFlash];
  int64_t v5 = 1;
  if (result) {
    int64_t v5 = 2;
  }
  if (a3 == 2) {
    int64_t v5 = 0;
  }
  if (a3 == 1) {
    return result;
  }
  else {
    return v5;
  }
}

- (BOOL)allowsAutomaticFlash
{
  return self->_allowsAutomaticFlash;
}

- (void)setAllowsAutomaticFlash:(BOOL)a3
{
}

- (int64_t)indexForMode:(int64_t)a3
{
  if (a3) {
    int64_t v4 = a3 == 1;
  }
  else {
    int64_t v4 = 2;
  }
  BOOL v5 = [(CAMFlashButton *)self allowsAutomaticFlash];
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v4;
  }
  int64_t v8 = v7 - 1;
  if (a3 != 2) {
    int64_t v6 = v8;
  }
  if (v5) {
    return v4;
  }
  else {
    return v6;
  }
}

- (void)reloadData
{
  v4.receiver = self;
  v4.super_class = (Class)CAMFlashButton;
  [(CAMExpandableMenuButton *)&v4 reloadData];
  [(CAMFlashButton *)self _updateCurrentGlyphImage];
  if ([(CAMFlashButton *)self numberOfMenuItems] >= 1)
  {
    int64_t v3 = 0;
    do
    {
      [(CAMExpandableMenuButton *)self setHighlighted:[(CAMFlashButton *)self modeForIndex:v3] == 1 forIndex:v3];
      ++v3;
    }
    while (v3 < [(CAMFlashButton *)self numberOfMenuItems]);
  }
}

- (int64_t)numberOfMenuItems
{
  if ([(CAMFlashButton *)self isUnavailable]) {
    return 0;
  }
  if ([(CAMFlashButton *)self allowsAutomaticFlash]) {
    return 3;
  }
  return 2;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  int64_t v3 = [(CAMFlashButton *)self modeForIndex:a3];
  switch(v3)
  {
    case 0:
      objc_super v4 = @"HDR_OFF";
      BOOL v5 = @"A label for turning HDR mode off.";
      goto LABEL_7;
    case 1:
      objc_super v4 = @"HDR_ON";
      BOOL v5 = @"A label for turning HDR mode on.";
      goto LABEL_7;
    case 2:
      objc_super v4 = @"HDR_AUTO";
      BOOL v5 = @"A label for selecting an automatic HDR mode.";
LABEL_7:
      int64_t v6 = CAMLocalizedFrameworkString(v4, v5);
      goto LABEL_9;
  }
  int64_t v6 = 0;
LABEL_9:
  return v6;
}

- (id)headerView
{
  if ([(CAMFlashButton *)self isUnavailable]) {
    [(CAMFlashButton *)self _warningIndicatorView];
  }
  else {
  int64_t v3 = [(CAMFlashButton *)self _glyphView];
  }
  return v3;
}

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void)_updateCurrentGlyphImage
{
  id v4 = [(CAMFlashButton *)self _currentGlyphImageForAccessibilityHUD:0];
  int64_t v3 = [(CAMFlashButton *)self _glyphView];
  [v3 setImage:v4];
}

- (void)setFlashMode:(int64_t)a3
{
  [(CAMExpandableMenuButton *)self setSelectedIndex:[(CAMFlashButton *)self indexForMode:a3]];
  [(CAMFlashButton *)self _updateCurrentGlyphImage];
}

- (void)setUnavailable:(BOOL)a3
{
  if (self->_unavailable != a3)
  {
    self->_unavailable = a3;
    if (a3 && !self->__warningIndicatorView)
    {
      id v4 = (void *)MEMORY[0x263F827E8];
      BOOL v5 = CAMCameraUIFrameworkBundle();
      int64_t v6 = [v4 imageNamed:@"CAMFlashDisabled_2only_" inBundle:v5];
      uint64_t v7 = [v6 imageWithRenderingMode:2];

      int64_t v8 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v7];
      warningIndicatorView = self->__warningIndicatorView;
      self->__warningIndicatorView = v8;

      v10 = self->__warningIndicatorView;
      v11 = [MEMORY[0x263F825C8] systemYellowColor];
      [(UIImageView *)v10 setTintColor:v11];
    }
    [(CAMFlashButton *)self reloadData];
  }
}

- (CAMFlashButton)initWithFrame:(CGRect)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMFlashButton *)self initWithLayoutStyle:v5];
}

- (int64_t)flashMode
{
  int64_t v3 = [(CAMExpandableMenuButton *)self selectedIndex];
  return [(CAMFlashButton *)self modeForIndex:v3];
}

- (void)setAllowsAutomaticFlash:(BOOL)a3 needsReloadData:(BOOL)a4
{
  if (self->_allowsAutomaticFlash != a3)
  {
    BOOL v4 = a4;
    int64_t v7 = [(CAMFlashButton *)self modeForIndex:[(CAMExpandableMenuButton *)self selectedIndex]];
    self->_allowsAutomaticFlash = a3;
    int64_t v8 = [(CAMFlashButton *)self indexForMode:v7];
    if (v4) {
      [(CAMFlashButton *)self reloadData];
    }
    [(CAMExpandableMenuButton *)self setSelectedIndex:v8];
    [(CAMFlashButton *)self _updateCurrentGlyphImage];
  }
}

- (double)padHeaderViewContentInsetLeft
{
  return 14.0;
}

- (BOOL)shouldIgnoreMenuInteraction
{
  if ([(CAMFlashButton *)self isUnavailable]) {
    [(CAMFlashButton *)self sendActionsForControlEvents:0x1000000];
  }
  return [(CAMFlashButton *)self isUnavailable];
}

- (double)collapsedSelectedLabelHorizontalMargin
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFlashButton;
  [(CAMExpandableMenuButton *)&v6 collapsedSelectedLabelHorizontalMargin];
  double v4 = v3;
  if ([(CAMFlashButton *)self wantsSelectedItemToBeVisible])
  {
    double v4 = v4 + -5.0;
    if (v4 < 0.0) {
      return 0.0;
    }
  }
  return v4;
}

- (id)imageForAccessibilityHUD
{
  if ([(CAMFlashButton *)self isUnavailable]) {
    [MEMORY[0x263F827E8] systemImageNamed:@"bolt.trianglebadge.exclamationmark.fill"];
  }
  else {
  double v3 = [(CAMFlashButton *)self _currentGlyphImageForAccessibilityHUD:1];
  }
  return v3;
}

- (UIImageView)_warningIndicatorView
{
  return self->__warningIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__warningIndicatorView, 0);
  objc_storeStrong((id *)&self->__glyphView, 0);
}

@end