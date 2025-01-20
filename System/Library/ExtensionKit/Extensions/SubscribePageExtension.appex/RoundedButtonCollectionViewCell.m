@interface RoundedButtonCollectionViewCell
- (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation RoundedButtonCollectionViewCell

- (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell *)sub_1007280EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100729B88();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10072849C();
}

- (void)didTapButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100728C00(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_dividerView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_action, &qword_10095A9E0);
}

@end