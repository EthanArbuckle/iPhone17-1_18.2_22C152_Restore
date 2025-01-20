@interface __NSCFURLLocalStreamTaskWorkWrite
- (void)dealloc;
@end

@implementation __NSCFURLLocalStreamTaskWorkWrite

- (void)dealloc
{
  id completion = self->_completion;
  if (completion)
  {
    _Block_release(completion);
    self->_id completion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)__NSCFURLLocalStreamTaskWorkWrite;
  [(__NSCFURLLocalStreamTaskWorkWrite *)&v4 dealloc];
}

@end