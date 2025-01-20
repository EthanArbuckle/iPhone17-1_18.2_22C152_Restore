@interface PreviewView
+ (Class)layerClass;
- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D211PreviewView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D211PreviewView)initWithFrame:(CGRect)a3;
@end

@implementation PreviewView

+ (Class)layerClass
{
  sub_18EF3528C(0, &qword_1E923F6D8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D211PreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PreviewView();
  return -[PreviewView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D211PreviewView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewView();
  return [(PreviewView *)&v5 initWithCoder:a3];
}

@end