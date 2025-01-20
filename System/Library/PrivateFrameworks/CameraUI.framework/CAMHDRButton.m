@interface CAMHDRButton
- (BOOL)allowsAutomaticHDR;
- (BOOL)allowsHDROn;
- (BOOL)shouldAllowExpansion;
- (CAMHDRButton)initWithFrame:(CGRect)a3;
- (CAMHDRButton)initWithLayoutStyle:(int64_t)a3;
- (NSArray)_allowedModes;
- (UIImageView)_glyphView;
- (double)padHeaderViewContentInsetLeft;
- (id)_currentGlyphImageForAccessibilityHUD:(BOOL)a3;
- (id)imageForAccessibilityHUD;
- (id)titleForMenuItemAtIndex:(int64_t)a3;
- (int64_t)HDRMode;
- (int64_t)modeForIndex:(int64_t)a3;
- (int64_t)numberOfMenuItems;
- (unint64_t)indexForMode:(int64_t)a3;
- (void)_commonCAMHDRButtonInitialization;
- (void)_setAllowedModes:(id)a3;
- (void)_updateAllowedModes;
- (void)_updateCurrentGlyphImage;
- (void)_updateFromAllowedModesChangeWithCurrentMode:(int64_t)a3 needsReloadData:(BOOL)a4;
- (void)reloadData;
- (void)setAllowsAutomaticHDR:(BOOL)a3;
- (void)setAllowsAutomaticHDR:(BOOL)a3 needsReloadData:(BOOL)a4;
- (void)setAllowsHDROn:(BOOL)a3;
- (void)setHDRMode:(int64_t)a3;
@end

@implementation CAMHDRButton

- (CAMHDRButton)initWithLayoutStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMHDRButton;
  v3 = [(CAMExpandableMenuButton *)&v7 initWithLayoutStyle:a3];
  v4 = v3;
  if (v3)
  {
    [(CAMHDRButton *)v3 _commonCAMHDRButtonInitialization];
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMHDRButtonInitialization
{
  self->_allowsHDROn = 1;
  id v5 = [(CAMHDRButton *)self _currentGlyphImageForAccessibilityHUD:0];
  v3 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
  glyphView = self->__glyphView;
  self->__glyphView = v3;

  [(UIImageView *)self->__glyphView _setAnimatesContents:1];
  [(CAMHDRButton *)self _updateAllowedModes];
}

- (id)_currentGlyphImageForAccessibilityHUD:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMHDRButton *)self HDRMode];
  int v6 = [(CAMExpandableMenuButton *)self isExpanded];
  BOOL v7 = [(CAMExpandableMenuButton *)self wantsSelectedItemToBeVisible];
  int64_t v8 = [(CAMExpandableMenuButton *)self layoutStyle];
  v9 = 0;
  switch(v8)
  {
    case 0:
    case 2:
    case 4:
      v10 = @"CAMHDRButton";
      v11 = @"CAMHDRButtonOff";
      goto LABEL_4;
    case 1:
      v10 = @"CAMHDRButtonPad";
      v11 = @"CAMHDRButtonOffPad";
LABEL_4:
      if (((v5 == 0) & ~v6 & !v7) != 0) {
        v12 = v11;
      }
      else {
        v12 = v10;
      }
      v9 = v12;
      break;
    default:
      break;
  }
  if (v3)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@-AXHUD", v9];

    v9 = (__CFString *)v13;
  }
  if (v9)
  {
    v14 = (void *)MEMORY[0x263F827E8];
    v15 = CAMCameraUIFrameworkBundle();
    v16 = [v14 imageNamed:v9 inBundle:v15];
    v17 = [v16 imageWithRenderingMode:2];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int64_t)HDRMode
{
  int64_t v3 = [(CAMExpandableMenuButton *)self selectedIndex];
  return [(CAMHDRButton *)self modeForIndex:v3];
}

- (int64_t)modeForIndex:(int64_t)a3
{
  v4 = [(CAMHDRButton *)self _allowedModes];
  int64_t v5 = v4;
  if (a3 < 0 || [v4 count] <= (unint64_t)a3)
  {
    int64_t v7 = 0;
  }
  else
  {
    int v6 = [v5 objectAtIndex:a3];
    int64_t v7 = [v6 integerValue];
  }
  return v7;
}

- (NSArray)_allowedModes
{
  return self->__allowedModes;
}

- (void)_updateAllowedModes
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(CAMHDRButton *)self allowsAutomaticHDR]) {
    [v3 addObject:&unk_26BDDE8F8];
  }
  if ([(CAMHDRButton *)self allowsHDROn]) {
    [v3 addObject:&unk_26BDDE910];
  }
  [v3 addObject:&unk_26BDDE928];
  [(CAMHDRButton *)self _setAllowedModes:v3];
}

- (BOOL)allowsAutomaticHDR
{
  return self->_allowsAutomaticHDR;
}

- (BOOL)allowsHDROn
{
  return self->_allowsHDROn;
}

- (void)_setAllowedModes:(id)a3
{
}

- (void)setAllowsAutomaticHDR:(BOOL)a3
{
}

- (void)reloadData
{
  v7.receiver = self;
  v7.super_class = (Class)CAMHDRButton;
  [(CAMExpandableMenuButton *)&v7 reloadData];
  [(CAMHDRButton *)self _updateCurrentGlyphImage];
  if ([(CAMHDRButton *)self numberOfMenuItems] >= 1)
  {
    int64_t v3 = 0;
    do
    {
      int64_t v4 = [(CAMHDRButton *)self modeForIndex:v3];
      BOOL v5 = [(CAMHDRButton *)self allowsAutomaticHDR];
      BOOL v6 = v4 == 1 && v5;
      [(CAMExpandableMenuButton *)self setHighlighted:v6 forIndex:v3++];
    }
    while (v3 < [(CAMHDRButton *)self numberOfMenuItems]);
  }
}

- (int64_t)numberOfMenuItems
{
  v2 = [(CAMHDRButton *)self _allowedModes];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  int64_t v3 = [(CAMHDRButton *)self modeForIndex:a3];
  switch(v3)
  {
    case 0:
      int64_t v4 = @"HDR_OFF";
      BOOL v5 = @"A label for turning HDR mode off.";
      goto LABEL_7;
    case 1:
      int64_t v4 = @"HDR_ON";
      BOOL v5 = @"A label for turning HDR mode on.";
      goto LABEL_7;
    case 2:
      int64_t v4 = @"HDR_AUTO";
      BOOL v5 = @"A label for selecting an automatic HDR mode.";
LABEL_7:
      BOOL v6 = CAMLocalizedFrameworkString(v4, v5);
      goto LABEL_9;
  }
  BOOL v6 = 0;
LABEL_9:
  return v6;
}

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void)_updateCurrentGlyphImage
{
  id v4 = [(CAMHDRButton *)self _currentGlyphImageForAccessibilityHUD:0];
  int64_t v3 = [(CAMHDRButton *)self _glyphView];
  [v3 setImage:v4];
}

- (void)setHDRMode:(int64_t)a3
{
  unint64_t v4 = [(CAMHDRButton *)self indexForMode:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = [(CAMHDRButton *)self indexForMode:0];
  }
  [(CAMExpandableMenuButton *)self setSelectedIndex:v4];
  [(CAMHDRButton *)self _updateCurrentGlyphImage];
}

- (unint64_t)indexForMode:(int64_t)a3
{
  unint64_t v4 = [(CAMHDRButton *)self _allowedModes];
  if ([v4 count])
  {
    BOOL v5 = [NSNumber numberWithInteger:a3];
    unint64_t v6 = [v4 indexOfObject:v5];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)setAllowsHDROn:(BOOL)a3
{
  if (self->_allowsHDROn != a3)
  {
    int64_t v5 = [(CAMHDRButton *)self HDRMode];
    self->_allowsHDROn = a3;
    [(CAMHDRButton *)self _updateFromAllowedModesChangeWithCurrentMode:v5 needsReloadData:1];
  }
}

- (CAMHDRButton)initWithFrame:(CGRect)a3
{
  unint64_t v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMHDRButton *)self initWithLayoutStyle:v5];
}

- (void)setAllowsAutomaticHDR:(BOOL)a3 needsReloadData:(BOOL)a4
{
  if (self->_allowsAutomaticHDR != a3)
  {
    BOOL v4 = a4;
    int64_t v7 = [(CAMHDRButton *)self HDRMode];
    self->_allowsAutomaticHDR = a3;
    [(CAMHDRButton *)self _updateFromAllowedModesChangeWithCurrentMode:v7 needsReloadData:v4];
  }
}

- (void)_updateFromAllowedModesChangeWithCurrentMode:(int64_t)a3 needsReloadData:(BOOL)a4
{
  BOOL v4 = a4;
  [(CAMHDRButton *)self _updateAllowedModes];
  if (v4) {
    [(CAMHDRButton *)self reloadData];
  }
  [(CAMHDRButton *)self setHDRMode:a3];
}

- (double)padHeaderViewContentInsetLeft
{
  return 7.0;
}

- (BOOL)shouldAllowExpansion
{
  v5.receiver = self;
  v5.super_class = (Class)CAMHDRButton;
  unsigned __int8 v3 = [(CAMExpandableMenuButton *)&v5 shouldAllowExpansion];
  return ![(CAMHDRButton *)self allowsHDROn] | v3;
}

- (id)imageForAccessibilityHUD
{
  return [(CAMHDRButton *)self _currentGlyphImageForAccessibilityHUD:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allowedModes, 0);
  objc_storeStrong((id *)&self->__glyphView, 0);
}

@end