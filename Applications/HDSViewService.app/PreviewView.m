@interface PreviewView
+ (Class)layerClass;
- (_TtC14HDSViewServiceP33_F66C8FD91EA205C147B349AE8926BCFD11PreviewView)initWithCoder:(id)a3;
- (_TtC14HDSViewServiceP33_F66C8FD91EA205C147B349AE8926BCFD11PreviewView)initWithFrame:(CGRect)a3;
@end

@implementation PreviewView

+ (Class)layerClass
{
  sub_10003DD8C(0, (unint64_t *)&unk_1000F0100);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC14HDSViewServiceP33_F66C8FD91EA205C147B349AE8926BCFD11PreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PreviewView();
  return -[PreviewView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC14HDSViewServiceP33_F66C8FD91EA205C147B349AE8926BCFD11PreviewView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewView();
  return [(PreviewView *)&v5 initWithCoder:a3];
}

@end