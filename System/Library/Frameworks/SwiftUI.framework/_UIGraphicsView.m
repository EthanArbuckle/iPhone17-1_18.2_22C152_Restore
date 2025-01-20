@interface _UIGraphicsView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC7SwiftUI15_UIGraphicsView)initWithCoder:(id)a3;
- (_TtC7SwiftUI15_UIGraphicsView)initWithFrame:(CGRect)a3;
@end

@implementation _UIGraphicsView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = [(_UIGraphicsView *)v7 layer];
  unsigned int v9 = objc_msgSend(v8, sel_hasBeenCommitted);

  if (v9)
  {
    v10 = (void *)MEMORY[0x18C115780](v4, v6);
    v13.receiver = v7;
    v13.super_class = (Class)type metadata accessor for _UIGraphicsView();
    BOOL v11 = [(_UIGraphicsView *)&v13 _shouldAnimatePropertyWithKey:v10];

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  return v11;
}

- (_TtC7SwiftUI15_UIGraphicsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _UIGraphicsView();
  return -[_UIGraphicsView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI15_UIGraphicsView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIGraphicsView();
  return [(_UIGraphicsView *)&v5 initWithCoder:a3];
}

@end