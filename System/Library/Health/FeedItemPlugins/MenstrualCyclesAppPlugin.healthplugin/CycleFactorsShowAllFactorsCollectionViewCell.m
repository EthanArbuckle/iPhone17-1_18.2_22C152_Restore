@interface CycleFactorsShowAllFactorsCollectionViewCell
- (BOOL)isHighlighted;
- (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CycleFactorsShowAllFactorsCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell_textLabel;
  id v9 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell____lazy_storage___chevronImage) = 0;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CycleFactorsShowAllFactorsCollectionViewCell();
  v11 = -[CycleFactorsShowAllFactorsCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_241470F1C();

  return v11;
}

- (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell_textLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell____lazy_storage___chevronImage) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleFactorsShowAllFactorsCollectionViewCell();
  return [(CycleFactorsShowAllFactorsCollectionViewCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CycleFactorsShowAllFactorsCollectionViewCell();
  id v4 = v8.receiver;
  [(CycleFactorsShowAllFactorsCollectionViewCell *)&v8 setHighlighted:v3];
  LODWORD(v3) = objc_msgSend(v4, sel_isHighlighted, v8.receiver, v8.super_class);
  uint64_t v5 = self;
  id v6 = &selRef_quaternarySystemFillColor;
  if (!v3) {
    id v6 = &selRef_secondarySystemGroupedBackgroundColor;
  }
  id v7 = [v5 *v6];
  objc_msgSend(v4, sel_setBackgroundColor_, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell_textLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell____lazy_storage___chevronImage);
}

@end