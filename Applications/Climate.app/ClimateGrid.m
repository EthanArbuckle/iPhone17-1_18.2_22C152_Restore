@interface ClimateGrid
- (_TtC7Climate11ClimateGrid)initWithCoder:(id)a3;
- (_TtC7Climate11ClimateGrid)initWithFrame:(CGRect)a3;
@end

@implementation ClimateGrid

- (_TtC7Climate11ClimateGrid)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate11ClimateGrid_grid) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate11ClimateGrid_source) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ClimateGrid();
  return -[ClimateGrid initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Climate11ClimateGrid)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate11ClimateGrid_grid) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate11ClimateGrid_source) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateGrid();
  return [(ClimateGrid *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate11ClimateGrid_source);
}

@end