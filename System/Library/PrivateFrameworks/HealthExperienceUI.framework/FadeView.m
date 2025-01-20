@interface FadeView
+ (Class)layerClass;
- (_TtC18HealthExperienceUIP33_6AFCBB489F4B745EBBFAE39AEAF00FBF8FadeView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_6AFCBB489F4B745EBBFAE39AEAF00FBF8FadeView)initWithFrame:(CGRect)a3;
@end

@implementation FadeView

- (_TtC18HealthExperienceUIP33_6AFCBB489F4B745EBBFAE39AEAF00FBF8FadeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FadeView();
  return -[FadeView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

+ (Class)layerClass
{
  sub_1AD2147D4(0, &qword_1EB73C110);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18HealthExperienceUIP33_6AFCBB489F4B745EBBFAE39AEAF00FBF8FadeView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FadeView();
  return [(FadeView *)&v5 initWithCoder:a3];
}

@end