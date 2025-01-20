@interface RoundedButtonCollectionViewCell
- (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation RoundedButtonCollectionViewCell

- (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell *)sub_1005C5B58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005C75F4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005C5F08();
}

- (void)didTapButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005C666C(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31RoundedButtonCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31RoundedButtonCollectionViewCell_dividerView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31RoundedButtonCollectionViewCell_action, &qword_100969CD0);
}

@end