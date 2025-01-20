@interface __CFNCoreLoggable
- (__CFNCoreLoggable)initWithLoggableName:(const char *)a3;
- (const)loggable;
- (id)_initWithObject:(id)a3 name:(const char *)a4;
- (void)dealloc;
@end

@implementation __CFNCoreLoggable

- (void)dealloc
{
  loggable = self->_loggable;
  if (loggable) {
    (*((void (**)(CoreLoggable *, SEL))loggable->var0 + 1))(loggable, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)__CFNCoreLoggable;
  [(__CFNCoreLoggable *)&v4 dealloc];
}

- (const)loggable
{
  return self->_loggable;
}

- (__CFNCoreLoggable)initWithLoggableName:(const char *)a3
{
  return (__CFNCoreLoggable *)[(__CFNCoreLoggable *)self _initWithObject:self name:a3];
}

- (id)_initWithObject:(id)a3 name:(const char *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)__CFNCoreLoggable;
  if ([(__CFNCoreLoggable *)&v5 init]) {
    operator new();
  }
  return 0;
}

@end