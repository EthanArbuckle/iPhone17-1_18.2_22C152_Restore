@interface CAMTimerButton
- (BOOL)hideOffWhenCollapsed;
- (CAMTimerButton)initWithFrame:(CGRect)a3;
- (CAMTimerButton)initWithLayoutStyle:(int64_t)a3;
- (CAMTimerButtonDelegate)delegate;
- (UIImageView)_glyphView;
- (double)padHeaderViewContentInsetLeft;
- (id)_currentGlyphImageForAccessibiliyHUD:(BOOL)a3;
- (id)imageForAccessibilityHUD;
- (id)shownIndexesWhileCollapsed;
- (id)titleForMenuItemAtIndex:(int64_t)a3;
- (int64_t)numberOfMenuItems;
- (void)_commonCAMTimerButtonInitialization;
- (void)_updateCurrentGlyphImage;
- (void)reloadData;
- (void)setDelegate:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setDuration:(int64_t)a3 animated:(BOOL)a4;
- (void)setHideOffWhenCollapsed:(BOOL)a3;
- (void)setHideOffWhenCollapsed:(BOOL)a3 needsReloadData:(BOOL)a4;
@end

@implementation CAMTimerButton

- (CAMTimerButton)initWithLayoutStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMTimerButton;
  v3 = [(CAMExpandableMenuButton *)&v7 initWithLayoutStyle:a3];
  v4 = v3;
  if (v3)
  {
    [(CAMTimerButton *)v3 _commonCAMTimerButtonInitialization];
    v5 = v4;
  }

  return v4;
}

- (id)shownIndexesWhileCollapsed
{
  id v3 = objc_alloc_init(MEMORY[0x263F089C8]);
  if (![(CAMTimerButton *)self hideOffWhenCollapsed]) {
    [v3 addIndex:0];
  }
  [v3 addIndex:1];
  [v3 addIndex:2];
  [v3 addIndex:3];
  return v3;
}

- (BOOL)hideOffWhenCollapsed
{
  return self->_hideOffWhenCollapsed;
}

- (void)_commonCAMTimerButtonInitialization
{
  id v5 = [(CAMTimerButton *)self _currentGlyphImageForAccessibiliyHUD:0];
  id v3 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
  glyphView = self->__glyphView;
  self->__glyphView = v3;

  [(CAMTimerButton *)self setDuration:0];
  [(CAMExpandableMenuButton *)self setHighlighted:1 forIndex:1];
  [(CAMExpandableMenuButton *)self setHighlighted:1 forIndex:2];
  [(CAMExpandableMenuButton *)self setHighlighted:1 forIndex:3];
}

- (id)_currentGlyphImageForAccessibiliyHUD:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = [(CAMExpandableMenuButton *)self layoutStyle];
  if (v4 > 4 || ((0x17u >> v4) & 1) == 0)
  {
    if (!v3)
    {
      id v5 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v3)
  {
LABEL_6:
    id v5 = [MEMORY[0x263F827E8] systemImageNamed:@"timer"];
    goto LABEL_8;
  }
  v6 = off_263FA3358[v4];
  objc_super v7 = (void *)MEMORY[0x263F827E8];
  v8 = CAMCameraUIFrameworkBundle();
  v9 = [v7 imageNamed:v6 inBundle:v8];
  id v5 = [v9 imageWithRenderingMode:2];

LABEL_8:
  return v5;
}

- (void)setDuration:(int64_t)a3
{
}

- (void)setDuration:(int64_t)a3 animated:(BOOL)a4
{
  if ([(CAMExpandableMenuButton *)self selectedIndex] != a3)
  {
    [(CAMExpandableMenuButton *)self setSelectedIndex:a3];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setHideOffWhenCollapsed:(BOOL)a3
{
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)CAMTimerButton;
  [(CAMExpandableMenuButton *)&v3 reloadData];
  [(CAMTimerButton *)self _updateCurrentGlyphImage];
}

- (int64_t)numberOfMenuItems
{
  return 4;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained timeIntervalForDuration:a3];
    double v6 = v5;

    objc_super v7 = CAMTimerDurationFormatter();
    v8 = [NSNumber numberWithDouble:v6];
    v9 = [v7 stringFromNumber:v8];

    v10 = NSString;
    v11 = CAMLocalizedFrameworkString(@"TIMER_DURATION_TEXT", 0);
    v12 = [v10 stringWithValidatedFormat:v11, @"%@", 0, v9 validFormatSpecifiers error];
  }
  else
  {
    v12 = CAMLocalizedFrameworkString(@"TIMER_OFF_TEXT", @"A label indicating the camera's timer is turned off.");
  }
  return v12;
}

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void)_updateCurrentGlyphImage
{
  id v4 = [(CAMTimerButton *)self _currentGlyphImageForAccessibiliyHUD:0];
  objc_super v3 = [(CAMTimerButton *)self _glyphView];
  [v3 setImage:v4];
}

- (CAMTimerButton)initWithFrame:(CGRect)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMTimerButton *)self initWithLayoutStyle:v5];
}

- (void)setHideOffWhenCollapsed:(BOOL)a3 needsReloadData:(BOOL)a4
{
  if (self->_hideOffWhenCollapsed != a3)
  {
    self->_hideOffWhenCollapsed = a3;
    if (a4) {
      [(CAMTimerButton *)self reloadData];
    }
  }
}

- (double)padHeaderViewContentInsetLeft
{
  return 10.0;
}

- (id)imageForAccessibilityHUD
{
  return [(CAMTimerButton *)self _currentGlyphImageForAccessibiliyHUD:1];
}

- (CAMTimerButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMTimerButtonDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__glyphView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end