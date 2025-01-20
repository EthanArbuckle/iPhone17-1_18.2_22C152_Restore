@interface _NSUndoBlockInvocation
- (_NSUndoBlockInvocation)initWithTarget:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)invoke;
@end

@implementation _NSUndoBlockInvocation

- (_NSUndoBlockInvocation)initWithTarget:(id)a3 handler:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_NSUndoBlockInvocation;
  v5 = [(_NSUndoObject *)&v8 initWithTarget:a3];
  if (v5)
  {
    v6 = _Block_copy(a4);
    v5->_handler = v6;
    if (!v6)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"unable to copy handler" userInfo:0]);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id handler = self->_handler;
    if (handler)
    {
      _Block_release(handler);
      self->_id handler = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSUndoBlockInvocation;
  [(_NSUndoBlockInvocation *)&v4 dealloc];
}

- (void)invoke
{
}

@end