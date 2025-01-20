@interface CKTapbackPickerViewController
- (CKTapbackPickerViewController)initWithChatItem:(id)a3;
- (CKTapbackPickerViewController)initWithCoder:(id)a3;
- (CKTapbackPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CKTapbackPickerViewControllerDelegate)tapbackPickerViewControllerDelegate;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)setTapbackPickerViewControllerDelegate:(id)a3;
- (void)tapbackPickerCellCenterPointDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CKTapbackPickerViewController

- (CKTapbackPickerViewControllerDelegate)tapbackPickerViewControllerDelegate
{
  v2 = (char *)self + OBJC_IVAR___CKTapbackPickerViewController_tapbackPickerViewControllerDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKTapbackPickerViewControllerDelegate *)v3;
}

- (void)setTapbackPickerViewControllerDelegate:(id)a3
{
}

- (CKTapbackPickerViewController)initWithChatItem:(id)a3
{
  return (CKTapbackPickerViewController *)TapbackPickerViewController.init(chatItem:)((uint64_t)a3);
}

- (CKTapbackPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F5AE194();
}

- (void)loadView
{
  id v3 = self;
  id v2 = sub_18F5ABAE0();
  [(CKTapbackPickerViewController *)v3 setView:v2];
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_18F5ABFB0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerViewController();
  id v4 = v5.receiver;
  [(CKTapbackPickerViewController *)&v5 viewDidAppear:v3];
  sub_18F645EDC(0.0);
}

- (void)tapbackPickerCellCenterPointDidChange:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_18F5AD074(v5);
}

- (CKTapbackPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CKTapbackPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_contentProvider);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_tapbackPickerViewControllerDelegate);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_tapbackPickerViewControllerEmojiKeyboardCellDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_gradientReferenceView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController____lazy_storage___collectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController_collectionViewTopConstraint));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKTapbackPickerViewController_collectionViewBottomConstraint);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_18F7B6410();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  id v10 = a3;
  v11 = self;
  TapbackPickerViewController.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TapbackPickerViewController.updateVisibleCellsForScrollPosition()();
  sub_18F5ACEE4();
  sub_18F5AC90C();
}

@end