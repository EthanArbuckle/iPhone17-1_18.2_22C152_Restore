@interface MedicationsDayHistoryView
- (_TtC19HealthMedicationsUI25MedicationsDayHistoryView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI25MedicationsDayHistoryView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation MedicationsDayHistoryView

- (_TtC19HealthMedicationsUI25MedicationsDayHistoryView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI25MedicationsDayHistoryView *)sub_1C203C948(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI25MedicationsDayHistoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C2040590();
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView_timer);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationsDayHistoryView();
  [(MedicationsDayHistoryView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___doseStatusImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___timeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___chevronImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___headerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView____lazy_storage___lineItemsStackView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView_timer));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationsDayHistoryView_elapsedTimeCache;

  sub_1C1F394F8((uint64_t)v3);
}

@end