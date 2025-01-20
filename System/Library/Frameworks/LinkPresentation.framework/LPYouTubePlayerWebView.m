@interface LPYouTubePlayerWebView
- (BOOL)allowFirstResponder;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (void)setAllowFirstResponder:(BOOL)a3;
@end

@implementation LPYouTubePlayerWebView

- (BOOL)canBecomeFirstResponder
{
  if (!*(&self->super.__hasActiveNowPlayingSession + 1)) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)LPYouTubePlayerWebView;
  return [(LPYouTubePlayerWebView *)&v3 canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  if (!*(&self->super.__hasActiveNowPlayingSession + 1)) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)LPYouTubePlayerWebView;
  return [(LPYouTubePlayerWebView *)&v3 becomeFirstResponder];
}

- (BOOL)allowFirstResponder
{
  return *(&self->super.__hasActiveNowPlayingSession + 1);
}

- (void)setAllowFirstResponder:(BOOL)a3
{
  *(&self->super.__hasActiveNowPlayingSession + 1) = a3;
}

@end