@interface HUAccessoryRepresentableItemModule
- (HUAccessoryRepresentableItemModule)initWithContext:(id)a3 in:(id)a4 itemUpdater:(id)a5;
- (id)buildItemProviders;
@end

@implementation HUAccessoryRepresentableItemModule

- (HUAccessoryRepresentableItemModule)initWithContext:(id)a3 in:(id)a4 itemUpdater:(id)a5
{
  swift_getObjectType();
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain();

  return (HUAccessoryRepresentableItemModule *)sub_1BE4457C8(v9, v10, (uint64_t)a5, (char *)self);
}

- (id)buildItemProviders
{
  uint64_t v3 = MEMORY[0x1C1898E00]((char *)self + OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_home, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    unint64_t v6 = sub_1BE43EE84((uint64_t)v4);
    v7 = v5;
    id v8 = sub_1BE445964(v6, (uint64_t)v7);
    swift_bridgeObjectRelease();

    sub_1BE39D21C((unint64_t)v8);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
  sub_1BE3A271C();
  id v9 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();

  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___HUAccessoryRepresentableItemModule_accessoryItemProvider);
}

@end