@interface IMDPersistenceServiceListener
- (IMDPersistenceServiceListener)init;
- (__IMDPersistenceServiceListenerImpl)impl;
- (void)resume;
- (void)setImpl:(id)a3;
@end

@implementation IMDPersistenceServiceListener

- (IMDPersistenceServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDPersistenceServiceListener;
  v2 = [(IMDPersistenceServiceListener *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(__IMDPersistenceServiceListenerImpl);
    impl = v2->_impl;
    v2->_impl = v3;
  }
  return v2;
}

- (void)resume
{
}

- (__IMDPersistenceServiceListenerImpl)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end