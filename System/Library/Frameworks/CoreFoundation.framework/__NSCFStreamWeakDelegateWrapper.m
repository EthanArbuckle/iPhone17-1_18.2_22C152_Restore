@interface __NSCFStreamWeakDelegateWrapper
- (__NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3;
- (id)retainedDelegate;
- (void)dealloc;
@end

@implementation __NSCFStreamWeakDelegateWrapper

- (id)retainedDelegate
{
  return _NSObjectLoadWeakRetained((id *)&self->_object, &self->_useFallback);
}

- (__NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  v7.receiver = self;
  v7.super_class = (Class)__NSCFStreamWeakDelegateWrapper;
  v4 = [(__NSCFStreamWeakDelegateWrapper *)&v7 init];
  v5 = v4;
  if (v4) {
    _NSObjectStoreWeak((id *)&v4->_object, a3, &v4->_useFallback);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  _NSObjectStoreWeak((id *)&self->_object, 0, &self->_useFallback);
  v3.receiver = self;
  v3.super_class = (Class)__NSCFStreamWeakDelegateWrapper;
  [(__NSCFStreamWeakDelegateWrapper *)&v3 dealloc];
}

@end