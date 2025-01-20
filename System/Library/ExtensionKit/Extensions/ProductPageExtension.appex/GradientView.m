@interface GradientView
+ (Class)layerClass;
- (_TtC20ProductPageExtension12GradientView)init;
- (_TtC20ProductPageExtension12GradientView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

- (_TtC20ProductPageExtension12GradientView)init
{
  return (_TtC20ProductPageExtension12GradientView *)sub_1001B9054();
}

- (_TtC20ProductPageExtension12GradientView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension12GradientView_colors) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension12GradientView_kind) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension12GradientView *)sub_10077D120();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_100019840(0, &qword_100954FA0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC20ProductPageExtension12GradientView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension12GradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end