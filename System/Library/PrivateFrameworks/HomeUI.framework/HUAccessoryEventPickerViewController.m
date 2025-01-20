@interface HUAccessoryEventPickerViewController
- (HFCharacteristicEventBuilderItem)eventBuilderItem;
- (HFEventTriggerBuilder)triggerBuilder;
- (HUAccessoryEventPickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 delegate:(id)a7;
- (HUAccessoryEventPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUTriggerEditorDelegate)delegate;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)filter;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (unint64_t)mode;
- (unint64_t)source;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)nextWithSender:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)validateNextButton;
- (void)viewDidLoad;
@end

@implementation HUAccessoryEventPickerViewController

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return (HFCharacteristicEventBuilderItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                     + OBJC_IVAR___HUAccessoryEventPickerViewController_eventBuilderItem));
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return (HFEventTriggerBuilder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                          + OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder));
}

- (unint64_t)mode
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                             + OBJC_IVAR___HUAccessoryEventPickerViewController_mode);
}

- (unint64_t)source
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                             + OBJC_IVAR___HUAccessoryEventPickerViewController_source);
}

- (HUTriggerEditorDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HUAccessoryEventPickerViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUTriggerEditorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (id)filter
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BE43FDA8;
    aBlock[3] = &block_descriptor_30_1;
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1BE3B21C0(v7);
}

- (HUAccessoryEventPickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 delegate:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  swift_unknownObjectRetain();
  return (HUAccessoryEventPickerViewController *)AccessoryEventPickerViewController.init(eventBuilderItem:triggerBuilder:mode:source:delegate:)(v10, v11, a5, a6);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE5A13E4();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_1BE9C11A8();
  v13 = (objc_class *)type metadata accessor for AccessoryEventPickerViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  [(HUItemCollectionViewController *)&v14 collectionView:v10 didSelectItemAtIndexPath:v12];

  sub_1BE5A1A48();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1BE5A2A3C(v4);

  return v6;
}

- (void)validateNextButton
{
  v2 = self;
  sub_1BE5A1A48();
}

- (void)nextWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE5A1C88();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_1BE9C1208();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
      v18 = (objc_class *)type metadata accessor for AccessoryEventPickerViewController();
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

- (HUAccessoryEventPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUAccessoryEventPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_accessoryElementModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_selectionController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_eventBuilderItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryEventPickerViewController_triggerBuilder));
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUAccessoryEventPickerViewController_delegate);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___HUAccessoryEventPickerViewController_filter);

  sub_1BE3B21C0(v3);
}

@end