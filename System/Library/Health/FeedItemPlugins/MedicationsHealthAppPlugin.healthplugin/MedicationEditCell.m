@interface MedicationEditCell
- (_TtC26MedicationsHealthAppPlugin18MedicationEditCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin18MedicationEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation MedicationEditCell

- (_TtC26MedicationsHealthAppPlugin18MedicationEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_241160730();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC26MedicationsHealthAppPlugin18MedicationEditCell *)sub_241053444(v4, v5);
}

- (_TtC26MedicationsHealthAppPlugin18MedicationEditCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_viewModel;
  v4[16] = 0;
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_leadingAccessoryActionHandler);
  *uint64_t v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell____lazy_storage___leadingAccessoryView) = 0;
  id v6 = a3;

  result = (_TtC26MedicationsHealthAppPlugin18MedicationEditCell *)sub_2411616B0();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = self;
  id v9 = sub_241051770();
  -[MedicationEditCell convertPoint:toCoordinateSpace:](v8, sel_convertPoint_toCoordinateSpace_, v9, x, y);
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v14 = sub_241051770();
  objc_msgSend(v14, sel_bounds);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v29.origin.double x = v16;
  v29.origin.double y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  v28.double x = v11;
  v28.double y = v13;
  if (CGRectContainsPoint(v29, v28))
  {
    id v23 = sub_241051770();
  }
  else
  {
    v26.receiver = v8;
    v26.super_class = (Class)type metadata accessor for MedicationEditCell();
    id v23 = -[MedicationEditCell hitTest:withEvent:](&v26, sel_hitTest_withEvent_, v7, x, y);
  }
  v24 = v23;

  return v24;
}

- (void).cxx_destruct
{
  sub_241054114(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_viewModel), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_viewModel));
  sub_241032B54(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_leadingAccessoryActionHandler));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell____lazy_storage___leadingAccessoryView);
}

@end