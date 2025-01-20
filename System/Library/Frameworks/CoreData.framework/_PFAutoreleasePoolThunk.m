@interface _PFAutoreleasePoolThunk
+ (void)thunkWithBlock:(uint64_t)a1;
- (void)dealloc;
- (void)initWithBlock:(void *)a1;
@end

@implementation _PFAutoreleasePoolThunk

+ (void)thunkWithBlock:(uint64_t)a1
{
  id v3 = objc_alloc((Class)self);
  v4 = -[_PFAutoreleasePoolThunk initWithBlock:](v3, a2);

  return v4;
}

- (void)initWithBlock:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)_PFAutoreleasePoolThunk;
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = _Block_copy(a2);
  }
  return v3;
}

- (void)dealloc
{
  id v3 = (void *)MEMORY[0x18C127630](self, a2);
  (*((void (**)(void))self->_action + 2))();
  _Block_release(self->_action);
  v4.receiver = self;
  v4.super_class = (Class)_PFAutoreleasePoolThunk;
  [(_PFAutoreleasePoolThunk *)&v4 dealloc];
}

@end