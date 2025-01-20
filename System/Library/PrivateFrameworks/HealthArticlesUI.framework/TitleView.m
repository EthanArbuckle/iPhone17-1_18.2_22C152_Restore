@interface TitleView
- (_TtC16HealthArticlesUI9TitleView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI9TitleView)initWithFrame:(CGRect)a3;
@end

@implementation TitleView

- (_TtC16HealthArticlesUI9TitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TitleView();
  return -[DynamicHeightLabelView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16HealthArticlesUI9TitleView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TitleView();
  return [(DynamicHeightLabelView *)&v5 initWithCoder:a3];
}

@end