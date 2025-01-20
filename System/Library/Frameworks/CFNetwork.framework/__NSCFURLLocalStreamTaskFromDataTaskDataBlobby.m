@interface __NSCFURLLocalStreamTaskFromDataTaskDataBlobby
- (void)dealloc;
@end

@implementation __NSCFURLLocalStreamTaskFromDataTaskDataBlobby

- (void)dealloc
{
  remainingData = self->_remainingData;
  if (remainingData)
  {
    dispatch_release(remainingData);
    self->_remainingData = 0;
  }
  completion = (void (**)(id, SEL))self->_completion;
  if (completion)
  {
    self->_completion = 0;
    completion[2](completion, a2);
    _Block_release(completion);
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTaskDataBlobby;
  [(__NSCFURLLocalStreamTaskFromDataTaskDataBlobby *)&v5 dealloc];
}

@end