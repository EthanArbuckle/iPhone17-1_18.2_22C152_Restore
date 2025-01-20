@interface DurationDatePickerCollectionViewCell
- (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)pickerDateChanged:(id)a3;
@end

@implementation DurationDatePickerCollectionViewCell

- (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell____lazy_storage___titleLabel) = 0;
  uint64_t v9 = OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_datePicker;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9) = (Class)sub_1C1FE0DE8();
  *(Class *)((char *)&v10->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_currentLayoutConstraints) = (Class)MEMORY[0x1E4FBC860];

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for DurationDatePickerCollectionViewCell();
  v11 = -[DurationDatePickerCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_1C1FE1178();

  return v11;
}

- (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell____lazy_storage___titleLabel) = 0;
  uint64_t v5 = OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_datePicker;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)sub_1C1FE0DE8();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_currentLayoutConstraints) = (Class)MEMORY[0x1E4FBC860];

  result = (_TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)pickerDateChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C1FE1E14(v4);
}

- (void).cxx_destruct
{
  sub_1C1FE2DB8((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_item, (uint64_t (*)(void))sub_1C1F24488);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI36DurationDatePickerCollectionViewCell_datePicker));

  swift_bridgeObjectRelease();
}

@end