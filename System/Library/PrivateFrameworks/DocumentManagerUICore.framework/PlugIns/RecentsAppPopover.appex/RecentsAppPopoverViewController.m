@interface RecentsAppPopoverViewController
- (BOOL)canLoadAdditionalParents;
- (BOOL)infoPanelPreviewingMultipleItems;
- (BOOL)isBrowserCurrentLocation:(id)a3;
- (_TtC17RecentsAppPopover31RecentsAppPopoverViewController)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover31RecentsAppPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)pickerOperationFor:(id)a3;
- (void)beginLoadingAdditionalParents:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6;
- (void)loadView;
- (void)updateForBundleIdentifier:(id)a3;
- (void)updateForWidgetConfiguration:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RecentsAppPopoverViewController

- (void)loadView
{
  v2 = self;
  id v3 = sub_1003D2B1C();
  [(RecentsAppPopoverViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(RecentsAppPopoverViewController *)&v3 viewDidLoad];
  objc_msgSend(v2, "setViewRespectsSystemMinimumLayoutMargins:", 0, v3.receiver, v3.super_class);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = self;
    id v7 = [v5 layer];
    [v7 setHitTestsAsOpaque:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003D2CF0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1003D30DC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(RecentsAppPopoverViewController *)&v5 viewDidDisappear:v3];
  sub_1003D3334();
  objc_msgSend(self, "suspendAllQueries", v5.receiver, v5.super_class);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1003D37CC(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1003D3C9C(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(RecentsAppPopoverViewController *)&v3 viewWillLayoutSubviews];
  sub_1003D4388();
}

- (_TtC17RecentsAppPopover31RecentsAppPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1004BEB10();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC17RecentsAppPopover31RecentsAppPopoverViewController *)sub_1003D45A0(v5, v7, a4);
}

- (_TtC17RecentsAppPopover31RecentsAppPopoverViewController)initWithCoder:(id)a3
{
  return (_TtC17RecentsAppPopover31RecentsAppPopoverViewController *)sub_1003D4734(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover31RecentsAppPopoverViewController_itemCollectionViewController));
  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover31RecentsAppPopoverViewController_dropSessionDidExitObserverToken, (uint64_t *)&unk_100618730);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover31RecentsAppPopoverViewController_actionManager));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover31RecentsAppPopoverViewController____lazy_storage___platterView);
}

- (void)updateForBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1004BEB10();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  sub_1003D490C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)updateForWidgetConfiguration:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1003D787C(a3);
}

- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6
{
  v9 = self;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  id v13 = [v9 defaultManager];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  *(void *)(v14 + 24) = v10;
  v18[4] = sub_1003D756C;
  v18[5] = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_10011BBD4;
  v18[3] = &unk_1005C4F98;
  v15 = _Block_copy(v18);
  id v16 = v10;
  v17 = v12;
  swift_release();
  [v13 fetchURLForItem:v16 completionHandler:v15];
  _Block_release(v15);
}

- (BOOL)canLoadAdditionalParents
{
  return 0;
}

- (BOOL)isBrowserCurrentLocation:(id)a3
{
  return 0;
}

- (BOOL)infoPanelPreviewingMultipleItems
{
  return 0;
}

- (void)beginLoadingAdditionalParents:(id)a3
{
  objc_super v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (int64_t)pickerOperationFor:(id)a3
{
  return 0;
}

@end