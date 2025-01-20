@interface IMDPersistenceHelloWorldClass_Impl
- (IMDPersistenceHelloWorldClass_Impl)init;
- (void)printGreeting;
@end

@implementation IMDPersistenceHelloWorldClass_Impl

- (IMDPersistenceHelloWorldClass_Impl)init
{
  uint64_t v3 = OBJC_IVAR___IMDPersistenceHelloWorldClass_Impl_inner;
  id v4 = objc_allocWithZone((Class)sub_1AFC71BA8());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for IMDPersistenceHelloWorldClass();
  return [(IMDPersistenceHelloWorldClass_Impl *)&v7 init];
}

- (void)printGreeting
{
  v2 = self;
  sub_1AFC71B98();
}

- (void).cxx_destruct
{
}

@end