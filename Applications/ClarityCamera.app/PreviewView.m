@interface PreviewView
+ (Class)layerClass;
- (_TtC13ClarityCamera11PreviewView)initWithCoder:(id)a3;
- (_TtC13ClarityCamera11PreviewView)initWithFrame:(CGRect)a3;
@end

@implementation PreviewView

+ (Class)layerClass
{
  sub_10000DB64(0, &qword_100031AF8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC13ClarityCamera11PreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PreviewView();
  return -[PreviewView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC13ClarityCamera11PreviewView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewView();
  return [(PreviewView *)&v5 initWithCoder:a3];
}

@end