@interface DBTodayViewSynchronizedAnimation
- (BOOL)ready;
- (id)animationBlock;
- (id)client;
- (id)description;
- (void)setAnimationBlock:(id)a3;
- (void)setClient:(id)a3;
- (void)setReady:(BOOL)a3;
@end

@implementation DBTodayViewSynchronizedAnimation

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)DBTodayViewSynchronizedAnimation;
  v4 = [(DBTodayViewSynchronizedAnimation *)&v11 description];
  [(DBTodayViewSynchronizedAnimation *)self ready];
  v5 = NSStringFromBOOL();
  v6 = [(DBTodayViewSynchronizedAnimation *)self client];
  v7 = [(DBTodayViewSynchronizedAnimation *)self animationBlock];
  v8 = _Block_copy(v7);
  v9 = [v3 stringWithFormat:@"%@ [ready: %@, client: %@, animation block: %@]", v4, v5, v6, v8];

  return v9;
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (void)setAnimationBlock:(id)a3
{
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_client, 0);
  objc_storeStrong(&self->_animationBlock, 0);
}

@end