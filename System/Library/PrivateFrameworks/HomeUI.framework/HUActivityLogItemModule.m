@interface HUActivityLogItemModule
- (HUActivityLogItemModule)initWithHome:(id)a3 itemUpdater:(id)a4;
- (HUActivityLogItemModule)initWithItemUpdater:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation HUActivityLogItemModule

- (HUActivityLogItemModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = (HUActivityLogItemModule *)sub_1BE484AF8(v5, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v6;
}

- (HUActivityLogItemModule)initWithItemUpdater:(id)a3
{
  swift_unknownObjectRetain();
  sub_1BE9C5848();
  swift_bridgeObjectRelease();
  result = (HUActivityLogItemModule *)sub_1BE9C5A78();
  __break(1u);
  return result;
}

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE483E70();

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
  sub_1BE484CCC();

  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v4 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v4;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActivityLogItemModule_home);
}

@end