@interface AVPlayerControllerVolumeAnimator
- (AVPlayerController)playerController;
- (AVPlayerControllerVolumeAnimator)initWithPlayerController:(id)a3;
- (BOOL)canAnimateVolumeAwayFromZero;
- (BOOL)canAnimateVolumeTowardsZero;
- (BOOL)currentRouteHasVolumeControl;
- (BOOL)isAnimatingAwayFromZero;
- (BOOL)isAnimatingTowardsZero;
- (double)volumeToRestore;
- (void)restoreVolumeIfNeeded;
- (void)setAnimatingAwayFromZero:(BOOL)a3;
- (void)setAnimatingTowardsZero:(BOOL)a3;
- (void)setProgressAwayFromZero:(double)a3;
- (void)setProgressTowardsZero:(double)a3;
- (void)setVolumeToRestore:(double)a3;
@end

@implementation AVPlayerControllerVolumeAnimator

- (void).cxx_destruct
{
}

- (void)setAnimatingAwayFromZero:(BOOL)a3
{
  self->_animatingAwayFromZero = a3;
}

- (BOOL)isAnimatingAwayFromZero
{
  return self->_animatingAwayFromZero;
}

- (void)setAnimatingTowardsZero:(BOOL)a3
{
  self->_animatingTowardsZero = a3;
}

- (BOOL)isAnimatingTowardsZero
{
  return self->_animatingTowardsZero;
}

- (void)setVolumeToRestore:(double)a3
{
  self->_volumeToRestore = a3;
}

- (double)volumeToRestore
{
  return self->_volumeToRestore;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)restoreVolumeIfNeeded
{
  if ([(AVPlayerControllerVolumeAnimator *)self isAnimatingTowardsZero]
    || [(AVPlayerControllerVolumeAnimator *)self isAnimatingAwayFromZero])
  {
    [(AVPlayerControllerVolumeAnimator *)self volumeToRestore];
    double v4 = v3;
    v5 = [(AVPlayerControllerVolumeAnimator *)self playerController];
    [v5 setVolume:v4];
  }
  [(AVPlayerControllerVolumeAnimator *)self setAnimatingTowardsZero:0];

  [(AVPlayerControllerVolumeAnimator *)self setAnimatingAwayFromZero:0];
}

- (void)setProgressAwayFromZero:(double)a3
{
  if ([(AVPlayerControllerVolumeAnimator *)self isAnimatingTowardsZero])
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Cannot unmute when muting.", v12, 2u);
    }
  }
  if (![(AVPlayerControllerVolumeAnimator *)self isAnimatingAwayFromZero])
  {
    [(AVPlayerControllerVolumeAnimator *)self setAnimatingAwayFromZero:1];
    v6 = [(AVPlayerControllerVolumeAnimator *)self playerController];
    [v6 volume];
    -[AVPlayerControllerVolumeAnimator setVolumeToRestore:](self, "setVolumeToRestore:");

    v7 = [(AVPlayerControllerVolumeAnimator *)self playerController];
    [v7 setVolume:0.0];

    v8 = [(AVPlayerControllerVolumeAnimator *)self playerController];
    [v8 setMuted:0];
  }
  [(AVPlayerControllerVolumeAnimator *)self volumeToRestore];
  double v10 = fmin(fmax(a3, 0.0), 1.0) * v9;
  v11 = [(AVPlayerControllerVolumeAnimator *)self playerController];
  [v11 setVolume:v10];
}

- (void)setProgressTowardsZero:(double)a3
{
  if ([(AVPlayerControllerVolumeAnimator *)self isAnimatingAwayFromZero])
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Cannot mute when unmuting.", v12, 2u);
    }
  }
  if (![(AVPlayerControllerVolumeAnimator *)self isAnimatingTowardsZero])
  {
    [(AVPlayerControllerVolumeAnimator *)self setAnimatingTowardsZero:1];
    v6 = [(AVPlayerControllerVolumeAnimator *)self playerController];
    [v6 volume];
    -[AVPlayerControllerVolumeAnimator setVolumeToRestore:](self, "setVolumeToRestore:");
  }
  [(AVPlayerControllerVolumeAnimator *)self volumeToRestore];
  double v8 = 0.0;
  double v9 = fmax(a3, 0.0);
  if (v9 < 1.0) {
    double v8 = 1.0 - v9;
  }
  double v10 = v8 * v7;
  v11 = [(AVPlayerControllerVolumeAnimator *)self playerController];
  [v11 setVolume:v10];
}

- (BOOL)canAnimateVolumeAwayFromZero
{
  if (![(AVPlayerControllerVolumeAnimator *)self currentRouteHasVolumeControl]) {
    return 0;
  }
  double v3 = [(AVPlayerControllerVolumeAnimator *)self playerController];
  double v4 = [v3 player];
  if (v4 && ![(AVPlayerControllerVolumeAnimator *)self isAnimatingTowardsZero])
  {
    v6 = [(AVPlayerControllerVolumeAnimator *)self playerController];
    if ([v6 isMuted])
    {
      double v7 = [(AVPlayerControllerVolumeAnimator *)self playerController];
      [v7 volume];
      BOOL v5 = v8 > 0.0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canAnimateVolumeTowardsZero
{
  if (![(AVPlayerControllerVolumeAnimator *)self currentRouteHasVolumeControl]) {
    return 0;
  }
  double v3 = [(AVPlayerControllerVolumeAnimator *)self playerController];
  double v4 = [v3 player];
  if (v4 && ![(AVPlayerControllerVolumeAnimator *)self isAnimatingAwayFromZero])
  {
    v6 = [(AVPlayerControllerVolumeAnimator *)self playerController];
    if ([v6 isMuted])
    {
      BOOL v5 = 0;
    }
    else
    {
      double v7 = [(AVPlayerControllerVolumeAnimator *)self playerController];
      [v7 volume];
      BOOL v5 = v8 > 0.0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)currentRouteHasVolumeControl
{
  v2 = +[AVSystemVolumeController volumeController];
  char v3 = [v2 currentRouteHasVolumeControl];

  return v3;
}

- (AVPlayerControllerVolumeAnimator)initWithPlayerController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerControllerVolumeAnimator;
  v6 = [(AVPlayerControllerVolumeAnimator *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playerController, a3);
  }

  return v7;
}

@end