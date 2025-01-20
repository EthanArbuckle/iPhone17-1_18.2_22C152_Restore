@interface DatePickerCollectionViewCell
- (_TtC18HealthExperienceUI28DatePickerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI28DatePickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)pickerDateChanged:(id)a3;
@end

@implementation DatePickerCollectionViewCell

- (_TtC18HealthExperienceUI28DatePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI28DatePickerCollectionViewCell *)sub_1AD716BD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI28DatePickerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI28DatePickerCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)pickerDateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD718610(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1AD1E3968((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_item, (unint64_t *)&qword_1EB73E880, (void (*)(uint64_t))sub_1AD2282B4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_selectedDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DatePickerCollectionViewCell_datePicker));
  swift_bridgeObjectRelease();
}

@end