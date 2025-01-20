@interface RecentUDCCell
- (_TtC15HealthRecordsUI13RecentUDCCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI13RecentUDCCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)showDetailViewController:(id)a3 viewController:(id)a4;
@end

@implementation RecentUDCCell

- (_TtC15HealthRecordsUI13RecentUDCCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI13RecentUDCCell *)sub_1C24FF434(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI13RecentUDCCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI13RecentUDCCell *)sub_1C24FF850(a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1C24FF9F0();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RecentUDCCell();
  id v2 = v4.receiver;
  [(RecentUDCCell *)&v4 layoutSubviews];
  sub_1C254CDB0();
  id v3 = (id)*MEMORY[0x1E4F39EA8];
  sub_1C254FE70();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C254E690();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254E680();
  v8 = self;
  sub_1C230BE90((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)showDetailViewController:(id)a3 viewController:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    uint64_t v9 = self;
  }
  sub_1C25021D8((uint64_t)v10, a4);

  sub_1C225F904((uint64_t)v10, (uint64_t)&qword_1EBB6EF00, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C225F830);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell____lazy_storage___store));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_valueView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell____lazy_storage___button));
  swift_bridgeObjectRelease();
  sub_1C225F904((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_item, (uint64_t)&qword_1EA2E5330, (uint64_t)&qword_1EA2DED90, MEMORY[0x1E4F66028], (uint64_t (*)(void))sub_1C225EBC8);
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI13RecentUDCCell_sectionContext;
  sub_1C225F194((uint64_t)v3);
}

@end