@interface MedicationsCurrentDayScheduleCompleteCell
- (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MedicationsCurrentDayScheduleCompleteCell

- (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___gradientLayer) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___scheduleCompleteView) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationsCurrentDayScheduleCompleteCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicationsCurrentDayScheduleCompleteCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_24107768C();

  return v10;
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___gradientLayer) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___scheduleCompleteView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell *)sub_2411616B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MedicationsCurrentDayScheduleCompleteCell();
  id v2 = v4.receiver;
  [(MedicationsCurrentDayScheduleCompleteCell *)&v4 layoutSubviews];
  id v3 = sub_241076F24();
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___scheduleCompleteView));
  id v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell_item;

  sub_2410616A4((uint64_t)v3);
}

@end