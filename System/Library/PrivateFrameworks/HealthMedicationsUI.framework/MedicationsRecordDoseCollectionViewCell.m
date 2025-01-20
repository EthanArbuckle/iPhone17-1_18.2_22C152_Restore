@interface MedicationsRecordDoseCollectionViewCell
- (_TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didTapAccessory;
@end

@implementation MedicationsRecordDoseCollectionViewCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C1FBA2D0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didTapAccessory
{
  v2 = self;
  sub_1C1FBCA10();
}

- (_TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_logButton;
  uint64_t v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)sub_1C1FB92D8();
  v10 = (char *)v9
      + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell____lazy_storage___plusAccessory;
  uint64_t v11 = sub_1C2149930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (char *)v9 + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_item;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for MedicationsRecordDoseCollectionViewCell(0);
  return -[MedicationsRecordDoseCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_logButton;
  id v5 = a3;
  uint64_t v6 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4) = (Class)sub_1C1FB92D8();
  v7 = (char *)v6
     + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell____lazy_storage___plusAccessory;
  uint64_t v8 = sub_1C2149930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (char *)v6 + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_item;
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for MedicationsRecordDoseCollectionViewCell(0);
  v10 = [(MedicationsRecordDoseCollectionViewCell *)&v12 initWithCoder:v5];

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_logButton));
  sub_1C1FBE418((uint64_t)self+ OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell____lazy_storage___plusAccessory, &qword_1EBF0C618, MEMORY[0x1E4FB0E68]);
  sub_1C1FBDF30((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_item, (uint64_t (*)(void))sub_1C1F24488);
}

@end