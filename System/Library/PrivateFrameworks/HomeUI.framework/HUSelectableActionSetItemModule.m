@interface HUSelectableActionSetItemModule
- (HUSelectableActionSetItemModule)initWithHome:(id)a3 itemUpdater:(id)a4;
- (NSString)sceneSectionHeaderTitle;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)setSceneSectionHeaderTitle:(id)a3;
@end

@implementation HUSelectableActionSetItemModule

- (NSString)sceneSectionHeaderTitle
{
  v2 = (char *)self + OBJC_IVAR___HUSelectableActionSetItemModule_sceneSectionHeaderTitle;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    sub_1BE9C36A8();
    v3 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setSceneSectionHeaderTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1BE9C49F8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUSelectableActionSetItemModule_sceneSectionHeaderTitle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE3F702C();

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
  sub_1BE3F735C();

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  uint64_t v5 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v5;
}

- (HUSelectableActionSetItemModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = (HUSelectableActionSetItemModule *)sub_1BE3F7CD8(v5, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end