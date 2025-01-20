@interface CustomContentView
- (_TtC16HealthArticlesUI17CustomContentView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI17CustomContentView)initWithFrame:(CGRect)a3;
@end

@implementation CustomContentView

- (_TtC16HealthArticlesUI17CustomContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_currentConstraints) = (Class)MEMORY[0x1E4FBC860];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CustomContentView();
  return -[CustomContentView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16HealthArticlesUI17CustomContentView)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI17CustomContentView_customView));
  swift_bridgeObjectRelease();
}

@end