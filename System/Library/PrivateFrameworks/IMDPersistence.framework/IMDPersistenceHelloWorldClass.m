@interface IMDPersistenceHelloWorldClass
- (IMDPersistenceHelloWorldClass)init;
- (void)printGreeting;
@end

@implementation IMDPersistenceHelloWorldClass

- (IMDPersistenceHelloWorldClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDPersistenceHelloWorldClass;
  v2 = [(IMDPersistenceHelloWorldClass *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IMDPersistenceHelloWorldClass_Impl);
    swiftImpl = v2->_swiftImpl;
    v2->_swiftImpl = v3;
  }
  return v2;
}

- (void)printGreeting
{
}

- (void).cxx_destruct
{
}

@end