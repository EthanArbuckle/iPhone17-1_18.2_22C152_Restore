@interface MedicalRecordTimelineAccountUpgradeTileItemCell
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)dismissAction;
- (void)reloadDataSource;
- (void)upgradeAction;
@end

@implementation MedicalRecordTimelineAccountUpgradeTileItemCell

- (_TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_hasRegisteredForNotifications) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_tileView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MedicalRecordTimelineAccountUpgradeTileItemCell();
  return -[MedicalRecordTimelineAccountUpgradeTileItemCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_hasRegisteredForNotifications) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_tileView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MedicalRecordTimelineAccountUpgradeTileItemCell();
  return [(MedicalRecordTimelineAccountUpgradeTileItemCell *)&v6 initWithCoder:a3];
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_1C254E690();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  objc_super v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1C230D95C();

  v8 = (void *)sub_1C254E670();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)v8;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C254E690();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254E680();
  v8 = self;
  sub_1C230E3D8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)reloadDataSource
{
  sub_1C230F934(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - v4;
  uint64_t v6 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_1C254F820();
  v7 = self;
  uint64_t v8 = sub_1C254F810();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x1E4FBCFD8];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_1C24D0BCC((uint64_t)v5, (uint64_t)&unk_1EA2E0E28, (uint64_t)v9);

  swift_release();
}

- (void)upgradeAction
{
  v2 = self;
  sub_1C230E79C();
}

- (void)dismissAction
{
  v2 = self;
  sub_1C230ED28();
}

- (void).cxx_destruct
{
  sub_1C230F988((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_item, (unint64_t *)&qword_1EA2E5330, (void (*)(uint64_t))sub_1C22270A8);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI47MedicalRecordTimelineAccountUpgradeTileItemCell_tileView);
}

@end