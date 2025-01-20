@interface YearRangePickerView
- (_TtC15HealthRecordsUI19YearRangePickerView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI19YearRangePickerView)initWithFrame:(CGRect)a3;
@end

@implementation YearRangePickerView

- (_TtC15HealthRecordsUI19YearRangePickerView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI19YearRangePickerView *)sub_1C23F5C90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI19YearRangePickerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C23F61BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerView_maxYearPicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerView_minYearPicker));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerView_stackView);
}

@end