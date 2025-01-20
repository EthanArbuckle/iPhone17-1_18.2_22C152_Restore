@interface BackdropView
+ (Class)layerClass;
- (_TtC22AudioMessagesExtension12BackdropView)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension12BackdropView)initWithFrame:(CGRect)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation BackdropView

+ (Class)layerClass
{
  sub_33F38(0, &qword_82C08);

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6 = sub_467B0();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  id v11 = BackdropView.action(for:forKey:)((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();

  return v11;
}

- (_TtC22AudioMessagesExtension12BackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BackdropView();
  return -[BackdropView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22AudioMessagesExtension12BackdropView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackdropView();
  return [(BackdropView *)&v5 initWithCoder:a3];
}

@end