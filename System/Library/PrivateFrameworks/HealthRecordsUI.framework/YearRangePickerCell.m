@interface YearRangePickerCell
- (_TtC15HealthRecordsUI19YearRangePickerCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI19YearRangePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation YearRangePickerCell

- (_TtC15HealthRecordsUI19YearRangePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C254F470();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15HealthRecordsUI19YearRangePickerCell *)sub_1C23F57CC(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI19YearRangePickerCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_dataSource) = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_baseAccessibilityIdentifier);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_pickerView;
  type metadata accessor for YearRangePickerView();
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC15HealthRecordsUI19YearRangePickerCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_dataSource);
  if (v4) {
    return *(void *)(*(void *)(v4 + OBJC_IVAR____TtC15HealthRecordsUI25YearRangePickerDataSource_pickerRange) + 16);
  }
  else {
    return 0;
  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  uint64_t v5 = *(char **)((char *)self + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_dataSource);
  if (v5)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v6 = *(void *)&v5[OBJC_IVAR____TtC15HealthRecordsUI25YearRangePickerDataSource_pickerRange];
      if (*(void *)(v6 + 16) > (unint64_t)a4)
      {
        id v7 = self;
        uint64_t v8 = *(void *)(v6 + 8 * a4 + 32);
        id v9 = a3;
        id v10 = v7;
        swift_retain();
        sub_1C2391FCC(v8);

        swift_release();
        uint64_t v5 = (char *)sub_1C254F430();
        swift_bridgeObjectRelease();
        goto LABEL_5;
      }
    }
    __break(1u);
    return self;
  }
LABEL_5:
  return v5;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 30.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_1C23F5FA0((uint64_t)v7, a4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI19YearRangePickerCell_pickerView);
}

@end