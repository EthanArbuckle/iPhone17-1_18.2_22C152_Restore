@interface CAAnimationDelegateBlockHelper
- (id)animationDidStartBlock;
- (id)animationDidStopBlock;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)setAnimationDidStartBlock:(id)a3;
- (void)setAnimationDidStopBlock:(id)a3;
@end

@implementation CAAnimationDelegateBlockHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationDidStopBlock, 0);
  objc_storeStrong(&self->_animationDidStartBlock, 0);
}

- (void)setAnimationDidStopBlock:(id)a3
{
}

- (id)animationDidStopBlock
{
  return self->_animationDidStopBlock;
}

- (void)setAnimationDidStartBlock:(id)a3
{
}

- (id)animationDidStartBlock
{
  return self->_animationDidStartBlock;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  animationDidStopBlock = (void (**)(id, BOOL))self->_animationDidStopBlock;
  if (animationDidStopBlock) {
    animationDidStopBlock[2](animationDidStopBlock, a4);
  }
}

- (void)animationDidStart:(id)a3
{
  animationDidStartBlock = (void (**)(void))self->_animationDidStartBlock;
  if (animationDidStartBlock) {
    animationDidStartBlock[2]();
  }
}

- (void)dealloc
{
  id animationDidStartBlock = self->_animationDidStartBlock;
  self->_id animationDidStartBlock = 0;

  id animationDidStopBlock = self->_animationDidStopBlock;
  self->_id animationDidStopBlock = 0;

  v5.receiver = self;
  v5.super_class = (Class)CAAnimationDelegateBlockHelper;
  [(CAAnimationDelegateBlockHelper *)&v5 dealloc];
}

@end