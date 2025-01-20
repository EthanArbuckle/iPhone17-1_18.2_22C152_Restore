@interface CAMSharedLibraryBadge
- (CAMSharedLibraryBadge)initWithFrame:(CGRect)a3;
- (int64_t)sharedLibraryMode;
- (void)_updateTextAndColors;
- (void)setSharedLibraryMode:(int64_t)a3;
@end

@implementation CAMSharedLibraryBadge

- (CAMSharedLibraryBadge)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMSharedLibraryBadge;
  v3 = -[CEKBadgeTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMSharedLibraryBadge *)v3 _updateTextAndColors];
    v5 = v4;
  }

  return v4;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    [(CAMSharedLibraryBadge *)self _updateTextAndColors];
  }
}

- (void)_updateTextAndColors
{
  if (CAMSharedLibraryModeIsOn([(CAMSharedLibraryBadge *)self sharedLibraryMode])) {
    v3 = @"SHARED_LIBRARY_CAPS";
  }
  else {
    v3 = @"PERSONAL_LIBRARY_CAPS";
  }
  CAMLocalizedFrameworkString(v3, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (CAMSharedLibraryModeIsOn([(CAMSharedLibraryBadge *)self sharedLibraryMode])) {
    [MEMORY[0x263F825C8] systemYellowColor];
  }
  else {
  v4 = [MEMORY[0x263F825C8] whiteColor];
  }
  [(CEKBadgeTextView *)self _setText:v5];
  [(CEKBadgeView *)self _setFillColor:v4];
  [(CAMSharedLibraryBadge *)self setNeedsLayout];
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end