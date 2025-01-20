@interface TwelveMonthPDFHeaderView
- (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView)initWithReuseIdentifier:(id)a3;
@end

@implementation TwelveMonthPDFHeaderView

- (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView)initWithReuseIdentifier:(id)a3
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
  return (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView *)sub_241518D30(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView)initWithCoder:(id)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView_showPDF);
  *uint64_t v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView____lazy_storage___button) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2411F4090(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView_showPDF));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin24TwelveMonthPDFHeaderView____lazy_storage___button);
}

@end