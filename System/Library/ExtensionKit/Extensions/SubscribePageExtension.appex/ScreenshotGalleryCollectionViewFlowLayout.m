@interface ScreenshotGalleryCollectionViewFlowLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (_TtC22SubscribePageExtension41ScreenshotGalleryCollectionViewFlowLayout)init;
- (_TtC22SubscribePageExtension41ScreenshotGalleryCollectionViewFlowLayout)initWithCoder:(id)a3;
- (void)dealloc;
- (void)panGestureRecognizedBy:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)prepareLayout;
@end

@implementation ScreenshotGalleryCollectionViewFlowLayout

- (_TtC22SubscribePageExtension41ScreenshotGalleryCollectionViewFlowLayout)init
{
  v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension41ScreenshotGalleryCollectionViewFlowLayout_indexPathAtInitialScroll;
  uint64_t v4 = sub_100756440();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
  v5 = [(ScreenshotGalleryCollectionViewFlowLayout *)&v7 init];
  [(ScreenshotGalleryCollectionViewFlowLayout *)v5 setScrollDirection:1];
  return v5;
}

- (_TtC22SubscribePageExtension41ScreenshotGalleryCollectionViewFlowLayout)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension41ScreenshotGalleryCollectionViewFlowLayout_indexPathAtInitialScroll;
  uint64_t v6 = sub_100756440();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC22SubscribePageExtension41ScreenshotGalleryCollectionViewFlowLayout *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  id v3 = [(ScreenshotGalleryCollectionViewFlowLayout *)v2 collectionView];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [v3 panGestureRecognizer];

    [v5 removeTarget:v2 action:0];
  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
  [(ScreenshotGalleryCollectionViewFlowLayout *)&v6 dealloc];
}

- (void).cxx_destruct
{
}

- (void)prepareLayout
{
  v2 = self;
  sub_100619C38();
}

- (void)prepareForTransitionToLayout:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
  id v4 = a3;
  id v5 = v9.receiver;
  [(ScreenshotGalleryCollectionViewFlowLayout *)&v9 prepareForTransitionToLayout:v4];
  id v6 = objc_msgSend(v5, "collectionView", v9.receiver, v9.super_class);
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 panGestureRecognizer];

    [v8 removeTarget:v5 action:0];
    id v4 = v5;
    id v5 = v8;
  }
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v8 = self;
  sub_100619E4C(v7, v6, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)panGestureRecognizedBy:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10061A4C4(v4);
}

@end