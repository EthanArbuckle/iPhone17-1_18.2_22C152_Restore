@interface NullView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC13HealthRecords8NullView)initWithCoder:(id)a3;
- (_TtC13HealthRecords8NullView)initWithFrame:(CGRect)a3;
@end

@implementation NullView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC13HealthRecords8NullView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NullView();
  return -[NullView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13HealthRecords8NullView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NullView();
  return [(NullView *)&v5 initWithCoder:a3];
}

@end