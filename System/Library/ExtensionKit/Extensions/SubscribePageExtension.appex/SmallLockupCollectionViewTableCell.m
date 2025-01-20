@interface SmallLockupCollectionViewTableCell
- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallLockupCollectionViewTableCell

- (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell *)sub_1004D82D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell_lockupView;
  type metadata accessor for SmallLockupView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(void *)&self->UICollectionViewTableCell_opaque[v5] = [v6 init];

  result = (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004D850C();
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell_lockupView];
}

- (void).cxx_destruct
{
}

@end