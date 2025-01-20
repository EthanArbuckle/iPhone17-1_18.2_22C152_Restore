@interface DOCBackgroundColorView
- (_TtC11SaveToFiles22DOCBackgroundColorView)initWithCoder:(id)a3;
- (_TtC11SaveToFiles22DOCBackgroundColorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DOCBackgroundColorView

- (_TtC11SaveToFiles22DOCBackgroundColorView)initWithFrame:(CGRect)a3
{
  return (_TtC11SaveToFiles22DOCBackgroundColorView *)sub_10020D624(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11SaveToFiles22DOCBackgroundColorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11SaveToFiles22DOCBackgroundColorView_backgroundLayer;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles22DOCBackgroundColorView_layerBackgroundColor) = 0;

  result = (_TtC11SaveToFiles22DOCBackgroundColorView *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10020D824();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles22DOCBackgroundColorView_backgroundLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles22DOCBackgroundColorView_layerBackgroundColor);
}

@end