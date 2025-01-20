@interface NSConcreteProtocolChecker
- (NSConcreteProtocolChecker)initWithTarget:(id)a3 protocol:(id)a4;
- (id)protocol;
- (id)target;
- (void)dealloc;
@end

@implementation NSConcreteProtocolChecker

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteProtocolChecker;
  [(NSProxy *)&v3 dealloc];
}

- (id)protocol
{
  v2 = self->_protocol;

  return v2;
}

- (id)target
{
  v2 = self->_target;

  return v2;
}

- (NSConcreteProtocolChecker)initWithTarget:(id)a3 protocol:(id)a4
{
  self->_target = a3;
  self->_protocol = (Protocol *)a4;
  return self;
}

@end