@interface CollectionHeaderWithIconReusableView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation CollectionHeaderWithIconReusableView

- (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView *)CollectionHeaderWithIconReusableView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView____lazy_storage___contentView) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CollectionHeaderWithIconReusableView();
  id v2 = v5.receiver;
  [(CollectionHeaderWithIconReusableView *)&v5 layoutSubviews];
  v3 = sub_1AD57B58C();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  double Width = CGRectGetWidth(v6);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 2.0, Width, CGRectGetHeight(v7) + -4.0 + -8.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = self;
  CGRect v6 = sub_1AD57B58C();
  objc_msgSend(v6, sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v10 + 8.0 + 4.0;
  double v12 = v8;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_msgSend(v4, sel_size);
  -[CollectionHeaderWithIconReusableView sizeThatFits:](v5, sel_sizeThatFits_);
  objc_msgSend(v4, sel_setSize_);

  return v4;
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView____lazy_storage___contentView);
}

@end