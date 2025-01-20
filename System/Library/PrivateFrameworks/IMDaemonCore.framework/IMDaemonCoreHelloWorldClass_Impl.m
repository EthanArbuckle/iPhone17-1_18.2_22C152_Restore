@interface IMDaemonCoreHelloWorldClass_Impl
- (IMDaemonCoreHelloWorldClass_Impl)init;
- (void)printGreeting;
@end

@implementation IMDaemonCoreHelloWorldClass_Impl

- (void)printGreeting
{
  v2 = self;
  sub_1D9906810();
  sub_1D99067C0();
}

- (IMDaemonCoreHelloWorldClass_Impl)init
{
  uint64_t v3 = OBJC_IVAR___IMDaemonCoreHelloWorldClass_Impl_sharedUtilitiesHelloWorld;
  id v4 = objc_allocWithZone((Class)sub_1D9906820());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR___IMDaemonCoreHelloWorldClass_Impl_persistenceHelloWorld;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)sub_1D99067D0()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for DaemonCoreHelloWorldClass();
  return [(IMDaemonCoreHelloWorldClass_Impl *)&v8 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDaemonCoreHelloWorldClass_Impl_persistenceHelloWorld);
}

@end