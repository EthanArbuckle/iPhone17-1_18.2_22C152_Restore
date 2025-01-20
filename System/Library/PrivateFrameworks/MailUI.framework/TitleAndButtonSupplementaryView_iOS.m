@interface TitleAndButtonSupplementaryView_iOS
- (_TtC6MailUI35TitleAndButtonSupplementaryView_iOS)initWithCoder:(id)a3;
- (_TtC6MailUI35TitleAndButtonSupplementaryView_iOS)initWithFrame:(CGRect)a3;
@end

@implementation TitleAndButtonSupplementaryView_iOS

- (_TtC6MailUI35TitleAndButtonSupplementaryView_iOS)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI35TitleAndButtonSupplementaryView_iOS *)TitleAndButtonSupplementaryView_iOS.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI35TitleAndButtonSupplementaryView_iOS)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDEE15E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView));
}

@end