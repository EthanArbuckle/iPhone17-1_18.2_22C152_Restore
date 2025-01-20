@interface NSCFStreamWeakDelegateWrapper
- (NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3;
- (id)retainedDelegate;
- (void)dealloc;
@end

@implementation NSCFStreamWeakDelegateWrapper

- (NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSCFStreamWeakDelegateWrapper;
  v3 = [(NSCFStreamWeakDelegateWrapper *)&v5 init];
  if (v3) {
    _NSObjectStoreWeak();
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _NSObjectStoreWeak();
  v3.receiver = self;
  v3.super_class = (Class)NSCFStreamWeakDelegateWrapper;
  [(NSCFStreamWeakDelegateWrapper *)&v3 dealloc];
}

- (id)retainedDelegate
{
  return (id)MEMORY[0x1F40D9508](&self->_object, &self->_useFallback);
}

@end