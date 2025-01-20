@interface DOCProgressCollectionListViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)preferredContentSize;
- (_TtC17RecentsAppPopover39DOCProgressCollectionListViewController)init;
- (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView)primaryScrollView;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DOCProgressCollectionListViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1003D8498();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003D8AFC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1003D8D94(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCProgressCollectionListViewController(0);
  v4 = (char *)v7.receiver;
  [(DOCViewController *)&v7 viewWillDisappear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC17RecentsAppPopover39DOCProgressCollectionListViewController_source + 8];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(char *, void, void, uint64_t, uint64_t))(v5 + 16))(v4, 0, 0, ObjectType, v5);
}

- (CGSize)preferredContentSize
{
  v2 = self;
  id v3 = sub_1003D8394();
  [v3 contentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCProgressCollectionListViewController(0);
  id v6 = v8.receiver;
  [(DOCProgressCollectionListViewController *)&v8 setEditing:v5 animated:v4];
  id v7 = sub_1003D8394();
  objc_msgSend(v7, "setEditing:", v5, v8.receiver, v8.super_class);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1004BBFB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BBF40();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView)primaryScrollView
{
  v2 = self;

  id v3 = sub_1003D8394();
  return (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView *)v3;
}

- (_TtC17RecentsAppPopover39DOCProgressCollectionListViewController)init
{
  CGSize result = (_TtC17RecentsAppPopover39DOCProgressCollectionListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = (char *)self
     + OBJC_IVAR____TtC17RecentsAppPopover39DOCProgressCollectionListViewController_cancelAccessoryDisplayedState;
  uint64_t v4 = sub_1004BD820();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover39DOCProgressCollectionListViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover39DOCProgressCollectionListViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover39DOCProgressCollectionListViewController_collectionViewTopConstraint));
  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover39DOCProgressCollectionListViewController_diffable);
}

@end