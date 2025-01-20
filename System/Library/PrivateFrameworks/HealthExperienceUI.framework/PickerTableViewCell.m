@interface PickerTableViewCell
- (_TtC18HealthExperienceUI19PickerTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI19PickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PickerTableViewCell

- (_TtC18HealthExperienceUI19PickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC18HealthExperienceUI19PickerTableViewCell *)sub_1AD324BC8(v4, v5);
}

- (_TtC18HealthExperienceUI19PickerTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI19PickerTableViewCell_item;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI19PickerTableViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI19PickerTableViewCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI19PickerTableViewCell_pickerView);
}

@end