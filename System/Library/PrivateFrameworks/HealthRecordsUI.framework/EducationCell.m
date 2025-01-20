@interface EducationCell
- (_TtC15HealthRecordsUI13EducationCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI13EducationCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation EducationCell

- (_TtC15HealthRecordsUI13EducationCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI13EducationCell *)sub_1C24C7DBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI13EducationCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI13EducationCell *)sub_1C24C7ED8(a3);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EducationCell();
  id v2 = v3.receiver;
  [(EducationCell *)&v3 awakeFromNib];
  sub_1C24C8028();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_arrangedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_educationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_attributionLabel));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_item;
  sub_1C2227100((uint64_t)v3);
}

@end