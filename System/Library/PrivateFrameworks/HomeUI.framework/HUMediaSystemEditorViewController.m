@interface HUMediaSystemEditorViewController
- (HFMediaSystemBuilder)mediaSystemBuilder;
- (HUMediaSystemEditorViewController)initWithAccessories:(id)a3 home:(id)a4;
- (HUMediaSystemEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HUMediaSystemEditorViewController)initWithMediaSystemBuilder:(id)a3 staticAccessories:(id)a4;
- (HUMediaSystemEditorViewControllerDelegate)delegate;
- (HUPresentationDelegate)presentationDelegate;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)createMediaSystem;
- (id)initUsingCompositionalLayoutWithItemManager:(id)a3;
- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (void)cancelWithSender:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)createMediaSystemWithAccessory:(id)a3;
- (void)doneWithSender:(id)a3;
- (void)mediaSystemEditorHelper:(id)a3 didAbortForAccessoryNeedingUpdate:(id)a4;
- (void)mediaSystemEditorHelper:(id)a3 didModifyMediaSystemBuilder:(id)a4;
- (void)mediaSystemEditorHelper:(id)a3 needsToPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)mediaSystemEditorHelperDidBeginCommitting:(id)a3;
- (void)mediaSystemEditorHelperDidEndCommitting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUMediaSystemEditorViewController

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)sub_1BE37FDD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUMediaSystemEditorViewControllerDelegate)delegate
{
  return (HUMediaSystemEditorViewControllerDelegate *)sub_1BE37FDD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUMediaSystemEditorViewController_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return (HFMediaSystemBuilder *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.super.super.isa
                                                                           + OBJC_IVAR___HUMediaSystemEditorViewController_selectionController))[2]);
}

- (HUMediaSystemEditorViewController)initWithAccessories:(id)a3 home:(id)a4
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA45DD0);
  sub_1BE3A1734((unint64_t *)&unk_1EA114650, (unint64_t *)&qword_1EBA45DD0);
  uint64_t v6 = sub_1BE9C4E88();
  id v7 = objc_allocWithZone(MEMORY[0x1E4F692C8]);
  id v8 = a4;
  id v9 = objc_msgSend(v7, sel_initWithHome_, v8);
  sub_1BE5A9F80(v6, v9);
  v10 = (void *)sub_1BE9C4E58();
  swift_bridgeObjectRelease();
  v11 = [(HUMediaSystemEditorViewController *)self initWithMediaSystemBuilder:v9 staticAccessories:v10];

  return v11;
}

- (HUMediaSystemEditorViewController)initWithMediaSystemBuilder:(id)a3 staticAccessories:(id)a4
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA45DD0);
  sub_1BE3A1734((unint64_t *)&unk_1EA114650, (unint64_t *)&qword_1EBA45DD0);
  uint64_t v5 = sub_1BE9C4E88();
  return (HUMediaSystemEditorViewController *)MediaSystemEditorViewController.init(mediaSystemBuilder:staticAccessories:)(a3, v5);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BE5A7B68();
}

- (void)createMediaSystemWithAccessory:(id)a3
{
  id v4 = a3;
  id v9 = self;
  id v5 = sub_1BE5A7118();
  id v6 = objc_msgSend(v5, sel_createMediaSystemWithAccessory_, v4);

  if (v6)
  {
    id v7 = (HUMediaSystemEditorViewController *)objc_msgSend(v6, sel_asGeneric);
    id v8 = sub_1BE5A80D4(v7);

    id v4 = v8;
    id v9 = v7;
  }
}

- (id)createMediaSystem
{
  v2 = self;
  id v3 = sub_1BE5A7118();
  id v4 = objc_msgSend(v3, sel_createMediaSystem);

  id v5 = objc_msgSend(v4, sel_asGeneric);
  id v6 = sub_1BE5A80D4(v5);

  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)sub_1BE5AA35C(v4);

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
  v11 = self;
  v12 = (void *)sub_1BE9C11A8();
  v13 = (objc_class *)type metadata accessor for MediaSystemEditorViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  [(HUItemCollectionViewController *)&v14 collectionView:v10 didSelectItemAtIndexPath:v12];

  sub_1BE5A8948();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
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
      v18 = (objc_class *)type metadata accessor for MediaSystemEditorViewController();
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

- (HUMediaSystemEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HUMediaSystemEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate);
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUMediaSystemEditorViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUMediaSystemEditorViewController_accessoryModule));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___HUMediaSystemEditorViewController____lazy_storage___helper);
}

- (void)cancelWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  id v5 = (char *)v4 + OBJC_IVAR___HUMediaSystemEditorViewController_presentationDelegate;
  swift_beginAccess();
  id v6 = (void *)MEMORY[0x1C1898E00](v5);
  if (v6)
  {
    uint64_t v7 = (HUMediaSystemEditorViewController *)objc_msgSend(v6, sel_finishPresentation_animated_, v4, 1);

    swift_unknownObjectRelease();
    id v4 = v7;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)doneWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  id v5 = sub_1BE5A7118();
  id v6 = objc_msgSend(v5, sel_createMediaSystem);

  id v7 = objc_msgSend(v6, sel_asGeneric);
  id v8 = sub_1BE5A80D4(v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
}

- (void)mediaSystemEditorHelperDidBeginCommitting:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s6HomeUI31MediaSystemEditorViewControllerC05mediadE24HelperDidBeginCommittingyySo07HUMediadeI0CF_0();
}

- (void)mediaSystemEditorHelperDidEndCommitting:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE5A7D08();
  id v6 = [(HUMediaSystemEditorViewController *)v5 view];
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_setUserInteractionEnabled_, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)mediaSystemEditorHelper:(id)a3 didModifyMediaSystemBuilder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = [(HUItemCollectionViewController *)v8 itemManager];
  [(HFItemManager *)v9 recalculateVisibilityAndSortAllItems];
}

- (void)mediaSystemEditorHelper:(id)a3 needsToPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v10 = _Block_copy(a6);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    uint64_t v10 = sub_1BE5AA99C;
    v19[4] = sub_1BE5AA99C;
    v19[5] = v11;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 1107296256;
    v19[2] = sub_1BE3B2FEC;
    v19[3] = &block_descriptor_31;
    uint64_t v12 = _Block_copy(v19);
    id v13 = a3;
    id v14 = a4;
    v15 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    id v16 = a3;
    id v17 = a4;
    v18 = self;
    uint64_t v12 = 0;
  }
  [(HUMediaSystemEditorViewController *)self presentViewController:a4 animated:v6 completion:v12];
  _Block_release(v12);
  sub_1BE3B21C0((uint64_t)v10);
}

- (void)mediaSystemEditorHelper:(id)a3 didAbortForAccessoryNeedingUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1BE5AA64C((uint64_t)v7);
}

@end