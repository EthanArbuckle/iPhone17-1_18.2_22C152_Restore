@interface SegmentedControlCollectionViewCell
- (_TtC20ProductPageExtension34SegmentedControlCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34SegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SegmentedControlCollectionViewCell

- (_TtC20ProductPageExtension34SegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34SegmentedControlCollectionViewCell *)sub_10025F0CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34SegmentedControlCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34SegmentedControlCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension34SegmentedControlCollectionViewCell_isFirstSetup) = 1;
  id v7 = a3;

  result = (_TtC20ProductPageExtension34SegmentedControlCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(SegmentedControlCollectionViewCell *)&v8 layoutSubviews];
  sub_100770A80();
  CGRectGetWidth(v9);
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension34SegmentedControlCollectionViewCell_segmentedControl];
  sub_100770A80();
  objc_msgSend(v3, "sizeThatFits:", v4, v5, v8.receiver, v8.super_class);
  sub_100770A80();
  double v7 = v6;
  sub_100770A80();
  [v3 setFrame:v7];
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34SegmentedControlCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension34SegmentedControlCollectionViewCell_segmentedControl);
}

@end