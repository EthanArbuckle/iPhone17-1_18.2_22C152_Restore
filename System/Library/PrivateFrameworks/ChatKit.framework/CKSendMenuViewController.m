@interface CKSendMenuViewController
- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5;
- (BOOL)isPresentingAudioRecordingQuickSend;
- (BOOL)prefersStatusBarHidden;
- (CKSendMenuViewController)initWithCoder:(id)a3;
- (CKSendMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CKSendMenuViewController)initWithPresentationContext:(id)a3;
- (CKSendMenuViewControllerDelegate)sendMenuViewControllerDelegate;
- (NSArray)accessibilityCustomActions;
- (void)_handleReorderingGesture:(id)a3;
- (void)anchorViewDidMove;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionViewBackgroundTapped:(id)a3;
- (void)loadView;
- (void)performFullScreenDismissAnimationWithCompletion:(id)a3;
- (void)pluginIconUpdatedWithNotification:(id)a3;
- (void)rePresentSendMenu;
- (void)scrollViewDidScroll:(id)a3;
- (void)setIsPresentingAudioRecordingQuickSend:(BOOL)a3;
- (void)setSendMenuViewControllerDelegate:(id)a3;
- (void)updatePreferredContentSize;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKSendMenuViewController

- (CKSendMenuViewControllerDelegate)sendMenuViewControllerDelegate
{
  v2 = (char *)self + OBJC_IVAR___CKSendMenuViewController_sendMenuViewControllerDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKSendMenuViewControllerDelegate *)v3;
}

- (void)setSendMenuViewControllerDelegate:(id)a3
{
}

- (BOOL)isPresentingAudioRecordingQuickSend
{
  v2 = (BOOL *)self + OBJC_IVAR___CKSendMenuViewController_isPresentingAudioRecordingQuickSend;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPresentingAudioRecordingQuickSend:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKSendMenuViewController_isPresentingAudioRecordingQuickSend;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (CKSendMenuViewController)initWithPresentationContext:(id)a3
{
  return (CKSendMenuViewController *)SendMenuViewController.init(presentationContext:)((uint64_t)a3);
}

- (CKSendMenuViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F5A6E90();
}

- (void)loadView
{
  v2 = self;
  id v3 = sub_18F59F6CC();
  [(CKSendMenuViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18F59FD0C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_18F5A0828(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SendMenuViewController();
  v4 = v5.receiver;
  [(CKSendMenuViewController *)&v5 viewDidAppear:v3];
  if ((v4[OBJC_IVAR___CKSendMenuViewController_hasPerformedInitialContentAppearance] & 1) == 0)
  {
    v4[OBJC_IVAR___CKSendMenuViewController_hasPerformedInitialContentAppearance] = 1;
    sub_18F5A09D8(1);
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_18F5A0F10();
}

- (void)updatePreferredContentSize
{
  v2 = self;
  sub_18F5A2A3C();
}

- (void)rePresentSendMenu
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922A9F0);
  MEMORY[0x1F4188790](v3 - 8);
  objc_super v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_18F7B6220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR___CKSendMenuViewController_activeDismissAnimationIdentifier;
  swift_beginAccess();
  v8 = self;
  sub_18F5A7124((uint64_t)v5, (uint64_t)v7);
  swift_endAccess();
  v9 = (char *)sub_18F59F6CC();
  v10 = &v9[OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting];
  swift_beginAccess();
  char *v10 = 1;

  sub_18F5A09D8(0);
}

- (void)performFullScreenDismissAnimationWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    objc_super v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_18F4D11F0;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_18F5A32C8((uint64_t)v7, v6);
  sub_18EF6E880((uint64_t)v7);
}

- (void)pluginIconUpdatedWithNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_18F5A5858(v4);
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  char v3 = sub_18F5A5D70();

  return v3 & 1;
}

- (void)collectionViewBackgroundTapped:(id)a3
{
  objc_super v5 = (char *)self + OBJC_IVAR___CKSendMenuViewController_sendMenuViewControllerDelegate;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x192FBC390](v5);
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = a3;
    v9 = self;
    objc_msgSend(v7, sel_sendMenuViewControllerRequestDismiss_, v9);

    swift_unknownObjectRelease();
  }
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  id v3 = sub_18F5A60DC();

  if (v3)
  {
    sub_18EF3528C(0, &qword_1E923BDE8);
    id v4 = (void *)sub_18F7B99A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)anchorViewDidMove
{
  v2 = self;
  sub_18F5A64F4();
}

- (CKSendMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CKSendMenuViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CKSendMenuViewController_contentProvider);
  swift_unknownObjectRelease();
  sub_18EF27FE8((uint64_t)self + OBJC_IVAR___CKSendMenuViewController_activeDismissAnimationIdentifier, (uint64_t *)&unk_1E922A9F0);
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKSendMenuViewController_sendMenuViewControllerDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___sendMenuCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController_collectionViewDismissingLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___sendMenuDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController____lazy_storage___sendMenuParentView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController_collectionViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSendMenuViewController_collectionViewBottomConstraint));

  swift_bridgeObjectRelease();
}

- (void)_handleReorderingGesture:(id)a3
{
  id v4 = (UILongPressGestureRecognizer *)a3;
  objc_super v5 = self;
  SendMenuViewController.handleReorderingGesture(_:)(v4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_18F7B6410();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  id v10 = a3;
  uint64_t v11 = self;
  SendMenuViewController.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  SendMenuViewController.updateVisibleCellsForScrollPosition()();
}

- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5
{
  return 0;
}

@end