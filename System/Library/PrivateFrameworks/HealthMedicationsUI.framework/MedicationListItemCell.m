@interface MedicationListItemCell
- (UILabel)primaryLabel;
- (UIStackView)itemsStackView;
- (UIStackView)medicationDetailStackView;
- (UIStackView)metaScheduleStackView;
- (UIStackView)scheduleStackView;
- (_TtC19HealthMedicationsUI22MedicationListItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI22MedicationListItemCell)initWithFrame:(CGRect)a3;
- (_TtC27HealthMedicationsExperience14MedicationView)pillImageView;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setItemsStackView:(id)a3;
- (void)setMedicationDetailStackView:(id)a3;
- (void)setMetaScheduleStackView:(id)a3;
- (void)setPillImageView:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setScheduleStackView:(id)a3;
@end

@implementation MedicationListItemCell

- (UILabel)primaryLabel
{
  v2 = self;
  id v3 = sub_1C1FCE464();

  return (UILabel *)v3;
}

- (void)setPrimaryLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___primaryLabel);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___primaryLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC27HealthMedicationsExperience14MedicationView)pillImageView
{
  v2 = self;
  id v3 = sub_1C1FCE864();

  return (_TtC27HealthMedicationsExperience14MedicationView *)v3;
}

- (void)setPillImageView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___pillImageView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___pillImageView) = (Class)a3;
  id v3 = a3;
}

- (UIStackView)medicationDetailStackView
{
  v2 = self;
  id v3 = sub_1C1FCE9A0();

  return (UIStackView *)v3;
}

- (void)setMedicationDetailStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___medicationDetailStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___medicationDetailStackView) = (Class)a3;
  id v3 = a3;
}

- (UIStackView)scheduleStackView
{
  v2 = self;
  id v3 = sub_1C1FCEA3C();

  return (UIStackView *)v3;
}

- (void)setScheduleStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___scheduleStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___scheduleStackView) = (Class)a3;
  id v3 = a3;
}

- (UIStackView)metaScheduleStackView
{
  v2 = self;
  id v3 = sub_1C1FCEAD8();

  return (UIStackView *)v3;
}

- (void)setMetaScheduleStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___metaScheduleStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___metaScheduleStackView) = (Class)a3;
  id v3 = a3;
}

- (UIStackView)itemsStackView
{
  v2 = self;
  id v3 = sub_1C1FCEC40();

  return (UIStackView *)v3;
}

- (void)setItemsStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___itemsStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___itemsStackView) = (Class)a3;
  id v3 = a3;
}

- (_TtC19HealthMedicationsUI22MedicationListItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI22MedicationListItemCell *)sub_1C1FCEEC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI22MedicationListItemCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI22MedicationListItemCell *)sub_1C1FCF1D8(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C1FD025C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___disclosureIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___pillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___medicationDetailStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___scheduleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___metaScheduleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___itemsStackView));
  id v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell_logger;
  uint64_t v4 = sub_1C21497F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___minHeightConstraint);
}

@end