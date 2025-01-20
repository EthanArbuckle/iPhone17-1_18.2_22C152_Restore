@interface CAMSharedLibraryImageWellIndicatorView
- (CAMSharedLibraryImageWellIndicatorView)initWithFrame:(CGRect)a3;
- (double)_backgroundColorWhiteValue;
- (double)_defaultCornerRadius;
- (int64_t)sharedLibraryMode;
- (void)_updateText;
- (void)setSharedLibraryMode:(int64_t)a3;
@end

@implementation CAMSharedLibraryImageWellIndicatorView

- (CAMSharedLibraryImageWellIndicatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSharedLibraryImageWellIndicatorView;
  v3 = -[CAMInstructionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CAMSharedLibraryImageWellIndicatorView *)v3 _updateText];
  }
  return v4;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    [(CAMSharedLibraryImageWellIndicatorView *)self _updateText];
    id v4 = [(CAMInstructionLabel *)self delegate];
    [v4 instructionLabelDidChangeIntrinsicContentSize:self];
  }
}

- (void)_updateText
{
  if (CAMSharedLibraryModeIsOn([(CAMSharedLibraryImageWellIndicatorView *)self sharedLibraryMode])) {
    v3 = @"SHARED_LIBRARY_SHARED";
  }
  else {
    v3 = @"SHARED_LIBRARY_PERSONAL";
  }
  CAMLocalizedFrameworkString(v3, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CAMInstructionLabel *)self setText:v4];
}

- (double)_defaultCornerRadius
{
  return 10.0;
}

- (double)_backgroundColorWhiteValue
{
  return 0.3;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end