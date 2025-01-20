@interface MedicationDataScannerRegionOfInterestOverlay
- (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay)initWithCoder:(id)a3;
- (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MedicationDataScannerRegionOfInterestOverlay

- (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay *)sub_2287DA1C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2287DB8FC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2287DA6AC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay__title;
  sub_2287DB1EC(0, &qword_2682654B0, MEMORY[0x263EFDE58]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle);
}

@end