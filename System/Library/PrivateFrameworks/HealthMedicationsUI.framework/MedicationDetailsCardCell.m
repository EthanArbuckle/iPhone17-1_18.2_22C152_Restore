@interface MedicationDetailsCardCell
- (_TtC19HealthMedicationsUI25MedicationDetailsCardCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI25MedicationDetailsCardCell)initWithFrame:(CGRect)a3;
- (void)cellTripleTapped:(id)a3;
@end

@implementation MedicationDetailsCardCell

- (_TtC19HealthMedicationsUI25MedicationDetailsCardCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI25MedicationDetailsCardCell *)MedicationDetailsCardCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI25MedicationDetailsCardCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1FA1918();
}

- (void)cellTripleTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C1FA1A30();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationDetailsCardCell____lazy_storage___pillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationDetailsCardCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationDetailsCardCell____lazy_storage___captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationDetailsCardCell____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationDetailsCardCell____lazy_storage___notesLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C1FA2170((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationDetailsCardCell_item, (uint64_t (*)(void))sub_1C1F24488);
}

@end