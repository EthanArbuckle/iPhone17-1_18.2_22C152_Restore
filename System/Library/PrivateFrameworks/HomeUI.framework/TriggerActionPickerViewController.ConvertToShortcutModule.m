@interface TriggerActionPickerViewController.ConvertToShortcutModule
- (_TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule)initWithItemUpdater:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation TriggerActionPickerViewController.ConvertToShortcutModule

- (id)buildItemProviders
{
  v2 = self;
  uint64_t v3 = sub_1BE45A7C4();

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
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE3A253C();
  uint64_t v4 = sub_1BE9C4E88();
  v5 = self;
  sub_1BE45AC90(v4);

  swift_bridgeObjectRelease();
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EBA45730);
  v6 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule)initWithItemUpdater:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BE37E904((uint64_t)self + OBJC_IVAR____TtCC6HomeUI33TriggerActionPickerViewController23ConvertToShortcutModule_delegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end