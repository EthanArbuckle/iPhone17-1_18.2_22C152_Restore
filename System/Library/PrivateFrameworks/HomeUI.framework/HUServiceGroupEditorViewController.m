@interface HUServiceGroupEditorViewController
+ (id)forCreatingNewServiceGroupWithServices:(id)a3 inHome:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)shouldShowHeaderForSection:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUPresentationDelegate)presentationDelegate;
- (HUServiceGroupEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUServiceGroupEditorViewController)initWithServiceGroupBuilder:(id)a3;
- (HUServiceGroupEditorViewControllerDelegate)serviceGroupEditorDelegate;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)displayedItemsInSection:(id)a3;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (void)cancelWithSender:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)doneWithSender:(id)a3;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setServiceGroupEditorDelegate:(id)a3;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textFieldDidEndEditing:(id)a3 item:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUServiceGroupEditorViewController

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)sub_1BE37FDD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUServiceGroupEditorViewController_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUServiceGroupEditorViewControllerDelegate)serviceGroupEditorDelegate
{
  return (HUServiceGroupEditorViewControllerDelegate *)sub_1BE37FDD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUServiceGroupEditorViewController_serviceGroupEditorDelegate);
}

- (void)setServiceGroupEditorDelegate:(id)a3
{
}

+ (id)forCreatingNewServiceGroupWithServices:(id)a3 inHome:(id)a4
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EA112220);
  unint64_t v5 = sub_1BE9C4C18();
  id v6 = a4;
  v7 = (void *)_s6HomeUI32ServiceGroupEditorViewControllerC014forCreatingNewcD04with2inACXDSaySo9HMServiceCG_So6HMHomeCtFZ_0(v5, (uint64_t)v6);

  swift_bridgeObjectRelease();

  return v7;
}

- (HUServiceGroupEditorViewController)initWithServiceGroupBuilder:(id)a3
{
  return (HUServiceGroupEditorViewController *)ServiceGroupEditorViewController.init(serviceGroupBuilder:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE380394();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1BE3805E0(a3);
}

- (void)doneWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE3809E0((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (void)cancelWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  unint64_t v5 = (char *)v4 + OBJC_IVAR___HUServiceGroupEditorViewController_presentationDelegate;
  swift_beginAccess();
  id v6 = (void *)MEMORY[0x1C1898E00](v5);
  if (v6)
  {
    v7 = (HUServiceGroupEditorViewController *)objc_msgSend(v6, sel_finishPresentation_animated_, v4, 1);

    swift_unknownObjectRelease();
    v4 = v7;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1BE3813C4(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  v11 = self;
  sub_1BE3817A8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  uint64_t v6 = (void *)sub_1BE382E04(v4);

  return v6;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  uint64_t v8 = sub_1BE9C49F8();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___HUServiceGroupEditorViewController_editingName);
  uint64_t *v9 = v8;
  v9[1] = v10;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  sub_1BE9C36A8();
  swift_bridgeObjectRelease();
  sub_1BE380714();

  swift_bridgeObjectRelease();
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1BE382FF4(v6);
}

- (void)itemManagerDidUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ServiceGroupEditorViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(HUItemCollectionViewController *)&v6 itemManagerDidUpdate:v4];
  sub_1BE380714();
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
      v18 = (objc_class *)type metadata accessor for ServiceGroupEditorViewController();
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

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_1BE9C11A8();
  uint64_t v13 = (objc_class *)type metadata accessor for ServiceGroupEditorViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  [(HUItemCollectionViewController *)&v14 collectionView:v10 didSelectItemAtIndexPath:v12];

  sub_1BE380714();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BE9C1208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C11B8();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_1BE3831FC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (id)displayedItemsInSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  uint64_t v5 = [(HUItemCollectionViewController *)v4 itemManager];
  uint64_t v6 = [(HUItemCollectionViewController *)v4 itemManager];
  uint64_t v7 = (void *)sub_1BE9C49B8();
  id v8 = [(HFItemManager *)v6 sectionIndexForDisplayedSectionIdentifier:v7];

  id v9 = [(HFItemManager *)v5 displayedItemsInSection:v8];
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  sub_1BE9C4C18();

  swift_bridgeObjectRelease();
  id v10 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v10;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  sub_1BE9C49F8();
  id v4 = self;
  BOOL v5 = sub_1BE382240();

  swift_bridgeObjectRelease();
  return v5;
}

- (HUServiceGroupEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUServiceGroupEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUServiceGroupEditorViewController_presentationDelegate);
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUServiceGroupEditorViewController_serviceGroupEditorDelegate);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUServiceGroupEditorViewController____lazy_storage___collectionLayoutManager);
}

@end