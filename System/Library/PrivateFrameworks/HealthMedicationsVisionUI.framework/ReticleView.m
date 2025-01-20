@interface ReticleView
- (_TtC25HealthMedicationsVisionUI11ReticleView)initWithCoder:(id)a3;
- (_TtC25HealthMedicationsVisionUI11ReticleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReticleView

- (_TtC25HealthMedicationsVisionUI11ReticleView)initWithFrame:(CGRect)a3
{
  return (_TtC25HealthMedicationsVisionUI11ReticleView *)sub_2287DBE68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC25HealthMedicationsVisionUI11ReticleView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView_hasSetReticleRect) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView) = 0;
  id v4 = a3;

  result = (_TtC25HealthMedicationsVisionUI11ReticleView *)sub_2287FB408();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2287DC014();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView);
}

@end