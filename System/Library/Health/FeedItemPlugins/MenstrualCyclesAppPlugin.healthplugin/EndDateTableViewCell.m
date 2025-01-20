@interface EndDateTableViewCell
- (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)dateXButtonPressedWithSender:(id)a3 event:(id)a4;
@end

@implementation EndDateTableViewCell

- (void)dateXButtonPressedWithSender:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24129378C();
}

- (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)_sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell *)sub_2412932F8(a3, (uint64_t)a4, v6);
}

- (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_item;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell____lazy_storage___xMarkButton) = 0;
  id v6 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_241230E38((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_item, (unint64_t *)&qword_268CFFE30, (unint64_t *)&qword_268CFF090);
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell____lazy_storage___xMarkButton);
}

@end