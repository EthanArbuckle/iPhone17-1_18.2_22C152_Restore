@interface DataTypeDetailDescriptionCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DataTypeDetailDescriptionCell

- (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell *)sub_1AD3F615C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell____lazy_storage___textView) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell_textInsets);
  __asm { FMOV            V0.2D, #16.0 }
  _OWORD *v4 = _Q0;
  v4[1] = _Q0;
  v10 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell_item;
  *((void *)v10 + 4) = 0;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  id v11 = a3;

  result = (_TtC18HealthExperienceUI29DataTypeDetailDescriptionCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DataTypeDetailDescriptionCell();
  id v2 = v8.receiver;
  [(DataTypeDetailDescriptionCell *)&v8 layoutSubviews];
  sub_1AD3F5DE0();
  v4 = v3;
  id v5 = objc_msgSend(v2, sel_contentView, v8.receiver, v8.super_class);
  objc_msgSend(v5, sel_bounds);
  double v7 = v6;

  objc_msgSend(v4, sel_setFrame_, UIEdgeInsetsInsetRect_0(v7));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = a3.width + -16.0 + -16.0;
  if (v4 < 0.0) {
    double v5 = 0.0;
  }
  else {
    double v5 = v4;
  }
  double v6 = self;
  sub_1AD3F5DE0();
  objc_super v8 = v7;
  double v9 = sub_1AD4CBFB8(v5);

  double v10 = ceil(v9 + 16.0 + 16.0);
  double v11 = width;
  result.height = v10;
  result.CGFloat width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell____lazy_storage___textView));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29DataTypeDetailDescriptionCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

- (NSString)description
{
  id v2 = self;
  DataTypeDetailDescriptionCell.description.getter();

  v3 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end