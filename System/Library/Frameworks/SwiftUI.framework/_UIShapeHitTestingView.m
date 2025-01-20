@interface _UIShapeHitTestingView
- (_TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UIShapeHitTestingView

- (_TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 6;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[_UIGraphicsView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v7 = v14.receiver;
  id v8 = a4;
  id v9 = -[_UIShapeHitTestingView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }

  char v10 = v7[OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path + 32];
  long long v11 = *(_OWORD *)&v7[OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path + 16];
  v15[0] = *(_OWORD *)&v7[OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path];
  v15[1] = v11;
  char v16 = v10;
  outlined init with take of Path.Storage((uint64_t)v15, (uint64_t)v17);
  outlined retain of Path.Storage((uint64_t)v17, (void (*)(void, void, void, void, void))outlined copy of Path.Storage);
  Swift::Bool v12 = Path.contains(_:eoFill:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), 0);
  outlined retain of Path.Storage((uint64_t)v15, (void (*)(void, void, void, void, void))outlined consume of Path.Storage);

  if (!v12)
  {
LABEL_5:

    v7 = 0;
  }

  return v7;
}

- (_TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_A34643117F00277B93DEBAB70EC0697122_UIShapeHitTestingView_path;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 6;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(_UIGraphicsView *)&v8 initWithCoder:a3];
}

@end