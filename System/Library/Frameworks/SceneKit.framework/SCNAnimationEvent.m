@interface SCNAnimationEvent
+ (SCNAnimationEvent)animationEventWithKeyTime:(CGFloat)time block:(SCNAnimationEventBlock)eventBlock;
- (SCNAnimationEvent)init;
- (double)time;
- (id)eventBlock;
- (void)dealloc;
- (void)setEventBlock:(id)a3;
- (void)setTime:(double)a3;
@end

@implementation SCNAnimationEvent

- (SCNAnimationEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNAnimationEvent;
  return [(SCNAnimationEvent *)&v3 init];
}

- (void)dealloc
{
  id eventBlock = self->_eventBlock;
  if (eventBlock) {
    _Block_release(eventBlock);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNAnimationEvent;
  [(SCNAnimationEvent *)&v4 dealloc];
}

- (double)time
{
  return self->_eventTime;
}

- (void)setTime:(double)a3
{
  self->_eventTime = a3;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
  id eventBlock = self->_eventBlock;
  if (eventBlock) {
    _Block_release(eventBlock);
  }
  self->_id eventBlock = _Block_copy(a3);
}

+ (SCNAnimationEvent)animationEventWithKeyTime:(CGFloat)time block:(SCNAnimationEventBlock)eventBlock
{
  v6 = (SCNAnimationEvent *)objc_alloc_init((Class)a1);
  [(SCNAnimationEvent *)v6 setTime:time];
  [(SCNAnimationEvent *)v6 setEventBlock:eventBlock];
  return v6;
}

@end