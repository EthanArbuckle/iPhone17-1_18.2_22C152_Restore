@interface InteractiveTimelineLegendLabel
- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)init;
- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)initWithFrame:(CGRect)a3;
@end

@implementation InteractiveTimelineLegendLabel

- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)init
{
  return (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *)sub_2413B71E8();
}

- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_textLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_spacerLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  v9 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_cycleDay;
  uint64_t v10 = type metadata accessor for CycleDay();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *)sub_241633038();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel)initWithFrame:(CGRect)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_spacerLabel));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin30InteractiveTimelineLegendLabel_cycleDay;

  sub_2413B8818((uint64_t)v3);
}

@end