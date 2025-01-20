@interface RoundEditProfileButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoundEditProfileButton

- (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton *)sub_1AF402FA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4032CC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF40347C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF403558();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF4037CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton_shadowView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUIP33_3CDA1BD77FD495B0F73399413CCB4C6E22RoundEditProfileButton_pencilImageView);
}

@end