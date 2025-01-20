@interface HorizontalRuleCollectionViewCell
- (_TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation HorizontalRuleCollectionViewCell

- (_TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell *)sub_100580270(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_lineLayer;
  id v8 = objc_allocWithZone((Class)CAShapeLayer);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 init];
  v10 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_style;
  uint64_t v11 = enum case for HorizontalRule.Style.solid(_:);
  uint64_t v12 = sub_100759C10();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  uint64_t v13 = OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_lineColor;
  sub_10001A860(0, (unint64_t *)&qword_100933F20);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)sub_100768210();

  result = (_TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100580630();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_10058087C();
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_lineLayer));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_style;
  uint64_t v4 = sub_100759C10();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension32HorizontalRuleCollectionViewCell_lineColor);
}

@end