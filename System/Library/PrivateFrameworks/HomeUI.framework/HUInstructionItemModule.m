@interface HUInstructionItemModule
- (HUInstructionItemModule)initWithItemUpdater:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation HUInstructionItemModule

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE3A2178();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
    sub_1BE3A271C();
    v4 = (void *)sub_1BE9C4E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v3 = self;
  sub_1BE3A25A4();

  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v4 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v4;
}

- (HUInstructionItemModule)initWithItemUpdater:(id)a3
{
  swift_unknownObjectRetain();
  result = (HUInstructionItemModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end