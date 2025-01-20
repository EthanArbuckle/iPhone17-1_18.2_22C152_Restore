@interface MultiAppFallbackGradientView
- (_TtC22SubscribePageExtension28MultiAppFallbackGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MultiAppFallbackGradientView

- (_TtC22SubscribePageExtension28MultiAppFallbackGradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC22SubscribePageExtension28MultiAppFallbackGradientView_overlayGradientView;
  id v10 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)[v10 init];

  v16.receiver = v11;
  v16.super_class = ObjectType;
  v12 = -[MultiCornerGradientView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v13 = sub_100729FB0();

  v14 = *(Class *)((char *)&v12->super.super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension28MultiAppFallbackGradientView_overlayGradientView);
  *(Class *)((char *)&v12->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension28MultiAppFallbackGradientView_overlayGradientView) = (Class)v13;

  return v12;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(MultiCornerGradientView *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension28MultiAppFallbackGradientView_overlayGradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28MultiAppFallbackGradientView_overlayGradientView));
}

@end