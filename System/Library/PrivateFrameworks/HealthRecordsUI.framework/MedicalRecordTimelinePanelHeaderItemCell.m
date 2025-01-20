@interface MedicalRecordTimelinePanelHeaderItemCell
- (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MedicalRecordTimelinePanelHeaderItemCell

- (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_customConstraints) = (Class)MEMORY[0x1E4FBC860];
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_sectionContext;
  uint64_t v10 = sub_1C254D370();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MedicalRecordTimelinePanelHeaderItemCell();
  v11 = -[MedicalRecordTimelinePanelHeaderItemCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_1C24BF9F0();

  return v11;
}

- (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_customConstraints) = (Class)MEMORY[0x1E4FBC860];
  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_sectionContext;
  uint64_t v7 = sub_1C254D370();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  id v8 = a3;

  result = (_TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C24BFB68(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  sub_1C249D430((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_item, (unint64_t *)&qword_1EA2E5330, (void (*)(uint64_t))sub_1C22270A8);
  sub_1C249D430((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI40MedicalRecordTimelinePanelHeaderItemCell_sectionContext, &qword_1EA2DF2E0, MEMORY[0x1E4F66300]);
}

@end