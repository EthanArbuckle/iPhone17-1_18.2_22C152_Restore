@interface TitleSupplementaryView
- (_TtC6MailUI22TitleSupplementaryView)initWithCoder:(id)a3;
- (_TtC6MailUI22TitleSupplementaryView)initWithFrame:(CGRect)a3;
@end

@implementation TitleSupplementaryView

- (_TtC6MailUI22TitleSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI22TitleSupplementaryView *)TitleSupplementaryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI22TitleSupplementaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDEE39C0();
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint));
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint));
}

@end