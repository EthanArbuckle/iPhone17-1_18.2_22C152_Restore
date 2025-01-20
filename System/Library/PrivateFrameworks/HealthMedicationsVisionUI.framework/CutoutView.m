@interface CutoutView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC25HealthMedicationsVisionUI10CutoutView)initWithCoder:(id)a3;
- (_TtC25HealthMedicationsVisionUI10CutoutView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation CutoutView

- (_TtC25HealthMedicationsVisionUI10CutoutView)initWithFrame:(CGRect)a3
{
  return (_TtC25HealthMedicationsVisionUI10CutoutView *)sub_2287D4E58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC25HealthMedicationsVisionUI10CutoutView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2287DB7F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2287D5378();
}

- (CGRect)bounds
{
  sub_2287D5588(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2287D5654((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

- (CGRect)frame
{
  sub_2287D5588(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2287D5654((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___borderLayer);
}

@end