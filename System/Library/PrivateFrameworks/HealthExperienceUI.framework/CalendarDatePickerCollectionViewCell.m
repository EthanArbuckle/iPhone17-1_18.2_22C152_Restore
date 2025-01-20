@interface CalendarDatePickerCollectionViewCell
- (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)pickerDateChanged:(id)a3;
@end

@implementation CalendarDatePickerCollectionViewCell

- (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell *)sub_1AD340EFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI36CalendarDatePickerCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)pickerDateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD341AE0(v4);
}

- (void).cxx_destruct
{
  sub_1AD341A84((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell_item, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI36CalendarDatePickerCollectionViewCell_datePicker);
}

@end