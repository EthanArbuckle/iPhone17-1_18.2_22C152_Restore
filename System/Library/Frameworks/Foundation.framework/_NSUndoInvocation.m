@interface _NSUndoInvocation
- (_NSUndoInvocation)initWithTarget:(id)a3 invocation:(id)a4;
- (id)description;
- (void)dealloc;
- (void)invoke;
@end

@implementation _NSUndoInvocation

- (_NSUndoInvocation)initWithTarget:(id)a3 invocation:(id)a4
{
  v5 = [(_NSUndoObject *)self initWithTarget:a3];
  v6 = (NSInvocation *)a4;
  v5->_invocation = v6;
  [(NSInvocation *)v6 retainArguments];
  return v5;
}

- (void)invoke
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSUndoInvocation;
  [(_NSUndoInvocation *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  return +[NSString stringWithFormat:@"target: %@ %p -- selector:%@", v4, self->super._target, NSStringFromSelector([(NSInvocation *)self->_invocation selector])];
}

@end