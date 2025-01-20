@interface SizeReaderUIView
- (CGRect)frame;
- (_TtC8SOSBuddy16SizeReaderUIView)initWithCoder:(id)a3;
- (_TtC8SOSBuddy16SizeReaderUIView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SizeReaderUIView

- (_TtC8SOSBuddy16SizeReaderUIView)initWithCoder:(id)a3
{
  result = (_TtC8SOSBuddy16SizeReaderUIView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SizeReaderUIView();
  [(SizeReaderUIView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SizeReaderUIView();
  id v7 = v8.receiver;
  -[SizeReaderUIView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_10017C658();
}

- (_TtC8SOSBuddy16SizeReaderUIView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC8SOSBuddy16SizeReaderUIView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end