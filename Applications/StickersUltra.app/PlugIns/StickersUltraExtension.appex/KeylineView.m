@interface KeylineView
- (_TtC22StickersUltraExtension11KeylineView)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension11KeylineView)initWithFrame:(CGRect)a3;
@end

@implementation KeylineView

- (_TtC22StickersUltraExtension11KeylineView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for KeylineView();
  return -[KeylineView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22StickersUltraExtension11KeylineView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for KeylineView();
  return [(KeylineView *)&v5 initWithCoder:a3];
}

@end