@interface DOCBackgroundColorView
- (_TtC18DocumentAppIntents22DOCBackgroundColorView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents22DOCBackgroundColorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DOCBackgroundColorView

- (_TtC18DocumentAppIntents22DOCBackgroundColorView)initWithFrame:(CGRect)a3
{
  return (_TtC18DocumentAppIntents22DOCBackgroundColorView *)sub_1004DC6D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18DocumentAppIntents22DOCBackgroundColorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18DocumentAppIntents22DOCBackgroundColorView_backgroundLayer;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents22DOCBackgroundColorView_layerBackgroundColor) = 0;

  result = (_TtC18DocumentAppIntents22DOCBackgroundColorView *)sub_1004F6110();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004DC8D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents22DOCBackgroundColorView_backgroundLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents22DOCBackgroundColorView_layerBackgroundColor);
}

@end