@interface BaseWidgetContentViewController
- (BOOL)_canShowWhileLocked;
- (_TtC9ChronoKit31BaseWidgetContentViewController)initWithCoder:(id)a3;
- (_TtC9ChronoKit31BaseWidgetContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation BaseWidgetContentViewController

- (_TtC9ChronoKit31BaseWidgetContentViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_contentShape) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_isContentTransparent) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_contentShapeMaskLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_contentShapeDebugOverlay) = 0;
  id v4 = a3;

  result = (_TtC9ChronoKit31BaseWidgetContentViewController *)sub_1DA98CBB8();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DA815B10();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9ChronoKit31BaseWidgetContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9ChronoKit31BaseWidgetContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_contentShape));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_contentShapeMaskLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_contentShapeDebugOverlay);
}

@end