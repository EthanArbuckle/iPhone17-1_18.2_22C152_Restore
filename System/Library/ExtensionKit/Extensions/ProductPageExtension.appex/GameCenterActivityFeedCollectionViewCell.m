@interface GameCenterActivityFeedCollectionViewCell
- (_TtC20ProductPageExtension40GameCenterActivityFeedCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension40GameCenterActivityFeedCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation GameCenterActivityFeedCollectionViewCell

- (_TtC20ProductPageExtension40GameCenterActivityFeedCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension40GameCenterActivityFeedCollectionViewCell_itemLayoutContext;
  uint64_t v10 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[SwiftUIViewHostingCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC20ProductPageExtension40GameCenterActivityFeedCollectionViewCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension40GameCenterActivityFeedCollectionViewCell_itemLayoutContext;
  uint64_t v7 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(SwiftUIViewHostingCell *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end