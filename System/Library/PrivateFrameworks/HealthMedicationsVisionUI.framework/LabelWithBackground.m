@interface LabelWithBackground
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground)initWithCoder:(id)a3;
- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LabelWithBackground

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground)initWithFrame:(CGRect)a3
{
  return (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground *)sub_2287D9830(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_xInset) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_yInset) = (Class)0x4000000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label) = 0;
  id v4 = a3;

  result = (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground *)sub_2287FB408();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LabelWithBackground();
  id v2 = v5.receiver;
  [(LabelWithBackground *)&v5 layoutSubviews];
  id v3 = sub_2287D963C();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);

  id v4 = sub_2287D96EC();
  objc_msgSend(v2, sel_bounds);
  CGRect v7 = CGRectInset(v6, 12.0, 2.0);
  objc_msgSend(v4, sel_setFrame_, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = self;
  id v6 = sub_2287D96EC();
  objc_msgSend(v6, sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8 + 24.0;
  double v12 = v10 + 4.0;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label);
}

@end