@interface CAMVideoStabilizationStatusIndicator
- (BOOL)shouldFillOutlineForCurrentState;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseSlash;
- (id)imageNameForCurrentState;
- (int64_t)videoStabilizationMode;
- (void)setVideoStabilizationMode:(int64_t)a3;
- (void)setVideoStabilizationMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMVideoStabilizationStatusIndicator

- (void)setVideoStabilizationMode:(int64_t)a3
{
}

- (void)setVideoStabilizationMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_videoStabilizationMode != a3)
  {
    self->_videoStabilizationMode = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a4];
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldFillOutlineForCurrentState
{
  return [(CAMVideoStabilizationStatusIndicator *)self videoStabilizationMode] != 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return [(CAMVideoStabilizationStatusIndicator *)self videoStabilizationMode] == 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return [(CAMVideoStabilizationStatusIndicator *)self videoStabilizationMode] != 0;
}

- (id)imageNameForCurrentState
{
  return @"figure.run.motion";
}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

@end