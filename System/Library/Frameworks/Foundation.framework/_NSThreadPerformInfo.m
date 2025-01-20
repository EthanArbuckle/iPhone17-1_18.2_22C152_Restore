@interface _NSThreadPerformInfo
- (int)wait;
- (void)dealloc;
- (void)signal:(int)a3;
@end

@implementation _NSThreadPerformInfo

- (void)signal:(int)a3
{
  [(NSCondition *)self->_waiter lock];
  self->_state = a3;
  [(NSCondition *)self->_waiter signal];
  waiter = self->_waiter;

  [(NSCondition *)waiter unlock];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSThreadPerformInfo;
  [(_NSThreadPerformInfo *)&v3 dealloc];
}

- (int)wait
{
  [(NSCondition *)self->_waiter lock];
  while (1)
  {
    int state = self->_state;
    if (state) {
      break;
    }
    [(NSCondition *)self->_waiter wait];
  }
  [(NSCondition *)self->_waiter unlock];
  return state;
}

@end