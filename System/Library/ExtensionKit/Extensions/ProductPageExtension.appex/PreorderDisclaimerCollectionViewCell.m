@interface PreorderDisclaimerCollectionViewCell
- (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PreorderDisclaimerCollectionViewCell

- (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell *)sub_10026E0A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10026E83C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10026E4E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell_disclaimerLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell_itemLayoutContext;

  sub_1000105B0((uint64_t)v3);
}

@end