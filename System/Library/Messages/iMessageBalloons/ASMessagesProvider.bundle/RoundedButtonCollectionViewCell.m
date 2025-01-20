@interface RoundedButtonCollectionViewCell
- (_TtC18ASMessagesProvider31RoundedButtonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation RoundedButtonCollectionViewCell

- (_TtC18ASMessagesProvider31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31RoundedButtonCollectionViewCell *)sub_5C9470(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31RoundedButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5CAF0C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5C9820();
}

- (void)didTapButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_5C9F84(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31RoundedButtonCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31RoundedButtonCollectionViewCell_dividerView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31RoundedButtonCollectionViewCell_action, &qword_9709C0);
}

@end