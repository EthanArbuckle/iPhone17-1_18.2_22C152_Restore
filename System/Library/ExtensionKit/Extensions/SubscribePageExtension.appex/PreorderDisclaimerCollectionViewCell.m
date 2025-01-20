@interface PreorderDisclaimerCollectionViewCell
- (_TtC22SubscribePageExtension36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PreorderDisclaimerCollectionViewCell

- (_TtC22SubscribePageExtension36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36PreorderDisclaimerCollectionViewCell *)sub_1003678D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100367FC4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100367D0C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36PreorderDisclaimerCollectionViewCell_disclaimerLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension36PreorderDisclaimerCollectionViewCell_itemLayoutContext;

  sub_10002D20C((uint64_t)v3);
}

@end