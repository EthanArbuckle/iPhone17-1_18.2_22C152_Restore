@interface CycleHistoryYearSectionHeader
- (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader)initWithReuseIdentifier:(id)a3;
@end

@implementation CycleHistoryYearSectionHeader

- (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader *)sub_2411EFE10(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_yearLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_headerSeparator;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F46968]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_yearLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin29CycleHistoryYearSectionHeader_headerSeparator);
}

@end