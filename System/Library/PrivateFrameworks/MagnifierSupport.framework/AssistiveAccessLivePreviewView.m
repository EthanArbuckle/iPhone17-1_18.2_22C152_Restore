@interface AssistiveAccessLivePreviewView
+ (Class)layerClass;
- (NSString)accessibilityLabel;
- (_TtC16MagnifierSupport30AssistiveAccessLivePreviewView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport30AssistiveAccessLivePreviewView)initWithFrame:(CGRect)a3;
@end

@implementation AssistiveAccessLivePreviewView

+ (Class)layerClass
{
  sub_2356594B0(0, &qword_268810B38);
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)accessibilityLabel
{
  sub_2356EFDD4();
  if (v2)
  {
    v3 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (_TtC16MagnifierSupport30AssistiveAccessLivePreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[AssistiveAccessLivePreviewView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport30AssistiveAccessLivePreviewView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AssistiveAccessLivePreviewView *)&v5 initWithCoder:a3];
}

@end