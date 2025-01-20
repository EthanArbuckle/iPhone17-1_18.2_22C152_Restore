@interface UploadNewDataCell
- (_TtC15HealthRecordsUI17UploadNewDataCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI17UploadNewDataCell)initWithFrame:(CGRect)a3;
@end

@implementation UploadNewDataCell

- (_TtC15HealthRecordsUI17UploadNewDataCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell____lazy_storage___button) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UploadNewDataCell();
  v8 = -[UploadNewDataCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1C24B3270();

  return v8;
}

- (_TtC15HealthRecordsUI17UploadNewDataCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell____lazy_storage___button) = 0;
  id v5 = a3;

  result = (_TtC15HealthRecordsUI17UploadNewDataCell *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C24B45F0((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell_item, (uint64_t (*)(void))sub_1C2253E44);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell____lazy_storage___button);
}

@end