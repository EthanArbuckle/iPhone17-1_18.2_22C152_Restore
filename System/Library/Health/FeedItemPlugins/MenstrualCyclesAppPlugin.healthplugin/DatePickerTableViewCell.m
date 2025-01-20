@interface DatePickerTableViewCell
- (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)datePickerChangedWithPicker:(id)a3;
- (void)prepareForReuse;
@end

@implementation DatePickerTableViewCell

- (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell *)sub_241230A20(v4, v5);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(DatePickerTableViewCell *)&v6 prepareForReuse];
  uint64_t v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker], sel_removeFromSuperview, v6.receiver, v6.super_class);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82650]), sel_init);
  uint64_t v5 = *(void **)&v2[v3];
  *(void *)&v2[v3] = v4;

  sub_24123029C();
}

- (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_item;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  uint64_t v6 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker;
  id v7 = objc_allocWithZone(MEMORY[0x263F82650]);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_selectedItemUniqueIdentifier);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void)datePickerChangedWithPicker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_241230B48();
}

- (void).cxx_destruct
{
  sub_241230E38((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_item, (unint64_t *)&qword_268CFFE30, (unint64_t *)&qword_268CFF090);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker));
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_delegate);

  swift_bridgeObjectRelease();
}

@end