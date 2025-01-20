@interface InteractionSummaryContentView
- (_TtC19HealthMedicationsUI29InteractionSummaryContentView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI29InteractionSummaryContentView)initWithFrame:(CGRect)a3;
@end

@implementation InteractionSummaryContentView

- (_TtC19HealthMedicationsUI29InteractionSummaryContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView_viewModel) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionSummaryContentView();
  v7 = -[InteractionSummaryContentView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  [(InteractionSummaryContentView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = sub_1C210ACC4();
  [(InteractionSummaryContentView *)v7 addSubview:v8];

  sub_1C210B1BC();
  return v7;
}

- (_TtC19HealthMedicationsUI29InteractionSummaryContentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView_viewModel) = 0;
  id v4 = a3;

  result = (_TtC19HealthMedicationsUI29InteractionSummaryContentView *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView____lazy_storage___titleLabel));

  swift_release();
}

@end