@interface ColorCell
- (BOOL)_accessibilityCellIsSelected;
- (_TtC19HealthMedicationsUI9ColorCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI9ColorCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ColorCell

- (_TtC19HealthMedicationsUI9ColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI9ColorCell *)sub_1C2114148(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI9ColorCell)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C21143FC();
}

- (BOOL)_accessibilityCellIsSelected
{
  v2 = self;
  char v3 = sub_1C2114DAC();

  return v3 & 1;
}

- (void).cxx_destruct
{
}

@end