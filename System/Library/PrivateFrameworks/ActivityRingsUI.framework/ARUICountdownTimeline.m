@interface ARUICountdownTimeline
- (ARUICountdownAnimation)prepareToAnimate;
- (ARUICountdownAnimation)prepareToCancel;
- (NSArray)animations;
- (NSArray)cancelAnimations;
- (void)setAnimations:(id)a3;
- (void)setCancelAnimations:(id)a3;
- (void)setPrepareToAnimate:(id)a3;
- (void)setPrepareToCancel:(id)a3;
@end

@implementation ARUICountdownTimeline

- (ARUICountdownAnimation)prepareToAnimate
{
  return self->_prepareToAnimate;
}

- (void)setPrepareToAnimate:(id)a3
{
}

- (NSArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (ARUICountdownAnimation)prepareToCancel
{
  return self->_prepareToCancel;
}

- (void)setPrepareToCancel:(id)a3
{
}

- (NSArray)cancelAnimations
{
  return self->_cancelAnimations;
}

- (void)setCancelAnimations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelAnimations, 0);
  objc_storeStrong((id *)&self->_prepareToCancel, 0);
  objc_storeStrong((id *)&self->_animations, 0);

  objc_storeStrong((id *)&self->_prepareToAnimate, 0);
}

@end