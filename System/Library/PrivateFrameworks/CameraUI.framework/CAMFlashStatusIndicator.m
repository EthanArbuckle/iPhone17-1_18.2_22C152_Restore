@interface CAMFlashStatusIndicator
- (BOOL)isFlashActive;
- (BOOL)isFlashUnavailable;
- (BOOL)shouldFillOutlineForCurrentState;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (CGVector)imageOffset;
- (id)accessibilityIdentifier;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (id)imageSymbolColorConfiguration;
- (int64_t)flashMode;
- (void)setFlashActive:(BOOL)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setFlashUnavailable:(BOOL)a3;
@end

@implementation CAMFlashStatusIndicator

- (void)setFlashMode:(int64_t)a3
{
}

- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a4];
  }
}

- (void)setFlashActive:(BOOL)a3
{
  if (self->_flashActive != a3)
  {
    self->_flashActive = a3;
    [(CAMControlStatusIndicator *)self updateImage];
  }
}

- (void)setFlashUnavailable:(BOOL)a3
{
  if (self->_flashUnavailable != a3)
  {
    self->_flashUnavailable = a3;
    [(CAMControlStatusIndicator *)self updateImage];
  }
}

- (id)imageNameForCurrentState
{
  if ([(CAMFlashStatusIndicator *)self isFlashUnavailable]) {
    v2 = @"bolt.trianglebadge.exclamationmark.fill";
  }
  else {
    v2 = @"bolt.fill";
  }
  return v2;
}

- (CGVector)imageOffset
{
  BOOL v3 = [(CAMFlashStatusIndicator *)self isFlashUnavailable];
  double v4 = 0.0;
  if (v3) {
    double v4 = -CAMPixelWidthForView(self);
  }
  double v5 = v4;
  result.dy = v5;
  result.dx = v4;
  return result;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  if ([(CAMFlashStatusIndicator *)self isFlashUnavailable]) {
    return 0;
  }
  int64_t v4 = [(CAMFlashStatusIndicator *)self flashMode];
  if (v4 != 2) {
    return v4 == 1;
  }
  return [(CAMFlashStatusIndicator *)self isFlashActive];
}

- (id)imageSymbolColorConfiguration
{
  v8[2] = *MEMORY[0x263EF8340];
  if ([(CAMFlashStatusIndicator *)self isFlashUnavailable])
  {
    v2 = (void *)MEMORY[0x263F82818];
    BOOL v3 = [MEMORY[0x263F825C8] systemYellowColor];
    v8[0] = v3;
    int64_t v4 = [MEMORY[0x263F825C8] colorWithWhite:0.5 alpha:1.0];
    v8[1] = v4;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = [v2 configurationWithPaletteColors:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)shouldFillOutlineForCurrentState
{
  int64_t v3 = [(CAMFlashStatusIndicator *)self flashMode];
  if (v3)
  {
    if (v3 == 2)
    {
      LOBYTE(v3) = [(CAMFlashStatusIndicator *)self isFlashActive];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  if ([(CAMFlashStatusIndicator *)self flashMode]) {
    return 0;
  }
  else {
    return ![(CAMFlashStatusIndicator *)self isFlashUnavailable];
  }
}

- (id)accessibilityIdentifier
{
  return @"StatusBarFlashButton";
}

- (id)imageNameForAXHUD
{
  if ([(CAMFlashStatusIndicator *)self shouldShowSlashForCurrentState])
  {
    int64_t v3 = @"bolt.slash.fill";
  }
  else
  {
    int64_t v3 = [(CAMFlashStatusIndicator *)self imageNameForCurrentState];
  }
  return v3;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (BOOL)isFlashActive
{
  return self->_flashActive;
}

- (BOOL)isFlashUnavailable
{
  return self->_flashUnavailable;
}

@end