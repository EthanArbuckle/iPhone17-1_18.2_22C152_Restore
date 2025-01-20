@interface SeparatorSupplementaryView
- (_TtC6MailUI26SeparatorSupplementaryView)initWithCoder:(id)a3;
- (_TtC6MailUI26SeparatorSupplementaryView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SeparatorSupplementaryView

- (_TtC6MailUI26SeparatorSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI26SeparatorSupplementaryView *)SeparatorSupplementaryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI26SeparatorSupplementaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDED6F4C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  v8.value.super.isa = (Class)a3;
  SeparatorSupplementaryView.traitCollectionDidChange(_:)(v8);
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator));
}

@end