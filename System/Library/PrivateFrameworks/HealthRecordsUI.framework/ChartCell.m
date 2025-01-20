@interface ChartCell
- (_TtC15HealthRecordsUI9ChartCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI9ChartCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)didMoveToSuperview;
@end

@implementation ChartCell

- (_TtC15HealthRecordsUI9ChartCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI9ChartCell_item;
  v9 = (objc_class *)type metadata accessor for ChartCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[ChartCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C2459DC0();

  return v10;
}

- (_TtC15HealthRecordsUI9ChartCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI9ChartCell_item;
  v6 = (objc_class *)type metadata accessor for ChartCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ChartCell *)&v8 initWithCoder:a3];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChartCell();
  id v2 = v3.receiver;
  [(ChartCell *)&v3 awakeFromNib];
  sub_1C2459DC0();
}

- (void)didMoveToSuperview
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ChartCell();
  id v2 = v7.receiver;
  [(ChartCell *)&v7 didMoveToSuperview];
  uint64_t v3 = (uint64_t)v2 + OBJC_IVAR____TtC15HealthRecordsUI9ChartCell_item;
  swift_beginAccess();
  sub_1C2227014(v3, (uint64_t)v5);
  uint64_t v4 = v6;
  sub_1C2227100((uint64_t)v5);
  if (v4) {
    sub_1C245A664();
  }
}

- (void).cxx_destruct
{
}

@end