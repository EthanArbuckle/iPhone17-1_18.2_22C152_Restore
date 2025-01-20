@interface HUActionSetItemModule
+ (NSString)actionSetSectionIdentifier;
- (HFActionSetItemProvider)actionSetItemProvider;
- (HMHome)home;
- (HUActionSetItemModule)initWithHome:(id)a3 itemUpdater:(id)a4;
- (HUActionSetItemModule)initWithItemUpdater:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)filter;
- (id)sortBlock;
- (unint64_t)actionSetItemStyle;
- (void)setActionSetItemProvider:(id)a3;
- (void)setActionSetItemStyle:(unint64_t)a3;
- (void)setFilter:(id)a3;
- (void)setSortBlock:(id)a3;
@end

@implementation HUActionSetItemModule

+ (NSString)actionSetSectionIdentifier
{
  v2 = (void *)sub_1BE9C49B8();

  return (NSString *)v2;
}

- (unint64_t)actionSetItemStyle
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_actionSetItemStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setActionSetItemStyle:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_actionSetItemStyle);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (HMHome)home
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR___HUActionSetItemModule_home));
}

- (id)filter
{
  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_filter);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BE4401F0;
    aBlock[3] = &block_descriptor_20;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFilter:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1BE446C60;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_filter);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1BE3B21C0(v7);
}

- (id)sortBlock
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_sortBlock);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BE572B94;
  aBlock[3] = &block_descriptor_14;
  uint64_t v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();

  return v5;
}

- (void)setSortBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___HUActionSetItemModule_sortBlock);
  swift_beginAccess();
  uint64_t *v6 = sub_1BE5748A4;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (HFActionSetItemProvider)actionSetItemProvider
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemProvider);
  swift_beginAccess();
  return (HFActionSetItemProvider *)*v2;
}

- (void)setActionSetItemProvider:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemProvider);
  swift_beginAccess();
  uint64_t v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (HUActionSetItemModule)initWithItemUpdater:(id)a3
{
}

- (HUActionSetItemModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemStyle) = 0;
  id v6 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_filter);
  void *v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (BOOL (**)(void *, void *))((char *)self + OBJC_IVAR___HUActionSetItemModule_sortBlock);
  *uint64_t v7 = sub_1BE572A08;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemProvider) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_home) = (Class)a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ActionSetItemModule();
  id v8 = a3;
  return [(HFItemModule *)&v10 initWithItemUpdater:a4];
}

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE573080();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
    sub_1BE3A271C();
    uint64_t v4 = (void *)sub_1BE9C4E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  sub_1BE9C4E88();
  uint64_t v4 = self;
  sub_1BE573370();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  uint64_t v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (void).cxx_destruct
{
  sub_1BE3B21C0(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_filter));
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemProvider);
}

@end