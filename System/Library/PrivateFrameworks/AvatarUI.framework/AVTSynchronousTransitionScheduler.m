@interface AVTSynchronousTransitionScheduler
- (AVTSynchronousTransitionScheduler)initWithEventHandler:(id)a3;
- (BOOL)isRunningEvent;
- (id)eventHandler;
- (void)didCompleteEvent;
- (void)scheduleEvent;
- (void)setIsRunningEvent:(BOOL)a3;
- (void)stop;
@end

@implementation AVTSynchronousTransitionScheduler

- (AVTSynchronousTransitionScheduler)initWithEventHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTSynchronousTransitionScheduler;
  v5 = [(AVTSynchronousTransitionScheduler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id eventHandler = v5->_eventHandler;
    v5->_id eventHandler = (id)v6;
  }
  return v5;
}

- (void)scheduleEvent
{
  if (![(AVTSynchronousTransitionScheduler *)self isRunningEvent])
  {
    [(AVTSynchronousTransitionScheduler *)self setIsRunningEvent:1];
    v3 = [(AVTSynchronousTransitionScheduler *)self eventHandler];
    v3[2]();
  }
}

- (void)stop
{
}

- (void)didCompleteEvent
{
  if ([(AVTSynchronousTransitionScheduler *)self isRunningEvent])
  {
    v3 = [(AVTSynchronousTransitionScheduler *)self eventHandler];
    v3[2]();
  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (BOOL)isRunningEvent
{
  return self->_isRunningEvent;
}

- (void)setIsRunningEvent:(BOOL)a3
{
  self->_isRunningEvent = a3;
}

- (void).cxx_destruct
{
}

@end