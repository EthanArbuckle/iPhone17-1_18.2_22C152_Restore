@interface ProductTitleView.IconTitleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView)initWithCoder:(id)a3;
- (_TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTitleView.IconTitleView

- (_TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView *)sub_10050C72C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10050D334();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_10050ADF4();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10050CAB4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView_appTitleView));
  sub_10000FED8((uint64_t)self+ OBJC_IVAR____TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView_iconAspectRatio, (uint64_t *)&unk_100939970);
}

@end