@interface IMCoreHelloWorldClass_Impl
- (IMCoreHelloWorldClass_Impl)init;
- (void)printGreeting;
@end

@implementation IMCoreHelloWorldClass_Impl

- (IMCoreHelloWorldClass_Impl)init
{
  uint64_t v3 = OBJC_IVAR___IMCoreHelloWorldClass_Impl_sharedUtilitiesHelloWorld;
  id v4 = objc_allocWithZone((Class)sub_1A4CBAF7C());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR___IMCoreHelloWorldClass_Impl_persistenceHelloWorld;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)sub_1A4CBAF2C()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for IMCoreHelloWorldClass();
  return [(IMCoreHelloWorldClass_Impl *)&v8 init];
}

- (void)printGreeting
{
  v2 = self;
  sub_1A4CBAF6C();
  sub_1A4CBAF1C();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMCoreHelloWorldClass_Impl_persistenceHelloWorld);
}

@end