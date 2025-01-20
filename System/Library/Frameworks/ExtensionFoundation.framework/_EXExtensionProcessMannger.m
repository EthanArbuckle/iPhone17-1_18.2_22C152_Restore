@interface _EXExtensionProcessMannger
- (_EXExtensionProcessMannger)init;
- (void)processDidInvalidate:(id)a3;
@end

@implementation _EXExtensionProcessMannger

- (_EXExtensionProcessMannger)init
{
  uint64_t v3 = OBJC_IVAR____EXExtensionProcessMannger_processExtensionMap;
  v4 = self;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_strongToWeakObjectsMapTable);
  uint64_t v6 = OBJC_IVAR____EXExtensionProcessMannger_processExtensionMapLock;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB27BE60);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)v7;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for _EXExtensionProcessMannger();
  return [(_EXExtensionProcessMannger *)&v9 init];
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)processDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  _EXExtensionProcessMannger.processDidInvalidate(_:)((uint64_t)v4);
}

@end