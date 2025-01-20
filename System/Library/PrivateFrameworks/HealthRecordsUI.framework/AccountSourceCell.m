@interface AccountSourceCell
- (_TtC15HealthRecordsUI17AccountSourceCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI17AccountSourceCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation AccountSourceCell

- (_TtC15HealthRecordsUI17AccountSourceCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI17AccountSourceCell *)sub_1C24E9B84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI17AccountSourceCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C24EB504();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1C24EAD40();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___logoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___webLinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___stackView));
  sub_1C24EB420((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell_accountURL, (unint64_t *)&qword_1EA2DF038, MEMORY[0x1E4F276F0]);
  sub_1C24EB420((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell_item, (unint64_t *)&qword_1EA2E5330, (void (*)(uint64_t))sub_1C22270A8);
}

@end