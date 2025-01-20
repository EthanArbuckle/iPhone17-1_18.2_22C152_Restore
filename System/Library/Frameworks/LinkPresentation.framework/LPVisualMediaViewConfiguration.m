@interface LPVisualMediaViewConfiguration
- (BOOL)allowsLoadingMediaWithAutoPlayDisabled;
- (BOOL)disableAutoPlay;
- (BOOL)disablePlayback;
- (BOOL)disablePlaybackControls;
- (double)fullScreenTransitionCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowsLoadingMediaWithAutoPlayDisabled:(BOOL)a3;
- (void)setDisableAutoPlay:(BOOL)a3;
- (void)setDisablePlayback:(BOOL)a3;
- (void)setDisablePlaybackControls:(BOOL)a3;
- (void)setFullScreenTransitionCornerRadius:(double)a3;
@end

@implementation LPVisualMediaViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPVisualMediaViewConfiguration allocWithZone:a3];
  if (v4)
  {
    [(LPVisualMediaViewConfiguration *)v4 setDisablePlayback:[(LPVisualMediaViewConfiguration *)self disablePlayback]];
    [(LPVisualMediaViewConfiguration *)v4 setDisablePlaybackControls:[(LPVisualMediaViewConfiguration *)self disablePlaybackControls]];
    [(LPVisualMediaViewConfiguration *)v4 setDisableAutoPlay:[(LPVisualMediaViewConfiguration *)self disableAutoPlay]];
    [(LPVisualMediaViewConfiguration *)v4 setAllowsLoadingMediaWithAutoPlayDisabled:[(LPVisualMediaViewConfiguration *)self allowsLoadingMediaWithAutoPlayDisabled]];
    [(LPVisualMediaViewConfiguration *)self fullScreenTransitionCornerRadius];
    -[LPVisualMediaViewConfiguration setFullScreenTransitionCornerRadius:](v4, "setFullScreenTransitionCornerRadius:");
    v5 = v4;
  }

  return v4;
}

- (BOOL)disablePlayback
{
  return self->_disablePlayback;
}

- (void)setDisablePlayback:(BOOL)a3
{
  self->_disablePlayback = a3;
}

- (BOOL)disablePlaybackControls
{
  return self->_disablePlaybackControls;
}

- (void)setDisablePlaybackControls:(BOOL)a3
{
  self->_disablePlaybackControls = a3;
}

- (BOOL)disableAutoPlay
{
  return self->_disableAutoPlay;
}

- (void)setDisableAutoPlay:(BOOL)a3
{
  self->_disableAutoPlay = a3;
}

- (BOOL)allowsLoadingMediaWithAutoPlayDisabled
{
  return self->_allowsLoadingMediaWithAutoPlayDisabled;
}

- (void)setAllowsLoadingMediaWithAutoPlayDisabled:(BOOL)a3
{
  self->_allowsLoadingMediaWithAutoPlayDisabled = a3;
}

- (double)fullScreenTransitionCornerRadius
{
  return self->_fullScreenTransitionCornerRadius;
}

- (void)setFullScreenTransitionCornerRadius:(double)a3
{
  self->_fullScreenTransitionCornerRadius = a3;
}

@end