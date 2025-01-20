@interface SmallLockupCollectionViewTableCell
- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallLockupCollectionViewTableCell

- (_TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell *)sub_448570(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell_lockupView;
  type metadata accessor for SmallLockupView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(void *)&self->UICollectionViewTableCell_opaque[v5] = [v6 init];

  result = (_TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4487A8();
}

- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider15SmallLockupView *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC18ASMessagesProvider34SmallLockupCollectionViewTableCell_lockupView];
}

- (void).cxx_destruct
{
}

@end