@interface MedicationsDayScheduleCompleteCell
- (_TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationsDayScheduleCompleteCell

- (_TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationsDayScheduleCompleteCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[MedicationsDayScheduleCompleteCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell_item;
  v6 = (objc_class *)type metadata accessor for MedicationsDayScheduleCompleteCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(MedicationsDayScheduleCompleteCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end