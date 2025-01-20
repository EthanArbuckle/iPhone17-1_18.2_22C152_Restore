@interface DOCBackgroundColorView
- (_TtC14RecentsAvocado22DOCBackgroundColorView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado22DOCBackgroundColorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DOCBackgroundColorView

- (_TtC14RecentsAvocado22DOCBackgroundColorView)initWithFrame:(CGRect)a3
{
  return (_TtC14RecentsAvocado22DOCBackgroundColorView *)sub_1004B887C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14RecentsAvocado22DOCBackgroundColorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC14RecentsAvocado22DOCBackgroundColorView_backgroundLayer;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado22DOCBackgroundColorView_layerBackgroundColor) = 0;

  result = (_TtC14RecentsAvocado22DOCBackgroundColorView *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004B8A7C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCBackgroundColorView_backgroundLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado22DOCBackgroundColorView_layerBackgroundColor);
}

@end