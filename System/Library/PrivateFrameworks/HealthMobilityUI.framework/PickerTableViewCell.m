@interface PickerTableViewCell
- (_TtC16HealthMobilityUI19PickerTableViewCell)initWithCoder:(id)a3;
- (_TtC16HealthMobilityUI19PickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PickerTableViewCell

- (_TtC16HealthMobilityUI19PickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1E0B06798();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC16HealthMobilityUI19PickerTableViewCell *)sub_1E0AD462C(v4, v5);
}

- (_TtC16HealthMobilityUI19PickerTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC16HealthMobilityUI19PickerTableViewCell *)sub_1E0B06B38();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E0AD47F4((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView);
}

@end