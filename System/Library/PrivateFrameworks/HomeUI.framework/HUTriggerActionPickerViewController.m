@interface HUTriggerActionPickerViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUTriggerActionFlow)flow;
- (HUTriggerActionPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUTriggerActionPickerViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5;
- (HUTriggerActionPickerViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (HUTriggerEditorDelegate)delegate;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)triggerBuilder;
- (void)cancelWithSender:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5;
- (void)itemManagerDidUpdate:(id)a3;
- (void)nextWithSender:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUTriggerActionPickerViewController

- (id)triggerBuilder
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                 + OBJC_IVAR___HUTriggerActionPickerViewController_triggerBuilder));
}

- (HUTriggerActionFlow)flow
{
  return (HUTriggerActionFlow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                        + OBJC_IVAR___HUTriggerActionPickerViewController_flow));
}

- (HUTriggerEditorDelegate)delegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (HUTriggerEditorDelegate *)v2;
}

- (HUTriggerActionPickerViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9 = objc_allocWithZone((Class)HUTriggerActionFlow);
  id v10 = a3;
  swift_unknownObjectRetain();
  id v11 = objc_msgSend(v9, sel_initWithEditorMode_, a4);
  v12 = [(HUTriggerActionPickerViewController *)self initWithTriggerBuilder:v10 flow:v11 delegate:a5];

  swift_unknownObjectRelease();
  return v12;
}

- (HUTriggerActionPickerViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  return (HUTriggerActionPickerViewController *)TriggerActionPickerViewController.init(triggerBuilder:flow:delegate:)(v7, v8, (uint64_t)a5);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE3F1290();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TriggerActionPickerViewController();
  id v4 = v7.receiver;
  [(HUItemCollectionViewController *)&v7 viewDidAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, sel_isBeingDismissed) & 1) == 0) {
      sub_1BE3F1DBC();
    }
  }
  sub_1BE3F21BC();
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  id v11 = self;
  sub_1BE3F158C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = (void *)sub_1BE3F187C(v4);

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_1BE9C11A8();
  uint64_t v13 = (objc_class *)type metadata accessor for TriggerActionPickerViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  [(HUItemCollectionViewController *)&v14 collectionView:v10 didSelectItemAtIndexPath:v12];

  sub_1BE3F21BC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)cancelWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)((char *)&v4->super.super.super.super.super.super.isa+ OBJC_IVAR___HUTriggerActionPickerViewController_delegate), sel_triggerEditor_didFinishWithTriggerBuilder_, v4, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)nextWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE3F239C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)itemManagerDidUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TriggerActionPickerViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(HUItemCollectionViewController *)&v6 itemManagerDidUpdate:v4];
  sub_1BE3F21BC();
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
      v18 = (objc_class *)type metadata accessor for TriggerActionPickerViewController();
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

- (HUTriggerActionPickerViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUTriggerActionPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
                     + OBJC_IVAR___HUTriggerActionPickerViewController_actionSetModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUTriggerActionPickerViewController_accessoryModule));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUTriggerActionPickerViewController_triggerBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUTriggerActionPickerViewController_flow));

  swift_unknownObjectRelease();
}

- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5
{
  uint64_t v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUTriggerActionPickerViewController_triggerBuilder);
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = self;
  id v10 = objc_msgSend(v7, sel_triggerActionSets);
  objc_msgSend(v10, sel_setHomeWorkflow_, v9);

  sub_1BE3F2930();
}

@end