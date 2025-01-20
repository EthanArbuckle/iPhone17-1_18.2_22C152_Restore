@interface _NSTimerBlockTarget
- (void)dealloc;
- (void)fire:(id)a3;
@end

@implementation _NSTimerBlockTarget

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _Block_release(self->_block);
  v3.receiver = self;
  v3.super_class = (Class)_NSTimerBlockTarget;
  [(_NSTimerBlockTarget *)&v3 dealloc];
}

- (void)fire:(id)a3
{
}

@end