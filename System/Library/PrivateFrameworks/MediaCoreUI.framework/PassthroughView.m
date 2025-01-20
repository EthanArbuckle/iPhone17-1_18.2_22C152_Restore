@interface PassthroughView
- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView)initWithCoder:(id)a3;
- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassthroughView

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PassthroughView();
  return -[PassthroughView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView)initWithCoder:(id)a3
{
  result = (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC15PassthroughView *)sub_255C81248();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_255C533FC((uint64_t)a4, x, y);

  return v10;
}

@end