@interface HUAccessoryRepresentableItemModuleContext
- (BOOL)hideSourceItemDescriptions;
- (BOOL)showFooter;
- (HFAccessoryLikeObjectContainer)accessoryContainer;
- (HFCharacteristicValueSource)valueSource;
- (HUAccessoryRepresentableItemModuleContext)init;
- (HUAccessoryRepresentableItemModuleContext)initWithObjectLevel:(unint64_t)a3 accessoryContainer:(id)a4 sectionGroupingType:(int64_t)a5 hideSourceItemDescriptions:(BOOL)a6 showFooter:(BOOL)a7 valueSource:(id)a8 filter:(id)a9 itemFilter:(id)a10;
- (id)filter;
- (id)itemFilter;
- (int64_t)sectionGroupingType;
- (unint64_t)objectLevel;
- (void)setAccessoryContainer:(id)a3;
- (void)setFilter:(id)a3;
- (void)setHideSourceItemDescriptions:(BOOL)a3;
- (void)setItemFilter:(id)a3;
- (void)setObjectLevel:(unint64_t)a3;
- (void)setSectionGroupingType:(int64_t)a3;
- (void)setShowFooter:(BOOL)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HUAccessoryRepresentableItemModuleContext

- (unint64_t)objectLevel
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_objectLevel);
  swift_beginAccess();
  return *v2;
}

- (void)setObjectLevel:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_objectLevel);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (HFAccessoryLikeObjectContainer)accessoryContainer
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HFAccessoryLikeObjectContainer *)v2;
}

- (void)setAccessoryContainer:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_accessoryContainer);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)sectionGroupingType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_sectionGroupingType);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionGroupingType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_sectionGroupingType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)hideSourceItemDescriptions
{
  v2 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_hideSourceItemDescriptions;
  swift_beginAccess();
  return *v2;
}

- (void)setHideSourceItemDescriptions:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_hideSourceItemDescriptions;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)showFooter
{
  v2 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_showFooter;
  swift_beginAccess();
  return *v2;
}

- (void)setShowFooter:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_showFooter;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (HFCharacteristicValueSource)valueSource
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HFCharacteristicValueSource *)v2;
}

- (void)setValueSource:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_valueSource);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)filter
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BE43F11C;
    aBlock[3] = &block_descriptor_64;
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
    v4 = sub_1BE446D8C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1BE3B21C0(v7);
}

- (id)itemFilter
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_itemFilter);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BE4401F0;
    aBlock[3] = &block_descriptor_11;
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

- (void)setItemFilter:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1BE446D8C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_itemFilter);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1BE3B21C0(v7);
}

- (HUAccessoryRepresentableItemModuleContext)init
{
  return (HUAccessoryRepresentableItemModuleContext *)AccessoryRepresentableItemModule.Context.init()();
}

- (HUAccessoryRepresentableItemModuleContext)initWithObjectLevel:(unint64_t)a3 accessoryContainer:(id)a4 sectionGroupingType:(int64_t)a5 hideSourceItemDescriptions:(BOOL)a6 showFooter:(BOOL)a7 valueSource:(id)a8 filter:(id)a9 itemFilter:(id)a10
{
  v15 = _Block_copy(a9);
  v16 = (uint64_t (*)())_Block_copy(a10);
  v17 = v16;
  if (!v15)
  {
    v19 = 0;
    uint64_t v18 = 0;
    if (v16) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v20 = 0;
    goto LABEL_6;
  }
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  v19 = sub_1BE446C60;
  if (!v17) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  v17 = sub_1BE446D8C;
LABEL_6:
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v21 = (HUAccessoryRepresentableItemModuleContext *)sub_1BE4469CC(a3, (uint64_t)a4, a5, a6, a7, (uint64_t)a8, (uint64_t)v19, v18, (uint64_t)v17, v20, self);
  sub_1BE3B21C0((uint64_t)v17);
  sub_1BE3B21C0((uint64_t)v19);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v21;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1BE3B21C0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_itemFilter);

  sub_1BE3B21C0(v3);
}

@end