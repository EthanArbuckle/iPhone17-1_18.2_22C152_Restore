@interface SeparatorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI13SeparatorView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI13SeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorView

- (_TtC12GameCenterUI13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI13SeparatorView *)sub_1AF622EBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI13SeparatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6230C4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1AF622CA0(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF6231A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI13SeparatorView_separatorView));
}

@end