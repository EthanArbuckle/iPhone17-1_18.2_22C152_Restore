@interface RoundChevronButton
- (_TtC18ASMessagesProvider18RoundChevronButton)init;
- (_TtC18ASMessagesProvider18RoundChevronButton)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider18RoundChevronButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RoundChevronButton

- (_TtC18ASMessagesProvider18RoundChevronButton)init
{
  return (_TtC18ASMessagesProvider18RoundChevronButton *)sub_1199DC();
}

- (_TtC18ASMessagesProvider18RoundChevronButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_11A200();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_119CF4();
}

- (_TtC18ASMessagesProvider18RoundChevronButton)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider18RoundChevronButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18RoundChevronButton_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18RoundChevronButton_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18RoundChevronButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18RoundChevronButton_vibrancyView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider18RoundChevronButton_chevronImageView);
}

@end