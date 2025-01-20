@interface RoundedButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI13RoundedButton)initWithCoder:(id)a3;
- (_TtC12GameCenterUI13RoundedButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoundedButton

- (_TtC12GameCenterUI13RoundedButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF71FD40();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1AF71FDC8(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF71FE90();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF71FFA4((uint64_t)a3);
}

- (_TtC12GameCenterUI13RoundedButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI13RoundedButton_backing));
  id v3 = (char *)self + OBJC_IVAR____TtC12GameCenterUI13RoundedButton_fontUseCase;

  sub_1AF720364((uint64_t)v3);
}

@end