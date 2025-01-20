@interface ProductTitleView.IconTitleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView)initWithCoder:(id)a3;
- (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTitleView.IconTitleView

- (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView *)sub_1005D35E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005D41EC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1005D1CAC();
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
  sub_1005D396C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView_appTitleView));
  sub_10000FA80((uint64_t)self+ OBJC_IVAR____TtCC20ProductPageExtension16ProductTitleViewP33_24849062375234386F64CEF1B9BE749513IconTitleView_iconAspectRatio, (uint64_t *)&unk_100954910);
}

@end