@interface TopAlignedIconListCell
- (_TtC15HealthRecordsUI22TopAlignedIconListCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI22TopAlignedIconListCell)initWithFrame:(CGRect)a3;
@end

@implementation TopAlignedIconListCell

- (_TtC15HealthRecordsUI22TopAlignedIconListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_listContentView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TopAlignedIconListCell();
  return -[TopAlignedIconListCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI22TopAlignedIconListCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_listContentView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TopAlignedIconListCell();
  return [(TopAlignedIconListCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1C2227100((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_iconView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI22TopAlignedIconListCell_listContentView);
}

@end