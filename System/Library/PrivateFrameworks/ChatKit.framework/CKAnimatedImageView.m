@interface CKAnimatedImageView
- (BOOL)automaticallyObserveWindowForAnimationTimer;
- (BOOL)userExplicitlyUnpausedAnimation;
- (CKAnimatedImage)animatedImage;
- (NSArray)frames;
- (void)animationTimerFired:(double)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setAnimatedImage:(id)a3;
- (void)setAutomaticallyObserveWindowForAnimationTimer:(BOOL)a3;
- (void)setFrames:(id)a3;
- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3;
- (void)updateAnimationTimerObserving;
@end

@implementation CKAnimatedImageView

- (void)dealloc
{
  v3 = +[CKImageAnimationTimer sharedTimer];
  [v3 removeAnimationTimerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKAnimatedImageView;
  [(CKAnimatedImageView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CKAnimatedImageView;
  [(CKAnimatedImageView *)&v3 didMoveToWindow];
  if ([(CKAnimatedImageView *)self automaticallyObserveWindowForAnimationTimer])
  {
    [(CKAnimatedImageView *)self updateAnimationTimerObserving];
  }
}

- (void)setAnimatedImage:(id)a3
{
  v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    v6 = [(CKAnimatedImage *)self->_animatedImage frames];
    [(CKAnimatedImageView *)self setFrames:v6];
    if ([v6 count]) {
      [v6 objectAtIndex:0];
    }
    else {
    v7 = [(CKAnimatedImage *)v8 image];
    }
    [(CKAnimatedImageView *)self setImage:v7];

    [(CKAnimatedImageView *)self updateAnimationTimerObserving];
    v5 = v8;
  }
}

- (void)updateAnimationTimerObserving
{
  objc_super v3 = [(CKAnimatedImageView *)self frames];
  if ((unint64_t)[v3 count] <= 1)
  {
  }
  else
  {
    objc_super v4 = [(CKAnimatedImageView *)self window];

    if (v4)
    {
      id v5 = +[CKImageAnimationTimer sharedTimer];
      [v5 addAnimationTimerObserver:self];
      goto LABEL_6;
    }
  }
  id v5 = +[CKImageAnimationTimer sharedTimer];
  [v5 removeAnimationTimerObserver:self];
LABEL_6:
}

- (void)animationTimerFired:(double)a3
{
  id v4 = [(CKAnimatedImage *)self->_animatedImage frameForAnimationTime:a3];
  [(CKAnimatedImageView *)self setImage:v4];
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (BOOL)automaticallyObserveWindowForAnimationTimer
{
  return self->_automaticallyObserveWindowForAnimationTimer;
}

- (void)setAutomaticallyObserveWindowForAnimationTimer:(BOOL)a3
{
  self->_automaticallyObserveWindowForAnimationTimer = a3;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);

  objc_storeStrong((id *)&self->_animatedImage, 0);
}

@end