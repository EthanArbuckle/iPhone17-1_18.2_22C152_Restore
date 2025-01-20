@interface RoundChevronButton
- (_TtC20ProductPageExtension18RoundChevronButton)init;
- (_TtC20ProductPageExtension18RoundChevronButton)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18RoundChevronButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RoundChevronButton

- (_TtC20ProductPageExtension18RoundChevronButton)init
{
  return (_TtC20ProductPageExtension18RoundChevronButton *)sub_10005DCA4();
}

- (_TtC20ProductPageExtension18RoundChevronButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10005E4C8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10005DFBC();
}

- (_TtC20ProductPageExtension18RoundChevronButton)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension18RoundChevronButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_vibrancyView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension18RoundChevronButton_chevronImageView);
}

@end