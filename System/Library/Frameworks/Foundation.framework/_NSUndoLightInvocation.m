@interface _NSUndoLightInvocation
- (_NSUndoLightInvocation)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (id)_argument;
- (id)description;
- (void)dealloc;
- (void)invoke;
@end

@implementation _NSUndoLightInvocation

- (_NSUndoLightInvocation)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_NSUndoLightInvocation;
  v7 = [(_NSUndoObject *)&v10 initWithTarget:a3];
  if (a4) {
    SEL v8 = a4;
  }
  else {
    SEL v8 = 0;
  }
  v7->_selector = v8;
  v7->_arg = a5;
  return v7;
}

- (void)invoke
{
  id target = self->super._target;
  selector = self->_selector;
  if (selector) {
    objc_msgSend(target, selector, self->_arg);
  }
  else {
    objc_msgSend(target, 0, self->_arg);
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSUndoLightInvocation;
  [(_NSUndoLightInvocation *)&v3 dealloc];
}

- (id)_argument
{
  return self->_arg;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id target = self->super._target;
  if (self->_selector) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  v7 = NSStringFromSelector(selector);
  if (self->_arg)
  {
    SEL v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id arg = self->_arg;
  }
  else
  {
    id arg = 0;
    v9 = (NSString *)@"none";
  }
  return +[NSString stringWithFormat:@"target: %@ %p -- selector:%@ -- arg:%@ %p", v4, target, v7, v9, arg];
}

@end