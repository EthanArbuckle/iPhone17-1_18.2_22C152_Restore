@interface AMWavePulsingView
- (_TtC22AudioMessagesExtension17AMWavePulsingView)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension17AMWavePulsingView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation AMWavePulsingView

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = self;
  v9 = self;
  id v11 = objc_msgSend(v8, "bezierPathWithOvalInRect:", x, y, width, height);
  v10 = *(Class *)((char *)&v9->super.super.super.isa
                 + OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_fillColor);
  if (v10)
  {
    [v10 setFill];
    [v11 fill];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC22AudioMessagesExtension17AMWavePulsingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_35748();
}

- (_TtC22AudioMessagesExtension17AMWavePulsingView)initWithFrame:(CGRect)a3
{
  result = (_TtC22AudioMessagesExtension17AMWavePulsingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_fillColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_parentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleWidthAnchor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22AudioMessagesExtension17AMWavePulsingView_waveCircleHeightAnchor);
}

@end