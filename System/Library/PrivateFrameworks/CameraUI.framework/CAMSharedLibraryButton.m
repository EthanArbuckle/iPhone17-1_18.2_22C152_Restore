@interface CAMSharedLibraryButton
- (CAMSharedLibraryButton)initWithLayoutStyle:(int64_t)a3;
- (UIImageView)_glyphView;
- (id)imageForAccessibilityHUD;
- (int64_t)_indexForSharedLibraryMode:(int64_t)a3;
- (int64_t)numberOfMenuItems;
- (int64_t)sharedLibraryMode;
- (void)_updateImageForCurrentState;
- (void)setSharedLibraryMode:(int64_t)a3;
@end

@implementation CAMSharedLibraryButton

- (CAMSharedLibraryButton)initWithLayoutStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMSharedLibraryButton;
  v3 = [(CAMExpandableMenuButton *)&v9 initWithLayoutStyle:a3];
  v4 = v3;
  if (v3)
  {
    v3->_sharedLibraryMode = 0;
    [(CAMExpandableMenuButton *)v3 setHighlighted:1 forIndex:1];
    uint64_t v5 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    glyphView = v4->__glyphView;
    v4->__glyphView = (UIImageView *)v5;

    [(CAMSharedLibraryButton *)v4 _updateImageForCurrentState];
    v7 = v4;
  }

  return v4;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", -[CAMSharedLibraryButton _indexForSharedLibraryMode:](self, "_indexForSharedLibraryMode:"));
    [(CAMSharedLibraryButton *)self _updateImageForCurrentState];
  }
}

- (int64_t)_indexForSharedLibraryMode:(int64_t)a3
{
  return CAMSharedLibraryModeIsOn(a3);
}

- (int64_t)numberOfMenuItems
{
  return 2;
}

- (void)_updateImageForCurrentState
{
  int64_t v3 = [(CAMSharedLibraryButton *)self _indexForSharedLibraryMode:[(CAMSharedLibraryButton *)self sharedLibraryMode]];
  v4 = @"CAMSharedLibraryButton";
  if (v3 != 1) {
    v4 = 0;
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"CAMSharedLibraryButtonOff";
  }
  v6 = (void *)MEMORY[0x263F827E8];
  CAMCameraUIFrameworkBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [v6 imageNamed:v5 inBundle:v10];
  v8 = [v7 imageWithRenderingMode:2];
  objc_super v9 = [(CAMSharedLibraryButton *)self _glyphView];
  [v9 setImage:v8];
}

- (id)imageForAccessibilityHUD
{
  int64_t v2 = [(CAMSharedLibraryButton *)self _indexForSharedLibraryMode:[(CAMSharedLibraryButton *)self sharedLibraryMode]];
  int64_t v3 = @"CAMSharedLibraryButton-AXHUD";
  if (v2 != 1) {
    int64_t v3 = 0;
  }
  if (v2) {
    v4 = v3;
  }
  else {
    v4 = @"CAMSharedLibraryButtonOff-AXHUD";
  }
  uint64_t v5 = (void *)MEMORY[0x263F827E8];
  v6 = CAMCameraUIFrameworkBundle();
  v7 = [v5 imageNamed:v4 inBundle:v6];
  v8 = [v7 imageWithRenderingMode:2];

  return v8;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (UIImageView)_glyphView
{
  return self->__glyphView;
}

- (void).cxx_destruct
{
}

@end