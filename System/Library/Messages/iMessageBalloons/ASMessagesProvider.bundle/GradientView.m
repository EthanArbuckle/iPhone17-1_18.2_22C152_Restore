@interface GradientView
+ (Class)layerClass;
- (_TtC18ASMessagesProvider12GradientView)init;
- (_TtC18ASMessagesProvider12GradientView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

- (_TtC18ASMessagesProvider12GradientView)init
{
  return (_TtC18ASMessagesProvider12GradientView *)sub_4B2654();
}

- (_TtC18ASMessagesProvider12GradientView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider12GradientView_colors) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider12GradientView_kind) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider12GradientView *)sub_77EB20();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_FE2C(0, &qword_96A928);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18ASMessagesProvider12GradientView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider12GradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end