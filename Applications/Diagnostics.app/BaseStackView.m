@interface BaseStackView
- (_TtC11Diagnostics13BaseStackView)initWithCoder:(id)a3;
- (_TtC11Diagnostics13BaseStackView)initWithFrame:(CGRect)a3;
@end

@implementation BaseStackView

- (_TtC11Diagnostics13BaseStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BaseStackView();
  return -[BaseStackView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11Diagnostics13BaseStackView)initWithCoder:(id)a3
{
  result = (_TtC11Diagnostics13BaseStackView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end