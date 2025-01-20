@interface SeparatorSpacerReusableView
- (_TtC20ProductPageExtension27SeparatorSpacerReusableView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27SeparatorSpacerReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorSpacerReusableView

- (_TtC20ProductPageExtension27SeparatorSpacerReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27SeparatorSpacerReusableView *)sub_10005D648(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension27SeparatorSpacerReusableView)initWithCoder:(id)a3
{
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension27SeparatorSpacerReusableView_separatorInsets);
  long long v6 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v5 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v5[1] = v6;
  uint64_t v7 = OBJC_IVAR____TtC20ProductPageExtension27SeparatorSpacerReusableView_lineView;
  id v8 = objc_allocWithZone((Class)UIView);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC20ProductPageExtension27SeparatorSpacerReusableView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10005D8E8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27SeparatorSpacerReusableView_lineView));
}

@end