@interface FrequencyIntervalCollectionViewCell
- (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation FrequencyIntervalCollectionViewCell

- (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell *)sub_1C2067A44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s19HealthMedicationsUI35FrequencyIntervalCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  sub_1C2068DB4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell____lazy_storage___valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell_separatorView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI35FrequencyIntervalCollectionViewCell____lazy_storage___pickerView);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = *(void *)(sub_1C20C753C() + 16);

  swift_bridgeObjectRelease();
  return v7;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7 = a3;
  v8 = self;
  id result = (id)sub_1C20C753C();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*((void *)result + 2) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  sub_1C20C71E4(0);

  v10 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  v8 = self;
  sub_1C2068ED0(a4);
}

@end