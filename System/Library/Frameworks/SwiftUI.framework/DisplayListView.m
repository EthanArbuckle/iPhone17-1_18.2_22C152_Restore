@interface DisplayListView
- (_TtC7SwiftUI15DisplayListView)initWithCoder:(id)a3;
- (_TtC7SwiftUI15DisplayListView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation DisplayListView

- (_TtC7SwiftUI15DisplayListView)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUI15DisplayListView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v6 = self;
  v3 = UIGraphicsGetCurrentContext();
  if (v3)
  {
    v4 = v3;
    double v5 = MEMORY[0x1F4188790](v3);
    MEMORY[0x18C10EBF0](&v7, v5);
    static GraphicsContext.renderingTo(cgContext:environment:deviceScale:content:)();

    swift_release();
    swift_release();
  }
  else
  {
    static Log.internalWarning(_:)();
  }
}

- (_TtC7SwiftUI15DisplayListView)initWithFrame:(CGRect)a3
{
  result = (_TtC7SwiftUI15DisplayListView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end