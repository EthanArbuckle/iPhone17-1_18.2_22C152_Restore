@interface HeaderView
- (UILabel)label;
- (_TtC26GameCenterMessageExtension10HeaderView)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension10HeaderView)initWithFrame:(CGRect)a3;
- (void)setLabel:(id)a3;
@end

@implementation HeaderView

- (UILabel)label
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setLabel:(id)a3
{
}

- (_TtC26GameCenterMessageExtension10HeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HeaderView();
  return -[HeaderView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26GameCenterMessageExtension10HeaderView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HeaderView();
  return [(HeaderView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end