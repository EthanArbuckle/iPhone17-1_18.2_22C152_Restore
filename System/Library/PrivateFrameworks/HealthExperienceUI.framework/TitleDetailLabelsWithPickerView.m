@interface TitleDetailLabelsWithPickerView
- (_TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView)initWithFrame:(CGRect)a3;
@end

@implementation TitleDetailLabelsWithPickerView

- (_TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView *)sub_1AD5F9A54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD5FAE34();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView_titleDetailLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView_picker));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31TitleDetailLabelsWithPickerView____lazy_storage___pickerHeightZeroConstraint);
}

@end