@interface ActionGridItemModule
- (id)buildItemProviders;
- (void)actionSetValueSource:(id)a3 didUpdateValuesForActionBuilders:(id)a4;
@end

@implementation ActionGridItemModule

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE59B248();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
    sub_1BE3C9854((unint64_t *)&qword_1EBA45760, (uint64_t *)&unk_1EBA45750);
    v4 = (void *)sub_1BE9C4E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)actionSetValueSource:(id)a3 didUpdateValuesForActionBuilders:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1121B0);
  sub_1BE3C9854((unint64_t *)&qword_1EA1175C0, (uint64_t *)&unk_1EA1121B0);
  uint64_t v6 = sub_1BE9C4E88();
  if (MEMORY[0x1C1898E00]((char *)self + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate))
  {
    id v7 = a3;
    v8 = self;
    sub_1BE37CF70(v6);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_actionBuilderContainer);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6HomeUI20ActionGridItemModule_delegate;

  sub_1BE37E904((uint64_t)v3);
}

@end