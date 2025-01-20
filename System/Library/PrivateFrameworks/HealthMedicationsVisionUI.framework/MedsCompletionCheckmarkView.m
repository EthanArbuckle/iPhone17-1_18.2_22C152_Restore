@interface MedsCompletionCheckmarkView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView)initWithCoder:(id)a3;
- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MedsCompletionCheckmarkView

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F15880]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView *)sub_2287FB408();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MedsCompletionCheckmarkView();
  v2 = (char *)v4.receiver;
  [(MedsCompletionCheckmarkView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_tickViewSize);
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MedsCompletionCheckmarkView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer));
}

@end