@interface CAMDepthEffectSuggestionButton
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (CAMDepthEffectSuggestionButton)initWithFrame:(CGRect)a3;
- (double)activeTintAlphaForCurrentState;
- (id)imageNameForCurrentState;
- (int64_t)mode;
- (void)setMode:(int64_t)a3;
- (void)setMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMDepthEffectSuggestionButton

- (CAMDepthEffectSuggestionButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDepthEffectSuggestionButton;
  v3 = -[CAMCircleButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMDepthEffectSuggestionButton *)v3 setAccessibilityIdentifier:@"DepthEffectSuggestion"];
    v5 = v4;
  }

  return v4;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMDepthEffectSuggestionButton *)self mode] == 2;
}

- (id)imageNameForCurrentState
{
  return @"f.cursive";
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return (unint64_t)([(CAMDepthEffectSuggestionButton *)self mode] - 1) < 2;
}

- (double)activeTintAlphaForCurrentState
{
  int64_t v2 = [(CAMDepthEffectSuggestionButton *)self mode];
  double result = 1.0;
  if (v2 == 2) {
    return 0.5;
  }
  return result;
}

- (void)setMode:(int64_t)a3
{
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_mode != a3)
  {
    BOOL v4 = a4;
    self->_mode = a3;
    [(CAMCircleButton *)self updateImage];
    [(CAMCircleButton *)self updateTintColors];
    [(CAMCircleButton *)self updateSlashAnimated:v4];
  }
}

- (int64_t)mode
{
  return self->_mode;
}

@end