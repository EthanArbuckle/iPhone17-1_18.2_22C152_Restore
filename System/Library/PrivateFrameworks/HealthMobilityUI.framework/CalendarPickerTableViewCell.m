@interface CalendarPickerTableViewCell
- (_TtC16HealthMobilityUI27CalendarPickerTableViewCell)initWithCoder:(id)a3;
- (_TtC16HealthMobilityUI27CalendarPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)pickerDateChanged:(id)a3;
@end

@implementation CalendarPickerTableViewCell

- (_TtC16HealthMobilityUI27CalendarPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1E0B06798();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC16HealthMobilityUI27CalendarPickerTableViewCell *)sub_1E0AF3BA0(a3, (uint64_t)a4, v6);
}

- (_TtC16HealthMobilityUI27CalendarPickerTableViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker) = 0;
  id v5 = a3;

  result = (_TtC16HealthMobilityUI27CalendarPickerTableViewCell *)sub_1E0B06B38();
  __break(1u);
  return result;
}

- (void)pickerDateChanged:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E0AF3DA8(v4);
}

- (void).cxx_destruct
{
  sub_1E0AEAC6C((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item, (unint64_t *)&qword_1EAD62290, (unint64_t *)&qword_1EAD62298);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker);
}

@end