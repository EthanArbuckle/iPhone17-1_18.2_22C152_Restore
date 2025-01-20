@interface DOCBackgroundColorView
- (_TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DOCBackgroundColorView

- (_TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView)initWithFrame:(CGRect)a3
{
  return (_TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView *)sub_1001916B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView_backgroundLayer;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView_layerBackgroundColor) = 0;

  result = (_TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001918B0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView_backgroundLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCBackgroundColorView_layerBackgroundColor);
}

@end