@interface FKNFHardwareStateChangeMonitor
- (_TtC10FinanceKit30FKNFHardwareStateChangeMonitor)init;
- (void)hardwareStateDidChange;
@end

@implementation FKNFHardwareStateChangeMonitor

- (void)hardwareStateDidChange
{
  v2 = self;
  sub_24394CD14();
}

- (_TtC10FinanceKit30FKNFHardwareStateChangeMonitor)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC10FinanceKit30FKNFHardwareStateChangeMonitor_implementation;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268DA3BA0);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 28) = 0;
  *(void *)(v5 + 16) = 0;
  *(unsigned char *)(v5 + 24) = 0;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(FKNFHardwareStateChangeMonitor *)&v7 init];
}

- (void).cxx_destruct
{
}

@end