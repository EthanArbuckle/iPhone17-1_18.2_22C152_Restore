@interface ShapeView
+ (Class)layerClass;
- (_TtC22AudioMessagesExtension9ShapeView)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension9ShapeView)initWithFrame:(CGRect)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation ShapeView

+ (Class)layerClass
{
  sub_33F38(0, &qword_826B8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6 = sub_467B0();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  id v11 = ShapeView.action(for:forKey:)((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();

  return v11;
}

- (_TtC22AudioMessagesExtension9ShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShapeView();
  return -[ShapeView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22AudioMessagesExtension9ShapeView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShapeView();
  return [(ShapeView *)&v5 initWithCoder:a3];
}

@end