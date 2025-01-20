@interface IMSharedUtilitiesHelloWorldClass
- (IMSharedUtilitiesHelloWorldClass)init;
- (void)printGreeting;
@end

@implementation IMSharedUtilitiesHelloWorldClass

- (IMSharedUtilitiesHelloWorldClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMSharedUtilitiesHelloWorldClass;
  v2 = [(IMSharedUtilitiesHelloWorldClass *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IMSharedUtilitiesHelloWorldClass_Impl);
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