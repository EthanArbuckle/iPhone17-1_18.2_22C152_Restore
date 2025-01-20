@interface Bullet
- (_TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet)initWithFrame:(CGRect)a3;
@end

@implementation Bullet

- (_TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF662798();
}

- (_TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet_textStackView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUIP33_77E2C0FF35C92BF2BDB0FAEFD7D57C4E6Bullet_mainStackView);
}

@end