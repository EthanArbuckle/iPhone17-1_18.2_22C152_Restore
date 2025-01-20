@interface MenstrualCyclesHeaderFooterView
- (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView)initWithReuseIdentifier:(id)a3;
@end

@implementation MenstrualCyclesHeaderFooterView

- (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView)initWithReuseIdentifier:(id)a3
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
  return (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView *)sub_2413132CC(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_configuration;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  uint64_t v6 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_label;
  id v7 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_241313D6C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_configuration);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_label);
}

@end