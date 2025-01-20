@interface NewFactorTypeTableViewCell
- (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation NewFactorTypeTableViewCell

- (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell *)sub_241368620(a3, (uint64_t)a4, v6);
}

- (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_isChecked) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_checkMarkImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_titleLabel);
}

@end