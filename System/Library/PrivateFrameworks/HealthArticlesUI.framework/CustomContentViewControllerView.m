@interface CustomContentViewControllerView
- (_TtC16HealthArticlesUI31CustomContentViewControllerView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI31CustomContentViewControllerView)initWithFrame:(CGRect)a3;
@end

@implementation CustomContentViewControllerView

- (_TtC16HealthArticlesUI31CustomContentViewControllerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CustomContentViewControllerView();
  v7 = -[CustomContentViewControllerView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(CustomContentViewControllerView *)v7 setPreservesSuperviewLayoutMargins:1];
  return v7;
}

- (_TtC16HealthArticlesUI31CustomContentViewControllerView)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customViewController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthArticlesUI31CustomContentViewControllerView_customView);
}

@end