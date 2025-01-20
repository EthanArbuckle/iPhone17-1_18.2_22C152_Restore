@interface GradientView
+ (Class)layerClass;
- (_TtC22SubscribePageExtension12GradientView)init;
- (_TtC22SubscribePageExtension12GradientView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

- (_TtC22SubscribePageExtension12GradientView)init
{
  return (_TtC22SubscribePageExtension12GradientView *)sub_10003B78C();
}

- (_TtC22SubscribePageExtension12GradientView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12GradientView_colors) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12GradientView_kind) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension12GradientView *)sub_100768A40();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_10001A860(0, &qword_100934438);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC22SubscribePageExtension12GradientView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension12GradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end