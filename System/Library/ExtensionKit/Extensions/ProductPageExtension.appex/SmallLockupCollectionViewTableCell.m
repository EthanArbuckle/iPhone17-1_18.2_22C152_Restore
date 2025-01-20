@interface SmallLockupCollectionViewTableCell
- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallLockupCollectionViewTableCell

- (_TtC20ProductPageExtension34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34SmallLockupCollectionViewTableCell *)sub_10045D1F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension34SmallLockupCollectionViewTableCell_lockupView;
  type metadata accessor for SmallLockupView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(void *)&self->UICollectionViewTableCell_opaque[v5] = [v6 init];

  result = (_TtC20ProductPageExtension34SmallLockupCollectionViewTableCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10045D428();
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC20ProductPageExtension34SmallLockupCollectionViewTableCell_lockupView];
}

- (void).cxx_destruct
{
}

@end