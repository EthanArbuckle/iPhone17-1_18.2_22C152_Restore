@interface DayPickerCollectionViewCell
- (_TtC19HealthMedicationsUI27DayPickerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI27DayPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)selectedDaysDidChange:(id)a3;
@end

@implementation DayPickerCollectionViewCell

- (void)selectedDaysDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C2105454((uint64_t)v4);
}

- (_TtC19HealthMedicationsUI27DayPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_dayPicker) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DayPickerCollectionViewCell();
  return -[DayPickerCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI27DayPickerCollectionViewCell)initWithCoder:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_item;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_dayPicker) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DayPickerCollectionViewCell();
  return [(DayPickerCollectionViewCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1C2105C1C((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI27DayPickerCollectionViewCell_dayPicker);
}

@end