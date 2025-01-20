@interface SegmentedControlCollectionViewCell
- (_TtC22SubscribePageExtension34SegmentedControlCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension34SegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SegmentedControlCollectionViewCell

- (_TtC22SubscribePageExtension34SegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34SegmentedControlCollectionViewCell *)sub_10002334C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34SegmentedControlCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension34SegmentedControlCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension34SegmentedControlCollectionViewCell_isFirstSetup) = 1;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension34SegmentedControlCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(SegmentedControlCollectionViewCell *)&v8 layoutSubviews];
  sub_10075C580();
  CGRectGetWidth(v9);
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension34SegmentedControlCollectionViewCell_segmentedControl];
  sub_10075C580();
  objc_msgSend(v3, "sizeThatFits:", v4, v5, v8.receiver, v8.super_class);
  sub_10075C580();
  double v7 = v6;
  sub_10075C580();
  [v3 setFrame:v7];
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension34SegmentedControlCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension34SegmentedControlCollectionViewCell_segmentedControl);
}

@end