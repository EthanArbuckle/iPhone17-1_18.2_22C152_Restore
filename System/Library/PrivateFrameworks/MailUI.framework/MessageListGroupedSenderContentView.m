@interface MessageListGroupedSenderContentView
- (_TtC6MailUI35MessageListGroupedSenderContentView)initWithCoder:(id)a3;
- (_TtC6MailUI35MessageListGroupedSenderContentView)initWithFrame:(CGRect)a3;
@end

@implementation MessageListGroupedSenderContentView

- (_TtC6MailUI35MessageListGroupedSenderContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDE1D928();
}

- (_TtC6MailUI35MessageListGroupedSenderContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI35MessageListGroupedSenderContentView *)MessageListGroupedSenderContentView.init(frame:)();
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView____lazy_storage___avatarHeightConstraint));
  sub_1DDD31430();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_unreadImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_avatar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_sender));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_chevron));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_date));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_subjectStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_topStackView));
  sub_1DDD31430();
  sub_1DDE16CE4((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35MessageListGroupedSenderContentView_appliedConfiguration));
}

@end