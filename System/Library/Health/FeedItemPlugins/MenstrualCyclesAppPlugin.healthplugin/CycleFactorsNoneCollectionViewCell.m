@interface CycleFactorsNoneCollectionViewCell
- (_TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation CycleFactorsNoneCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell_label;
  id v9 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CycleFactorsNoneCollectionViewCell();
  v11 = -[CycleFactorsNoneCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_2413F5264();

  return v11;
}

- (_TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell_label;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin34CycleFactorsNoneCollectionViewCell_label));
}

@end