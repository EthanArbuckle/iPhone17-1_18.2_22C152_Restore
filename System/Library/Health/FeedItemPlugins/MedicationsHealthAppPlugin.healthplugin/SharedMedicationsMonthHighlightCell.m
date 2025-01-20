@interface SharedMedicationsMonthHighlightCell
- (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation SharedMedicationsMonthHighlightCell

- (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell)initWithFrame:(CGRect)a3
{
  sub_24106037C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell)initWithCoder:(id)a3
{
  return (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell *)sub_2410605EC(a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_241060704();
}

- (void).cxx_destruct
{
  sub_2410616A4((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell_item);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell____lazy_storage___hostingController);
}

@end