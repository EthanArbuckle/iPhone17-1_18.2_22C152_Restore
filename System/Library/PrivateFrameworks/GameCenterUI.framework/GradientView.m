@interface GradientView
+ (Class)layerClass;
- (_TtC12GameCenterUI12GradientView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI12GradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GradientView

+ (Class)layerClass
{
  sub_1AF587780();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF5877CC();
}

- (_TtC12GameCenterUI12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI12GradientView *)sub_1AF587AE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI12GradientView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI12GradientView *)sub_1AF587B68(a3);
}

@end