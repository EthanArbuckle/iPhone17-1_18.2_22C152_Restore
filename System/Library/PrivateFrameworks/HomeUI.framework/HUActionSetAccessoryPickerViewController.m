@interface HUActionSetAccessoryPickerViewController
- (HFActionSetBuilder)actionSetBuilder;
- (HUActionSetAccessoryPickerViewController)initWithActionSetBuilder:(id)a3 delegate:(id)a4;
- (HUActionSetAccessoryPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (void)cancelWithSender:(id)a3;
- (void)doneWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUActionSetAccessoryPickerViewController

- (HFActionSetBuilder)actionSetBuilder
{
  return (HFActionSetBuilder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                       + OBJC_IVAR___HUActionSetAccessoryPickerViewController_actionSetBuilder));
}

- (HUActionSetAccessoryPickerViewController)initWithActionSetBuilder:(id)a3 delegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  return (HUActionSetAccessoryPickerViewController *)ActionSetAccessoryPickerViewController.init(actionSetBuilder:delegate:)(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE4C2B6C();
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1BE4C3780(v4);

  return v6;
}

- (void)cancelWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  v5 = (void *)MEMORY[0x1C1898E00]((char *)v4 + OBJC_IVAR___HUActionSetAccessoryPickerViewController_delegate);
  if (v5)
  {
    objc_msgSend(v5, sel_actionSetAccessoryPickerDidFinish_, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void)doneWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE4C2F10();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_1BE9C1208();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1BE9C49F8();
  uint64_t v11 = v10;
  sub_1BE9C11B8();
  if (v9 == sub_1BE9C49F8() && v11 == v12)
  {
    v20 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = sub_1BE9C5C28();
    v15 = self;
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      v16 = (void *)sub_1BE9C49B8();
      v17 = (void *)sub_1BE9C11A8();
      v18 = (objc_class *)type metadata accessor for ActionSetAccessoryPickerViewController();
      v22.receiver = v15;
      v22.super_class = v18;
      id v19 = [(HUItemCollectionViewController *)&v22 listContentConfigurationForSupplementaryElementOfKind:v16 atIndexPath:v17];

      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  if (qword_1EA111580 != -1) {
    swift_once();
  }
  id v19 = (id)qword_1EA1134B0;

  swift_bridgeObjectRelease();
LABEL_11:
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v19;
}

- (HUActionSetAccessoryPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUActionSetAccessoryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUActionSetAccessoryPickerViewController_accessoryElementModule));
  swift_release();
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUActionSetAccessoryPickerViewController_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUActionSetAccessoryPickerViewController_actionSetBuilder);
}

@end