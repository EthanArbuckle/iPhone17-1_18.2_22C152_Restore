@interface DataTypeLoggingCell
- (BOOL)axIsChecked;
- (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DataTypeLoggingCell

- (BOOL)axIsChecked
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_isChecked);
}

- (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell *)sub_241367324(v4, v5);
}

- (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_configuration;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_accessoryImage) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_tintAccessoryColor) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_isChecked) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_editableDaySummarySection) = 7;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_241313D6C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_accessoryImage));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin19DataTypeLoggingCell_tintAccessoryColor);
}

@end