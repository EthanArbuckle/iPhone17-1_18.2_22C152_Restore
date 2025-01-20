@interface AlphabeticalUDCCell
- (_TtC15HealthRecordsUI19AlphabeticalUDCCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI19AlphabeticalUDCCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)showDetailViewController:(id)a3 viewController:(id)a4;
@end

@implementation AlphabeticalUDCCell

- (_TtC15HealthRecordsUI19AlphabeticalUDCCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI19AlphabeticalUDCCell *)sub_1C225AEE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI19AlphabeticalUDCCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI19AlphabeticalUDCCell *)sub_1C225B0F8(a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1C225B268();
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
    v9 = self;
  }
  sub_1C225C824((uint64_t)v10, a4);

  sub_1C225F904((uint64_t)v10, (uint64_t)&qword_1EBB6EF00, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1C225F830);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell____lazy_storage___store));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell____lazy_storage___button));
  swift_bridgeObjectRelease();
  sub_1C225F904((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell_item, (uint64_t)&qword_1EA2E5330, (uint64_t)&qword_1EA2DED90, MEMORY[0x1E4F66028], (uint64_t (*)(void))sub_1C225EBC8);
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell_sectionContext;
  sub_1C225F194((uint64_t)v3);
}

@end